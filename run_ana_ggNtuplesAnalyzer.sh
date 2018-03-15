#!/bin/bash

rm -rf outputFiles
mkdir outputFiles

time root -b -q -l "run_Ana.C+(\"filesLists/filesFromEOS/job_MuEG_Run2016B_FebReminiAOD.txt\", 1, \"Run2016B\")" 

############################################################
# Data - 35.86/fb - 2016 Data 
time root -b -q -l "run_Ana.C+(\"filesLists/filesFromEOS/job_MuEG_Run2016B_FebReminiAOD.txt\", 10, \"Run2016B\")"  &
time root -b -q -l "run_Ana.C+(\"filesLists/filesFromEOS/job_MuEG_Run2016C_FebReminiAOD.txt\", 10, \"Run2016C\")"   &
time root -b -q -l "run_Ana.C+(\"filesLists/filesFromEOS/job_MuEG_Run2016D_FebReminiAOD.txt\", 10, \"Run2016D\")"   &
time root -b -q -l "run_Ana.C+(\"filesLists/filesFromEOS/job_MuEG_Run2016E_FebReminiAOD.txt\", 10, \"Run2016E\")"   &
time root -b -q -l "run_Ana.C+(\"filesLists/filesFromEOS/job_MuEG_Run2016F_FebReminiAOD1.txt\", 10, \"Run2016F1\")"   &
time root -b -q -l "run_Ana.C+(\"filesLists/filesFromEOS/job_MuEG_Run2016F_FebReminiAOD2.txt\", 10, \"Run2016F2\")"   &
time root -b -q -l "run_Ana.C+(\"filesLists/filesFromEOS/job_MuEG_Run2016G_SepRereco.txt\", 10, \"Run2016G\")"   &
time root -b -q -l "run_Ana.C+(\"filesLists/filesFromEOS/job_MuEG_Run2016H_PRv2.txt\", 10, \"Run2016H2\")"   &
time root -b -q -l "run_Ana.C+(\"filesLists/filesFromEOS/job_MuEG_Run2016H_PRv3.txt\", 10, \"Run2016H3\")"   &

############################################################
## MC
# time root -b -q -l "run_Ana.C+(\"filesLists/filesFromEOS/ZToJPsiGamma_RunIISummer16MiniAODv2.txt\", -1, \"Run2016B\")"  &

wait

ls -lha outputFiles

hadd -f outputFiles/histos_ggNtuplesAnalyzer.root outputFiles/*.root

rm run_Ana_C.d run_Ana_C.so run_Ana_C_ACLiC_dict_rdict.pcm

echo "Done!"