<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="templates/header.jsp"%>
<div class="content-wrapper">
	<c:if test="${student_deleted != null}">
		<div id="danger-alert" class="alert alert-danger alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
          <h4><i class="icon fa fa-check"></i> Success!</h4>
          Successfully Removed Student.
        </div>
        <script>
        	$("#danger-alert").fadeTo(2000,500).slideUp(500,function(){
        		$("#danger-alert").slideUp(500);
        	});
        </script>
	</c:if>
	<div class="box">
		<div class="box-header">
			<h3 class="box-title">List of Students</h3>
		</div>
		<div class="box-body">
		<div class="row">
			<div class="col-sm-12">
				<table id="studentsTable"
					class="table table-bordered table-striped dataTable" role="grid">
					<thead>
						<tr>
							<th>Id</th>
							<th>Student Name</th>
							<th>Date of Birth</th>
							<th>Address</th>
							<th>Level</th>
							<th>Contact</th>
							<th>Edit</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="student" items="${students}">
							<tr>
								<td>${student.id}</td>
								<td>${student.fname} ${student.lname}</td>
								<fmt:formatDate value="${student.dob}" var="dateString" pattern="dd/MM/yyyy" />

								<td>${dateString}</td>
								<td>${student.address}</td>
								<td>${student.level}</td>
								<td>${student.telephone}</td>
								<td><a href="addStudent.htm?id=${student.id}"><i class="fa fa-edit">|</i></a> <a href="deleteStudent.htm?id=${student.id}"><i class="fa fa-trash text-danger"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>
	<script>
		$(function() {
			$('#studentsTable').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : true,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false
			});
		});
	</script>
</div>
<%@include file="templates/footer.jsp"%>