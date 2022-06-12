-- Verify team-quotes:authors on pg

BEGIN;

  select id, name, created_at from api.authors;

  do $$
  begin
    if not exists (
      select 1 from information_schema.role_column_grants
      where grantee='web_anon' and table_name='authors' and column_name='name' and privilege_type='UPDATE'
    ) then
      raise exception 'role web_anon does not have update (name) on api.authors';
    end if;
    if exists (
      select 1 from information_schema.role_column_grants
      where grantee='web_anon' and table_name='authors' and column_name='id' and privilege_type!='SELECT'
    ) then
      raise exception 'role web_anon should not be able to update or insert api.authors (id)';
    end if;
    if not exists(
      select 1 from information_schema.table_privileges
      where grantee='web_anon' and table_name='authors' and privilege_type='DELETE'
    ) then
      raise exception 'role web_anon does not have delete on api.authors';
    end if;
  end;
  $$;

ROLLBACK;
