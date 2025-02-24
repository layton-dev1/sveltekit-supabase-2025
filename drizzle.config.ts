import { defineConfig} from "drizzle-kit";

if (!process.env.DATABASE_URL) {
    throw new Error("DATABASE_URL is not set in the environment variables.");
  }

export default defineConfig({
    dialect: "postgresql",
    schema: "./src/lib/db/schema.ts",
    out: "./supabase/migrations",
    dbCredentials: {
        url: process.env.DATABASE_URL
    },
});