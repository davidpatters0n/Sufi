sufiApp.controller('TranslateCtrl', ['$translate', '$scope', function ($translate, $scope) {
    $scope.changeLanguage = function (langKey) {
        $translate.uses(langKey);
    };
}]);