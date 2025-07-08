-- Note: this is linked to the specific huggingface backup of the month it was run

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
  downloads,
  likes
FROM
  language_models
INNER JOIN
  huggingface_backups.raw_model_20240916
  USING (id)
ORDER BY
  downloads DESC