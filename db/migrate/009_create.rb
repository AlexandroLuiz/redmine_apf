class Create < ActiveRecord::Migration

  class TypeOfFunctionality < ActiveRecord::Base; end

  class ConfigurationApfForFunctionality < ActiveRecord::Base; end




  def self.up
    create_table :type_of_functionalities do |t|
      t.column :name, :string, :limit => 100, :default => "", :null => false
      t.column :description, :text
  end

    create_table :functionalities do |t|
      t.column :name, :string, :limit => 100, :default => "", :null => false
      t.column :description, :text
      t.column :qnt_reference_file, :integer
      t.column :qnt_type_register, :integer
      t.column :qnt_type_data, :integer
      t.column :qnt_pf, :integer
      t.column :type, :string
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
      t.column :project_id, :integer, :default => 0, :null => false
      t.column :type_of_functionality_id, :integer, :default => 0, :null => false
     end

    create_table :configuration_apf_for_functionalities do |t|
      t.column :type_of_register_min, :integer, :default => 0
      t.column :type_of_register_max, :integer, :default => 0
      t.column :type_of_reference_file_min, :integer, :default => 0
      t.column :type_of_reference_file_max, :integer, :default => 0
      t.column :type_of_data_min, :integer,:default => 0, :null => false
      t.column :type_of_data_max, :integer, :default => 0,:null => false
      t.column :complexity, :string, :null => false
      t.column :pf, :integer, :null => false
      t.column :type_of_functionality_id, :integer, :null => false
    end


TypeOfFunctionality.create :name => "ALI",
                              :description => "Um grupo logicamente relacionado de dados ou informações de controle, identificável pelo usuário e mantido dentro da fronteira da aplicação sendo contada. Sua principal intenção é armazenar dados mantidos através de uma ou mais transações da aplicação sendo contada."

TypeOfFunctionality.create  :name => "AIE",
                               :description => "Um grupo logicamente relacionado de dados ou informações de controle, identificável pelo usuário e mantidos fora da fronteira da aplicação sendo contada. Sua principal intenção é armazenar dados referenciados através de uma ou mais transações da aplicação sendo contada.
Ex.: dados recuperados de um Web Server."

TypeOfFunctionality.create :name => "EE",
                              :description => "Seu objetivo principal é atualizar os dados do sistema, ou também modificar o seu comportamento. Estes dados ou informações são estímulos recebidos externamente à fronteira da aplicação."

TypeOfFunctionality.create :name => "SE",
                          :description => "É uma transação que envia dados ou informações de controle para fora da fronteira da aplicação. Seu objetivo principal é apresentar informações que exigem lógica de processamento que não seja uma apenas uma simples recuperação de dados ou informações de controle. Seu processamento deve conter caçulo, ou criar dados derivados, ou manter um arquivo lógico interno, ou alterar o comportamento do sistema."

TypeOfFunctionality.create :name => "CE",
                          :description => "Seu objetivo é apenas recuperar e mostrar dados ao usuário, sem exigência de qualquer tipo de processamento. Uma CE recupera dados de um ALI ou AIE, e envia para fora da fronteira da aplicação."


#criar configurações para ALI
ConfigurationApfForFunctionality.create :type_of_register_min => 0,
                                   :type_of_register_max => 1,
                                   :type_of_data_min => 0,
                                   :type_of_data_max => 20,
                                   :complexity => "Baixa",
                                   :pf => 7,
                                   :type_of_functionality_id => 1
ConfigurationApfForFunctionality.create :type_of_register_min => 0,
                                   :type_of_register_max => 1,
                                   :type_of_data_min => 20,
                                   :type_of_data_max => 50,
                                   :complexity => "Baixa",
                                   :pf => 7,
                                   :type_of_functionality_id => 1
ConfigurationApfForFunctionality.create :type_of_register_min => 0,
                                   :type_of_register_max => 1,
                                   :type_of_data_min => 50,
                                   :type_of_data_max => 1000,
                                   :complexity => "Média",
                                   :pf => 10,
                                   :type_of_functionality_id => 1
ConfigurationApfForFunctionality.create :type_of_register_min => 2,
                                   :type_of_register_max => 5,
                                   :type_of_data_min => 0,
                                   :type_of_data_max => 20,
                                   :complexity => "Baixa",
                                   :pf => 7,
                                   :type_of_functionality_id => 1
