setwd("C:/Users/User/Desktop/PNC_Lab/PNC-Conginitive-Data/EXP2/COG/POST/FC")
fileNames <- Sys.glob("C:/Users/User/Desktop/PNC_Lab/PNC-Conginitive-Data/EXP2/COG/POST/FC/INPUT/*")

for(fileName in fileNames){
  the_part_id <- substr(basename(fileName), 1, 5)
  data <- read.csv(file = fileName, header = TRUE,skip = 1)
  sink(paste(paste("OUTPUT/", the_part_id, sep = ""), "Output.txt", sep = ""))
  
  data <- data[(data$Stimulus.RT >= 100 & data$Stimulus.ACC == 1) | data$Stimulus.ACC == 0 | data$Stimulus.RT == 0,]
  
  cat("PartID, ");cat("ExperimentName , ");cat("SessionID, ");
  
  
  ###########################################################################################################
  
  let <- "All"
  cat("FC_Overall_Acc_");cat(let);cat(", ");
  cat("FC_Overall_SDAcc_");cat(let);cat(", ");
  cat("FC_Overall_CVAcc_");cat(let);cat(", ");
  cat("FC_Overall_IE_");cat(let);cat(", ");
  cat("FC_Overall_Omisions_");cat(let);cat(", ");
  cat("FC_Overall_Comissions_");cat(let);cat(", ");
  cat("FC_Cong_Acc_");cat(let);cat(", ");
  cat("FC_Cong_SDAcc_");cat(let);cat(", ");
  cat("FC_Cong_CVAcc_");cat(let);cat(", ");
  cat("FC_Cong_Comissions_");cat(let);cat(", ");
  cat("FC_Cong_Omissions_");cat(let);cat(", ");
  cat("FC_Cong_IE_");cat(let);cat(", ");
  cat("FC_Incong_Acc_");cat(let);cat(", ");
  cat("FC_Incong_SDAcc_");cat(let);cat(", ");
  cat("FC_Incong_CVAcc_");cat(let);cat(", ");
  cat("FC_Incong_Comissions_");cat(let);cat(", ");
  cat("FC_Incong_Omissions_");cat(let);cat(", ");
  cat("FC_Incong_IE_");cat(let);cat(", ");
  cat("FC_Overall_RT_");cat(let);cat(", ");
  cat("FC_Overall_SDRT_");cat(let);cat(", ");
  cat("FC_Overall_CVRT_");cat(let);cat(", ");
  cat("FC_Cong_RT_");cat(let);cat(", ");
  cat("FC_Cong_SDRT_");cat(let);cat(", ");
  cat("FC_Cong_CVRT_");cat(let);cat(", ");
  cat("FC_Incong_RT_");cat(let);cat(", ");
  cat("FC_Incong_SDRT_");cat(let);cat(", ");
  cat("FC_Incong_CVRT_");cat(let);cat(", ");
  cat("FC_InterferenceACC_");cat(let);cat(", ");
  cat("FC_InterferenceRT_");cat(let);cat(", ");
  cat("FC_NumErrRuns_");cat(let);cat(", ");
  cat("FC_AvLenErrRuns_");cat(let);cat(", ");
  cat("FC_PostErrorACC_");cat(let);cat(", ");
  cat("FC_PostErrorRT_");cat(let);cat(", ");
  
  if(length(unique(data$BlockID)) == 1){
    
    letters <- list('A')
  }
  
  if(length(unique(data$BlockID)) == 2){
    
    letters <- list('A', 'B')
  }
  
  if(length(unique(data$BlockID)) == 3){
    
    letters <- list('A', 'B', 'C')
  }
  
  if(length(unique(data$BlockID)) == 4){
    
    letters <- list('A', 'B', 'C', 'D')
  }
  
  
  for(let in letters) {
  cat("FC_Overall_Acc_");cat(let);cat(", ");
  cat("FC_Overall_SDAcc_");cat(let);cat(", ");
  cat("FC_Overall_CVAcc_");cat(let);cat(", ");
  cat("FC_Overall_IE_");cat(let);cat(", ");
  cat("FC_Overall_Omisions_");cat(let);cat(", ");
  cat("FC_Overall_Comissions_");cat(let);cat(", ");
  cat("FC_Cong_Acc_");cat(let);cat(", ");
  cat("FC_Cong_SDAcc_");cat(let);cat(", ");
  cat("FC_Cong_CVAcc_");cat(let);cat(", ");
  cat("FC_Cong_IE_");cat(let);cat(", ");
  cat("FC_Cong_Comissions_");cat(let);cat(", ");
  cat("FC_Cong_Omissions_");cat(let);cat(", ");
  cat("FC_Incong_Acc_");cat(let);cat(", ");
  cat("FC_Incong_SDAcc_");cat(let);cat(", ");
  cat("FC_Incong_CVAcc_");cat(let);cat(", ");
  cat("FC_Incong_IE_");cat(let);cat(", ");
  cat("FC_Incong_Comissions_");cat(let);cat(", ");
  cat("FC_Incong_Omissions_");cat(let);cat(", ");
  cat("FC_Overall_RT_");cat(let);cat(", ");
  cat("FC_Overall_SDRT_");cat(let);cat(", ");
  cat("FC_Overall_CVRT_");cat(let);cat(", ");
  cat("FC_Cong_RT_");cat(let);cat(", ");
  cat("FC_Cong_SDRT_");cat(let);cat(", ");
  cat("FC_Cong_CVRT_");cat(let);cat(", ");
  cat("FC_Incong_RT_");cat(let);cat(", ");
  cat("FC_Incong_SDRT_");cat(let);cat(", ");
  cat("FC_Incong_CVRT_");cat(let);cat(", ");
  cat("FC_InterferenceACC_");cat(let);cat(", ");
  cat("FC_InterferenceRT_");cat(let);cat(", ");
  cat("FC_NumErrRuns_");cat(let);cat(", ");
  cat("FC_AvLenErrRuns_");cat(let);cat(", ");
  cat("FC_PostErrorACC_");cat(let);cat(", ");
  cat("FC_PostErrorRT_");cat(let);
    cat(", ");
  }
  
  cat("\n");
  
  cat(the_part_id); cat(", ");
  cat("Flanker"); cat(", ");
  cat(data$Session[1]); cat(", ");
  
  
  ##################################### OVERALL ###########################################
  
  Overall_Acc <- mean(data$Stimulus.ACC) * 100
  cat(Overall_Acc); cat("%, ");
  
  Overall_SDAcc <- sd(data$Stimulus.ACC)
  cat(Overall_SDAcc); cat(", ");
  
  Overall_CVAcc <- (Overall_SDAcc / Overall_Acc)
  cat(Overall_CVAcc); cat(", ");
  
  RTs <- data$Stimulus.RT[data$Stimulus.RT != 0 & data$Stimulus.ACC == 1]
  Overall_RT <- mean(RTs)
  
  Overall_IE <- Overall_RT/Overall_Acc
  cat(Overall_IE); cat(", ");
  
  OverallComissions <- (sum(data$Stimulus.ACC == 0 & data$Stimulus.RT > 0)/ length(data$Stimulus.ACC)) * 100
  cat(OverallComissions); cat("%"); cat(", ");
  
  OverallOmissions <- (sum(data$Stimulus.ACC == 0 & data$Stimulus.RT == 0)/ length(data$Stimulus.ACC)) * 100
  cat(OverallOmissions); cat("%"); cat(", ");
  
  
  ######################## CONG ########################################################
  
  
  Cong_Acc <- mean(data$Stimulus.ACC[data$TrialType == "Cong"]) * 100
  cat(Cong_Acc); cat("%, ");
  
  Cong_SDAcc <- sd(data$Stimulus.ACC[data$TrialType == "Cong"])
  cat(Cong_SDAcc); cat(", ");
  
  Cong_CVAcc <- (Cong_SDAcc / Cong_Acc)
  cat(Cong_CVAcc); cat(", ");
  
  
  CongCorrect_RT <- data$Stimulus.RT[data$Stimulus.ACC == 1 & data$TrialType == "Cong"]
  Cong_RT <- mean(CongCorrect_RT)
  
  Cong_IE <- Cong_RT/Cong_Acc
  cat(Cong_IE); cat(", ");
  
  Cong_Comissions <- (sum(data$TrialType == "Incon" & data$Stimulus.RT > 0)/length(data$TrialType == "Incon")) * 100
  cat(Cong_Comissions); cat("%"); cat(", ");
  
  Cong_Omissions <- (sum(data$TrialType == "Cong" & data$Stimulus.RT == 0)/length(data$TrialType == "Cong"))  * 100
  cat(Cong_Omissions); cat("%"); cat(", ");
  
  
  ######################## INCON #########################################################
  
  Incong_Acc <- mean(data$Stimulus.ACC[data$TrialType == "Incon"]) * 100
  cat(Incong_Acc); cat("%, ");
  
  Incong_SDAcc <- sd(data$Stimulus.ACC[data$TrialType == "Incon"])
  cat(Incong_SDAcc); cat(", ");
  
  Incong_CVAcc <- (Incong_SDAcc / Incong_Acc)
  cat(Incong_CVAcc); cat(", ");
  
  
  
  IncongCorrect_RT <- data$Stimulus.RT[data$Stimulus.ACC == 1 & data$TrialType == "Incon"]
  Incong_RT <- mean(IncongCorrect_RT)
  
  Incong_IE <- Incong_RT/Incong_Acc
  cat(Incong_IE); cat(", ");
  
  Incong_Comissions <- (sum(data$TrialType == "Incon" & data$Stimulus.RT > 0)/length(data$TrialType == "Cong")) * 100
  cat(Cong_Comissions); cat("%"); cat(", ");
  
  Incong_Omissions <- (sum(data$TrialType == "Incon" & data$Stimulus.RT == 0)/length(data$TrialType == "Incon"))  * 100
  cat(Incong_CVAcc); cat(", ");
  
  
  ################## OvERALL_RT ###########################################################
  
  
  Correct_RT <- data$Stimulus.RT[data$Stimulus.ACC == 1]
  
  if (length(Correct_RT) == 0) {
    Correct_RT <- c(0)
  }
  
  Overall_RT <- mean(Correct_RT)
  cat(Overall_RT); cat(", ");
  
  if (length(Correct_RT) != 1) {
    Overall_SDRT <- sd(Correct_RT)
  } else {Overall_SDRT <- 0}
  cat(Overall_SDRT); cat(", ");
  
  if(Overall_RT != 0 | is.na(Overall_RT)) {
    Overall_CVRT <- (Overall_SDRT / Overall_RT)
  } else {Overall_CVRT <- 0}
  cat(Overall_CVRT); cat(" ,");
  
  ################## CONG_RT ###########################################################
  
  CorrectCong_RT <- data$Stimulus.RT[data$Stimulus.ACC == 1 & data$TrialType == "Cong"]
  
  if (length(CorrectCong_RT) == 0) {
    CorrectCong_RT <- c(0)
  }
  
  Cong_RT <- mean(CorrectCong_RT)
  cat(Cong_RT); cat(", ");
  
  if (length(CorrectCong_RT) != 1) {
    Cong_SDRT <- sd(CorrectCong_RT)
  } else {Cong_SDRT <- 0}
  cat(Cong_SDRT); cat(", ");
  
  if(Cong_RT != 0 | is.na(Cong_RT)) {
    Cong_CVRT <- (Cong_SDRT / Cong_RT)
  } else {Cong_RT <- 0}
  cat(Cong_RT); cat(" ,");
  
  ################## INCONG_RT ###########################################################
  
  CorrectIncong_RT <- data$Stimulus.RT[data$Stimulus.ACC == 1 & data$TrialType == "Incon"]
  
  if (length(CorrectIncong_RT) == 0) {
    CorrectIncong_RT <- c(0)
  }
  
  Incong_RT <- mean(CorrectIncong_RT)
  cat(Incong_RT); cat(", ");
  
  if (length(CorrectIncong_RT) != 1) {
    Incong_SDRT <- sd(CorrectIncong_RT)
  } else {Incong_SDRT <- 0}
  cat(Incong_SDRT); cat(", ");
  
  if(Incong_RT != 0 | is.na(Incong_RT)) {
    Incong_CVRT <- (Incong_SDRT / Incong_RT)
  } else {Incong_CVRT <- 0}
  cat(Incong_CVRT); cat(", ");
  

  FC_InterferenceACC <- Incong_Acc - Cong_Acc
  cat(FC_InterferenceACC); cat(",");
  
  FC_InterferenceRT <- Incong_RT - Cong_RT
  cat(FC_InterferenceRT); cat(",");
  
  Error_runs <- -1
  in_progress = FALSE
  running_count = 0
  i = 1
  for( i in 1:length(data$Stimulus.ACC)){
    if(data$Stimulus.ACC[i] == 0 & in_progress == FALSE){
      running_count = 1
      in_progress = TRUE
    } else if(data$Stimulus.ACC[i] == 0 & in_progress == TRUE) {
      running_count = running_count +1
    } else if (data$Stimulus.ACC[i] == 1 & in_progress == TRUE) {
      if(running_count > 1) {
        Error_runs <- c(Error_runs, running_count)
      }
      running_count <- 0
      in_progress = FALSE
    }
  }
  Error_runs <- Error_runs[-1]
  
  FC_NumErrRuns <- length(Error_runs)
  cat(FC_NumErrRuns); cat(",");
  
  FC_AvLenErrRuns <- mean(Error_runs)
  cat(FC_AvLenErrRuns); cat(",");
  
  post_err_acc <- -1
  post_err_rt <- -1
  last_wrong <- FALSE
  i = 1
  for(i in 1:length(data$Stimulus.ACC)) {
    if((data$Stimulus.ACC[i] == 0 & data$Stimulus.RT[i] > 0) & last_wrong == FALSE) {
      last_wrong <- TRUE
    } else if(data$Stimulus.ACC[i] == 0 & last_wrong == TRUE) {
      post_err_acc <- c(post_err_acc, 0)
    } else if(data$Stimulus.ACC[i] == 1 & last_wrong == TRUE) {
      post_err_acc <- c(post_err_acc, 1)
      post_err_rt <- c(post_err_rt, data$Stimulus.RT)
      last_wrong <- FALSE
    }
  }
  
  post_err_acc <- post_err_acc[-1]
  post_err_acc <- post_err_acc[-1]
  FC_PostErrorACC <- mean(post_err_acc)
  cat(FC_PostErrorACC);cat(", ");
  
  FC_PostErrorRT <- mean(post_err_rt)
  cat(FC_PostErrorRT);cat(", ");

  
  ####______________________Blockwise__________________________________________####
  
  count <- 0;
  blockList <- list('A', 'B', 'C', 'D', 'E','F')
  
  for (block in blockList) {
    data_block <- data[data$BlockID == block,]
    if ( nrow(data_block) != 0 ) {
      
      count <- count + 1;
      
      
      ##################################### OVERALL ###########################################
      
      Overall_Acc <- mean(data_block$Stimulus.ACC) * 100
      cat(Overall_Acc); cat("%, ");
      
      Overall_SDAcc <- sd(data_block$Stimulus.ACC)
      cat(Overall_SDAcc); cat(", ");
      
      Overall_CVAcc <- (Overall_SDAcc / Overall_Acc)
      cat(Overall_CVAcc); cat(", ");
      
      RTs <- data_block$Stimulus.RT[data_block$Stimulus.RT != 0 & data_block$Stimulus.ACC == 1]
      Overall_RT <- mean(RTs)
      
      Overall_IE <- Overall_RT/Overall_Acc
      cat(Overall_IE); cat(", ");
      
      OverallComissions <- (sum(data_block$Stimulus.ACC == 0 & data_block$Stimulus.RT > 0)/ length(data_block$Stimulus.ACC)) * 100
      cat(OverallComissions); cat("%"); cat(", ");
      
      OverallOmissions <- (sum(data_block$Stimulus.ACC == 0 & data_block$Stimulus.RT == 0)/ length(data_block$Stimulus.ACC)) * 100
      cat(OverallOmissions); cat("%"); cat(", ");
      
      
      ######################## CONG ########################################################
      
      
      Cong_Acc <- mean(data_block$Stimulus.ACC[data_block$TrialType == "Cong"]) * 100
      cat(Cong_Acc); cat("%, ");
      
      Cong_SDAcc <- sd(data_block$Stimulus.ACC[data_block$TrialType == "Cong"])
      cat(Cong_SDAcc); cat(", ");
      
      Cong_CVAcc <- (Cong_SDAcc / Cong_Acc)
      cat(Cong_CVAcc); cat(", ");
      
      
      CongCorrect_RT <- data_block$Stimulus.RT[data_block$Stimulus.ACC == 1 & data_block$TrialType == "Cong"]
      Cong_RT <- mean(CongCorrect_RT)
      
      Cong_IE <- Cong_RT/Cong_Acc
      cat(Cong_IE); cat(", ");
      
      Cong_Comissions <- (sum(data_block$TrialType == "Incon" & data_block$Stimulus.RT > 0)/length(data_block$TrialType == "Incon")) * 100
      cat(Cong_Comissions); cat("%"); cat(", ");
      
      Cong_Omissions <- (sum(data_block$TrialType == "Cong" & data_block$Stimulus.RT == 0)/length(data_block$TrialType == "Cong"))  * 100
      cat(Cong_Omissions); cat("%"); cat(", ");
      
      
      ######################## INCON #########################################################
      
      Incong_Acc <- mean(data_block$Stimulus.ACC[data_block$TrialType == "Incon"]) * 100
      cat(Incong_Acc); cat("%, ");
      
      Incong_SDAcc <- sd(data_block$Stimulus.ACC[data_block$TrialType == "Incon"])
      cat(Incong_SDAcc); cat(", ");
      
      Incong_CVAcc <- (Incong_SDAcc / Incong_Acc)
      cat(Incong_CVAcc); cat(", ");
      
      
      
      IncongCorrect_RT <- data_block$Stimulus.RT[data_block$Stimulus.ACC == 1 & data_block$TrialType == "Incon"]
      Incong_RT <- mean(IncongCorrect_RT)
      
      Incong_IE <- Incong_RT/Incong_Acc
      cat(Incong_IE); cat(", ");
      
      Incong_Comissions <- (sum(data_block$TrialType == "Incon" & data_block$Stimulus.RT > 0)/length(data_block$TrialType == "Cong")) * 100
      cat(Cong_Comissions); cat("%"); cat(", ");
      
      Incong_Omissions <- (sum(data_block$TrialType == "Incon" & data_block$Stimulus.RT == 0)/length(data_block$TrialType == "Incon"))  * 100
      cat(Incong_CVAcc); cat(", ");
      
      
      ################## OvERALL_RT ###########################################################
      
      
      Correct_RT <- data_block$Stimulus.RT[data_block$Stimulus.ACC == 1]
      
      if (length(Correct_RT) == 0) {
        Correct_RT <- c(0)
      }
      
      Overall_RT <- mean(Correct_RT)
      cat(Overall_RT); cat(", ");
      
      if (length(Correct_RT) != 1) {
        Overall_SDRT <- sd(Correct_RT)
      } else {Overall_SDRT <- 0}
      cat(Overall_SDRT); cat(", ");
      
      if(Overall_RT != 0 | is.na(Overall_RT)) {
        Overall_CVRT <- (Overall_SDRT / Overall_RT)
      } else {Overall_CVRT <- 0}
      cat(Overall_CVRT); cat(" ,");
      
      ################## CONG_RT ###########################################################
      
      CorrectCong_RT <- data_block$Stimulus.RT[data_block$Stimulus.ACC == 1 & data_block$TrialType == "Cong"]
      
      if (length(CorrectCong_RT) == 0) {
        CorrectCong_RT <- c(0)
      }
      
      Cong_RT <- mean(CorrectCong_RT)
      cat(Cong_RT); cat(", ");
      
      if (length(CorrectCong_RT) != 1) {
        Cong_SDRT <- sd(CorrectCong_RT)
      } else {Cong_SDRT <- 0}
      cat(Cong_SDRT); cat(", ");
      
      if(Cong_RT != 0 | is.na(Cong_RT)) {
        Cong_CVRT <- (Cong_SDRT / Cong_RT)
      } else {Cong_RT <- 0}
      cat(Cong_RT); cat(" ,");
      
      ################## INCONG_RT ###########################################################
      
      CorrectIncong_RT <- data_block$Stimulus.RT[data_block$Stimulus.ACC == 1 & data_block$TrialType == "Incon"]
      
      if (length(CorrectIncong_RT) == 0) {
        CorrectIncong_RT <- c(0)
      }
      
      Incong_RT <- mean(CorrectIncong_RT)
      cat(Incong_RT); cat(", ");
      
      if (length(CorrectIncong_RT) != 1) {
        Incong_SDRT <- sd(CorrectIncong_RT)
      } else {Incong_SDRT <- 0}
      cat(Incong_SDRT); cat(", ");
      
      if(Incong_RT != 0 | is.na(Incong_RT)) {
        Incong_CVRT <- (Incong_SDRT / Incong_RT)
      } else {Incong_CVRT <- 0}
      cat(Incong_CVRT); cat(", ");
      
      
      FC_InterferenceACC <- Incong_Acc - Cong_Acc
      cat(FC_InterferenceACC); cat(",");
      
      FC_InterferenceRT <- Incong_RT - Cong_RT
      cat(FC_InterferenceRT); cat(",");
      
      Error_runs <- -1
      in_progress = FALSE
      running_count = 0
      i = 1
      for( i in 1:length(data_block$Stimulus.ACC)){
        if(data_block$Stimulus.ACC[i] == 0 & in_progress == FALSE){
          running_count = 1
          in_progress = TRUE
        } else if(data_block$Stimulus.ACC[i] == 0 & in_progress == TRUE) {
          running_count = running_count +1
        } else if (data_block$Stimulus.ACC[i] == 1 & in_progress == TRUE) {
          if(running_count > 1) {
            Error_runs <- c(Error_runs, running_count)
          }
          running_count <- 0
          in_progress = FALSE
        }
      }
      Error_runs <- Error_runs[-1]
      
      FC_NumErrRuns <- length(Error_runs)
      cat(FC_NumErrRuns); cat(",");
      
      FC_AvLenErrRuns <- mean(Error_runs)
      cat(FC_AvLenErrRuns); cat(",");
      
      post_err_acc <- -1
      post_err_rt <- -1
      last_wrong <- FALSE
      i = 1
      for(i in 1:length(data_block$Stimulus.ACC)) {
        if((data_block$Stimulus.ACC[i] == 0 & data_block$Stimulus.RT[i] > 0) & last_wrong == FALSE) {
          last_wrong <- TRUE
        } else if(data_block$Stimulus.ACC[i] == 0 & last_wrong == TRUE) {
          post_err_acc <- c(post_err_acc, 0)
        } else if(data_block$Stimulus.ACC[i] == 1 & last_wrong == TRUE) {
          post_err_acc <- c(post_err_acc, 1)
          post_err_rt <- c(post_err_rt, data_block$Stimulus.RT)
          last_wrong <- FALSE
        }
      }
      
      post_err_acc <- post_err_acc[-1]
      post_err_acc <- post_err_acc[-1]
      FC_PostErrorACC <- mean(post_err_acc)
      cat(FC_PostErrorACC);cat(", ");
      
      FC_PostErrorRT <- mean(post_err_rt)
      cat(FC_PostErrorRT);cat(", ");
      
      
    }
    
  }
  
    
  sink()
  closeAllConnections()
}

