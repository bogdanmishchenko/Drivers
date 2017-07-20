#Example for running simulation ( written  in bash) Bogdan Mishchenko20/07/2017
#  source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-02/init_ilcsoft.sh (load ilcsoftware release )
# source /afs/phas.gla.ac.uk/user/b/bogdanm/public_ppe/lcgeo_24_04_17/lcgeo/bin/thislcgeo.sh  ( example to load local ddsim from lcgeo (which contains ddsim)  )
# export MARLIN_DLL=$MARLIN_DLL:/afs/phas.gla.ac.uk/user/b/bogdanm/public_ppe/Tracking_8_17/Tracking/Tracking_all/Tracking/lib/libTrackAna.so (load local library for Tracking code)

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

GEAR=gear_sid

RECFILE_DIR=/data/ilc01/datasets/VertexingStudy/stdhep/reconstruction_jets/b_jets


ddsim --runType=${runType} --skipNEvents=${skipNEvents}  --compactFile=${compactFile}/${MOD}.xml --inputFile=${INFILE_DIR}/${PARTICLE}_${MOMENTUM}.stdhep --numberOfEvents=${numberOfEvents} --outputFile=${SIMFILE_DIR}/${MOD}_${PARTICLE}_${MOMENTUM}_${numberOfEvents}_${PART}.slcio


Marlin ${TRACKDIR}/SiDReconstruction_o2_v02_20_06_17.xml \
       --global.GearXMLFile=${TRACKDIR}/${GEAR}.xml \
      --global.LCIOInputFiles=${SIMFILE_DIR}/${MOD}_${PARTICLE}_${MOMENTUM}_${numberOfEvents}_${PART}.slcio \
      --InitDD4hep.DD4hepXMLFile=${compactFile}/${MOD}.xml \
--MyLCIOOutputProcessor.LCIOOutputFile=${RECFILE_DIR}/reco_${MOD}_${PARTICLE}_${MOMENTUM}_${numberOfEvents}_${PART}.slcio \
--global.MaxRecordNumber=${numberOfEvents} \ 
    --global.SkipNEvents=${skipNEvents} 


        