<script>
const breadbrums = [
    {
        title: "Inicio",
        disabled: false,
        url: route("inicio"),
        name_url: "inicio",
    },
    {
        title: "Importar archivo",
        disabled: false,
        url: "",
        name_url: "",
    },
];
</script>
<script setup>
import BreadBrums from "@/Components/BreadBrums.vue";
import { useApp } from "@/composables/useApp";
import { Head } from "@inertiajs/vue3";
import { useImportacions } from "@/composables/importacions/useImportacions";
import { ref, onMounted } from "vue";
import { useMenu } from "@/composables/useMenu";
import axios from "axios";
const { mobile, identificaDispositivo } = useMenu();
const { setLoading } = useApp();
onMounted(() => {
    identificaDispositivo();
    setTimeout(() => {
        setLoading(false);
    }, 300);
});

const archivo_ref = ref(null);
const archivo = ref(null);
const cargando = ref(false);

const cargarArchivo = (e) => {
    archivo.value = e.target.files[0];
};

const registrarArchivo = () => {
    cargando.value = true;
    let config = {
        headers: {
            "Content-Type": "multipart/form-data",
        },
    };
    let formdata = new FormData();
    if (archivo.value) {
        formdata.append("archivo", archivo.value);
    }
    axios
        .post(route("importacions.importar_archivo"), formdata, config)
        .then((response) => {
            setTimeout(() => {
                cargando.value = false;
            }, 500);
            archivo.value = null;
            archivo_ref.value = null;
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `Archivo cargado con éxito`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
        })
        .catch((error) => {
            cargando.value = false;
            if (error.response) {
                if (error.response.status === 422) {
                }
                if (
                    error.response.status === 420 ||
                    error.response.status === 419 ||
                    error.response.status === 401
                ) {
                    window.location = "/";
                }
                if (error.response.status === 500) {
                    Swal.fire({
                        icon: "error",
                        title: "Error",
                        html: error.response.data.message,
                        confirmButtonColor: "#3085d6",
                        confirmButtonText: `Aceptar`,
                    });
                }
            }
        });
};
</script>
<template>
    <Head title="Importar archivo"></Head>
    <v-container>
        <BreadBrums :breadbrums="breadbrums"></BreadBrums>
        <v-row class="mt-0">
            <v-col cols="12">
                <v-card flat>
                    <v-card-title>
                        <v-row class="bg-principal d-flex align-center pa-3">
                            <v-col cols="12" sm="6" md="4">
                                Importar archivo
                            </v-col>
                        </v-row>
                    </v-card-title>
                    <v-card-text>
                        <v-col cols="12" class="p-0">
                            <div id="contenedor_archivo">
                                <div class="cargando" v-if="cargando">
                                    Cargando...
                                </div>
                                <input
                                    type="file"
                                    ref="archivo_ref"
                                    @change="cargarArchivo($event)"
                                />
                                <v-btn
                                    class="bg-principal"
                                    prepend-icon="mdi-content-save"
                                    @click="registrarArchivo()"
                                >
                                    Guardar
                                </v-btn>
                            </div>
                        </v-col>
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>
<style>
#contenedor_archivo {
    display: block;
    position: relative;
    padding: 10px;
}
#contenedor_archivo .cargando {
    z-index: 2000;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: black;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>
