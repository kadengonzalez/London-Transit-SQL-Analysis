-- 1. Dataset overview
SELECT
  SUM(daily_journeys) AS total_journeys
FROM
  tfl.rods;

-- 2. Journeys by time period
SELECT
  time_period,
  SUM(daily_journeys) AS total_journeys
FROM
  tfl.rods
GROUP BY
  time_period
ORDER BY
  total_journeys DESC;

-- 3. Journeys by trip purpose
SELECT
  journey_purpose,
  SUM(daily_journeys) AS total_journeys
FROM
  tfl.rods
GROUP BY
  journey_purpose
ORDER BY
  total_journeys DESC;

-- 4. Peak travel zones
SELECT
  origin_zone,
  destination_zone,
  SUM(daily_journeys) AS total_journeys
FROM
  tfl.rods
GROUP BY
  origin_zone, destination_zone
ORDER BY
  total_journeys DESC
LIMIT 10;

-- 5. Commute vs non-commute travel (HAVING)
SELECT
  journey_purpose,
  ROUND(AVG(daily_journeys), 2) AS avg_journeys
FROM
  tfl.rods
GROUP BY
  journey_purpose
HAVING
  AVG(daily_journeys) > 100000;
