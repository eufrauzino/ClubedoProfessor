<html>

    <head>





    </head>

    <body>



        <div <a href="javascript:func()" id="detalhes" title="Detalhes">          
                <!--<span id="status"></span> <div id="frases" title="DETALHES">-->          

        </div>
        <!--</div>-->


        <div id="catfreq">

            <form>
                <span style="font-family: 'Segoe UI Semilight', 'Open Sans', Verdana, Arial, Helvetica, sans-serif;font-size: 13px; font-weight: 600;">Pesquisa: </span><input type='text' name='pesquisa' id='pesquisa' style="font-family: 'Segoe UI Semilight', 'Open Sans', Verdana, Arial, Helvetica, sans-serif;font-size: 12px; font-weight: 400;"/>

                <button type="submit" id="LoadRecordsButton" style="font-family: 'Segoe UI Semilight', 'Open Sans', Verdana, Arial, Helvetica, sans-serif;font-size: 13px; font-weight: 600;">Busca</button >
            </form> 


            <script type="text/javascript">
                $(document).ready(function() {

                    //Prepare jTable
                    $('#catfreq').jtable({
                        title: 'CATEGORIA DE FREQUENTADORES (MENSALIDADES)',
                        paging: true,
                        pageSize: 10,
                        jqueryuiTheme: true,
                        sorting: true,
                        showCloseButton: false,
                        selecting: false,
                        editColumns: 2,
                        defaultSorting: 'catfreq_descricao ASC',
                        openChildAsAccordion: true,
                        actions: {
                            listAction: 'actions/catfreq_actions.php?action=list',
                            createAction: 'actions/catfreq_actions.php?action=create',
                            updateAction: 'actions/catfreq_actions.php?action=update',
                            deleteAction: 'actions/catfreq_actions.php?action=delete'
                        },
                        fields: {
                            catfreq_id: {                                
                                key: true,
                                create: false,
                                edit: false,
                                list: false,
                                //inputClass: 'validate[required,custom[onlyNumberSp]]'
                            },
                            catfreq_descricao: {
                                title: 'DESCRICACAO',
                                type: 'text',
                            },
                            mensalidade_valor: {
                                title: 'VALOR DA MENSALIDADE',
                                width: '20%'
                            },
                            catfreq_atualizacao: {
                                title: 'ATUALIZACAO',
                                edit: false,
                                create: false
                            },
                            catfreq_tipo: {
                                title: 'TIPO DE FREQUENTADOR',
                                type: 'radiobutton',
                                options: {'1': 'SOCIO', '2': 'NAO SOCIO', '4': 'ACADEMIA PARA SOCIO'},
                                defaultValue: '1'
                            },
                            TestColumn: {
                                create: false,
                                edit: false,
                                display: function(data) {

                                    //Create an icon that will be used to open dialog
                                     var $icon = $('<img src="img/blueberry/png/32/search_lense.png" title="DETALHES" />');
                                    $icon.click(function() {

                                        $("#detalhes").dialog("open"); // abrindo dialog
                                        id = data.record.catfreq_id; //pegando o id catfreq
                                        //                                        alert(id);
                                        $("#status").html("<img src=img/loader.gif' alt='Enviando' />");
                                        //                                        clique = catfreqData.record.catfreq_id;
                                        $.post("actions/catfreq_actions.php?action=informacoes", {id: id}, function(resposta) {
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
                        },
                        formCreated: function(event, data) {
                            data.form.validationEngine();
                        },
                        //Validate form when it is being submitted
                        formSubmitting: function(event, data) {
                            return data.form.validationEngine('validate');
                        }
                        //Dispose validation logic when form is closed
                        //                    formClosed: function(event, data) {
                        //                        data.form.validationEngine('hide');
                        //                        data.form.validationEngine('detach');
                        //                    }
                    });
                    //Re-load records when user click 'load records' button.
                    $('#LoadRecordsButton').click(function(e) {
                        e.preventDefault();
                        $('#catfreq').jtable('load', {
                            pesquisa: $('#pesquisa').val()
                        });
                    });
                    $('LoadRecordsButton').click();


                    //Carrega a tabela
                    $('#catfreq').jtable('load');
                });



            </script>
        </div>

    </body>
</html>
