<script>
const breadbrums = [
    {
        title: "Inicio",
        disabled: false,
        url: route("inicio"),
        name_url: "inicio",
    },
    {
        title: "Humillaciones y Menos Precios por parte de la Población",
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
import Highcharts from "highcharts";
import exporting from "highcharts/modules/exporting";

exporting(Highcharts);
Highcharts.setOptions({
    lang: {
        downloadPNG: "Descargar PNG",
        downloadJPEG: "Descargar JPEG",
        downloadPDF: "Descargar PDF",
        downloadSVG: "Descargar SVG",
        printChart: "Imprimir gráfico",
        contextButtonTitle: "Menú de exportación",
        viewFullscreen: "Pantalla completa",
        exitFullscreen: "Salir de pantalla completa",
    },
});

const { mobile, identificaDispositivo } = useMenu();
const { setLoading } = useApp();
const { setImportacion } = useImportacions();

const listDistritos = ref([]);

const listFiltro = ref([
    {
        value: "todos",
        label: "TODOS",
    },
    {
        value: "comparargestion",
        label: "COMPARAR GESTIÓN",
    },
    {
        value: "mensual",
        label: "MENSUAL",
    },
    {
        value: "trimestral",
        label: "TRIMESTRAL",
    },
    {
        value: "anual",
        label: "ANUAL",
    },
]);
const getGestion = () => {
    const fechaActual = new Date();
    const añoActual = fechaActual.getFullYear();
    return añoActual;
};

const formGrafico = ref({
    filtro: "todos",
    distrito_id: "todos",
    gestion: getGestion(),
    gestion1: getGestion(),
    gestion2: getGestion(),
});

const getInfoAnalisis = () => {
    vaciaGraficos();
    axios
        .get(route("hmp_poblacions.grafico"), {
            params: formGrafico.value,
        })
        .then((response) => {
            response.data.informacionArray.forEach((elem, index) => {
                let container_index = index + 1;
                let xAxis = {
                    categories: elem.categories,
                };
                let contenedor = "container" + container_index;
                graficar(
                    contenedor,
                    elem.titulo,
                    elem.subtitulo,
                    elem.yText,
                    xAxis,
                    elem.series
                );
            });

            // let xAxis = null
            // let series = null;

            // graficar(
            //     "container",
            //     "Humillaciones y Menos Precios por parte de la Población",
            //     "",
            //     "total",
            //     xAxis,
            //     response.data.series
            // );
        });
};

const graficar = (contenedor, titulo, subtitulo, yText, xAxis, series) => {
    Highcharts.chart(contenedor, {
        chart: {
            type: "column",
            backgroundColor: "#f0f0f0", // Fondo del gráfico
            borderColor: "#000000", // Color del borde
            borderWidth: 1, // Ancho del borde
        },
        title: {
            align: "center",
            text: titulo,
        },
        subtitle: {
            align: "center",
            text: subtitulo,
        },
        accessibility: {
            announceNewData: {
                enabled: true,
            },
        },
        xAxis: xAxis,
        yAxis: {
            title: {
                text: yText,
            },
        },
        legend: {
            enabled: true,
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                },
            },
        },
        series: series,
    });
};

const vaciaGraficos = () => {
    let containers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    containers.forEach((elem) => {
        let nom_container = "container" + elem;
        document.getElementById(nom_container).innerHTML = "";
    });
};

const getDistritos = () => {
    axios.get(route("distritos.listado")).then((response) => {
        listDistritos.value = response.data.distritos;
        listDistritos.value.unshift({
            id: "todos",
            nombre_distrito: "TODOS",
        });
    });
};

const actualizaGrafico = (value) => {
    getInfoAnalisis();
};