ConfigurationApfForFunctionality.create :type_of_register_min => 2,
                                   :type_of_register_max => 5,
                                   :type_of_data_min => 20,
                                   :type_of_data_max => 50,
                                   :complexity => "Média",
                                   :pf => 10,
                                   :type_of_functionality_id => 1
ConfigurationApfForFunctionality.create :type_of_register_min => 2,
                                   :type_of_register_max => 5,
                                   :type_of_data_min => 50,
                                   :type_of_data_max => 100,
                                   :complexity => "Alta",
                                   :pf => 15,
                                   :type_of_functionality_id => 1
ConfigurationApfForFunctionality.create :type_of_register_min => 5,
                                   :type_of_register_max => 100,
                                   :type_of_data_min => 0,
                                   :type_of_data_max => 20,
                                   :complexity => "Média",
                                   :pf => 10,
                                   :type_of_functionality_id => 1
ConfigurationApfForFunctionality.create :type_of_register_min => 5,
                                   :type_of_register_max => 100,
                                   :type_of_data_min => 20,
                                   :type_of_data_max => 50,
                                   :complexity => "Alta",
                                   :pf => 15,
                                   :type_of_functionality_id => 1
ConfigurationApfForFunctionality.create :type_of_register_min => 5,
                                   :type_of_register_max => 100,
                                   :type_of_data_min => 50,
                                   :type_of_data_max => 100,
                                   :complexity => "Alta",
                                   :pf => 15,
                                   :type_of_functionality_id => 1


#criar configurações para AIE
ConfigurationApfForFunctionality.create :type_of_register_min => 0,
                                   :type_of_register_max => 1,
                                   :type_of_data_min => 0,
                                   :type_of_data_max => 20,
                                   :complexity => "Baixa",
                                   :pf => 5,
                                   :type_of_functionality_id => 2
ConfigurationApfForFunctionality.create :type_of_register_min => 0,
                                   :type_of_register_max => 1,
                                   :type_of_data_min => 20,
                                   :type_of_data_max => 50,
                                   :complexity => "Baixa",
                                   :pf => 5,
                                   :type_of_functionality_id => 2
ConfigurationApfForFunctionality.create :type_of_register_min => 0,
                                   :type_of_register_max => 1,
                                   :type_of_data_min => 50,
                                   :type_of_data_max => 100,
                                   :complexity => "Média",
                                   :pf => 7,
                                   :type_of_functionality_id => 2
ConfigurationApfForFunctionality.create :type_of_register_min => 2,
                                   :type_of_register_max => 5,
                                   :type_of_data_min => 0,
                                   :type_of_data_max => 20,
                                   :complexity => "Baixa",
                                   :pf => 5,
                                   :type_of_functionality_id => 2
ConfigurationApfForFunctionality.create :type_of_register_min => 2,
                                   :type_of_register_max => 5,
                                   :type_of_data_min => 20,
                                   :type_of_data_max => 50,
                                   :complexity => "Média",
                                   :pf => 7,
                                   :type_of_functionality_id => 2
ConfigurationApfForFunctionality.create :type_of_register_min => 2,
                                   :type_of_register_max => 5,
                                   :type_of_data_min => 50,
                                   :type_of_data_max => 100,
                                   :complexity => "Alta",
                                   :pf => 10,
                                   :type_of_functionality_id => 2
ConfigurationApfForFunctionality.create :type_of_register_min => 5,
                                   :type_of_register_max => 100,
                                   :type_of_data_min => 0,
                                   :type_of_data_max => 20,
                                   :complexity => "Média",
                                   :pf => 7,
                                   :type_of_functionality_id => 2
ConfigurationApfForFunctionality.create :type_of_register_min => 5,
                                   :type_of_register_max => 100,
                                   :type_of_data_min => 20,
                                   :type_of_data_max => 50,
                                   :complexity => "Alta",
                                   :pf => 10,
                                   :type_of_functionality_id => 2
ConfigurationApfForFunctionality.create :type_of_register_min => 5,
                                   :type_of_register_max => 100,
                                   :type_of_data_min => 50,
                                   :type_of_data_max => 100,
                                   :complexity => "Alta",
                                   :pf => 10,
                                   :type_of_functionality_id => 2

