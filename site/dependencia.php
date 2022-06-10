<html>
    <head>

    </head>

    <body>
        <div <a href="javascript:func()" id="detalhes" title="">          


        </div>
        <div id="dependencia"></div> 
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#dependencia').jtable({
                    title: 'DEPENDENCIA DO CLUBE',
                    paging: true,
                    jqueryuiTheme: true,
                    pageSize: 10,
                    sorting: true,
                    showCloseButton: false,
                    selecting: false,
                    editColumns: 2,
                    defaultSorting: 'objeto_id ASC',
                    actions: {
                        listAction: 'actions/dependencia_actions.php?action=list',
                        createAction: 'actions/dependencia_actions.php?action=create',
                        updateAction: 'actions/dependencia_actions.php?action=update',
                        deleteAction: 'actions/dependencia_actions.php?action=delete'
                    },
                    fields: {
                        objeto_id: {
                            key: true,
                            create: false,
                            edit: false,
                            list: false
                        },
                        objeto_descricao: {
                            title: 'Descricao',
                        },
                        obeto_disponivel: {
                            title: 'Ativo',
                            type: 'checkbox',
                            values: {'0': 'NAO ATIVO', '1': 'ATIVO'},
                            defaultValue: '1'
                        },
                        objeto_cat: {
                            title: 'Categoria',
                            options: function(data) {
                                return "actions/dependencia_actions.php?action=cat";
                            }

                        },
                        objeto_foto: {
                            title: 'Foto',
                            width: '40%',
                        },
                        bloquear: {
                            create: false,
                            sorting: false,
                            width: '1%',
                            edit: false,
                            display: function(data) {

                                //Create an icon that will be used to open dialog
                                var $icon = $('<img style="width:58px" src="img/manut3.jpg" title="Bloquear" />');
                                $icon.click(function() {
                                    $("#detalhes").dialog({
                                        width: 1200,
                                        height: 400,
                                    });
                                    $("#detalhes").dialog("open"); // abrindo dialog
                                    id = data.record.objeto_id; //pegando o id mensalidade,
                                    dependencia = data.record.objeto_descricao;
                                    //                                        alert(id);

                                    $("#status").html("<img src=img/loader.gif' alt='Enviando' />");
                                    //                                        clique = mensalidadeData.record.mensalidade_id;
                                    $.post("depinativo.php", {id: id, dependencia: dependencia}, function(resposta) {
                                        // Limpa a mensagem de carregamento

                                        $("#detalhes").empty();
                                        // Coloca as frases na DIV
                                        $("#detalhes").append(resposta);

                                    });

                                    //Return image to show on the table

                                });
                                return $icon;
                            }
                        },
                    },
                });

                //Load person list from server

                $('#dependencia').jtable('load')
            });

        </script>


    </body>

</html>
