<!DOCTYPE html>
<html>
    <head>

        <script>
            $(function() {
                $("#dados").dialog({
                    width: 600,
                    autoOpen: false,
                    modal: true,
                    show: {
                        effect: "fade",
                        duration: 100
                    },
                    hide: {
                        effect: "fade",
                        duration: 100
                    },
                    // função para atualizar a pagina automaticamente ao fechar
//                    close: function() {
//                        window.location.href = 'catfreq.php';
//                    }
                }); // JANELA
            });</script>
        <script>

            $(document).ready(function() {

                $('#calendar').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,basicWeek,basicDay',
//                        aspectRatio: 2
                    },
                    eventClick: function(calEvent, jsEvent, view) {

                        $('#dados').dialog('open'); //abrindo
//                        $('#dados').dialog('option', 'position', [jsEvent.pageX, jsEvent.pageY]); //abrindo em uma posicao correspondente pelo coordination
                        id = calEvent.id; //pegando o id,                       
//                                                             
//                        $("#status").html("<img src=img/loader.gif' alt='Enviando' />");
//                   
//                        $.post("./detalhes_itemloc.php", {id: id}, function(resposta) {
//                            
                        // Limpa a mensagem de carregamento
                        $("#dados").empty();
                        // Coloca as frases na DIV
                        $("#dados").append(
                                "<img style='width:124px' src='img/" + calEvent.foto + "'>" +
                                "<table border ='0' cellspacing='7' cellpadding='7'><tr><th colspan='2'><center> " + calEvent.title +
                                "</center></th><tr><td> EVENTO:<u>" + calEvent.evento + "</u></td>" +
                                "<td>VALOR - " + calEvent.valor + "</td></table>"
                                );
                    },
                    eventSources: [
                        'actions/json-events.php',
                        {
                            url: "actions/json-events.php?evento=situacao",
                            color: 'red', // an option!
                            textColor: 'white', // an option!
                            
                        },
                        {
                            url: "actions/json-events.php?evento=locacao",
//                            color: 'yellow', // an option!
//                            textColor: 'black', // an option!
                        }
                    ],
//                    events: {
//                        // your event source
//
//                        // url: "actions/json-events.php?evento=situacao", // use the url property
//                        color: 'yellow', // an option!
//                        textColor: 'black', // an option!
//                        // any other sources...
//
//                    },
                    theme: true,
                    editable: true,
                    eventDrop: function(event, delta) {
                        alert(event.title + ' was moved ' + delta + ' days\n' +
                                '(should probably update your database)');
                    },
                    loading: function(bool) {
                        if (bool)
                            $('#loading').show();
                        else
                            $('#loading').hide();
                    }

                });
            });

        </script>
        <style>
            /*        
                            body {
                                    margin-top: 40px;
                                    text-align: center;
                                    font-size: 14px;
                                    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
                                    }*/

            #loading {
                position: absolute;
                top: 5px;
                right: 5px;
            }

            #calendar {
                width: 1000px;
                margin: 0 auto;
            }

        </style>
    </head>
    <body>
        <div id='loading' style='display:none'>loading...</div>
        <div id='calendar'></div>
        <div <a href="javascript:func()" style="" id="dados" title="DETALHES DA RESERVA">          
                              <!--<span id="status"></span> <div id="frases" title="DETALHES">-->        
                <?php //include './itemloc_1.php';    ?>

        </div>
    </body>
</html>
