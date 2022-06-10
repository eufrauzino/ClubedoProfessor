<div id="cupom" style="width: 800px"></div>
<?php
$locacao = $_REQUEST['locacao'];
$socio = $_REQUEST['socio'];
$total = $_REQUEST['total'];
$socionome = $_REQUEST['socionome'];
?>

<input type="hidden" name="total" value="<?php echo $total ?>" />              


<script type="text/javascript">

    $(document).ready(function() {

        //Prepare jTable
        $('#cupom').jtable({
            title: '<center><b>Cupons do(a) - <?php echo $socionome ?></center>',
            paging: true,
            jqueryuiTheme: true,
            pageSize: 10,
            sorting: true,
            showCloseButton: false,
            editColumns: 2,
            selecting: true, //Enable selecting
            multiselect: false, //Allow multiple selecting
            selectingCheckboxes: true, //Show checkboxes on first column
            defaultSorting: 'cupom_data DESC',
//                    toolbar: {
//                        items: [{
//                                
//                                icon: '', //replace with your path
//                                text: 'RELATORIO',
//                                click: function() {
//                                   
//                                }
//                            }]
//                    },
            actions: {
                listAction: 'actions/cupom_actions.php?action=list&socio=' +<?php echo $socio ?>,
            },
            fields: {
                cupom_id: {
                    title: 'CODIGO',
                    key: true,
                    create: false,
                    edit: false,
                    list: true
                },
                cupom_data: {
                    title: 'DATA',
                    width: '5%',
                },
                cupom_valor: {
                    title: 'VALOR',
                    width: '5%',
                },
                cupom_usado: {
                    type: 'hidden',
                    width: '5%',
                },
                // ATUALIZANDO COM UPDATE RECORD

            },
            selectionChanged: function() {

                //Get all selected rows
                var $selectedRows = $('#cupom').jtable('selectedRows');

                $('#selecaoLinha').empty();
                if ($selectedRows.length > 0) {
                    //Show selected rows
                    $selectedRows.each(function() {
                        var record = $(this).data('record');
                        var total = $('input:hidden[name=total]').val();

                        if (record.cupom_usado == 0) {

                            $('#selecaoLinha').append(
                                    " <b> LOCACAO :R$" + total +
                                    " <br>DESCONTO :R$" + record.cupom_valor +
                                    "<br>" + total + " - " + record.cupom_valor + " = <div style='color:red'>R$" + (total - record.cupom_valor)
                                    );



                        }
                    });
                }
            },
            rowInserted: function(event, data) {
                if (data.record.cupom_usado == 1) {
                    data.row.css('background-color', '#C0C0C0');
                }
            },
        });

        //Load person list from server

        $('#cupom').jtable('load');

        $('#ModifyAllButton').button().click(function() {
            if (!confirm('Tem certeza que quer CONFIRMAR ESSA RESERVA COM ESSE DESCONTO')) {
                return false;
            }
            var $selectedRows = $('#cupom').jtable('selectedRows');

            if ($selectedRows.length > 0) {
                //Show selected rows
                $selectedRows.each(function() {
                    var record = $(this).data('record');
                    if (record.cupom_usado == 0) {
                        $('#cupom').jtable('updateRecord', {
                            record: {
                                cupom_id: record.cupom_id,
                                cupom_valor: record.cupom_valor,
                                cupom_usado: record.cupom_usado,
                            },
                            url: 'actions/cupom_actions.php?action=update&locacao=' +<?php echo $locacao ?>,
                            success: function() {
                                location.href = "index.php?tabela=locacao";
                            },
                        });


                    }
                });
            }
        });
    });

</script>
<br><br>


<div style="margin-left: 30px" id="selecaoLinha"></div><br>
<button id="ModifyAllButton">CONFIRMAR</button></center>
</body>
</html>
