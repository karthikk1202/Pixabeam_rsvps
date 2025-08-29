import { NextRequest, NextResponse } from 'next/server';
import { supabase } from '../../../../lib/supabase';

export async function POST(req: NextRequest, context: { params: { id: string } }) {
  const { id: eventId } = context.params;

  const form = await req.formData();
  const status   = String(form.get('status'));
  const user_id  = String(form.get('user_id'));
  const event_id = String(form.get('event_id'));

  if (!['yes', 'no', 'maybe'].includes(status)) {
    return NextResponse.json({ ok: false, error: 'Invalid status' }, { status: 400 });
  }

  const { error } = await supabase
    .from('rsvps')
    .upsert({ user_id, event_id, status }, { onConflict: 'user_id,event_id' });

  if (error) {
    return NextResponse.json({ ok: false, error: error.message }, { status: 400 });
  }

  // Redirect back to the event page
  return NextResponse.redirect(new URL(`/events/${eventId}`, req.url));
}
