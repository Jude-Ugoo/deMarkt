# DeMarkt

A decentralized marketplace platform built with Next.js, Supabase, and Solana.

## Project Structure

- `apps/web`: Next.js frontend application
- `packages/anchor-program`: Solana smart contract using Anchor
- `packages/shared`: Shared TypeScript types and utilities
- `supabase`: Database migrations and edge functions

## Getting Started

1. Install dependencies:
```bash
npm install
```

2. Start the development server:
```bash
npm run dev
```

## Development

- Frontend: `cd apps/web && npm run dev`
- Smart Contract: `cd packages/anchor-program && anchor build`

## Environment Setup

1. Create a Supabase project and add credentials to `apps/web/.env.local`
2. Configure Solana wallet and program ID in `apps/web/.env.local` 