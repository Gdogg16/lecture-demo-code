library("ggplot2")
library("tidyr")

colnames(midwest)

ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty, color = state))

# Bar chart of population by state
ggplot(data = midwest) +
  geom_col(mapping = aes(x = state, y = poptotal))

# A hexagonal aggregation (count) of education and poverty
ggplot(data = midwest) +
  geom_hex(mapping = aes(x = percollege, y = percadultpoverty))

# A plot with both points and a smoothed line, sharing aesthetic mappings
ggplot(data = midwest, mapping = aes(x = percollege, y = percadultpoverty)) +
  geom_point() + # uses the default x and y mappings
  geom_smooth() + # uses the default x and y mappings
  geom_point(mapping = aes(y = percchildbelowpovert), color = "red") # uses own y mapping


ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty, color = state)) +
  scale_x_reverse() +
  scale_y_continuous(limits = c(0, 40)) + # explicitly set a continuous scale for the y-axis
  scale_color_brewer(palette = "PuOr")
    #scale_color_hue(l = 70, c = 30) # custom color scale

top_10 <- midwest %>%
  top_n(10, wt = poptotal) %>%
  unite(county_state, county, state, sep = ", ") %>% # combine state + county
  arrange(poptotal) %>% # sort the data by population
  mutate(location = factor(county_state, county_state)) # set the row order

# Render a horizontal bar chart of population
ggplot(top_10) +
  geom_col(mapping = aes(x = location, y = poptotal)) + 
  coord_flip() # switch the orientation of the x- and y-axes


ggplot(mpg, aes(x = factor(1), fill = factor(cyl))) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")


# Create a better label for the `inmetro` column
labeled <- midwest %>%
  mutate(location = if_else(inmetro == 0, "Rural", "Urban"))

View(labeled)

# Create the same chart as Figure 16.9, faceted by state
ggplot(data = labeled) +
  geom_point(
    mapping = aes(x = percollege, y = percadultpoverty, color = location),
    alpha = .6
  ) +
  facet_wrap(~state) # pass the `state` column as a *fomula* to `facet_wrap()`
