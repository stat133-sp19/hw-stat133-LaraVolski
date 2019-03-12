# title: "Shot Charts"
# description: This script is used to visualize the shots of 5 different NBA players.
# input(s): 
# output(s):

iguodala_scatterplot <- ggplot(data = iguodala) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))i