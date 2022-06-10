<html>
    <head>

    </head>

    <body>


        <div id="grauloc"></div> 
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#grauloc').jtable({
                    title: 'NIVEIS DE LOCACAO',
                    paging: true,
                    jqueryuiTheme: true,
                    pageSize: 10,
                    sorting: true,
                    showCloseButton: false,
                    selecting: false,
                    editColumns: 2,
                    defaultSorting: 'grauloc_id ASC',
                    openChildAsAccordion: true,
                    actions: {
                        listAction: 'actions/grauloc_actions.php?action=list',
                        createAction: 'actions/grauloc_actions.php?action=create',
                        updateAction: 'actions/grauloc_actions.php?action=update',
                        deleteAction: 'actions/grauloc_actions.php?action=delete'
                    },
                    fields: {
                        grauloc_id: {
                            key: true,
                            create: false,
                            edit: false,
                            list: false
                        },
                        grauloc_descricao: {
                            title: 'Descricao',
                            width: '40%'
                        },
                      
                    },
                   
                });

                //Load person list from server

                $('#grauloc').jtable('load')
            });

        </script>


    </body>

</html>
