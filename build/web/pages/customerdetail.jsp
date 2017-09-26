<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
</head>
 
<body>
<h1>Struts 2 + Hibernate integration example</h1>

<h2>Update Customer</h2>
<s:form action="updateCustomerAction" >
  <s:textfield name="name" label="Name" value="%{#request.customerDetail.name}" />
  <s:textarea name="address" label="Address" value="%{#request.customerDetail.address}" cols="50" rows="5" />
  <s:submit />
</s:form>

<br/>
<br/>

</body>
</html>