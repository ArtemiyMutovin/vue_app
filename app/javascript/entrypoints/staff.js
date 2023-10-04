import {createApp} from "vue";
import Staff from "@/apps/staff/app.vue";
import api from "@/apps/api";


const app = createApp(Staff);
app.config.globalProperties.$api = api;
app.mount('#staff-app');

