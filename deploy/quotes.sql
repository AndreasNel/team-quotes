-- Deploy team-quotes:quotes to pg
-- requires: authors

BEGIN;

  create table api.quotes (
    id serial primary key,
    author_id integer not null references api.authors(id),
    text text not null,
    created_at timestamptz not null default now()
  );

  grant select on api.quotes to web_anon;
  grant update (author_id, text, created_at) on api.quotes to web_anon;
  grant insert (author_id, text, created_at) on api.quotes to web_anon;
  grant delete on api.quotes to web_anon;

COMMIT;
