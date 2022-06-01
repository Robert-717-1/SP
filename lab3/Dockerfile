FROM debian
COPY sp3.cpp .
RUN apt-get update
RUN apt-get install -y build-essential gdb
RUN gcc -fno-pie -no-pie sp3.cpp -o sp3 -g -lstdc++
CMD ./sp3
