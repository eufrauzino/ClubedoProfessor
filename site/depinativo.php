<html>
    <head>

    </head>

    <body>
        <?php $id = $_POST["id"] ?>
        <?php $dependencia = $_POST["dependencia"] ?>
 <!--<img src="img/manut.jpg" title="MANUTENCAO">-->
        <div id="depinativo"></div> 
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#depinativo').jtable({
                    title: 'BLOQUEAR DEPENDENCIA',
                    paging: true,
                    defaultDateFormat: 'dd/mm/yy',
                    jqueryuiTheme: true,
                    pageSize: 10,
                   sorting: true,
                    showCloseButton: false,
                    selecting: false,
//                    editColumns: 2,
                    defaultSorting: 'depinativo_id ASC',

                    actions: {
                        listAction: 'actions/depinativo_actions.php?action=list&id=' +<?php echo $id ?>,
                        createAction: 'actions/depinativo_actions.php?action=create&id=' +<?php echo $id ?>,
                        updateAction: 'actions/depinativo_actions.php?action=update',
                        deleteAction: 'actions/depinativo_actions.php?action=delete'
                    },
                    fields: {
                        depinativo_id: {
                            key: true,
                            create: false,
                            edit: false,
                            list: false
                        },
                        depinativo_dep: {
                            title: 'Dependencia',
                            width: '40%',
                            options: function(data) {
                                return "actions/depinativo_actions.php?action=dep&id=" +<?php echo $id ?>;
                            }
                        },
                        depinativo_motivo: {
                            title: 'Motivo',
                            type: 'radiobutton',
                            options: {'LIMPEZA': 'LIMPEZA','REFORMA': 'REFORMA', 'PINTURA': 'PINTURA', 'MANUTENCAO': 'MANUTENCAO', 'INTERDITADO': 'INTERDITADO'},
                            width: '20%',
                            list: true
                        },
                        depinativo_inicio: {
                            title: 'Inicio do Bloqueio',
                            width: '40%',
                            type: 'date',
                            display: function(data) {
                                return "<div style='background-color:red;color:white'><b>" + data.record.depinativo_inicio + "</div>";
                            }
                        },
                        depinativo_fim: {
                            title: 'Fim do Bloqueio',
                            width: '40%',
                            type: 'date',
                            display: function(data) {
                                return "<div style='background-color:red;color:white'><b>" + data.record.depinativo_fim + "</div>";
                            }
                        },
                    },
                    formCreated: function(event, data)
                    {
                        data.form.find('[name=depinativo_inicio]').mask('99/99/9999');
                        data.form.find('[name=depinativo_fim]').mask('99/99/9999');
                    },                  
                });

                //Load person list from server

                $('#depinativo').jtable('load')
            });

        </script>


    </body>

</html>
