#Requires pxz

docker save datastax-cassandra > cassandra-cluster-playbook/roles/cassandra/files/datastax-cassandra.tar
pxz -f cassandra-cluster-playbook/roles/cassandra/files/datastax-cassandra.tar
