import axios from "axios";

export default {
    users: {
        index: () => axios.get("/api/users"),
        create: (data) => axios.post("/api/users", data)
    }
}
