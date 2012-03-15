class CreateGeneralCaracteristic < ActiveRecord::Migration

  class GeneralCaracteristic < ActiveRecord::Base; end

  class LevelOfInfluence < ActiveRecord::Base; end


def self.up
    create_table :general_caracteristics do |t|
      t.column :name, :string, :limit => 100, :null => false
      t.column :orientation, :string, :limit => 1000
    end

    create_table :level_of_influences do |t|
      t.column :level, :integer, :null => false
      t.column :name, :string, :limit => 50, :null => false
    end

    create_table :projects_general_caracteristics_level_of_influences, :id => false, :force => true do |t|
      t.column :project_id, :integer, :null => false
      t.column :general_caracteristic_id, :integer, :null => false
      t.column :level_of_influence_id, :integer, :null => false
    end

LevelOfInfluence.create :level => 0,
                        :name => "Nenhuma Influência."

LevelOfInfluence.create :level => 1,
                        :name => "Influência Mínima."

LevelOfInfluence.create :level => 2,
                        :name => "Influência Moderada."

LevelOfInfluence.create :level => 3,
                        :name => "Influência Média."

LevelOfInfluence.create :level => 4,
                        :name => "Influência Significativa."

LevelOfInfluence.create :level => 5,
                        :name => "Grande Influência."

GeneralCaracteristic.create :name => "Comunicação de Dados.",
                            :orientation => "Descreve o nível em que a aplicação comunica-se diretamente com o processador. Os dados ou informações de controle utilizados pela aplicação são enviados ou recebidos por meio de recursos de comunicação. Terminais conectados localmente à unidade de controle são considerados de comunicação. Protocolo é um conjunto de convenções a transferência ou intercâmbio de informações entre dois sistemas ou dispositivos. Todos os links de comunicação necessitam de algum tipo de protocolo.
Pontue de acordo com as seguintes orientações:
0 A aplicação é puramente batch ou uma estação de trabalho isolada.
1 A aplicação é puramente batch, mas possui entrada de dados ou e impressão remota.
2 A aplicação é batch, mas possui entrada de dados e impressão remota.
3 A aplicação possui entrada de dados on-line, front-end de teleprocessamento para um processamento batch ou sistema de consulta.
4 A aplicação é mais que um front-end, mas suporta apenas um tipo de protocolo de comunicação.
5 A aplicação é mais que um front-end, e suporta mais que um tipo de protocolo de comunicação."

GeneralCaracteristic.create :name => "Processamento Distribuído.",
                            :orientation => "Descreve o nível em que a aplicação transfere dados entre os componentes. Funções ou dados distribuídos dentro da fronteira da aplicação.
Pontue de acordo com as seguintes orientações:
0 A aplicação não participa da transferência de dados ou processamento de funções entre os componentes do sistema..
1 A aplicação prepara dados para o processamento pelo usuário final em outro componente do sistema, como planilhas eletrônicas ou banco de dados.
2 Dados são preparados para a transferência, então são processados em outro componente do sistema (não para processamento pelo usuário final).
3 Processamento distribuído e transferência de dados são feitos on-line e em apenas uma direção.
4 Processamento distribuído e transferência de dados são feitos on-line e em ambas as direções.
5 O processamento de funções é executado dinamicamente no componente mais apropriado do sistema."

GeneralCaracteristic.create :name => "Performance.",
                            :orientation => "Descreve o nível em que considerações sobre tempo de resposta e taxas de transações influenciam no desenvolvimento da aplicação. Os objetivos estabelecidos ou aprovados pelo usuário, em termos de tempo de resposta ou taxa de transações, influenciam (ou influenciará) o projeto, desenvolvimento, instalação e suporte da aplicação.
Pontue de acordo com as seguintes orientações:
0 O usuário não estabeleceu nenhum requisito especial sobre performance.
1 Requisito de performance e projeto foram estabelecidos e revisados, mas nenhuma ação em especial foi tomada.
2 Tempo de resposta ou taxa de transações são críticos durante as horas de pico. Não é necessário nenhum projeto especial para a utilização de CPU. O limite para o processamento é o dia seguinte.
3 Tempo de resposta ou taxa de transações são críticos durante todas as horas de trabalho. Não foi necessário nenhum projeto especial para a utilização de CPU. O limite de processamento é crítico.
4 Adicionalmente, requisitos especificados pelo usuário são exigentes o bastante para que tarefas de análise de performance sejam necessárias na fase de projeto.
5 Adicionalmente, ferramentas de análise de performance devem ser utilizadas nas fazes de projeto, desenvolvimento e/ou implementação para que os requisitos de performance do usuários sejam atendidos."

