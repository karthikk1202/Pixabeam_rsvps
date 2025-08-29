import Link from 'next/link';

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body style={{ fontFamily: 'Inter, system-ui', margin: 24 }}>
        <header style={{ marginBottom: 24, display: 'flex', gap: 16, alignItems: 'center' }}>
          <h1 style={{ margin: 0 }}>PixaBeam Events</h1>
          <Link href="/">Home</Link>
        </header>
        {children}
      </body>
    </html>
  );
}
