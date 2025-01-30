-- file: 20-configure-pg-profile.sql
CREATE EXTENSION dblink;
CREATE EXTENSION pg_stat_statements;
CREATE EXTENSION pg_profile;

ALTER SYSTEM SET shared_preload_libraries = 'pg_stat_statements';
ALTER SYSTEM SET track_activities = on;
ALTER SYSTEM SET track_counts = on;
ALTER SYSTEM SET track_io_timing = on;
ALTER SYSTEM SET track_wal_io_timing = on;
ALTER SYSTEM SET track_functions = 'all';
SELECT PG_RELOAD_CONF();
