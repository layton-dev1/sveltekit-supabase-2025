-- Allow anyone logged in to access the profile table
CREATE POLICY "profile_user_access" 
  ON "profile"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the projects table
CREATE POLICY "projects_user_access"
  ON "projects"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the revisions table
CREATE POLICY "revisions_user_access"
  ON "revisions"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the clients table
CREATE POLICY "clients_user_access"
  ON "clients"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the client_contacts table
CREATE POLICY "client_contacts_user_access"
  ON "client_contacts"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the site_specific table
CREATE POLICY "site_specific_user_access"
  ON "site_specific"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the uncertified_thermal_analysis table
CREATE POLICY "uncertified_thermal_analysis_user_access"
  ON "uncertified_thermal_analysis"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the certified_thermal_analysis table
CREATE POLICY "certified_thermal_analysis_user_access"
  ON "certified_thermal_analysis"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the nfrc_analysis table
CREATE POLICY "nfrc_analysis_user_access"
  ON "nfrc_analysis"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the standard_analysis table
CREATE POLICY "standard_analysis_user_access"
  ON "standard_analysis"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the leaff_analysis table
CREATE POLICY "leaff_analysis_user_access"
  ON "leaff_analysis"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the cta_analysis table
CREATE POLICY "cta_analysis_user_access"
  ON "cta_analysis"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

  
