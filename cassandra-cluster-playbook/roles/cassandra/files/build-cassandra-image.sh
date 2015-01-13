#Requires pxz

docker save datastax-cassandra > datastax-cassandra.tar
pxz -f datastax-cassandra.tar
