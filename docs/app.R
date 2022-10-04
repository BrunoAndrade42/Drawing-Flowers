
library(shiny)

ui <- fluidPage(

    # Application title
    titlePanel("Desenhando Flores usando Matemática - Interativo"),
  
    sidebarLayout(
      sidebarPanel(
        selectInput("cores", "Cores:",
                    c("Magenta" = "magenta4",
                      "Amadeirado - Tom 1" = "#94360A",
                      "Amadeirado - Tom 2" = "#5F2809",
                      "Primaveril - Tom 1" = "#E02F5B",
                      "Primaveril - Tom 2" = "#F8662D",
                      "Campestre - Tom 1" = "#358733",
                      "Campestre - Tom 2" = "#E7C339")),
        
        sliderInput("angulo", "Ângulo", min = 0, max = 100, value = 42),
        sliderInput("pontos", "Pontos", min = 0, max = 2000, value = 2000
                    , step = 500),
        sliderInput("transp", "Transparência", min = 0, max = 0.5, 
                    value = 0.1, step = 0.1),
        sliderInput("tamanho", "Tamanho", min = 0, max = 100, 
                    value = 100, step = 10),
      ),
      
      mainPanel(
        plotOutput("plot", width = 500, height = 500)
      )
    )
)

server <- function(input, output) {
    
  dat <- reactive({
    angle <- input$angulo
    points <- input$pontos
    
    t <- (1:points)*angle
    x <- sin(t)
    y <- cos(t)
    
    df <- data.frame(t, x, y)
    return(list("T" = t, "X" = x, "Y" = y, "dataFrame" = df))
  })
 
  output$plot <- renderPlot({
      d <- dat()
      ggplot(d$dataFrame, aes(d$X*d$T, d$Y*d$T)) + 
      geom_point(size=input$tamanho, alpha=input$transp, 
                 shape=1, colour=input$cores) +
      theme(panel.background = element_rect(fill = "white"),
            panel.grid=element_blank(),
            axis.ticks=element_blank(),
            axis.title=element_blank(),
            axis.text=element_blank(),
            legend.position="none")
  })
  
}

shinyApp(ui = ui, server = server)
