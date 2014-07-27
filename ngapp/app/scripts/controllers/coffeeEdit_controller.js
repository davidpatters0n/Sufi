'use strict';
function EditCtrl($scope, $location, $http, Restangular) {
  $scope.coffees = [];

  $scope.updateCoffee = function(coffee_id){
    Restangular.one('coffees', coffee_id).getList().put().then(function(){
		$location.path('/coffees');
	});
  };

  $scope.deleteCoffee = function(coffee_id){
	Restangular.one('coffees', coffee_id).getList().remove().then(function(){
		$location.path('/coffees');
	});
  };
}