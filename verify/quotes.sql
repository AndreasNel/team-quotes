-- Verify team-quotes:quotes on pg

BEGIN;

  select id, author_id, text, created_at from api.quotes;

  do $$
  begin
    if not exists (
      select 1 from information_schema.table_privileges
      where grantee='web_anon' and table_name='quotes' and privilege_type='DELETE'
    ) then
      raise exception 'role web_anon does not have delete on api.quotes';
    end if;
    if not (
      select count(*) from information_schema.role_column_grants
      where grantee='web_anon' and table_name='quotes' and column_name in ('author_id', 'text', 'created_at') and privilege_type='UPDATE'
    ) = 3 then
      raise exception 'role web_anon does not have update (author_id, text, created_at) on api.authors';
    end if;
    if not (
      select count(*) from information_schema.role_column_grants
      where grantee='web_anon' and table_name='quotes' and column_name in ('author_id', 'text', 'created_at') and privilege_type='INSERT'
    ) = 3 then
      raise exception 'role web_anon does not have insert (author_id, text, created_at) on api.authors';
    end if;
  end;
  $$;
ROLLBACK;
