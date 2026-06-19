# Carregando as bibliotecas
library(CCA)
library(CCP)
library(dplyr)
library(tidyr)
library(readr)

sim2016_2024 <- read.csv("dados_sim_2016_2024.csv")

consulta_cca <- sim2016_2024 %>% 
  dplyr::select(ano_referencia, munResUf, CAUSABAS) %>%
  mutate(CAUSABAS = substr(CAUSABAS, 1, 3)) %>%
  count(ano_referencia, munResUf, CAUSABAS) %>%
  pivot_wider(
    names_from = CAUSABAS,
    values_from = n,
    values_fill = 0 
  ) %>% 
  rename(Ano = ano_referencia, UF = munResUf)

fem <- read.csv("feminicidio2016_2024.csv")

consulta_cca <- fem %>% 
  inner_join(consulta_cca, by = c("Ano", "UF"))

X <- consulta_cca[, "Feminicidio", drop = FALSE]
Y <- consulta_cca[, 4:28]

ccatest <- cc(X, Y)
print(ccatest$cor)

as.data.frame(ccatest$ycoef)

cargas <- comput(X, Y, ccatest)
print(cargas$corr.Y.yscores)

tabela_impacto <- data.frame(
  Variavel = rownames(ccatest$ycoef),
  Coeficiente = ccatest$ycoef[, 1],
  Carga = cargas$corr.Y.yscores[, 1]
)

# 2. Ordenando a tabela pelo valor absoluto da Carga Canônica (do maior para o menor)
tabela_ordenada <- tabela_impacto %>%
  arrange(desc(abs(Carga)))


# 1. Criando o dicionário com os códigos (CID-10) e as descrições
dicionario_agressoes <- data.frame(
  Variavel = c("X85", "X86", "X87", "X88", "X89", "X90", "X91", "X92", "X93", "X94", 
               "X95", "X96", "X97", "X98", "X99", "Y00", "Y01", "Y02", "Y03", "Y04", 
               "Y05", "Y06", "Y07", "Y08", "Y09"),
  Descricao = c(
    "Agressão por drogas, medicamentos e substâncias biológicas",
    "Agressão por substâncias corrosivas",
    "Agressão por pesticidas",
    "Agressão por gases e vapores",
    "Agressão por outros produtos químicos e subst. nocivas especificadas",
    "Agressão por produtos químicos e subst. nocivas não especificadas",
    "Agressão por enforcamento, estrangulamento e sufocação",
    "Agressão por afogamento e submersão",
    "Agressão por disparo de arma de fogo de mão",
    "Agressão por disparo de espingarda, carabina ou arma de maior calibre",
    "Agressão por disparo de outra arma de fogo ou não especificada",
    "Agressão por material explosivo",
    "Agressão por fumaça, fogo e chamas",
    "Agressão por vapor de água, gases ou objetos quentes",
    "Agressão por objeto cortante ou penetrante",
    "Agressão por objeto contundente",
    "Agressão por projeção de um lugar elevado",
    "Agressão por projeção/colocação da vítima diante de objeto em movimento",
    "Agressão por impacto de um veículo a motor",
    "Agressão por força corporal",
    "Agressão sexual por força física",
    "Negligência e abandono",
    "Outras síndromes de maus tratos",
    "Agressão por outros meios especificados",
    "Agressão por meios não especificados"
  )
)

# 2. Unindo o dicionário à tabela ordenada que já possuímos
# O left_join vai procurar a correspondência exata do código da coluna 'Variavel'
tabela_final <- tabela_ordenada %>%
  left_join(dicionario_agressoes, by = "Variavel") 

# 3. Visualizando o resultado final, pronto para interpretação
print(tabela_final)


# 1. Calculando o R² Canônico (A força do vínculo entre os dois grupos)
# Pegamos o primeiro valor de correlação e elevamos ao quadrado
r2_canonico <- ccatest$cor[1]^2

# 2. Índice de Redundância para o Conjunto X (Feminicídio)
# Como X tem apenas 1 variável, sua redundância é o próprio R²
redundancia_X <- r2_canonico

# 3. Índice de Redundância para o Conjunto Y (Agressões)
# Passo A: Calcular a variância extraída (média do quadrado das cargas de Y)
variancia_extraida_Y <- mean(cargas$corr.Y.yscores[, 1]^2)

# Passo B: Multiplicar pela força do vínculo (R²)
redundancia_Y <- variancia_extraida_Y * r2_canonico

# 4. Exibindo os resultados de forma formatada e em porcentagem
cat("--- ÍNDICES DE REDUNDÂNCIA ---\n")
cat(sprintf("R² Canônico (Força Matemática do Modelo): %.2f%%\n\n", r2_canonico * 100))

cat(sprintf("Redundância de X: O bloco de Agressões consegue explicar %.2f%% da variabilidade da taxa de Feminicídio.\n", redundancia_X * 100))

cat(sprintf("Redundância de Y: A taxa de Feminicídio consegue explicar %.2f%% da variabilidade total do bloco de Agressões.\n", redundancia_Y * 100))

