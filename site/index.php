<!--

        <div class="menu">


            <table class="tabMenu">

                <tr>
                    <td>
                        <a class="linkMenu" href=index.php>Inicio</a>
                    </td>
                    <td>
                        <a class="linkMenu" href="#">Reservas</a>
                    </td>
                    <td>
                        <a class="linkMenu" href="#">Socio</a>
                    </td>
                    <td>
                        <a class="linkMenu" href="#">Configuracao</a>
                    </td>
                    <td>
                        <a class="linkMenu" href="#">Tutoriais</a>
                    </td>
                    <td>
                        <a class="linkMenu" href="#">Noticias</a>
                    </td>
                </tr>
            </table>
        </div>-->

<!--<center style="margin:10px"><ul id="css3menu1" class="topmenu">
        <li class="topfirst"><a href="index_socio.php" style="height:18px;line-height:18px;">SOCIO</a></li>
        <li class="topmenu"><a href="#" style="height:18px;line-height:18px;">Item 3</a></li>
        <li class="topmenu"><a href="#" style="height:18px;line-height:18px;"><span>UTILITARIOS</span></a>
        <ul>
            <li><a href="mensalidade.php">MENSALIDADE</a></li>
            <li><a href="index_acao.php">ACAO</a></li>
                <li><a href="#">CIDADE</a></li>
        </ul></li>
        <li class="topmenu"><a href="#" style="height:18px;line-height:18px;"><span>CATEGORIA</span></a>
        <ul>
                <li><a href="#">CATEGORIA 0</a></li>
        </ul></li>
        <li class="toplast"><a href="#" style="height:18px;line-height:18px;">Item 4</a></li>
</ul><p class="_css3m"><a href="http://css3menu.com/">CSS Menu Expand Css3Menu.com</a></p></center>
-->

<html>
    <head>



        <link href="../jtable.2.3.0/themes/jqueryui/jtable_jqueryui.css" rel="stylesheet" type="text/css" />
        <link href="../jtable.2.3.0/themes/jqueryui/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" />
        <link href="../jtable.2.3.0/external/jQuery-Validation-Engine-master/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />    
        <link rel="stylesheet" href="../script/estrutura.css" type="text/css"/>
        <link href='../script/fullcalendar/fullcalendar.css' rel='stylesheet' />
        
        
      
        <script src="../script/jquery-1.10.1.js"></script>
        <script src="../jtable.2.3.0/external/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
        <script src="../script/jquery.layout-latest.js"></script>    
        <script src="../script/layout.resizePaneAccordions-1.2.js"></script>    
        <script src="../jtable.2.3.0/jquery.jtable.js" type="text/javascript"></script>        
        <script src="../jtable.2.3.0/external/jQuery-Validation-Engine-master/js/jquery.validationEngine.js" type="text/javascript"></script>
        <script src="../jtable.2.3.0/external/jQuery-Validation-Engine-master/js/languages/jquery.validationEngine-pt_BR.js" type="text/javascript"></script>
          <!--mascaras-->
        <script src="../jtable.2.3.0/external/jquery.maskedinput.min.js"></script>  
        <script src='../script/fullcalendar/fullcalendar.js'></script>
        <script src="../jtable.2.3.0/localization/jquery.jtable.pt-BR.js" type="text/javascript"></script>
        <style>
            #accordion-resizer {
                padding: 10px;
                width: 260px;
                height: 620px;
                font-size:12px;
                
            }

            label {
                display: inline-block;
                width: 5em; 
            }


        </style>
        <script>

//            $(function() {
//                $("input[type=submit], a, button")
//                        .button()
//                        .click(function(event) {
//                    event.preventDefault();
//                });
//            });//BUTTON

//            $(function() {
//                $(document).tooltip();
//            });//TOLTIP

