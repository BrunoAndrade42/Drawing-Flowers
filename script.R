# Carregar pacotes
library(ggplot2)
library(cowplot)

# ===========================================
# Fornecer os dados para plot do círculo
t <- seq(0, 2*pi, length.out = 50)
x <- sin(t)
y <- cos(t)
df <- data.frame(t, x, y)

# Fazer um gráfico de dispersão de pontos em um círculo
p <- ggplot(df, aes(x, y))
p + geom_point()

# ===========================================
# Defina o número de pontos
points <- 1000

# Defina o Ângulo de Ouro
angle <- pi * (3 - sqrt(5))

t <- (1:points) * angle
x <- sin(t)
y <-cos(t)
df <- data.frame(t, x, y)

# Fazer um gráfico de dispersão em uma espiral
p <- ggplot(df, aes(x*t, y*t))
p + geom_point()

# ===========================================
df <- data.frame(t, x, y)

# Fazer um gráfico de dispersão em uma espiral e remover alguns componentes
p <- ggplot(df, aes(x*t, y*t))
p + geom_point() +
  theme(panel.background = element_rect(fill = "white"), # remove o fundo em cinza
        panel.grid=element_blank(), #remove a grade de linhas brancas horizontais e verticais
        axis.ticks=element_blank(), # remove uns tracinhos que ficam no eixo x e y
        axis.title=element_blank(), # remove o título de cada eixo
        axis.text=element_blank()) # remove os textos que representa os valores de cada eixo)

# ===========================================
p <- ggplot(df, aes(x*t, y*t))
p + geom_point(size=5, alpha=.5, colour="darkgreen") + #ajustando tamanho dos pontos, transparência(alpha) e cor
  theme(panel.background = element_rect(fill = "white"),
        panel.grid=element_blank(),
        axis.ticks=element_blank(),
        axis.title=element_blank(),
        axis.text=element_blank())

# ===========================================
p <- ggplot(df, aes(x*t, y*t))
p + geom_point(aes(size=t), alpha=.5, shape=8, colour="yellow") + #ajustando tamanho dos pontos, forma e cor
  theme(panel.background = element_rect(fill = "white"),
        panel.grid=element_blank(),
        axis.ticks=element_blank(),
        axis.title=element_blank(),
        axis.text=element_blank(),
        legend.position = "none") # remove o painel de legendas

# ===========================================
p <- ggplot(df, aes(x*t, y*t))
p + geom_point(aes(size=t), alpha=.5, shape=17, colour="yellow") +
  theme(panel.background = element_rect(fill = "darkmagenta"),
        panel.grid=element_blank(),
        axis.ticks=element_blank(),
        axis.title=element_blank(),
        axis.text=element_blank(),
        legend.position = "none")

# ===========================================
# Mudando o valor do ângulo
angle <- 2.0
points <- 1000

t <- (1:points)*angle
x <- sin(t)
y <- cos(t)
df <- data.frame(t, x, y)

p <- ggplot(df, aes(x*t, y*t))
p + geom_point(aes(size=t), alpha=.5, shape=11, colour="yellow") +
  theme(panel.background = element_rect(fill = "darkmagenta"),
        panel.grid=element_blank(),
        axis.ticks=element_blank(),
        axis.title=element_blank(),
        axis.text=element_blank(),
        legend.position="none")

# ===========================================
func <- function(angle = 13 *pi/180 , points = 2000, cor="magenta4") {
  t <- (1:points)*angle
  x <- sin(t)
  y <- cos(t)
  df <- data.frame(t, x, y)
  
  ggplot(df, aes(x*t, y*t)) +         
    geom_point(size=100, alpha=.1, shape=1, colour=cor) +
    theme(panel.background = element_rect(fill = "white"),
          panel.grid=element_blank(),
          axis.ticks=element_blank(),
          axis.title=element_blank(),
          axis.text=element_blank(),
          legend.position="none")
}


plot_grid(func(), func(angle = 42, cor="#E02F5B"), labels = "AUTO")
