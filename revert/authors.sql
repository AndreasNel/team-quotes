-- Revert team-quotes:authors from pg

BEGIN;

drop table api.authors;

COMMIT;
