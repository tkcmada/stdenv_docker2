docker build -t $1 . \
&& docker tag $1 localhost:5000/$1 \
&& docker push localhost:5000/$1
