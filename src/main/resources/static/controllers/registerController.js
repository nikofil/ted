var registerController = tedRouter.controller('registerController', function($scope, $http) {
    $scope.user = {};
    $scope.doRegister = function() {
        $http.post('/auth/register', $scope.user).success((res) => {
            alert(res.error || "Success!");
        }).error(console.log.bind(console));
    };
});