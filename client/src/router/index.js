import Vue from 'vue'
import VueRouter from 'vue-router'
import AccueilView from '../views/AccueilView.vue'
import CarteView from "../views/CarteView";
import ContactView from "../views/ContactView";
import ListeManegeView from "../views/ListeManegeView";
import ConnexionView from "@/views/ConnexionView";
import InscriptionView from "@/views/InscriptionView";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'AccueilView',
    component: AccueilView
  },
  {
    path: '/carte',
    name: 'CarteView',
    component: CarteView
  },
  {
    path: '/contact',
    name: 'ContactView',
    component: ContactView
  },
  {
    path: '/liste_manege',
    name: 'ListeManegeView',
    component: ListeManegeView
  },
  {
    path: '/connexion',
    name: 'connexionView',
    component: ConnexionView
  },
  {
    path: '/inscription',
    name: 'inscriptionView',
    component: InscriptionView
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
