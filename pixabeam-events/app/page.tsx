import { supabase } from '../lib/supabase';

export default async function Home() {
  const { data: events, error } = await supabase
    .from('events')
    .select('id, title, city, date, description')
    .gte('date', new Date().toISOString())
    .order('date', { ascending: true });

  if (error) return <pre>Failed to load events: {error.message}</pre>;

  return (
    <main>
      <h2>Upcoming Events</h2>
      <ul style={{ display: 'grid', gap: 12, padding: 0, listStyle: 'none' }}>
        {(events ?? []).map((e) => (
          <li key={e.id} style={{ border: '1px solid #ddd', borderRadius: 12, padding: 16 }}>
            <h3 style={{ margin: 0 }}>{e.title}</h3>
            <div>{new Date(e.date).toLocaleString()} • {e.city}</div>
            <p>{e.description}</p>
            <a href={`/events/${e.id}`}>RSVP</a>
          </li>
        ))}
      </ul>
    </main>
  );
}
