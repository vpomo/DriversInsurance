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
    <link rel="stylesheet" type="text/css"
          href="http://localhost:8080/${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css">

    <script src="http://localhost:8080/${pageContext.request.contextPath}/resources/js/bootstrap.min.js"
            type="text/javascript"></script>
    <script src="http://localhost:8080/${pageContext.request.contextPath}/resources/js/jquery-2.1.1.js"
            type="text/javascript"></script>
    <script src="http://localhost:8080/${pageContext.request.contextPath}/resources/js/moment-with-locales.min.js"
            type="text/javascript"></script>
    <script src="http://localhost:8080/${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"
            type="text/javascript"></script>


</head>
<body>
<div class="container">
    <div ng-app="app" ng-controller="mainCtrl">

         <h2 class="h2 page-header">Работа с застрахованными водителями</h2>

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
                                <td>{{item.birthDay}}</td>
                                <td>{{item.age}}</td>
                                <td>{{item.sex}}</td>
                                <td>{{item.classDriver}}</td>
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
                        <p><label for="fio">ФИО водителя: </label><input id="fio" class="form-control" ng-model="fio"/></p>

                        <p><label for="datetimepicker6">Дата рождения: </label><input id="datetimepicker6" ng-model="birthDay" ng-change="changeBirthDay()"/></p>

                        <p><label for="age">Возраст: </label><input id="age" ng-model="age"/></p>

                        <p>
                            <b>Пол:</b>
                            <p>
                            <label>мужчина<input type="radio" name="sex" id="man" value="М" ng-model="sex" checked/></label>
                            <label>женщина<input type="radio" name="sex" id="women" value="Ж" ng-model="sex" /></label>
                            </p>
                        </p>

                        <p><label for="classDriver">Класс: </label>
                        <select id="classDriver" ng-model="classDriver" ng-options="opt as opt for opt in classDriversArray" ng-init="selected='3'"></select>

                        </p>
                        <br><br>
                        <button type="button" class="btn btn-warning" ng-click="saveDriver()">Записать в БД</button>
                        <br>

                    </div>
                </div>
            </aside>
        </div>

        <div class="row">
            <div class="panel panel-info">
                <div class="panel-heading">Поиск водителей в БД:</div>
                <div class="panel-body">
                    <div class="col-md-4 col-lg-6">
                        <p> Пожалуйста, выберите из списка водителя: </p>
                        <br>
                        <dropdown-list data-items-list="itemsList" data-search-result="result"
                               data-placeholder="ФИО водителя"></dropdown-list>
                    </div>
                    <div class="col-md-4 col-lg-3">
                        <br>
                        <button type="button" class="btn btn-primary" ng-click="addItem(result)">Добавить в список</button>
                        <br>
                    </div>
                    <div class="col-md-4 col-lg-3">
                        <br>
                        <button type="button" class="btn btn-success" ng-click="load()">Синхронизация c БД</button>
                        <br>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="http://localhost:8080/${pageContext.request.contextPath}/resources/js/angular.min.js"
        type="text/javascript"></script>

<script type="text/javascript">
    $(function () {
              $('#datetimepicker6').datetimepicker(
              {pickTime: false, viewMode: 'years', language: 'ru'}
        );
    });
</script>
<script>
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
            var req = {
                method: 'POST',
                url: 'http://localhost:8080/add',
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
</script>
</body>
</html>