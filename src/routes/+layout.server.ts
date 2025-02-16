// import type { LayoutServerLoad } from './$types'

// export const load: LayoutServerLoad = async ({ locals: { safeGetSession }, cookies }) => {
//   const { session } = await safeGetSession()
//   return {
//     session,
//     cookies: cookies.getAll(),
//   }
// }
import type { LayoutServerLoad } from './$types'

export const load: LayoutServerLoad = async ({ locals, cookies }) => {
  const { session } = await locals.safeGetSession()
  
  return {
    session,
    cookies: cookies.getAll(),
  }
}