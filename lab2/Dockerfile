FROM debian
COPY sp2_asem.s .
RUN apt-get update
RUN apt install gcc gdb gcc-multilib nano -y
RUN gcc -m32 -fno-pie -no-pie sp2_asem.s -o sp2_asem
CMD ./sp2_asem
