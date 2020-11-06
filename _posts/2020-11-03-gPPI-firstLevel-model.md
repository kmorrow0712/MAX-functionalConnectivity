# gPPI basic first level model
| Regressor                   | File name                                  | Label                  | Description                                                                |
|-----------------------------|--------------------------------------------|------------------------|----------------------------------------------------------------------------|
| left CrusII seed timeseries | MAX"$subj"_l-CrusII_seed_NoBaseline_avg.1D | seed                   | Extracted seed time series that was used to created gPPI interaction terms |
| FNS*seed                    | l-CrusII_Seed_FNS_Conv_allRuns.1D          | falseNeuSafe-seed      | Interaction between False Neutral Safe blocks and seed time series         |
| FNS                         | FNS.txt                                    | falseNeuSafe           | False (no shock) Neutral Safe block                                        |
| FNT*seed                    | l-CrusII_Seed_FNS_Conv_allRuns.1D          | falseNeuThreat-seed    | Interaction between False Neutral Threat blocks and seed time series       |
| FNT                         | FNT.txt                                    | falseNeuThreat         | False (no shock) Neutral Threat block                                      |
| FPS*seed                    | l-CrusII_Seed_FPS_Conv_allRuns.1D          | falsePosSafe-seed      | Interaction between False Positive Safe blocks and seed time series        |
| FNT                         | FNT.txt                                    | falseNeuThreat         | False (no shock)Threat Safe block                                          |
| FPT*seed                    | l-CrusII_Seed_FPT_Conv_allRuns.1D          | falsePosThreat         | Interaction between False Positive Threat blocks and seed time series      |
| FPT                         | FPT.txt                                    | falsePosThreat         | False (no shock) Positive Safe block                                       |
| RNS                         | RNS.txt                                    | realNeuSafe            | Real (touch) Neutral Safe block                                            |
| RNT                         | RNT.txt                                    | realNeuThreat          | Real (shock) Neutral Threat block                                          |
| RPS                         | RPS.txt                                    | realPosSafe            | Real (touch) Positive Safe block                                           |
| RPT                         | RPT.txt                                    | realPosThreat          | Real (shock) Positive Threat block                                         |
| r_FNS                       | rate_FNS.txt                               | respond-falseNeuSafe   | Anxiety rating post FNS block                                              |
| r_FNT                       | rate_FNT.txt                               | respond-falseNeuThreat | Anxiety rating post FNT block                                              |
| r_FPS                       | rate_FPS.txt                               | respond-falsePosSafe   | Anxiety rating post FPS block                                              |
| r_FPT                       | rate_FPT.txt                               | respond-falsePosThreat | Anxiety rating post FPT block                                              |
| r_RNS                       | rate_RNS.txt                               | respond-realNeuSafe    | Anxiety rating post RNS block                                              |
| r_RNT                       | rate_RNT.txt                               | respond-realNeuThreat  | Anxiety rating post RNT block                                              |
| r_RPS                       | rate_RPS.txt                               | respond-realPosSafe    | Anxiety rating post RPS block                                              |
| r_RPT                       | rate_RPT.txt                               | respond-realPosThreat  | Anxiety rating post RPT block                                              |





 | Regressor                      | File name                                       | Label | Description                                                                |
 | :----------------------------- | :---------------------------------------------- | :---- | ---------------------------------------------------------------------------- |
 | left CrusII seed timeseries    |    `MAX"$subj"_l-CrusII_seed_NoBaseline_avg.1D` | seed  | Extracted seed time series that was used to created gPPI interaction terms  |
 | Paragraph   | Text        |


