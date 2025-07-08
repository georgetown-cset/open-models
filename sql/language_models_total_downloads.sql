WITH language_models AS (
SELECT DISTINCT
  core_model.id
FROM
  huggingface.core_model
LEFT JOIN UNNEST
  (tags) AS tag
WHERE
  tag.id = "text-generation"
OR
  tag.id = "text2text-generation"
)

SELECT
  id,
  SUM(downloads) as total_downloads
FROM
  language_models
INNER JOIN
  huggingface.usage
  USING (id)
GROUP BY
  id
ORDER BY
  total_downloads DESC