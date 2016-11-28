<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="templates/header.jsp"%>
<div class="content-wrapper">
	
	<div class="box">
		<div class="box-header">
			<h3 class="box-title">List of Lends</h3>
		</div>
		<div class="box-body">
		<div class="row">
			<div class="col-sm-12">
				<table id="booksTable"
					class="table table-bordered table-striped dataTable" role="grid">
					<thead>
						<tr>
							<th>Student</th>
							<th>Book</th>
							<th>Borrowed Date</th>
							<th>Return Date</th>
							<th>Fine</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="lend" items="${lends}">
							<tr>
								<td>${lend.student.fname} ${lend.student.lname}</td>
								<td>${lend.book.name}</td>
								<fmt:formatDate value="${lend.lendDate}" var="dateString" pattern="dd-MMM-yyyy" />
								<td>${dateString}</td>
								<fmt:formatDate value="${lend.returnDate}" var="dateString2" pattern="dd-MMM-yyyy" />
								<td>${dateString2}</td>
								<td>${lend.fine}</td>
								<td>
									<button class="btn btn-primary">Return</button>
									<button class="btn btn-danger">Lost</button>
								</td>
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
			$('#booksTable').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : true,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false
			});
		});
		function lendBook(id){
			location.href="lendBook.htm?id="+id;
		}
	</script>
</div>
<%@include file="templates/footer.jsp"%>