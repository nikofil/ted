var loginController = tedRouter.controller('loginController', function($scope, $http) {
    $scope.user = {};
    $scope.doLogin = function() {
        $http.post('/auth/login', $scope.user).success((res) => {
            alert(res.error || "Success!");
        }).error(console.log.bind(console));
    };
});