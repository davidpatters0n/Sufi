'use strict';

/** These tests all relate to the loading of the coffees data */
describe('Data extracted from Rails', function() {
  it('should pull JSON coffee data from Rails API', function() {
  	// Initialize the controller and a mock scope
  beforeEach(inject(function($controller, $rootScope, $httpBackend, defaultJSON) {
    // Set up the expected feed data
    httpBackend = $httpBackend;
   $httpBackend.whenJSONP(api/coffees.json).respond(defualtJSON);

    scope = $rootScope.$new();
    MainCtrl = $controller('MainCtrl', {
      $scope: scope
    });
  }));
  });
});