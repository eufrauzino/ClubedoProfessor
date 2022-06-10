<html>
    <head>
<!--    <form style="margin-left: 340px" action="relatorio/mensalidades atrasadas.php" method="GET">
        <select>
            <option></option>
            <option>RESERVAS PAGAS</option>
            <option>RESERVAS NAO PAGAS</option>
        </select>
        <button>ok</button>
    </form>-->
    <!--<link rel="stylesheet" href="../script/jquery.countdown.package-1.6.3/jquery.countdown.css">-->

        <!--<script src="../script/jQuery.countdown-master/src/jquery.countdown.js"></script>-->


    <!--  FUNCAO JAVASCRIPT PARA EXCLUIR A LOCACAO -->
    <style type="text/css">
        div.jtable-main-container div.jtable-title {
            position: relative;
            text-align: left;
            height: 50px
        }
    </style>
    <script>
        function confirmExclusao(data) {
            if (confirm("Tem certeza que deseja excluir essa reserva?")) {
                self.location = "actions/locacao_actions.php?action=cancelar&locacao=" + data;
            }
        }


        //JANELA MODAL PARA TRAZER MAIS INFORMACOES DETALHES
        $(function() {
            $("#calendario").dialog({
                width: "100%",
                height: 1000,
                autoOpen: false,
                modal: true,
                show: {
                    effect: "fade",
                    duration: 20
                },
                hide: {
                    effect: "fade",
                    duration: 20
                },
                // função para atualizar a pagina automaticamente ao fechar
//                    close: function() {
//                        window.location.href = 'catfreq.php';
//                    }
            });// JANELA
        });
    </script>

</head>

<body>

    <div <a href="javascript:func()" id="detalhes" title="">          
                  <!--<span id="status"></span> <div id="frases" title="DETALHES">-->        


    </div>
    <div <a href="javascript:func()" id="calendario" title='CALENDARIO'>          
                  <!--<span id="status"></span> <div id="frases" title="DETALHES">-->        
            <?php include './calendario_locacao.php'; ?>

    </div>

