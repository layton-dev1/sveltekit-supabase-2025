import { pgTable, text, uuid } from "drizzle-orm/pg-core"

export const profileTable = pgTable("profile", {
    id: uuid("id").primaryKey(),
    firstName: text("firstName").notNull(),
    lastName: text("lastName").notNull(),
    email: text("email").notNull(),
})