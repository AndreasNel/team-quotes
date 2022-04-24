-- Verify team-quotes:api-schema on pg

BEGIN;

    select pg_catalog.has_schema_privilege('api', 'usage');

    do $$
    begin
        if not exists (select 1 from pg_roles where rolname='web_anon' and not rolcanlogin) then
            raise exception 'Invalid role configuration for "web_anon"';
        end if;

        if not exists (select 1 from information_schema.role_usage_grants where grantee = 'web_anon' and object_schema = 'api' and object_name = 'default' and privilege_type = 'USAGE') then
            raise exception '"web_anon" does not have the correct permissions for "api" schema';
        end if;
    $$ end;

ROLLBACK;
