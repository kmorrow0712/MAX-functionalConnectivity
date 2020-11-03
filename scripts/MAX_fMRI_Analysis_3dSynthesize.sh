#!/bin/csh
#SBATCH -t 30:30:30
#SBATCH -n 4
#SBATCH --array=101,102,103,104,105,106,107,108,109,110
#SBATCH --mem=MaxMemPerNode
#SBATCH -o MAX%a_fMRI_Analysis_3dSynthesize.out

#usage: sbatch MAX_fMRI_Analysis_3dSynthesize

set subj = `printf "%03d" $SLURM_ARRAY_TASK_ID`
echo $subj


# Script to run individual GLM analysis using AFNI's 3dDeconvovle
#  - note: takes a few minutes per subject

#  Parameters:
set proj_path = /data/bswift-1/Pessoa_Lab/MAX
set output = /data/bswift-1/kmorrow/03-gPPI_testing/output/
 
		echo "$subj"

		cd $proj_path/dataset/first_level/MAX"$subj"/block_MR


		if (1 == 0) then
		endif
		
		#rm -f MAX"$subj"_TR_Main_block_baselineModel.nii.gz
		#MAX"$subj"_EP_Main_TR_MNI_2mm_NoBaseline.nii.gz
		#rm -f MAX"$subj"_TR_Main_block_baselineModel.nii.gz
		#MAX"$subj"_EP_Main_TR_MNI_2mm_NoBaseline.nii.gz

# The 3dSynthesize helps in extracting the baseline (which includes the drifts modeled by "-polort", and motion and their derivatives modeled by "-ortvec"]) 
# from the individually analyzed data (UPN_"$subj"_TR_MNI_2mm_SI_MR2_betas.nii.gz). This baseline is then subtracted from the final preprocessed func data (using 3dcalc) 
# which was used as input during first the level analysis, i.e., UPN_"$subj"_EP2_TR_MNI_2mm_SI.nii.gz, and a func data with no baseline is created. 
 
#3dSynthesize -cbucket ./"UPN_"$subj"_TR_MNI_2mm_SI_MR_AROMA_betas.nii.gz" \
#-matrix ./"UPN_"$subj"_TR_MNI_2mm_SI_MR_AROMA.x1D" \
#-select baseline \
#-prefix UPN_"$subj"_TR_MNI_2mm_SI_MR_AROMA_baselineModel.nii.gz		


3dSynthesize -cbucket ./"MAX"$subj"_Main_block_MR_REML_beta_shockcensored_I.nii.gz" \
-matrix ./"MAX"$subj"_Main_block_MR_uncensored_I.x1D" \
-select baseline \
-overwrite \
-prefix "$output"/MAX"$subj"_EP_Main_TR_MNI_2mm_I_denoised_baselineModel.nii.gz
		

3dcalc -a $proj_path"/dataset/preproc/MAX"$subj"/func2/ICA_AROMA/MAX"$subj"_EP_Main_TR_MNI_2mm_SI_denoised.nii.gz" \
-b ./"MAX"$subj"_EP_Main_TR_MNI_2mm_I_denoised_baselineModel.nii.gz" \
-prefix "$output"/MAX"$subj"_EP_Main_TR_MNI_2mm_I_denoised_NoBaseline.nii.gz \
-expr 'a-b' \
-overwrite
		

# Averaging no baseline model time series from Linear Trend and ClustSim clusters. 
# Now that we have the no-baseline data for each subject, the following 3dROIstats command is used to extract time-course from an ROI specified by a mask created during viewing the 
# group level analyses output. In this case the mask is for the region that showed activity for the LinearTrean2 contrast which was modeled in the first level analysis.

3dROIstats -quiet -overwrite -mask /data/bswift-1/kmorrow/02-ROI_masks/SUIT_cerebellum_2mm/SUIT_l-CrusII_YeoNetwork6_intersect_gm_2mm.nii.gz $output"MAX"$subj"_EP_Main_TR_MNI_2mm_I_denoised_NoBaseline.nii.gz" > \
$output"MAX"$subj"_l-CrusII_seed_NoBaseline_avg.1D"

		# Averaging no baseline model time series from Quadratic Trend and ClustSim clusters 
		
		#Like for LinearTrean2 contrast, we will extract time-course for the QuadTread2 contrast in the same fashion. 
		#3dROIstats -quiet -mask $proj_path/dataset/Group/QuadTrend2_MR2_P.001_10vox_mask+tlrc. ./"UPN_"$subj"_EP2_TR_MNI_2mm_SI_NoBaseline.nii.gz" > \
		#$proj_path/dataset/Group/QuadTrend2_ROI/"UPN_"$subj"_QuadTrend2_MR2_p.001_TR_MNI_2mm_SI_NoBaseline_avg.1D"



		#END COMMENT-OUT LOOP

		# Averaging no baseline model time series from Positive Linear Trend and PUvsNP FDR conjunction clusters 
		#Like for LinearTrean2 and QuadTread2 contrasts, we will extract time-course for the PosLinearTrend2_PUvsNP_FDR contrast in the same fashion. 		
		#3dROIstats -quiet -mask $proj_path/dataset/Group/PosLinearTrend2_PUvsNP_FDR.05_conj_5vox_mask+tlrc. ./"UPN_"$subj"_EP2_TR_MNI_2mm_SI_NoBaseline.nii.gz" > \
		#$proj_path/dataset/Group/LinearTrend2_conj_ROI/"UPN_"$subj"_PosLinearTrend2_PUvsNP_FDR.05_conjmap_TR_MNI_2mm_SI_NoBaseline_avg.1D"

		





		
			




