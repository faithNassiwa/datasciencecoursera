# My First R Programming
myString <- 'Hello World'
print(myString)
products <- 'apples'
assign('products', 'banana')
print(products)

# Math calculation
results <- (2+4-1)*10
results
assign("result2", (2+4-1)*10)
result2
results == result2

calculation <- result <- (2+4-1)*10
calculation == result

abs(-4)
factorial(4)

# Logical operators 
1 == 1
2 > 5 
2 > 5 & 5 > 1
2 > 5 | 5 > 1
result != 55

# Data Types
# Character
products <- 'apple'
products
numbers <- "1"
typeof(numbers)

# Numeric default numeric are doubles .. if you need integer, you need to define it explicitly by adding L after the number
quantity <- 2
price <- 2.3
typeof(quantity)
quantity_integer <- 2L
typeof(quantity_integer)
is.numeric(quantity_integer)

# Logical
discount <- FALSE
discounts <- F
discount == discounts

# Complex -- not commonly used 
2 + 6i

# Raw -- not commonly used
raw(2)

# Code Style
# 1. Meaningful variable names 
# 2. Preferable to use only lower case letters - its case sensitive
# 3. Special Character are a don't when creating variable name 
# 5. Avoid function names in variables
# 6. Use Indentations, blank lines, separate out opening and closing function {} 

# Same data types: - Vectors, Factors, Arrays and Matrices
# Different data types: - Lists and Data Frames ( however for a df, each column has one data type)
# 1 - dimensional - Lists and Vectors
# 2 - dimensional - Matrices and Data Frames
# N- dimensional - Arrays

# Creating Vectors ( Characters, Numeric(Double, Integer), Logical, Complex, Raw )
# See already above, one variable assigned to one data type 
c <- 1:5 
print(c)

# Sequence Generation 
d <- seq(1, 5, by=1.5)
print(d)

# Replicating Elements 
e <- rep(2:4, times =2)
print(e)

# Scan Function, enter values from the console, enter twice to exist entry
f <- scan()

# Vector Attributes 
# length(a) - Length- number of elements 
# names(a) - Name - each element is easier recognized
# typeof(a) - Type - data type of its elements 

# Character vector 
assign('product', c('apple', 'cookie', 'lemon', 'pizza'))
product
is.vector(product)
typeof(product)
length(product)
nchar(product)

# Double vector 
price <- c(1.3, 2, 0.5, 9)
price
length(price)
str(price)

#names 
price2 <- c('apples'=1.3, 'cookie'=2, 'lemon'=0.5, 'pizza'=9)
price2

names(price) <- product
price
str(price)

#scan function
quantity <- scan()

# sort, order and rank 
sort(price, decreasing = TRUE)
sort(price) # default returns items in ascending order

price
order(price) # returns order of item index from smallest to biggest 

max(price)
which.max(price)

rank(price) # ranks prices from least expensive 

# selecting elements
product[2] # start counting from index 1 not 0 hence cookie returned, the second product in the vector 
product[-2] # without the second element/item
product[c(3:4)]
price['lemon']


# arithmetic operations
price <- c(1.3, 2, 0.5, 9)
full_price <- price
quantity <- c(2, 6, 4, 4)
discount_value <- c(0, 0.15, 0, 0.25)
total_basket_value <- (full_price - (full_price * discount_value)) * quantity
total_basket_value

# logical operations
price_store_A <- full_price - (full_price * discount_value)
price_store_A
price_store_B <- c(1.3, 1.5, 0.75, 7)
price_store_B
price_store_A == price_store_B

# implicit coercion
full_price
typeof(full_price)
full_price <- c('1.3', 2, 0.5, '9')
typeof(full_price)

discount_value
typeof(discount_value)
discount_value <- c(FALSE, 0.15, 0, 0.25)
typeof(discount_value)
discount_value

# explicit coercion
full_price
as.numeric(full_price)
quantity <- c(2, "six", "four", 4)
as.numeric(quantity)
as.character(quantity)
as.integer(full_price)

# creating sets
A <- 1:20
B <- 8:34
#union - all elements in A and B
union(A, B)
#intersection - all elements common in A and B
intersect(A,B)
#setdiff - only in first mentioned set 
setdiff(A,B) # elements only in set A 
setdiff(B,A) # elements only in set B
all(c(setdiff(A,B), intersect(A,B), setdiff(B,A)) == union(A,B))
#equal - check if sets have the same elements 
setequal(A,B) 
#camparison - check if set have matching elements 
A %in% B 

# creating factors 
product <- c("apple", "laptop", "cookie", "lemon", "phone")
category <- c("groceries", "electronics", "groceries", "groceries", "electronics")
factor_category <- factor(category)
factor_category
#structure 
str(factor_category)
#changing the default order of levels 
factor_category <- factor(category, levels = c("groceries", "electronics") )
str(factor_category)
#ordering the levels 
mass_scale <- factor(c('ml', 'gr', 'kg', 'gm'), ordered = TRUE)
mass_scale

