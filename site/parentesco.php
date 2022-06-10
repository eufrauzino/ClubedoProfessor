<html>
    <head>

    </head>

    <body>


        <div id="parentesco"></div> 
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#parentesco').jtable({
                    title: 'PARENTESCO',
                    paging: true,
                    jqueryuiTheme: true,
                    pageSize: 10,
                    sorting: true,
                    showCloseButton: false,
                    selecting: false,
                    editColumns: 2,
                    defaultSorting: 'parentesco_id ASC',
                    openChildAsAccordion: true,
                    actions: {
                        listAction: 'actions/parentesco_actions.php?action=list',
                        createAction: 'actions/parentesco_actions.php?action=create',
                        updateAction: 'actions/parentesco_actions.php?action=update',
                        deleteAction: 'actions/parentesco_actions.php?action=delete'
                    },
                    fields: {
                        parentesco_id: {
                            key: true,
                            create: false,
                            edit: false,
                            list: false
                        },
                        parentesco_descricao: {
                            title: 'Descricao',
                            width: '40%'
                        },
                        parentesco_tipo_grau: {
                            title: 'Nivel de Locacao',
                            width: '40%',
                            options: function(data) {
                                return "actions/parentesco_actions.php?action=nivel"; 
                            }
                        },
                      
                    },
                   
                });

                //Load person list from server

                $('#parentesco').jtable('load')
            });

        </script>


    </body>

</html>
