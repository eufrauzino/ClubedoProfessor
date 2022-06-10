<html>

    <head>



        <style type="text/css">
            #jtable-create-form {
                display: block;
                width: 1200px;
                -moz-column-gap:30px;
                -webkit-column-gap:30px;
                column-gap:30px;
                -moz-column-count:3;
                -webkit-column-count:3;
                column-count:3;                
            } 


            #jtable-edit-form {
                display: block;
                width: 1200px;
                -moz-column-gap:30px;
                -webkit-column-gap:30px;
                column-gap:30px;
                -moz-column-count:3;
                -webkit-column-count:3;
                column-count:3;                
            } 



        </style>

    </head>

    <body>

        <div <a href="javascript:func()" id="detalhes" title="">         


        </div>
        <!--</div>-->



        <div id="socio" >
            <div style="background-color: white">
                <form style="float: left">
                    <span style="font-family: 'Segoe UI Semilight', 'Open Sans', Verdana, Arial, Helvetica, sans-serif;font-size: 13px; font-weight: 600;">Pesquisa: </span><input type='text' name='pesquisa' id='pesquisa' style="font-family: 'Segoe UI Semilight', 'Open Sans', Verdana, Arial, Helvetica, sans-serif;font-size: 12px; font-weight: 400;"/>

                    <button type="submit" id="LoadRecordsButton" style="font-family: 'Segoe UI Semilight', 'Open Sans', Verdana, Arial, Helvetica, sans-serif;font-size: 13px; font-weight: 600;">Busca</button >

                </form> 
