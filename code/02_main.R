install.packages("ghql")

library("ghql")
library("jsonlite")
library("dplyr")


token <- "eyJhbGciOiJIUzI1NiJ9.eyJ0aWQiOjkxNjA2ODEyLCJ1aWQiOjE2OTI3MzEzLCJpYWQiOiIyMDIwLTExLTIyVDEzOjM4OjQyLjAwMFoiLCJwZXIiOiJtZTp3cml0ZSIsImFjdGlkIjo3Mzc3MjAyLCJyZ24iOiJ1c2UxIn0.N5CQ_ouDs97chj9MIRqxGnkw_CZehUyK0qhZm5qaGy8"
con <- GraphqlClient$new(
  url = "https://api.monday.com/v2",
  headers = list(Authorization = token) )

con$load_schema()
qry <- Query$new()


qry$query('query', '{
    users (limit:1000) { id created_at email birthday enabled
        is_admin is_guest is_pending is_verified
        photo_thumb title url phone
        account{ name id }}} ')

qry
qry$queries$query

(x <- con$exec(qry$queries$query))

df <- jsonlite::fromJSON(x)$data$users %>% as.data.frame

write.csv(df,"/Users/aronvz/Documents/github/4s-aas-monday/r/data/users_.csv", row.names = FALSE)



qry2 <- Query$new()

qry2$query('query', '{ boards { workspace {
      id  name  kind  description } } }')

(x2 <- con$exec(qry2$queries$query))

df2 <- jsonlite::fromJSON(x2)$data$boards %>% as.data.frame

write.csv(df2,"/Users/aronvz/Documents/github/4s-aas-monday/r/data/workspace_.csv", row.names = FALSE)


