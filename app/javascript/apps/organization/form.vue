<template>
  <div>
    <v-card>
      <v-card>
        <div v-if="errors.length > 0" class="error">Errors {{ errors }}</div>
        <form @submit.prevent="submitOrgForm">
          <h3>Форма организации</h3>
          <div>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" v-model="name">
          </div>
          <div>
            <label for="org_type">Organization Type:</label>
            <input type="org_type" id="org_type" name="org_type" v-model="org_type">
          </div>
          <div>
            <label for="inn">INN:</label>
            <input type="inn" id="inn" name="inn" v-model="inn">
          </div>
          <div>
            <label for="ogrn">OGRN:</label>
            <input type="ogrn" id="ogrn" name="ogrn" v-model="ogrn">
          </div>
          <button type="submit">Submit</button>
        </form>
      </v-card>
      <v-card-actions>
        <v-btn color="primary" block @click="dialogOrg">Close</v-btn>
      </v-card-actions>
    </v-card>
  </div>
</template>

<script>
export default {
  name: "userForm",
  data() {
    return {
      dialogOrg: false,
      name: "",
      org_type: "",
      inn: "",
      ogrn: "",
      errors: [],
      organizations: []
    }
  },
  methods: {
    submitOrgForm() {
      this.errors = []

      const organization = {organization: {name: this.name, org_type: this.org_type, inn: this.inn, ogrn: this.ogrn}}

      this.$api.organizations
          .create(organization)
          .then((response) => {
            this.organizations.push(response.data)
          })
          .catch((error) => {
            this.errors.push(error.response.data.errors)
          });
    }
  }
};
</script>
