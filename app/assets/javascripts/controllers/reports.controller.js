angular.module('Tracker')

.controller('ReportsController', function ($scope, WufooService) {

  WufooService.getAllForms().then( function (response) {
    $scope.reports = response.data;
  });


})


.controller('ReportsSingle', function ($scope, WufooService, $stateParams) {

  var user = $('#current-user').val();

  $scope.title = $stateParams.formId;

  WufooService.getEntries($stateParams.formId, user).then( function (response) {
    $scope.entries = response.data;
    console.log($scope.entries);
  });


})