import { defineConfig} from "drizzle-kit";

export default defineConfig({
    dialect: "postgresql",
    schema: "./src/lib/db/schema.ts",
    out: "./supabase/migrations",
    dbCredentials: {
        url: "postgresql://postgres:vpjx0ruXXaY1Qnyi@db.fnxncykdibnppljobzuv.supabase.co:5432/postgres"
    },
});