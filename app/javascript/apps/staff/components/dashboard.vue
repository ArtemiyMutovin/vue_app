<template>
  <div class="error">Ошибки {{ errors }}</div>
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
      this.fullnameError = "";
      this.phoneError = "";
      this.emailError = "";
      this.errors = []

      if (this.fullname.length < 5) {
        this.fullnameError = "Full name should have at least 5 characters";
        this.errors.push(this.fullnameError)
      }

      if (!this.phone.match(/^\d+$/)) {
        this.phoneError = "Phone should only contain digits";
        this.errors.push(this.phoneError)
      }

      if (!this.email.match(/^[\w-]+(\.[\w-]+)*@([a-z0-9-]+\.)+[a-z]{2,}$/i)) {
        this.emailError = "Invalid email format";
        this.errors.push(this.emailError)
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
