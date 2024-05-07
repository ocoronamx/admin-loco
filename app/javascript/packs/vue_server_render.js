import RailsVueUJS from '../rails_vue_ujs';
var componentRequireContext = require.context("vue_components", true);
RailsVueUJS.initialComponentsContext(componentRequireContext);
self.RailsVueUJS = RailsVueUJS;

// import VueRouter from 'vue-router';
// RailsVueUJS.use(VueRouter);