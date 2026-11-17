-- Shop Phạm Nhật: bổ sung bảng giỏ hàng còn thiếu.
-- Migration chỉ thêm bảng/policy; không DROP hoặc sửa dữ liệu của các bảng hiện có.

create table if not exists public.user_carts (
  user_id uuid primary key references auth.users(id) on delete cascade,
  items jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now(),
  constraint user_carts_items_is_array check (jsonb_typeof(items) = 'array')
);

alter table public.user_carts enable row level security;

-- Dọn policy cùng tên để migration có thể chạy lại an toàn.
drop policy if exists user_carts_select_own on public.user_carts;
drop policy if exists user_carts_insert_own on public.user_carts;
drop policy if exists user_carts_update_own on public.user_carts;
drop policy if exists user_carts_delete_own on public.user_carts;

create policy user_carts_select_own
  on public.user_carts for select to authenticated
  using (user_id = (select auth.uid()));

create policy user_carts_insert_own
  on public.user_carts for insert to authenticated
  with check (user_id = (select auth.uid()));

create policy user_carts_update_own
  on public.user_carts for update to authenticated
  using (user_id = (select auth.uid()))
  with check (user_id = (select auth.uid()));

create policy user_carts_delete_own
  on public.user_carts for delete to authenticated
  using (user_id = (select auth.uid()));

grant select, insert, update, delete on public.user_carts to authenticated;
revoke all on public.user_carts from anon;
