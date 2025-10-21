-- Run these SQL statements in Supabase SQL editor to create tables

create table if not exists brands (
  id uuid default gen_random_uuid() primary key,
  name text not null unique,
  created_at timestamptz default now()
);

create table if not exists programs (
  id uuid default gen_random_uuid() primary key,
  programId text,
  brand text,
  typeProgram text,
  description text,
  startDate text,
  endDate text,
  targetNumber numeric,
  targetPercent numeric,
  achievementNumber numeric,
  rewardValue numeric,
  rewardPercent numeric,
  estimatedReward numeric,
  remainingTarget numeric,
  status text,
  paymentStatus text,
  created_at timestamptz default now()
);

-- Seed default brands
insert into brands (name) values ('INFINIX') on conflict do nothing;
insert into brands (name) values ('IPHONE') on conflict do nothing;
insert into brands (name) values ('ITEL') on conflict do nothing;