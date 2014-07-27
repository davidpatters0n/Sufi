'use strict';

/** These tests relate to the display of an individual coffee */
describe('Coffee detail view', function() {
  beforeEach(function() {
    browser().navigateTo('../../app/index.html#/coffees/10');
  });

  it('should display mocha page', function() {
    expect(binding('coffee.name')).toBe('MOCHA');
  });
});