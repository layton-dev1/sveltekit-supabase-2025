<script>
	import '../app.css';
	import { invalidate } from '$app/navigation';
	import { onMount } from 'svelte';

	let { data, children } = $props();

	let { session, supabase } = $derived(data);

	onMount(() => {
		console.log("1")
		const { data } = supabase.auth.onAuthStateChange((_, newSession) => {
			if (newSession?.expires_at !== session?.expires_at) {
				invalidate('supabase:auth');
			}
		});
		console.log("2")
		return () => data.subscription.unsubscribe();
	});
</script>

<div>
	<h2>Hello from Layout</h2>
	{@render children()}
</div>

