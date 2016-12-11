<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:choose>
	<c:when test="${type!=null }">
		<%@include file="admin/templates/header.jsp"%>
	</c:when>
	<c:otherwise>
		<%@include file="templates/header.jsp"%>
	</c:otherwise>
</c:choose>
<div class="content-wrapper">
	<div class="box">
		<div class="box-header">
			<h3 class="box-title">Change Password</h3>
		</div>
		<div class="box-body">
			<div class="row">
				<div class="col-sm-12">
					<form:form id="changePasswordForm" class="form-horizontal" modelAttribute="user">
						<div class="form-group">
							<label for="current_password" class="col-sm-2 control-label">Current
								Password</label>
							<div class="col-sm-10">
								<form:input type="password" class="form-control" path="oldPassword" />
							</div>
						</div>
						<div class="form-group">
							<label for="current_password" class="col-sm-2 control-label">New Password</label>
							<div class="col-sm-10">
								<form:input type="password" class="form-control" path="password" />
							</div>
						</div>
						<div class="form-group">
							<label for="current_password" class="col-sm-2 control-label">Re-Enter New Password</label>
							<div class="col-sm-10">
								<form:input type="password" class="form-control" path="rePassword" />
							</div>
						</div>
						
					</form:form>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button id="submit" type="submit" class="btn btn-primary">Change Password</button>
						</div>
					</div>
					<script type="text/javascript">
						$("#submit").click(function(){
							$.post('changePasswordAction.htm',jQuery('#changePasswordForm').serialize(),function(data){  
								alert(data);
							});
						});
					</script>
				</div>
			</div>
		</div>
	</div>
</div>



<%@include file="templates/footer.jsp"%>