#################################################################################################################




#For Group



#################################################################################################################
sink("OUTPUT/groupOutput.txt")

count = 0

for(fileName2 in fileNames){
  the_part_id <- substr(basename(fileName2), 1, 5)
  data <- read.csv(file = fileName2, header = TRUE,skip = 1)
  
  data <- data[(data$Stimulus.RT >= 100 & data$Stimulus.ACC == 1) | data$Stimulus.ACC == 0 | data$Stimulus.RT == 0,]
  
  if (count == 0){ 
    cat("PartID, ");cat("ExperimentName , ");cat("SessionID, ");
    
    
    ###########################################################################################################
    
    cat("FC_Overall_Acc");cat(", ");
    cat("FC_Overall_SDAcc");cat(", ");
    cat("FC_Overall_CVAcc");cat(", ");
    cat("FC_Overall_IE");cat(", ");
    cat("FC_Overall_Omisions");cat(", ");
    cat("FC_Overall_Comissions");cat(", ");
    cat("FC_Cong_Acc");cat(", ");
    cat("FC_Cong_SDAcc");cat(", ");
    cat("FC_Cong_CVAcc");cat(", ");
    cat("FC_Cong_IE");cat(", ");
    cat("FC_Cong_Comissions");cat(", ");
    cat("FC_Cong_Omissions");cat(", ");
    cat("FC_Incong_Acc");cat(", ");
    cat("FC_Incong_SDAcc");cat(", ");
    cat("FC_Incong_CVAcc");cat(", ");
    cat("FC_Incong_IE");cat(", ");
    cat("FC_Incong_Comissions");cat(", ");
    cat("FC_Incong_Omissions");cat(", ");
    cat("FC_Overall_RT");cat(", ");
    cat("FC_Overall_SDRT");cat(", ");
    cat("FC_Overall_CVRT");cat(", ");
    cat("FC_Cong_RT");cat(", ");
    cat("FC_Cong_SDRT");cat(", ");
    cat("FC_Cong_CVRT");cat(", ");
    cat("FC_Incong_RT");cat(", ");
    cat("FC_Incong_SDRT");cat(", ");
    cat("FC_Incong_CVRT");cat(", ");
    cat("FC_InterferenceACC");cat(", ");
    cat("FC_InterferenceRT");cat(", ");
    cat("FC_NumErrRuns");cat(", ");
    cat("FC_AvLenErrRuns");cat(", ");
    cat("FC_PostErrorACC");cat(", ");
    cat("FC_PostErrorRT");cat(", ");
    
    cat("\n");
    count = 1
  }
  
  cat(the_part_id); cat(", ");
  cat("Flanker"); cat(", ");
  cat(data$Session[1]); cat(", ");
  
  
  ##################################### OVERALL ###########################################
  
  Overall_Acc <- mean(data$Stimulus.ACC) * 100
  cat(Overall_Acc); cat("%, ");
  
  Overall_SDAcc <- sd(data$Stimulus.ACC)
  cat(Overall_SDAcc); cat(", ");
  
  Overall_CVAcc <- (Overall_SDAcc / Overall_Acc)
  cat(Overall_CVAcc); cat(", ");
  
  RTs <- data$Stimulus.RT[data$Stimulus.RT != 0 & data$Stimulus.ACC == 1]
  Overall_RT <- mean(RTs)
  
  Overall_IE <- Overall_RT/Overall_Acc
  cat(Overall_IE); cat(", ");
  
  OverallComissions <- (sum(data$Stimulus.ACC == 0 & data$Stimulus.RT > 0)/ length(data$Stimulus.ACC)) * 100
  cat(OverallComissions); cat("%"); cat(", ");
  
  OverallOmissions <- (sum(data$Stimulus.ACC == 0 & data$Stimulus.RT == 0)/ length(data$Stimulus.ACC)) * 100
  cat(OverallOmissions); cat("%"); cat(", ");
  
  
  ######################## CONG ########################################################
  
  
  Cong_Acc <- mean(data$Stimulus.ACC[data$TrialType == "Cong"]) * 100
  cat(Cong_Acc); cat("%, ");
  
  Cong_SDAcc <- sd(data$Stimulus.ACC[data$TrialType == "Cong"])
  cat(Cong_SDAcc); cat(", ");
  
  Cong_CVAcc <- (Cong_SDAcc / Cong_Acc)
  cat(Cong_CVAcc); cat(", ");
  
  
  CongCorrect_RT <- data$Stimulus.RT[data$Stimulus.ACC == 1 & data$TrialType == "Cong"]
  Cong_RT <- mean(CongCorrect_RT)
  
  Cong_IE <- Cong_RT/Cong_Acc
  cat(Cong_IE); cat(", ");
  
  Cong_Comissions <- (sum(data$TrialType == "Incon" & data$Stimulus.RT > 0)/length(data$TrialType == "Incon")) * 100
  cat(Cong_Comissions); cat("%"); cat(", ");
  
  Cong_Omissions <- (sum(data$TrialType == "Cong" & data$Stimulus.RT == 0)/length(data$TrialType == "Cong"))  * 100
  cat(Cong_Omissions); cat("%"); cat(", ");
  
  
  ######################## INCON #########################################################
  
  Incong_Acc <- mean(data$Stimulus.ACC[data$TrialType == "Incon"]) * 100
  cat(Incong_Acc); cat("%, ");
  
  Incong_SDAcc <- sd(data$Stimulus.ACC[data$TrialType == "Incon"])
  cat(Incong_SDAcc); cat(", ");
  
  Incong_CVAcc <- (Incong_SDAcc / Incong_Acc)
  cat(Incong_CVAcc); cat(", ");
  
  
  
  IncongCorrect_RT <- data$Stimulus.RT[data$Stimulus.ACC == 1 & data$TrialType == "Incon"]
  Incong_RT <- mean(IncongCorrect_RT)
  
  Incong_IE <- Incong_RT/Incong_Acc
  cat(Incong_IE); cat(", ");
  
  Incong_Comissions <- (sum(data$TrialType == "Incon" & data$Stimulus.RT > 0)/length(data$TrialType == "Cong")) * 100
  cat(Cong_Comissions); cat("%"); cat(", ");
  
  Incong_Omissions <- (sum(data$TrialType == "Incon" & data$Stimulus.RT == 0)/length(data$TrialType == "Incon"))  * 100
  cat(Incong_CVAcc); cat(", ");
  
  
  ################## OvERALL_RT ###########################################################
  
  
  Correct_RT <- data$Stimulus.RT[data$Stimulus.ACC == 1]
  
  if (length(Correct_RT) == 0) {
    Correct_RT <- c(0)
  }
  
  Overall_RT <- mean(Correct_RT)
  cat(Overall_RT); cat(", ");
  
  if (length(Correct_RT) != 1) {
    Overall_SDRT <- sd(Correct_RT)
  } else {Overall_SDRT <- 0}
  cat(Overall_SDRT); cat(", ");
  
  if(Overall_RT != 0 | is.na(Overall_RT)) {
    Overall_CVRT <- (Overall_SDRT / Overall_RT)
  } else {Overall_CVRT <- 0}
  cat(Overall_CVRT); cat(" ,");
  
  ################## CONG_RT ###########################################################
  
  CorrectCong_RT <- data$Stimulus.RT[data$Stimulus.ACC == 1 & data$TrialType == "Cong"]
  
  if (length(CorrectCong_RT) == 0) {
    CorrectCong_RT <- c(0)
  }
  
  Cong_RT <- mean(CorrectCong_RT)
  cat(Cong_RT); cat(", ");
  
  if (length(CorrectCong_RT) != 1) {
    Cong_SDRT <- sd(CorrectCong_RT)
  } else {Cong_SDRT <- 0}
  cat(Cong_SDRT); cat(", ");
  
  if(Cong_RT != 0 | is.na(Cong_RT)) {
    Cong_CVRT <- (Cong_SDRT / Cong_RT)
  } else {Cong_RT <- 0}
  cat(Cong_RT); cat(" ,");
  
  ################## INCONG_RT ###########################################################
  
  CorrectIncong_RT <- data$Stimulus.RT[data$Stimulus.ACC == 1 & data$TrialType == "Incon"]
  
  if (length(CorrectIncong_RT) == 0) {
    CorrectIncong_RT <- c(0)
  }
  
  Incong_RT <- mean(CorrectIncong_RT)
  cat(Incong_RT); cat(", ");
  
  if (length(CorrectIncong_RT) != 1) {
    Incong_SDRT <- sd(CorrectIncong_RT)
  } else {Incong_SDRT <- 0}
  cat(Incong_SDRT); cat(", ");
  
  if(Incong_RT != 0 | is.na(Incong_RT)) {
    Incong_CVRT <- (Incong_SDRT / Incong_RT)
  } else {Incong_CVRT <- 0}
  cat(Incong_CVRT); cat(", ");
  
  
  FC_InterferenceACC <- Incong_Acc - Cong_Acc
  cat(FC_InterferenceACC); cat(",");
  
  FC_InterferenceRT <- Incong_RT - Cong_RT
  cat(FC_InterferenceRT); cat(", ");
  
  Error_runs <- -1
  in_progress = FALSE
  running_count = 0
  i = 1
  for( i in 1:length(data$Stimulus.ACC)){
    if(data$Stimulus.ACC[i] == 0 & in_progress == FALSE){
      running_count = 1
      in_progress = TRUE
    } else if(data$Stimulus.ACC[i] == 0 & in_progress == TRUE) {
      running_count = running_count +1
    } else if (data$Stimulus.ACC[i] == 1 & in_progress == TRUE) {
      if(running_count > 1) {
        Error_runs <- c(Error_runs, running_count)
      }
      running_count <- 0
      in_progress = FALSE
    }
  }
  Error_runs <- Error_runs[-1]
  
  FC_NumErrRuns <- length(Error_runs)
  cat(FC_NumErrRuns); cat(",");
  
  FC_AvLenErrRuns <- mean(Error_runs)
  cat(FC_AvLenErrRuns); cat(", ");
  
  
  post_err_acc <- -1
  post_err_rt <- -1
  last_wrong <- FALSE
  i = 1
  for(i in 1:length(data$Stimulus.ACC)) {
    if((data$Stimulus.ACC[i] == 0 & data$Stimulus.RT[i] > 0) & last_wrong == FALSE) {
      last_wrong <- TRUE
    } else if(data$Stimulus.ACC[i] == 0 & last_wrong == TRUE) {
      post_err_acc <- c(post_err_acc, 0)
    } else if(data$Stimulus.ACC[i] == 1 & last_wrong == TRUE) {
      post_err_acc <- c(post_err_acc, 1)
      post_err_rt <- c(post_err_rt, data$Stimulus.RT)
      last_wrong <- FALSE
    }
  }
  
  post_err_acc <- post_err_acc[-1]
  post_err_acc <- post_err_acc[-1]
  FC_PostErrorACC <- mean(post_err_acc)
  cat(FC_PostErrorACC);cat(", ");
  
  FC_PostErrorRT <- mean(post_err_rt)
  cat(FC_PostErrorRT);cat("\n");
  
}

sink()
closeAllConnections()
