-- Total number of journeys
SELECT
  SUM(daily_journeys) AS total_journeys
FROM
  tfl.rods;

-- Journeys by time period
SELECT
  time_period,
  SUM(daily_journeys) AS total_journeys
FROM
  tfl.rods
GROUP BY
  time_period
ORDER BY
  total_journeys DESC;
