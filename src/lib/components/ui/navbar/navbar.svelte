<script lang="ts">
    import * as Menubar from "$lib/components/ui/menubar";
    import Button from "$lib/components/ui/button/button.svelte";

    const { data } = $props();
    const { userProfile } = data;
</script>

<nav class="navbar">
    <Menubar.Root>
        <Menubar.Menu>
            <Menubar.Trigger>File</Menubar.Trigger>
            <Menubar.Content>
            <Menubar.Item>
                New Tab
                <Menubar.Shortcut>⌘T</Menubar.Shortcut>
            </Menubar.Item>
            <Menubar.Item>New Window</Menubar.Item>
            <Menubar.Separator />
            <Menubar.Item>Share</Menubar.Item>
            <Menubar.Separator />
            <Menubar.Item>Print</Menubar.Item>
            </Menubar.Content>
        </Menubar.Menu>
    </Menubar.Root>

    {#if userProfile}
        <Button href="/auth/logout">Logout</Button>
    {:else}
        <Button href="/auth/login">Login</Button>
    {/if}
</nav>

<style>
    .navbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 1rem;
        background: #f8f9fa;
        border-bottom: 1px solid #ddd;
    }
</style>