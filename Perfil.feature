Feature: Perfil
   Como um usuário com conta no sistema
   Desejo atualizar minhas informações básicas
   Para manter meus dados atualizados no sistema.

   Background: Acessar a tela de perfil

      Given que acesso a tela de perfil

      
         Scenario: Atulizar com campo nome em branco
            When deixo o campo nome em branco
            And preencho o campo E-mail
            | email | sophia@g.com |
            Then visualizo uma mensagem
            | mensagem | Informe seu nome |

         Scenario: Atulizar com campo E-mail em branco
            When deixo os campos email em branco
            And preencho o campo E-mail
            | nome | Sophia Santos |
            Then visualizo uma mensagem
            | mensagem | Informe seu e-mail |

         Scenario: Atualizar Usuario pelo nome
            When preencho o campo nome
            | nome | Sophia Santos |
            And clico no botão Confirmar alterações
            And clico no botão Confirmar
            Then visualizo uma mensagem
            | mensagem | Informações atualizadas com sucesso |

         Scenario: Atualizar Usuario pelo E-mail
            When preencho o campo E-mail
            | email | sophia@g.com |
            And clico no botão Confirmar alterações
            And clico no botão Confirmar
            Then visualizo uma mensagem
            | mensagem | Informações atualizadas com sucesso |

         Scenario: Atualizar Usuario com E-mail já utilizado
            When preencho o campo E-mail
            | email | luffy@g.com |
            And clico no botão Confirmar alterações
            And clico no botão Confirmar
            Then visualizo uma mensagem
            | mensagem | Informações atualizadas com sucesso |

         Scenario: Atualizar Usuario com E-mail inválido
            When preencho o campo E-mail
            | email | luffyg.com |
            And clico no botão Confirmar alterações
            Then visualizo uma mensagem
            | mensagem | Formato de e-mail inválido. |

         Scenario: Atualizar nome com mais de 100 caracteres
            When preencho o campo nome
            | email | ChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChicoChico |
            And clico no botão Confirmar alterações
            Then visualizo uma mensagem
            | mensagem | Informe no máximo 100 letras no seu nome |

         Scenario: Atualizar E-mail com mais de 60 caracteres
            When preencho o campo E-mail
            | email | chicochicochicochicochicochicochicochicochicochicochicochico@g.com |
            And clico no botão Confirmar alterações
            And clico no botão Confirmar
            Then visualizo uma mensagem
            | mensagem | Informações atualizadas com sucesso |

         Scenario: Atualizar Usuario pelo nome com caracteres especiais
            When preencho o campo nome
            | nome | .... |
            And clico no botão Confirmar alterações
            And clico no botão Confirmar
            Then visualizo uma mensagem
            | mensagem | Informações atualizadas com sucesso |

         Scenario: Atualizar Usuario pelo nome com caracteres especiais
            When preencho o campo nome
            | nome | ,,,, |
            And clico no botão Confirmar alterações
            Then visualizo uma mensagem
            | mensagem | Formato do nome é inválido. |