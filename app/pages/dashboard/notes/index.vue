<template>
  <DashboardPage title="Notes">
    <template #actions>
      <UButton
        label="New note"
        to="/dashboard/notes/new"
        color="neutral"
        variant="soft"
      />
    </template>
    <div>
      <UContainer class="py-24">
        <div class="grid grid-cols-4 gap-4">
          <DashboardNoteCard
            v-for="note in notes"
            :key="note.id"
            :note="note"
          />
        </div>
      </UContainer>
    </div>
  </DashboardPage>
</template>

<script setup lang="ts">
const { data: notes } = useNuxtData('notes')
</script>
