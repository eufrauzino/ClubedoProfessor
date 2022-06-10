$('#catsocio').dialog({
                modal: true,
                width: 700,
                buttons: {
                    Ok: function () {

                        var $selectedRows = $('#socio').jtable('selectedRows');
                        if ($selectedRows.length > 0) {
                            //Show selected rows
                            $selectedRows.each(function () {
                                var record = $(this).data('record');
                                //add selected item to the text box
                                $('#' + '<%=flightnumbertext%>').val(record.FlightNumber);

                            });
                        }
                        $(this).dialog("close");

                    },
                    Cancel: function () {
                        $(this).dialog('close');
                    }
                }
            });
            
            
            //https://github.com/hikalkan/jtable/issues/639