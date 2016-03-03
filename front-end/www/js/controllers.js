angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope) {})

//.controller('moodCtrl', function($scope, ArticlesService) {
  //$scope.articles = ArticlesService.query()
  //console.log($scope.articles)
//})

.controller('diaryCtrl', function($scope, $stateParams, DiaryStore) {
	DiaryStore.initDB();
	DiaryStore.insertEntry("diary entry");
	$scope.settings = {
    enableFriends: true
  };

})


.controller('publicFeedCtrl', function($scope, PublicFeed) {
	  $scope.articles = PublicFeed.query()
})




.controller('moodCtrl', function($scope, $timeout, $ionicSlideBoxDelegate, Mood) {
    $scope.quotes = Mood.query()

    $ionicSlideBoxDelegate.enableSlide(false);
    $timeout(function () {
      $ionicSlideBoxDelegate.update();
    }, 300);

    $scope.lockSlide = function () {
        $ionicSlideBoxDelegate.enableSlide( false );
    }

    $scope.nextSlide = function() {
      $ionicSlideBoxDelegate.next();
    }
    $scope.previousSlide = function() {
      $ionicSlideBoxDelegate.previous();
    }
})


/*
.directive('preventDrag', function($ionicGesture, $ionicSlideBoxDelegate) {
  return {
    restrict :  'A',

    link : function(scope, elem, attrs, e) {

      var reportEvent = function (e){

        if  (e.target.tagName.toLowerCase() == 'input'){
          $ionicSlideBoxDelegate.enableSlide(false);
        }
        else{
          $ionicSlideBoxDelegate.enableSlide(true);
        }
      };


      $ionicGesture.on('drag', reportEvent, elem);
    }
  }})
*/


.controller('pubFeedDeetsCtrl', function($scope, $stateParams, Feed) {
  $scope.fed = Feed.get($stateParams.fedId);
})

.controller('NavCtrl', function($scope, $ionicSideMenuDelegate) {
  $scope.showMenu = function () {
    $ionicSideMenuDelegate.toggleLeft();
  };
})
