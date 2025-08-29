import Link from 'next/link';
import { supabase } from '../../../lib/supabase';

// Use a permissive prop type to satisfy Vercel's strict build
export default async function EventPage(props: any) {
  const eventId = props?.params?.id as string;

  const [{ data: event, error: e1 }, { data: rsvps, error: e2 }] = await Promise.all([
    supabase.from('events').select('*').eq('id', eventId).single(),
    supabase
      .from('rsvps')
      .select('status, created_at')
      .eq('event_id', eventId)
      .order('created_at', { ascending: false }),
  ]);

  if (e1) return <pre>Failed to load event: {e1.message}</pre>;
  if (!event) return <div>Event not found.</div>;

  return (
    <main>
      <p><Link href="/">← Back</Link></p>
      <h2>{event.title}</h2>
      <div>{new Date(event.date).toLocaleString()} • {event.city}</div>
      <p>{event.description}</p>

      <form action={`/events/${eventId}/rsvp`} method="post" style={{ marginTop: 16 }}>
        <label>
          Your RSVP:&nbsp;
          <select name="status" required>
            <option value="yes">Yes</option>
            <option value="maybe">Maybe</option>
            <option value="no">No</option>
          </select>
        </label>
        <br /><br />
        <label>
          Your User ID (paste from Supabase → users.id):&nbsp;
          <input name="user_id" placeholder="UUID" required style={{ width: 360 }} />
        </label>
        <input type="hidden" name="event_id" value={eventId} />
        <br /><br />
        <button type="submit">Submit RSVP</button>
      </form>

      <h3 style={{ marginTop: 24 }}>Recent RSVPs</h3>
      {e2 && <pre>Failed to load RSVPs: {e2.message}</pre>}
      <ul>
        {(rsvps ?? []).map((r, i) => (
          <li key={i}>{r.status} — {new Date(r.created_at).toLocaleString()}</li>
        ))}
      </ul>
    </main>
  );
}
