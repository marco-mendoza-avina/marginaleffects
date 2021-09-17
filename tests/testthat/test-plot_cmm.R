

library(tidyverse)
dat <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/ggplot2movies/movies.csv") |>
    mutate(style = case_when(Action == 1 ~ "Action",
                             Comedy == 1 ~ "Comedy",
                             Drama == 1 ~ "Drama",
                             TRUE ~ "Other"),
           style = factor(style),
           certified_fresh = rating >= 8) |>
    filter(length < 240)

mod <- glm(certified_fresh ~ length * style, data = dat, family = binomial)

pkgload::load_all()
out <- marginalmeans(mod, newdata = dat)



get_predict(mod, newdata = k) |> head()

marginalmeans(mod, newdata = k) |> head()

pkgload::load_all()
k = plot_cmm(mod, condition = c("length", "style"), draw = FALSE)
