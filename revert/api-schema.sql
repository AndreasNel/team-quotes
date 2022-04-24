-- Revert team-quotes:api-schema from pg

BEGIN;

    drop role web_anon;
    drop schema api;

COMMIT;
