# [Confluent Open Source Platform](https://www.confluent.io/product/confluent-open-source/) using [Oracle JDK] #

### Running using Docker ###

#### Prerequisites: ####

If you’re running on Windows or Mac OS X, you’ll need to use [Docker Machine] to start the Docker host. Docker runs natively on Linux, so the Docker host will be your local machine if you go that route. Otherwise, be sure to allocate at least 4 GBs RAM to the [Docker Machine].

1. Create the [Docker Machine], using 6 GBs and 2 CPUs - [docker-machine-create.sh]
2. Start the [Docker Machine] - [docker-machine-start.sh]
3. Stop the [Docker Machine] - [docker-machine-stop.sh]
4. Remove the [Docker Machine] - [docker-machine-rm.sh]

Don't forget to check the [Important Notes/Caveats] from the [Official Documentation].

#### Versions used: ####

```shell
docker --version && docker-compose --version && docker-machine --version
```

```
Docker version 17.06.2-ce, build cec0b72
docker-compose version 1.14.0, build c7bdf9e
docker-machine version 0.12.2, build 9371605
```

#### 1. ZooKeeper ####

1.1. Single [Apache ZooKeeper] node:
- Start node - [single-zk-start.sh]
- Stop node - [single-zk-stop.sh]

1.2. Cluster of 3 [Apache ZooKeeper] nodes:
- Start the cluster - [cluster-zkX3-start.sh]
- Stop the cluster - [cluster-zkX3-stop.sh]
- Check if leader election succeded - [cluster-zkX3-check.sh]

#### 2. Kafka ####

2.1. A single [Apache ZooKeeper] node, plus a single [Apache Kafka] node:
- Start the cluster - [single-kfk-zk-start.sh]
- Stop the cluster - [single-kfk-zk-stop.sh]

2.2. Cluster of 3 [Apache ZooKeeper] nodes, plus 3 [Apache Kafka] nodes:
- Start the cluster - [cluster-kfkX3-zkX3-start.sh]
- Stop the cluster - [cluster-kfkX3-zkX3-start.sh]
- Check if ZooKeeper leader election succeded and if all Kafka brokers know about each other - [cluster-kfkX3-zkX3-check.sh]

#### 3. Kafka, Schema Registry and REST Proxy #####

3.1. A single [Apache ZooKeeper] node, plus a single [Apache Kafka] node, a [Schema Registry] node and a [REST Proxy] node:
- Start the cluster - [single-kfk-zk-sr-rp-start.sh]
- Stop the cluster - [single-kfk-zk-sr-rp-stop.sh]

3.2. Cluster of 3 [Apache ZooKeeper] nodes, plus 3 [Apache Kafka] nodes, a [Schema Registry] node and a [REST Proxy] node:
- Start the cluster - [cluster-kfkX3-zkX3-sr-rp-start.sh]
- Stop the cluster - [cluster-kfkX3-zkX3-sr-rp-start.sh]

#### 4. Kafka, Schema Registry, REST Proxy and Kafka Connect #####

4.1. A single [Apache ZooKeeper] node, plus a single [Apache Kafka] node, a [Schema Registry] node, a [REST Proxy] node and an [Apache Kafka Connect] node:
- Start the cluster - [single-kfk-zk-sr-rp-kc-start.sh]
- Stop the cluster - [single-kfk-zk-sr-rp-kc-stop.sh]

4.2. Cluster of 3 [Apache ZooKeeper] nodes, plus 3 [Apache Kafka] nodes, a [Schema Registry] node, a [REST Proxy] node and an [Apache Kafka Connect] node:
- Start the cluster - [cluster-kfkX3-zkX3-sr-rp-kc-start.sh]
- Stop the cluster - [cluster-kfkX3-zkX3-sr-rp-kc-start.sh]

### Running using Kubernetes ###

(work in progress)

### Dual licensed under: ###

