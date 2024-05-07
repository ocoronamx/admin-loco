// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
// console.log('\nVueLoaderPlugin')
// console.log(VueLoaderPlugin)
console.log('\nvue')
console.log(vue)


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import 'bootstrap';

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
});

import '../stylesheets/application';
require('admin-lte');
import "@fortawesome/fontawesome-free/js/all";

// require('vue');
// require('vue-router');
// require('vue-loader');

// const { VueLoaderPlugin } = require('vue-loader')
// const vue = require('./loaders/vue')
// console.log('\n')
// console.log('pkg/app.js . . .')
// console.log('vue:')
// console.log(vue)



let componentRequireContext = require.context("vue_components", true);
import RailsVueUJS from '../rails_vue_ujs';
import vue from "../../../config/webpack/loaders/vue";
// import vue from "vue";
console.log('componentRequireContext-'+componentRequireContext.constructor.name)
console.log(componentRequireContext)
console.log('RailsVueUJS-')
console.log(RailsVueUJS)
RailsVueUJS.initialComponentsContext(componentRequireContext);
self.RailsVueUJS = RailsVueUJS;



