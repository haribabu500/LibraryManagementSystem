
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="templates/header.jsp"%>
<div class="content-wrapper">
	<c:if test="${student_saved != null}">
		<div id="success-alert" class="alert alert-success alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
          <h4><i class="icon fa fa-check"></i> Success!</h4>
          Successfully saved student.
        </div>
        <script>
        	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
        		$("#success-alert").slideUp(500);
        	});
        </script>
	</c:if>
	<div class="box box-info">
		<div class="box-header with-border">
			<h3 class="box-title">${mode} Student</h3>
		</div>
		<form:form modelAttribute="student" id="add_student_form" class="form-horizontal" action="addStudentAction.htm">
			<form:hidden path="id"/>
			<div class="box-body">
				<div class="form-group">
					<label class="col-sm-2 control-label">First Name</label>
					<div class="col-sm-10">
						<form:input path="fname" class="form-control"
							placeholder="First Name" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Last Name</label>
					<div class="col-sm-10">
						<form:input path="lname" class="form-control"
							placeholder="Last Name" />
					</div>
				</div>
				<script src="/LibraryManagementSystem/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
				<div class="form-group">
					<label class="col-sm-2 control-label">Date Of Birth</label>
					<div class="col-sm-10">
						<form:input id="datepicker" path="dob" class="form-control" placeholder="Date Of Birth"/>
					</div>
				</div>
				<script type="text/javascript">
				 $('#datepicker').datepicker({
				      autoclose: true,
				      format:'dd/mm/yyyy'
				    });
				</script>
				<div class="form-group">
					<label class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<form:input path="address" class="form-control" placeholder="Address" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Level</label>
					<div class="col-sm-10">
						<form:input path="level" class="form-control" placeholder="Level"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Contact</label>
					<div class="col-sm-10">
						<form:input path="telephone" class="form-control" placeholder="Level"/>
					</div>
				</div>
				
				
			</div>
			<div class="box-footer">
				<div class="col-sm-2"></div>
				<div class="col-sm-10">
					<button type="submit" class="btn btn-info">${mode} Student</button>
					<button type="reset" class="btn btn-default">Cancel</button>
				</div>
			</div>
		</form:form>
	</div>
</div>
<%@include file="templates/footer.jsp"%>
