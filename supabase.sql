-- ============================================================================
-- Rate6 — script à coller dans Supabase → SQL Editor → Run
-- ============================================================================

-- 1) Table des votes : 1 vote par (visiteur, mission), note de 0,5 à 5 par pas de 0,5
create table if not exists public.votes (
  visitor_id text not null check (char_length(visitor_id) between 8 and 64),
  mission_id text not null check (char_length(mission_id) between 1 and 64),
  rating     numeric(2,1) not null
             check (rating >= 0.5 and rating <= 5 and (rating * 2) = floor(rating * 2)),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (visitor_id, mission_id)
);

create index if not exists votes_mission_idx on public.votes (mission_id);

-- 2) Mise à jour automatique de updated_at
create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists votes_set_updated_at on public.votes;
create trigger votes_set_updated_at
  before update on public.votes
  for each row execute function public.set_updated_at();

-- 3) Row Level Security : lecture / insertion / modification ouvertes (pas de compte)
alter table public.votes enable row level security;

drop policy if exists "votes_select_all" on public.votes;
create policy "votes_select_all" on public.votes
  for select to anon, authenticated using (true);

drop policy if exists "votes_insert_all" on public.votes;
create policy "votes_insert_all" on public.votes
  for insert to anon, authenticated with check (true);

drop policy if exists "votes_update_all" on public.votes;
create policy "votes_update_all" on public.votes
  for update to anon, authenticated using (true) with check (true);

-- 4) Vue d'agrégats (compteur + somme + moyenne par mission), lue par le site
create or replace view public.mission_stats as
  select
    mission_id,
    count(*)::int                    as votes_count,
    coalesce(sum(rating), 0)::float8 as sum_rating,
    round(avg(rating), 2)::float8    as avg_rating
  from public.votes
  group by mission_id;

grant select on public.mission_stats to anon, authenticated;

-- 5) Realtime sur la table votes
--    (replica identity full = les événements UPDATE/DELETE contiennent l'ancienne note,
--     ce qui permet au site de mettre à jour les moyennes sans tout recharger)
alter table public.votes replica identity full;

do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'votes'
  ) then
    alter publication supabase_realtime add table public.votes;
  end if;
end $$;
