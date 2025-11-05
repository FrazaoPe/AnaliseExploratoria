# Importando a base
library(readxl)
base <- readxl::read_excel("Base_trabalho.xlsx")

# Transformando v.a's qualitativas em fatores:
base$sexo <- as.factor(base$sexo)
base$escolaridade <- as.factor(base$escolaridade)
base$casado <- as.factor(base$casado)
base$filhos <- as.factor(base$filhos)
base$reincidente <- as.factor(base$reincidente)

# Realizando análise de dados faltantes
contagem_na <- colSums(is.na(base))
print(contagem_na)

# Construindo visualizações dos dados
library(ggplot2)

# Obtendo resumos descritivos
summary(base$idade)
summary(base$score_periculosidade)
summary(base$tempo_preso)

# Gráfico de dispersão entre tempo de prisão e escolaridade
ggplot(base, aes(x = tempo_preso, y = score_periculosidade)) +
  geom_point() + 
  labs(
    x = "Anos de prisão",
    y = "Score de periculosidade"
  ) +
  theme_minimal() +
  theme(axis.text = element_text(size = 14),
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14))

# Obtendo o coeficiente de correlação entre as duas variáveis
cor(base$tempo_preso,base$score_periculosidade)

# Terminação
