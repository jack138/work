#!/bin/sh

# 读取起止日期
startDay=$1
endDay=$2
tmpDay=$startDay

echo $startDay
echo $endDay

while [[ $tmpDay < $endDay  ]]
do
    echo $tmpDay 
    /usr/local/jdk1.8.0_131/bin/java -jar /usr/local/jar/dataConvert-0.0.1-SNAPSHOT.jar $tmpDay
    tmpDay=`date -d "+1 day $tmpDay" +%Y-%m-%d`
done
   