## Regressor table
| Regressor | File name | Label | Description |
| --------------------------- | --- | --- | --- |
| left CrusII seed timeseries | `MAX"$subj"_l-CrusII_seed_NoBaseline_avg.1D` | seed | Extracted seed time series that was used to created gPPI interaction terms  |
| FNS*seed  | `l-CrusII_Seed_FNS_Conv_allRuns.1D` | falseNeuSafe-seed | Interaction between False Neutral Safe blocks and seed time series |
| FNS  | `FNS.txt` | falseNeuSafe  | False (no shock) Neutral Safe block |
| FNT*seed | `l-CrusII_Seed_FNS_Conv_allRuns.1D`  | falseNeuThreat-seed | Interaction between False Neutral Threat blocks and seed time series |
| FNT  | `FNT.txt` | falseNeuThreat  | False (no shock) Neutral Threat block |
| FPS*seed  | `l-CrusII_Seed_FPS_Conv_allRuns.1D` | falsePosSafe-seed | Interaction between False Positive Safe blocks and seed time series |
| FNT  | `FNT.txt` | falseNeuThreat  | False (no shock)Threat Safe block |
| FPT*seed  | `l-CrusII_Seed_FPT_Conv_allRuns.1D` | falsePosThreat | Interaction between False Positive Threat blocks and seed time series |
| FPT  | `FPT.txt` | falsePosThreat  | False (no shock) Positive Safe block |
| RNS  | `RNS.txt` | realNeuSafe  | Real (touch) Neutral Safe block |
| RNT  | `RNT.txt` | realNeuThreat  | Real (shock) Neutral Threat block |
| RPS  | `RPS.txt` | realPosSafe  | Real (touch) Positive Safe block |
| RPT  | `RPT.txt` | realPosThreat  | Real (shock) Positive Threat block |
| r_FNS  | `rate_FNS.txt` | respond-falseNeuSafe  | Anxiety rating post FNS block |
| r_FNT  | `rate_FNT.txt` | respond-falseNeuThreat  | Anxiety rating post FNT block |
| r_FPS  | `rate_FPS.txt` | respond-falsePosSafe  | Anxiety rating post FPS block |
| r_FPT  | `rate_FPT.txt` | respond-falsePosThreat  | Anxiety rating post FPT block |
| r_RNS  | `rate_RNS.txt` | respond-realNeuSafe  | Anxiety rating post RNS block |
| r_RNT  | `rate_RNT.txt` | respond-realNeuThreat  | Anxiety rating post RNT block |
| r_RPS  | `rate_RPS.txt` | respond-realPosSafe  | Anxiety rating post RPS block |
| r_RPT  | `rate_RPT.txt` | respond-realPosThreat  | Anxiety rating post RPT block |

## Visualizing the model
An example from one subject


<img src="/assets/images/MAX_basicModel_gPPI.png" width="600" height="600" />

<img src="/assets/images/MAX_basicModel_motionParams.png" width="600" height="600" />

## Contrasts
Comparing gPPI interaction regressors from different block types to see how relationship between seed region and all other voxels compares by block type.

`False Neutral Threat` -`False Neutral Safe` <br>
  _Threat versus Safe conditions for Neutral mood runs_

`False Positive Threat` -`False Positive Safe`  <br>
  _Threat versus Safe conditions for Positive mood runs_

`False Neutral Threat` `False Positive Threat` - `False Neutral Safe` - `False Positive Safe` <br>
_Overall Threat versus Safe_