GeneralCaracteristic.create :name => "Configuração Altamente Utilizada.",
                            :orientation => "Descreve o nível em que restrições de recursos computacionais influenciam na desenvolvimento da aplicação. Uma configuração operacional altamente utilizada, necessitando de considerações especiais de projeto, é uma característica da aplicação. Por exemplo, o usuário deseja executar a aplicação em um equipamento já existente ou comprado e que será altamente utilizado.
Pontue de acordo com as seguintes orientações:
0 Não existe restrições operacionais implícitas ou explícitas nos requisitos.
1 Existem restrições operacionais, mas são menos restritivas que uma aplicação típica. Não há esforço especial necessário ao atendimento dessas restrições.
2 Algumas considerações de sincronismo ou segurança são especificadas.
3 Existem requisitos específicos de processador para uma parte especifica da aplicação.
4 Restrições operacionais explícitas necessitam de um processador dedicado ou utilização pesada do processador central.
5 Adicionalmente, existem limitações nos componentes distribuídos da aplicação."

GeneralCaracteristic.create :name => "Volume de Transações.",
                            :orientation => "Descreve em que nível o alto volume de transações influencia o projeto, desenvolvimento, instalação e suporte da aplicação.
Pontue de acordo com as seguintes orientações:
0 Não é antecipado nenhum período de pico de transações.
1 São antecipados períodos de pico de processamento (por exemplo: mensal, quinzenal, periódico, anual).
2 Picos de transação semanais são previstos.
3 Picos de transação diários são previstos.
4 Altas taxas de transação definidas pelo usuário nos requisitos ou os níveis de serviço acordados são altos o bastante para requererem tarefas de análise de performance na fase de projeto.
5 Adicionalmente, existem requisitos de ferramentas de análise de performance nas fases de projeto, desenvolvimento e/ou instalação."

GeneralCaracteristic.create :name => "Entrada de Dados On-line.",
                            :orientation => "Descreve em que nível são efetuadas entradas de dados na aplicação por meio de transações interativas.
Pontue de acordo com as seguintes orientações:
0 Todas as transações são processadas em lote.
1 De 1% a 7% das transações são entradas de dados on-line.
2 De 8% a 15% das transações são entradas de dados on-line.
3 De 16% a 23% das transações são entradas de dados on-line.
4 De 24% a 30% das transações são entradas de dados on-line.
5 Mais de 30% das transações são entradas de dados on-line."

GeneralCaracteristic.create :name => "Eficiência do Usuário Final.",
                            :orientation => "Descreve em que nível considerações sobre fatores humanos e facilidade de uso pelo usuário final influenciam o desenvolvimento da aplicação. As funções interativas fornecidas pela aplicação enfatizam um projeto para o aumento da eficiência do usuário final. O projeto inclui:
* Auxílio para a navegação, como por exemplo, teclas de função, saltos, menus gerados dinamicamente;
* Menus;
* Ajuda on-line e documentação;
* Movimentação automática de cursor;
* Paginação;
* Impressão remota por meio de transações on-line;
* Teclas de função predefinidas;
* Tarefas em lote submetidas a transações on-line;
* Seleção feita por posicionamento de cursor em tela de dados;
* Uso intensivo de vídeos reverso, brilho, cores e outros indicadores;
* Documentação impressa das transações;
* Interface de mouse;
* Janelas pop-up;
* Utilização de número mínimo de telas para executar uma função do negócio;
* Suporte a dois idiomas (conte como quatro itens).
* Suporte a mais de dois idiomas (conte como seis itens).
Pontue de acordo com as seguintes orientações:
0 Nenhum dos itens anteriores.
1 De um a três dos itens anteriores.
2 De quatro a cinco dos itens anteriores.
3 Seis ou mais dos itens anteriores, mas não existem requisitos específicos do usuário associados à eficiência.
4 Seis ou mais dos itens anteriores e requisitos explícitos sobre a eficiência para o usuário final são fortes o bastante para necessitarem de tarefas de projeto que incluam fatores humanos, como, por exemplo, minimizar o número de toques no teclado, maximizar padrões de campo e uso de modelos.
5 Seis ou mais dos itens anteriores e requisitos explícitos sobre a eficiência para o usuário final são fortes o bastante para necessitarem do uso de ferramentas e processos especiais para demonstrarem que os objetivos foram alcançados."

