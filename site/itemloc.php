<html>
    <head>
        <!--MUDANDO OS ICONES SOMENTE DOS ITENS DE LOCACAO-->
        <style type="text/css">
            div.jtable-main-container div.jtable-title div.jtable-toolbar span.jtable-toolbar-item.jtable-toolbar-item-add-record span.jtable-toolbar-item-icon {
                background-image: url('img/e-icones/cartadd16.png');
            }

            div.jtable-main-container table.jtable tbody > tr > td .jtable-delete-command-button {
                background: url('img/e-icones/cart_remove.png') no-repeat;
                width: 32px;
                height: 32px;
            }

            div.jtable-main-container table.jtable tbody > tr > td .jtable-edit-command-button {
                background: url('img/blueberry/png/32/pencil_edit.png') no-repeat;
                width: 32px;
                height: 32px;
            }

            div.jtable-main-container div.jtable-title {
                position: relative;
                text-align: left;
                height: 50px
            }
        </style>

        <!--<script src="../script/jQuery.countdown-master/src/jquery.countdown.js"></script>-->
    </head>

    <body>


        <?php
        $locacao = $_REQUEST['locacao'];
        $socio_nome = $_REQUEST['socio_nome'];
        $socio_id = $_REQUEST['socio_id'];
        include './actions/conecta.php';
        $s = mysql_query("SELECT locacao_pago from locacao WHERE locacao_id =" . $locacao);
        $situacao = mysql_result($s, 0);
        mysql_close();
        //CRIANDO UMA PERMICAO CASO A COMPRA JA FOI EFETUADA NAO PERMITIR CONTINUAR.
        if ($situacao == 0) {
            // echo $locacao;
            ?>
            <div <a href="" id="detalhes" title=""> 
                    <input type="hidden" name="locacao" value="<?php echo $locacao ?>" />               
                    <input type="hidden" name="socio_id" value="<?php echo $socio_id ?>" />               
                    <input type="radio" name="formapag" value="dinheiro" /><img style="width: 52px" src="img/grana.jpg"><br><br>                
                    <input type="radio" name="formapag" value="cheque" /> <img style="width: 52px" src="img/cheque2.jpg"><br><br>                
                    <input type="radio" name="formapag" value="boleto" /><img style="width: 52px" src="img/boleto.jpg">  <br><br>       
                    <input type="radio" name="formapag" value="cheque e dinheiro" /><img style="width: 52px" src="img/cheque2.jpg"> + <img style="width: 52px" src="img/grana.jpg"> <br><br>       
    <!--                    <input type="radio" name="formapag" value="cupom" /><img style="width: 52px" src="img/cupom_icon.jpg">  <br><br>       -->
                    </div> 
                    <div id="itemloc" ></div>

                    <script type="text/javascript">

                        $(document).ready(function() {

                            //Prepare jTable
                            $('#itemloc').jtable({
                                title: 'Reserva - <?php echo $socio_nome ?>',
                                paging: true,
                                pageSizeChangeArea: false,
                                gotoPageArea: 'none',
                               
                                jqueryuiTheme: true,
                                footer: true, /*USANDO O FOOTER PARA COLOCAR NA BARRA INFERIOR O VALOR TOTAL*/
                                sorting: true,
                                pageSize: 500,
                                showCloseButton: false,
                                selecting: false,
                                editColumns: 2,
                                width: '100%',
                                openChildAsAccordion: true,
                                defaultSorting: 'itemobj_id ASC',
                                actions: {
                                    listAction: 'actions/itemloc_actions.php?action=list&locacao=' +<?php echo $locacao ?>,
                                    createAction: 'actions/itemloc_actions.php?action=create&locacao=' +<?php echo $locacao ?>,
                                    updateAction: 'actions/itemloc_actions.php?action=update',
                                    deleteAction: 'actions/itemloc_actions.php?action=delete'
                                },
                                toolbar: {
                                    hoverAnimation: true,
                                    hoverAnimationDuration: 60,
                                    hoverAnimationEasing: undefined,
                                    items: [
                                        {
                                            icon: 'img/pdf.png',
                                            text: '<img src="img/e-icones/dollar.png" style="width: 16px">FATURAR',
                                            width: '5%',
                                            tooltip: 'FATURAR COMPRA',
                                            click: function() {
                                                if (confirm("Tem certeza que deseja concluir essa compra?")) {
                                                    //                                     window.location = 'actions/itemloc_actions.php?action=faturar&locacao=' 
                                                    $("#detalhes").dialog({
                                                        title: 'FORMA DE PAGAMENTO',
                                                        width: 600,
                                                        height: 400,
                                                        buttons: {
                                                            'Cancelar': function()
                                                            {
                                                                $(this).dialog('close');
                                                            },
                                                            'OK': function() {
                                                                var formapag = $('input:radio[name=formapag]:checked').val();
                                                                var locacao = $('input:hidden[name=locacao]').val();
                                                                var socio = $('input:hidden[name=socio_id]').val();
                                                                alert(formapag);
                                                                if (formapag == "cupom") {
                                                                    $.post("cupom.php", {socio: socio, locacao: locacao}, function(resposta) {
                                                                        // Limpa a mensagem de carregamento

                                                                        $("#detalhes").empty();
                                                                        // Coloca as frases na DIV
                                                                        $("#detalhes").append(resposta);

                                                                    });
                                                                }
                                                                else {
                                                                    $.post("actions/itemloc_actions.php?action=faturar", {socio: socio, locacao: locacao, formapag: formapag}, function(resposta) {
                                                                        // Limpa a mensagem de carregamento

                                                                        //                                                                        $("#detalhes").dialog("close");
                                                                        location.href = "index.php?tabela=locacao";
                                                                        // Coloca as frases na DIV


                                                                    });

                                                                }
                                                            }
                                                        }
                                                    });

                                                    $("#detalhes").dialog("open");


                                                    // abrindo dialog


                                                    //$("#detalhes").empty();

                                                    //$("#detalhes").append("<h1>" + $formapag);



                                                }
                                            }

                                        },
                                        {
                                            text: 'RESERVAR',
                                            click: function() {

                                                window.location = 'actions/itemloc_actions.php?action=reservar&locacao=' +<?php echo $locacao ?>;
                                            }
                                        },
                                        {
                                            icon: '/images/pdf.png',
                                            text: 'CANCELAR',
                                            click: function() {
                                                if (confirm("Tem certeza que deseja excluir essa compra?")) {
                                                    window.location = 'actions/locacao_actions.php?action=cancelar&locacao=' +<?php echo $locacao ?>;
                                                    //CANCELANDO E EXCLUINDO LOCACAO E TODOS ITENS DE LOCACAO O MESMO PROCESSO QUE ESTA N LOCACAO
                                                }
                                            }
                                        },
                                    ]
                                },
                                fields: {
                                    itemobj_id: {
                                        key: true,
                                        create: false,
                                        edit: false,
                                        list: false
                                    },
                                    objeto_foto: {
                                        create: false,
                                        edit: false,
                                        list: true,
                                        display: function(data) {
                                            return "<img style='width:170px' src='img/" + data.record.objeto_foto + "'>";
                                        }
                                    },
                                    itemobj_data: {
                                        title: 'DATA',
                                        type: 'date',
                                       
//                                        display: function(data) {
//                                            return"<div style='background-color:yellow'>" + $.datepicker.formatDate("dd/mm/yy", new Date(data.record.itemobj_data))
//                                        }
                                        // inputClass: 'validate[required,custom[date]]'
                                    },
                                    itemobj_parente: {
                                        title: 'RELACAO',
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
                                            data.clearCache();
                                            return 'actions/itemloc_actions.php?action=tipolocacao&&itemobj_evento=' + data.dependedValues.itemobj_evento + ' &&itemobj_parente=' + data.dependedValues.itemobj_parente + ' &&itemobj_data=' + data.dependedValues.itemobj_data;
                                            //+'&&itemobj_data ='+data.dependedValues.itemobj_data
                                        },
                                    },
                                    itemobj_responsavel: {
                                        title: 'USUARIO',
                                        //                            width: '40%'
                                    },
                                    /*USANDO O FOOTER PARA COLOCAR NA BARRA INFERIOR O VALOR TOTAL*/
                                    obj_tipo_valor: {
                                        width: '15%',
                                        title: 'SUB TOTAL',
                                        create: false,
                                        edit: false,
                                        display: function(data) {
                                            return "<center style='color: blue;'>R$" + data.record.obj_tipo_valor + "</center>";
                                        },
                                        footer: function(data) {
                                            var total = 0;
                                            $.each(data.Records, function(index, record) {
                                                total += Number(record.obj_tipo_valor);
                                            });
                                            return"<div style='font-size:20px'>R$" + (total.toFixed(2)) + "</div>";
                                        }
                                    },
                                    //                                                                regressiva: {
                                    //                                                                    title: 'REG P/ CONFIRMAR',
                                    //                                                                    display: function(data) {
                                    //                                                                       a = data.record.itemobj_data;
                                    //                                                                            $(function() {
                                    //                                                                                var d, h, m, s;
                                    //                                                                                $('div#clock').countdown(new Date(a), function(event) {
                                    //                                                                                    var timeFormat = "%d day(s) %h:%m:%s",
                                    //                                                                                            $this = $(this);
                                    //                                                                                    switch (event.type) {
                                    //                                                                                        case "days":
                                    //                                                                                            d = event.value;
                                    //                                                                                            break;
                                    //                                                                                        case "hours":
                                    //                                                                                            h = event.value;
                                    //                                                                                            break;
                                    //                                                                                        case "minutes":
                                    //                                                                                            m = event.value;
                                    //                                                                                            break;
                                    //                                                                                        case "seconds":
                                    //                                                                                            s = event.value;
                                    //                                                                                            break;
                                    //                                                                                        case "finished":
                                    //                                                                                            $this.fadeTo('slow', 0.5);
                                    //                                                                                            break;
                                    //                                                                                    }
                                    //                                                                                    // Assemble time format
                                    //                                                                                    if (d > 0) {
                                    //                                                                                        timeFormat = timeFormat.replace(/\%d/, d);
                                    //                                                                                        timeFormat = timeFormat.replace(/\(s\)/, Number(d) == 1 ? '' : 's');
                                    //                                                                                    } else {
                                    //                                                                                        timeFormat = timeFormat.replace(/\%d day\(s\)/, '');
                                    //                                                                                    }
                                    //                                                                                    timeFormat = timeFormat.replace(/\%h/, h);
                                    //                                                                                    timeFormat = timeFormat.replace(/\%m/, m);
                                    //                                                                                    timeFormat = timeFormat.replace(/\%s/, s);
                                    //                                                                                    // Display
                                    //                                                                                    $this.html(timeFormat);
                                    //                                                                                });
                                    //                                                                            });
                                    //                                                                            return '<div id="clock" style="color: red" ></div> '
                                    //                                                                       
                                    //                                                                    }
                                    //                                    
                                    //                                                                },


                                    opcionais: {// CADASTRO DE CIDADE
                                        title: 'ADICIONAIS',
                                        //                               width: '500px',
                                        sorting: false,
                                        edit: false,
                                        create: false,
                                        display: function(itemdata) {
                                            //Create an image that will be used to open child table
                                            var $img = $('<img src="img/blueberry/png/32/plus.png" title="OBJETOS OPCIONAIS" />');
                                            //Open child table when user clicks the image
                                            $img.click(function() {
                                                $('#itemloc').jtable('openChildTable',
                                                        $img.closest('tr'), //Parent row
                                                        {
                                                            //                                                messages: {
                                                            //                                                    addNewRecord: 'ADD DEPENDENTES DO(A) '+dependenteData.record.socio_nome
                                                            //                                                },
                                                            footer: true, /*USANDO O FOOTER PARA COLOCAR NA BARRA INFERIOR O VALOR TOTAL*/
                                                            title: " <div style=''><center> ITENS OPCIONAIS </center></div>",
                                                            actions: {
                                                                listAction: 'actions/itemproduto_actions.php?action=list&&acao=adicionar&&id=' + itemdata.record.itemobj_id,
                                                                deleteAction: 'actions/itemproduto_actions.php?action=delete',
                                                                //                                                                updateAction: 'actions/itemproduto_actions.php?action=update',
                                                                createAction: 'actions/itemproduto_actions.php?action=create'
                                                            },
                                                            fields: {
                                                                itemprod_itemlocacao: {
                                                                    type: 'hidden',
                                                                    defaultValue: itemdata.record.itemobj_id
                                                                },
                                                                itemprod_id: {
                                                                    key: true,
                                                                    create: false,
                                                                    edit: false,
                                                                    list: false
                                                                },
                                                                 produto_img: {
                                        create: false,
                                        edit: false,
                                        list: true,
                                        display: function(data) {
                                            return "<img style='width:42px' src='img/" + data.record.produto_img + "'>";
                                        }
                                    },
                                                                itemprod_data: {
                                                                    title: 'DATA DE USO',
                                                                    type: 'hidden',
                                                                    list: true,
                                                                    defaultValue: itemdata.record.itemobj_data,
                                                                    //                                                                   
                                                                    //                                                                    display: function(data) {
                                                                    //                                                                        return'<input type="text" disabled="true" value="' + itemdata.record.itemobj_data + '">'
                                                                    //                                                                    }

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
                                                                        return((Number(batch.record.itemprod_qtd) * Number(batch.record.produto_valor)).toFixed(2));
                                                                    },
                                                                    footer: function(data) {
                                                                        var total = 0;
                                                                        $.each(data.Records, function(index, record) {
                                                                            total += Number(record.itemprod_qtd) * Number(record.produto_valor);
                                                                        });
                                                                        return(total.toFixed(2));
                                                                    }

                                                                }
                                                            }

                                                        },
                                                function(data) { //opened handler
                                                    data.childTable.jtable('load');

                                                });
                                            });
                                            //Return image to show on the person row
                                            return $img;
                                        }


                                    }
                                },
                                //                                loadingRecords: function(event, data) {
                                //                                    $('table.jtable').append('<tr><td colspan="10">CUPOM :<input type="text" size="140"/><input type="button" id="cupom" value="Buscar"> </td></tr>');
                                //                                },
                                //                                /*MASCARAS*/
                                formCreated: function(event, data)
                                {
                                    data.form.find('[name=itemobj_data]').mask('99/99/9999');
                                },
                            });

                            //Load person list from server

                            $('#itemloc').jtable('load')




                        });
                        //                $.ajax({
                        //                    type: "POST",
                        //                    data: "JSONbusca=" + JSONbuscaString,
                        //                    url: "teste.php",
                        //                    success: function(result) {
                        //                        $("#paginacao").html(result);
                        //                    }
                        //                });

                    </script>

    <?php
} else if ($situacao == 1) {
    echo "<center>NAO PERMITIDO ESSA COMPRA JA FOI EFETUADA...";
}
?>

                </body>
                </html>
