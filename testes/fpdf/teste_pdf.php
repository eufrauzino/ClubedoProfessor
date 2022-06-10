<?php
  require('./fpdf17/fpdf.php');
  // Aqui criamos o objeto $pdf que terá as funções da nossa classe pai.
  // Aqui já podemos passar algumas variáveis.
  // O primeiro é a orientação da página:
  // ("P" ou "portrait" = retrato) ("L" ou "landscape" = paisagem)
  // O segundo é a unidade metrica que você irá utilizar:
  // ("pt" = pontos) ("mm" = milimetros) ("cm" = centimetros) ("in" = polegadas)
  // O terceiro é o tamanho da página/papel
  // "A3", "A4", "A5", "letter" e "legal" são os tamanho já pré-definidos, mas
  // também pode ser passado o tamanho por meio de um array array('largura','altura')
  // onde os valores largura e altura podem ser qualquer número real maior que '0'.
  // caso algum ou nenhum valor for passado, irá assumir o
  // Escopo: FPDF($orientation='P', $unit='mm', $size='A4')
  $pdf=new FPDF("P","mm","A4");
 
  // Define o autor do documento
  // A primeira informação passada é o nome do autor.
  // A segunda é informando, se ela é codificada em UTF8 (1 = sim) (0 = não)
  // Para o caso de se ter problemas com acentuação
  // Valor default somente no campo UTF8, $author é obrigatório:
  // Escopo: SetAuthor($author, $isUTF8=false)
  $pdf->SetAuthor("Carlos Fagiani Junior",0);
 
  // Define o título do documento
  // A primeira informação passada é o título.
  // A segunda é informando, se ela é codificada em UTF-8 (1 = sim) (0 = não)
  // Valor default somente no campo UTF8, $title é obrigatório:
  // Escopo: SetTitle($title, $isUTF8=false)
  $pdf->SetTitle("Criando PDF com FPDF e PHP",0);
 
  // O FPDF tem uma contagem interna de páginas, e o número total pode ser usado
  // passado a 'alias' padrão '{nb}', caso queira trocar essa alias utilize o
  // comando abaixo, no caso troquei para '{np}', pode ser qualquer coisa, {totalPag}
  // Escopo com valor default: AliasNbPages($alias='{nb}')
  $pdf->AliasNbPages('{np}');
 
  // Aqui são definidas as margens da página, lembrando que a unidade métrica
  // foi definida em milímetros.
  // Essa função pode ser redefinida para cada página, bastando reescrevela
  // margem direita, margem superior, margem esquerdo
  // 10mm = 1cm dãmmmmm
  // Valor default 10,30,10 para a página A4
  // Escopo: SetMargins($left, $top, $right=null)
  $pdf->SetMargins(10,30,10);
 
  //Adiciona uma página
  // O primeiro é a orientação da página:
  // ("P" ou "portrait" = retrato) ("L" ou "landscape" = paisagem)
  // O segundo é o tamanho da página/papel
  // "A3", "A4", "A5", "letter" e "legal", também pode ser passado por um array
  // array('largura','altura')
  // Default, pega o valor do documento:
  // Escopo: AddPage($orientation='', $size='')
  $pdf->AddPage();
 
  // Apartir daqui começamos a escrever no documento
  // Define a fonte, o estilo e o tamanho da fonte.
  // ver a pasta "/fpdf/font/" para verificar as fontes suportadas
  // Escopo: SetFont($family, $style='', $size=0)
  $pdf->SetFont('Arial','B',12);
 
  // Só se consegue escrever no PDF dentro de uma cell ou multicell
  // cell só escreve uma linha
  // O primeiro é a largura
  // O segundo a altura
  // O terceiro o texto em sí
  // O quarto se vai ter borda ou não (1=sim) (0=não)
  // O quinto eu realmente não sei para que serve, mas tem alguma coisa a ver com
  // a margem
  // O sexto é o alinhamento do texto na página
  // O sete e o oito também não sei :/
  // ("L" = Esquerda) ("R" = Direita) ("C" = Centralizado)
  // Escopo: Cell($w, $h=0, $txt='', $border=0, $ln=0, $align='', $fill=false, $link='')
  $pdf->cell(0,0,"texto alinhado ao centro",0,0,"C");
 
  // Quebra de linha, pode ser definido o tamanho da altura
  // Escopo: Ln($h=null);
 
  $pdf->Ln(10);
  $pdf->cell(0,0,"Texto alinhado a esquerda",0,0,"L");
  $pdf->Ln(10);
  $pdf->cell(0,0,"Texto alinhado a direita",0,0,"R");
 
  // multicell escreve várias linhas, aceita o comando "\n" para quebra de linha
  // O primeiro é a largura
  // O segundo a altura
  // O terceiro o texto em sí
  // O quarto se vai ter borda ou não (1=sim) (0=não)
  // O quinto é o alinhamento do texto na página
  // O setimo é preenchimento, mas não sei como se aplica :/
  // Escopo: MultiCell($w, $h, $txt, $border=0, $align='J', $fill=false)
  $pdf->MultiCell(0,0,"Aqui vai um texto longo,para que possa ser feito a quebra de linha, como você pode ver isso acontecendo aqui, essa forma é boa para textos longo, para textos curtos é preferível a utilização da função 'cell'. a quebra de linha\n pode ser feito com o \\n \n OK",0,"J");
 
  // Gera o arquivo PDF
  // Caso não passe nunhum parâmetro, o pdf será enviado para o browser.
  // O primeiro é o nome do arquivo "arquivo.pdf"
  // O segundo é o destino ("I" = Saida padrão) ("D" = Download)
  // ("F" = Salva para arquivo local) ("S" = retorna como string)
  // Escopo: Output($name='', $dest='')
  $pdf->Output();
 
?>