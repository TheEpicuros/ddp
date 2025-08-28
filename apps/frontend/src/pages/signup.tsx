import Head from "next/head";
import { useState } from "react";

export default function Signup() {
const [accept, setAccept] = useState(false);
return (
<>
<Head>
<title>Sign up — DDP</title>
<meta name="description" content="Create your member profile and start participating." />
</Head>
<main className="signup">
<div className="card">
<h1 className="title">Create your account</h1>
<label>Display name
<input type="text" placeholder="Alice" />
</label>
<label>Email
<input type="email" placeholder="you@example.com" />
</label>
<label>Location (City, State/Region, Country)
<input type="text" placeholder="Los Angeles, CA, US" />
</label>
<label>Password
<input type="password" placeholder="••••••••" />
</label>
<label className="small">
<input type="checkbox" onChange={e => setAccept(e.target.checked)} /> I accept the terms and conditions
</label>
<button disabled={!accept} aria-disabled={!accept}>Create account</button>
<p className="small" style={{marginTop:'.75rem'}}>Social sign-in coming soon (Google/GitHub).</p>
</div>
</main>
</>
);
}