<template>
  <li v-for="user in users">
    {{ user.email }}
  </li>
  <div v-if="errors.length > 0" class="error">Errors {{ errors }}</div>
  <form @submit.prevent="submitForm">
    <h3>Создание клиента</h3>
    <div>
      <label for="fullname">Full Name:</label>
      <input type="text" id="fullname" name="fullname" v-model="fullname">
    </div>
    <div>
      <label for="phone">Phone:</label>
      <input type="tel" id="phone" name="phone" v-model="phone">
    </div>
    <div>
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" v-model="email">
    </div>
    <div>
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" v-model="password">
    </div>
    <button type="submit">Submit</button>
  </form>
</template>

<script>
export default {
  name: "Dashboard",
  data() {
    return {
      fullname: "",
      phone: "",
      email: "",
      password: "",
      errors: [],
      users: []
    };
  },
  created() {
    this.$api.users
        .index()
        .then((response) => this.users = response.data)
        .catch((error) => console.log('it is error'))
  },
  methods: {
    submitForm() {
      this.errors = []

      const user = { user: { fullname: this.fullname, email: this.email, phone: this.phone, password: this.password} }

      this.$api.users
          .create(user)
          .then((response) => {
            this.users.push(response.data)
          })
          .catch((error) => {
            this.errors.push(error.response.data.errors)
          })
    }
  }
};
</script>

<style>
.error {
  color: red;
}
</style>
