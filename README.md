# Pixabeam_rsvps
# PixaBeam — Events & RSVPs (Supabase + Next.js)

Minimal app for the PixaBeam assignment.

## Tech
- Next.js (App Router)
- Supabase (Postgres + RLS)
- TypeScript

## Database
Tables: users, events, rsvps (status enum: yes/no/maybe).  
- `events.created_by` → `users.id`
- `rsvps.user_id` → `users.id`
- `rsvps.event_id` → `events.id`
- Unique RSVP per (user_id, event_id).

### Schema + seed
- `pixa_schema.sql` — schema only  
- `pixa_seed.sql` — sample users/events/rsvps  
- (optional) `pixa_full.sql`

### ERD & Screenshots
See `./screenshots/` for ERD, table rows, and app screens.

### Vercel Link

