'use strict';

/* http://docs.angularjs.org/guide/dev_guide.e2e-testing */

describe('Sufi App', function() {

  describe('Coffee list view', function() {

    beforeEach(function() {
      browser().navigateTo('../../app/index.html');
    });

		it('should open index.html', function() {
		  browser().navigateTo('../../app/index.html');
		  expect(browser().location().url()).toBe('/#/coffees');
		});

    it('should filter the coffee list as user types into the search box', function() {
      expect(repeater('.coffees li').count()).toBe(30);

      input('query').enter('frothy');
      expect(repeater('.coffees li').count()).toBe(10);
    });

    it('should display a message if the searched coffee is not recognised', function() {
      expect(repeater('.coffees li').count()).toBe(30);

      input('query').enter('zzzzzzzz');
      expect(repeater('.coffees li').count()).toBe(0);
      expect(element('#message:visible').count()).toBe(1);
    });

    it('should be possible to control coffee order via the drop down select box', function() {
		  input('query').enter('cool');
      select('orderProp').option('Type');

      expect(repeater('.coffees li', 'Coffee List').column('coffee.name')).
          toEqual(["NESTEA PEACH", "CAPPUCCINO ICE",
                   "NESTEA LEMON"]);
    });


    it('should render coffee specific links', function() {
      input('query').enter('mocha');
      element('.coffees li a').click();
      expect(browser().location().url()).toBe('/coffees/mocha');
    });
  });


  describe('Coffee detail view', function() {

    beforeEach(function() {
      browser().navigateTo('../../app/index.html#/coffees/mocha');
    });


    it('should display mocha page', function() {
      expect(binding('coffee.name')).toBe('MOCHA');
    });
  });

 describe('Coffee create view', function() {

    beforeEach(function() {
      browser().navigateTo('../../app/index.html');
    });


    it('should add a new coffee to the list', function() {
      expect(repeater('.coffees li').count()).toBe(30);

      input('coffeeName').enter('Coffee Name');
      input('coffeeType').enter('Coffee Type');
      input('coffeeTemp').enter('Coffee Temp');
      input('coffeeInfo').enter('Coffee Info');
      input('coffeePrice').enter('Coffee Price');
      element('#addCoffee').click();
     
      expect(repeater('.coffees li').count()).toBe(31);
  });
});
});
