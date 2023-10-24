import axios from "axios";

export default {
    users: {
        index: () => axios.get("/api/users"),
        create: (data) => axios.post("/api/users", data),
        destroy: (id) => axios.delete(`/api/users/${id}`),
        update: (id, data) => axios.patch(`/api/users/${id}`, data),
    },

    organizations: {
        index: () => axios.get("/api/organizations"),
        create: (data) => axios.post("/api/organizations", data),
        update: (id, data) => axios.patch(`/api/organizations/${id}`, data),
    }
}
