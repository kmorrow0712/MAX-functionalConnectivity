#!/bin/csh -x
#SBATCH -t 30:30:30
#SBATCH -n 1
#SBATCH --array=101,102,103,104,106
#SBATCH --mem=MaxMemPerNode
#SBATCH -o MAX%a_Create_gPPI_regressors.out

tap -q afni-new


# In this script original UPN regressors used to create interaction regressors for gPPI analysis.
# the rationale to perform this step comes from a paper by Gitelman et al. (2003). 
# The gPPI interactions we are interested in looking at happen at the neuronal level and not at the "BOLD" level. 
# Hence, modeling PPI at BOLD level is erroneous and can lead to false interpretation of PPI. 

# Therefore in order to correctly model PPI, firstly, psychological states (i.e., the tasks/conditions) and physiological response (seed region time-course) need to be
# transformed from the BOLD space to the neuronal space. This is done as follows:
# 1) up-sample the seed region time-course (i.e, move the seed time-course to higher temporal resolution).
# 2) De-convolve the up-sampled seed time-course with the HRF (this transforms the up-sampled seed time-course, which is in BOLD space, to neuronal space)
# 		Let the transformed seed time-course be called neuronal seed time-course 
# 3) Now, create a vector with all zeros, of a length that matches the length of each fMRI run, and the resolution of the neuronal seed time-course
# 4) Then, using the trial onset times from the regressor files as the reference, and the duration of each trial, impute the zeros to ones in the zero vector created in the previous step.
#		This vector with zeros and ones is the model for psychological states (task/condition).
# 5) Then, perform element by element multiplication of the neuronal seed time-course and psychological model. This models the interaction which is then convolved to HRF to create the interaction regressor
# 6) Finally, down sample the interaction regressor back to the original fMRI TR resolution

echo $SLURM_ARRAY_TASK_ID

# set i_subj = $SLURM_ARRAY_TASK_ID
set i_subj = `printf "%03d" $SLURM_ARRAY_TASK_ID`

echo Processing Subject: MAX$i_subj

#  Creating shortcut names to important destination  
set proj_path = /data/bswift-1/Pessoa_Lab/MAX
set out_dir = /data/bswift-1/kmorrow/03-gPPI_testing
# set template_dir = /data/bswift-1/spadmala/Masks

# Designating number of runs for every subject
if ( "$i_subj" == 007 || "$i_subj" == 010 || "$i_subj" == 019 ) then

set nruns = 5 #number of runs

else

set nruns = 6 #number of runs

endif

# Creating final_run_counter. 
@ final_run_counter = ( $nruns - 1 )

#BEGIN COMMENT-OUT LOOP

# set seed_names = ( Precuneus vmPFC rightStriatum leftStriatum )

# Defining an array with seed region(s) name(s)
set seed_names = ( l-CrusII )
# Defining the number of seed regions
@ no_Of_seeds = $#seed_names

# set regressors = ( NN PP UU NP_PN NU_UN PU_UP )

# Defining an array with names of regressors of interest
set regressors = ( FNT FNS FPT FPS )
# Defining the total number of regressors of interest
@ no_Of_regressors = $#regressors

# 
set noOfVol_perRun = 340
set Orig_TR = 1.25
set sub_TR = 0.05
set UpSampRate = 25 #`expr Orig_TR / sub_TR`
@ noOfVol_perRun_upsample = ( $noOfVol_perRun * $UpSampRate )

#rm -rf $proj_path/dataset/regressors/MAX"$i_subj"/gPPI
#mkdir $proj_path/dataset/regressors/MAX"$i_subj"/gPPI


cd $out_dir/dataset/regressors/MAX"$i_subj"/gPPI


	
	###Step 4a in Gang's PPI material -- obtain files with 1's and 0's of regressor timing files at 0.1 sec resolution ###


	if ( 1 == 0 ) then
	endif

	if ( "$i_subj" == 007 || "$i_subj" == 010 || "$i_subj" == 019 ) then

		
		foreach regressor_index ( `seq 1 1 $no_Of_regressors` )
		# In this for loop, each psychological model is being up-sampled to a resolution of which the original TR is a multiple (original TR 2.2 is a multiple of up-sampling resolution 0.1). 
		timing_tool.py -timing $proj_path/stim_times/"$regressors[$regressor_index]".txt -timing_to_1D /data/bswift-1/kmorrow/03-gPPI_testing/dataset/regressors/MAX"$i_subj"/gPPI/"$regressors[$regressor_index]"_upsample.txt \
                         -tr 0.1 -stim_dur 2.0 -min_frac 0.3            \
                         -run_len 321.2 321.2 321.2 321.2 321.2

		end

	else

		foreach regressor_index ( `seq 1 1 $no_Of_regressors` )
		# In this for loop, each psychological model is being up-sampled to a resolution of which the original TR is a multiple (original TR 2.2 is a multiple of up-sampling resolution 0.1). 
		timing_tool.py -timing $proj_path/stim_times/"$regressors[$regressor_index]".txt -timing_to_1D /data/bswift-1/kmorrow/03-gPPI_testing/dataset/regressors/MAX"$i_subj"/gPPI/"$regressors[$regressor_index]"_upsample.txt \
                         -tr 0.05 -stim_dur 16.25 -min_frac 0.3            \
                         -run_len 425 425 425 425 425 425 

		end

	endif

	#END COMMENT-OUT LOOP


	
	foreach seed_index ( `seq 1 1 $no_Of_seeds` )


		rm -f "$seed_names[$seed_index]"_Seed*


		#foreach run_index ( 0 1 2 3 4 5 )

		foreach run_index ( `seq 0 1 $final_run_counter` )

	
			set start_index1 = `expr $run_index \* $noOfVol_perRun`
			set end_index1 = `expr $run_index \* $noOfVol_perRun  +  $noOfVol_perRun - 1`

			echo $start_index1
			echo $end_index1

			set start_index2 = `expr $start_index1 \* $UpSampRate`
			set end_index2 = `expr $end_index1 \* $UpSampRate + $UpSampRate - 1`

			echo $start_index2
			echo $end_index2



			if ( "$seed_index" == 1 ) then ## vmPFC seed from Valence coding

				###Getting seed region data per run ###
				# Index 4 in the UPN_"$subj"_LinearTrend2_MR_P.00001_25vox_NoBaseline_avg.1D file is the vmPFC region
				1dcat /data/bswift-1/kmorrow/03-gPPI_testing/output/"MAX"$i_subj"_l-CrusII_seed_NoBaseline_avg.1D'{$start_index1..$end_index1}[0]'" > "$seed_names[$seed_index]"_Seed_perRun.1D

			else

			endif

