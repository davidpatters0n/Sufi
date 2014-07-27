'use strict';

/* http://docs.angularjs.org/guide/dev_guide.e2e-testing */

describe('Sufi App', function() {

  describe('Coffee list view', function() {

    beforeEach(function() {
      browser().navigateTo('../../app/index.html');
    });

		it('should open index.html', function() {
		  browser().navigateTo('../../app/index.html');
		  expect(browser().location().url()).toBe('/coffees');
		});

    it('should only display first 5 results on page', function() {
      element('#allresults').click();
      expect(repeater('.coffees li').count()).toBe(30);
      //REVIEW: why are you testing #allresults every time?
      //REVIEW: need to reset the state of the system as it was
      element('#5results').click();
      expect(repeater('.coffees li').count()).toBe(5);
    });

    it('should only display first 10 results on page', function() {
      element('#allresults').click();
      expect(repeater('.coffees li').count()).toBe(30);

      element('#10results').click();
      expect(repeater('.coffees li').count()).toBe(10);
    });

    it('should filter the coffee list as user types into the search box', function() {
      element('#allresults').click();
      expect(repeater('.coffees li').count()).toBe(30);
      //
      input('query').enter('frothy');
      expect(repeater('.coffees li').count()).toBe(10);
    });

    it('should display a message if the searched coffee is not recognised', function() {
      element('#allresults').click();
      expect(repeater('.coffees li').count()).toBe(30);

      input('query').enter('zzzzzzzz');
      expect(repeater('.coffees li').count()).toBe(0);
      expect(element('#message:visible').count()).toBe(1);
    });

    it('should return whole list of coffees if user does not type into search box', function() {
      element('#allresults').click();
      expect(repeater('.coffees li').count()).toBe(30);

      input('query').enter('');
      expect(repeater('.coffees li').count()).toBe(30);
    });

    it('should order coffees in alphabetical order', function() {
      element('#allresults').click();
      select('orderProp').option('Alphabetical');

      expect(repeater('.coffees li', 'Coffee List').column('coffee.name')).
          toEqual(["AMERICANO","CAFÉ AU LAIT","CAPPUCCINO ICE","CAPPUCINO","CARAMEL LATTE MACCHIATO","CHAI TEA LATTE","CHOCOCINO","ESPRESSO","ESPRESSO BARISTA","ESPRESSO DECAF","ESPRESSO INTENSO","ESPRESSO MACCHIATO","ESPRESSO MACCHIATO DECAF","ESPRESSO RISTRETTO","GRANDE CAFFÈ CREMA","GRANDE INTENSO","GRANDE MILD","LATTE MACCHIATO","LATTE UNSWEETENED","LUNGO","LUNGO DECAF","LUNGO INTENSO","LUNGO MILD","MARRAKESH STYLE TEA","MOCHA","NESTEA LEMON","NESTEA PEACH","SKINNY CAPPUCCINO","SKINNY LATTE","VANILLA LATTE MACCHIATO"]);

      expect(repeater('.coffees li').count()).toBe(30);    
    });

    it('should order coffees by type', function() {
      element('#allresults').click();
      select('orderProp').option('Type');

      expect(repeater('.coffees li', 'Coffee List').column('coffee.name')).
          toEqual(["MOCHA","CHOCOCINO","NESTEA PEACH","CAPPUCCINO ICE","NESTEA LEMON","SKINNY LATTE","LATTE UNSWEETENED","LATTE MACCHIATO","SKINNY CAPPUCCINO","CAPPUCINO","VANILLA LATTE MACCHIATO","CARAMEL LATTE MACCHIATO","ESPRESSO MACCHIATO","ESPRESSO MACCHIATO DECAF","LUNGO INTENSO","GRANDE INTENSO","ESPRESSO DECAF","ESPRESSO BARISTA","ESPRESSO","ESPRESSO INTENSO","ESPRESSO RISTRETTO","LUNGO MILD","GRANDE CAFFÈ CREMA","GRANDE MILD","LUNGO","LUNGO DECAF","AMERICANO","CAFÉ AU LAIT","CHAI TEA LATTE","MARRAKESH STYLE TEA"]);

      expect(repeater('.coffees li').count()).toBe(30);    
    });

    it('should order coffees in alphabetical order with search criteria cool', function() {
      input('query').enter('cool');
      select('orderProp').option('Alphabetical');

      expect(repeater('.coffees li', 'Coffee List').column('coffee.name')).
          toEqual(["CAPPUCCINO ICE", "NESTEA LEMON",
                   "NESTEA PEACH"]);

      expect(repeater('.coffees li').count()).toBe(3);
    });

    it('should order coffees by type with search criteria cool, 5 items', function() {
      element('#5results').click();
      
		  input('query').enter('cool');
      select('orderProp').option('Type');

      expect(repeater('.coffees li', 'Coffee List').column('coffee.name')).
          toEqual(["NESTEA PEACH", "CAPPUCCINO ICE",
                   "NESTEA LEMON"]);

      expect(repeater('.coffees li').count()).toBe(3);
    });

    it('should display coffees of all types', function() {
      element('#allresults').click();
      select('orderType').option('All');

      expect(repeater('.coffees li', 'Coffee List').column('coffee.name')).
          toEqual(["AMERICANO","CAFÉ AU LAIT","CAPPUCCINO ICE","CAPPUCINO","CARAMEL LATTE MACCHIATO","CHAI TEA LATTE","CHOCOCINO","ESPRESSO","ESPRESSO BARISTA","ESPRESSO DECAF","ESPRESSO INTENSO","ESPRESSO MACCHIATO","ESPRESSO MACCHIATO DECAF","ESPRESSO RISTRETTO","GRANDE CAFFÈ CREMA","GRANDE INTENSO","GRANDE MILD","LATTE MACCHIATO","LATTE UNSWEETENED","LUNGO","LUNGO DECAF","LUNGO INTENSO","LUNGO MILD","MARRAKESH STYLE TEA","MOCHA","NESTEA LEMON","NESTEA PEACH","SKINNY CAPPUCCINO","SKINNY LATTE","VANILLA LATTE MACCHIATO"]);

      expect(repeater('.coffees li').count()).toBe(30);    
    });

     it('should display coffees of only type: chocolatey', function() {
      select('orderType').option('Chocolatey');

      expect(repeater('.coffees li', 'Coffee List').column('coffee.name')).
          toEqual(["CHOCOCINO", "MOCHA"]);

      expect(repeater('.coffees li').count()).toBe(2);    
    });

    it('should render coffee specific links', function() {
      input('query').enter('mocha');
      element('.coffees li a').click();
      expect(browser().location().url()).toBe('/coffees/mocha');
    });

		it('should show the correct items on the correct page when there are more than one pages of items', function() {
      element('#5results').click();
			element('#nextBtn').click();
			
      expect(repeater('.coffees li', 'Coffee List').column('coffee.name')).
          toEqual(["CHAI TEA LATTE","CHOCOCINO","ESPRESSO","ESPRESSO BARISTA","ESPRESSO DECAF"]);
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
});
