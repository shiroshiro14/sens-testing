
#robot --log login.html --report report-login.html --xunit out0.xml login.robot



#robot --log ./log/$1_$2_log.html --report ./report\ log/$1_$2_report.html ./$1/$1$2.robot
#            $1      $2          $3
#sh run.sh parent daily_report   01 
robot --log ./log/$2_$3.html --report ./report\ log/$2_$3_report.html ./$1\ test/$2/$2$3.robot
