# drone-view

Bare-minimum MySQL project you can view in Adminer.

## Run

```bash
docker compose up -d
```

## Open Adminer

- URL: http://localhost:8080
- System: `MySQL`
- Server: `db`
- Username: `drone`
- Password: `dronepass`
- Database: `drone_view`

After login, open the `drones` table to view seeded sample rows.
