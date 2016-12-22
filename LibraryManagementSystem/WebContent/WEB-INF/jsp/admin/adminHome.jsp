
<%@include file="templates/header.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Library Administrator</small>
      </h1>
      <!-- <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol> -->
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Main row -->
      <div class="row">
        <div class="col-md-4">
        <!-- /.info-box -->
          <div class="info-box bg-green">
            <span class="info-box-icon"><i style="font-size:70px;" class="fa fa-book"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Total Books</span>
              <span class="info-box-number">${totalBooks}</span>

              <div class="progress">
                <div class="progress-bar" style="width: 100%"></div>
              </div>
                  <span class="progress-description">
                    <a style="color:white;" href="viewBooks.htm" >view All</a>
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          </div>
          <div class="col-md-4">
          <!-- /.info-box -->
          <div class="info-box bg-aqua">
            <span class="info-box-icon"><i style="font-size:70px;" class="fa fa-users"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Total Students</span>
              <span class="info-box-number">${totalStudents}</span>

              <div class="progress">
                <div class="progress-bar" style="width: 100%"></div>
              </div>
                  <span class="progress-description">
                    <a style="color:white;" href="viewStudents.htm" >view All</a>
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          </div>
          <div class="col-md-4">
          <!-- /.info-box -->
          <div class="info-box bg-red">
            <span class="info-box-icon"><i class="fa fa-reply"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Lends</span>
              <span class="info-box-number">${totalLends}</span>

              <div class="progress">
                <div class="progress-bar" style="width: 100%"></div>
              </div>
                  <span class="progress-description">
                    <a style="color:white;" href="viewLends.htm" >view All</a>
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          </div>
          <div class="col-md-6">
          <!-- /.info-box -->
			<div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Recently Added Books</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <ul class="products-list product-list-in-box">
              <c:forEach var="book" items="${books}">
              	<li class="item">
                  <div class="product-img">
                    <i style="font-size:50px;" class="fa fa-book text-success"></i>
                  </div>
                  <div class="product-info">
                    <a href="javascript:void(0)" class="text-success product-title">${book.name}
                      <span class="label label-warning pull-right">${book.genere }</span></a>
                        <span class="product-description">
                          ${book.publication }
                        </span>
                  </div>
                </li>
              </c:forEach>
              </ul>
            </div>
            <!-- /.box-body -->
            <div class="box-footer text-center">
              <a href="viewBooks.htm" class="uppercase">View All Books</a>
            </div>
            <!-- /.box-footer -->
          </div>
          
          </div>
          <!-- /.box -->
			<div class="col-md-6">
          <!-- PRODUCT LIST -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Recently Registered Students</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <ul class="products-list product-list-in-box">
              <c:forEach var="student" items="${students}">
                <li class="item">
                  <div class="product-img">
                    <i style="font-size:50px;" class="fa fa-user text-primary"></i>
                  </div>
                  <div class="product-info">
                    <a href="javascript:void(0)" class="product-title">${student.fname } ${student.lname }
                      <span class="label label-warning pull-right"></span></a>
                        <span class="product-description">
                          ${student.studentLevel }
                        </span>
                  </div>
                </li>
                </c:forEach>
                
              </ul>
            </div>
            <!-- /.box-body -->
            <div class="box-footer text-center">
              <a href="viewStudents.htm" class="uppercase">View All Students</a>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<%@include file="templates/footer.jsp" %>
  