onMounted(() => {
    getDistritos();
    identificaDispositivo();
    setTimeout(() => {
        setLoading(false);
    }, 300);
    getInfoAnalisis();
});
</script>
<template>
    <Head
        title="Humillaciones y Menos Precios por parte de la Población"
    ></Head>
    <v-container>
        <BreadBrums :breadbrums="breadbrums"></BreadBrums>
        <v-row class="mt-0">
            <v-col cols="12">
                <v-card flat>
                    <v-card-title>
                        <v-row class="bg-principal d-flex align-center pa-3">
                            <v-col cols="12" sm="6" md="4">
                                Humillaciones y Menos Precios por parte de la
                                Población
                            </v-col>
                        </v-row>
                    </v-card-title>
                    <v-card-text>
                        <v-row>
                            <v-col cols="12 mt-3">
                                <v-select
                                    :hide-details="true"
                                    density="compact"
                                    variant="outlined"
                                    color="primary"
                                    clearable
                                    :items="listDistritos"
                                    item-value="id"
                                    item-title="nombre_distrito"
                                    label="Distrito"
                                    v-model="formGrafico.distrito_id"
                                    required
                                    @update:modelValue="actualizaGrafico()"
                                ></v-select>
                            </v-col>
                            <v-col cols="12">
                                <v-select
                                    :hide-details="true"
                                    density="compact"
                                    variant="outlined"
                                    color="primary"
                                    clearable
                                    :items="listFiltro"
                                    item-value="value"
                                    item-title="label"
                                    label="Filtro"
                                    v-model="formGrafico.filtro"
                                    required
                                    @update:modelValue="actualizaGrafico()"
                                ></v-select>
                            </v-col>
                            <v-col
                                cols="12"
                                v-if="
                                    formGrafico.filtro != 'comparargestion' &&
                                    formGrafico.filtro != 'anual'
                                "
                            >
                                <v-text-field
                                    type="number"
                                    step="1"
                                    density="compact"
                                    variant="outlined"
                                    color="primary"
                                    label="Gestión"
                                    v-model="formGrafico.gestion"
                                    @keyup="actualizaGrafico()"
                                ></v-text-field>
                            </v-col>
                            <v-col
                                cols="12"
                                v-if="formGrafico.filtro == 'comparargestion'"
                            >
                                <v-row>
                                    <v-col cols="12" md="6">
                                        <v-text-field
                                            type="number"
                                            step="1"
                                            density="compact"
                                            variant="outlined"
                                            color="primary"
                                            label="Gestión 1"
                                            v-model="formGrafico.gestion1"
                                            required
                                            @keyup="actualizaGrafico()"
                                        ></v-text-field>
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <v-text-field
                                            type="number"
                                            step="1"
                                            density="compact"
                                            variant="outlined"
                                            color="primary"
                                            label="Gestión 2"
                                            v-model="formGrafico.gestion2"
                                            required
                                            @keyup="actualizaGrafico()"
                                        ></v-text-field>
                                    </v-col>
                                </v-row>
                            </v-col>
                            <v-col
                                cols="12"
                                :md="formGrafico.filtro != 'todos' ? '6' : '12'"
                                :xl="formGrafico.filtro != 'todos' ? '4' : '12'"
                            >
                                <div id="container1"></div>
                            </v-col>
                            <v-col
                                cols="12"
                                :md="formGrafico.filtro != 'todos' ? '6' : '12'"
                                :xl="formGrafico.filtro != 'todos' ? '4' : '12'"
                            >
                                <div id="container2"></div>
                            </v-col>
                            <v-col
                                cols="12"
                                :md="formGrafico.filtro != 'todos' ? '6' : '12'"
                                :xl="formGrafico.filtro != 'todos' ? '4' : '12'"
                            >
                                <div id="container3"></div>
                            </v-col>
                            <v-col
                                cols="12"
                                :md="formGrafico.filtro != 'todos' ? '6' : '12'"
                                :xl="formGrafico.filtro != 'todos' ? '4' : '12'"
                            >
                                <div id="container4"></div>
                            </v-col>
                            <v-col
                                cols="12"
                                :md="formGrafico.filtro != 'todos' ? '6' : '12'"
                                :xl="formGrafico.filtro != 'todos' ? '4' : '12'"
                            >
                                <div id="container5"></div>
                            </v-col>
                            <v-col
                                cols="12"
                                :md="formGrafico.filtro != 'todos' ? '6' : '12'"
                                :xl="formGrafico.filtro != 'todos' ? '4' : '12'"
                            >
                                <div id="container6"></div>
                            </v-col>
                            <v-col
                                cols="12"
                                :md="formGrafico.filtro != 'todos' ? '6' : '12'"
                                :xl="formGrafico.filtro != 'todos' ? '4' : '12'"
                            >
                                <div id="container7"></div>
                            </v-col>
                            <v-col
                                cols="12"
                                :md="formGrafico.filtro != 'todos' ? '6' : '12'"
                                :xl="formGrafico.filtro != 'todos' ? '4' : '12'"
                            >
                                <div id="container8"></div>
                            </v-col>
                            <v-col
                                cols="12"
                                :md="formGrafico.filtro != 'todos' ? '6' : '12'"
                                :xl="formGrafico.filtro != 'todos' ? '4' : '12'"
                            >
                                <div id="container9"></div>
                            </v-col>
                            <v-col
                                cols="12"
                                :md="formGrafico.filtro != 'todos' ? '6' : '12'"
                                :xl="formGrafico.filtro != 'todos' ? '4' : '12'"
                            >
                                <div id="container10"></div>
                            </v-col>
                            <v-col
                                cols="12"
                                :md="formGrafico.filtro != 'todos' ? '6' : '12'"
                                :xl="formGrafico.filtro != 'todos' ? '4' : '12'"
                            >
                                <div id="container11"></div>
                            </v-col>
                            <v-col
                                cols="12"
                                :md="formGrafico.filtro != 'todos' ? '6' : '12'"
                                :xl="formGrafico.filtro != 'todos' ? '4' : '12'"
                            >
                                <div id="container12"></div>
                            </v-col>
                        </v-row>
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>
