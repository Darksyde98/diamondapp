library(shiny)
library(ggplot2)

dataset <- diamonds

pageWithSidebar(

        headerPanel("Explore the diamonds set!"),

        sidebarPanel(
                p("This app lets you explore the diamonds data set visually."),
                p("Add the number of diamons to plot through the slider"),
                p("Choose your input from the relevant variables."),
                p("Add jitter and smooth lines to help visualize."),
                p("Facets lets you add plots in a grid style according to input."),

                sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                            value=min(1000, nrow(dataset)), step=500, round=0),

                selectInput('x', 'X', names(dataset)),
                selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
                selectInput('color', 'Color', c('None', names(dataset))),

                checkboxInput('jitter', 'Jitter'),
                checkboxInput('smooth', 'Smooth'),

                selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
                selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
        ),

        mainPanel(
                plotOutput('plot')
        )
)
