echo RHEL_USER in sh is $RHEL_USER
echo RHEL_PASSWORD in sh is $RHEL_PASSWORD
sudo docker build \
  --build-arg RHEL_USER=$RHEL_USER \
  --build-arg RHEL_PASSWORD=$RHEL_PASSWORD \
  -t $1 $1 \
&& sudo docker tag $1 localhost:5000/$1 \
&& sudo docker push localhost:5000/$1
