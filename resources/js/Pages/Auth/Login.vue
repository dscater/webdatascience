<script>
import Login from "@/Layouts/Login.vue";
import { onMounted } from "vue";
export default {
    layout: Login,
};
</script>

<script setup>
import { useConfiguracion } from "@/composables/configuracion/useConfiguracion";
import { useForm, Head } from "@inertiajs/vue3";
import { ref } from "vue";

const { oConfiguracion } = useConfiguracion();
const form = useForm({
    usuario: "",
    password: "",
});

const visible = ref(false);

const submit = () => {
    form.post(route("login"), {
        onError: (err) => {
            if (err.acceso) {
                Swal.fire({
                    icon: "info",
                    title: "Error",
                    text: `${err.acceso}`,
                    confirmButtonColor: "#3085d6",
                    confirmButtonText: `Aceptar`,
                });
            }
        },
        onFinish: () => form.reset("password"),
    });
};

const url_asset = ref("/");

onMounted(() => {
    url_asset.value = url_assets;
});
</script>

<template>
    <Head title="Login" />
    <v-container class="ma-0 login">
        <v-row align="center" justify="center" class="contenedor_login">
            <v-col cols="12" md="4" xl="3">
                <v-card class="elevation-6 mt-10">
                    <v-row>
                        <v-col cols="12">
                            <v-card-text class="bg-principal">
                                <v-img
                                    :src="oConfiguracion.url_logo"
                                    class="w-50 mx-auto"
                                ></v-img>
                            </v-card-text>
                            <v-card-text class="bg-principal">
                                <p
                                    class="nombre_rs"
                                >
                                    {{ oConfiguracion.razon_social }}
                                </p>
                            </v-card-text>
                            <form @submit.prevent="submit">
                                <v-card-text>
                                    <h4 class="text-center text-h6">
                                        Iniciar Sesión
                                    </h4>
                                    <p
                                        class="text-white text-caption text-center text-medium-emphasis font-white"
                                    >
                                        Ingresa tu usuario y contraseña
                                    </p>
                                    <v-row
                                        align="center"
                                        justify="center"
                                        class="mb-8"
                                    >
                                        <v-col cols="12" md="11">
                                            <div
                                                class="text-subtitle-1 text-medium-emphasis"
                                            >
                                                Usuario
                                            </div>

                                            <v-text-field
                                                density="compact"
                                                :error="
                                                    form.errors?.usuario
                                                        ? true
                                                        : false
                                                "
                                                :error-messages="
                                                    form.errors?.usuario
                                                        ? form.errors?.usuario
                                                        : ''
                                                "
                                                placeholder="Ingresa tu usuario"
                                                prepend-inner-icon="mdi-account"
                                                variant="outlined"
                                                color="orange-accent-4"
                                                autocomplete="false"
                                                v-model="form.usuario"
                                                autofocus=""
                                            ></v-text-field>

                                            <div
                                                class="text-subtitle-1 text-medium-emphasis d-flex align-center justify-space-between"
                                            >
                                                Contraseña
                                            </div>

                                            <v-text-field
                                                :append-inner-icon="
                                                    visible
                                                        ? 'mdi-eye-off'
                                                        : 'mdi-eye'
                                                "
                                                :type="
                                                    visible
                                                        ? 'text'
                                                        : 'password'
                                                "
                                                :error="
                                                    form.errors?.password
                                                        ? true
                                                        : false
                                                "
                                                :error-messages="
                                                    form.errors?.password
                                                        ? form.errors?.password
                                                        : ''
                                                "
                                                density="compact"
                                                placeholder="Ingresa tu contraseña"
                                                prepend-inner-icon="mdi-lock-outline"
                                                variant="outlined"
                                                color="orange-accent-4"
                                                @click:append-inner="
                                                    visible = !visible
                                                "
                                                autocomplete="false"
                                                v-model="form.password"
                                            ></v-text-field>
                                            <v-btn
                                                class="mt-2 bg-principal text-white"
                                                elevation="4"
                                                rounded="0"
                                                block
                                                type="submit"
                                                >ACCEDER</v-btn
                                            >
                                        </v-col>
                                    </v-row>
                                </v-card-text>
                            </form>
                        </v-col>
                    </v-row>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>

<style scoped>
.v-container {
    background-color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    min-width: 100vw;
}
</style>
