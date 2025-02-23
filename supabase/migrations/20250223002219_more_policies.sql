-- Allow anyone logged in to access the csa_analysis table
CREATE POLICY "csa_analysis_user_access"
  ON "csa_analysis"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the glazing_systems_list table
CREATE POLICY "glazing_systems_list_user_access"
  ON "glazing_systems_list"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the glazing_systems table
CREATE POLICY "glazing_systems_user_access"
  ON "glazing_systems"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the profiles_list table
CREATE POLICY "profiles_list_user_access"
  ON "profiles_list"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the profiles table
CREATE POLICY "profiles_user_access"
  ON "profiles"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the profile_materials table
CREATE POLICY "profile_materials_user_access"
  ON "profile_materials"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Allow anyone logged in to access the materials table
CREATE POLICY "materials_user_access"
  ON "materials"
  FOR ALL
  USING (auth.uid() IS NOT NULL);