<html>
    <head>

    </head>

    <body>


 
        <div id="produto"></div> 
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#produto').jtable({
                    title: 'DEPENDENCIA DO CLUBE',
                    paging: true,
                    jqueryuiTheme: true,
                    pageSize: 10,
                    sorting: true,
                    showCloseButton: false,
                    selecting: false,
                    editColumns: 2,
                    defaultSorting: 'produto_id ASC',
                    actions: {
                        listAction: 'actions/produto_actions.php?action=list',
                        createAction: 'actions/produto_actions.php?action=create',
                        updateAction: 'actions/produto_actions.php?action=update',
                        deleteAction: 'actions/produto_actions.php?action=delete'
                    },
                    fields: {
                        produto_id: {
                            key: true,
                            create: false,
                            edit: false,
                            list: false
                        },
                        produto_descricao: {
                            title: 'Descricao',
                        },
                        produto_disponivel: {
                            title: 'Ativo',
                            type: 'checkbox',
                            values: {'0': 'NAO ATIVO', '1': 'ATIVO'},
                            defaultValue: '1'
                        },
                         produto_valor: {
                            title: 'Valor',
                            display: function(data) {
                                return "R$ "+data.record.produto_valor;
                            }
                        },
                         produto_estoque: {
                            title: 'Estoque',
                        },
                        produto_cat_obj: {
                            title: 'Categoria',
                            options: function(data) {
                                return "actions/produto_actions.php?action=cat";
                            }

                        },
                       
                      
                    },
                });

                //Load person list from server

                $('#produto').jtable('load')
            });

        </script>


    </body>

</html>
