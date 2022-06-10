<html>
    <head>

    </head>

    <body>


        <div id="evento"></div> 
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#evento').jtable({
                    title: 'EVENTOS',
                    paging: true,
                    jqueryuiTheme: true,
                    pageSize: 10,
                    sorting: true,
                    showCloseButton: false,
                    selecting: false,
                    editColumns: 2,
                    defaultSorting: 'evento_id ASC',
                    openChildAsAccordion: true,
                    actions: {
                        listAction: 'actions/evento_actions.php?action=list',
                        createAction: 'actions/evento_actions.php?action=create',
                        updateAction: 'actions/evento_actions.php?action=update',
                        deleteAction: 'actions/evento_actions.php?action=delete'
                    },
                    fields: {
                        evento_id: {
                            key: true,
                            create: false,
                            edit: false,
                            list: false
                        },
                        evento_descricao: {
                            title: 'Descricao',
                            width: '40%'
                        },
                    },
                    
                });

                //Load person list from server

                $('#evento').jtable('load')
            });

        </script>


    </body>

</html>