###Step 2a in Gang's PPI material  -- Upsampling the seed data to 0.1 sec ###

			1dUpsample "$UpSampRate" "$seed_names[$seed_index]"_Seed_perRun.1D > "$seed_names[$seed_index]"_Seed_perRun_upsample.1D

			###Step 3 in Gang's PPI material -- Deconvolution of seed timeseries data ###

			3dTfitter -RHS "$seed_names[$seed_index]"_Seed_perRun_upsample.1D -FALTUNG /data/bswift-1/kmorrow/03-gPPI_testing/GammaHR_TR05.1D "$seed_names[$seed_index]"_Seed_Neur_perRun_upsample.1D 012 -2
			
			1dtranspose "$seed_names[$seed_index]"_Seed_Neur_perRun_upsample.1D > "$seed_names[$seed_index]"_Seed_Neur_perRun_upsampleT.1D

##de-meaning the neuronal seed timeseries

			1d_tool.py -infile "$seed_names[$seed_index]"_Seed_Neur_perRun_upsampleT.1D -demean -write  "$seed_names[$seed_index]"_Seed_Neur_perRun_upsampleT_demean.1D  

		
			#foreach regressor_index ( 1 2 3 4 5 6 )

			foreach regressor_index ( `seq 1 1 $no_Of_regressors` )


				if ( "$run_index" == 0 ) then

				
					touch "$seed_names[$seed_index]"_Seed_"$regressors[$regressor_index]"_Conv_allRuns.1D
					touch "$seed_names[$seed_index]"_Seed_Conv_allRuns.1D


				endif


				###Step 4 in Gang's PPI material -- creating interaction regressor per run for each regressor  ###


				#1deval -a "$seed_names[$seed_index]"_Seed_Neur_perRun_upsampleT.1D -b $proj_path/data/Regressors/UPN_"$i_subj"/gPPI/""$regressors[$regressor_index]"_upsample.txt'{$start_index2..$end_index2}'" \
				#-expr 'a*b' > "$seed_names[$seed_index]"_Seed_"$regressors[$regressor_index]"_Neur_perRun_upsampleT.1D

			
				1dcat $out_dir/dataset/regressors/MAX"$i_subj"/gPPI/""$regressors[$regressor_index]"_upsample.txt'{$start_index2..$end_index2}'" > tmp.1D


				1d_tool.py -infile tmp.1D -demean -write tmp_demean.1D


				1deval -a "$seed_names[$seed_index]"_Seed_Neur_perRun_upsampleT_demean.1D -b tmp_demean.1D \
				-expr 'a*b' > "$seed_names[$seed_index]"_Seed_"$regressors[$regressor_index]"_Neur_perRun_upsampleT.1D

				
				rm -f tmp.1D tmp_demean.1D
			


				### Convolving the PPI term with canonical hrf ###

				waver -GAM -peak 1 -TR $sub_TR -input "$seed_names[$seed_index]"_Seed_"$regressors[$regressor_index]"_Neur_perRun_upsampleT.1D -numout $noOfVol_perRun_upsample >  "$seed_names[$seed_index]"_Seed_"$regressors[$regressor_index]"_Conv_perRun_upsampleT.1D

							
				### Downsampling to original TR ###

				1dcat "$seed_names[$seed_index]"_Seed_"$regressors[$regressor_index]"_Conv_perRun_upsampleT.1D'{0..$(25)}' >> "$seed_names[$seed_index]"_Seed_"$regressors[$regressor_index]"_Conv_allRuns.1D
​
				
​
​
				rm -f "$seed_names[$seed_index]"_Seed_"$regressors[$regressor_index]"_Neur_perRun_upsampleT.1D "$seed_names[$seed_index]"_Seed_"$regressors[$regressor_index]"_Conv_perRun_upsampleT.1D


			end	#regressor loop
​
			
​
	
			###Just for checking something ###
​
​
			### Convolving the neuronal seed timeseries with canonical hrf ###
​
			waver -GAM -peak 1 -TR $sub_TR -input "$seed_names[$seed_index]"_Seed_Neur_perRun_upsampleT.1D \
			-numout $noOfVol_perRun_upsample >  "$seed_names[$seed_index]"_Seed_Conv_perRun_upsampleT.1D
​
			1dcat "$seed_names[$seed_index]"_Seed_Conv_perRun_upsampleT.1D'{0..$(22)}' >> "$seed_names[$seed_index]"_Seed_Conv_allRuns.1D
​
			
			rm -f "$seed_names[$seed_index]"_Seed*upsample* 
			rm -f *_Seed_perRun.1D 
​
​
​
​
		end	#run loop
​
​
	end	#seed loop

	


