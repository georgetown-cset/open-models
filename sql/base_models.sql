with leaderboard_counts as (
SELECT
  base_model,
  COUNT(id) as times_on_leaderboard
FROM
  huggingface_backups.leaderboard_20240916
WHERE
  base_model != "Removed"
GROUP BY
  base_model
)

SELECT
  base_model,
  times_on_leaderboard,
  downloads,
  likes
FROM
  leaderboard_counts
INNER JOIN
  huggingface_backups.raw_model_20240916
ON
  base_model = id
ORDER BY
  times_on_leaderboard DESC