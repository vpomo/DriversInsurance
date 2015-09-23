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
                                    <button type="button" class="btn btn-primary btn-xs" ng-click="editItem(item);remove($index)" >
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
<script src="http://localhost:8080/${pageContext.request.contextPath}/resources/js/app.js"
        type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
              $('#datetimepicker6').datetimepicker(
              {pickTime: false, viewMode: 'years', language: 'ru'}
        );
    });
</script>

</body>
</html>