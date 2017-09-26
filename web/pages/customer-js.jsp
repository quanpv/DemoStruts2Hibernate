<%-- 
    Document   : customer-js
    Created on : Aug 16, 2017, 11:48:57 AM
    Author     : vtz_it_van
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- DataTables -->
<script src="${contextPath}/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${contextPath}/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>

<!-- iCheck -->
<script src="${contextPath}/resources/plugins/iCheck/icheck.min.js"></script>

<script>
    function format ( d ) {
        return 'Full name: '+d.subId;
    }

    buildSearchData = function() {
        return null;
    };

    generateExtraSubDataTable = function() {
        var dt = $('#dtExtraSubList').DataTable({
            lengthChange		: false,
            searching: false,
            ordering: false,
            processing: false,
            serverSide: true,
            pageLength: 10,
            scrollX: true,
            scrollCollapse: true,
            fixedColumns: {
                leftColumns: 1
            },
            ajax: {
                url: "${contextPath}/aj-extracus-list",
                type: "POST",
                /* "data": {
             "agentInformationId"		: $('#sltAgent').val().trim(),
             "dateRange"					: $('#searchDateRange').val().trim()
             }, */
                data: buildSearchData()
            },
             contentType: "application/json; charset=utf-8",
            //"ajax": buildSearchData(this),
            columns: [
               {"data": null},
                {
                    "class":          "dt-align-center details-control",
                    "orderable":      false,
                    "data":           null,
                    "defaultContent": '<a href="javascript:void(0);"><i class="fa fa-edit"></i></a>'
                },
               
                {"data": "0",
                 "class": "customer-id-align-center"},
                {"data": "1"},
                {"data": "2"},
                {"data": "3"}

            ],
            columnDefs: [
                {
                    "targets": [ 0 ],
                    "visible": false,
                    "searchable": false
                }
            ],
            //          "initComplete": function(settings, json) {
            //            $('#dtExtraSubList input[type="checkbox"]').iCheck({
            //              checkboxClass: 'icheckbox_flat-blue',
            //              radioClass: 'iradio_flat-blue'
            //            });
            //          },
            //          "fnDrawCallback": function (oSettings) {
            //            $('#dtExtraSubList input[type="checkbox"]').iCheck({
            //              checkboxClass: 'icheckbox_flat-blue',
            //              radioClass: 'iradio_flat-blue'
            //            });
            //            },
            error: function (msg) {
                //alert("");
            }
        });

        // Array to track the ids of the details displayed rows
        var detailRows = [];

        $('#dtExtraSubList tbody').on( 'click', 'tr td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = dt.row(tr);
            //alert(row.data().actionAuditEncypt);
            window.location = "listCustomerAction/" + "849812";
        } );

        // On each draw, loop over the `detailRows` array and show any child rows
        dt.on( 'draw', function () {
            $.each(detailRows, function ( i, id ) {
                $('#'+id+' td.details-control').trigger( 'click' );
            } );
        } );
    };

    $(function () {
        generateExtraSubDataTable();
    });


</script>
