<template>
  <Navbar/>
  <div>
    <Dashboard/>
  </div>

</template>
<script>
  import Navbar from "./components/navbar.vue";
  import Dashboard from "./components/dashboard.vue";
  export default {
    name: 'Staff',
    components: {Navbar, Dashboard},
    data () {
      return {
        message: "Test Message!!!"
      }
    }
  }
</script>
