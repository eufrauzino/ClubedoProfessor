<html>
    <head>

    </head>

    <body>


        <div id="tipolocacao"></div> 
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#tipolocacao').jtable({
                    title: 'REGRAS DE LOCACAO',
                    paging: true,
                    jqueryuiTheme: true,
                    pageSize: 10,
                    sorting: true,
                    showCloseButton: false,
                    selecting: false,
                    editColumns: 2,
                    defaultSorting: 'obj_tipo_id ASC',
                    openChildAsAccordion: true,
                    actions: {
                        listAction: 'actions/tipolocacao_actions.php?action=list',
                        createAction: 'actions/tipolocacao_actions.php?action=create',
                        updateAction: 'actions/tipolocacao_actions.php?action=update',
                        deleteAction: 'actions/tipolocacao_actions.php?action=delete'
                    },
                    fields: {
                        obj_tipo_id: {
                            key: true,
                            create: false,
                            edit: false,
                            list: false
                        },
                        obj_tipo_obj: {
                            title: 'DEPENDENCIA',
                            width: '40%',
                            options: function(data) {
                                return "actions/tipolocacao_actions.php?action=dependencia"; 
                            }
                        },
                        obj_tipo_grauloc: {
                            title: 'NIVEL DA LOCACAO',
                            width: '40%',
                            options: function(data) {
                                return "actions/tipolocacao_actions.php?action=nivel"; 
                            }
                        },
                        obj_tipo_evento: {
                            title: 'EVENTO DA LOCACAO',
                            width: '40%',
                            options: function(data) {
                                return "actions/tipolocacao_actions.php?action=evento"; 
                            }
                        },
                        obj_tipo_descricao: {
                            title: 'DESCRICAO',
                            width: '40%'
                        },
                        obj_tipo_valor: {
                            title: 'VALOR DA LOCACAO',
                            width: '40%',
                            display:function(data){
                                return "R$"+data.record.obj_tipo_valor
                            }
                        }                       
                        
                      
                    },
                   
                });

                //Load person list from server

                $('#tipolocacao').jtable('load')
            });

        </script>


    </body>

</html>
