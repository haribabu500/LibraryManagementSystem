<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="templates/header.jsp"%>
<div class="content-wrapper">
	<div style="display:none;" id="success-alert" class="alert alert-success alert-dismissible">
      <button  type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
      <h4><i class="icon fa fa-check"></i> Success!</h4>
      Successfully Lend Book.
    </div>
	<div class="box">
		<div class="box-header">
			<h3>Lend Book</h3>
		</div>
		<div class="box-body">
			<div class="container">
				<div class="row">
					<div class="form_content" style="width:500px;">
						<form:form modelAttribute="lend" id="add_lend_form"
							class="form-horizontal" action="addLendAction.htm">

							<div class="form-group">
								<label class="col-sm-4 control-label">Book</label>
								<div class="col-sm-8">
									<form:hidden path="book.id" value="${book.id}" />
										<table>
											<tr><th>Book Name : </th><td>${book.name }</td></tr>
											<tr><th>Author : </th><td>${book.author }</td></tr>
											<tr><th>Publisher : </th><td>${book.publication }</td></tr>
											<tr><th>Genre : </th><td>${book.genere }</td></tr>
										</table>
										
								</div>
							</div><hr>
							<div class="form-group">
								<label class="col-sm-4 control-label">Student Id</label>
								<div class="col-sm-8">
									<div id="student_details"></div>
									<form:input id="student_id" path="student.id" class="form-control"
										placeholder="Student Id" value="" />
										<script type="text/javascript">
											$("#student_id").focusout(function(){
												$.ajax({
													url:"getStudentDetails.htm?id="+$(this).val(),
													success:function(data){
														$("#student_details").html(data);
													},
													error:function(){
														alert("Oops! something went wrong.");
													}
												});
											});
										</script>
								</div>
							</div><hr>
							<div class="form-group">
								<label class="col-sm-4 control-label">Duration</label>
								<div class="col-sm-8">
									<div class="input-group">
										<form:input path="days" class="form-control"
											placeholder="Duration" value="14" />
										<span class="input-group-addon">Days</span>
									</div>
								</div>
							</div><hr>
							
						</form:form>
						<div class="form-group">
							<label class="col-md-4 control-label" for="singlebutton"></label>
							<div class="col-md-4">
								<button id="lend_book" name="singlebutton"
									class="btn btn-primary">Lend Book</button>
							</div>
						</div>
						<script>
							$("#lend_book").click(function(){
								$.post('addLendAction.htm',jQuery('#add_lend_form').serialize(),function(data){  
									
									$("#success-alert").css("display","block");
									$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
						        		$("#success-alert").slideUp(500);
						        		location.href="viewBooks.htm";
						        	});
								});
							});
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<%@include file="templates/footer.jsp"%>