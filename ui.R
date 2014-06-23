library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Ionic Character of a Covalent Bond"),
    sidebarPanel(
        h3('Introduction'),
        p('This app uses Pauling Electronegativity scale to calculate the ionic character of a diatomic covalent bond.'),
        p('The formula is 100* (1-exp(-0.25*(X1-X2)^2)), where X1 and X2 are Pauling Electronegativities.'),
        h3('Choose two atoms:'),
        selectInput("select1", label = h3("Atom 1"),
                    choices = list("H" = 1, "He" = 2, "Li" = 3, "Be" = 4,
                                   "B" = 5, "C"= 6, "N"= 7, "O" = 8,
                                   "F" = 9, "Ne"=10, "Na" =11, "Mg"=12,
                                   "Al"=13, "Si"=14, "P"=15, "S"=16,
                                   "Cl"=17, "Ar"=18,"K"=19,"Ca"=20
                                   ), selected = 1),
        selectInput("select2", label = h3("Atom 2"),
                    choices = list("H" = 1, "He" = 2, "Li" = 3, "Be" = 4,
                                   "B" = 5, "C"= 6, "N"= 7, "O" = 8,
                                   "F" = 9, "Ne"=10, "Na" =11, "Mg"=12,
                                   "Al"=13, "Si"=14, "P"=15, "S"=16,
                                   "Cl"=17, "Ar"=18,"K"=19,"Ca"=20
                    ), selected = 1)
        ),
    mainPanel(
        h3('Result:'),
        h4('Atom 1, electronegativity:'),
        textOutput("EN1"),
        h4('Atom 2, electronegativity:'),
        textOutput("EN2"),
        h4('The Ionic Character of a Covalent Bond between them is '),
        textOutput("prediction"),
        plotOutput("mainplot",width="100%")
        )
    ))