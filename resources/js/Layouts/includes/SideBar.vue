<script setup>
import { useMenu } from "@/composables/useMenu";
import { onMounted, ref } from "vue";
import { usePage, router } from "@inertiajs/vue3";
import { useUser } from "@/composables/useUser";
const { oUser } = useUser();

// data
const {
    mobile,
    drawer,
    rail,
    width,
    menu_open,
    setMenuOpen,
    cambiarUrl,
    toggleDrawer,
} = useMenu();

const user_logeado = ref({
    permisos: [],
});

const submenus = {
    // graficos
    "reportes.usuarios": "Graficos",
    // reportes
    "reportes.usuarios": "Reportes",
};

const route_current = ref("");

router.on("navigate", (event) => {
    route_current.value = route().current();
    if (mobile.value) {
        toggleDrawer(false);
    }
});

const { props: props_page } = usePage();

onMounted(() => {
    let route_actual = route().current();
    // buscar en submenus y abrirlo si uno de sus elementos esta activo
    setMenuOpen([]);
    if (submenus[route_actual]) {
        setMenuOpen([submenus[route_actual]]);
    }

    if (props_page.auth) {
        user_logeado.value = props_page.auth?.user;
    }

    setTimeout(() => {
        scrollActive();
    }, 300);
});

const scrollActive = () => {
    let sidebar = document.querySelector("#sidebar");
    let menu = null;
    let activeChild = null;
    if (sidebar) {
        menu = sidebar.querySelector(".v-navigation-drawer__content");
        activeChild = sidebar.querySelector(".active");
    }
    // Verifica si se encontró un hijo activo
    if (activeChild) {
        let offsetTop = activeChild.offsetTop - sidebar.offsetTop;
        setTimeout(() => {
            menu.scrollTo({
                top: offsetTop,
                behavior: "smooth", // desplazamiento suave
            });
        }, 500);
    }
};
</script>
<template>
    <v-navigation-drawer
        :permanent="!mobile"
        :temporary="mobile"
        v-model="drawer"
        class="border-0 elevation-2 __sidebar"
        :width="width"
        id="sidebar"
    >
        <v-sheet>
            <div
                class="w-100 d-flex flex-column align-center elevation-1 bg-principal pa-2 __info_usuario"
            >
                <v-avatar
                    class="mb-1"
                    color="blue-darken-4"
                    :size="`${!rail ? '64' : '32'}`"
                >
                    <v-img
                        cover
                        v-if="oUser.url_foto"
                        :src="oUser.url_foto"
                    ></v-img>
                    <span v-else class="text-h5">
                        {{ oUser.iniciales_nombre }}
                    </span>
                </v-avatar>
                <div
                    v-show="!rail"
                    class="text-caption font-weight-bold text-white"
                >
                    {{ oUser.tipo }}
                </div>
                <div v-show="!rail" class="text-body text-white">
                    {{ oUser.full_name }}
                </div>
            </div>
        </v-sheet>

        <v-list class="px-0" v-model:opened="menu_open">
            <v-list-item class="text-caption bg-grey-lighten-3">
                <span v-if="rail && !mobile" class="text-center d-block"
                    ><v-icon>mdi-dots-horizontal</v-icon></span
                >
                <span v-else class="font-weight-bold d-block text-center"
                    >INICIO</span
                ></v-list-item
            >
            <v-list-item
                class="mx-3"
                prepend-icon="mdi-home-outline"
                :class="[
                    route_current == 'inicio' ? 'active' : '',
                    drawer ? 'px-3' : '',
                ]"
                @click="cambiarUrl(route('inicio'))"
                link
            >
                <v-list-item-title>Inicio</v-list-item-title>
                <v-tooltip
                    v-if="rail && !mobile"
                    color="white"
                    activator="parent"
                    location="end"
                    >Inicio</v-tooltip
                >
            </v-list-item>
            <v-list-item
                class="text-caption pa-0 px-5 bg-grey-lighten-3"
                v-if="
                    oUser.permisos.includes('usuarios.index') ||
                    oUser.permisos.includes('importacions.index')||
                    oUser.permisos.includes('catergorias.index')
                "
            >
                <span v-if="rail && !mobile" class="text-center d-block"
                    ><v-icon>mdi-dots-horizontal</v-icon></span
                >
                <span v-else class="font-weight-bold d-block text-center"
                    >ADMINISTRACIÓN</span
                ></v-list-item
            >
            <v-list-item
                :class="[
                    route_current == 'importacions.index' ? 'active' : '',
                    drawer ? 'px-3' : '',
                ]"
                class="mx-3"
                v-if="oUser.permisos.includes('importacions.index')"
                prepend-icon="mdi-upload"
                @click="cambiarUrl(route('importacions.index'))"
                link
            >
                <v-list-item-title>Importar archivo</v-list-item-title>
                <v-tooltip
                    v-if="rail && !mobile"
                    color="white"
                    activator="parent"
                    location="end"
                    >Importar archivo</v-tooltip
                >
            </v-list-item>
            <!-- SUBGROUP -->
            <v-list-group
                value="Graficos"
                class="mx-3"
                v-if="
                    oUser.permisos.includes('reportes.usuarios') ||
                    oUser.permisos.includes('reportes.ingresos')
                "
            >
                <template v-slot:activator="{ props }">
                    <v-list-item
                        v-bind="props"
                        prepend-icon="mdi-file-document-multiple"
                        title="Análisis de datos"
                        :class="[
                            route_current == 'reporutes.usuarios' ||
                            route_current == 'reportes.ingresos'
                                ? 'active'
                                : '',
                        ]"
                    >
                        <v-tooltip
                            v-if="rail && !mobile"
                            color="white"
                            activator="parent"
                            location="end"
                            >Análisis de datos</v-tooltip
                        ></v-list-item
                    >
                </template>
                <v-list-item
                    v-if="oUser.permisos.includes('poblacion_mujers.index')"
                    prepend-icon="mdi-chevron-right"
                    title="Cantidad de Población de Mujeres por Distrito"
                    :class="[
                        route_current == 'poblacion_mujers.index' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('poblacion_mujers.index'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Cantidad de Población de Mujeres por
                        Distrito</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Humillaciones y Menos Precios por parte de la Población"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Humillaciones y Menos Precios por parte de la
                        Población</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Humillaciones y Menos Precios por actores Principales"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Humillaciones y Menos Precios por actores
                        Principales</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Agresiones Físicas en lugares Públicos"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Agresiones Físicas en lugares Públicos</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Agresiones Verbales de Carácter Sexual en lugares Públicos"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Agresiones Verbales de Carácter Sexual en lugares
                        Públicos</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Agresiones de Toques Impúdicos sin Consentimiento en lugares Públicos"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Agresiones de Toques Impúdicos sin Consentimiento en
                        lugares Públicos</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Obligaron a tener Relaciones Sexuales por distintos actores Principales"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Obligaron a tener Relaciones Sexuales por distintos
                        actores Principales</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Ayuda a la policía FELCV"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Ayuda a la policía FELCV</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Ayuda al Servicio Legal Integral Municipal (SLIM)"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Ayuda al Servicio Legal Integral Municipal
                        (SLIM)</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Ayuda a la Defensoría de la Niñez y Adolescencia"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Ayuda a la Defensoría de la Niñez y
                        Adolescencia</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Ayuda a otra Institución"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Ayuda a otra Institución</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Ayuda a algún Familia"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Ayuda a algún Familia</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Ayuda a una Amiga"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Ayuda a una Amiga</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Ayuda a un Amigo"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Ayuda a un Amigo</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="No Pidió Ayuda"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >No Pidió Ayuda</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Pidió Ayuda a otra Persona o Autoridad"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Pidió Ayuda a otra Persona o Autoridad</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="No Pidió Ayuda por Vergüenza"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >No Pidió Ayuda por Vergüenza</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="No Pidió Ayuda porque no Quería que se Sepa"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >No Pidió Ayuda porque no Quería que se Sepa</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="No Pidió Ayuda por Miedo"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >No Pidió Ayuda por Miedo</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="No Pidió Ayuda por Amenaza"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >No Pidió Ayuda por Amenaza</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="No Pidió Ayuda porque la Familia le Pidió no Hacerlo"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >No Pidió Ayuda porque la Familia le Pidió no
                        Hacerlo</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="No Pidió Ayuda porque se trató de un hecho sin importancia"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >No Pidió Ayuda porque se trató de un hecho sin
                        importancia</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="No Pidió Ayuda porque no Sabía que Podía Denunciar"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >No Pidió Ayuda porque no Sabía que Podía
                        Denunciar</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="No Pidió Ayuda porque no Cree en la Justicia"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >No Pidió Ayuda porque no Cree en la Justicia</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="No Pidió Ayuda por otro Motivo"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >No Pidió Ayuda por otro Motivo</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Denuncias de Agresiones"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Denuncias de Agresiones</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Mujeres que no Presentaron Denuncia por Vergüenza"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Mujeres que no Presentaron Denuncia por
                        Vergüenza</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Mujeres que no Presentaron Denuncia porque No Querían que se sepa"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Mujeres que no Presentaron Denuncia porque No Querían
                        que se sepa</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Mujeres que no Presentaron Denuncia por Miedo"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Mujeres que no Presentaron Denuncia por
                        Miedo</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Mujeres que no Presentaron Denuncia por Amenaza"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Mujeres que no Presentaron Denuncia por
                        Amenaza</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Mujeres que no Presentaron Denuncia porque su Familia la convenció de no Hacerlo"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Mujeres que no Presentaron Denuncia porque su Familia
                        la convenció de no Hacerlo</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Mujeres que no Presentaron Denuncia porque se Trató de un Hecho sin Importancia"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Mujeres que no Presentaron Denuncia porque se Trató de
                        un Hecho sin Importancia</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Mujeres que no Presentaron Denuncia porque no Sabía que se Podía Denunciar"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Mujeres que no Presentaron Denuncia porque no Sabía que
                        se Podía Denunciar</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Mujeres que no Presentaron Denuncia porque No Cree en la Justicia"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Mujeres que no Presentaron Denuncia porque No Cree en
                        la Justicia</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Mujeres que no Presentaron Denuncia por otro Motivo"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Mujeres que no Presentaron Denuncia por otro
                        Motivo</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Mujeres que recibieron Atención Médica o Psicológica por estos Hechos"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Mujeres que recibieron Atención Médica o Psicológica
                        por estos Hechos</v-tooltip
                    ></v-list-item
                >
            </v-list-group>
            <v-list-item
                :class="[
                    route_current == 'usuarios.index' ? 'active' : '',
                    drawer ? 'px-3' : '',
                ]"
                class="mx-3"
                v-if="oUser.permisos.includes('usuarios.index')"
                prepend-icon="mdi-account-group"
                @click="cambiarUrl(route('usuarios.index'))"
                link
            >
                <v-list-item-title>Usuarios</v-list-item-title>
                <v-tooltip
                    v-if="rail && !mobile"
                    color="white"
                    activator="parent"
                    location="end"
                    >Usuarios</v-tooltip
                >
            </v-list-item>
            <v-list-item
                class="text-caption bg-grey-lighten-3"
                v-if="oUser.permisos.includes('reportes.usuarios')"
                ><span v-if="rail && !mobile" class="text-center d-block"
                    ><v-icon>mdi-dots-horizontal</v-icon></span
                >
                <span v-else class="font-weight-bold d-block text-center"
                    >REPORTES</span
                ></v-list-item
            >
            <!-- SUBGROUP -->
            <v-list-group
                value="Reportes"
                class="mx-3"
                v-if="
                    oUser.permisos.includes('reportes.usuarios') ||
                    oUser.permisos.includes('reportes.ingresos')
                "
            >
                <template v-slot:activator="{ props }">
                    <v-list-item
                        v-bind="props"
                        prepend-icon="mdi-file-document-multiple"
                        title="Reportes"
                        :class="[
                            route_current == 'reporutes.usuarios' ||
                            route_current == 'reportes.ingresos' ||
                            route_current == 'reportes.egresos' ||
                            route_current == 'reportes.presupuestos' ||
                            route_current == 'reportes.ganancias' ||
                            route_current == 'reportes.movimientos'
                                ? 'active'
                                : '',
                        ]"
                    >
                        <v-tooltip
                            v-if="rail && !mobile"
                            color="white"
                            activator="parent"
                            location="end"
                            >Reportes</v-tooltip
                        ></v-list-item
                    >
                </template>
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.usuarios')"
                    prepend-icon="mdi-chevron-right"
                    title="Usuarios"
                    :class="[
                        route_current == 'reportes.usuarios' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.usuarios'))"
                    link
                >
                    <v-tooltip
                        v-if="rail && !mobile"
                        color="white"
                        activator="parent"
                        location="end"
                        >Usuarios</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.ingresos')"
                    prepend-icon="mdi-chevron-right"
                    title="Ingresos Económicos"
                    :class="[
                        route_current == 'reportes.ingresos' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.ingresos'))"
                    link
                >
                    <v-tooltip
                        v-if="rail && !mobile"
                        color="white"
                        activator="parent"
                        location="end"
                        >Ingresos Económicos</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.egresos')"
                    prepend-icon="mdi-chevron-right"
                    title="Egresos Económicos"
                    :class="[
                        route_current == 'reportes.egresos' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.egresos'))"
                    link
                >
                    <v-tooltip
                        v-if="rail && !mobile"
                        color="white"
                        activator="parent"
                        location="end"
                        >Egresos Económicos</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.presupuestos')"
                    prepend-icon="mdi-chevron-right"
                    title="Presupuestos"
                    :class="[
                        route_current == 'reportes.presupuestos'
                            ? 'active'
                            : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.presupuestos'))"
                    link
                >
                    <v-tooltip
                        v-if="rail && !mobile"
                        color="white"
                        activator="parent"
                        location="end"
                        >Presupuestos</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.ganancias')"
                    prepend-icon="mdi-chevron-right"
                    title="Ganancias Netas"
                    :class="[
                        route_current == 'reportes.ganancias' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.ganancias'))"
                    link
                >
                    <v-tooltip
                        v-if="rail && !mobile"
                        color="white"
                        activator="parent"
                        location="end"
                        >Ganancias Netas</v-tooltip
                    ></v-list-item
                >
                <v-list-item
                    v-if="oUser.permisos.includes('reportes.movimientos')"
                    prepend-icon="mdi-chevron-right"
                    title="Movimientos de I. y E. Económicos"
                    :class="[
                        route_current == 'reportes.movimientos' ? 'active' : '',
                        drawer ? 'px-3' : '',
                    ]"
                    @click="cambiarUrl(route('reportes.movimientos'))"
                    link
                >
                    <v-tooltip color="white" activator="parent" location="end"
                        >Movimientos de Ingresos y Egresos Económicos</v-tooltip
                    ></v-list-item
                >
            </v-list-group>
            <v-list-item class="text-caption bg-grey-lighten-3"
                ><span v-if="rail && !mobile" class="text-center d-block"
                    ><v-icon>mdi-dots-horizontal</v-icon></span
                >
                <span v-else class="font-weight-bold d-block text-center"
                    >OTROS</span
                ></v-list-item
            >
            <v-list-item
                v-if="oUser.permisos.includes('configuracions.index')"
                prepend-icon="mdi-cog-outline"
                class="mx-3"
                :class="[
                    route_current == 'configuracions.index' ? 'active' : '',
                    drawer ? 'px-3' : '',
                ]"
                @click="cambiarUrl(route('configuracions.index'))"
                link
            >
                <v-list-item-title>Configuración</v-list-item-title>
                <v-tooltip
                    v-if="rail && !mobile"
                    color="white"
                    activator="parent"
                    location="end"
                    >Configuración</v-tooltip
                >
            </v-list-item>
            <v-list-item
                prepend-icon="mdi-account-circle"
                class="mx-3"
                :class="[
                    route_current == 'profile.edit' ? 'active' : '',
                    drawer ? 'px-3' : '',
                ]"
                @click="cambiarUrl(route('profile.edit'))"
                link
            >
                <v-list-item-title>Perfil</v-list-item-title>
                <v-tooltip
                    v-if="rail && !mobile"
                    color="white"
                    activator="parent"
                    location="end"
                    >Perfil</v-tooltip
                >
            </v-list-item>
            <v-list-item
                prepend-icon="mdi-logout"
                class="mx-3"
                @click="cambiarUrl(route('logout'), 'post')"
                link
            >
                <v-list-item-title>Salir</v-list-item-title>
                <v-tooltip
                    v-if="rail && !mobile"
                    color="white"
                    activator="parent"
                    location="end"
                    >Salir</v-tooltip
                >
            </v-list-item>
        </v-list>
    </v-navigation-drawer>
</template>
<style scoped></style>