#criar configurações para EE
ConfigurationApfForFunctionality.create :type_of_data_min => 0,
                                        :type_of_data_max => 5,
                                          :type_of_reference_file_min => 0,
                                          :type_of_reference_file_max => 2,
                                          :complexity => "Baixa",
                                          :pf => 3,
                                          :type_of_functionality_id => 3
ConfigurationApfForFunctionality.create :type_of_data_min => 5,
                                          :type_of_data_max => 15,
                                          :type_of_reference_file_min => 0,
                                          :type_of_reference_file_max => 2,
                                          :complexity => "Baixa",
                                          :pf => 3,
                                          :type_of_functionality_id => 3
ConfigurationApfForFunctionality.create :type_of_data_min => 15,
                                          :type_of_data_max => 1000,
                                          :type_of_reference_file_min => 0,
                                          :type_of_reference_file_max => 2,
                                          :complexity => "Média",
                                          :pf => 4,
                                          :type_of_functionality_id => 3
ConfigurationApfForFunctionality.create :type_of_data_min => 0,
                                          :type_of_data_max => 5,
                                          :type_of_reference_file_min => 2,
                                          :type_of_reference_file_max => 2,
                                          :complexity => "Baixa",
                                          :pf => 3,
                                          :type_of_functionality_id => 3
ConfigurationApfForFunctionality.create :type_of_data_min => 5,
                                          :type_of_data_max => 15,
                                          :type_of_reference_file_min => 2,
                                          :type_of_reference_file_max => 2,
                                          :complexity => "Média",
                                          :pf => 4,
                                          :type_of_functionality_id => 3
ConfigurationApfForFunctionality.create :type_of_data_min => 15,
                                          :type_of_data_max => 1000,
                                          :type_of_reference_file_min => 2,
                                          :type_of_reference_file_max => 2,
                                          :complexity => "Alta",
                                          :pf => 6,
                                          :type_of_functionality_id => 3
ConfigurationApfForFunctionality.create :type_of_data_min => 0,
                                          :type_of_data_max => 5,
                                          :type_of_reference_file_min => 2,
                                          :type_of_reference_file_max => 100,
                                          :complexity => "Média",
                                          :pf => 4,
                                          :type_of_functionality_id => 3
ConfigurationApfForFunctionality.create :type_of_data_min => 5,
                                          :type_of_data_max => 15,
                                          :type_of_reference_file_min => 2,
                                          :type_of_reference_file_max => 100,
                                          :complexity => "Alta",
                                          :pf => 6,
                                          :type_of_functionality_id => 3
ConfigurationApfForFunctionality.create :type_of_data_min => 15,
                                          :type_of_data_max => 1000,
                                          :type_of_reference_file_min => 2,
                                          :type_of_reference_file_max => 100,
                                          :complexity => "Alta",
                                          :pf => 6,
                                          :type_of_functionality_id => 3

#criar configurações para SE
ConfigurationApfForFunctionality.create :type_of_data_min => 0,
                                          :type_of_data_max => 6,
                                          :type_of_reference_file_min => 0,
                                          :type_of_reference_file_max => 2,
                                          :complexity => "Baixa",
                                          :pf => 4,
                                          :type_of_functionality_id => 4
ConfigurationApfForFunctionality.create :type_of_data_min => 6,
                                          :type_of_data_max => 19,
                                          :type_of_reference_file_min => 0,
                                          :type_of_reference_file_max => 2,
                                          :complexity => "Baixa",
                                          :pf => 4,
                                          :type_of_functionality_id => 4
ConfigurationApfForFunctionality.create :type_of_data_min => 19,
                                          :type_of_data_max => 1000,
                                          :type_of_reference_file_min => 0,
                                          :type_of_reference_file_max => 2,
                                          :complexity => "Média",
                                          :pf => 5,
                                          :type_of_functionality_id => 4
ConfigurationApfForFunctionality.create :type_of_data_min => 0,
                                          :type_of_data_max => 6,
                                          :type_of_reference_file_min => 2,
                                          :type_of_reference_file_max => 3,
                                          :complexity => "Baixa",
                                          :pf => 4,
                                          :type_of_functionality_id => 4
ConfigurationApfForFunctionality.create :type_of_data_min => 6,
                                          :type_of_data_max => 19,
                                          :type_of_reference_file_min => 2,
                                          :type_of_reference_file_max => 3,
                                          :complexity => "Média",
                                          :pf => 5,
                                          :type_of_functionality_id => 4
