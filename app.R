library(shiny)

library(ggplot2)

library(reshape2)

library(rsconnect)

ui <- fluidPage(
  # App title ----
  titlePanel("Investing Money"),
  
  # Sidebar layout with input and output definitions ----
  fluidRow(
      
    column(4, 
      # Input: Initial Amount ----
      sliderInput("amount", "Initial Amount:",
                  min = 1, max = 100000,
                  value = 1000,
                  step = 500),
  
      # Input: Annual Contribution ----
      sliderInput("contrib", "Annual Contribution:",
                  min = 0, max = 50000,
                  value = 2000,
                  step = 500)
  ),
  
    column(4, offset = 0.4,
      # Input: Return Rate ----
      sliderInput("rate", "Return Rate (in %)",
                  min = 0, max = 20,
                  value = 5,
                  step = 0.1),
      

      # Input: Growth Rate ----
      sliderInput("growth", "Growth Rate:",
                  min = 0, max = 20,
                  value = 2,
                  step = 0.1)
  ),
  
      column(4,
      # Input: Years ----
      sliderInput("years", "Years:",
                  min = 0, max = 50,
                  value = 20,
                  step = 1),
     
      # Input: Facet? ----
     selectInput("facet", "Facet?:",
                 choices = c("yes", "no"))
      )),
  
    # Output:  ----
 
    h4("Timelines"),
    plotOutput("modalities"),
    h4("Balances"),
    dataTableOutput("table"))



server <- function(input, output) {
  balances <- reactive({
  
  balances <- data.frame(
    years = 0:input$years,
    no_contrib = rep(0, input$years + 1),
    fixed_contrib = rep(0, input$years + 1),
    growing_contrib = rep(0, input$years + 1)
  )
  
     for(i in 0:input$years){
      balances$no_contrib[i + 1] = input$amount * (1 + (input$rate/100))^(i)
      balances$fixed_contrib[i + 1] =  balances$no_contrib[i + 1] + (input$contrib * abs(((1 + (input$rate/100))^(i) - 1) / (input$rate/100)))
      balances$growing_contrib[i + 1] = balances$no_contrib[i + 1] + (input$contrib * abs((((1 + (input$rate/100))^(i)) - ((1 + (input$growth/100))^(i))) / ((input$rate/100) - (input$growth/100))))
      }
    balances
    })
  
  
  output$modalities <- renderPlot({
    melt_dat <- melt(data = balances(), id.vars = "years")
   
  if(input$facet == "no"){
    ggplot(melt_dat, aes(x = years, y = value)) +
      geom_point(aes(color = variable)) +
      geom_line(aes(color = variable)) +
      labs(x = "Years", y = "Balance in USD", title = "3 Modes of Investing")}
    
  else if(input$facet == "yes"){
    ggplot(melt_dat, aes(x = years, y = value)) +
      geom_point(aes(color = variable)) +
      geom_line(aes(color = variable)) +
      labs(x = "Years", y = "Balance in USD", title = "3 Modalities by Year") +
      facet_wrap(~variable) +
      geom_area(mapping=aes(fill= variable)) +
      theme(panel.background = element_rect(colour = "white"))
    }
  })
  
  output$table <- renderDataTable(balances())
}
  
shinyApp(ui, server)