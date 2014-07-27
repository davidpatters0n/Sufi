angular.module('sufiFilters', []).filter('startFrom', function() {
    return function(input, start) {  // 'input' is the input to the filter, in our case $coffees
        start = +start; //parse to int. start is the number we pass to the startFrom filter
        return input.slice(start); // Only show the last part of the array, from the index specified to the end. The other filters sort the rest out
    };
        //REVIEW: real life scenario performance?
}
);