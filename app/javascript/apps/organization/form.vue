<template>
  <div>
    <v-card>
      <v-card>
        <div v-if="createdOrg === true" class="success">Organization successfully created!</div>
        <div v-if="errors.length > 0" class="error">Errors {{ errors }}</div>
        <form @submit.prevent="submitOrgForm">
          <h3>Форма организации</h3>
          <div>
            <label for="name">Name:</label>
            <input type="text" v-model="organization.name">
          </div>
          <div>
            <label for="org_type">Organization Type:</label>
            <input type="org_type" v-model="organization.org_type">
          </div>
          <div>
            <label for="inn">INN:</label>
            <input type="inn" v-model="organization.inn">
          </div>
          <div>
            <label for="ogrn">OGRN:</label>
            <input type="ogrn" v-model="organization.ogrn">
          </div>
          <v-btn
              type="submit"
              color="success"
              block
              @click="dialogOrg = false"
          >
            Submit
          </v-btn>
        </form>
      </v-card>
    </v-card>
  </div>
</template>

<script>
export default {
  name: "orgForm",
  data() {
    return {
      dialogOrg: false,
      name: "",
      org_type: "",
      inn: "",
      ogrn: "",
      errors: [],
      organizations: [],
      createdOrg: false
    }
  },
  props: {
    organization: {
      type: Object,
      default: {}
    }
  },

  methods: {
    submitOrgForm() {
      this.errors = []

      const serializedOrg = {
        organization: {
          name: this.organization.name,
          org_type: this.organization.org_type,
          inn: this.organization.inn,
          ogrn: this.organization.ogrn
        }
      }

      if (this.organization.id) {

        this.$api.organizations
            .update(this.organization.id, serializedOrg)
            .then((response) => {
              const index = this.organizations.findIndex((o) => o.id === this.organization.id)
              if (index !== -1) {
                this.organizations.splice(index, 1, response.data)
              }
            })
            .catch((error) => {
              this.errors.push(error.response.data.errors)
            })
      } else {

        this.$api.organizations
            .create(serializedOrg)
            .then((response) => {
              this.organizations.push(response.data)
              this.createdOrg = true
            })
            .catch((error) => {
              this.errors.push(error.response.data.errors)
            });
      }
    }
  }
};
</script>
