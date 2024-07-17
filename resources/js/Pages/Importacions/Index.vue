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
const { mobile, identificaDispositivo } = useMenu();
const { setLoading } = useApp();
onMounted(() => {
    identificaDispositivo();
    setTimeout(() => {
        setLoading(false);
    }, 300);
});

const { setImportacion } = useImportacions();

const search = ref("");
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
                            
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>
