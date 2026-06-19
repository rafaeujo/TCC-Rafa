library("dplyr")

massassinadas <- read.csv("dados_sim_2016_2024.csv")

unique(massassinadas$CIRCOBITO)

acidentes <-  massassinadas %>% 
  filter(CIRCOBITO == "Acidente")


x <- substr(sort(unique(acidentes$CAUSABAS)
), 1,3)
unique(x)

simdo <- massassinadas %>% 
  select(ano_referencia, DTOBITO, DTNASC,IDADE, RACACOR, ESTCIV, ESC2010, OCUP, 
         QTDFILVIVO, ASSISTMED, CIRCOBITO, CAUSABAS, ACIDTRAB, FONTE, ESCMAE, TPPOS, DTCONCASO)

simdo2024 <- simdo %>% 
  filter(ano_referencia == 2024)

View(sim)

femcidio2024 <- data.frame("UF" = c("Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"), 
                           "NUMABSO" = c(8, 22, 2, 29, 111, 41, 23, 39, 56, 69, 47, 35,
                                                 163, 50, 26, 109, 77, 40, 107, 19, 72, 13, 7, 
                                                 51, 253, 10, 13),
                           "PROPFEM.HOM" = c(61.5, 30.1, 33.3, 37.7, 28.6, 13.2, 65.7, 41.9, 47.1, 44.2, 47.0, 62.5, 47.0, 28.1, 39.4, 44.3, 30.0, 55.6, 43.7, 37.3, 36.0, 32.5, 41.2, 61.4, 60.1, 43.5, 46.4))

sum(femcidio2024$NUMABSO)

feminicidio2024 <- data.frame("Ano" = rep(2024,27),
  "UF" = c("Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"), 
                           "Feminicidio" = c(8, 22, 2, 29, 111, 41, 23, 39, 56, 69, 47, 35,
                                         163, 50, 26, 109, 77, 40, 107, 19, 72, 13, 7, 
                                         51, 253, 10, 13))

feminicidio2023 <- data.frame('Ano' = rep(2023,27),
                              'UF' = c("Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"),
                              'Feminicidio' = c(10, 18, 4, 23, 108, 42, 33, 35, 56, 50, 46, 30, 183, 57, 34, 81, 81, 28, 99, 24, 87, 21, 6, 56, 221, 16, 18))

feminicidio2022 <- data.frame('Ano' = rep(2022,27),
                              'UF' = c("Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"),
                              'Feminicidio' = c(9, 31, 9, 21, 107, 29, 22, 35, 55, 69, 47, 44, 175, 54, 26, 77, 72, 24, 111, 16, 111, 23, 3, 57, 195, 19, 14))

feminicidio2021 <- data.frame('Ano' = rep(2021,27),
                              'UF' = c("Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"),
                              'Feminicidio' = c(
                                13, 25, 4, 23, 88, 31, 25, 38, 54,
                                58, 43, 37, 154, 64, 32, 75, 86,
                                37, 85, 20, 96, 16, 5, 55, 136,
                                20, 21))

feminicidio2020 <- data.frame('Ano' = rep(2020,27),
                              'UF' = c("Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"),
                              'Feminicidio' = c(
                                12, 35, 9, 15, 113, 27, 17, 26, 44,
                                65, 62, 41, 151, 67, 36, 73, 75,
                                31, 78, 13, 80, 14, 9, 57, 179,
                                14, 10
                              ))

feminicidio2019 <- data.frame('Ano' = rep(2019,27),
                              'UF' = c("Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"),
                              'Feminicidio' = c(11, 44, 7, 12, 101, 34, 33, 35, 40, 52, 39, 34, 142, 45, 38, 89, 57, 29, 85, 21, 97, 7, 6, 58, 184, 21, 5))

feminicidio2018 <- data.frame('Ano' = rep(2018,27),
                              'UF' = c("Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"),
                              'Feminicidio' = c(14, 21, 3, 4, 76, 30, 28, 34, 36, 45, 42, 42, 157, 66, 34, 69, 74, 26, 71, 28, 116, 9, 4, 42, 136, 16, 6))

feminicidio2017 <- data.frame('Ano' = rep(2017,27),
                              'UF' = c("Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"),
                              'Feminicidio' = c(13, 31, 2, 16, 74, NA, 19, 42, 31, 50, 76, 27, 145, 37, 22, 21, 76, 26, 68, 23, 83, 54, 3, 48, 108, 6, 32))

feminicidio2016 <- data.frame('Ano' = rep(2016,27),
                              'UF' = c("Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"),
                              'Feminicidio' = c(14, 36, NA, 10, 18, NA, 20, 35, 17, NA, 49, 34, 134, 44, 24, 20, 112, 31, 16, 27, 96, 37, 3, 54, 60, NA, 38))

feminicidio2016_2024 <- rbind(feminicidio2024, feminicidio2023, feminicidio2022, feminicidio2021, feminicidio2020, feminicidio2019, feminicidio2018, feminicidio2017, feminicidio2016)

write_csv(feminicidio2016_2024, "feminicidio2016_2024.csv")

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
