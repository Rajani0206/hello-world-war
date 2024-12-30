ls -lrt
if [ -d hello-world-war ]
then
rm -rf hello-world-war
fi
git clone https://github.com/Rajani0206/hello-world-war.git
mvn clean package
echo " $1 $2"
