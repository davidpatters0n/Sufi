'use strict';

var sufiApp = angular.module('sufiApp', ['sufiFilters','restangular','pascalprecht.translate']);

sufiApp.config(function($routeProvider, $httpProvider, $locationProvider, RestangularProvider, $translateProvider) {
      $routeProvider
      .when('/coffees/create', {
        templateUrl: 'views/coffee-create.html',
        controller: 'CreateCtrl'
      })
      .when('/coffees/:coffeeId', {
        templateUrl: 'views/coffee-detail.html',
        controller: 'CoffeeDetailCtrl'
      })
      .when('/coffees', {
        templateUrl: 'views/coffee-list.html',
        controller: 'CoffeeListCtrl'
      })
      
      .otherwise({
        redirectTo: '/coffees'
      });
      delete $httpProvider.defaults.headers.common["X-Requested-With"];
      $locationProvider.html5Mode(false);
      RestangularProvider.setBaseUrl('http://localhost:3000/api');

      $translateProvider.useStaticFilesLoader({
        prefix: '/languages/',
        suffix: '.json'
      });
     
      $translateProvider.preferredLanguage('en');
    
    });


/*Not doing this like this:
 $translateProvider.translations('en', {
          HEADLINE: 'Sufi Coffee Ordering Service!',
          INTRO_TEXT: 'And it has i18n support!',
          BUTTON_TEXT_EN: 'english',
          BUTTON_TEXT_DE: 'german'
      })
        .translations('de', {
          HEADLINE: 'Sufi Coffee Ordering Service (German Tran)!',
          INTRO_TEXT: 'Und sie untersützt mehrere Sprachen!',
          BUTTON_TEXT_EN: 'englisch',
          BUTTON_TEXT_DE: 'deutsch'
      });
*/