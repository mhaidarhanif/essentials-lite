<template>
  <UButton
    @click="open"
    :loading="loading"
    :disabled="loading"
    external
    block
    color="neutral"
    size="lg"
    :icon="icon"
    variant="subtle"
  >
    {{ label }}
  </UButton>
</template>

<script setup lang="ts">
const loading = ref(false)
const props = defineProps({
  label: {
    type: String,
    required: true,
  },
  icon: {
    type: String,
    required: true,
  },
  provider: {
    type: String,
    required: true,
  },
})

function open() {
  loading.value = true
  window.location.href = `/api/auth/${props.provider}`
}
</script>
