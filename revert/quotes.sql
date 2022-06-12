-- Revert team-quotes:quotes from pg

BEGIN;

drop table quotes;

COMMIT;
