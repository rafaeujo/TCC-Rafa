library("dplyr")

massassinadas <- read.csv("dados_sim_2019_2024.csv")

unique(massassinadas$CIRCOBITO)

acidentes <-  massassinadas %>% 
  filter(CIRCOBITO == "Acidente")


sort(unique(acidentes$CAUSABAS)
)

simdo <- massassinadas %>% 
  select(ano_referencia, DTOBITO, DTNASC,IDADE, RACACOR, ESTCIV, ESC2010, OCUP, 
         QTDFILVIVO, ASSISTMED, CIRCOBITO, ACIDTRAB, FONTE, ESCMAE, TPPOS, DTCONCASO)

simdo2024 <- simdo %>% 
  filter(ano_referencia == 2024)

femcidio2024 <- data.frame("UF" = c("Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"), 
                           "NUMABSO" = c(8, 22, 2, 29, 111, 41, 23, 39, 56, 69, 47, 35,
                                                 163, 50, 26, 109, 77, 40, 107, 19, 72, 13, 7, 
                                                 51, 253, 10, 13),
                           "PROPFEM.HOM" = c(61.5, 30.1, 33.3, 37.7, 28.6, 13.2, 65.7, 41.9, 47.1, 44.2, 47.0, 62.5, 47.0, 28.1, 39.4, 44.3, 30.0, 55.6, 43.7, 37.3, 36.0, 32.5, 41.2, 61.4, 60.1, 43.5, 46.4))

sum(femcidio2024$NUMABSO)

lesfem2024 <- data.frame(
  MES = c(
    "Janeiro", "Fevereiro", "Março", "Abril",
    "Maio", "Junho", "Julho", "Agosto",
    "Setembro", "Outubro", "Novembro", "Dezembro"
  ),
  NUM = c(
    446, 417, 428, 432,
    425, 379, 420, 379,
    462, 421, 481, 460
  )
)

sum(lesfem2024$NUM)
