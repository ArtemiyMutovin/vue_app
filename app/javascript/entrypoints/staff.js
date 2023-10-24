import {createApp} from "vue";
import Staff from "@/apps/staff/app.vue";
import api from "@/apps/api";
import Vuetify from "@/apps/vuetify";

const app = createApp(Staff);
app.config.globalProperties.$api = api;
app.use(Vuetify);
app.mount('#staff-app');

