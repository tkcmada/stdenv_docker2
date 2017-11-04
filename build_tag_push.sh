docker build \
  --build-arg RHEL_USER=$RHEL_USER \
  --build-arg RHEL_PASSWORD=$RHEL_PASSWORD \
  -t $1 $1 \
&& docker tag $1 localhost:5000/$1 \
&& docker push localhost:5000/$1
