<template>
  <div>
      <v-card>
        <div v-if="created === true" class="success">User successfully created!</div>
        <div v-if="errors.length > 0" class="error">Errors {{ errors }}</div>
        <form @submit.prevent="submitUserForm">
          <h3>Форма клиента</h3>
          <div>
            <label for="fullname">Full Name:</label>
            <input type="text" v-model="user.fullname">
          </div>
          <div>
            <label for="phone">Phone:</label>
            <input type="tel" v-model="user.phone">
          </div>
          <div>
            <label for="email">Email:</label>
            <input type="email" v-model="user.email">
          </div>
          <div>
            <label for="password">Password:</label>
            <input type="password" v-model="user.password">
          </div>
          <v-card
              class="mx-auto"
              max-width="300"
          >
            Organizations:
            <v-list
                :items="organizationsData"
                item-title="name"
            ></v-list>
          </v-card>
          <v-btn
              type="submit"
              color="success"
              block
              @click="dialogUser = false"
          >
            Submit
          </v-btn>
        </form>
      </v-card>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "userForm",
  data() {
    return {
      dialogUser: false,
      errors: [],
      users: [],
      organizationsData: [],
      created: false
    }
  },
  props: {
    user: {
      type: Object,
      default: {}
    },
    organizations: {
      type: Array,
      default: () => [],
    },
  },

  mounted() {
    this.fetchOrganizationsData();
  },

  methods: {
      fetchOrganizationsData() {
        axios.get('/api/organizations')
            .then(response => {
              this.organizationsData = response.data;
            })
            .catch(error => {
              console.error(error);
            });
    },

    submitUserForm() {
      this.errors = []

      const serializedUser =
          { user: {email: this.user.email,
          fullname: this.user.fullname,
          phone: this.user.phone,
          password: this.user.password}}

      if (this.user.id) {

        this.$api.users
            .update(this.user.id, serializedUser)
            .then((response) => {
              const index = this.users.findIndex((u) => u.id === this.user.id)
              if (index !== -1) {
                this.users.splice(index, 1, response.data)
              }
            })
            .catch((error) => {
              this.errors.push(error.response.data.errors)
            })
      } else {
        this.$api.users
            .create(serializedUser)
            .then((response) => {
              this.users.push(response.data)
              this.created = true
            })
            .catch((error) => {
              console.log(error.response.data)
              this.errors.push(error.response.data.errors)
            })
      }
    }
  }
};
</script>

<style>
.success {
  color: green;
}
</style>
