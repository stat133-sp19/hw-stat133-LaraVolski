# title: "Data Preparation"
# description: This script is used to prepare NBA shot data for analysis. It will involve 5 players and all of the data involving their shots over multiple games.
# input(s): andre-iguodala.csv, draymond-green.csv, kevin-durant.csv, klay-thompson.csv, stephen-curry.csv
# output(s): andre-iguodala-summary.txt, klay-thompson-summary.txt, draymond-green-summary.txt, kevin-durant-summary.txt, stephen-curry-summary.txt

# Read in the 5 datasets
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

#Add a column name 
iguodala$name <- "Andre Iguodala"
thompson$name <- "Klay Thompson"
green$name <- "Draymond Green"
durant$name <- "Kevin Durant"
curry$name <- "Stephen Curry"

#Change the OG values of shot_made_flag
library(stringr)
iguodala$shot_made_flag <- str_replace_all(iguodala$shot_made_flag, 'n', 'shot_no')
iguodala$shot_made_flag <- str_replace_all(iguodala$shot_made_flag, 'y', 'shot_yes')

thompson$shot_made_flag <- str_replace_all(thompson$shot_made_flag, 'n', 'shot_no')
thompson$shot_made_flag <- str_replace_all(thompson$shot_made_flag, 'y', 'shot_yes')

green$shot_made_flag <- str_replace_all(green$shot_made_flag, 'n', 'shot_no')
green$shot_made_flag <- str_replace_all(green$shot_made_flag, 'y', 'shot_yes')

durant$shot_made_flag <- str_replace_all(durant$shot_made_flag, 'n', 'shot_no')
durant$shot_made_flag <- str_replace_all(durant$shot_made_flag, 'y', 'shot_yes')

curry$shot_made_flag <- str_replace_all(curry$shot_made_flag, 'n', 'shot_no')
curry$shot_made_flag <- str_replace_all(curry$shot_made_flag, 'y', 'shot_yes')

#Add a column minute
iguodala$minute <- (iguodala$period * 12) - iguodala$minutes_remaining

thompson$minute <- (thompson$period * 12) - thompson$minutes_remaining

green$minute <- (green$period * 12) - green$minutes_remaining

durant$minute <- (durant$period * 12) - durant$minutes_remaining

curry$minute <- (curry$period * 12) - curry$minutes_remaining

#Use sink to send the summary() output of each imported data frame into individual text files
sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

# Use rbind() to stack tables into one single data frame
shotsdatatable <- rbind(curry, durant, green, iguodala, thompson)

# Export the assembled table as a CSV file shots-data.csv inside the folder data/
write.table(shotsdatatable, "../data/shots-data.csv")

# Use sink() to export a summary of this table
sink(file = '../output/shots-data-summary.txt')
summary(shotsdatatable)
sink()