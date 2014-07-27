'use strict';
  function CoffeeListCtrl($scope, $http, $location, Restangular) {
      $scope.coffees = [];
//        $http.get('http://localhost:3000/api/coffees.json').success(function(data) {
//          $scope.coffees = data;
//        });

      Restangular.all('coffees.json').getList().then(function (coffee_list) {
          console.log(coffee_list);
          $scope.coffees = coffee_list.coffee_types;
          $scope.num_pages = Math.ceil(coffee_list.total_coffees/$scope.coffees.length);
          $scope.total_coffees = coffee_list.total_coffees;
      });

//      $scope.coffees = baseCoffees.getList().then(function(coffees) { return coffees });
	  console.log($scope.coffees);
	  $scope.orderProp = 'name';
	  $scope.coffeeType = 'All';

	  /*
	   Initialize new array to ensure that the property exists on the numberOfPages
	   function.
	  */

      $scope.goToCoffee = function (coffee_id) {
        Restangular.one('coffees', coffee_id).getList().then(function(){
          alert("I am here");
          console.log("I am here");
        });
       // $location.path(path);
      };

	  $scope.showNresults = function (n) {
		if(n===-1) {
		  return $scope.coffees.length;
		} else {
		  return n;
		}
	  };

	$scope.numberOfPages=function(itemsPerPage) {
	  if(itemsPerPage === -1) {
		itemsPerPage=$scope.coffees.length;
	  }
		return Math.ceil($scope.coffees.length/itemsPerPage);
	};

	$scope.loadRestrictions = function(searchCriteria, coffeeType, perPage, offset) {

	    var restrictions = '';

 		// Getting search 
		if(searchCriteria !== undefined && searchCriteria !== '') {
			restrictions = restrictions + 'search=' + searchCriteria;
		}

		// Results per page 
		if(perPage === null) {
			perPage = 5;
	    }
			
		if(searchCriteria) {
	        restrictions = restrictions + '&per_page=' + perPage;
	    } else {
	        restrictions = restrictions + 'per_page=' + perPage;
	    } 

		// Current position
		if(offset === null) {
			offset = 1;
		}

		restrictions = restrictions + '&offset=' + ((offset*perPage)-perPage);

		// Getting coffee type 
		if(coffeeType !== 'All'){
			restrictions = restrictions + '&filter=' + coffeeType;
		} 

		// Testing again
		Restangular.all('coffees.json?'+restrictions).getList().then(function (coffee_list) {
			$scope.coffees = coffee_list.coffee_types;
			$scope.num_pages = Math.ceil(coffee_list.total_coffees/$scope.coffees.length);
			$scope.total_coffees = coffee_list.total_coffees;
		});
  }
}
