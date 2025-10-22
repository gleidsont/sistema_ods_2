from flask import Flask, request, jsonify, send_file
import os
from werkzeug.utils import secure_filename
import pandas as pd
import numpy as np
import re
from unidecode import unidecode

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = '/home/gleidsonlima/sistema_ods_2/uploads'
app.config['OUTPUT_FOLDER'] = '/home/gleidsonlima/sistema_ods_2/outputs'
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024  # 16MB max

# Criar pastas se não existirem
os.makedirs(app.config['UPLOAD_FOLDER'], exist_ok=True)
os.makedirs(app.config['OUTPUT_FOLDER'], exist_ok=True)

@app.route('/')
def home():
    return "API Python funcionando! Use /processar_excel para enviar arquivos."

@app.route('/processar_excel', methods=['POST'])
def processar_excel():
    try:
        # Receber arquivo Excel do PHP
        if 'arquivo' not in request.files:
            return jsonify({"erro": "Nenhum arquivo enviado"}), 400

        arquivo = request.files['arquivo']

        if arquivo.filename == '':
            return jsonify({"erro": "Nome de arquivo vazio"}), 400

        # Salvar arquivo
        filename = secure_filename(arquivo.filename)
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        arquivo.save(filepath)

        # Ler Excel e gerar TXT
        txt_filename = processar_excel_para_txt(filepath)

        return jsonify({
            "status": "sucesso",
            "mensagem": "Excel processado com sucesso",
            "arquivo_txt": txt_filename
        })

    except Exception as e:
        return jsonify({"erro": str(e)}), 500

@app.route('/gerar_planilha', methods=['POST'])
def gerar_planilha():
    try:
        # Receber nome do arquivo TXT
        data = request.json
        txt_filename = data.get('arquivo_txt')

        if not txt_filename:
            return jsonify({"erro": "Nome do arquivo TXT não fornecido"}), 400

        txt_path = os.path.join(app.config['OUTPUT_FOLDER'], txt_filename)

        # Ler TXT e gerar planilha para Enketo
        excel_path = processar_txt_para_excel(txt_path)

        # Retornar arquivo para download
        return send_file(excel_path, as_attachment=True, download_name='form_odk.xlsx')

    except Exception as e:
        return jsonify({"erro": str(e)}), 500

