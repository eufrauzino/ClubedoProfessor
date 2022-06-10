
<html>

    <body>

        <div id="calendario">

            <form>
                <span style="font-family: 'Segoe UI Semilight', 'Open Sans', Verdana, Arial, Helvetica, sans-serif;font-size: 13px; font-weight: 600;">Pesquisa: </span>
                <select name='pesquisa' id='pesquisa' style="font-family: 'Segoe UI Semilight', 'Open Sans', Verdana, Arial, Helvetica, sans-serif;font-size: 12px; font-weight: 400;">
                    <option></option>
                    <option>SALAO SOCIAL</option>                       
                    <option>CHURRASQUEIRA GRANDE</option>
                    <option>CHURRASQUEIRA PEQUENA</option>                    
                </select>

                <button type="submit" id="LoadRecordsButton" style="font-family: 'Segoe UI Semilight', 'Open Sans', Verdana, Arial, Helvetica, sans-serif;font-size: 13px; font-weight: 600;">Selecionar</button >

            </form> 


        </div>
        <script type="text/javascript">

            $(document).ready(function() {

                //Prepare jTable
                $('#calendario').jtable({
                    title: 'CALEDARIO EM TABELA',
                    paging: true,
                    pageSize: 100,
                    jqueryuiTheme: true,
                    sorting: true,
                    showCloseButton: false,
                    selecting: false,
                    defaultSorting: 'itemobj_data DESC',
                    defaultDateFormat: 'dd-mm-',
                    actions: {
                        listAction: 'actions/calendario_actions.php?action=list',
                    },
                    fields: {
                        itemobj_id: {
                            key: true,
                            create: false,
                            edit: false,
                            list: false
                        },
                        
                        itemobj_data: {
                            title: 'DATA',
                            type: 'date',
                            defaultValue: function() {
                            },
                            display: function(data) {
                                return"<b><div style='color:black'>" + $.datepicker.formatDate("dd 'de' MM 'de' yy '-' D", new Date(data.record.itemobj_data))
                            }
                            // inputClass: 'validate[required,custom[date]]'
                        },
                        objeto_descricao: {
                            title: 'DEPENDENCIA'
                        },
                        socio_nome: {
                            title: 'SOCIO',
                        },
                        itemobj_parente: {
                            sorting: false,
                            title: 'RELACAO',
                            //                            width: '40%',
                            options: 'actions/itemloc_actions.php?action=parente',
                        },
                        itemobj_evento: {
                            sorting: false,
                            title: 'EVENTO',
                            //                            width: '40%',
                            options: 'actions/itemloc_actions.php?action=evento'
                        },
                        //                        itemobj_tipoloc: {
                        //                            title: 'EVENTO',
                        //                            width: '40%',
                        //                            options: 'actions/itemloc_actions.php?action=tipolocacao'
                        //                        },


                        /*USANDO O FOOTER PARA COLOCAR NA BARRA INFERIOR O VALOR TOTAL*/
                        obj_tipo_valor: {
                            sorting: false,
                            width: '15%',
                            title: 'SUB TOTAL',
                            create: false,
                            edit: false,
                            display: function(data) {
                                return "<center style='color: blue;'>R$" + data.record.obj_tipo_valor + "</center>";
                            },
                        },
                    },
                
                });

                //Load person list from server
                $('#LoadRecordsButton').click(function(e) {
                    e.preventDefault();
                    $('#calendario').jtable('load', {
                        pesquisa: $('#pesquisa').val()
                    });
                });
                $('LoadRecordsButton').click();
                $('#calendario').jtable('load')
            });

        </script>

    </body>
</html>