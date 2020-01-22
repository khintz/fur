#Example verification for testing the harp installation
library(harp)
#library(here)
#Test paths used in ecgate
#vfld_path       <- "/scratch/ms/dk/nhz/oprint/"
#vobs_path       <- "/scratch/ms/dk/nhz/oprint/OBS4"
#vfld_sql_path        <- "/scratch/ms/dk/nhd/ec9_sql/FCTABLE"
#vobs_sql_path        <- "/scratch/ms/dk/nhd/ec9_sql/OBSTABLE"

#local paths (Change accordingly)
vfld_path       <- "/home/cap/data/from_ecmwf/codes/scripts_verif/contrib_verif/data"
vobs_path       <- "/home/cap/data/from_ecmwf/codes/scripts_verif/contrib_verif/data/OBS"
vfld_sql_path        <- "/home/cap/data/tmp/FCTABLE"
vobs_sql_path        <- "/home/cap/data/tmp/OBSTABLE"

first_fcst <- 2019060100
last_fcst <-  2019060200
fcst_models <- c("EC9")
param        <- "T2m"

#1.Read the original data and convert to sql format
fcst_data <- read_det_interpolate(
  start_date    = first_fcst,
  end_date      = last_fcst,
  det_model     = fcst_models,
  parameter     = param,
  lead_time     = seq(0, 66, 3),
  by            = "6h",
  file_path     = vfld_path,
  file_template = "{det_model}/vfld{det_model}{YYYY}{MM}{DD}{HH}{LDT2}", # ...because it's in the template
  file_format   = "vfld",
  sqlite_path = "/scratch/ms/dk/nhd/ec9_sql/FCTABLE",
  return_data   = TRUE
)


read_obs_convert(
  start_date  = first_fcst,
  end_date    = last_fcst,
  obs_path    = vobs_path,
  sqlite_path = vobs_sql_path
  )


# 2. Read sql data 
fcst <- read_point_forecast(
  start_date = first_fcst,
  end_date   = last_fcst,
  fcst_model = fcst_models,
  fcst_type  = "det",
  parameter  = param,
  by         = "6h",
  file_path  = vfld_sql_path
)

obs <- read_point_obs(
    start_date = first_validdate(fcst),
    end_date   = last_validdate(fcst),
    parameter  = param,
    obs_path   = vobs_sql_path
                         )


#3. Verify and plot
fcst_obs <- fcst %>%
    join_to_fcst(obs)

verif <- det_verify(
        fcst_obs,
        T2m,
        thresholds    = quantile(obs$T2m, c(0.25, 0.5, 0.75, 0.9, 0.95)),
              show_progress = FALSE
        )
plot_point_verif(verif, bias)

