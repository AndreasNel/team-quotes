-- Revert team-quotes:api-schema from pg

BEGIN;

    drop schema api;
    drop role web_anon;

COMMIT;
