'use strict';
function CreateCtrl($scope, $location, $http, Restangular) {
  $scope.coffees = [];

  $scope.clearCoffee = function(){
      $scope.coffee.name = '';
      $scope.coffee.type_of_coffee = '';
      $scope.coffee.temp = '';
      $scope.coffee.caffeinated = 'yes';
      $scope.coffee.basicInfo = '';
      $scope.coffee.price = '';      
  };

  $scope.saveCoffee = function(){
    console.log($scope.coffee);
      Restangular.all('coffees.json').post($scope.coffee);
      $location.path('/coffees');
      $scope.clearCoffee();
      };
      // $http.post('api/coffees.json',$scope.coffee).success(function(data) {
      // });
 
      
 

  $scope.cancel = function(){
    //  $location.path('/coffees');
    };
}




