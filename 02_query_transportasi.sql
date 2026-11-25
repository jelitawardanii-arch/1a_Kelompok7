USE transport_db;

SELECT
    t.trip_id,
    t.started_at,
    r.route_name
FROM trips AS t
JOIN routes AS r
    ON r.route_id = t.route_id
WHERE t.route_id = 12
  AND t.started_at >= '2026-11-01'
ORDER BY t.trip_id;

EXPLAIN
SELECT
    t.trip_id,
    t.started_at,
    r.route_name
FROM trips AS t
JOIN routes AS r
    ON r.route_id = t.route_id
WHERE t.route_id = 12
  AND t.started_at >= '2026-11-01';

EXPLAIN (VERBOSE)
SELECT
    t.trip_id,
    t.started_at,
    r.route_name
FROM trips AS t
JOIN routes AS r
    ON r.route_id = t.route_id
WHERE t.route_id = 12
  AND t.started_at >= '2026-11-01';

EXPLAIN ANALYZE
SELECT
    t.trip_id,
    t.started_at,
    r.route_name
FROM trips AS t
JOIN routes AS r
    ON r.route_id = t.route_id
WHERE t.route_id = 12
  AND t.started_at >= '2026-11-01';

CREATE INDEX IF NOT EXISTS idx_trips_route_started
    ON trips (route_id, started_at);

EXPLAIN ANALYZE
SELECT
    t.trip_id,
    t.started_at,
    r.route_name
FROM trips AS t
JOIN routes AS r
    ON r.route_id = t.route_id
WHERE t.route_id = 12
  AND t.started_at >= '2026-11-01';
