# team-quotes
A database-first API that you can use to capture quotes from your team's day-to-day conversations.

For this to work, you need an `authenticator` role in your database which can assume the `web_anon` role.
Example:

```sql
create role authenticator noinherit login password 'mysecretpassword';
grant web_anon to authenticator;
```
