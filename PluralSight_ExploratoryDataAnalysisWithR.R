# Transforming and Cleaning Data
# set working directory 
setwd("/Users/faith/Documents/R Tutorials/datasciencecoursera")
# load data from tab-delimited file
movies <- read.table(
  file = "/Users/faith/downloads/r-data-analysis/2-r-data-analysis-m2-exercise-files/Movies.txt",
  sep = "\t", 
  header = TRUE, 
  quote = "\""
)
#peak at data
head(movies)

# look at column names 
names(movies)

# Problem #1: column Name is incorrect
names(movies)[5]
#Rename variables (i.e columns)
names(movies)[5] <- "Critic Score"
#Problem #1 solved 
names(movies)

#Problem #2: Missing values
#Count missing values 
sum(is.na(movies))
tail(movies) #inspect row with missing values, intentionally put at end of the file
# exclude observations with missing values 
movies <- na.omit(movies)
#Problem #2 solved
sum(is.na(movies))

#Problem #3: units in runtime colum 
#Peek at the movie runtime data
head(movies$Runtime)
# Note: running a mathmatical computation on Runtime column will throw an error 
  #as the values are not numbers 
# Determine the data type
class(movies$Runtime)
#Eliminate the unit of measure
runtimes <- sub("min", "", movies$Runtime)
head(runtimes)
# cast the character string to integer
movies$Runtime <- as.integer(runtimes)
head(movies$Runtime)
#Problem #3 solved
class(movies$Runtime)
#now perform mathematical cals
mean(movies$Runtime)

#Problem 4: Box office uses three units of measure
head(movies$Box.Office)
tail(movies$Box.Office)
class(movies$Box.Office)
# create a function to convert box office revenue 
convert_box_office <- function(boxoffice){
  string_box_office <- as.character(boxoffice)
  replaced_box_office <- gsub("[$|k|M]", "", string_box_office)
  numeric_box_office <- as.numeric(replaced_box_office)
  if(grepl("M", boxoffice)){
    numeric_box_office
  }else if (grepl("k", boxoffice)){
    numeric_box_office * 0.001
  }else{
    numeric_box_office * 0.000001
  }
}
#covert box office to single unit of measure (millions)
movies$Box.Office <- sapply(movies$Box.Office, convert_box_office)
#Problem 4 is solved
head(movies$Box.Office)
tail(movies$Box.Office)
class(movies$Box.Office)

#Save data to a csv file
write.csv(movies, "Movies.csv")
