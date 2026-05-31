# 1. Instalação de pacotes (execute apenas se for necessário)
# install.packages("remotes")
# remotes::install_github("danicat/read.dbc")
# remotes::install_github("rfsaldanha/microdatasus")

# 2. Carregamento das bibliotecas
library(microdatasus)
library(dplyr)
library(readr)

# 3. Definição do período (agora incluindo 2019)
anos <- 2019:2024

# 4. Inicialização das listas para armazenar os dados
dt_brut <- list()
dt_proc <- list()

# 5. Loop de consulta, processamento e filtragem
for (ano in anos) {
  
  # Converte o ano para texto para usar como nome na lista
  ano_str <- as.character(ano)
  
  # A. Download dos dados brutos (Nota: configurado apenas para janeiro)
  dt_brut[[ano_str]] <- fetch_datasus(
    year_start = ano,
    month_start = 1,
    year_end = ano,
    month_end = 1,
    uf = "all",
    information_system = "SIM-DO",
    stop_on_error = FALSE,
    timeout = 1000,
    track_source = FALSE
  )
  
  # B. Processamento dos dados
  dt_processado <- process_sim(data = dt_brut[[ano_str]])
  
  # C. Filtragem (Feminino e Causa Básica X85 a Y09) e armazenamento na lista final
  dt_proc[[ano_str]] <- dt_processado %>%
    filter(
      SEXO == "Feminino",
      substr(CAUSABAS, 1, 3) >= "X85" & substr(CAUSABAS, 1, 3) <= "Y09"
    )
}

# Combina todos os elementos da lista em um único data frame
dt_final <- bind_rows(dt_proc, .id = "ano_referencia")

# Salva o dataset unificado em formato CSV
write_csv(dt_final, "dados_sim_2019_2024.csv")
