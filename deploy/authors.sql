-- Deploy team-quotes:authors to pg

BEGIN;

create table api.authors (
  id serial primary key,
  name varchar(255) unique not null,
  created_at timestamptz not null default now()
);

grant select on api.authors to web_anon;
grant update (name) on api.authors to web_anon;
grant delete on api.authors to web_anon;

COMMIT;
