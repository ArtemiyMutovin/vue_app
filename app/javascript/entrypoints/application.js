import * as Turbo from "@hotwired/turbo";
Turbo.start();
import { createApp } from "vue";


const app = createApp({
    data() {
        return {
            course: 'Intro to Vue 3 and Rails'
        }
    }
})

app.mount('#app');
console.log("app", app);
