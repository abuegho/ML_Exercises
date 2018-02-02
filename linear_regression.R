## Exercise: least squares regression


##   Use the /states.rds/ data set. Fit a model predicting energy consumed
##   per capita (energy) from the percentage of residents living in
##   metropolitan areas (metro). Be sure to
##   1. Examine/plot the data before fitting the model

quickplot(energy, metro, data = states)

##   2. Print and interpret the model `summary'

EM = lm(energy ~ metro, data = states)
summary(EM)

##   3. `plot' the model to look for deviations from modeling assumptions

ggplot(states, aes(energy, metro)) + 
  geom_point() + 
  stat_smooth()

##   Select one or more additional predictors to add to your model and
##   repeat steps 1-3. Is this model significantly better than the model
##   with /metro/ as the only predictor?

EMET = lm(energy ~ metro + expense + toxic, data = states)
summary(EMET)

plot(EMET)

## Exercise: interactions and factors


##   Use the states data set.

##   1. Add on to the regression equation that you created in exercise 1 by
##      generating an interaction term and testing the interaction.

EMET_int = lm(energy ~ (metro + expense + toxic)*income , data = states)
coef(summary(EMET_int))

##   2. Try adding region to the model. Are there significant differences
##      across the four regions?

EMET_r = lm(energy ~ (metro + expense + toxic)*region , data = states)
coef(summary(EMET_r))
