<template>
  <Navbar/>
  <div>
    <Dashboard/>
  </div>
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
