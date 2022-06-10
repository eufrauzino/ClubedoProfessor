
<meta charset="UTF-8"> 
<style type="text/css"> 
    table {width: 70%; border-collapse: collapse;} 
    table, td, th {border: 1px solid black;} 
</style> 
<h1>clubesys</h1>
<ol>
    <li><a href = "#Socio">Socio</a> (28 campos)</li><li><a href = "#Dependente">Dependente</a> (7 campos)</li><li><a href = "#Locacao">Locacao</a> (6 campos)</li><li><a href = "#Produto">Produto</a> (6 campos)</li><li><a href = "#Funcionario">Funcionario</a> (7 campos)</li><li><a href = "#Parentesco">Parentesco</a> (3 campos)</li><li><a href = "#catfreq">catfreq</a> (5 campos)</li><li><a href = "#tb_cidades">tb_cidades</a> (4 campos)</li><li><a href = "#tb_estados">tb_estados</a> (3 campos)</li><li><a href = "#exame">exame</a> (4 campos)</li><li><a href = "#Acao">Acao</a> (7 campos)</li><li><a href = "#ItemProduto">ItemProduto</a> (5 campos)</li><li><a href = "#dependencia">dependencia</a> (6 campos)</li><li><a href = "#itemlocacao">itemlocacao</a> (6 campos)</li><li><a href = "#CatAcao">CatAcao</a> (3 campos)</li><li><a href = "#tipolocacao">tipolocacao</a> (6 campos)</li><li><a href = "#grauLoc">grauLoc</a> (2 campos)</li><li><a href = "#evento">evento</a> (2 campos)</li><li><a href = "#pagmensalidade">pagmensalidade</a> (6 campos)</li><li><a href = "#mespagamento">mespagamento</a> (3 campos)</li><li><a href = "#cargo">cargo</a> (4 campos)</li><li><a href = "#tipo_freq">tipo_freq</a> (2 campos)</li><li><a href = "#diretoria">diretoria</a> (5 campos)</li><li><a href = "#catdependecia">catdependecia</a> (2 campos)</li><li><a href = "#cupom">cupom</a> (6 campos)</li><li><a href = "#itemCupom">itemCupom</a> (4 campos)</li><li><a href = "#depinativo">depinativo</a> (5 campos)</li></ol>
