var model = {
    items: [
        {
            fio: "Самсонов Игорь Юрьевич",
            birthDay: "19.04.1978",
            age: 37,
            sex: "М",
            classDriver: 2,
            buttonedit: 2,
            buttondel: 1
        },
        {
            fio: "Петров Кирилл Павлович",
            birthDay: "05.08.1966",
            age: 49,
            sex: "М",
            classDriver: 1,
            buttonedit: 2,
            buttondel: 1
        },
        {
            fio: "Сидоров Андрей Игоревич",
            birthDay: "23.09.1985",
            age: 30,
            sex: "М",
            classDriver: 3,
            buttonedit: 2,
            buttondel: 1
        },
        {
            fio: "Козлов Александр Александрович",
            birthDay: "19.12.1969",
            age: 45,
            sex: "М",
            classDriver: 1,
            buttonedit: 2,
            buttondel: 1
        }
    ]
};

var app = angular.module('app', [])
app.factory('dataService', function ($http, $q) {
    return {
        getData: function () {
            var deferred = $q.defer();
            var getAllURL = "http://" + window.location.host + "/getall";
            $http({method: 'GET', url: getAllURL}).
                success(function (data, status, headers, config) {
                    deferred.resolve(data);
                }).
                error(function (data, status, headers, config) {
                    deferred.reject(status);
                });

            return deferred.promise;
        }
    }
});

app.controller('mainCtrl', function ($scope, $http, dataService) {
    /*
     * Создаем список элементов
     */
    var promiseObj = dataService.getData();
    promiseObj.then(function (value) {
        $scope.itemsList = value;
    });


    $scope.load = function () {
        var promiseObj = dataService.getData();
        promiseObj.then(function (value) {
            $scope.itemsList = value;
        });
    }

    $scope.list = model;
    $scope.classDriversArray = [1,2,3];

    $scope.addItem = function (result) {
        $scope.list.items.push({
            fio: result.fio,
            birthDay: result.birthDay,
            age: result.age,
            sex: result.sex,
            classDriver: result.classDriver
        });

    }
    $scope.editItem = function (item) {
        var currentDate = moment().format('YYYY-MM-DD');
        var oldDate = moment(item.birthDay, ["DD.MM.YYYY","YYYY-MM-DD"]);
        console.log($scope.birthDay);

        $scope.fio = item.fio;
        $scope.birthDay = item.birthDay;
        $scope.age = (-1)*oldDate.diff(currentDate, 'years');
        $scope.sex = item.sex;
        $scope.classDriver = item.classDriver;
    }

    $scope.changeBirthDay = function () {
        var currentDate = moment().format('YYYY-MM-DD');
        var oldDate = moment($scope.birthDay, ["DD.MM.YYYY","YYYY-MM-DD"]);
        $scope.age = (-1)*oldDate.diff(currentDate, 'years');
    }

    $scope.remove = function (index) {
        $scope.list.items.splice(index, 1);
    };

    $scope.saveDriver = function () {

        $scope.driver = {
            fio: $scope.fio,
            birthDay: $scope.birthDay,
            age: $scope.age,
            sex: $scope.sex,
            classDriver: $scope.classDriver
        }

        $scope.resjson = angular.toJson($scope.driver);
        var addURL = "http://" + window.location.host + "/add";
        var req = {
            method: 'POST',
            url: addURL,
            headers: {'Content-Type': 'application/json; charset: UTF-8'},
            data: angular.toJson($scope.driver)
        }

        $http(req).success(function (data) {
            data = angular.toJson($scope.driver);
        })
            .error(function (data, status, headers, config) {
                //  Do some error handling here
            });
        console.log(angular.toJson($scope.driver))

        var promiseObj = dataService.getData();
        promiseObj.then(function (value) {
            $scope.itemsList = value;
        });

    };

})
    /*
     * Объявляем директиву, которая будет создавать сам список
     */
    .directive('dropdownList', function ($timeout) {

        return {
            restrict: 'E',
            scope: {
                itemsList: '=',
                searchResult: '=',
                placeholder: '@'
            },
            template: '<input type="text" size="15" class="form-control" ng-model="search" placeholder="{{ placeholder }}" />' +
            '<div class="search-item-list"><ul class="list">' +
            '<li ng-repeat="item in itemsList | filter:search" ng-click="chooseItem( item )">{{ item.fio }}' +
            '<span class="amount">{{ item.birthDay }}</span>' +
            '</li>' +
            '</ul></div>',
            link: function (scope, el, attr) {

                var $listContainer = angular.element(el[0].querySelectorAll('.search-item-list')[0]);
                el.find('input').bind('focus', function () {
                    $listContainer.addClass('show');
                });
                el.find('input').bind('blur', function () {
                    /*
                     * 'blur' реагирует быстрее чем ng-click,
                     * поэтому без $timeout chooseItem не успеет поймать item до того, как лист исчезнет
                     */
                    $timeout(function () {
                        $listContainer.removeClass('show')
                    }, 200);
                });

                scope.chooseItem = function (item) {
                    scope.search = item.fio;
                    scope.searchResult = item;
                    $listContainer.removeClass('show');
                }
            }
        }
    });
