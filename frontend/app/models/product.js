import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  active: DS.attr('boolean'),
  description: DS.attr('string'),
  price: DS.attr('number'),

  category: DS.belongsTo('category', { async: true })
});
