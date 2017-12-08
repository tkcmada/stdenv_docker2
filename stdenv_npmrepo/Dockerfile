FROM stdenv_tools

RUN yum install -y nodejs npm
RUN yum update  -y openssl
RUN yum install -y gcc gcc-c++
RUN npm install -g local-npm
RUN local-npm || echo "continue anyway"
RUN npm set registry http://127.0.0.1:5080 \
    npm install -g serverless

# npm set registry http://127.0.0.1:5080
# npm set registry https://registry.npmjs.org

EXPOSE 5080

CMD ["local-npm"]

