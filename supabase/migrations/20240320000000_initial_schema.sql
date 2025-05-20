-- Create profiles table
create table profiles (
  id uuid references auth.users on delete cascade not null primary key,
  email text not null,
  full_name text,
  avatar_url text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Create jobs table
create table jobs (
  id uuid default gen_random_uuid() primary key,
  title text not null,
  description text not null,
  budget decimal not null,
  status text not null default 'open',
  created_by uuid references profiles(id) on delete cascade not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Create applications table
create table applications (
  id uuid default gen_random_uuid() primary key,
  job_id uuid references jobs(id) on delete cascade not null,
  freelancer_id uuid references profiles(id) on delete cascade not null,
  pitch text not null,
  status text not null default 'pending',
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,
  unique(job_id, freelancer_id)
);

-- Enable Row Level Security
alter table profiles enable row level security;
alter table jobs enable row level security;
alter table applications enable row level security;

-- Create policies
create policy "Public profiles are viewable by everyone"
  on profiles for select
  using ( true );

create policy "Users can insert their own profile"
  on profiles for insert
  with check ( auth.uid() = id );

create policy "Users can update their own profile"
  on profiles for update
  using ( auth.uid() = id );

create policy "Jobs are viewable by everyone"
  on jobs for select
  using ( true );

create policy "Authenticated users can create jobs"
  on jobs for insert
  with check ( auth.role() = 'authenticated' );

create policy "Users can update their own jobs"
  on jobs for update
  using ( auth.uid() = created_by );

create policy "Applications are viewable by job creators and applicants"
  on applications for select
  using (
    auth.uid() = freelancer_id or
    auth.uid() in (
      select created_by from jobs where id = applications.job_id
    )
  );

create policy "Authenticated users can create applications"
  on applications for insert
  with check ( auth.role() = 'authenticated' );

create policy "Users can update their own applications"
  on applications for update
  using ( auth.uid() = freelancer_id );

-- Create function to handle user creation
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, email, full_name)
  values (new.id, new.email, new.raw_user_meta_data->>'full_name');
  return new;
end;
$$ language plpgsql security definer;

-- Create trigger for new user creation
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user(); 