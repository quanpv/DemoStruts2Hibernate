<%-- 
    Document   : customer2
    Created on : Aug 16, 2017, 2:48:19 PM
    Author     : vtz_it_van
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<body>
<h1>Struts 2 + Hibernate integration example</h1>

<h2>Add Customer</h2>
<s:form action="addCustomerAction" >
  <s:textfield name="name" label="Name" value="" />
  <s:textarea name="address" label="Address" value="" cols="50" rows="5" />
  <s:submit />
</s:form>

<h2>All Customers</h2>
<s:if test="#request.customer != null">
        <div>
            <h4><s:property value="#request.customer.name"/></h4>
            <p>${customer.address}</p>
        </div>
    </s:if>
<s:if test="customerList.size() > 0">
<table border="1px" cellpadding="8px">
	<tr>
		<th>Customer Id</th>
		<th>Name</th>
		<th>Address</th>
		<th>Created Date</th>
	</tr>
	<s:iterator value="customerList" status="userStatus">
		<tr>
			<td><s:property value="customerId" /></td>
			<td><s:property value="name" /></td>
			<td><s:property value="address" /></td>
			<td><s:date name="createdDate" format="dd/MM/yyyy" /></td>
		</tr>
	</s:iterator>
</table>
</s:if>
<br/>
<br/>

</body>
<!-- Main content -->
<section class="content">
    
        <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"><s:text name="CustomerCheck.box-list-title"/></h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                    <table id="dtExtraSubList" class="table table-bordered table-hover dt-head-center" style="white-space: nowrap;">
                        <thead>
                            <tr>
                              <th>actionAuditId</th>
                                 <th class="customer-id-align-center">#</th>
                                <th><s:text name="common.label.customer-id"/></th>
                                <th><s:text name="common.label.name"/></th>
                                <th><s:text name="common.label.address"/></th>
                                <th><s:text name="common.label.created-date"/></th>
                            </tr>
                        </thead>
                    </table>
                </div><!-- /.box-body -->
            </div><!-- /.box -->

        </div><!-- /.col -->
    </div><!-- /.row -->

</section><!-- /.content -->