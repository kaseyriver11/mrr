shinyServer(
  function(input, output, session){
    Sys.setlocale(locale="C")

output$table <- renderDataTable({
  df$Time <- as.character(df$Time)
  df
})

})