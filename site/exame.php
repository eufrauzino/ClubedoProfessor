
<body>
    <?php
    $id = $_REQUEST["id"];
    $nome = $_REQUEST["nome"];
    $data = date("Y/m/d");
    ?>

    <div id="exame"></div> 
    <script type="text/javascript">

        $(document).ready(function() {

            //Prepare jTable
            $('#exame').jtable({
                title: 'Exames medico do socio <?php echo $nome ?>',
                paging: true,
                jqueryuiTheme: true,
                pageSize: 10,
                sorting: true,
                showCloseButton: false,
                selecting: false,
                editColumns: 2,
                defaultSorting: 'exame_id ASC',
                actions: {
                    listAction: 'actions/exame_actions.php?action=list&id=' +<?php echo $id ?>,
                    createAction: 'actions/exame_actions.php?action=create',
                    updateAction: 'actions/exame_actions.php?action=update',
                    deleteAction: 'actions/exame_actions.php?action=delete'
                },
                fields: {
                    exame_id: {
                        key: true,
                        create: false,
                        edit: false,
                        list: false
                    },
                    exame_validade: {
                        title: 'Validade',
                        type: 'date'
                    },
                    exame_socio: {
                        title: 'Socio',
                        width: '40%',
                        options: function(data) {
                            return "actions/exame_actions.php?action=socio&id=" +<?php echo $id ?>;
                        },
                    },
                    exame_medico: {
                        title: 'Medico',
                    },
//                    regressiva: {
//                        title: 'REG P/ CONFIRMAR',
//                        display: function(data) {
//                            a = data.record.exame_validade;
//                            $(function() {
//                                var d, h, m, s;
//                                $('div#clock').countdown(new Date(a), function(event) {
//                                    var timeFormat = "%d day(s) %h:%m:%s",
//                                            $this = $(this);
//                                    switch (event.type) {
//                                        case "days":
//                                            d = event.value;
//                                            break;
//                                        case "hours":
//                                            h = event.value;
//                                            break;
//                                        case "minutes":
//                                            m = event.value;
//                                            break;
//                                        case "seconds":
//                                            s = event.value;
//                                            break;
//                                        case "finished":
//                                            $this.fadeTo('slow', 0.5);
//                                            break;
//                                    }
//                                    // Assemble time format
//                                    if (d > 0) {
//                                        timeFormat = timeFormat.replace(/\%d/, d);
//                                        timeFormat = timeFormat.replace(/\(s\)/, Number(d) == 1 ? '' : 's');
//                                    } else {
//                                        timeFormat = timeFormat.replace(/\%d day\(s\)/, '');
//                                    }
//                                    timeFormat = timeFormat.replace(/\%h/, h);
//                                    timeFormat = timeFormat.replace(/\%m/, m);
//                                    timeFormat = timeFormat.replace(/\%s/, s);
//                                    // Display
//                                    $this.html(timeFormat);
//                                });
//                            });
//                            return '<div id="clock" style="color: red" ></div> '
//
//                        }
//
//                    },
                },
                rowInserted: function(event, data) {
                            if (data.record.exame_validade>='<?php $data?>') {
                                data.row.css('background-color', '#00FF7F');
                            }
                            else
                                data.row.css('background-color', '#FF3030');
                        },
            });

            //Load person list from server

            $('#exame').jtable('load')
        });

    </script>


</body>