//JANELA MODAL PARA TRAZER MAIS INFORMACOES DETALHES
            $(function() {
                $("#detalhes").dialog({
                    width: "80%", 
                    height: 800,
                    autoOpen: false,
                    modal: true,
                    show: {
//                        effect: "fade",
//                        duration: 1
                    },
                    hide: {
//                        effect: "fade",
//                        duration: 1
                    },
                    // função para atualizar a pagina automaticamente ao fechar
//                    close: function() {
//                        window.location.href = 'catfreq.php';
//                    }
                });// JANELA

//$( "#opener" ).click(function() {
//      $( "#dialog" ).dialog( "open" );
//    });
//                
                //var id = $("#frases p:last").attr("lang");

            });

            $(document).ready(function() {
                $('body').layout({
                    name:"club",
                    scrollToBookmarkOnLoad:true,
                    slideTrigger_open:"mouseover" ,
                    slideTrigger_close:"mouseout", 
                    sliderTip : "Slide Open", 
                   
                    west__size: 300
                            , east__size: 350
                            // RESIZE Accordion widget when panes resize
                            , west__onresize: $.layout.callbacks.resizePaneAccordions
                            , east__initClosed: true
                            , west__initClosed: false
                            , south__initClosed: true                            
                            , north__initClosed: false                           
                            , east__onresize: $.layout.callbacks.resizePaneAccordions, applyDefaultStyles: true,});
                var myLayout = $("body")
            });
            
            
            $(function() {
                $("#accordion").accordion({
                    heightStyle: "fill",
                    event: "click hoverintent"
                });
            });
            
            $(function() {                
                $("#accordion-resizer").resizable({
                    minHeight: 240,
                    minWidth: 200,
                    resize: function() {
                        $("#accordion").accordion("refresh");
                    }
                });
            });

            $(function() {
                $("#datepicker").datepicker();
            });
        </script>

       
        
        
    </head>
    <body>
        <div class="ui-layout-center">

            <?php 
            
            $tabela = $_REQUEST['tabela'];
            //echo 'tabela = ' . $tabela;
            if ($tabela == "socio") {
                require './socio.php';
            
            } else if ($tabela == "acao") {
                require './acao.php';
                
             } else if ($tabela == "homeacao") {
                require './index_acao.php';
            } else if ($tabela == "cat_acao") {
                require './cat_acao.php';
            } else if ($tabela == "catfreq") {
                require './catfreq.php';
            }
            else if ($tabela == "grauloc") {
                require './graulocacao.php';
            }
            else if ($tabela == "parentesco") {
                require './parentesco.php';
            }
            else if ($tabela == "evento") {
                require './evento.php';
            }
            else if ($tabela == "dependencia") {
                require './dependencia.php';
            }
            else if ($tabela == "opcionais") {
                require './produto.php';
            }
            else if ($tabela == "homeconfig") {
                require './menuconfig.php';
            }
            else if ($tabela == "tipolocacao") {
                require './tipolocacao.php';
            }
            else if ($tabela == "menspag") {
                require './mespag.php';
            } else if ($tabela == "cargo") {
                require './cargo.php';
            } else if ($tabela == "entmens") {
                require './entrada_mensalidade.php';
            }
            else if ($tabela == "itemloc") {
                require './itemloc.php';
            }
            else if($tabela == "caixa"){
                require './caixa.php';
            }
            else if ($tabela == "calendario_locacao") {
                require './calendario_locacao.php';
            }
            else if ($tabela == "calendario_tabela") {
                require './calendario_tabela.php';
            }
            
            
            
            
            else if ($tabela == "locacao") {
                require './locacao.php';
            }
            else
                require './principal.php';
            ?>


        </div>


        <div class="ui-layout-north">

     
            <div id="topo"><div style="float: left;margin-left: 10px">CLUBE DOS PROFESSORES DO NOROESTE</div>

