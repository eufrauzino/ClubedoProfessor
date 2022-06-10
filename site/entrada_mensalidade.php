<?php $mes = $_REQUEST['mes']; 
$mes_nome = $_REQUEST['mes_nome'];
$ano=$_REQUEST['ano'];
?>

<!--<center style="background-color:white ; color: black;font-size: 30px">Selecione os socios que ainda nao pagaram a mensalidade desse mes!</center>-->

<?php
//echo "<center><b>$mes_nome/$ano</b><center>";
?>
<div id="socio"></div>


<script type="text/javascript">

    $(document).ready(function() {

        //Prepare jtable plugin
        $('#socio').jtable({
            title: 'SELECAO DE SOCIOS',
            paging: true,
            sorting: true,
            jqueryuiTheme: true,
            defaultSorting: 'socio_nome ASC',
            selecting: true, //Enable selecting
            multiselect: true, //Allow multiple selecting
            selectingCheckboxes: true, //Show checkboxes on first column
            //selectOnRowClick: false, //Enable this to only select using checkboxes
            actions: {
                listAction: 'actions/entrada_mensalidade_actions.php?action=list&mes=' +<?php echo $mes ?>,
                updateAction: 'actions/entrada_mensalidade_actions.php?action=update',
            },
            fields: {
                pag_mens_id: {
                    key: true,
                    create: false,
                    edit: false,
                    list: false

                },
                socio_acao: {
                    title: 'ACAO',
                    list: false,
                },
                socio_nome: {
                    title: 'NOME',
                    type: 'text',
                },
                pag_mens_valor: {
                    title: 'VALOR',
                    type: 'text',
                     display: function(data) {
                         return '<center>R$ '+data.record.pag_mens_valor+'</center> ';}
                },
                pag_mens_status: {
                    title: 'Status',
                    display: function(data) {
                        if (data.record.pag_mens_status == 0) {
                            return '<center><img src="img/blueberry/PNG/32/attention.png" style="width:24px" title="MENSALIDADE NAO PAGA"></center> ';
                        }
                        else
                            return '<center style="color:blue">OK!</center>'
                    }
                },
            },
            //Register to selectionChanged event to hanlde events
            selectionChanged: function() {
                //Get all selected rows
                var $selectedRows = $('#socio').jtable('selectedRows');

                $('#SelectedRowList').empty();
                if ($selectedRows.length > 0) {
                    //Show selected rows
                    $selectedRows.each(function() {
                        var record = $(this).data('record');
                        $('#SelectedRowList').append(
                                '<b>ACAO </b>: ' + record.socio_acao +
                                '<br /><b>NOME :</b>:' + record.socio_nome + '<br /><br />'
                                );
                    });
                } else {
                    //No rows selected
                    $('#SelectedRowList').append('NENHUM SOCIO SELECIONADO');
                }
            },
//            rowInserted: function(event, data) {
//                if (data.record.socio_nome.indexOf('TEREZA EUFRAUZINO MELLO') >= 0) {
//                    $('#socio').jtable('selectRows', data.row);
//                }
//            }
        });

        //Load student list from server
        $('#socio').jtable('load');

        //Delete selected students


        // funcaozinha para atualizar todos os dados selecionados 
        $('#ModifyAllButton').button().click(function() {
            var $selectedRows = $('#socio').jtable('selectedRows');

            if ($selectedRows.length > 0) {
                //Show selected rows
                $selectedRows.each(function() {
                    var record = $(this).data('record');

                    $('#socio').jtable('updateRecord', {
                        record: {
                            pag_mens_id: record.pag_mens_id,
                            pag_mens_status: 1,
                            pag_mens_valor: record.pag_mens_valor,//apenas enviando para atualizar caixa
                            socio_nome: record.socio_nome,//apenas enviando para atualizar caixa
                        },
                        // url:'actions/entrada_mensalidade_actions.php?action=update',
                    });
                });
            }
        });

    });

</script>
<div style="margin-left: 30px" id="SelectedRowList"></div>
<center> <button id="ModifyAllButton">CONFIRMAR SOCIOS QUE PAGARAM</button></center>


