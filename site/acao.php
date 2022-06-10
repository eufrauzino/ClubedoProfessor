
<html>


    <body>

        <div id="acao"></div>
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#acao').jtable({
                    title: 'CADASTRO DE ACAO',
                    paging: true,
                    pageSize: 10,
                    jqueryuiTheme: true,
                    sorting: true,
                    showCloseButton: false,
                    selecting: false,
                    editColumns: 2,
                    defaultSorting: 'acao_id ASC',
                    openChildAsAccordion: true,
                    actions: {
                        listAction: 'actions/acao_actions.php?action=list',
                        createAction: 'actions/acao_actions.php?action=create',
                        updateAction: 'actions/acao_actions.php?action=update',
                        deleteAction: 'actions/acao_actions.php?action=delete'
                    },
                    fields: {
                        acao_id: {
                            title: 'Numero da Acao',
                            key: true,
                            create: true,
                            edit: true,
                            list: true,
                            inputClass: 'validate[required,custom[onlyNumberSp]]'
                        },
                        acao_socioant: {
                            title: 'Socio Anterior',
//                            width: '20%',
                            list: false,
                        },
                        acao_atualizacao: {
                            title: 'atualizacao', 
//                            width: '20%',
                            edit: false,
                            create: false
                        },
                        acao_cat_acao: {// CATEGORIA
                            title: 'Categoria',
                            options: 'actions/acao_actions.php?action=cat_acao',
//                            width: '20%',
                            list: true


                        },
                        acao_data: {
                            title: 'data de criacao',
                            type: 'date'

                        },
                        acao_tipo: {
                            title: 'Restricao',
                            type: 'radiobutton',
                            options: {'1': 'SOCIO', '2': 'NAO SOCIO'}
                        },
                        acao_obs: {
                            type: 'text',
                            title: 'observacao'

                        },
                    },
                    formCreated: function(event, data) {
                        data.form.validationEngine();
                    },
                    //Validate form when it is being submitted
                    formSubmitting: function(event, data) {
                        return data.form.validationEngine('validate');
                    },
                    //Dispose validation logic when form is closed
                    formClosed: function(event, data) {
                        data.form.validationEngine('hide');
                        data.form.validationEngine('detach');
                    }
                    
                
                });

                //Load person list from server

                $('#acao').jtable('load')
            });

        </script>

    </body>
</html>