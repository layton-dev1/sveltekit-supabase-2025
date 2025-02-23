-- Enable Row-Level Security for all tables

-- Enabling RLS for the "profile" table
ALTER TABLE "profile" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "projects" table
ALTER TABLE "projects" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "revisions" table
ALTER TABLE "revisions" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "clients" table
ALTER TABLE "clients" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "client_contacts" table
ALTER TABLE "client_contacts" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "site_specific" table
ALTER TABLE "site_specific" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "uncertified_thermal_analysis" table
ALTER TABLE "uncertified_thermal_analysis" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "certified_thermal_analysis" table
ALTER TABLE "certified_thermal_analysis" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "nfrc_analysis" table
ALTER TABLE "nfrc_analysis" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "standard_analysis" table
ALTER TABLE "standard_analysis" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "leaff_analysis" table
ALTER TABLE "leaff_analysis" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "cta_analysis" table
ALTER TABLE "cta_analysis" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "results" table
ALTER TABLE "results" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "csa_analysis" table
ALTER TABLE "csa_analysis" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "window_systems" table
ALTER TABLE "window_systems" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "glazing_systems_list" table
ALTER TABLE "glazing_systems_list" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "glazing_systems" table
ALTER TABLE "glazing_systems" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "profiles_list" table
ALTER TABLE "profiles_list" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "profiles" table
ALTER TABLE "profiles" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "profile_materials" table
ALTER TABLE "profile_materials" ENABLE ROW LEVEL SECURITY;

-- Enabling RLS for the "materials" table
ALTER TABLE "materials" ENABLE ROW LEVEL SECURITY;