# FUNÇÃO DO SEU SCRIPT 1
def processar_excel_para_txt(excel_path):
    """
    Lê o Excel e gera o TXT
    """
    planilha = 'Worksheet'
    df = pd.read_excel(excel_path, sheet_name=planilha)

    for i, valor in enumerate(df['ods']):
        if pd.isna(valor):
            print(f"Linha {i} tem NaN em ods")

    for i, valor in enumerate(df['n_fator']):
        if pd.isna(valor):
            print(f"Linha {i} tem NaN em n_fator")

    for i, valor in enumerate(df['fator_a']):
        if pd.isna(valor):
            print(f"Linha {i} tem NaN em fator_a")

    for i, valor in enumerate(df['fator_b']):
        if pd.isna(valor):
            print(f"Linha {i} tem NaN em fator_b")

    for i, valor in enumerate(df['ods_condicional']):
        if pd.isna(valor):
            print(f"Linha {i} tem NaN em ods_condicional")

    ods = df['ods'].dropna().tolist()
    n_fator = df['n_fator'].dropna().tolist()
    fator_b = df['fator_b'].dropna().tolist()
    fator_a = df['fator_a'].dropna().tolist()
    ods_condicional = df['ods_condicional'].dropna().tolist()

    print(f"Coluna: ods, Tamanho da lista: {len(ods)}")
    print(f"Coluna: n_fator, Tamanho da lista: {len(n_fator)}")
    print(f"Coluna: fator_b, Tamanho da lista: {len(fator_b)}")
    print(f"Coluna: fator_a, Tamanho da lista: {len(fator_a)}")

    print("\nstrings com quebra de linha em fator_a:\n")
    for cell in df['fator_a'][df['fator_a'].str.contains('\n', na=False)]:
        print(cell)

    # CORRIGIDO: usar caminho completo
    txt_filename = 'blocos_de_texto.txt'
    txt_path = os.path.join(app.config['OUTPUT_FOLDER'], txt_filename)

    with open(txt_path, 'w', encoding='utf-8') as f:
        f.write(f"""Grupo

Quais ODS deseja responder?<m+>
ODS 01 – ERRADICAÇÃO DA POBREZA
ODS 02 – FOME ZERO E AGRICULTURA SUSTENTÁVEL
ODS 03 – SAÚDE E BEM ESTAR
ODS 04 – EDUCAÇÃO DE QUALIDADE
ODS 05 – IGUALDADE DE GÊNERO
ODS 06 – ÁGUA POTÁVEL E SANEAMENTO
ODS 07 – ENERGIA LIMPA E ACESSÍVEL
ODS 08 – TRABALHO DECENTE E CRESCIMENTO ECONÔMICO
ODS 09 – INDÚSTRIA, INOVAÇÃO E INFRAESTRUTURA
ODS 10 – REDUÇÃO DAS DESIGUALDADES
ODS 11 – CIDADES E COMUNIDADES SUSTENTÁVEIS
ODS 12 – CONSUMO E PRODUÇÃO RESPONSÁVEIS
ODS 13 – AÇÃO CONTRA A MUDANÇA GLOBAL DO CLIMA
ODS 14 – VIDA NA ÁGUA
ODS 15 – VIDA TERRESTRE
ODS 16 – PAZ, JUSTIÇA E INSTITUIÇÕES EFICAZES
ODS 17 – PARCERIA E MEIOS DE IMPLEMENTAÇÃO
ODS 18 – IGUALDADE ÉTNICO-RACIAL

""")

    for x in range(len(ods)):
        with open(txt_path, 'a', encoding='utf-8') as f:
            f.write(f"""<span style="font-size: 24pt;">ODS {str(ods[x]).zfill(2)}, Fator {n_fator[x]}: {fator_a[x]}</span><nt><c=1>{ods_condicional[x]}

<span style="font-size: 14pt;">{fator_b[x]}</span><nt><c=1>{ods_condicional[x]}

ODS__{str(ods[x]).zfill(2)}__Fator__{fator_a[x]}____{fator_b[x]}<h>

Qual a importância desse fator?<lkt><c=1>{ods_condicional[x]}
1. Muito baixo
2. Baixo (-)
3. Baixo (+)
4. Médio-baixo (-)
5. Médio-baixo (+)
6. Médio-Alto (-)
7. Médio-Alto (+)
8. Alto (-)
9. Alto (+)
10. Muito alto

Como classificaria esse fator?<m+><c=1>{ods_condicional[x]}
Ameaça
Vulnerabilidade
Resiliência

<span style="color: #e03e2d;">Ameaças</span>: são fatores (quase sempre externos) que possuem potencial de gerar efeitos negativos a um sistema, organização ou pessoa, em um determinado local.<nt><c=1>{ods_condicional[x]}

<span style="color: #f1c40f;">Vulnerabilidades</span>: dizem respeito às condições situacionais (fragilidades) para a vida da sociedade que, se não corrigidas, podem aumentar a probabilidade de efeitos negativos.<nt><c=1>{ods_condicional[x]}

<span style="color: #2dc26b;">Resiliências</span>: são as capacidades sociais desenvolvidas (e suas potencialidades existentes), em nível individual ou coletivo, de se lidar com situações adversas, com foco na resistência, encontrando caminhos para a superação e o recomeço, na busca por melhorias.<nt><c=1>{ods_condicional[x]}

Ameaça - Notas e observações do fator<txt><c-5>Ameaça

Vulnerabilidade - Notas e observações do fator<txt><c-6>Vulnerabilidade

Resiliência - Notas e observações do fator<txt><c-7>Resiliência

Foto<foto><c=1>{ods_condicional[x]}

Vídeo<video><c=1>{ods_condicional[x]}

""")

    # Remove linhas vazias no final do arquivo
    with open(txt_path, 'r+', encoding='utf-8') as f:
        conteudo = f.read().rstrip(" \n")
        f.seek(0)
        f.write(conteudo)
        f.truncate()

    return txt_filename

