'use strict';

/** These tests all relate to the display of the coffees on the initial page */
describe('Coffee list view', function() {
  beforeEach(function() {
    browser().navigateTo('../../app/index.html');
    input('search').enter('');
    select('orderProp').option('Alphabetical');
    select('coffeeType').option('All');
    element('#allresults').click();
  });

	it('should open index.html', function() {
	  expect(browser().location().url()).toBe('/coffees');
	});

  it('should only display first 5 results on page', function() {
    expect(repeater('.coffees li').count()).toBe(30);
    
    element('#5results').click();
    expect(repeater('.coffees li').count()).toBe(5);
  });

  it('should only display first 10 results on page', function() {
    expect(repeater('.coffees li').count()).toBe(30);

    element('#10results').click();
    expect(repeater('.coffees li').count()).toBe(10);
  });

  it('should display a message if the searched coffee is not recognised', function() {
    expect(repeater('.coffees li').count()).toBe(30);

    input('search').enter('zzzzzzzz');
    element('#searchButton').click();
    expect(repeater('.coffees li').count()).toBe(0);
    expect(element('#message:visible').count()).toBe(1);
  });

  it('should return whole list of coffees if user does not type into search box', function() {
    expect(repeater('.coffees li').count()).toBe(30);

    input('search').enter('');
    expect(repeater('.coffees li').count()).toBe(30);
  });

  it('should order coffees in alphabetical order', function() {
    select('orderProp').option('Alphabetical');

    expect(repeater('.coffees li', 'Coffee List').column('coffee.name')).
        toEqual(["AMERICANO","CAFÉ AU LAIT","CAPPUCCINO ICE","CAPPUCINO","CARAMEL LATTE MACCHIATO","CHAI TEA LATTE","CHOCOCINO","ESPRESSO","ESPRESSO BARISTA","ESPRESSO DECAF","ESPRESSO INTENSO","ESPRESSO MACCHIATO","ESPRESSO MACCHIATO DECAF","ESPRESSO RISTRETTO","GRANDE CAFFÈ CREMA","GRANDE INTENSO","GRANDE MILD","LATTE MACCHIATO","LATTE UNSWEETENED","LUNGO","LUNGO DECAF","LUNGO INTENSO","LUNGO MILD","MARRAKESH STYLE TEA","MOCHA","NESTEA LEMON","NESTEA PEACH","SKINNY CAPPUCCINO","SKINNY LATTE","VANILLA LATTE MACCHIATO"]);

    expect(repeater('.coffees li').count()).toBe(30);
  });

  it('should order coffees by type', function() {
    select('orderProp').option('Type');

    expect(repeater('.coffees li', 'Coffee List').column('coffee.name')).
        toEqual(["MOCHA","CHOCOCINO","NESTEA PEACH","CAPPUCCINO ICE","NESTEA LEMON","SKINNY LATTE","LATTE UNSWEETENED","LATTE MACCHIATO","SKINNY CAPPUCCINO","CAPPUCINO","VANILLA LATTE MACCHIATO","CARAMEL LATTE MACCHIATO","ESPRESSO MACCHIATO","ESPRESSO MACCHIATO DECAF","LUNGO INTENSO","GRANDE INTENSO","ESPRESSO DECAF","ESPRESSO BARISTA","ESPRESSO","ESPRESSO INTENSO","ESPRESSO RISTRETTO","LUNGO MILD","GRANDE CAFFÈ CREMA","GRANDE MILD","LUNGO","LUNGO DECAF","AMERICANO","CAFÉ AU LAIT","CHAI TEA LATTE","MARRAKESH STYLE TEA"]);

    expect(repeater('.coffees li').count()).toBe(30);    
  });

  it('should order coffees in alphabetical order with search criteria cool', function() {
    input('search').enter('cool');
    select('orderProp').option('Alphabetical');

    expect(repeater('.coffees li', 'Coffee List').column('coffee.name')).
        toEqual(["CAPPUCCINO ICE", "NESTEA LEMON",
                   "NESTEA PEACH"]);

    expect(repeater('.coffees li').count()).toBe(3);
  });

  it('should order coffees by type with search criteria cool, 5 items', function() {
    element('#5results').click();
      
		input('search').enter('cool');
    select('orderProp').option('Type');

    expect(repeater('.coffees li', 'Coffee List').column('coffee.name')).
        toEqual(["NESTEA PEACH", "CAPPUCCINO ICE",
                   "NESTEA LEMON"]);

    expect(repeater('.coffees li').count()).toBe(3);
  });

  it('should display coffees of all types', function() {
    select('coffeeType').option('All');

    expect(repeater('.coffees li', 'Coffee List').column('coffee.name')).
        toEqual(["AMERICANO","CAFÉ AU LAIT","CAPPUCCINO ICE","CAPPUCINO","CARAMEL LATTE MACCHIATO","CHAI TEA LATTE","CHOCOCINO","ESPRESSO","ESPRESSO BARISTA","ESPRESSO DECAF","ESPRESSO INTENSO","ESPRESSO MACCHIATO","ESPRESSO MACCHIATO DECAF","ESPRESSO RISTRETTO","GRANDE CAFFÈ CREMA","GRANDE INTENSO","GRANDE MILD","LATTE MACCHIATO","LATTE UNSWEETENED","LUNGO","LUNGO DECAF","LUNGO INTENSO","LUNGO MILD","MARRAKESH STYLE TEA","MOCHA","NESTEA LEMON","NESTEA PEACH","SKINNY CAPPUCCINO","SKINNY LATTE","VANILLA LATTE MACCHIATO"]);

    expect(repeater('.coffees li').count()).toBe(30);    
  });

  it('should display coffees of only type: chocolatey', function() {
    select('coffeeType').option('Chocolatey');

    expect(repeater('.coffees li', 'Coffee List').column('coffee.name')).
        toEqual(["CHOCOCINO", "MOCHA"]);

    expect(repeater('.coffees li').count()).toBe(2);    
  });

  it('should render coffee specific links', function() {
    input('search').enter('mocha');
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