-- PostgreSQL bazaviy sxema

create table roles (
  id serial primary key,
  code varchar(50) unique not null,
  name varchar(100) not null
);

create table users (
  id bigserial primary key,
  full_name varchar(255) not null,
  phone varchar(30),
  email varchar(255) unique,
  password_hash text not null,
  photo_url text,
  is_active boolean default true,
  dark_mode boolean default false,
  created_at timestamptz default now()
);

create table user_roles (
  user_id bigint references users(id) on delete cascade,
  role_id int references roles(id) on delete cascade,
  primary key (user_id, role_id)
);

create table wards (
  id bigserial primary key,
  ward_number varchar(20) unique not null,
  department varchar(100)
);

create table beds (
  id bigserial primary key,
  ward_id bigint references wards(id) on delete cascade,
  bed_number varchar(20) not null,
  is_active boolean default true,
  unique (ward_id, bed_number)
);

create table patients (
  id bigserial primary key,
  clinic_patient_id varchar(50) unique not null,
  full_name varchar(255) not null,
  birth_date date,
  gender varchar(20),
  phone varchar(30),
  created_at timestamptz default now()
);

create table encounters (
  id bigserial primary key,
  patient_id bigint references patients(id),
  bed_id bigint references beds(id),
  admitted_at timestamptz not null,
  discharged_at timestamptz,
  diagnosis text,
  attending_doctor_id bigint references users(id)
);

create table products (
  id bigserial primary key,
  sku varchar(100) unique,
  name varchar(255) not null,
  category varchar(50) not null check (category in ('DORI','REAGENT','MEDTEXNIKA','MATERIAL')),
  unit varchar(20) not null,
  min_stock numeric(14,3) default 0
);

create table inventory_batches (
  id bigserial primary key,
  product_id bigint references products(id),
  batch_no varchar(100),
  quantity numeric(14,3) not null,
  unit_price numeric(14,2) not null,
  expires_at date,
  supplier_name varchar(255),
  created_at timestamptz default now()
);

create table consumption_logs (
  id bigserial primary key,
  encounter_id bigint references encounters(id),
  product_id bigint references products(id),
  batch_id bigint references inventory_batches(id),
  quantity numeric(14,3) not null,
  note text,
  entered_by bigint references users(id),
  entered_at timestamptz default now()
);

create table notifications (
  id bigserial primary key,
  user_id bigint references users(id) on delete cascade,
  type varchar(50) not null,
  title varchar(255) not null,
  body text,
  is_read boolean default false,
  created_at timestamptz default now()
);

create table waste_tasks (
  id bigserial primary key,
  consumption_log_id bigint references consumption_logs(id) on delete cascade,
  assigned_to bigint references users(id),
  status varchar(20) default 'PENDING' check (status in ('PENDING','DONE')),
  created_at timestamptz default now(),
  completed_at timestamptz
);

create table price_change_logs (
  id bigserial primary key,
  product_id bigint references products(id),
  previous_price numeric(14,2) not null,
  new_price numeric(14,2) not null,
  reason text,
  changed_by bigint references users(id),
  approved_by bigint references users(id),
  changed_at timestamptz default now()
);