GeneralCaracteristic.create :name => "Atualizações On-line.",
                            :orientation => "Descreve em que nível os arquivos lógicos internos da aplicação são atualizados de forma on-line.
Pontue de acordo com as seguintes orientações:
0 Não há nenhuma atualização on-line.
1 Existe a atualização on-line de um a três arquivos. Volume de atualização é pequeno e a recuperação é fácil.
2 Existe a atualização on-line de quatro ou mais arquivos. Volume de atualização é pequeno e a recuperação é fácil.
3 A atualização da maioria dos arquivos internos é on-line.
4 Adicionalmente, a proteção contra a perda de dados é essencial e foi especialmente projetada e programada no sistema.
5 Adicionalmente, o alto volume de processamento torna necessário a análise do custo do processo de recuperação. São incluídos procedimentos altamente automatizados com um mínimo de intervenção do operador."

GeneralCaracteristic.create :name => "Complexidade de Processamento.",
                            :orientation => "Descreve em que nível o processamento lógico ou matemático influencia o desenvolvimento da aplicação. Os seguintes componentes estão presentes:
* Controle sensível e/ou processamento específico de segurança da aplicação. Exemplo: processamento especial de auditoria.
* Processamento lógico extensivo. Exemplo: sistema de gestão de crédito.
* Processamento matemático extensivo. Exemplo: sistema de otimização de corte de tecidos.
* Muito processamento de exceção resultando em transações incompletas que devem ser processadas novamente. Exemplo: transações incompletas em ATM em função de problemas de teleprocessamento, falta de dados ou de edição.
* Processamento complexo para manipular múltiplas possibilidades de entrada e saída, como, por exemplo, multimídia, ou independência de dispositivo. Exemplo: sistema de extrato de conta corrente que emite via terminal de retaguarda, auto-atendimento, web, e-mail, telefone celular.
Pontue de acordo com as seguintes orientações:
0 Nenhum dos itens anteriores.
1 Qualquer um dos itens anteriores.
2 Quaisquer dois itens anteriores.
3 Quaisquer três itens anteriores.
4 Quaisquer quatro itens anteriores.
5 Todos os cinco itens anteriores."

GeneralCaracteristic.create :name => "Reusabilidade.",
                            :orientation => "A aplicação e seu código foram especificamente projetos, desenvolvimento e suportados para serem atualizados em outras aplicações.
Pontue de acordo com as seguintes orientações:
0 Não há código reutilizável.
1 Código reutilizável é utilizado na aplicação.
2 Menos de dez por cento da aplicação levou em consideração as necessidades de mais de um usuário.
3 Dez por cento ou mais da aplicação levou em consideração as necessidades de mais de um usuário.
4 A aplicação foi especificamente empacotada e/ou documentada para fácil reutilização. Ela é customizada pelo usuário no nível de código.
5 A aplicação foi especificamente empacotada e/ou documentada para fácil reutilização. Ela é customizada pelo usuário por meio de manutenção de parâmetros."

GeneralCaracteristic.create :name => "Facilidade de Instalação.",
                            :orientation => "Descreve em que nível a conversão de ambientes preexistentes influencia o desenvolvimento da aplicação. Um plano e/ou ferramentas de conversão e instalação foram fornecidos e testados durante a fase de teste do sistema.
Pontue de acordo com as seguintes orientações:
0 O usuário não definiu considerações especiais, assim como não é requerido nenhum setup para a instalação.
1 O usuário não definiu considerações especiais, mas é necessário setup para a instalação.
2 Requisitos de instalação e conversão foram foram definidos pelo usuário, e guias de conversão e instalação formam fornecidas e testadas. Não é considerado importante o impacto da conversão.
3 Requisitos de instalação e conversão foram definidos pelo usuário, e guais de conversão e instalação formam fornecidas e testadas. É considerado importante o impacto da conversão.
4 Além do item 2, ferramentas de instalação e conversão automáticas forma fornecidas e testadas.
5 Além do item 3, ferramentas de instalação e conversão automáticas forma fornecidas e testadas."

