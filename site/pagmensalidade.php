<html>

    <body>

        <?php
        $id = $_REQUEST['id'];
        $nome = $_REQUEST['nome'];
        ?>
        <div id="pagmensalidade" ></div>
        
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#pagmensalidade').jtable({
                    title: '<center><b>Mensalidade do(a) - <?php echo $nome ?></center>',
                    paging: true,
                    jqueryuiTheme: true,
                    pageSize: 25,
                    sorting: true,
                    showCloseButton: false,
                    selecting: false,
                    editColumns: 2,
                    defaultSorting: 'pag_mens_data DESC',
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
                        listAction: 'actions/pagmensalidade_actions.php?action=list&id=' +<?php echo $id ?>,
                    },
                    fields: {
                        pag_mens_id: {
                            key: true,
                            create: false,
                            edit: false,
                            list: false
                        },
                          pag_mens_status: {
                            title: 'STATUS',
                            width: '1%',
                            display: function(data) {
                                if (data.record.pag_mens_status == 0) {

                                    return '<center><img src="img/blueberry/PNG/32/attention.png" style="width:24px" title="MENSALIDADE NAO PAGA"></center> ';
                                }
                                else
                                    return '<center style="color:blue">OK!</center>' }
                        },
                       mespag_mes: {
                            title: 'MES',
                            width: '5%',
                            options: {'1': 'JANEIRO', '2': 'FEVEREIRO', '3': 'MARCO', '4': 'ABRIL',
                                '5': 'MAIO', '6': 'JUNHO', '7': 'JULHO', '8': 'AGOSTO',
                                '9': 'SETEMBRO', '10': 'OUTUBRO', '11': 'NOVEMBRO', '12': 'DEZEMBRO'},
                        },
                         mespag_ano: {
                            title: 'ANO',
                            width: '5%',
                        },
                        pag_mens_valor: {
                            title: 'VALOR',
                            width: '5%',
                            display: function(data) {
                                 return "R$"+data.record.pag_mens_valor;
                             }
                        },                        
                       
                         pag_mens_data: {
                            title: 'DATA DA ATUALIZACAO',
                             
                        },
                        
                      
                        // ATUALIZANDO COM UPDATE RECORD
                        editar: {
                            title: 'EDITAR',
                            sorting: false,
                            width: '1%',
                            edit: false,
                            create: false,
                            display: function(data) {
                                if (data.record.pag_mens_status == 0) {
                                    var $img = $('<center>confirmar!<input type="image" src="img/e-icones/ok.png"/>');

                                    $img.click(function() {
                                        //var record = $(this).data('record');
                                        $('#pagmensalidade').jtable('updateRecord', {
                                            record: {
                                                pag_mens_id: data.record.pag_mens_id,
                                                pag_mens_valor: data.record.pag_mens_valor, //apenas enviando para atualizar caixa
                                                socio_nome: data.record.socio_nome,//apenas enviando para atualizar caixa
                                                pag_mens_status: 1
                                            },
                                            url: 'actions/pagmensalidade_actions.php?action=update',                                            
                                        });

                                    })
                                    return $img;
                                }

                                else if (data.record.pag_mens_status == 1) {
                                    var $img = $('<center>CANCELAR!<input type="image" src="img/e-icones/cancel.png"/>');

                                    $img.click(function() {
                                        $('#pagmensalidade').jtable('updateRecord', {
                                            record: {
                                                pag_mens_id: data.record.pag_mens_id,
                                                pag_mens_valor: data.record.pag_mens_valor,//apenas enviando para atualizar caixa
                                                socio_nome: data.record.socio_nome,//apenas enviando para atualizar caixa
                                                pag_mens_status: 0
                                            },
                                            url: 'actions/pagmensalidade_actions.php?action=update',                                             
                                        });

                                    })
                                    return $img;
                                }
                            }

                        },
                    },
                    
                    //funcao para mudar de cor dependendo da situacao a linha
                    rowInserted: function(event, data) {
                        if (data.record.pag_mens_status == 0) {
                            data.row.css('background-color', '#76EEC6');
                            //MUDANDO COR DA LETRA data.row.css('color', 'white');
                        }
                       else{
                            
                         data.row.css('background-color', '#D3D3D3');
                         data.row.css('color', 'gray');
                            
                        }
                        
                    }

                });

                //Load person list from server

                $('#pagmensalidade').jtable('load')
            });

        </script>
        <br>
 <div style="background-color: white">
            
<!--                <img src="../site/img/icon_impressora_03.jpg">-->
     <form action="relatorio/mensalidadessocio.php">Relatorios
                    <select name='socio'>
                        <option></option>
                        <option value="<?php echo $id?>">MENSALIDADES ATRASADAS</option>
                        <option>TODAS MENSALIDADES</option>
                    </select>
                    <button>gerar</button>
                </form>
            </div>
    </body>
</html>


