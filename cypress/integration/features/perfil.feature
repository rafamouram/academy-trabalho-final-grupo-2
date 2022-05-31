Feature: Perfil
   Como um usuário com conta no sistema
   Desejo atualizar minhas informações básicas
   Para manter meus dados atualizados no sistema.

   Background: Acessar a tela de perfil
      Given acessei o site Lembra Compras
      And loguei com um usuário
      Given acessei a tela de perfil

@logarSite
         Scenario: Atualizar com campo nome em branco
            When deixo o campo nome em branco
            And preencho o campo E-mail
            | email | sophia@g.com |
            Then visualizo uma mensagem de erro de Perfil
            | mensagem | Informe seu nome |

         Scenario: Atualizar com campo E-mail em branco
            When deixo o campo email em branco
            And preencho o campo nome
            | nome | Sophia Santos |
            Then visualizo uma mensagem de erro
            | mensagem | Informe seu e-mail |

         Scenario: Atualizar Usuário pelo nome
            When preencho o campo nome e confirmo
            | nome | Sophia Santos |
            Then visualizo uma mensagem de sucesso de Perfil
            | mensagem | Informações atualizadas com sucesso |

         Scenario: Atualizar Usuário pelo E-mail
            When preencho o campo E-mail e confirmo
            | email | sophia@g.com |
            Then visualizo uma mensagem de sucesso de Perfil
            | mensagem | Informações atualizadas com sucesso |

         # Bug com o e-mail já utilizado
         Scenario: Atualizar Usuário com E-mail já utilizado
            When preencho o campo E-mail com um E-mail já utilizado
            | email | landin@gmail.com |
            Then visualizo uma mensagem de erro de Perfil
            | mensagem | Este e-mail já é utilizado por outro usuário. |

         Scenario: Atualizar Usuário com E-mail inválido
            When preencho o campo E-mail
            | email | luffyg.com |
            Then visualizo uma mensagem de erro de Perfil
            | mensagem | Formato de e-mail inválido. |

         Scenario: Atualizar nome com mais de 100 caracteres
            When preencho o campo nome
            | nome | ChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChico |
            Then visualizo uma mensagem de erro de Perfil
            | mensagem | Informe no máximo 100 letras no seu nome |
         
         # Bug com mais de 60 caracteres - Deixa atualizar até e-mail com 75 caracteres
         Scenario: Não deve ser possível atualizar E-mail com mais de 60 caracteres
            When preencho o campo E-mail
            | email | chicochicochicochicochicochicochicochicochicochicochicochico@g.com |
            Then visualizo uma mensagem de erro de Perfil
            | mensagem | Informe no máximo 60 caracteres para o e-mail |

         # Bug atualiza usuário com nome apenas com pontos
         Scenario: Atualizar usuário pelo nome com caracteres especiais inválidos - Bug
            When preencho o campo nome e confirmo
            | nome | .... |
            Then visualizo uma mensagem de erro de Perfil
            | mensagem | Formato do nome é inválido. |

         Scenario: Atualizar usuário pelo nome com caracteres especiais inválidos
            When preencho o campo nome
            | nome | ,,,, |
            Then visualizo uma mensagem de erro de Perfil
            | mensagem | Formato do nome é inválido. |

       @deslogarSite  
         Scenario: Atualizar Usuário com apenas espaço
            When preencho o campo nome com apenas espaços
            Then visualizo uma mensagem de erro de Perfil
            | mensagem | Não foi possível atualizar suas informações 🥺 |          