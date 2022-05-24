Feature: Perfil
   Como um usuário com conta no sistema
   Desejo atualizar minhas informações básicas
   Para manter meus dados atualizados no sistema.

   Background: Acessar a tela de perfil
      Given que acessei o site Lembra compras
      And acessei a tela de perfil

      
         Scenario: Atulizar com campo nome em branco
            When deixo o campo nome em branco
            And preencho o campo E-mail
            | email | sophia@g.com |
            Then visualizo uma mensagem de sucesso
            | mensagem | Informe seu nome |

         Scenario: Atulizar com campo E-mail em branco
            When deixo os campos email em branco
            And preencho o campo E-mail
            | nome | Sophia Santos |
            Then visualizo uma mensagem de erro
            | mensagem | Informe seu e-mail |

         Scenario: Atualizar Usuário pelo nome
            When preencho o campo nome
            | nome | Sophia Santos |
            Then visualizo uma mensagem de sucesso
            | mensagem | Informações atualizadas com sucesso |

         Scenario: Atualizar Usuário pelo E-mail
            When preencho o campo E-mail
            | email | sophia@g.com |
            Then visualizo uma mensagem de sucesso
            | mensagem | Informações atualizadas com sucesso |

         # Bug com o e-mail já utilizado
         Scenario: Atualizar Usuário com E-mail já utilizado
            When preencho o campo E-mail
            | email | landin@gmail.com |
            Then visualizo uma mensagem de sucesso
            | mensagem | Formato de nome inválido |

         Scenario: Atualizar Usuário com E-mail inválido
            When preencho o campo E-mail
            | email | luffyg.com |
            Then visualizo uma mensagem de erro
            | mensagem | Formato de e-mail inválido. |

         Scenario: Atualizar nome com mais de 100 caracteres
            When preencho o campo nome
            | email | ChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChico |
            Then visualizo uma mensagem de erro
            | mensagem | Informe no máximo 100 letras no seu nome |
         
         # Bug com mais de 60 caracteres
         Scenario: Não dece ser possível atualizar E-mail com mais de 60 caracteres
            When preencho o campo E-mail
            | email | chicochicochicochicochicochicochicochicochicochicochicochico@g.com |
            Then visualizo uma mensagem de erro
            | mensagem | Informe no máximo 60 caracteres  |

         Scenario: Atualizar usuário pelo nome com caracteres especiais válidos
            When preencho o campo nome
            | nome | .... |
            Then visualizo uma mensagem de sucesso
            | mensagem | Informações atualizadas com sucesso |

         Scenario: Atualizar usuário pelo nome com caracteres especiais inválidos
            When preencho o campo nome
            | nome | ,,,, |
            Then visualizo uma mensagem de erro
            | mensagem | Formato do nome é inválido. |
         
         # Bug com caracteres especiais
         Scenario: Atualizar Usuário com apenas espaço
            When preencho o campo nome
            | nome |      |
            Then visualizo uma mensagem de erro
            | mensagem | Não foi possível atualizar suas informações 🥺 |