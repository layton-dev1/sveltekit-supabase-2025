import { getOrCreateUserProfile } from "$lib/auth";
import { db } from "$lib/db";
import { profileTable } from "$lib/db/schema";
import { error } from "console";
import { eq } from "drizzle-orm";
import { zfd } from "zod-form-data";

export const load = async ({ locals }: { locals: App.Locals }) => {
    console.log("Calling getOrCreateUserProfile");
    const userProfile = await getOrCreateUserProfile(locals)
    console.log("Profile:", userProfile);
    return {
        userProfile,
    };
};

export const actions = {
    default: async ({request, locals}: any) => {
        const userProfile = await getOrCreateUserProfile(locals)

        if(!userProfile){
            error(401, "You need to be logged in!")
        }

        const schema = zfd.formData({
            first_name: zfd.text(),
            last_name: zfd.text(),
            email: zfd.text(),
        })

        const {data} = schema.safeParse(await request.formData())

        if(!data){
            error(400, "Invalid form data!")
        }

        if(!userProfile){
            error(401, "You need to be logged in!")
        } else {
            await db.update(profileTable).set({
                first_name: data?.first_name,
                last_name: data?.last_name,
                email: data?.email
            }).where(eq(profileTable.id, userProfile.id))
        }

        return { success: true}
    }
}