<!--                <img src="../site/img/icon_impressora_03.jpg">-->
                <form style="margin-left: 340px" action="relatorio/mensalidades atrasadas.php" method="GET">
                    <select>
                        <option></option>
                        <option>MENSALIDADES ATRASADAS</option>
                        <option>TODAS MENSALIDADES</option>
                    </select>
                    <button>gerar</button>
                </form>
            </div>
            <script type="text/javascript">

                $(document).ready(function() {


                    //Prepare jTable
                    $('#socio').jtable({
                        title: 'SOCIOS',
                        paging: true,
                        pageSize: 10,
                        jqueryuiTheme: true,
                        sorting: true,
                        showCloseButton: false,
                        selecting: false,
                        defaultDateFormat: 'yy-mm-dd',
                        defaultSorting: 'socio_ativo DESC',
                        openChildAsAccordion: true,
                        actions: {
                            listAction: 'actions/socio_actions.php?action=list',
                            createAction: 'actions/socio_actions.php?action=create',
                            updateAction: 'actions/socio_actions.php?action=update',
                            // deleteAction: 'actions/socio_actions.php?action=delete'
                        },
                        fields: {
                            socio_id: {
                                key: true,
                                create: false,
                                edit: false,
                                list: false
                            },
                            socio_acao: {
                                title: 'ACAO',
                                list: false,
                                options: 'actions/socio_actions.php?action=acao',
                                //inputClass: 'validate[required,custom[onlyNumberSp]]'
                            },
                            socio_nome: {
                                title: 'NOME',
                                type: 'text',
                            },
                            socio_cat: {
                                title: 'CATEGORIA',
                                options: 'actions/socio_actions.php?action=categoria',
                                list: false,
                            },
                            //                        socio_exame: {
                            //                            title: 'EXAME',
                            //                            options: 'actions/socio_actions.php?action=exame',
                            //                            list: true,
                            //                        },
                            //                        socio_padrinho: {
                            //                            title: 'PADRINHO',
                            //                            options: 'actions/socio_actions.php?action=padrinho',
                            //                            list: false,
                            //                           
                            //                        },
                            socio_nascimento: {
                                title: 'NASCIMENTO',
                                type: 'date',
                                list: false
                            },
                            socio_rg: {
                                title: 'RG',
                                type: 'text',
                                list: false
                            },
                            socio_cpf: {
                                title: 'CPF',
                                type: 'text',
                                list: false
                            },
                            socio_fone_res: {
                                title: 'FONE RES',
                                type: 'text',
                                sorting: false,
                            },
                            socio_fone_cel: {
                                title: 'CELULAR',
                                type: 'text',
                                sorting: false,
                            },
                            socio_civil: {
                                title: 'ESTADO CIVIL',
                                type: 'radiobutton',
                                options: {'SOLTEIRO': 'SOLTEIRO(A)', 'CASADO': 'CASADO(A)', 'VIUVO(A)': 'VIUVO(A)', 'DIVORCIADO(A)': 'DIVORCIADO(A)'},
                                width: '20%',
                                list: false
                            },
                            socio_sexo: {
                                title: 'SEXO',
                                type: 'radiobutton',
                                options: {'F': 'FEMINO', 'M': 'MASCULINO'},
                                width: '20%',
                                list: false
                            },
                            estado_id: {
                                title: 'Estado',
                                options: 'actions/socio_actions.php?action=estado',
                                list: false
                            },
                            socio_cidade: {
                                title: 'CIDADE',
                                dependsOn: 'estado_id',
                                list: false,
                                display: function(data) {
                                    return data.record.id

                                },
                                dependsOn:'estado_id',
                                        options: function(data) {
                                            if (data.source == 'list') {
                                                return 'actions/socio_actions.php?action=cidade&&estado=1';
                                            }
                                            return 'actions/socio_actions.php?action=cidade&&estado=' + data.dependedValues.estado_id;
                                        }

                                //This code runs when user opens edit/create form or changes continental combobox on an edit/create form.
                                //data.source == 'edit' || data.source == 'create'

                            },
                            //                        socio_cidade:{
                            //                             title: 'Estado',
                            //                                options: 'actions/socio_actions.php?action=cidade',
                            //                                list: false
                            //                            },


                            socio_cep: {
                                title: 'CEP',
                                type: 'text',
                                list: false
                            },
                            socio_endereco: {
                                title: 'ENDERECO',
                                type: 'text',
                                list: false

                            },
                            socio_bairro: {
                                title: 'BAIRRO',
                                type: 'text',
                                list: false
                            },
                            socio_num_res: {
                                title: 'NUMERO RESIDENCIAL',
                                type: 'text',
                                list: false
                            },
                            socio_profissao: {
                                title: 'PROFISSAO',
                                type: 'text',
                                list: false
                            },
                            socio_regime_trabalho: {
                                title: 'REGIME DE TRABALHO',
                                type: 'text',
                                list: false
                            },
                            socio_local_trabalho: {
                                title: 'LOCAL DE TRABALHO',
                                type: 'text',
                                list: false
                            },
                            socio_fone_trabalho: {
                                title: 'TEL DO TRABALHO',
                                type: 'text',
                                list: false
                            },
                            socio_email: {
                                title: 'EMAIL',
                                type: 'text',
                                list: false
                            },
                            socio_data_cadastro: {
                                title: 'DATA DE CADASTRO',
                                type: 'date',
                                list: false
                            },
                            socio_ativo: {
                                list: false,
                                title: 'ATIVO',
                                type: 'checkbox',
                                values: {'0': 'NAO ATIVO', '1': 'ATIVO'},
                                defaultValue: '1'
                            },
                            socio_observacao: {
                                title: 'OBSERVACAO',
                                type: 'textarea',
                                list: false
                            },
                            detalhes: {
                                title: '',
                                create: false,
                                sorting: false,
                                edit: false,
                                width: '1%',
                                display: function(data) {

                                    //Create an icon that will be used to open dialog
                                    var $icon = $('<img src="img/blueberry/png/32/search_lense.png" title="DETALHES" />');
                                    $icon.click(function() {

                                        $("#detalhes").dialog({
                                        }); // abrindo dialog
                                        $("#detalhes").dialog("open");
                                        id = data.record.socio_id; //pegando o id mensalidade
                                        nome = data.record.socio_nome;
                                        //                                        alert(id);
                                        $("#status").html("<img src=img/loader.gif' alt='Enviando' />");
                                        //                                        clique = mensalidadeData.record.mensalidade_id;

                                        // Limpa a mensagem de carregamento

                                        $("#detalhes").empty();
                                        // Coloca as frases na DIV
                                        $("#detalhes").append(id, "<h1>" + nome);


                                    });

                                    //Return image to show on the table
                                    return $icon
                                }

                            },
                            dependente: {// CADASTRO DE CIDADE
                                title: '',
                                width: '1%',
                                sorting: false,
                                edit: false,
                                create: false,
                                display: function(dependenteData) {
                                    //Create an image that will be used to open child table
                                    var $img = $('<img src="img/blueberry/png/32/friends_group.png" title="EDITAR DEPENDENTES" />');
                                    //Open child table when user clicks the image
                                    $img.click(function() {
                                        $('#socio').jtable('openChildTable',
                                                $img.closest('tr'), //Parent row
                                                {
                                                    //                                                messages: {
                                                    //                                                    addNewRecord: 'ADD DEPENDENTES DO(A) '+dependenteData.record.socio_nome
                                                    //                                                },
                                                    title: " <div style=''><center>DEPENDENTES DO(A) " + dependenteData.record.socio_nome + "</center></div>",
                                                    actions: {
                                                        listAction: 'actions/dependente_actions.php?action=list&&socio_id=' + dependenteData.record.socio_id,
                                                        deleteAction: 'actions/dependente_actions.php?action=delete',
                                                        updateAction: 'actions/dependente_actions.php?action=update',
                                                        createAction: 'actions/dependente_actions.php?action=create&&socio_id=' + dependenteData.record.socio_id
                                                    },
                                                    fields: {
                                                        dependente_socio: {
                                                            type: 'hidden',
                                                            defaultValue: dependenteData.record.socio_id
                                                        },
                                                        dependente_id: {
                                                            key: true,
                                                            create: false,
                                                            edit: false,
                                                            list: false
                                                        },
                                                        dependente_nome: {
                                                            title: 'NOME',
                                                        },
                                                        dependente_nascimento: {
                                                            title: 'NASCIMENTO',
                                                            type: 'date'
                                                        },
                                                        dependente_fone_res: {
                                                            title: 'FONE RESIDENCIAL',
                                                        },
                                                        dependente_fone_cel: {
                                                            title: 'CELULAR',
                                                        },
                                                        dependente_parentesco: {
                                                            title: 'PARENTESCO',
                                                            options: 'actions/dependente_actions.php?action=parente',
                                                        },
                                                    }

                                                },
                                        function(data) { //opened handler
                                            data.childTable.jtable('load');

                                        });
                                    });
                                    //Return image to show on the person row
                                    return $img;
                                }


                            },
                            reserva: {
                                title: 'RESER',
                                sorting: false,
                                width: '1%',
                                edit: false,
                                create: false,
                                display: function(data) {
                                    if (data.record.socio_ativo == 1) {
                                        return $('<input type="image" src="img/blueberry/png/32/shopping_cart.png" title="RESERVAR" name="entrada" style="" value=entrada onClick="self.location=\'actions/socio_actions.php?action=itemlocacao&& socio=' + data.record.socio_id + '&&socio_nome=' + data.record.socio_nome + '\'"/>');
                                    }
                                    else
                                        return('<input type="image" src="img/blueberry/png/32/shopping_cart.png" title="RESERVAR" name="entrada" style="" value=entrada onClick="alert(\'SOCIO NAO ESTA ATIVO\')";/>');
                                }
                            },
                            mensalidade: {
                                title: 'MENS',
                                create: false,
                                sorting: false,
                                width: '1%',
                                edit: false,
                                display: function(data) {

                                    //Create an icon that will be used to open dialog
                                    var $icon = $('<img src="img/blueberry/png/32/calendar.png" title="MENSALIDADES" />');
                                    $icon.click(function() {
                                        $("#detalhes").empty();
                                        id = data.record.socio_id; //pegando o id mensalidade,
                                        nome = data.record.socio_nome;
                                        //                                        alert(id);

                                        $("#detalhes").html("<img src=img/loader.gif' alt='' />");
                                        //                                        clique = mensalidadeData.record.mensalidade_id;
                                        $.post("pagmensalidade.php", {id: id, nome: nome}, function(resposta) {
                                            // Limpa a mensagem de carregamento


                                            // Coloca as frases na DIV
                                            $("#detalhes").append(resposta);

                                        });

                                        //Return image to show on the table
                                        $("#detalhes").dialog("open"); // abrindo dialog
                                    });
                                    return $icon;
                                }
                            },
                            exame: {
                                title: 'EXAME',
                                create: false,
                                sorting: false,
                                width: '1%',
                                edit: false,
                                // title: 'Exame',
                                display: function(data) {

                                    //Create an icon that will be used to open dialog
                                    var $icon = $('<img src="img/medico_3.png" title="EXAME MEDICO" style="width:32px"/>');
                                    $icon.click(function() {

                                        $("#detalhes").dialog("open"); // abrindo dialog
                                        $("#detalhes").empty();
                                        id = data.record.socio_id; //pegando o id mensalidade,
                                        nome = data.record.socio_nome;
                                        $("#detalhes").html("<img src=img/loader.gif' alt='' />");
                                        //                                        clique = mensalidadeData.record.mensalidade_id;
                                        $.post("exame.php", {id: id, nome: nome}, function(resposta) {
                                            // Limpa a mensagem de carregamento


                                            // Coloca as frases na DIV
                                            $("#detalhes").append(resposta);
                                        });

                                    });
                                    return $icon;
                                }
                            },
                            email: {
                                title: 'EMAIL',
                                create: false,
                                sorting: false,
                                edit: false,
                                width: '1%',
                                //title: 'E-mail',
                                display: function(data) {

                                    //Create an icon that will be used to open dialog
                                    var $icon = $('<img src="img/blueberry/png/32/email.png" title="ENVIAR EMAIL" />');
                                    $icon.click(function() {

                                        $("#detalhes").dialog("open"); // abrindo dialog
                                        id = data.record.socio_id; //pegando o id mensalidade
                                        //                                        alert(id);
                                        $("#status").html("<img src=img/loader.gif' alt='Enviando' />");
                                        //                                        clique = mensalidadeData.record.mensalidade_id;
                                        $.post("actions/socio_actions.php?action=informacoes", {id: id}, function(resposta) {
                                            // Limpa a mensagem de carregamento

                                            $("#detalhes").empty();
                                            // Coloca as frases na DIV
                                            $("#detalhes").append(resposta);


                                        });
                                    });
                                    //Return image to show on the table
                                    return $icon
                                }

                            },
                            desativar: {
                                title: 'DES',
                                sorting: false,
                                width: '1%',
                                edit: false,
                                create: false,
                                display: function(data) {

                                    var $img = $('<input type="image" src="img/blueberry/png/32/delete_2.png"/>');

                                    $img.click(function() {
                                        //var record = $(this).data('record');
                                        $('#socio').jtable('updateRecord', {
                                            record: {
                                                socio_id: data.record.socio_id,
                                                socio_acao: 'null',
                                                socio_ativo: 0
                                            },
                                            url: 'actions/socio_actions.php?action=desativar',
                                        });

                                    })
                                    return $img;


                                }

                            },
                        },
                        rowInserted: function(event, data) {
                            if (data.record.socio_ativo == 0) {
                                data.row.css('background-color', 'gray');
                                data.row.css('color', '#C0C0C0');
                            }
                        },
                        formCreated: function(event, data)
                        {
                            data.form.attr('enctype', 'multipart/form-data');
                            data.form.find('[name=socio_cep]').mask('99.999-999');
                            data.form.find('[name=socio_fone_res]').mask('(99) 9999-9999');
                            data.form.find('[name=socio_fone_cel]').mask('(99) 9999-9999');
                            data.form.find('[name=socio_cpf]').mask('999.999.999-99');
                            data.form.find('[name=socio_rg]').mask('9.999.999-9');
                            data.form.find('[name=socio_nascimento]').mask('9999/99/99');

                        }
                    });

                    $('#LoadRecordsButton').click(function(e) {
                        e.preventDefault();
                        $('#socio').jtable('load', {
                            pesquisa: $('#pesquisa').val()
                        });
                    });
                    $('LoadRecordsButton').click();


                    $('#socio').jtable('load');

                });


            </script>

        </div>

    </body>
</html>