* [Apache License]
* [Oracle Binary Code License Agreement]

   [Schema Registry]: <http://docs.confluent.io/current/schema-registry/docs/index.html>  
   [REST Proxy]: <http://docs.confluent.io/current/kafka-rest/docs/index.html>   
   [Apache Kafka Connect]: <https://kafka.apache.org/documentation/#connect>   
   [single-kfk-zk-sr-rp-start.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/single-kfk-zk-sr-rp/single-kfk-zk-sr-rp-start.sh>
   [single-kfk-zk-sr-rp-stop.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/single-kfk-zk-sr-rp/single-kfk-zk-sr-rp-stop.sh>
   [single-kfk-zk-sr-rp-kc-start.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/single-kfk-zk-sr-rp-kc/single-kfk-zk-sr-rp-kc-start.sh>
   [single-kfk-zk-sr-rp-kc-stop.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/single-kfk-zk-sr-rp-kc/single-kfk-zk-sr-rp-kc-stop.sh>
   [cluster-kfkX3-zkX3-sr-rp-start.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/cluster-kfkX3-zkX3-sr-rp/cluster-kfkX3-zkX3-sr-rp-start.sh>
   [cluster-kfkX3-zkX3-sr-rp-stop.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/cluster-kfkX3-zkX3-sr-rp/cluster-kfkX3-zkX3-sr-rp-stop.sh>
   [cluster-kfkX3-zkX3-sr-rp-kc-start.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/cluster-kfkX3-zkX3-sr-rp-kc/cluster-kfkX3-zkX3-sr-rp-kc-start.sh>
   [cluster-kfkX3-zkX3-sr-rp-kc-stop.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/cluster-kfkX3-zkX3-sr-rp-kc/cluster-kfkX3-zkX3-sr-rp-kc-stop.sh>
   [single-zk-start.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/single-zk/single-zk-start.sh>
   [single-zk-stop.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/single-zk/single-zk-stop.sh>   
   [cluster-zkX3-start.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/cluster-zkX3/cluster-zkX3-start.sh>    
   [cluster-zkX3-stop.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/cluster-zkX3/cluster-zkX3-stop.sh>
   [cluster-zkX3-check.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/cluster-zkX3/cluster-zkX3-check.sh>
   [single-kfk-zk-start.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/single-kfk-zk/single-kfk-zk-start.sh>
   [single-kfk-zk-stop.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/single-kfk-zk/single-kfk-zk-stop.sh>  
   [cluster-kfkX3-zkX3-start.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/cluster-kfkX3-zkX3/cluster-kfkX3-zkX3-start.sh>
   [cluster-kfkX3-zkX3-stop.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/cluster-kfkX3-zkX3/cluster-kfkX3-zkX3-stop.sh>
   [cluster-kfkX3-zkX3-check.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/cluster-kfkX3-zkX3/cluster-kfkX3-zkX3-check.sh>
   [Official Documentation]: <http://docs.confluent.io/>
   [Important Notes/Caveats]: <http://docs.confluent.io/current/cp-docker-images/docs/intro.html#important-notes-caveats>
   [Apache ZooKeeper]: <https://zookeeper.apache.org/>
   [Apache Kafka]: <https://kafka.apache.org/>
   [docker-machine-create.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/docker-machine-create.sh>
   [docker-machine-start.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/docker-machine-start.sh>
   [docker-machine-stop.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/docker-machine-stop.sh>
   [docker-machine-rm.sh]: <https://github.com/MihaiBogdanEugen/confluent-osp/blob/master/docker/docker-machine-rm.sh>
   [Docker Machine]: <https://docs.docker.com/machine/install-machine/>
   [Confluent Open Source Platform]: <https://www.confluent.io/product/confluent-open-source/>
   [Oracle JDK]: <http://www.oracle.com/technetwork/java/javase/downloads/index.html>
   [Apache License]: <https://raw.githubusercontent.com/MihaiBogdanEugen/confluent-osp-kafka/master/LICENSE>
   [Oracle Binary Code License Agreement]: <https://raw.githubusercontent.com/MihaiBogdanEugen/confluent-osp-kafka/master/Oracle_Binary_Code_License_Agreement%20for%20the%20Java%20SE%20Platform_Products_and_JavaFX>