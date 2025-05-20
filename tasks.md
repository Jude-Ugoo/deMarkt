✅ MVP Build Plan (Step-by-Step Tasks)

🔧 Phase 1: Project Bootstrapping

1.1 – Initialize Monorepo

Start: No codebase exists.

End: Monorepo structure using Turborepo with apps/web, packages/anchor-program, packages/shared.

Test: Repo structure matches layout, can run dev command in web.

1.2 – Setup Supabase Project

Start: Supabase project not created.

End: New Supabase project created with anon/public keys.

Test: Able to access Supabase Studio, and Supabase credentials are available.

1.3 – Scaffold Anchor Smart Contract

Start: No Anchor program.

End: Basic Anchor program with lib.rs, no logic yet.

Test: anchor build runs with no errors.

1.4 – Scaffold Next.js Frontend (App Router)

Start: apps/web is empty.

End: Create default app/layout.tsx and app/page.tsx with Tailwind CSS.

Test: Visit / and see “Hello World”.

1.5 – Install Shared Tooling

Start: No dependencies installed.

End: Add Tailwind, Solana wallet adapter, Supabase client, dotenv, etc.

Test: Can import & render a Solana wallet connect button without error.

🔐 Phase 2: Auth + User Identity

2.1 – Setup Supabase Auth

Start: Supabase has no auth providers.

End: Enable email/password + magic link.

Test: Able to sign up via Supabase dashboard.

2.2 – Add Supabase Client to Frontend

Start: No client instantiated.

End: supabase.ts file exports a working Supabase client.

Test: Can call supabase.auth.getUser() from a hook.

2.3 – Build Basic Auth Hook

Start: No user context.

End: useUser() hook that returns current session and user info.

Test: When logged in, hook returns email/ID.

2.4 – Create Auth UI

Start: No auth forms in UI.

End: Sign up, login, logout UI added to /login route.

Test: Can create account, login, and logout via buttons.

📦 Phase 3: Job Posting (Off-Chain)

3.1 – Create jobs Table in Supabase

Start: DB has no tables.

End: jobs table with fields: id, title, description, budget, status, created_by.

Test: Insert test row from Supabase UI.

3.2 – Add RLS Policy for Jobs

Start: Public can read/write jobs.

End: Only authenticated users can read/write their own jobs.

Test: Unauthorized fetch returns permission denied.

3.3 – Build Job Post Form

Start: No form exists.

End: Create /post-job page with controlled inputs for title, description, budget.

Test: Typing into form updates state correctly.

3.4 – Submit Job to Supabase

Start: Form does nothing on submit.

End: Submitting form adds new row to jobs table.

Test: Job appears in Supabase table and on confirmation screen.

3.5 – Fetch Jobs and Display

Start: No jobs shown.

End: Create /jobs route that lists all open jobs.

Test: Posted jobs appear correctly in frontend.

💰 Phase 4: Smart Contract – Lock Funds

4.1 – Define initialize_job Instruction

Start: Anchor program has no logic.

End: Add initialize_job that creates a vault PDA and accepts SOL.

Test: Local test passes with funds locked to PDA.

4.2 – Deploy Anchor Program

Start: Only local build exists.

End: Deploy contract to devnet and note program ID.

Test: solana logs shows deployed program is live.

4.3 – Connect Frontend to Program

Start: Frontend doesn’t know program ID.

End: Load Anchor IDL and connect via @project-serum/anchor.

Test: Can call initialize_job with dummy values and see transaction.

4.4 – Lock Funds When Job Is Created

Start: Job stored only in Supabase.

End: On job post, lock SOL in vault PDA + save metadata to Supabase.

Test: Confirm vault holds SOL using solana balance + Supabase row saved.

🧑‍💻 Phase 5: Freelancers Apply

5.1 – Create applications Table in Supabase

Start: No table for applicants.

End: applications table with id, job_id, freelancer_id, pitch, status.

Test: Insert test record via dashboard.

5.2 – Apply to Job from UI

Start: Jobs only display.

End: Add “Apply” button with pitch modal on job detail page.

Test: Application submitted, stored in Supabase.

5.3 – List Applications for Client

Start: No visibility into who applied.

End: On /my-jobs/:id, show list of applicants.

Test: Client sees applicants and pitch text.

🚀 Phase 6: Submit Work & Release Funds

6.1 – Add submit_work Instruction to Anchor

Start: No way for freelancer to submit.

End: Instruction that marks work as done in vault/account metadata.

Test: Local test sets status to “submitted”.

6.2 – Add Submit Work UI

Start: Freelancer cannot submit from frontend.

End: Button to call submit_work once selected for job.

Test: Transaction completes, confirmation shown.

6.3 – Add approve_and_release Instruction

Start: Funds are locked.

End: Client calls instruction to release funds from PDA to freelancer.

Test: Freelancer wallet balance increases.

6.4 – Release Button in UI

Start: Client has no way to release funds.

End: “Approve Work” button on job detail screen.

Test: Calls contract, funds released to freelancer.

✅ Phase 7: Cleanup & Test

7.1 – Test Full Flow: Post → Apply → Submit → Approve

Start: All parts built separately.

End: End-to-end test flow from job post to payout works on devnet.

Test: A full job lifecycle works successfully.

7.2 – Add Success Screens & Minimal UX Polish

Start: Raw UI flow.

End: Add feedback for each major action (posting, applying, releasing).

Test: Every user action has confirmation.


