-- Verify team-quotes:api-schema on pg

BEGIN;

    select pg_catalog.has_schema_privilege('api', 'usage');

    do $$
    begin
        if not exists (select 1 from pg_roles where rolname='web_anon' and not rolcanlogin) then
            raise exception 'Invalid role configuration for "web_anon"';
        end if;

        if not pg_catalog.has_schema_privilege('web_anon', 'api', 'USAGE')  then
            raise exception '"web_anon" does not have the correct permissions for "api" schema';
        end if;
    end;
    $$;

ROLLBACK;
