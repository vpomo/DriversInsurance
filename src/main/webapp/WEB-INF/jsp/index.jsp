<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

    <link rel="stylesheet" type="text/css"
          href="http://localhost:8080/${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" type="text/css"
          href="http://localhost:8080/${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="http://localhost:8080/${pageContext.request.contextPath}/resources/css/bootstrap-theme.min.css">

    <script src="http://localhost:8080/${pageContext.request.contextPath}/resources/js/bootstrap.min.js"
            type="text/javascript"></script>
    <script src="http://localhost:8080/${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"
            type="text/javascript"></script>

</head>
<body>
<div class="container">
    <div ng-app="app" ng-controller="mainCtrl">

<h2 class="h2 page-header">Работа с застрахованными водителями</h2>


<p> Пожалуйста, выберите из списка водителя: </p>
<br>

<dropdown-list data-items-list="itemsList" data-search-result="result"
               data-placeholder="ФИО водителя"></dropdown-list>
<br>
<button type="button" class="btn btn-primary" ng-click="addItem(result)">Добавить</button>
<br>
<br>
<br>
        <button type="button" class="btn btn-success" ng-click="load()">Синхронизация ...</button>


<div class="row">
    <article class="col-md-8 col-lg-9">
        <div class="panel panel-info">
            <div class="panel-heading">Список отобранных водителей:</div>
            <div class="panel-body">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>ФИО</th>
                        <th>Дата рождения</th>
                        <th>Возраст</th>
                        <th>Пол</th>
                        <th>Класс</th>
                        <th>Редактировать*</th>
                        <th>Удалить*</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="item in list.items">
                        <td>{{item.fio}}</td>
                        <td>{{item.birthday}}</td>
                        <td>{{item.age}}</td>
                        <td>{{item.sex}}</td>
                        <td>{{item.classdriver}}</td>
                        <td>
                            <button type="button" class="btn btn-primary btn-xs" ng-click="editItem(item)">
                                Редактировать
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-danger btn-xs" ng-click="remove($index);">
                                Удалить
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </article>
    <aside class="col-md-4 col-lg-3">
        <div class="panel panel-danger">
            <div class="panel-heading"><p>Редактирование данных о водителе</p></div>
            <div class="panel-body">
                <p><label for="fio">ФИО водителя: </label><input id="fio" ng-model="fio"/></p>

                <p><label for="birthday">Дата рождения: </label><input id="birthday" ng-model="birthday"/></p>

                <p><label for="age">Возраст: </label><input id="age" ng-model="age"/></p>

                <p><label for="sex">Пол: </label><input id="sex" ng-model="sex"/></p>

                <p><label for="classdriver">Класс: </label><input id="classdriver" ng-model="classdriver"/></p>
                <br>
                <br>
                <button type="button" class="btn btn-warning" ng-click="saveDriver()">Записать в БД</button>
                <br>

            </div>
        </div>
    </aside>
</div>





</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.11/angular.min.js"></script>
<script>
    var model = {
        items: [
            {
                fio: "Самсонов Игорь Юрьевич",
                birthday: "19.04.1978",
                age: 35,
                sex: "М",
                classdriver: 4,
                buttonedit: 2,
                buttondel: 1
            },
            {
                fio: "Петров Кирилл Павлович",
                birthday: "05.08.1966",
                age: 35,
                sex: "М",
                classdriver: 4,
                buttonedit: 2,
                buttondel: 1
            },
            {
                fio: "Сидоров Андрей Игоревич",
                birthday: "23.09.1985",
                age: 35,
                sex: "М",
                classdriver: 4,
                buttonedit: 2,
                buttondel: 1
            },
            {
                fio: "Козлов Александр Александрович",
                birthday: "14.06.1978",
                age: 35,
                sex: "М",
                classdriver: 4,
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
                $http({method: 'GET', url: 'http://localhost:8080/restful/getall/'}).
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

        $scope.addItem = function (result) {
            $scope.list.items.push({
                fio: result.fio,
                birthday: result.birthday,
                age: result.age,
                sex: result.sex,
                classdriver: result.classdriver
            });

        }
        $scope.editItem = function (item) {
            $scope.fio = item.fio;
            $scope.birthday = item.birthday;
            $scope.age = item.age;
            $scope.sex = item.sex;
            $scope.classdriver = item.classdriver;
        }

        $scope.remove = function (index) {
            $scope.list.items.splice(index, 1);
        };

        $scope.saveDriver = function () {

            $scope.driver = {
                fio: $scope.fio,
                birthday: $scope.birthday,
                age: $scope.age,
                sex: $scope.sex,
                classdriver: $scope.classdriver
            }
            $scope.resjson = angular.toJson($scope.driver);
            var req = {
                method: 'POST',
                url: 'http://localhost:8080/add',
                headers: {'Content-Type': 'application/json; charset: UTF-8'},
                //data:  'angular.toJson($scope.driver)'
                data: angular.toJson($scope.driver)
            }

            $http(req).success(function (data) {
                data = angular.toJson($scope.driver);
            })
                    .error(function (data, status, headers, config) {
                        //  Do some error handling here
                    });
            console.log(angular.toJson($scope.driver))
            $scope.load();
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
                    template: '<input type="text" ng-model="search" placeholder="{{ placeholder }}" />' +
                    '<div class="search-item-list"><ul class="list">' +
                    '<li ng-repeat="item in itemsList | filter:search" ng-click="chooseItem( item )">{{ item.fio }}' +
                    '<span class="amount">{{ item.birthday }}</span>' +
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
</script>
</body>
</html>