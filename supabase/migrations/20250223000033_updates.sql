CREATE TABLE "profile" (
	"id" integer PRIMARY KEY NOT NULL,
	"first_name" text NOT NULL,
	"last_name" text NOT NULL,
	"email" text NOT NULL
);

ALTER TABLE "profile" ENABLE ROW LEVEL SECURITY;

CREATE TABLE "projects" (
	"id" integer PRIMARY KEY NOT NULL,
	"name" text,
	"scope" text,
	"client_id" integer,
	"date_started" date,
	"date_sent" date,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL,
	"completed" boolean,
	"invoiced" boolean
);

CREATE TABLE "revisions" (
	"id" integer PRIMARY KEY NOT NULL,
	"project_id" integer,
	"revision_number" float,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL,
	"is_current" boolean
);

CREATE TABLE "clients" (
	"id" integer PRIMARY KEY NOT NULL,
	"name" text,
	"address" text,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL
);

CREATE TABLE "client_contacts" (
	"client_id" integer,
	"id" integer PRIMARY KEY NOT NULL,
	"name" text,
	"email" text,
	"phone_number" text
);

CREATE TABLE "site_specific" (
	"revision_id" integer,
	"id" integer PRIMARY KEY NOT NULL,
	"target_u_factor" float,
	"target_shgc" float,
	"actual_u_factor" float,
	"actual_shgc" float,
	"address" text,
	"vision_area" float,
	"opaque_area" float,
	"project_type" text
);

CREATE TABLE "uncertified_thermal_analysis" (
	"revision_id" integer,
	"id" integer PRIMARY KEY NOT NULL
);

CREATE TABLE "certified_thermal_analysis" (
	"revision_id" integer,
	"id" integer PRIMARY KEY NOT NULL,
	"certification_type" text,
	"certification_date_beginning" date,
	"certification_date_expirery" date,
	"certification_status" text
);

CREATE TABLE "nfrc_analysis" (
	"id" integer PRIMARY KEY NOT NULL,
	"certified_project_id" integer,
	"nfrc_certification_type" text
);

CREATE TABLE "standard_analysis" (
	"id" integer PRIMARY KEY NOT NULL,
	"nfrc_id" integer,
	"results_file" text
);

CREATE TABLE "leaff_analysis" (
	"id" integer PRIMARY KEY NOT NULL,
	"nfrc_id" integer,
	"results_file" text
);

CREATE TABLE "cta_analysis" (
	"id" integer PRIMARY KEY NOT NULL,
	"nfrc_id" integer,
	"results_file" text
);

CREATE TABLE "results" (
	"id" integer PRIMARY KEY NOT NULL,
	"revision_id" integer,
	"window_system_id" integer
);

CREATE TABLE "csa_analysis" (
	"id" integer PRIMARY KEY NOT NULL,
	"certified_project_id" integer
);

CREATE TABLE "window_systems" (
	"id" integer PRIMARY KEY NOT NULL,
	"name" text,
	"manufacturer" text,
	"type" text,
	"description" text,
	"certification_type" boolean,
	"nfrc_configuration" integer,
	"nfrc_u_factor" float,
	"nfrc_shgc" float,
	"nfrc_vt" float,
	"airleakage" float,
	"energyrating" float,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL
);

CREATE TABLE "glazing_systems_list" (
	"index" integer PRIMARY KEY NOT NULL,
	"window_system_id" integer,
	"glazing_system_id" integer
);

CREATE TABLE "glazing_systems" (
	"id" integer PRIMARY KEY NOT NULL,
	"window_id" integer,
	"name" text,
	"overall_thickness" float,
	"number_of_panes" integer,
	"low_e" text,
	"gas_type" text,
	"gas_fill_percentage" float,
	"u_factor" float,
	"shgc" float,
	"vt" float,
	"ci" float,
	"width" float,
	"height" float,
	"cost_per_sqm" float
);

CREATE TABLE "profiles_list" (
	"window_system_id" integer,
	"index" integer PRIMARY KEY NOT NULL,
	"profile_id" integer
);

CREATE TABLE "profiles" (
	"id" integer PRIMARY KEY NOT NULL,
	"type" text,
	"u_factor_frame" float,
	"u_factor_edge" float,
	"isotherm_image" text,
	"thermally_broken" boolean,
	"thermal_break_size" float,
	"ci_frame" float,
	"ci_edge" float,
	"pdf" float,
	"cost_per_m" float
);

