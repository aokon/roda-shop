import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('Index');
  this.resource('categories', function() {
    this.resource('products', { path: ':category_id/products' });
  });
  this.route('Products');
});

export default Router;
