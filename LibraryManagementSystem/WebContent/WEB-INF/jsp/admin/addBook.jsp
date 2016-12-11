<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="templates/header.jsp"%>
<script>
	$(".sidebar-menu li").removeClass("active");
	$("#menu_addBook").addClass("active");
</script>
<div class="content-wrapper">
	<c:if test="${book_saved != null}">
		<div id="success-alert" class="alert alert-success alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
          <h4><i class="icon fa fa-check"></i> Success!</h4>
          Successfully saved Book.
        </div>
        <script>
        	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
        		$("#success-alert").slideUp(500);
        	});
        </script>
	</c:if>
	<div class="box box-info">
		<div class="box-header with-border">
			<h3 class="box-title">${mode} Book</h3>
		</div>
		<form:form modelAttribute="book" id="add_book_form" class="form-horizontal" action="addBookAction.htm">
			<form:hidden path="id"/>
			<div class="box-body">
				<div class="form-group">
					<label class="col-sm-2 control-label">Book Name</label>
					<div class="col-sm-10">
						<form:input path="name" class="form-control"
							placeholder="Book Name" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Author</label>
					<div class="col-sm-10">
						<form:input path="author" class="form-control"
							placeholder="Author" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Genre</label>
					<div class="col-sm-10">
						<form:input path="genere" class="form-control"
							placeholder="Genre" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">ISBN</label>
					<div class="col-sm-10">
						<form:input path="isbn" class="form-control" placeholder="ISBN" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Publication</label>
					<div class="col-sm-10">
						<form:input path="publication" class="form-control" placeholder="Publication"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Quantity</label>
					<div class="col-sm-10">
						<form:input path="quantity" class="form-control" placeholder="Quantity"/>
					</div>
				</div>
			</div>
			<div class="box-footer">
				<div class="col-sm-2"></div>
				<div class="col-sm-10">
					<button type="submit" class="btn btn-info">${mode} Book</button>
					<button type="reset" class="btn btn-default">Cancel</button>
				</div>
			</div>
		</form:form>
	</div>
</div>
<%@include file="templates/footer.jsp"%>