<!--                <div class="login">

                    <form action="" method="post">
                        <table>
                            <tr>
                                <td style="color: white">Login</td>
                                <td><input type="text" name="usuario" size="15"></td>
                           
                                <td style="color: white">Senha</td>
                                <td><input type="password" name="senha" size="15"></td>
                            
                                <td colspan="2">
                                    <input type="submit" value="Login">
                                   
                                </td>
                            </tr>
                        </table>
                    </form>


                </div>-->

            </div>
            
        </div>
<!--        <div class="ui-layout-south">
            <div id="rodape">wad </div>
        </div>
        <div class="ui-layout-east"> 
            Date: <div id="datepicker"></div>
        </div>-->

        <div class="ui-layout-west">
            <div id="accordion-resizer" class="ui-widget-content">
                <div id="accordion">
                    <h3>SOCIO</h3>
                    <div>
                        <p>
                            <a href="index.php?tabela=principal">HOME</a><br>
                            <a href="index.php?tabela=socio" title="ADD SOCIOS E DEPENDENTES, ALTERAR, EXCLUIR " />SOCIOS</a><br>
                          
                            
                            <!--                            <a href="index.php?tabela=cad_dep">CADASTRO DEPENDENTE</a><br>
                                                        <a href="index.php?tabela=cad_socio_fut">CADASTRO SOCIO FUTEBOL</a><br>-->

                        </p>

                    </div>
                    <h3>ACAO</h3>
                    <div>
                        <p>
                            <a href="index.php?tabela=homeacao">HOME</a><br>
                            <a href="index.php?tabela=acao">CADASTRO DE ACAO</a><br>
                            <a href="index.php?tabela=cat_acao">CATEGORIA DE ACAO</a><br>

                        </p>

                    </div>
                    <h3>MENSALIDADE</h3>
                    <div>
                        <p>
                            <!--<a href="#">HOME</a><br>-->

                            <a href="index.php?tabela=menspag">MES DE PAGAMENTO</a><br>
                            <!--<a href="#">ENTRADA MENSAL</a><br>-->
                        </p>
                    </div>
                    <h3>RESERVAS</h3>
                    <div>
                        <p>
                            <a href="index.php?tabela=locacao">RESERVAS</a><br>   
                            <a href="index.php?tabela=calendario_locacao">CALENDARIO DE RESERVAS</a><br>   
                            <a href="index.php?tabela=calendario_tabela">CALENDARIO EM TABELA</a><br>   
                            
                            
                        </p>
                    </div>   
                    <h3>FINANCEIRO</h3>
                    <div>
                        <p>
                            <!--<a href="#">HOME</a><br>-->                                               
                            <a href="index.php?tabela=menspag">DEBITO MENSALIDADE</a><br>
                            <!--<a href="index.php?tabela=entmens">ENTRADA MENSALIDADE</a><br>-->
                        </p>
                    </div>   
<!--                    <h3><img src="img/package_settings.png" style="width:32px"></h3>-->
                     <h3>FERRAMENTAS</h3>
                    <div>
                        <p> 
                            <a href="index.php?tabela=homeconfig">HOME</a><br>
                            <a href="index.php?tabela=cargo">CARGOS</a><br>                          
                            <a href="index.php?tabela=catfreq">CATEGORIA FREQUENTADOR</a><br>
                            
                            <a href="index.php?tabela=dependencia">DEPENDENCIA</a><br>
                             <a href="index.php?tabela=opcionais">OPCIONAIS</a><br>
                            <a href="index.php?tabela=tipolocacao">REGRAS DE LOCACAO</a><br>
<!--                            <a href="#">TERMO DE ACEITE</a><br>-->
                            <a href="index.php?tabela=evento">EVENTOS</a><br>
                            <a href="index.php?tabela=grauloc">GRAU DE LOCACAO</a><br>
                            <a href="index.php?tabela=parentesco">PARENTESCO</a><br>
                        </p>
                    </div>   
                    <h3>RELATORIOS</h3>
                    <div>
                        <p>
                            <!--<a href="#">HOME</a><br>-->

                        </p>
                    </div>   
                </div>
            </div>
        </div>
    </body>
</html>
