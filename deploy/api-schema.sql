-- Deploy team-quotes:api-schema to pg

BEGIN;

    create schema api;
    create role web_anon nologin;
    grant usage on schema api to web_anon;

COMMIT;
