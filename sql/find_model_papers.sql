-- Note: we will replace llama2 here with each respective model name we are interested in

with get_papers as (
  SELECT DISTINCT
      merged_id,
      COALESCE(title_english, title_foreign) AS title,
      COALESCE(abstract_english, abstract_foreign) AS abstract,
      year
    FROM
      literature.papers
    WHERE
      REGEXP_CONTAINS(COALESCE(title_english, "") || " " || COALESCE(abstract_english, ""), r"(?i)\bllama.?2")
      OR REGEXP_CONTAINS(COALESCE(title_foreign, "") || " " || COALESCE(abstract_foreign, ""), r"(?i)\bllama.?2")
),

affils as (
  SELECT
    merged_id,
    title,
    abstract,
    year,
    org_name,
    country,
    ror_id
  FROM get_papers
  LEFT JOIN
    literature.affiliations
    USING (merged_id)
),

get_ror as (
  SELECT
    merged_id,
    title,
    abstract,
    year as pub_year,
    STRING_AGG(DISTINCT org_name, "; ") as org_names,
    STRING_AGG(DISTINCT affils.country, "; ") as countries,
    STRING_AGG(DISTINCT type, "; ") as org_types
  FROM affils
  LEFT JOIN
    gcp_cset_ror.ror
    ON (ror_id = id)
  LEFT JOIN UNNEST(types) as type
  GROUP BY merged_id, title, abstract, year
),

get_cits as (
  SELECT
    get_papers.merged_id,
    COUNT(distinct references.merged_id) as cit_count
    FROM get_papers
    LEFT JOIN
      literature.references
      ON (get_papers.merged_id = references.ref_id)
    GROUP BY get_papers.merged_id
)

SELECT
    merged_id,
    title,
    abstract,
    pub_year,
    org_names,
    countries,
    org_types,
    cit_count
  FROM get_ror
  LEFT JOIN
    get_cits
    USING (merged_id)