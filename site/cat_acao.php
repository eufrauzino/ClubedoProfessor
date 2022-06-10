<html>
    <head>

    </head>

    <body>


        <div id="cat_acao"></div> 
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#cat_acao').jtable({
                    title: 'CATEGORIA DE ACAO',
                    paging: true,
                    jqueryuiTheme: true,
                    pageSize: 10,
                    sorting: true,
                    showCloseButton: false,
                    selecting: false,
                    editColumns: 2,
                    defaultSorting: 'cat_acao_descricao ASC',
                    openChildAsAccordion: true,
                    actions: {
                        listAction: 'actions/cat_acao_actions.php?action=list',
                        createAction: 'actions/cat_acao_actions.php?action=create',
                        updateAction: 'actions/cat_acao_actions.php?action=update',
                        deleteAction: 'actions/cat_acao_actions.php?action=delete'
                    },
                    fields: {
                        cat_acao_id: {
                            key: true,
                            create: false,
                            edit: false,
                            list: false
                        },
                        cat_acao_descricao: {
                            title: 'Descricao',
                            width: '40%'
                        },
                        cat_acao_valor: {
                            title: 'Valor',
                            width: '20%'
                        },
                      
                    },
                    formCreated: function(event, data) {
                        data.form.attr('enctype', 'multipart/form-data');
                    },
                             
                });

                //Load person list from server

                $('#cat_acao').jtable('load')
            });

        </script>


    </body>

</html>
