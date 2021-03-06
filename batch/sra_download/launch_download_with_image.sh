#!/bin/bash

if [ $# -lt 4 ]; then
  echo "Usage: $0 <GDS_IDS_FILE> <NUM_PARTITIONS> <REDIS_PORT> <S3_BUCKET>"
  exit 1
fi


DOC_IDS=`cat $1`
NUM_PA=$2
REDIS_PORT=$3
S3_BUCKET=$4

p=0
while [ $p -lt $NUM_PA ]
do
  echo aegea batch submit --execute sra_download.py --storage /mnt=500 --ecr-image sra_download --environment GDS_IDS=$DOC_IDS NUM_PARTITIONS=$NUM_PA PARTITION_ID=$p RDB_S3_PATH=s3://czi-hca/config/dump.rdb.gz REDIS_PORT=$REDIS_PORT S3_BUCKET=$S3_BUCKET --memory 12000
  echo sleep 120
  p=$(( $p + 1))
done
