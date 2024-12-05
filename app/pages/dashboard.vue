<template>
  <main class="flex">
    <DashboardSidebar />
    <NuxtPage />
  </main>
</template>

<script setup lang="ts">
definePageMeta({
  middleware: ['auth'],
})
const nuxtApp = useNuxtApp()
await useFetch('/api/notes', {
  key: 'notes',
  getCachedData(key) {
    return nuxtApp.payload.data[key] || nuxtApp.static.data[key]
  },
})
</script>
