if test $# -ne 1 
then 
	echo "usage: ./run [initial|correct]"
	exit -1
fi

if test $1 = "initial" ; then
	ROOT="mars_pathfinder.init"
elif test $1 = "correct" ; then
	ROOT="mars_pathfinder.correct"
else
	echo "usage: ./run [initial|correct]"
	exit -1
fi 

ocarina -aadlv2 -g cheddar -r $ROOT ./models/case_study/mars_pathfinder.aadl ./models/case_study/pathfinder_hardware.aadl ./models/case_study/Plugin_Resources/Cheddar_Properties.aadl ./models/case_study/pathfinder_software.aadl ./models/case_study/Plugin_Resources/deployment.aadl -o ./ocarina_out/ 
