#test that 2019 files are the correct length 
if (unique(final_data$year) == 2019) {
  
  test_that("file_number", {
    expect_true(nrow(final_data) == 31)
  }) }


#test that 2020 files are the correct length
if (unique(final_data$year) == 2020) {

  test_that("file_number", {
    expect_true(nrow(final_data) == 31 | nrow(final_data) == 26 | nrow(final_data) == 5)
  }) }


#test that 2021 files are the correct length 
if (unique(final_data$year) == 2021) {
  
  test_that("file_number", {
    expect_true(nrow(final_data) == 27)
  }) }

#test that 2022 files are the correct length
if (unique(final_data$year) == 2022) {
  
  test_that("file_number", {
    expect_true(nrow(final_data) == 27)
}) }

