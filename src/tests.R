
#test that there are no duplicate sub_categories for the same site and year 

test_that("duplicate_subcategorires", { 
  expect_false(nrow(MPS_tracker_data |>
                                group_by(site, year, sub_category) |> 
                                summarize(sum(score), n=  n()) |>
                                filter(n>1L)) >1)
})

#make sure there are no incorrect sub_categories

test_that("correct_categories", { expect_true(
  all(MPS_tracker_data$category %in% c("Surveillance and Enforcement", "Community and Conservation Benefits", "Policies and Consequences", "Consistent Funding", "Community Engagement", "Training and Mentorship"))) })

#make sure there are no incorrect indicator types
test_that("correct_categories", { expect_true(
  all(MPS_tracker_data$indicator_type %in% c("Process Indicators", "Impact Indicators"))) 
  })

#test that score is numeric
test_that("numeric_score", {expect_true(is.numeric(MPS_tracker_data$score))
  })

#make sure category is in 1-5
test_that("1_5", { expect_true(
  all(MPS_tracker_data$score %in% c("1", "2", "3", "4", "5", NA))) })

#make sure there there are no Nas in year
test_that("NA_year", { expect_false(
  all(is.na(MPS_tracker_data$year))) })

#make sure there there are no Nas in site
test_that("NA_year", { 
  expect_false(
  all(is.na(MPS_tracker_data$site))) })

#make sure there there are no Nas in country
test_that("NA_year", {
  expect_false(
  all(is.na(MPS_tracker_data$country))) 
  })

#check that all of the files made it into the data
test_that("file_number", {
  expect_true(length(file_list) == nrow(MPS_tracker_data |>
                                       group_by(year, site) |> 
                                         summarize(n()))) })


