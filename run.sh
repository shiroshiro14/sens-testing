find . -name "*.html" -type f -delete
find . -name "*.xml"  -type f -delete
find . -name "*.png" -type f -delete

#robot --log login.html --report report-login.html --xunit out0.xml login.robot
robot --log daily_$1_log.html --report daily_$1_report.html daily$1.robot
