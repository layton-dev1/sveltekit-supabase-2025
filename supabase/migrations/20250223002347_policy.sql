  CREATE POLICY "results_user_access"
  ON "results"
  FOR ALL
  USING (auth.uid() IS NOT NULL);

  CREATE POLICY "window_systems_user_access"
  ON "window_systems"
  FOR ALL
  USING (auth.uid() IS NOT NULL);