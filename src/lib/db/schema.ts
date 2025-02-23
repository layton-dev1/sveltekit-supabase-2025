import { pgTable, text, uuid } from "drizzle-orm/pg-core"

export const profileTable = pgTable("profile", {
    id: uuid("id").primaryKey(),
    first_name: text("first_name").notNull(),
    last_name: text("last_name").notNull(),
    email: text("email").notNull(),
})