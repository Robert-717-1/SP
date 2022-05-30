FROM debian
COPY sp1.sh .
COPY name.iso .
RUN chmod ugo+x sp1.sh
RUN apt-get update && apt-get install -y isomd5sum
CMD ./sp1.sh