# FUNÇÃO DO SEU SCRIPT 2
def processar_txt_para_excel(txt_path):
    """
    Lê o TXT e gera a planilha ODK
    """
    sistema = 'odk'
    texto = ""

    with open(txt_path, "r", encoding="utf8") as arquivo:
        texto = arquivo.read()

    blocos = re.split(r'\n\s*\n', texto)
    df = pd.DataFrame()

    if sistema == 'odk':
        choices = pd.DataFrame(columns=['list_name', 'name', 'label'])
        settings = pd.DataFrame(columns=['form_title', 'form_id'])
        settings.loc[0, 'form_title'] = 'Projeto Território Saudável, Sustentável e Solidário - BA'
        settings.loc[0, 'form_id'] = 'odk-seabra-iraquara'

    questoes = []

    for i, bloco in enumerate(blocos, 1):
        if sistema == 'odk':
            nova_linha = {'type': '', 'name': '', 'label': '', 'relevant': '', 'default': '',
                         'choices': '', 'appearance': '', 'required': '', 'constraint': '',
                         'constraint_message': ''}

        primeira_linha = bloco.split('\n')[0]
        outras_linhas = bloco.split('\n')[1:]
        opcoes = ' | '.join(outras_linhas)

        primeira_linha_ansi = unidecode(primeira_linha)
        primeira_linha_ansi = primeira_linha_ansi[:8].lower().replace(' ', '').replace('-', '').replace('>', '').replace('<','').replace('.', '').replace('*', '') + '_' + str(i).zfill(4)
        primeira_linha_ansi = list(primeira_linha_ansi)

        for digito in "0123456789":
            primeira_linha_ansi[0] = primeira_linha_ansi[0].replace(digito, 'a')

        primeira_linha_ansi = "".join(primeira_linha_ansi)

        if '<h>' in primeira_linha:
            f_label = primeira_linha.replace('<h>', '').replace('< h>', '')
            if sistema == 'odk':
                caracteristicas = {'name': 'FATOR_' + primeira_linha_ansi[6:], 'type': 'hidden',
                                  'default':primeira_linha.replace('<h>', '').replace('< h>', '').replace(' ', '_').replace(')', '_').replace('(', '_'),
                                  'label':'FATOR_' + primeira_linha_ansi[6:]}
            nova_linha.update(caracteristicas)
            questoes.append((primeira_linha_ansi, 'hidden'))

        elif '<num>' in primeira_linha:
            f_label = primeira_linha.replace('<num>', '').replace('< num>', '')
            if sistema == 'odk':
                caracteristicas = {'name': 'FATOR_' + primeira_linha_ansi, 'type': 'text', 'label':f_label,
                                  'appearance':'numbers', 'constraint':"regex(., '^\d+$')",
                                  'constraint_message':'Apenas números são permitidos'}
            nova_linha.update(caracteristicas)
            questoes.append((primeira_linha_ansi, 'integer'))

        elif '<d>' in primeira_linha:
            f_label = primeira_linha.replace('<d>', '').replace('< d>', '')
            if sistema == 'odk':
                caracteristicas = {'name': primeira_linha_ansi, 'appearance': 'no-calendar', 'type': 'date',
                                  'default':'now()', 'label':f_label}
            nova_linha.update(caracteristicas)
            questoes.append((primeira_linha_ansi, 'date'))

        elif '<m->' in primeira_linha:
            f_label = primeira_linha.replace('<m->', '').replace('< m->', '')
            if sistema == 'odk':
                multipla_escolha_dropdown = {'name': primeira_linha_ansi, 'type': f'select_one {i}',
                                            'label':f_label, 'appearance':'dropdown'}
                nova_linha.update(multipla_escolha_dropdown)

                opcoes_split = opcoes.split(' | ')
                for x in opcoes_split:
                    nova_linha_c = {'list_name': i, 'name':x.replace(' ', '_'), 'label':x}
                    nova_linha_choices = pd.DataFrame(nova_linha_c, index=[0])
                    choices = pd.concat([choices, nova_linha_choices], ignore_index=True)

                nova_linha_c = {'list_name': '', 'name':'', 'label':''}
                nova_linha_choices = pd.DataFrame(nova_linha_c, index=[0])
                choices = pd.concat([choices, nova_linha_choices], ignore_index=True)

            questoes.append((primeira_linha_ansi, 'dropdown'))

        elif '<m+>' in primeira_linha:
            f_label = primeira_linha.replace('<m+>', '').replace('< m+>', '')
            if sistema == 'odk':
                multipla_escolha_dropdown = {'name': primeira_linha_ansi, 'type': f'select_multiple {i}',
                                            'label':f_label}
                nova_linha.update(multipla_escolha_dropdown)

                opcoes_split = opcoes.split(' | ')
                for x in opcoes_split:
                    nova_linha_c = {'list_name': i, 'name':x.replace(' ', '_'), 'label':x}
                    nova_linha_choices = pd.DataFrame(nova_linha_c, index=[0])
                    choices = pd.concat([choices, nova_linha_choices], ignore_index=True)

                nova_linha_c = {'list_name': '', 'name':'', 'label':''}
                nova_linha_choices = pd.DataFrame(nova_linha_c, index=[0])
                choices = pd.concat([choices, nova_linha_choices], ignore_index=True)

            questoes.append((primeira_linha_ansi, 'checkbox'))

        elif '<lkt>' in primeira_linha:
            f_label = primeira_linha.replace('<lkt>', '').replace('< lkt>', '')
            if sistema == 'odk':
                multipla_escolha_dropdown = {'name': primeira_linha_ansi, 'type': f'select_one {i}',
                                            'label':f_label, 'appearance':'likert'}
                nova_linha.update(multipla_escolha_dropdown)

                opcoes_split = opcoes.split(' | ')
                for x in opcoes_split:
                    nova_linha_c = {'list_name': i, 'name':x.replace(' ', '_'), 'label':x}
                    nova_linha_choices = pd.DataFrame(nova_linha_c, index=[0])
                    choices = pd.concat([choices, nova_linha_choices], ignore_index=True)

                nova_linha_c = {'list_name': '', 'name':'', 'label':''}
                nova_linha_choices = pd.DataFrame(nova_linha_c, index=[0])
                choices = pd.concat([choices, nova_linha_choices], ignore_index=True)

            questoes.append((primeira_linha_ansi, 'likert'))

        elif '<txt>' in primeira_linha:
            f_label = primeira_linha.replace('<txt>', '').replace('< txt>', '')
            if sistema == 'odk':
                caracteristicas = {'name': primeira_linha_ansi, 'type': 'text', 'label':f_label,
                                  'appearance':'multiline'}
            nova_linha.update(caracteristicas)
            questoes.append((primeira_linha_ansi, 'text-notes'))

        elif '<nt>' in primeira_linha:
            f_label = primeira_linha.replace('<nt>', '').replace('< nt>', '')
            if sistema == 'odk':
                caracteristicas = {'name': primeira_linha_ansi, 'type': 'note', 'label':f_label}
            nova_linha.update(caracteristicas)
            questoes.append((primeira_linha_ansi, 'descriptive'))

        elif '<foto>' in primeira_linha:
            f_label = primeira_linha.replace('<foto>', '').replace('< foto>', '')
            if sistema == 'odk':
                caracteristicas = {'name': primeira_linha_ansi, 'type': 'image', 'label':f_label}
            nova_linha.update(caracteristicas)
            questoes.append((primeira_linha_ansi, 'file'))

        elif '<video>' in primeira_linha:
            f_label = primeira_linha.replace('<video>', '').replace('< video>', '')
            if sistema == 'odk':
                caracteristicas = {'name': primeira_linha_ansi, 'type': 'video', 'label':f_label}
            nova_linha.update(caracteristicas)
            questoes.append((primeira_linha_ansi, 'file'))

        elif '<html>' in primeira_linha:
            f_label = primeira_linha.replace('<html>', '').replace('< html>', '')
            if sistema == 'odk':
                caracteristicas = {'name': primeira_linha_ansi, 'type': 'note', 'label':f_label}
            nova_linha.update(caracteristicas)
            questoes.append((primeira_linha_ansi, 'html_tag'))

        else:
            if bloco.count('\n') == 0:
                f_label = primeira_linha
                if sistema == 'odk':
                    pergunta_de_texto = {'name': primeira_linha_ansi, 'type': 'text', 'label':f_label}
                    nova_linha.update(pergunta_de_texto)
                questoes.append((primeira_linha_ansi, 'text-oneline'))

            if bloco.count('\n') > 1:
                f_label = primeira_linha
                if sistema == 'odk':
                    multipla_escolha_radio = {'name': primeira_linha_ansi, 'type': 'radio', 'label':f_label}
                    nova_linha.update(multipla_escolha_radio)

                    opcoes_split = opcoes.split(' | ')
                    for x in opcoes_split:
                        nova_linha_c = {'list_name': i, 'name':x.replace(' ', '_'), 'label':x}
                        nova_linha_choices = pd.DataFrame(nova_linha_c, index=[0])
                        choices = pd.concat([choices, nova_linha_choices], ignore_index=True)

                    nova_linha_c = {'list_name': '', 'name':'', 'label':''}
                    nova_linha_choices = pd.DataFrame(nova_linha_c, index=[0])
                    choices = pd.concat([choices, nova_linha_choices], ignore_index=True)

                questoes.append((primeira_linha_ansi, 'radio'))

        # Processamento de condicionais
        condicional_relativa = re.search(r'<c-(\d+)>', primeira_linha)
        if condicional_relativa:
            num_q_referencia = int(condicional_relativa.group(1))
            valor_q_referencia = primeira_linha[condicional_relativa.end():]

            if sistema == 'odk':
                posicao_questao = i-num_q_referencia
                nome_questao = questoes[posicao_questao][0]
                branching_l = {'relevant': f'selected(${{{nome_questao}}}, "{valor_q_referencia.replace(" ", "_")}")',
                              'label':f_label.split("<c-")[0]}
                nova_linha.update(branching_l)

        condicional_absoluta = re.search(r'<c=(\d+)>', primeira_linha)
        if condicional_absoluta:
            num_q_referencia = int(condicional_absoluta.group(1))
            valor_q_referencia = primeira_linha[condicional_absoluta.end():]

            if sistema == 'odk':
                posicao_questao = num_q_referencia
                nome_questao = questoes[posicao_questao][0]
                branching_l = {'relevant': f'selected(${{{nome_questao}}}, "{valor_q_referencia.replace(" ", "_")}")',
                              'label':f_label.split("<c=")[0]}
                nova_linha.update(branching_l)

        condicional_not = re.search(r'<cn-(\d+)>', primeira_linha)
        if condicional_not:
            if sistema == 'odk':
                posicao_questao = i-num_q_referencia
                nome_questao = questoes[posicao_questao][0]
                branching_l = {'relevant': f'not(selected(${{{nome_questao}}}, "{valor_q_referencia.replace(" ", "_")}"))',
                              'label':f_label.split("<c-")[0]}
                nova_linha.update(branching_l)

        nova_linha_df = pd.DataFrame(nova_linha, index=[0])
        df = pd.concat([df, nova_linha_df], ignore_index=True)

    if sistema == 'odk':
        output_path = os.path.join(app.config['OUTPUT_FOLDER'], 'form_odk.xlsx')
        df[['relevant', 'name']] = df[['relevant', 'name']].replace('\?', '', regex=True)
        with pd.ExcelWriter(output_path) as writer:
            df.to_excel(writer, sheet_name='survey', index=False)
            choices.to_excel(writer, sheet_name='choices', index=False)
            settings.to_excel(writer, sheet_name='settings', index=False)

    return output_path

if __name__ == '__main__':
    app.run()