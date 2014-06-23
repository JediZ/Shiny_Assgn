library(shiny)

#' @param X1,X2: numeric, electronegativities
#' @return percent ionic character of covalent bond
#' 
percentIonicCharacter <- function(X1,X2){
    100* (1-exp(-0.25*(X1-X2)^2))
}


shinyServer(
    function(input,output){
        PaulingElectroNegativity <- c(2.20,NA,0.98,1.57,
                           2.04,2.55,3.04,3.44,
                           3.98,NA,0.93,1.31,
                           1.61,1.90,2.19,2.58,
                           3.16,NA,0.82,1.00)
        output$EN1 <- renderText({PaulingElectroNegativity[as.integer(input$select1)]})
        output$EN2 <- renderText({PaulingElectroNegativity[as.integer(input$select2)]})
        output$prediction <- renderText({
                paste(
                    as.character(round(percentIonicCharacter(
                    PaulingElectroNegativity[as.integer(input$select1)],
                    PaulingElectroNegativity[as.integer(input$select2)]
                    ),1)),
                "%")
        })
        output$mainplot <- renderPlot({
            deltaX<- 0:40;deltaX<- deltaX/10
            IonicCharacter<- 100* (1-exp(-0.25*deltaX^2))
            plot(deltaX,IonicCharacter,"l",xlab="Abs(X1-X2)",ylab="Ionic %")
            dx <- PaulingElectroNegativity[as.integer(input$select1)]-
                PaulingElectroNegativity[as.integer(input$select2)]            
            points(abs(dx),100* (1-exp(-0.25*dx^2))
                   ,col="red")
        }, height=400,width=600)
    }
    )