ConfigurationApfForFunctionality.create :type_of_data_min => 19,
                                          :type_of_data_max => 1000,
                                          :type_of_reference_file_min => 2,
                                          :type_of_reference_file_max => 3,
                                          :complexity => "Alta",
                                          :pf => 7,
                                          :type_of_functionality_id => 4
ConfigurationApfForFunctionality.create :type_of_data_min => 0,
                                          :type_of_data_max => 6,
                                          :type_of_reference_file_min => 3,
                                          :type_of_reference_file_max => 100,
                                          :complexity => "Média",
                                          :pf => 5,
                                          :type_of_functionality_id => 4
ConfigurationApfForFunctionality.create :type_of_data_min => 6,
                                          :type_of_data_max => 19,
                                          :type_of_reference_file_min => 3,
                                          :type_of_reference_file_max => 100,
                                          :complexity => "Alta",
                                          :pf => 7,
                                          :type_of_functionality_id => 4
ConfigurationApfForFunctionality.create :type_of_data_min => 19,
                                          :type_of_data_max => 1000,
                                          :type_of_reference_file_min => 3,
                                          :type_of_reference_file_max => 100,
                                          :complexity => "Alta",
                                          :pf => 7,
                                          :type_of_functionality_id => 4
#criar configurações para CE
ConfigurationApfForFunctionality.create :type_of_data_min => 0,
                                          :type_of_data_max => 6,
                                          :type_of_reference_file_min => 0,
                                          :type_of_reference_file_max => 2,
                                          :complexity => "Baixa",
                                          :pf => 3,
                                          :type_of_functionality_id => 5
ConfigurationApfForFunctionality.create :type_of_data_min => 6,
                                          :type_of_data_max => 19,
                                          :type_of_reference_file_min => 0,
                                          :type_of_reference_file_max => 2,
                                          :complexity => "Baixa",
                                          :pf => 3,
                                          :type_of_functionality_id => 5
ConfigurationApfForFunctionality.create :type_of_data_min => 19,
                                          :type_of_data_max => 1000,
                                          :type_of_reference_file_min => 0,
                                          :type_of_reference_file_max => 2,
                                          :complexity => "Média",
                                          :pf => 4,
                                          :type_of_functionality_id => 5
ConfigurationApfForFunctionality.create :type_of_data_min => 0,
                                          :type_of_data_max => 6,
                                          :type_of_reference_file_min => 2,
                                          :type_of_reference_file_max => 3,
                                          :complexity => "Baixa",
                                          :pf => 3,
                                          :type_of_functionality_id => 5
ConfigurationApfForFunctionality.create :type_of_data_min => 6,
                                          :type_of_data_max => 19,
                                          :type_of_reference_file_min => 2,
                                          :type_of_reference_file_max => 3,
                                          :complexity => "Média",
                                          :pf => 4,
                                          :type_of_functionality_id => 5
ConfigurationApfForFunctionality.create :type_of_data_min => 19,
                                          :type_of_data_max => 1000,
                                          :type_of_reference_file_min => 2,
                                          :type_of_reference_file_max => 3,
                                          :complexity => "Alta",
                                          :pf => 6,
                                          :type_of_functionality_id => 5
ConfigurationApfForFunctionality.create :type_of_data_min => 0,
                                          :type_of_data_max => 6,
                                          :type_of_reference_file_min => 3,
                                          :type_of_reference_file_max => 100,
                                          :complexity => "Média",
                                          :pf => 4,
                                          :type_of_functionality_id => 5
ConfigurationApfForFunctionality.create :type_of_data_min => 6,
                                          :type_of_data_max => 19,
                                          :type_of_reference_file_min => 3,
                                          :type_of_reference_file_max => 100,
                                          :complexity => "Alta",
                                          :pf => 6,
                                          :type_of_functionality_id => 5
ConfigurationApfForFunctionality.create :type_of_data_min => 19,
                                          :type_of_data_max => 1000,
                                          :type_of_reference_file_min => 3,
                                          :type_of_reference_file_max => 100,
                                          :complexity => "Alta",
                                          :pf => 6,
                                          :type_of_functionality_id => 5

  end



  def self.down
    drop_table :functionalities
    drop_table :type_of_functionalities
    drop_table :configuration_apf_for_functionalities
    drop_table :general_caracteristics
    drop_table :level_of_influences
    drop_table :projects_caracteristics
  end
end