CREATE TABLE "profile_materials" (
	"index" integer PRIMARY KEY NOT NULL,
	"profile_id" integer,
	"material_id" integer,
	"part_of_frame" text
);

CREATE TABLE "materials" (
	"id" integer PRIMARY KEY NOT NULL,
	"conductivity" float,
	"emissivity" float,
	"absorptivity" float,
	"name" text,
	"nfrc" boolean
);

ALTER TABLE "revisions" ADD FOREIGN KEY ("project_id") REFERENCES "projects" ("id");

ALTER TABLE "projects" ADD FOREIGN KEY ("client_id") REFERENCES "clients" ("id");

ALTER TABLE "client_contacts" ADD FOREIGN KEY ("client_id") REFERENCES "clients" ("id");

ALTER TABLE "site_specific" ADD FOREIGN KEY ("revision_id") REFERENCES "revisions" ("id");

ALTER TABLE "uncertified_thermal_analysis" ADD FOREIGN KEY ("revision_id") REFERENCES "revisions" ("id");

ALTER TABLE "certified_thermal_analysis" ADD FOREIGN KEY ("revision_id") REFERENCES "revisions" ("id");

ALTER TABLE "nfrc_analysis" ADD FOREIGN KEY ("certified_project_id") REFERENCES "certified_thermal_analysis" ("id");

ALTER TABLE "standard_analysis" ADD FOREIGN KEY ("nfrc_id") REFERENCES "nfrc_analysis" ("id");

ALTER TABLE "leaff_analysis" ADD FOREIGN KEY ("nfrc_id") REFERENCES "nfrc_analysis" ("id");

ALTER TABLE "cta_analysis" ADD FOREIGN KEY ("nfrc_id") REFERENCES "nfrc_analysis" ("id");

ALTER TABLE "results" ADD FOREIGN KEY ("revision_id") REFERENCES "revisions" ("id");

ALTER TABLE "results" ADD FOREIGN KEY ("window_system_id") REFERENCES "window_systems" ("id");

ALTER TABLE "csa_analysis" ADD FOREIGN KEY ("certified_project_id") REFERENCES "certified_thermal_analysis" ("id");

ALTER TABLE "glazing_systems_list" ADD FOREIGN KEY ("window_system_id") REFERENCES "window_systems" ("id");

ALTER TABLE "glazing_systems_list" ADD CONSTRAINT "unique_glazing_system_id" UNIQUE ("glazing_system_id");

ALTER TABLE "glazing_systems" ADD FOREIGN KEY ("id") REFERENCES "glazing_systems_list" ("glazing_system_id");

ALTER TABLE "profiles_list" ADD FOREIGN KEY ("window_system_id") REFERENCES "window_systems" ("id");

ALTER TABLE "profiles_list" ADD FOREIGN KEY ("profile_id") REFERENCES "profiles" ("id");

ALTER TABLE "profile_materials" ADD FOREIGN KEY ("profile_id") REFERENCES "profiles" ("id");

ALTER TABLE "profile_materials" ADD FOREIGN KEY ("material_id") REFERENCES "materials" ("id");

CREATE INDEX "idx_projects_client_id" ON "projects" ("client_id");

CREATE INDEX "idx_revisions_project_id" ON "revisions" ("project_id");

CREATE INDEX "idx_site_specific_revision_id" ON "site_specific" ("revision_id");

CREATE INDEX "idx_results_revision_id" ON "results" ("revision_id");

CREATE INDEX "idx_results_window_system_id" ON "results" ("window_system_id");

CREATE INDEX "idx_glazing_systems_list_glazing_system_id" ON "glazing_systems_list" ("glazing_system_id");

CREATE INDEX "idx_profiles_list_window_system_id" ON "profiles_list" ("window_system_id");

CREATE INDEX "idx_profiles_list_profile_id" ON "profiles_list" ("profile_id");

CREATE INDEX "idx_profile_materials_profile_id" ON "profile_materials" ("profile_id");

CREATE INDEX "idx_profile_materials_material_id" ON "profile_materials" ("material_id");
