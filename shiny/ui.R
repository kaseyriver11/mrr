

shinyUI(
  bootstrapPage(
    fluidPage(
      theme = "bootstrap.css",
      
      navbarPage("Optimal Time to List on MiningRigRentals"),
      # Panel 1
      sidebarLayout(
        sidebarPanel(width = 3,
                     
                     selectInput("algorithm", "Select Algorithm:",
                                 choices = c("Equihash" = "Equihash",
                                             "Sha256" = "Sha256"),
                                 selected = "Equihash")
                     
        ),
        
        mainPanel(
         fluidRow(
           column(6,dataTableOutput("table")
           ))
          
        )
      )
    )
  ))

