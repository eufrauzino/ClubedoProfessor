<html>
    <head>

    </head>

    <body>

                <form action="relatorio/mensalidades atrasadas.php" method="GET">
                    <select>
                        <option></option>
                        <option>MENSALIDADES ATRASADAS</option>
                        <option>TODAS MENSALIDADES</option>
                    </select>
                    <button>gerar</button>
                </form>
        <div id="mespag" ></div>
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#mespag').jtable({
                    title: 'MES DE PAGAMENTO',
                    paging: true,
                    jqueryuiTheme: true,
                    pageSize: 10,
                    sorting: true,
                    showCloseButton: false,
                    selecting: false,
                    editColumns: 2,
                    defaultSorting: 'mespag_mes DESC',
//                    toolbar: {
//                        items: [{
//                                
//                                icon: '', //replace with your path
//                                text: 'RELATORIO',
//                                click: function() {
//                                   
//                                }
//                            }]
//                    },
                    actions: {
                        listAction:   'actions/mespag_actions.php?action=list',
                        createAction: 'actions/mespag_actions.php?action=create',
                        updateAction: 'actions/mespag_actions.php?action=update',
                        deleteAction: 'actions/mespag_actions.php?action=delete'
                    },
                    fields: {
                        mespag_id: {
                            key: true,
                            create: false,
                            edit: false,
                            list: false
                        },
                        mespag_uso:{
                           type:'hidden',
                           list: false,
                           defaultValue:0
                        },
                        mespag_mes: {
                            title: 'MES DE PAGAMENTO',
                            options: {'1': 'JANEIRO', '2': 'FEVEREIRO', '3': 'MARCO', '4': 'ABRIL',
                                '5': 'MAIO', '6': 'JUNHO', '7': 'JULHO', '8': 'AGOSTO',
                                '9': 'SETEMBRO', '10': 'OUTUBRO', '11': 'NOVEMBRO', '12': 'DEZEMBRO'},
                        },
                        mespag_ano: {
                            title: 'ANO',
                            edit: false,
                            create: false

                        },
                        entrada_mens: {
                            title: 'ENT MENSALIDADE',
                            width: '5%',
                            edit: false,
                            create: false,
                            display: function(data) {
                                return $('<input type="button" name="entrada" style="" value=entrada onClick="self.location=\'actions/mespag_actions.php?action=entrada_mes&&ano='+data.record.mespag_ano+'&&mespag_uso='+data.record.mespag_uso+'&&mes='+data.record.mespag_mes+'&&mespag_id= '+data.record.mespag_id+'\'"/>');
                            }
                        }


                    }
                });

                //Load person list from server

                $('#mespag').jtable('load')
            });

        </script>


    </body>
</html>
