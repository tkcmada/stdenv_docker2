start.sh
#!/bin/bash

service nginx start

trap 'service nginx stop; exit 0' TERM

while :
do
    sleep 1
done
