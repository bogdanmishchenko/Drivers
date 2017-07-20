#Example for running simulation ( written  in bash) Bogdan Mishchenko20/07/2017
#  source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-02/init_ilcsoft.sh (load ilcsoftware release )
# source /afs/phas.gla.ac.uk/user/b/bogdanm/public_ppe/lcgeo_24_04_17/lcgeo/bin/thislcgeo.sh  ( load local ddsim from lcgeo (which contains ddsim)  )


PARTICLE=single_b_jets

MOMENTUM=100GeV

runType=batch

compactFile=/afs/phas.gla.ac.uk/user/b/bogdanm/public_ppe/lcgeo_24_04_17/lcgeo/SiD/compact/SiD_o2_v02

MOD=SiD_o2_v02

INFILE_DIR=/data/ilc01/datasets/VertexingStudy/stdhep

SIMFILE_DIR=/data/ilc01/datasets/VertexingStudy/stdhep/simulation_jets/b_jets

skipNEvents=10000

numberOfEvents=10

PART=11


TRACKDIR=/afs/phas.gla.ac.uk/user/b/bogdanm/public_ppe/Tracking_8_17/Tracking/Tracking_all/Tracking

ddsim --runType=${runType} --skipNEvents=${skipNEvents}  --compactFile=${compactFile}/${MOD}.xml --inputFile=${INFILE_DIR}/${PARTICLE}_${MOMENTUM}.stdhep --numberOfEvents=${numberOfEvents} --outputFile=${SIMFILE_DIR}/${MOD}_${PARTICLE}_${MOMENTUM}_${numberOfEvents}_${PART}.slcio






        