<html>
    <head>
        
    </head>

    <body>


        <div id="cargo" ></div>
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#cargo').jtable({
                    title: 'CARGOS',
                    paging: true,
                    jqueryuiTheme: true,
                    pageSize: 10,
                    sorting: true,
                    showCloseButton: false,
                    selecting: false,
                    editColumns: 2,
                    defaultSorting: 'cargo_descricao ASC',
                   
                    actions: {
                        listAction: 'actions/cargo_actions.php?action=list',
                        createAction: 'actions/cargo_actions.php?action=create',
                        updateAction: 'actions/cargo_actions.php?action=update',
                        deleteAction: 'actions/cargo_actions.php?action=delete'
                    },
                    fields: {
                        cargo_id: {
                            key: true,
                            create: false,
                            edit: false,
                            list: false
                        },
                        cargo_descricao: {
                            title: 'DESCRICAO',
                            width: '40%'
                        },
                        
                        
                        cargo_nivel: {
                            title: 'NIVEL DE ACESSO',
                            type: 'radiobutton',
                            options: { '1': '1 - RESTRITO', '2': '2 - SOCIO','3':'3 - ADMINISTRATIVO','4':'4 - PRESIDENCIA' },
                            defaultValue: '1'
                            
                        },
                        cargo_tipo: {
                            title: 'RESTRICAO',
                            type: 'radiobutton',
                            options: { '1': 'SOCIO', '3': 'FUNCIONARIO' },
                            defaultValue: '1'
                            
                        }

                    }
                });

                //Load person list from server

                $('#cargo').jtable('load')
            });

        </script>


    </body>
</html>
