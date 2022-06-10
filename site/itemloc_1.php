<html>

    <body>

        <?php
        $locacao = $_REQUEST['locacao'];
        $nome = $_REQUEST['socio_nome'];
        $data = $_REQUEST['data'];
        $socio = $_REQUEST['socio'];
        $formapag = $_REQUEST['formapag'];
        $total = $_REQUEST['total'];
        echo "<div style='font-size:15px'>LOCACAO n° $locacao de $data</div>";
        echo "<b><div style='font-size:25px'><b> $nome <b></div><br>";
       
      
        ?>

        <div id="itemloc" ></div>
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#itemloc').jtable({
                    title: 'RESERVAS',
                    paging: true,
                    defaultDateFormat: 'dd/mm/yy',
                    jqueryuiTheme: true,
                    pageSize: 10,
                    sorting: true,
                    footer: true,
                    showCloseButton: false,
                    selecting: false,
                    editColumns: 2,
                    width: '100%',
                    defaultSorting: 'itemobj_id ASC',
                    actions: {
                        listAction: 'actions/itemloc_actions.php?action=list&locacao=' +<?php echo $locacao ?>,
//                            createAction: 'actions/itemloc_actions.php?action=create&locacao=' +<?php echo $locacao ?>,
//                            updateAction: 'actions/itemloc_actions.php?action=update',
//                            deleteAction: 'actions/itemloc_actions.php?action=delete'
                    },
                    fields: {
                        itemobj_id: {
                            key: true,
                            create: false,
                            edit: false,
                            list: false
                        },
                        itemobj_data: {
                            title: 'DATA DO USO',
                            type: 'date',
                            defaultValue: function() {
                                return $('#WeekOf').val();
                            },
                            display: function(data) {
                                            return"<div style='background-color:yellow'>" + data.record.itemobj_data
                                        }
                            // inputClass: 'validate[required,custom[date]]'
                        },
                        itemobj_parente: {
                            title: 'RELACAO COM O USUARIO',
                            //                            width: '40%',
                            options: 'actions/itemloc_actions.php?action=parente',
                        },
                        itemobj_evento: {
                            title: 'EVENTO',
                            //                            width: '40%',
                            options: 'actions/itemloc_actions.php?action=evento'
                        },
                        //                        itemobj_tipoloc: {
                        //                            title: 'EVENTO',
                        //                            width: '40%',
                        //                            options: 'actions/itemloc_actions.php?action=tipolocacao'
                        //                        },
                        itemobj_tipoloc: {
                            title: 'DEPENDENCIA',
                            //                            width: '40%',
//                                    display: function(data) {
//                                        return data.record.itemobj_tipoloc
//                                    },

                            //                            display: function(data) {
                            //                                return data.record.itemobj_evento
                            //
                            //                            },
                            dependsOn: 'itemobj_evento,itemobj_parente,itemobj_data',
                            options: function(data) {
                                if (data.source == 'list') {
                                    return 'actions/itemloc_actions.php?action=listtipolocacao&id= ' + data.record.itemobj_tipoloc
                                }
                                return 'actions/itemloc_actions.php?action=tipolocacao&&itemobj_evento=' + data.dependedValues.itemobj_evento + ' &&itemobj_parente=' + data.dependedValues.itemobj_parente + ' &&itemobj_data=' + data.dependedValues.itemobj_data;
                                //+'&&itemobj_data ='+data.dependedValues.itemobj_data
                            },
                        },
                        itemobj_responsavel: {
                            title: 'USUARIO',
                            //                            width: '40%'
                        },
                        obj_tipo_valor: {
                            width: '15%',
                            title: 'SUB TOTAL',
                            create: false,
                            edit: false,
                            display: function(data) {
                                return  "<div style='color:blue'>R$ " + data.record.obj_tipo_valor;
                            },
                            footer: function(data) {
                                var total = 0;
                                $.each(data.Records, function(index, record) {
                                    total += Number(record.obj_tipo_valor);
                                });
                                return "<div style='color:blue'>R$ " + (total.toFixed(2));
                            }
                        },
                    },
                });

                //Load person list from server

                $('#itemloc').jtable('load');
            });

        </script>

        <br>

        <div id="item"></div> 
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#item').jtable({
                    title: 'ITENS',                   
                    jqueryuiTheme: true,
                    pageSize: 10,
                    showCloseButton: false,
                    selecting: false,                  
                    footer: true,
                    actions: {
                        listAction: 'actions/itemproduto_actions.php?action=list&&acao=detalhes&&id=' +<?php echo $locacao ?>,
                    },
                    fields: {
                        itemprod_id: {
                            key: true,
                            create: false,
                            edit: false,
                            list: false
                        },
                        itemprod_data: {
                            title: 'DATA DE USO',
                            type: 'hidden',
                            list: true,
                        },
                        itemprod_objetos: {
                            title: 'ITEM',
                            options: 'actions/itemproduto_actions.php?action=objeto',
                        },
                        produto_valor: {
                            title: 'VALOR UNIDADE',
                            create: false,
                            edit: false,
                        },
                        itemprod_qtd: {
                            title: 'QUANTIDADE',
                            dependsOn: 'itemprod_objetos,itemprod_data',
                            display: function(data) {
                                return data.record.itemprod_qtd;
                            },
                            options: function(data) {
                                //                                                                        if (data.source == 'list') {
                                //                                                                            return 'actions/itemproduto_actions.php?action=listqtd&id= ' + data.record.itemprod_qtd
                                //                                                                        }
                                data.clearCache();
                                return 'actions/itemproduto_actions.php?action=qtd&&data=' + data.dependedValues.itemprod_data + '&&itemprod_objeto=' + data.dependedValues.itemprod_objetos;
                                //+'&&itemobj_data ='+data.dependedValues.itemobj_data
                            },
                        },
                        itemprod_valor: {
                            title: 'SUB TOTAL',
                            create: false,
                            display: function(batch) {
                                return"<div style='color:blue'>R$ " + ((Number(batch.record.itemprod_qtd) * Number(batch.record.produto_valor)).toFixed(2));
                            },
                            footer: function(data) {
                                var total = 0;
                                $.each(data.Records, function(index, record) {
                                    total += Number(record.itemprod_qtd) * Number(record.produto_valor);
                                });
                                return"<div style='color:blue'>R$ " + (total.toFixed(2));
                            }

                        }
                    }

                });

                //Load person list from server

                $('#item').jtable('load');
            });

        </script>
        <br>
        <div id="cupom"></div>
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#cupom').jtable({
                    title: '<b>DESCONTO',
                    
                    jqueryuiTheme: true,
                    pageSize: 10,
                    sorting: true,
    showCloseButton: false,
                    editColumns: 2,
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
                        listAction: 'actions/cupom_actions.php?action=listitemcupom&&locacao=' +<?php echo $locacao ?>,
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
                        itemcupom_valor: {
                            title: '<td colspan="6">VALOR',
                            display: function(data) {
                                return "<center><b><div style='color: red;'>-R$ " + data.record.itemcupom_valor + "</center></b></div>";
                            },
                        }

                        // ATUALIZANDO COM UPDATE RECORD

                    },
                });

                //Load person list from server

                $('#cupom').jtable('load')
            });

        </script>
        <br>
     
        <?php echo "<span style='float:right;color:blue;padding-right:115px;background-color: lightgray'> Total Pago: R$ $total</span>";
         echo "<span style='float:right;color:blue;padding-right:115px;background-color: lightgray'> Locacao Paga em $formapag</span>";?>
    </body>
    
</html>
