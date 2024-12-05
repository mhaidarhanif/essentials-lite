<template>
  <DashboardPage :title="note.title">
    <template #actions>
      <UButton
        :loading="loading"
        @click="saveNote"
        color="neutral"
        variant="soft"
        >Save</UButton
      >
    </template>
    <div>
      <DashboardNoteMedia v-model="note.image" />
      <UContainer class="group mx-auto max-w-5xl py-12">
        <UTextarea
          color="neutral"
          variant="none"
          placeholder="Untitled note"
          size="xl"
          :ui="{ base: 'text-5xl font-bold resize-none' }"
          autoresize
          :rows="1"
          v-model="note.title"
          autofocus
          :autofocusDelay="500"
          class="w-full"
        />
        <div class="h-12" />
        <UTextarea
          v-model="note.content"
          placeholder="Write your note here..."
          color="neutral"
          variant="none"
          :ui="{ base: 'text-xl resize-none' }"
          autoresize
          :rows="1"
          class="w-full"
        />
      </UContainer>
    </div>
  </DashboardPage>
</template>

<script setup lang="ts">
import type { Note, InsertNote } from '@@/types/database'

const route = useRoute()
const { data: notes } = useNuxtData('notes')
const fetchedNote = computed(() =>
  notes.value?.find((note: Note) => note.id === route.params.id),
)

const note = ref<Partial<InsertNote>>({
  title: fetchedNote.value?.title ?? 'Untitled note',
  image: fetchedNote.value?.image ?? '',
  content: fetchedNote.value?.content ?? '',
})
const loading = ref(false)
const saveNote = async () => {
  try {
    await $fetch(`/api/notes/${route.params.id}`, {
      method: 'PATCH',
      body: note.value,
    })
  } catch (error) {
    console.error(error)
  }
}
</script>
