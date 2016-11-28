<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="templates/header.jsp"%>
<div class="content-wrapper">
	<c:if test="${book_deleted != null}">
		<div id="danger-alert" class="alert alert-danger alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
          <h4><i class="icon fa fa-check"></i> Success!</h4>
          Successfully Removed Book.
        </div>
        <script>
        	$("#danger-alert").fadeTo(2000,500).slideUp(500,function(){
        		$("#danger-alert").slideUp(500);
        	});
        </script>
	</c:if>
	<div class="box">
		<div class="box-header">
			<h3 class="box-title">List of Books</h3>
		</div>
		<div class="box-body">
		<div class="row">
			<div class="col-sm-12">
				<table id="booksTable"
					class="table table-bordered table-striped dataTable" role="grid">
					<thead>
						<tr>
							<th>Book No.</th>
							<th>Book Name</th>
							<th>Author</th>
							<th>Genere</th>
							<th>ISBN</th>
							<th>Publisher</th>
							<th>Quantity</th>
							<th>Action</th>
							<th>Edit</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="book" items="${books}">
							<tr>
								<td>${book.id}</td>
								<td>${book.name}</td>
								<td>${book.author}</td>
								<td>${book.genere}</td>
								<td>${book.isbn}</td>
								<td>${book.publication}</td>
								<td>${book.quantity}</td>
								<td>
									<c:if test="${book.quantity>0}">
										<button onclick="lendBook(${book.id})" class="btn btn-primary">Lend</button>
									</c:if>
								</td>
								<td><a href="addBook.htm?id=${book.id}" title="Edit"><i class="fa fa-edit">|</i></a> <a href="deleteBook.htm?id=${book.id}" title="Delete"><i class="fa fa-trash text-danger"></i></a></td>
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