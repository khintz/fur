library(harpIO)
#print(sample(1:3))


vfld_path          <- "/data"
first_forecast     <- 2016043012
last_forecast      <- 2016043018
forecast_models    <- c("carra")
forecast_frequency <- "6h"

forecast_members    <- 0
forecast_lead_times <- seq(0, 3, 1)

forecast_data <- read_eps_interpolate(
  start_date  = first_forecast,
  end_date    = last_forecast,
  eps_model   = forecast_models,
  parameter   = NULL,
  lead_time   = forecast_lead_times,
  members_in  = forecast_members,
  by          = forecast_frequency,
  file_path   = vfld_path,
  return_data = TRUE
)

print(forecast_data)