GeneralCaracteristic.create :name => "Facilidade de Operação.",
                            :orientation => "Descreve em que nível a aplicação atende a alguns aspectos operacionais, como: inicialização, segurança e recuperação. A aplicação minimiza a necessidade de atividades manuais, como montagem de fitas, manipulação de papel e intervenção manual pelo operador.
Pontue de acordo com as seguintes orientações:
0 Não foi estabelecida pelo usuário outra consideração que não os procedimentos de segurança normais.
1 - 4 Um, alguns ou todos os seguintes itens são válidos para a aplicação. Selecione todos aqueles que sejam válidos. Cada item tem um valor de um ponto, a exceção de onde seja citado o contrário.
* Procedimentos de inicialização, salvamento e recuperação formam fornecidos, mas é necessária a intervenção do operador.
* Procedimentos de inicialização, salvamento e recuperação foram fornecidos, e não é necessária  a intervenção do operador (conte como dois itens).
* A aplicação minimiza a necessidade de montagem de fitas.
* A aplicação minimiza a necessidade de manipulação de papel.
5 Aplicação projetada para operação não-assistida. Isto é, não é necessário nenhuma intervenção do operador para operador para operar o sistema, que não seja a inicialização e término da aplicação. A recuperação automática de erros é uma característica da aplicação."

GeneralCaracteristic.create :name => "Múltiplos Locais",
                            :orientation => "A aplicação foi especialmente projetada, desenvolvida e suportada e suportada para instalação em múltiplos locais para múltiplas organizações.
Pontue de acordo com as seguintes orientações:
0 Os requisitos do usuário não considerada a necessidade de mais de um usuário/local de instalação.
1 Necessidade de múltiplos locais foi considerada no projeto, e a aplicação foi projetada para operar apenas nos mesmos ambientes de hardware e de software.
2 Necessidade de múltiplos locais foi considerada no projeto, e a aplicação foi projetada para operar em apenas ambientes de hardware e de software similares.
3 Necessidade de múltiplos locais foi considerada no projeto, e a aplicação foi projetada para operar em ambientes diferentes de hardware e de software.
4 Adicionalmente aos itens 1 ou 2, plano de suporte e documentação são fornecidos e testados para suportar a aplicação em múltiplos locais.
5 Adicionalmente ao item 3, plano de suporte e documentação são fornecidos e testados para suportar a aplicação em múltiplos locais."

GeneralCaracteristic.create :name => "Facilidade de Mudanças.",
                            :orientation => "Descreve em que nível a aplicação foi especificamente para facilitar a mudança de sua lógica de processamento de estrutura de dados.
As seguintes características podem ser válidas para a aplicação:
* São fornecidos mecanismos de consulta flexível, que permitem a manipulação de pedidos simples; por exemplo, lógica e/ou aplicada a apenas um arquivo lógico (conte como um item).
* São fornecidos mecanismos de consulta flexível, que permitem a manipulação de pedidos de média complexidade; por exemplo, lógica e/ou aplicada a mais de uma arquivo lógico (conte como dois itens).
* São fornecidos mecanismos de consulta flexível, que permite a manipulação de pedidos complexos; por exemplo, lógica de e/ou combinadas em um ou mais arquivos lógicos (conte como três itens).
* Dados de controle de negócio são mantidos pelo  usuário por meio de processos interativos, mas as alterações só tem efeito no próximo dia útil.
* Dados de controle do negócio são mantidos pelo usuário por meio de processos interativos, e as alterações têm efeito imediato (conte como dois itens).
Pontue de acordo com as seguintes orientações:
0 Nenhum dos itens anteriores.
1 Qualquer um dos itens anteriores.
2 Quaisquer dois itens anteriores.
3 Quaisquer três itens anteriores.
4 Quaisquer quatro itens anteriores.
5 Todos os cinco itens anteriores."


end

def self.down
    drop_table :general_caracteristics
    drop_table :projects_general_caracteristics
    drop_table :level_of_influences
  end
end

