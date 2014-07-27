'use strict';

/** These tests relate to the creation of a new coffee */
 describe('Coffee create view', function() {

   	 it('should navigate to the create coffees page', function(){
    browser().navigateTo('../../app/index.html');
   	 	element('#createCoffee').click();
   	  expect(browser().location().href()).toEqual('../../app/index.html#/coffees/create');

   	});

    beforeEach(function() {
      	browser().navigateTo('../../app/index.html#/coffees/create');
    });

  	it('should not add a new coffee to the list due to missing inputs', function() {
    	input('coffee.name').enter('Coffee Name');
      	element('#saveCoffee').click();
     
   		browser().navigateTo('../../app/index.html');
    	element('#allresults').click();
      	expect(repeater('.coffees li').count()).toBe(30);
  	});


    it('should add a new coffee to the list', function() {
    	input('coffee.name').enter('Coffee Name');
      	input('coffee.type_of_coffee').enter('Coffee Type');
      	input('coffee.temp').enter('20');
      	input('coffee.basicInfo').enter('Coffee Info');
      	input('coffee.price').enter('20.00');
      	element('#saveCoffee').click();
     
   		browser().navigateTo('../../app/index.html');
    	element('#allresults').click();
      	expect(repeater('.coffees li').count()).toBe(31);
  	});
});