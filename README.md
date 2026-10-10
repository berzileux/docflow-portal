# docflow-portal

Multi-tenant document intake and workflow prototype. Clients upload, a team queue processes, results are delivered. Sample data only.

This repo holds clickable concepts for one pattern: an outside party submits documents, an internal team works them through a queue, and the result goes back to the submitter, with each client seeing only their own records. The first concept applies it to a fictional engineering-calculation service.

All names, companies, emails and data in this repo are made up. Nothing here is affiliated with, or describes how any real company operates.

## Concepts

| Concept | Path | Domain |
|---|---|---|
| LoadDesk | `concepts/loaddesk/index.html` | Fictional engineering-calculation service ("Meridian Load Design") and its contractor clients |

## Run it

No build step, no dependencies, no server.

1. Open `concepts/loaddesk/index.html` in a browser.
2. Click **Continue with Google** and pick an account. The picker is simulated.

Fonts load from Google Fonts. Offline, the page falls back to system fonts.

## Sample accounts

Sign-in is restricted to a pre-registered allowlist. Any registered email works.

| Role | Name | Email |
|---|---|---|
| Client | Maria Reyes (Sunbelt Air Co.) | maria@sunbeltair.example |
| Client | Dan Whitfield (Coastal Comfort HVAC) | dan@coastalcomfort.example |
| Design lead | Priya Nair | lead@meridianload.example |
| Designer 1 | Alex Tan | designer1@meridianload.example |
| Designer 2 | Sam Ortiz | designer2@meridianload.example |
| Not registered | any other email, e.g. alex.guest@gmail.com | shows the denial message |

Use **Other account** in the picker to type an email and see the allowlist reject it.

## The two stories

A story bar at the top walks through the flow. It advances on your clicks, not on a timer.

- **Story A, client sends a project.** Sunbelt signs in, starts a project, uploads plans, and the portal checks for missing items before the project is sent.
- **Story B, client gets status.** The client follows the project timeline, a designer asks a question, the client answers, and the story ends. **Replay story** resets everything. **Explore freely** keeps the bar visible while you click around.

The **Demo tools** panel (bottom of the page) switches persona directly: either client, the design lead, or either designer. It stays open as you navigate.

## What is in the prototype

- Client views: dashboard, three-step new-project wizard, project detail with results, timeline and messages.
- Design lead view: intake queue with Source column, assignment, workload, registered-emails admin with a register form.
- Designer view: own queue, unassigned pool with Claim, delivered list.
- Work view: plan files, input table with confidence ratings and confirm checkboxes, request-info, mark-ready, client messages, activity log.
- Human-confirmed inputs gate: **Mark ready** is blocked until every suggested input is confirmed.
- Multi-tenant visibility: clients see only their own projects, staff see all.

## What is not real

- No authentication. The Google button is a simulation.
- No file upload, storage, email or database. State lives in memory and resets on reload.
- No calculation engine. The suggested inputs and confidence ratings are invented sample values, not outputs of any model or standard.
- Tenant isolation here is a filter in client-side code. It is not a security boundary.

## Notes for a real build

These are requirements, not features of this prototype.

- Sign-in: use Google OpenID Connect. Match users on the stable subject identifier, never on email alone. Require `email_verified`. Provide a fallback (for example an emailed one-time link) for users without Google accounts.
- Allowlist: store registered emails server-side, restrict who may add them, and write an audit log of every registration change.
- Tenant isolation: enforce at the database layer (row-level security or equivalent), not only in the application.
- Uploads: validate type and size, scan for malware, store outside the web root, and serve through short-lived signed URLs.
- Any calculated or AI-assisted output needs human review before release. Keep the confirm gate, record who confirmed what, and check professional-liability and licensing implications for the domain.
- Do not send confidential client documents to a free-tier model API. Free tiers may use inputs for training.

## Layout

```
docflow-portal/
  README.md
  concepts/
    loaddesk/
      index.html
```

Each concept is a single self-contained HTML file. Shared logic should be split out only when a second concept makes the common parts clear.

## License

Add a license before publishing. None is included.