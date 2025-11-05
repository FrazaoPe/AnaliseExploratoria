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

# Histograma da variável idade 
ggplot(base, aes(x = idade)) +
  geom_histogram(bins = 10, fill = "cornflowerblue", color = "white") +
  labs(
    x = "Idade (anos)",
    y = "Frequência"
  ) +
  theme_minimal() +
  theme(axis.text = element_text(size = 14),
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14))

# Boxplot da variável "tempo de prisão" 
ggplot(base, aes(y = tempo_preso)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(
    y = "Anos de prisão",
    x = "" 
  ) +
  theme_minimal() +
  theme(axis.text = element_text(size = 14),
        axis.text.x = element_blank(),
        axis.title.y = element_text(size = 14))
  
# Boxplot da variável score de periculosidade 
base$escolaridade_fator <- factor(
  base$escolaridade, 
  levels = c(1, 2, 3), 
  labels = c("Fundamental","Médio","Superior")
)

ggplot(base, aes(x = escolaridade_fator, y = score_periculosidade)) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  labs(
    x = "Nivel de escolaridade",
    y = "Score de Periculosidade"
  ) +
  theme_minimal() +
  theme(axis.text = element_text(size = 14),
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14))

# Contagem de criminosos reincidentes
base$reincidente_fator <- factor(
  base$reincidente, 
  levels = c(0, 1), 
  labels = c("Não", "Sim")
)

ggplot(base, aes(x = reincidente_fator)) +
  geom_bar(fill = "coral", color = "black") +
  labs(
    x = "Reincidência penitenciária",  
    y = "Frequência Absoluta"
  ) +
  theme_minimal() +
  theme(axis.text = element_text(size = 14),
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14))

# Terminação
