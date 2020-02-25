library("shiny")

# Hey I'm a User Interface
my_ui <- fluidPage(
  h1("Hello Shiny"),
  textInput(inputId = "user_name", label = "What is your name?"),
  textOutput(outputId = "message")
)


my_server <- function(input_list, output_list) {

  # create some text for people to see
  output_list$message <- renderText({
    # find what the user typed in
    greeting <- paste("Hello", input_list$user_name)
    return(greeting)
  })
}


# create and run the Shiny app
shinyApp(ui = my_ui, server = my_server)