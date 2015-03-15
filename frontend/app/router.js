import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource('category', { path: 'category/:category_id' }, function() {
    this.resource('products');
  });
});

export default Router;
