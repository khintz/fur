library(harpIO)
library(harp)

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
print("Forecast data")

#Using some deterministic data below.
print(forecast_data)
vobs_sql_path      <- "/data/OBSTABLE"
vfld_sql_path      <- "/data/FCTABLE"
first_fcst <- 2016060100
last_fcst <-  2016060200
fcst_models <- c("carra")
param        <- "T2m"


print("Reading fcst data from sql files")
 fcst <- read_point_forecast(
   start_date = first_fcst,
   end_date   = last_fcst,
   fcst_model = fcst_models,
   fcst_type  = "det",
   parameter  = "T2m",
   by         = "6h",
   file_path  = vfld_sql_path
 )
print("Reading obs data from sql files")
obs <- read_point_obs(
    start_date = first_validdate(fcst),
    end_date   = last_validdate(fcst),
    parameter  = "T2m",
    obs_path   = vobs_sql_path
       )

#combine fcst/obs
 fcst_obs <- fcst %>%
     join_to_fcst(obs)

#verify
 verif <- det_verify(
         fcst_obs,
         T2m,
         thresholds    = quantile(obs$T2m, c(0.25, 0.5, 0.75, 0.9, 0.95)),
         show_progress = FALSE
         )

#Finally plot: DO NOT USE YET! Otherwise it might create a local root-owned pdf file
# plot_point_verif(verif, bias)

