<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="templates/header.jsp"%>
<script>
	$(".sidebar-menu li").removeClass("active");
	$("#pendingBooks_menu").addClass("active");
</script>
<div class="content-wrapper">
	<c:if test="${book_renewed != null}">
		<div id="success-alert" class="alert alert-success alert-dismissible">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">×</button>
			<h4>
				<i class="icon fa fa-check"></i> Success!
			</h4>
			Successfully renewed Book.
		</div>
		<script>
        	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
        		$("#success-alert").slideUp(500);
        	});
        </script>
	</c:if>
	<div class="box">
		<div class="box-header">
			<h3 class="box-title">Pending Books</h3>
		</div>
		<div class="box-body">
			<div class="row">
				<div class="col-sm-12">
					<table id="lendsTable"
						class="table table-bordered table-striped dataTable">
						<thead>
							<tr>
								<th>Book Name</th>
								<th>Issued Date</th>
								<th>Return Date</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="lend" items="${lends}">
								<tr>
									<td>${lend.book.name}</td>
									<fmt:formatDate value="${lend.lendDate}" var="dateString"
										pattern="dd/MM/yyyy" />
									<td>${dateString}</td>
									<fmt:formatDate value="${lend.returnDate}" var="dateString2"
										pattern="dd/MM/yyyy" />
									<td>${dateString2}</td>
									<td><c:choose>
											<c:when test="${lend.days==14 }">
												<button class="btn btn-success"
													onclick="renewBook(${lend.id})">Renew</button>
											</c:when>
											<c:otherwise>
												<div class="text-success">Book renewed</div>
											</c:otherwise>
										</c:choose></td>
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
					function renewBook(id){
						location.href="renewBook.htm?id="+id;
					}
				</script>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="templates/footer.jsp"%>