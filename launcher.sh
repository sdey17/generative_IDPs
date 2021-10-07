#! /bin/bash


i=0

dimensions=(13)
batchsize=(40)
reps=(1)

for dim in "${dimensions[@]}"
do

	for btc in "${batchsize[@]}"
	do
	
		for r in "${reps[@]}"
		do

			i=$[i+1]
			echo "test..."

			#define filename
                        fout="test_"$i"_"$dim"_"$btc"_"$n"_"$r

                        # prepare input script
			echo "net $n" > input
			echo "dimensions $dim" >> input
			echo "batch_size $btc" >> input
			echo "out_label polyq" >> input
			echo "trajectory /home/aayush/Documents/Degiacomi/input_data/polyq/all.pdb" >> input
			echo "test_size 75000" >> input
			echo "epochs 100" >> input
			echo "out_folder test/$fout" >> input
			echo "decoder_file test/$fout/decoder.h5" >> input
			echo "encoder_file test/$fout/encoder.h5" >> input

			echo $fout
			
                        ./space_sampler.py input > log
                        mv log test/$fout

		done
	done
done

rm log
rm input
