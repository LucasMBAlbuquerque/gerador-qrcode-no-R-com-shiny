
#pacotes
library(qrcode)
library(shiny)

#lado do usuario

ui<- fluidPage(titlePanel('Gerador de QRCODE')
, sidebarLayout(
  
  sidebarPanel(
    
    h4('GERAR QRCODE', align = "center"),
    
    textInput(inputId = "uiDigite",label="Digite aqui"),
    
    actionButton(inputId = "uiGerar",label = "Gerar", width = '100%'),
    
    hr(),
    
    actionButton(inputId = "uiSair",label = "Sair", width = '100%')
    
  ),
  
  mainPanel("",
            
            navbarPage(title = "GERADOR",
                       tabPanel("QRCODE GERADO AGORA",
                                plotOutput("QRCODE_1")
                       )
            )
            
  )
  
))

server<- function(input,output){
  observeEvent(input$uiGerar,{
    png("qrplot.png")
    d<-qr_code(input$uiDigite)
    output$QRCODE_1=renderPlot(plot(d))
  })
  observeEvent(input$uiSair,{
    stopApp()
  }
)
}

shinyApp(ui,server)

