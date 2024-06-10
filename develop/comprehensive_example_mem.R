#############################################################################
## Using DAL Events integrated with Nexus and Harbinger
#############################################################################
# install.packages("devtools")
library(devtools)

# Install and load Harbinger, Nexus and DalEvents -----------------------------
#devtools::install_github("cefet-rj-dal/daltoolbox", force=TRUE, dependencies=FALSE, upgrade="never", build_vignettes = TRUE)
#devtools::install_github("cefet-rj-dal/harbinger", force=TRUE, dependencies=FALSE, upgrade="never", build_vignettes = TRUE)
#devtools::install_github("cefet-rj-dal/event_datasets", force = TRUE, dep=FALSE, upgrade="never")

# Load packages
library(daltoolbox)
library(harbinger)
source("https://raw.githubusercontent.com/cefet-rj-dal/harbingerext/main/develop/nexus.R")
library(dalevents)

#Create and setup objects
bt_size <- c(1,3,9,27,81,243)
wm_size <- c(1,3,9,27,81,243)

##====
#Establishing method
#FBIAD
model_fbiad <- hanr_fbiad()

##======================================================================
#running experiment in Yahoo A1 series
data(yahoo_a1)

result_81_fbiad_yh_a1 <- list()
i = 1
#Repeat method for all series in A1 group
for (i in 1:length(yahoo_a1)){
  data <- yahoo_a1[[i]]
  result_81_fbiad_yh_a1[[i]] <- run_nexus(model=model_fbiad, data=data, warm_size=wm_size[5], batch_size=bt_size[5], mem_batches=3)
}

names(result_81_fbiad_yh_a1) <- names(yahoo_a1)
save(result_81_fbiad_yh_a1, file="develop/result_81_fbiad_yh_a1_mem3_complete.RData", compress = TRUE)

#View results
View(result_81_fbiad_yh_a1) #Complete
View(result_81_fbiad_yh_a1$real_1) #One series
View(result_81_fbiad_yh_a1$real_1$prob) #Event frequency analysis

#Evaluating the detections
evaluation <- evaluate(result_81_fbiad_yh_a1$real_1$detector,
                       result_81_fbiad_yh_a1$real_1$detection$event,
                       yahoo_a1$real_1$event)

print(evaluation$confMatrix)

# plotting the results
grf <- har_plot(result_81_fbiad_yh_a1$real_1$detector,
                yahoo_a1$real_1$series,
                result_81_fbiad_yh_a1$real_1$detection,
                yahoo_a1$real_1$event)
plot(grf)


#Execution time analysis
#Accumulated
plot(result_81_fbiad_yh_a1[[1]]$time,
     xlab = "Batch",
     ylab = "Exec. Time (s)",
     type = "l",
     main = paste("Accumulated Execution Time - Series: Yahoo A1 -", names(yahoo_a1[1])))

#Time per Batch
time_per_batch <- diff(result_81_fbiad_yh_a1[[1]]$time)
plot(time_per_batch,
     xlab = "Batch",
     ylab = "Exec. Time (s)",
     type = "l",
     main = paste("Execution Time per Batch - Series: Yahoo A1 -", names(yahoo_a1[1])))
lines(x = 1:length(time_per_batch), y = rep(mean(time_per_batch), length(time_per_batch)),
      lty = 2,
      lwd = 1,
      col="red")
legend(x = "topleft",
       legend = "Average time per batch",
       lty = 2, lwd = 1,
       bty = "n",
       col="red")




#Filter by limit
plim = 0.5
prob <- result_81_fbiad_yh_a1$real_1$prob
prob_lim <- subset(prob, pe > plim)

det_prob <- result_81_fbiad_yh_a1$real_1$detection
det_prob$event <- 0
det_prob$event[which(det_prob$idx %in% prob_lim$idx)] <- 1

#Sum of events
sum(result_81_fbiad_yh_a1$real_1$detection$event, na.rm = TRUE)
sum(det_prob$event)


#Evaluate limit query detection
print(evaluate(result_81_fbiad_yh_a1$real_1$detector,
               det_prob$event,
               yahoo_a1$real_1$event)$confMatrix)

# plotting limit query detection
grf_lim <- har_plot(result_81_fbiad_yh_a1$real_1$detector,
                    yahoo_a1$real_1$series,
                    det_prob,
                    yahoo_a1$real_1$event)
plot(grf_lim)
