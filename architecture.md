monorepo-root/
├── apps/
│   ├── web/                          # Next.js frontend
│   │   ├── app/                      # App Router pages (Next.js 13+)
│   │   ├── components/               # Reusable UI components
│   │   ├── hooks/                    # Custom React hooks (e.g. useUser, useJob)
│   │   ├── services/                 # Interfaces to Supabase and Solana
│   │   ├── context/                  # React context providers for app-wide state
│   │   ├── lib/                      # Utility functions
│   │   ├── types/                    # TypeScript types/interfaces
│   │   ├── styles/                   # CSS/Tailwind
│   │   └── .env.local                # Frontend environment variables
│   └── ...
├── packages/
│   ├── anchor-program/              # Anchor smart contract
│   │   ├── programs/
│   │   │   └── marketplace/
│   │   │       ├── src/lib.rs       # Main Anchor contract
│   │   │       └── Cargo.toml
│   │   └── Anchor.toml
│   └── shared/                      # Shared types/constants (TS)
├── supabase/
│   ├── migrations/                  # SQL migrations for tables, policies
│   ├── functions/                   # Edge functions (optional)
│   └── supabase.ts                  # Supabase client instance
├── scripts/                         # Deployment scripts
├── .gitignore
├── package.json
├── turbo.json                      # TurboRepo monorepo config
└── README.md

