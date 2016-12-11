<%@include file="templates/header.jsp" %>
<div class="content-wrapper">

<section class="content-header">
  <h1>
    Student Dashboard
    <small>${user.firstname } - ${user.lastname } (${studentId })</small>
  </h1>
  
</section>
<section class="content">
	<div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i style="font-size:70px;" class="fa fa-history"></i></span>

            <div class="info-box-content">
              <span class="info-box-text"><a class="text-primary" href="studentLends.htm">Pending Books</a></span>
              <span class="info-box-number">${remainingBooks }</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i style="font-size:70px;" class="fa fa-book"></i></span>

            <div class="info-box-content">
              <span class="info-box-text"><a class="text-success" href="studentAllLends.htm">Books Lended</a></span>
              <span class="info-box-number">${totalBooks}</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        
        <!-- /.col -->
        
        <!-- /.col -->
      </div>
</section>
</div>
<%@include file="templates/footer.jsp" %>