<center>
    <div id="locacao" style="" ></div>
    <script type="text/javascript">

        $(document).ready(function() {

            //Prepare jTable
            $('#locacao').jtable({
                title: 'LOCACOES',
                paging: true,
                jqueryuiTheme: true,
                pageSize: 10,
                sorting: true,
                showCloseButton: false,
                selecting: false,
                editColumns: 2,
                width: '100%',
                openChildAsAccordion: true,
                defaultSorting: 'locacao_pago ASC',
                actions: {
                    listAction: 'actions/locacao_actions.php?action=list',
                    //createAction: 'actions/locacao_actions.php?action=create&locacao=' +
                    // updateAction: 'actions/locacao_actions.php?action=update',
                    //deleteAction: 'actions/locacao_actions.php?action=delete'
                },
                toolbar: {
                    hoverAnimation: true,
                    hoverAnimationDuration: 60,
                    hoverAnimationEasing: undefined,
                    items: [
                        {
                            text: '<img src="img/blueberry/PNG/32/calendar.png"> ',
                            tooltip: 'CALENDARIO DE RESERVAS',
                            click: function() {

                                $("#calendario").dialog("open"); // abrindo dialog

                            }
                        }, {
                            text: '  <img src="img/blueberry/PNG/32/printer.png"> ',
                            tooltip: 'CALENDARIO DE RESERVAS',
                            click: function() {

                                $("#calendario").dialog("open"); // abrindo dialog

                            }
                        }

                    ]
                },
                fields: {
                    locacao_pago: {
                        title: 'SITUACAO',
                        type: 'radiobutton',
                        options: {'1': 'PAGO', '0': 'NAO PAGO'},
                        display: function(data) {
                            if (data.record.locacao_pago == 1) {
                                return $('<center><img src="img/blueberry/PNG/32/check-64.png" style="width:24px" title="PAGO"></center>');
                            }
                            else if (data.record.locacao_pago == 0)
                                return '<center><img src="img/blueberry/PNG/32/attention.png" style="width:24px" title="RESERVADO MAS NAO CONFIRMADO"></center> ';
                            else
                                return '<center><img src="img/blueberry/PNG/32/check-64.png" style="width:24px" title="PAGO PARCIALMENTE OU TOTALMENTE COM DESCONTO"></center> ';
                        },
                    },
                    locacao_socionome: {
                        title: 'SOCIO',
                    },
                    locacao_socio: {
                        title: 'SOCIO',
                        type: 'hidden'
                    },
                    locacao_id: {
                        key: true,
                        create: false,
                        edit: false,
                        list: false
                    },
                    locacao_data: {
                        title: 'DATA DA LOCACAO',
                        width: '10%',
                    },
                    locacao_formapag: {
                        title: 'DATA DA LOCACAO',
                        type: 'hidden'
                    },
                    locacao_total: {
                        title: 'VALOR TOTAL',
                        width: '1%',
                        display: function(data) {
                            if (data.record.locacao_total == null) {
                                return "";
                            }
                            else
                                return "<center><b>R$ " + data.record.locacao_total + "</b></center>";
                        },
                    },
                    cupom: {
                        create: false,
                        sorting: false,
                        width: '1%',
                        edit: false,
                        footer: true,
                        title: "CUPOM",
                        list: true,
                        display: function(data) {
                            if (data.record.locacao_pago == 0) {

                                //Create an icon that will be used to open dialog
                                var $icon = $('<img src="img/cofrinho.jpg" style="width:50px" title="DESCONTO"/>');
                                $icon.click(function() {
                                    $("#detalhes").empty();

                                    locacao = data.record.locacao_id; //pegando o id mensalidade,
                                    socio = data.record.locacao_socio;
                                    socio_nome = data.record.locacao_socionome
                                    total = data.record.locacao_total;
                                    //                                        alert(id);

                                    $("#detalhes").html("<img src=img/loader.gif' alt='' />");
                                    //                                        clique = mensalidadeData.record.mensalidade_id;
                                    $.post("cupom.php", {locacao: locacao, socio: socio, total: total, socionome: socio_nome}, function(resposta) {
                                        // Limpa a mensagem de carregamento


                                        // Coloca as frases na DIV
                                        $("#detalhes").append(resposta);

                                    });
                                    $("#detalhes").dialog("open"); // abrindo dialog
                                    //Return image to show on the table

                                });
                                return $icon;
                            }
//                                else if (data.record.locacao_pago == 2) {
//                                    var $img = $('<img src="img/icon_desc.png" style="width:45px" title="DESCONTO"/>');
//                                    //Open child table when user clicks the image
//                                    $img.click(function() {
//                                        $('#locacao').jtable('openChildTable',
//                                                $img.closest('tr'), //Parent row
//                                                {
////                                                messages: {
////                                                    addNewRecord: 'ADD DEPENDENTES DO(A) '+dependenteData.record.socio_nome
////                                                },
//                                                    title: " DESCONTO",
//                                                    actions: {
//                                                        listAction: 'actions/cupom_actions.php?action=listitemcupom&&locacao=' + data.record.locacao_id,
//                                                    },
//                                                    fields: {
//                                                        itemcupom_locacao: {
//                                                            type: 'hidden',
//                                                            defaultValue: data.record.locacao_id
//                                                        },
//                                                        itemcupom_id: {
//                                                            title:'Codigo',
//                                                            key: true,
//                                                            create: false,
//                                                            edit: false,
//                                                            list: true
//                                                        },
//                                                        cupom_data: {
//                                                            title:'Data do Cupom',
//                                                           
//                                                        },
//                                                        itemcupom_valor: {
//                                                            title: '<td colspan="6">VALOR',
//                                                            display: function(data) {                                                                
//                                                                return "<b><div style='color: red; float: right; margin-right: 300px;'> - R$" + data.record.itemcupom_valor + "</div>";
//                                                            },
//                                                        }
//
//                                                    }
//
//                                                },
//                                        function(data) { //opened handler
//                                            data.childTable.jtable('load');
//
//                                        });
//                                    });
                            //Return image to show on the person row
//                                    return $img;

//                                }


                        }
                    },
                    boleto: {
                        // title: 'RESERVA',
                        width: '1%',
                        create: false,
                        sorting: false,
                        edit: false,
                        display: function(data) {
                            if (data.record.locacao_pago == 0) {
                                return $('<input type="image" src="img/icone_bb.png" title="IMPRIMIR BOLETO" name="boleto" style="" value=boleto onClick="self.location=\'boleto/boleto_bb.php?locacao=' + data.record.locacao_id + '\'"/>');
                            }

                            //Create an icon that will be used to open dialog

                        }
                    },
                    detalhes: {
                        // title: 'RESERVA',
                        width: '1%',
                        create: false,
                        sorting: false,
                        edit: false,
                        display: function(data) {

                            //Create an icon that will be used to open dialog
                            var $icon = $('<img src="img/blueberry/png/32/search_lense.png" title="DETALHES" />');
                            $icon.click(function() {

                                $("#detalhes").empty();
                                id = data.record.locacao_id; //pegando o id mensalidade,
                                nome = data.record.locacao_socionome;
                                dia = data.record.locacao_data;
                                socio_id = data.record.locacao_socio;
                                formapag = data.record.locacao_formapag;
                                total = data.record.locacao_total;
                                //                                        alert(id);
                                $("#detalhes").html("<img src=img/loader.gif' alt='' />");
                                //                                        clique = mensalidadeData.record.mensalidade_id;
                                $.post("./itemloc_1.php", {locacao: id, socio_nome: nome, data: dia, socio: socio_id, total: total, formapag: formapag}, function(resposta) {
                                    // Limpa a mensagem de carregamento


                                    // Coloca as frases na DIV
                                    $("#detalhes").append(resposta);


                                });
                                $("#detalhes").dialog("open"); // abrindo dialog
                            });
                            //Return image to show on the table
                            return $icon
                        }
                    },
                    reserva: {
                        title: 'EDITAR',
                        sorting: false,
                        width: '2%',
                        edit: false,
                        create: false,
                        display: function(data) {
                            if (data.record.locacao_pago == 1) {
                                /*MANEIRA ERRADA DE FAZER *///return $('<center><input type="image" src="img/blueberry/png/32/trash_box.png" title="CANCELAR" name="canc" style="" id="canc" onClick="confirmExclusao(' + data.record.locacao_id + ')"/></center>');

                                var $img = $('<center><input type="image" src="img/blueberry/png/32/trash_box.png"/>');

                                $img.click(function() {
                                    if (!confirm('Tem certeza que quer cancelar essa Reserva PAGA')) {
                                        return false;
                                    }
                                    $('#locacao').jtable('deleteRecord', {
                                        key: data.record.locacao_id,
                                        url: 'actions/locacao_actions.php?action=cancelar&locacao=' + data.record.locacao_id + '&locacao_pago=' + data.record.locacao_pago + '&valor=' + data.record.locacao_total + '&socio=' + data.record.locacao_socio,
                                    });

                                })
                                return $img;

                            }
                            else if (data.record.locacao_pago == 0) {
                                return $('<table border = 0><tr><td><input type="image" src="img/blueberry/png/32/shopping_cart_empty.png" title="EDITAR" name="entrada" style="" value=entrada onClick=" self.location=\'index.php?tabela=itemloc&&locacao=' + data.record.locacao_id + '&&socio_nome=' + data.record.locacao_socionome + '&&socio_id=' + data.record.locacao_socio + '\'"/></td>\n\
                            <td><input type="image" src="img/blueberry/png/32/trash_box.png" title="CANCELAR" name="canc" style="" id="canc" onClick="confirmExclusao(' + data.record.locacao_id + ')"/></td></tr></table>');

                            }

                        }

                    },
//                        locacao_tipoloc: {
//                            title: 'EVENTO',
//                            width: '40%',
//                            options: 'actions/locacao_actions.php?action=tipolocacao'
//                        },


                },
                rowInserted: function(event, data) {
                    if (data.record.locacao_pago == 0) {
                        data.row.css('background-color', '#00FF7F');
                    }

                    else if (data.record.locacao_pago == 1) {
                        data.row.css('background-color', '#D3D3D3');
                        data.row.css('color', 'gray');
                    }
                    else if (data.record.locacao_pago == 2) {
                        data.row.css('background-color', '#D3D3D3');
                        data.row.css('color', 'gray');
                    }


                },
            });
            //Load person list from server

            $('#locacao').jtable('load')
        });

    </script>


</body>
</html>
