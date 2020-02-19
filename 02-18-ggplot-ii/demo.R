library(dplyr)
library(tidyr)
library(ggplot2)

ordered_midwest <- midwest %>% 
  arrange(area)

nrow(midwest)

# example of gather
midwest %>% 
  gather(key = "race", value = "count", c("popwhite", "popblack")) %>% 
  View()

gather(key = "type", value = "value", c("popwhite", "popblack")) %>% 
  
?gather

View(midwest)

midwest$state

# example plot
ggplot(data = ordered_midwest) +
  #                           order state by area
  geom_point(mapping = aes(x = percollege, y = percadultpoverty, color = popblack)) +
  labs(color = "STATE")
  scale_color_discrete(labels = c("a", "b", "c", "d", "e"))

# saving
ggsave("~/Desktop/my_beautiful_plot.png", my_plot)



rect <- data.frame(x_coords = c(2, 6, 5, 3), 
                   y_coords = c(4, 4, 2, 2))
rect

ggplot(data = rect) +
  geom_polygon(mapping = aes(x = x_coords, y = y_coords))

double_rect <- data.frame(x_coords = c(1,2,2,1, 3,4,4,3), 
                          y_coords = c(2,2,1,1, 2,2,1,1),
                          rect_num = c(1,1,1,1, 2,2,2,2))
double_rect

ggplot(data = double_rect) +
  geom_polygon(mapping = aes(x = x_coords, y = y_coords, group = rect_num, fill = rect_num))

library("maps")

us_states <- map_data("state")
View(us_states)

ggplot(data = us_states) +
  geom_polygon(mapping = aes(x = long, y = lat, group = group)) +
  coord_quickmap()

state_nums <- us_states %>% 
  select(region) %>%
  distinct() %>% 
  mutate(value = 1:49)

map_with_nums <- left_join(us_states, state_nums, by = "region")
View(map_with_nums)

ggplot(data = map_with_nums) +
  geom_polygon(mapping = aes(x = long, y = lat, group = group, fill = value)) +
  coord_quickmap()
