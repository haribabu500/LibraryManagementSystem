<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="templates/header.jsp" %>
<script>
	$(".sidebar-menu li").removeClass("active");
	$("#lendedBooks_menu").addClass("active");
</script>
<div class="content-wrapper">
<div class="box">
		<div class="box-header">
			<h3 class="box-title">Books Lended</h3>
		</div>
		<div class="box-body">
			<div class="row">
				<div class="col-sm-12">
<table id="lendsTable" class="table table-bordered table-striped dataTable">
	<thead>
		<tr>
			<th>Book Name</th>
			<th>Issued Date</th>
			<th>Status</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="lend" items="${lends}">
			<tr>
				<td>${lend.book.name}</td>
				<fmt:formatDate value="${lend.lendDate}" var="dateString" pattern="dd/MM/yyyy" />
				<td>${dateString}</td>
				<fmt:formatDate value="${lend.returnDate}" var="dateString2" pattern="dd/MM/yyyy" />
				<td>${lend.status}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script>
	$(function() {
		$('#lendsTable').DataTable({
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
</div>
</div>
</div>
</div>
<%@include file="templates/footer.jsp" %>