<ol>
    <li id = "Socio">
        <h2>Socio</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>socio_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>socio_acao</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>socio_nome</td>
                <td>VARCHAR(255)</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>socio_cep</td>
                <td>VARCHAR(10)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_endereco</td>
                <td>VARCHAR(255)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_num_res</td>
                <td>VARCHAR(6)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_bairro</td>
                <td>VARCHAR(100)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_cidade</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>socio_fone_res</td>
                <td>VARCHAR(12)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_fone_cel</td>
                <td>VARCHAR(12)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_rg</td>
                <td>VARCHAR(15)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_cpf</td>
                <td>VARCHAR(12)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_nascimento</td>
                <td>DATE</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_civil</td>
                <td>VARCHAR(20)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_sexo</td>
                <td>CHAR(1)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_profissao</td>
                <td>VARCHAR(30)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_regime_trabalho</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_local_trabalho</td>
                <td>VARCHAR(50)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_fone_trabalho</td>
                <td>VARCHAR(12)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_observacao</td>
                <td>TEXT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_email</td>
                <td>VARCHAR(50)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_data_cadastro</td>
                <td>DATE</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_ativo</td>
                <td>TINYINT(1)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_foto</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_cat</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_padrinho</td>
                <td>VARCHAR(100)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_exame</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>socio_academia</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "Dependente">
        <h2>Dependente</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>dependente_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>dependente_nome</td>
                <td>VARCHAR(50)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>dependente_nascimento</td>
                <td>DATE</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>dependente_fone_res</td>
                <td>VARCHAR(12)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>dependente_fone_cel</td>
                <td>VARCHAR(12)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>dependente_parentesco</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>dependente_socio</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
        </table>
    </li>
    <li id = "Locacao">
        <h2>Locacao</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>locacao_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>locacao_data</td>
                <td>DATETIME</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>locacao_pago</td>
                <td>TINYINT(1)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>locacao_total</td>
                <td>DECIMAL(10, 2)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>locacao_socio</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>locacao_socionome</td>
                <td>VARCHAR(80)</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "Produto">
        <h2>Produto</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>produto_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>produto_descricao</td>
                <td>VARCHAR(30)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>produto_disponivel</td>
                <td>TINYINT(1)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>produto_valor</td>
                <td>DECIMAL(10, 2)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>produto_estoque</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>produto_cat_obj</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "Funcionario">
        <h2>Funcionario</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>funcionario_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>funcionario_nome</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>funcionario_funcao</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>funcionario_salario</td>
                <td>DECIMAL(10, 2)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>funcionario_login</td>
                <td>VARCHAR(20)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>funcionario_senha</td>
                <td>VARCHAR(8)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>funcionario_cargo</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "Parentesco">
        <h2>Parentesco</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>parentesco_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>parentesco_descricao</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>parentesco_tipo_grau</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "catfreq">
        <h2>catfreq</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>catfreq_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>mensalidade_valor</td>
                <td>DECIMAL(10, 2)</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>catfreq_descricao</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>catfreq_atualizacao</td>
                <td>DATETIME</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>catfreq_tipo</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "tb_cidades">
        <h2>tb_cidades</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>estado</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>uf</td>
                <td>VARCHAR(4)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>c_nome</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "tb_estados">
        <h2>tb_estados</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>uf</td>
                <td>VARCHAR(2)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>e_nome</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "exame">
        <h2>exame</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>exame_id</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>exame_validade</td>
                <td>DATE</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>exame_medico</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>exame_socio</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "Acao">
        <h2>Acao</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>acao_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>acao_data</td>
                <td>DATE</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>acao_socioant</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>acao_obs</td>
                <td>VARCHAR(255)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>acao_atualizacao</td>
                <td>DATETIME</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>acao_cat_acao</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>acao_tipo</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "ItemProduto">
        <h2>ItemProduto</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>itemprod_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>itemprod_objetos</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>itemprod_qtd</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>itemprod_itemlocacao</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>itemprod_data</td>
                <td>DATE</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "dependencia">
        <h2>dependencia</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>objeto_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>objeto_descricao</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>obeto_disponivel</td>
                <td>TINYINT(1)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>objeto_estoque</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>objeto_cat</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>objeto_foto</td>
                <td>VARCHAR(100)</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "itemlocacao">
        <h2>itemlocacao</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>itemobj_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>itemobj_tipoloc</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>itemobj_locacao</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>itemobj_responsavel</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>itemobj_data</td>
                <td>DATE</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>itemobj_totalitem</td>
                <td>DECIMAL(10, 2)</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "CatAcao">
        <h2>CatAcao</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>cat_acao_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>cat_acao_valor</td>
                <td>DECIMAL(10, 2)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>cat_acao_descricao</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "tipolocacao">
        <h2>tipolocacao</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>obj_tipo_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>obj_tipo_descricao</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>obj_tipo_valor</td>
                <td>DECIMAL(10, 2)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>obj_tipo_obj</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>obj_tipo_grauloc</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>obj_tipo_evento</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "grauLoc">
        <h2>grauLoc</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>grauloc_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>grauloc_descricao</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "evento">
        <h2>evento</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>evento_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>evento_descricao</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "pagmensalidade">
        <h2>pagmensalidade</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>pag_mens_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>pag_mens_data</td>
                <td>DATETIME</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>pag_mens_status</td>
                <td>TINYINT(1)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>pag_mens_valor</td>
                <td>DECIMAL(10, 2)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>pag_mens_socio</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>pag_mens_mes</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "mespagamento">
        <h2>mespagamento</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>mespag_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>mespag_ano</td>
                <td>YEAR</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>mespag_mes</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "cargo">
        <h2>cargo</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>cargo_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>cargo_descricao</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>cargo_nivel</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>cargo_tipo</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "tipo_freq">
        <h2>tipo_freq</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>tipo_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>tipo_descricao</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "diretoria">
        <h2>diretoria</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>dir_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>dir_socio</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>dir_login</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>dir_senha</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>dir_cargo</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
        </table>
    </li>
    <li id = "catdependecia">
        <h2>catdependecia</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>catdep_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>catdep_descricacao</td>
                <td>VARCHAR(45)</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "cupom">
        <h2>cupom</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>cupom_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>cupom_valor</td>
                <td>DECIMAL(10, 2)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>cupom_socio</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>cupom_data</td>
                <td>DATETIME</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>cupom_validade</td>
                <td>DATE</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>cupom_usado</td>
                <td>TINYINT(1)</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "itemCupom">
        <h2>itemCupom</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>itemcupom_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>itemcupom_cupom</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>itemcupom_locacao</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>itemcupom_valor</td>
                <td>DECIMAL(10, 2)</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
    <li id = "depinativo">
        <h2>depinativo</h2>

        <table>
            <tr>
                <th>CAMPO</th>
                <th>TIPO</th>
                <th>NULO</th>


            </tr>
            <tr>
                <td>depinativo_id</td>
                <td>INT</td>
                <td>NÃO</td>


            </tr>
            <tr>
                <td>depinativo_motivo</td>
                <td>VARCHAR(255)</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>depinativo_inicio</td>
                <td>DATE</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>depinativo_fim</td>
                <td>DATE</td>
                <td>SIM</td>


            </tr>
            <tr>
                <td>depinativo_dep</td>
                <td>INT</td>
                <td>SIM</td>


            </tr>
        </table>
    </li>
</ol>
</body>
