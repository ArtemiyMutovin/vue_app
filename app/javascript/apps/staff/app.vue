<template>
  <v-app>
    <v-layout class="rounded rounded-md">
      <v-app-bar color="surface-variant">
        <div>
          <Navbar/>
        </div>
      </v-app-bar>
      <v-main class="d-flex align-center justify-center" style="min-height: 300px;">
        <div>
          <div class="text-center">
            <v-progress-circular
                indeterminate
                color="primary"></v-progress-circular>
          </div>
          <Dashboard/>
        </div>
      </v-main>
    </v-layout>
  </v-app>
</template>
<script>
  import Navbar from "./components/navbar.vue";
  import Dashboard from "./components/dashboard.vue";
  import {defineComponent} from "vue";

  export default defineComponent({
    name: "Staff",
    components: {Navbar, Dashboard}
  })
</script>
