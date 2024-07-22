<script>
const breadbrums = [
    {
        title: "Inicio",
        disabled: false,
        url: route("inicio"),
        name_url: "inicio",
    },
    {
        title: "Ayuda a otra Institución",
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
    axios
        .get(route("ayuda_oi.grafico"), {
            params: formGrafico.value,
        })
        .then((response) => {
            let xAxis = {
                type: "category",
            };

            let series = [{ name: "Total", data: response.data.data }];

            if (formGrafico.value.filtro == "todos") {
                graf1(
                    "container",
                    "Ayuda a otra Institución",
                    "total",
                    xAxis,
                    series
                );
            } else {
                xAxis = {
                    categories: response.data.categories,
                };
                graf2(
                    "container",
                    "Ayuda a otra Institución",
                    "total",
                    xAxis,
                    response.data.series
                );
            }
        });
};

const graf1 = (contenedor, titulo, yText, xAxis, series) => {
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
            align: "left",
            text: "",
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
            enabled: false,
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                },
                colorByPoint: true, // Esta opción asigna colores diferentes a cada punto
            },
        },
        series: series,
    });
};

const graf2 = (contenedor, titulo, yText, xAxis, series) => {
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
            align: "left",
            text: "",
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
    <Head title="Ayuda a otra Institución"></Head>
    <v-container>
        <BreadBrums :breadbrums="breadbrums"></BreadBrums>
        <v-row class="mt-0">
            <v-col cols="12">
                <v-card flat>
                    <v-card-title>
                        <v-row class="bg-principal d-flex align-center pa-3">
                            <v-col cols="12" sm="6" md="4">
                                Ayuda a otra Institución
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
                            <v-col cols="12">
                                <div id="container"></div>
                            </v-col>
                        </v-row>
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>
