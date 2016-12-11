<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${username == null}">
	<script>
		location.href='../login.htm'
	</script>
		
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Library Management System</title>
<link href="/LibraryManagementSystem/resources/css/bootstrap.css">
<link href="/LibraryManagementSystem/resources/css/bootstrap.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="/LibraryManagementSystem/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <link rel="stylesheet" href="/LibraryManagementSystem/resources/css/AdminLTE.min.css">
  <link rel="stylesheet" href="/LibraryManagementSystem/resources/css/skins/_all-skins.min.css">
  
   <link rel="stylesheet" href="/LibraryManagementSystem/resources/font-awesome-4.6.3/css/font-awesome.css">
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> -->
  <link rel="stylesheet" href="/LibraryManagementSystem/resources/plugins/datatables/dataTables.bootstrap.css">
  <!-- jQuery 2.2.3 -->
<script src="/LibraryManagementSystem/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/LibraryManagementSystem/resources/bootstrap/js/bootstrap.min.js"></script>
  
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>LMS</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Library</b>Management</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          
          <!-- Notifications: style can be found in dropdown.less -->
          
          <!-- Tasks: style can be found in dropdown.less -->
          
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="/LibraryManagementSystem/resources/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">${user.firstname } ${user.lastname }</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="/LibraryManagementSystem/resources/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  ${user.firstname } ${user.lastname }
                  <small>Student</small>
                </p>
              </li>
              <!-- Menu Body -->
              <!-- <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                /.row
              </li> -->
              <!-- Menu Footer-->
              <li class="user-footer">
               <!--  <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div> -->
                <div class="text-center">
                  <a href="logout.htm" class="btn btn-danger btn-flat">Log out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          
        </ul>
      </div>

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/LibraryManagementSystem/resources/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${user.firstname } ${user.lastname }</p>
          <!-- <a href="#"><i class="fa fa-circle text-success"></i> Online</a> -->
        </div>
      </div>
      <!-- search form -->
      <!-- <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form> -->
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        
        
        <li id="dashboard_menu" class="active"><a href="studentDashboard.htm"><i class="fa fa-dashboard"></i><span>Dashboard</span></a></li>
        <li id="pendingBooks_menu"><a href="studentLends.htm?id=${user.id}"><i class="fa fa-history"></i> <span>Pending Books</span></a></li>
        <li id="lendedBooks_menu"><a href="studentAllLends.htm?id=${user.id}"><i class="fa fa-book"></i> <span>Books Lended</span></a></li>
        
        
        <hr>
        <li><a href="logout.htm"><i class="fa fa-lock"></i> <span>Log out</span></a></li>
        
        <!-- <li class="header">LABELS</li>
        <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li> -->
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
