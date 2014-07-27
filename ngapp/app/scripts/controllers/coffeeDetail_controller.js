'use strict';

function CoffeeDetailCtrl($scope, $routeParams, $http, Restangular) {
   Restangular.all('coffees.json').getList().then(function (coffee_list) {
        $scope.coffees = coffee_list.coffee_types;
      $scope.coffee = {};
      for ( var n = 0; n < $scope.coffees.length; n++ ) {
        if ($scope.coffees[n].id == $routeParams.coffeeId) {
          $scope.coffee = $scope.coffees[n];
          break;
        }
      }
    });
}

sufiApp.directive('coffeeinfo', function() {
  return {
    restrict: 'E',
    template: '<h1>{{coffee.name}}</h1>' +
      '<p>TYPE: {{coffee.type_of_coffee}}</p>' +
      '<p>TEMPERATURE: {{coffee.temp}}</p>' +
      '<p>CAFFEINATED: {{coffee.caffeinated}}</p>' +
      '<p>FURTHER INFORMATION: {{coffee.basicInfo}}</p>'+
      '<p>PRICE: {{coffee.price}}</p>'
  }
})
