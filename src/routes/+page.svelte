<script lang="ts">
	import { enhance } from '$app/forms';
	import { invalidate } from '$app/navigation';
	import Button from '$lib/components/ui/button/button.svelte';
	import CardContent from '$lib/components/ui/card/card-content.svelte';
	import CardHeader from '$lib/components/ui/card/card-header.svelte';
	import Card from '$lib/components/ui/card/card.svelte';
	import Input from '$lib/components/ui/input/input.svelte';
	import Label from '$lib/components/ui/label/label.svelte';
	import { onMount } from 'svelte';

    const { data } = $props();
    const { userProfile } = data

    let first_name = $state("")
    let last_name = $state("")
    let email = $state("")

    onMount(() => {
        if (userProfile){
            first_name = userProfile.first_name;
            last_name = userProfile.last_name;
            email = userProfile.email;
        }
    })

</script>

{#if data.userProfile}
    <Card>
        <CardHeader>Manage your profile</CardHeader>
        <CardContent>
            <form method="post" use:enhance={({formData}) => {
                formData.set("first_name", first_name)
                formData.set("last_name", last_name)
                formData.set("email", email)
                return ({result}) => {
                    if (result.type === "success") {
                        invalidate("/")
                        alert("UPDATED!")
                    } else {
                        alert("ERROR!")
                    }
                }
            }}>
                <div>
                    <Label>Email</Label>
                    <Input bind:value={email}/>
                </div>
                <div>
                    <Label>First Name</Label>
                    <Input bind:value={first_name}/>
                </div>
                <div>
                    <Label>Last Name</Label>
                    <Input bind:value={last_name}/>
                </div>
                <div>
                    <Button type="submit">Update</Button>
                </div>
            </form>
        </CardContent>
    </Card>
    <Button href="/auth/logout">Logout</Button>
{:else}
    <Button href="/auth/login">Login to the site!</Button>
{/if}