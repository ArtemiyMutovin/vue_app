<template>
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
    <button type="submit">Submit</button>
  </form>
</template>

<script>
export default {
  data() {
    return {
      fullname: "",
      phone: "",
      email: "",
      errors: []
    };
  },
  methods: {
    submitForm() {
      this.errors = []

      if (this.fullname.length < 5) {
        this.errors.push("Full name should have at least 5 characters")
      }

      if (!this.phone.match(/^\d+$/)) {
        this.errors.push("Phone should only contain digits")
      }

      if (!this.email.match(/^[\w-]+(\.[\w-]+)*@([a-z0-9-]+\.)+[a-z]{2,}$/i)) {
        this.errors.push("Invalid email format")
      }
    }
  }
};
</script>

<style>
.error {
  color: red;
}
</style>
