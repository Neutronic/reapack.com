import "@babel/polyfill"

import Vue from 'vue'
import VueRouter from 'vue-router'

import Main from './components/main.vue'
import SelectType from './components/select-type.vue'
import Package from './components/package.vue'

Vue.use VueRouter

router = new VueRouter
  mode: if process.env.NODE_ENV == 'production' then 'history' else 'hash'
  base: '/upload'
  routes: [
    { path: '*', component: SelectType }
    { path: '/:type', component: Package }
  ]

app = new Vue
  router: router,
  render: (createElement) -> createElement Main

app.$mount '#upload-main'
