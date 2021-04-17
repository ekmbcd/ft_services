

run=`mysql -u root < wordpress.sql | grep MySQL` > /dev/null
while [[ `$run | grep MySQL` ]]
do
	run=`mysql -u root < wordpress.sql | grep MySQL` > /dev/null
done
rm wordpress.sql mysql_init.sql
