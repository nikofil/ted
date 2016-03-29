var tedRouter = angular.module('tedRouter', ['ui.router', 'ngResource']);

tedRouter.config(function($stateProvider, $urlRouterProvider) {
    
    $urlRouterProvider.otherwise('/home');
    
    $stateProvider
        
        .state('home', {
            url: '/home',
            templateUrl: 'views/home.html'
        })
        .state('login', {
            url: '/login',
            controller: 'loginController',
            templateUrl: 'views/login.html'
        })
        .state('register', {
            url: '/register',
            controller: 'registerController',
            templateUrl: 'views/register.html'
        });
        
});