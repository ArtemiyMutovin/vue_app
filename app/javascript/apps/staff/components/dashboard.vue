<template>
  <div v-if="userCreated === true" class="success">User successfully created!</div>
  <v-table theme="dark">
    <thead>
    <tr>
      <th class="text-left">
        Fullname
      </th>
      <th class="text-left">
        Email
      </th>
    </tr>
    </thead>
    <tbody>
    <tr
        v-for="item in users"
        :key="item.id"
    >
      <td>{{ item.fullname }}</td>
      <td>{{ item.email }}</td>
      <td>
        <v-btn
            color="success"
            @click="editUser(item)"
        >
          Edit
          <v-dialog
              v-model="dialogEditUser"
              activator="parent"
              width="auto"
          >
            <userForm :user="item"></userForm>
            <v-btn
                color="error"
                block
                @click="dialogEditUser = false"
            >
              Close

            </v-btn>
          </v-dialog>
        </v-btn>
      </td>
      <td>
        <v-btn color="error" @click="deleteUser(item)">
          Delete
        </v-btn>
      </td>
    </tr>
    </tbody>
  </v-table>

  <v-table theme="primary">
    <thead>
    <tr>
      <th class="text-left">
        Name
      </th>
      <th class="text-left">
        Organization Type
      </th>
    </tr>
    </thead>
    <tbody>
    <tr
        v-for="item in organizations"
        :key="item.id"
    >
      <td>{{ item.name }}</td>
      <td>{{ item.org_type }}</td>
      <td>
        <v-btn
            color="success"
        >
          Edit
          <v-dialog
              v-model="dialogEditOrg"
              activator="parent"
              width="auto"
          >
            <orgForm/>
          </v-dialog>
        </v-btn>
      </td>
      <td>
        <v-btn color="error" @click="deleteOrg(item)">
          Delete
        </v-btn>
      </td>
    </tr>
    </tbody>
  </v-table>
  <div class="text-center">
    <v-btn
        color="primary"
    >
      Create user
      <v-dialog
          v-model="dialogUser"
          activator="parent"
          width="auto"
      >
        <userForm/>
        <v-btn
            color="error"
            block
            @click="dialogUser = false"
        >
          Close

        </v-btn>
      </v-dialog>
    </v-btn>
  </div>
  <div class="text-center">
    <v-btn
        color="warning"
    >
      Create organization

      <v-dialog
          v-model="dialogOrg"
          activator="parent"
          width="auto"
      >
        <orgForm/>
      </v-dialog>
    </v-btn>
  </div>
</template>

<script>
  import userForm from "@/apps/user/form.vue";
  import orgForm from "@/apps/organization/form.vue";

export default {
  name: "Dashboard",
  components: {userForm, orgForm},
  data() {
    return {
      dialogUser: false,
      dialogOrg: false,
      dialogEditOrg: false,
      dialogEditUser: false,
      fullname: "",
      phone: "",
      email: "",
      password: "",
      users: [],
      organizations: [],
      name: "",
      org_type: "",
      inn: "",
      ogrn: "",
      userCreated: false
    }
  },

  created() {
    this.$api.users
        .index()
        .then((response) => this.users = response.data)
        .catch((error) => console.log('it is error'));

    this.$api.organizations
        .index()
        .then((response) => this.organizations = response.data)
        .catch((error) => console.log('it is error'));
  },
  methods: {
    deleteUser(user) {
      this.deleteIndex = this.users.indexOf(user);
      this.$api.users
          .destroy(user.id)
          .then(() => {
            this.users.splice(this.deleteIndex, 1);
          })
          .catch((err) => {
            console.log(err);
          });
    },
    deleteOrg(organization) {
      this.deleteIndex = this.organizations.indexOf(organization);
      this.$api.organizations
          .destroy(organization.id)
          .then(() => {
            this.organizations.splice(this.deleteIndex, 1);
          })
          .catch((err) => {
            console.log(err);
          });
    },
    editUser(user) {
      this.$api.users
          .update(user.id, { user: user })
          .then(() => {
            const index = this.users.findIndex(u => u.id === user.id);
            if (index !== -1) {
              this.users[index] = { ...user };
            }
          })
          .catch((error) => {
            console.error(error);
          });
    },
    editOrg(organization) {
      this.$api.organizations
          .update(organization.id, organization)
          .then(() => {
            const index = this.organizations.findIndex(o => o.id === organization.id);
            if (index !== -1) {
              this.organizations[index] = { ...organization };
            }
          })
          .catch((error) => {
            console.error(error);
          });
    }
  }
};
</script>

<style>
.error {
  color: red;
}

.success {
  color: green;
}
</style>
