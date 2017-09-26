<%-- 
    Document   : layout
    Created on : Aug 14, 2017, 5:41:32 PM
    Author     : vtz_it_van
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<% request.setAttribute("contextPath", request.getContextPath());%>
<html>
<!--    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>
        <s:set var="title">
            <tiles:insertAttribute name="title" />
        </s:set>
        <s:text name="%{#title}"/>
    </title>

    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.css">

    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap-datetimepicker.min.css">

    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap-datetimepicker.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="${contextPath}/resources/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${contextPath}/resources/font-ionicons/css/ionicons.min.css">

    <!-- DataTables -->
    <link rel="stylesheet" href="${contextPath}/resources/plugins/datatables/dataTables.bootstrap.css">

    <!-- Theme style -->
    <link rel="stylesheet" href="${contextPath}/resources/admin-lte2/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${contextPath}/resources/admin-lte2/css/skins/_all-skins.min.css">

    <!-- iCheck -->
    <link rel="stylesheet" href="${contextPath}/resources/plugins/iCheck/flat/blue.css">
    
</head>

    <body>
<!--        <h1>Hello World!</h1>-->
<div class="wrapper">
    <header class="main-header">
        <nav class="navbar navbar-static-top">
          <div class="container">
            <tiles:insertTemplate template="/layout/header.jsp" />
          </div><!-- /.container-fluid -->
        </nav>
      </header>

      <!-- Full Width Column -->
      <div class="content-wrapper">
        <div class="container">
          <tiles:insertAttribute name="content" />
        </div><!-- /.container -->
      </div><!-- /.content-wrapper -->

      <footer class="main-footer">
        <div class="container">
          <tiles:insertTemplate template="/layout/footer.jsp" />
        </div><!-- /.container -->
      </footer>
</div>
        <!-- jQuery 2.1.4 -->
    <script src="${contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

    <script src="${contextPath}/resources/plugins/jquery-loading-overlay/loadingoverlay.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${contextPath}/resources/bootstrap/js/bootstrap-datetimepicker.js"></script>

    <!-- InputMask -->
    <script src="${contextPath}/resources/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="${contextPath}/resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="${contextPath}/resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <!-- SlimScroll -->
    <script src="${contextPath}/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="${contextPath}/resources/plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${contextPath}/resources/admin-lte2/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${contextPath}/resources/admin-lte2/js/right-sidebar.js"></script>

    <script src="${contextPath}/resources/scripts/ValidateUtils.js"></script>
    <!-- ########################## JS CONTENT FOLLOWING PAGE ########################### -->
    <tiles:insertAttribute name="jsContent" />
    </body>
</html>