## Script
Shell script that performs first level analysis using `3dDeconvolve` <br>
Can also be found under `/scripts` directory


    #!/bin/csh
    #SBATCH -t 30:30:30
    #SBATCH -n 1
    #SBATCH --array=101,102,103,104,106
    #SBATCH --mem=MaxMemPerNode
    #SBATCH -J MAX_gPPI_firstLevel
    #SBATCH -o .slurm/MAX_fMRI_Analysis_block_MR_gPPI_%a.out

    #set subj = $1
    set subj = 2`printf "%02d" $SLURM_ARRAY_TASK_ID`

    echo Analyzing Subject: MAX$subj


    # Script to run individual GLM analysis using AFNI's 3dDeconvovle
    #  - note: takes a few minutes per subject

    set proj_path = /data/bswift-1/Pessoa_Lab/MAX
    set gPPI_path = /data/bswift-1/kmorrow/03-gPPI_testing
    set bad_runs = (`cat runs_to_exclude_Main.txt | grep MAX${subj} | awk '{ print $2 }'`)
    set num_bad_runs = $#bad_runs


    echo "MAX"$subj" has "$num_bad_runs". Therefore..."
    @ nruns = 6 - "$num_bad_runs"
    @ nvolume = 336

    if ("$nruns" < 6) then
      set input = $proj_path/dataset/preproc/MAX"$subj"/func2/ICA_AROMA/MAX"$subj"_EP_Main_TR_MNI_2mm_I_denoised_reducedRuns.nii.gz
      set stim_path = $proj_path/stim_times/MAX"$subj"

      set fileCensMotion = $proj_path/dataset/preproc/MAX"$subj"/func2/MAX"$subj"_MotionCensor_1.0_Main_reducedRuns.txt # if only "high" motion volumes are to be censored
      set fileRawMotion = $proj_path/dataset/preproc/MAX"$subj"/func2/MAX"$subj"_MotionPar_Main_reducedRuns.txt
      set fileDerMotion = $proj_path/dataset/preproc/MAX"$subj"/func2/MAX"$subj"_MotionParDeriv_Main_reducedRuns.txt
    else
      set input = $proj_path/dataset/preproc/MAX"$subj"/func2/ICA_AROMA/MAX"$subj"_EP_Main_TR_MNI_2mm_I_denoised.nii.gz
      set stim_path = $proj_path/stim_times

      set fileCensMotion = $proj_path/dataset/preproc/MAX"$subj"/func2/MAX"$subj"_MotionCensor_1.0_Main.txt # if only "high" motion volumes are to be censored
      set fileRawMotion = $proj_path/dataset/preproc/MAX"$subj"/func2/MAX"$subj"_MotionPar_Main.txt
      set fileDerMotion = $proj_path/dataset/preproc/MAX"$subj"/func2/MAX"$subj"_MotionParDeriv_Main.txt
    endif

    echo "MAX"$subj" has "$nruns" runs, so input func data is as follows:"
    echo "$input"
    echo ""
    echo "And, stim times path is as follows: "
    echo "$stim_path"

    echo ""
    echo "Creating censor file that censors high motion and shock-contaminated volumes"
    set fileShock16s = $stim_path/Censorfile.1D # if only shock-contaminated volumes are to be censored
    set fileCensMotionAndShock = $proj_path/dataset/preproc/MAX"$subj"/func2/MAX"$subj"_MotionAndShockCensor_1.0.txt #if both "high" motion and shock-contaminated volumes are to be censored
    rm -f "$fileCensMotionAndShock"
    1deval -overwrite -a "$fileShock16s" -b "$fileCensMotion" -expr 'a*b' > $fileCensMotionAndShock

    set out = $gPPI_path/dataset/first_level/MAX"$subj"/gPPI
    mkdir -p "$out"
    echo "The output path is "$out""

    cd $proj_path/dataset/preproc/MAX"$subj"/func2

    echo '\n' "Creating $proj_path/dataset/preproc/MAX"$subj"/func2/runConcatInfo.1D"
    set concatList = ""
    set i = 0
    set idx = 0

    while ( $i < $nruns )
      @ idx = $i * $nvolume
      set concatList = "$concatList"" ""$idx"
      @ i += 1
    end

    rm -f $proj_path/dataset/preproc/MAX"$subj"/func2/runConcatInfo.1D
    echo $concatList > $proj_path/dataset/preproc/MAX"$subj"/func2/runConcatInfo.1D
    echo "concat file: "$concatList""

    echo '\n' "Subject MAX"$subj" ... running multiple regression using 3dDeconvolve:"

    3dDeconvolve -x1D_stop -overwrite -input "$input" \
        -mask /data/bswift-1/Pessoa_Lab/share/templates/MNI152_T1_2mm_brain_GM_02182017.nii.gz \
        -polort A \
        -local_times \
        -concat $proj_path/dataset/preproc/MAX"$subj"/func2/runConcatInfo.1D \
        -noFDR \
        -num_stimts 21 \
        -censor "$fileCensMotionAndShock" \
        -stim_times 1 "$stim_path"/FNS.txt 'BLOCK(16.25,1)' -stim_label 1 FNS \
        -stim_times 2 "$stim_path"/FNT.txt 'BLOCK(16.25,1)' -stim_label 2 FNT \
        -stim_times 3 "$stim_path"/FPS.txt 'BLOCK(16.25,1)' -stim_label 3 FPS \
        -stim_times 4 "$stim_path"/FPT.txt 'BLOCK(16.25,1)' -stim_label 4 FPT \
        -stim_times 5 "$stim_path"/RNS.txt 'BLOCK(16.25,1)' -stim_label 5 RNS \
        -stim_times 6 "$stim_path"/RNT.txt 'BLOCK(16.25,1)' -stim_label 6 RNT \
        -stim_times 7 "$stim_path"/RPS.txt 'BLOCK(16.25,1)' -stim_label 7 RPS \
        -stim_times 8 "$stim_path"/RPT.txt 'BLOCK(16.25,1)' -stim_label 8 RPT \
        -stim_times 9 "$stim_path"/rate_FNS.txt 'BLOCK(2,1)' -stim_label 9 r_FNS \
        -stim_times 10 "$stim_path"/rate_FNT.txt 'BLOCK(2,1)' -stim_label 10 r_FNT \
        -stim_times 11 "$stim_path"/rate_FPS.txt 'BLOCK(2,1)' -stim_label 11 r_FPS \
        -stim_times 12 "$stim_path"/rate_FPT.txt 'BLOCK(2,1)' -stim_label 12 r_FPT \
        -stim_times 13 "$stim_path"/rate_RNS.txt 'BLOCK(2,1)' -stim_label 13 r_RNS \
        -stim_times 14 "$stim_path"/rate_RNT.txt 'BLOCK(2,1)' -stim_label 14 r_RNT \
        -stim_times 15 "$stim_path"/rate_RPS.txt 'BLOCK(2,1)' -stim_label 15 r_RPS \
        -stim_times 16 "$stim_path"/rate_RPT.txt 'BLOCK(2,1)' -stim_label 16 r_RPT \
        -stim_times 17 "$gPPI_path"/output/MAX"$subj"_l-CrusII_seed_NoBaseline_avg.1D -stim_label 17 l-CrusII_seed \
        -stim_times 18 "$gPPI_path"/dataset/regressors/MAX"$subj"/gPPI/l-CrusII_Seed_FNS_Conv_allRuns.1D -stim_label 18 gPPI_FNS \
        -stim_times 19 "$gPPI_path"dataset/regressors/MAX"$subj"/gPPI/l-CrusII_Seed_FNT_Conv_allRuns.1D -stim_label 19 gPPI_FNT \
        -stim_times 20 "$gPPI_path"dataset/regressors/MAX"$subj"/gPPI/l-CrusII_Seed_FPS_Conv_allRuns.1D -stim_label 20 gPPI_FPS \
        -stime_times 21 "$gPPI_path"dataset/regressors/MAX"$subj"/gPPI/l-CrusII_Seed_FPT_Conv_allRuns.1D -stim_label 21 gPPI_FPT \
        -ortvec "$fileRawMotion"'[1..6]' 'MotionParam' \
        -ortvec "$fileDerMotion"'[0..5]' 'MotionParamDerv' \
        -cbucket ./"MAX"$subj"_Main_block_MR_I_l-CrusII_gPPI.nii.gz" \
        -xsave \
        -num_glt 3 \
        -gltsym "SYM: gPPI_FNT -gPPI_FNS" 1 -glt_label 7 gPPI_FNTvsFNS \
        -gltsym "SYM: gPPI_FPT -gPPI_FPS" 2 -glt_label 8 gPPI_FPTvsFPS \
        -gltsym "SYM: gPPI_FNT gPPI_FPT -gPPI_FNS -gPPI_FPS" 3 gPPI_threat_vs_Safe \
        -x1D "$out"/"MAX"$subj"_Main_block_MR_I.x1D" \
        -x1D_uncensored "$out"/"MAX"$subj"_Main_block_MR_uncensored_I_l-CrusII_gPPI.x1D"