# creating matrices
quantity_store_A <- c(7, 5, 3, 6, 9, 4)
quantity_store_B <- c(2, 5, 6, 4, 8, 3)
cbind(quantity_store_A, quantity_store_B)
is.matrix(cbind(quantity_store_A, quantity_store_B))
store_quantity <- rbind(quantity_store_A, quantity_store_B)
store_quantity
quantity_store_C <- c(4, 5, 2, 1, 8, 3) 
store_quantity <- rbind(store_quantity, quantity_store_C) # appending another matrix
store_quantity
# creating a matrix using the matrix function 
matrix_quantity <- matrix(1:18, nrow =3, byrow = TRUE)
matrix_quantity
#matrices attribute 
length(store_quantity)
typeof(store_quantity)
nrow(store_quantity)
ncol(store_quantity)
dim(store_quantity)
col_names <- c('apples', 'cookies', 'lemons', 'pizza', 'banana', 'orange')
colnames(store_quantity) <- col_names
rownames(store_quantity)
#calculations on rows and columns
rowSums(store_quantity)
colSums(store_quantity)
#selecting elements
store_quantity[1,2]
store_quantity[1,]
store_quantity[,-2]
#matrix operations
store_quantity
store_quantity +2 
store_quantity * matrix_quantity # both matrices must have the same dimensions
t(matrix_quantity)
store_quantity %*% t(matrix_quantity)
store_quantity == matrix_quantity
#identity matrix 
diag(4)

# creating arrays 
store_quantity
quantity_day_1 = store_quantity
quantity_day_2 = store_quantity * 2
shopping_data <- array(c(quantity_day_1, quantity_day_2), dim = c(3,6,2))
shopping_data
# array attributes 
length(shopping_data)
typeof(shopping_data)
dim(shopping_data)
# selecting elements
shopping_data[,,1]
shopping_data[-2,1,2]

# creating lists 
quantity <- list(store_A = quantity_store_A, all_stores = store_quantity)
quantity
#selecting elements
basket_details <- list(store='Store A', products = c('apples', 'cookies'), prices = c(2.3, 2))
basket_details
basket_details[[1]]
basket_details[['products']]
basket_details$products
basket_details[[3]][2]

# creating data frames 
product <- c('apple', 'cookie', 'phone', 'lemon', 'laptop', 'pizza', 'apple', 'cookie', 'phone', 'lemon', 'laptop', 'pizza')
category <- c('groceries', 'groceries', 'electronics', 'groceries', 'electronics', 'groceries', 'groceries', 'groceries', 'electronics', 'groceries', 'electronics', 'groceries')
price <- c(1.3, 2, 500, 0.5, 1000, 9.1, 3, 2, 650, 0.5, 950, 9)
quantity <- c(4, 6, 1, 3, 1, 9, 4, 6, 1, 3, 1, 9)
discount <- c(FALSE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE)
discount_value <- c(0, 0.25, 0.10, 0.15, 0, 0, 0, 0.25, 0, 0.15, 0, 0)
shopping_data <- data.frame(product, category, price, quantity, discount, discount_value, 
                            budget = c(200, 150, 3000, 240, 3000, 170, 350, 320, 740, 160, 290, 440))
View(shopping_data)
#changing the vector names 
dataset <- data.frame(x=product, category, price, quantity, discount, discount_value, budget = c(200, 150, 3000, 240, 3000, 170, 350, 320, 740, 160, 290, 440))
View(dataset)
# data frame attributes
names(shopping_data)
dim(shopping_data)
head(shopping_data) # prints first six rows of the df 
tail(shopping_data) # prints last six rows of the df
head(shopping_data, n=2) # only display first 2 rows
tail(shopping_data, n=3) # only display last 3 rows
str(shopping_data)
typeof(shopping_data)
class(shopping_data)
summary(shopping_data)
#manipulating data frames
#matrix subsetting for selecting elements in a data frame 
shopping_data[c(1:3), 1] # get 1-3 rows, first column only(product)
shopping_data[,3] # get only third column
shopping_data[1, 3] # get the price of the first product
# the difference in outputs 
shopping_data[,1]
shopping_data[[1]] # selecting data frame elements by list subsetting 
shopping_data[1]
is.vector(shopping_data[,1])
is.vector(shopping_data[[1]])
is.data.frame(shopping_data[1])
#adding a new column using list format
shopping_data$store <- c('A', 'B', 'B', 'B', 'A', 'B', 'A', 'B', 'B', 'A', 'A', 'A')
shopping_data
#adding a new column using matrix format
price_discounted <- price - (price * discount_value)
shopping_data <- cbind(shopping_data, price_discounted)
shopping_data
#adding a new row -- need to first create a new data frame row
new_product <- data.frame(product='cake', category='groceries', price=10, quantity=1, discount=FALSE, discount_value=0, budget=500, store='A', price_discounted=10)
shopping_data <- rbind(shopping_data, new_product)
shopping_data

# working with tidyverse
library(tidyverse)
shopping_data
products <- shopping_data %>% 
  select(product, category, price, quantity, discount_value, budget, store) %>%
  filter(budget >= 200) %>%
  arrange(desc(price)) %>%
  mutate(price_discounted = price - (price * discount_value)) %>%
  group_by(category, store) %>%
  summarise(sum(quantity))
products
