## Scripts for the [Confluent Open Source Platform] using [Oracle JDK] ##

### Running using Docker-Compose ###

#### Versions used: ####

```shell
docker --version && docker-compose --version && docker-machine --version
```

```
Docker version 17.09.0-ce, build afdb6d4
docker-compose version 1.16.1, build 6d1ac21
docker-machine version 0.12.2, build 9371605
```

#### Prerequisites: ####

If you’re running on Windows or Mac OS X, you’ll need to use [Docker Machine] to start the Docker host. Docker runs natively on Linux, so the Docker host will be your local machine if you go that route. Otherwise, be sure to allocate at least 6 GBs RAM to the [Docker Machine].

- Create the [Docker Machine], using 6 GBs and 2 CPUs - [docker-machine-create.sh](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/docker-compose/docker-machine-create.sh)
- Start the [Docker Machine] - [docker-machine-start.sh](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/docker-compose/docker-machine-start.sh)
- Status of the [Docker Machine] - [docker-machine-status.sh](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/docker-compose/docker-machine-status.sh)
- Stop the [Docker Machine] - [docker-machine-stop.sh](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/docker-compose/docker-machine-stop.sh)
- Remove the [Docker Machine] - [docker-machine-rm.sh](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/docker-compose/docker-machine-rm.sh)

Don't forget to check the [Important Notes/Caveats] from the [Official Documentation].

#### 1. ZooKeeper: ####

1.1. Single [Apache ZooKeeper] node - [docker-compose.yml](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/docker-compose/single-zk/docker-compose.yml)

1.2. Cluster of 3 [Apache ZooKeeper] nodes - [docker-compose.yml](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/docker-compose/cluster-zkX3/docker-compose.yml)
- Check if leader election succeded - [cluster-zkX3-check.sh](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/docker-compose/cluster-zkX3/cluster-zkX3-check.sh)

#### 2. Kafka: ####

2.1. A single [Apache ZooKeeper] node, plus a single [Apache Kafka] node - [docker-compose.yml](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/docker-compose/single-zk-kfk/docker-compose.yml)

2.2. Cluster of 3 [Apache ZooKeeper] nodes, plus 5 [Apache Kafka] nodes - [docker-compose.yml](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/docker-compose/cluster-zkX3-kfkX5/docker-compose.yml)
- Check if ZooKeeper leader election succeded and if all Kafka brokers know about each other - [cluster-zkX3-kfkX3-check.sh](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/docker-compose/cluster-zkX3-kfkX5/cluster-zkX3-kfkX5-check.sh)

#### 3. Kafka, Schema Registry and REST Proxy: #####

3.1. A single [Apache ZooKeeper] node, plus a single [Apache Kafka] node, a [Schema Registry] node and a [REST Proxy] node - [docker-compose.yml](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/docker-compose/single-zk-kfk-sr-rp/docker-compose.yml)

3.2. Cluster of 3 [Apache ZooKeeper] nodes, plus 5 [Apache Kafka] nodes, a [Schema Registry] node and a [REST Proxy] node - [docker-compose.yml](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/docker-compose/cluster-zkX3-kfkX5-sr-rp/docker-compose.yml)
- Check if ZooKeeper leader election succeded and if all Kafka brokers know about each other - [cluster-zkX3-kfkX3-sr-rp-check.sh](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/docker-compose/cluster-zkX3-kfkX5-sr-rp/cluster-zkX3-kfkX5-sr-rp-check.sh)

### Running using Kubernetes: ###

#### Versions used: ####

```shell
kubectl version
```

```
Client Version: version.Info{Major:"1", Minor:"8", GitVersion:"v1.8.3", GitCommit:"f0efb3cb883751c5ffdbe6d515f3cb4fbe7b7acd", GitTreeState:"clean", BuildDate:"2017-11-09T07:27:47Z", GoVersion:"go1.9.2", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"7", GitVersion:"v1.7.8", GitCommit:"bc6162cc70b4a39a7f39391564e0dd0be60b39e9", GitTreeState:"clean", BuildDate:"2017-10-05T06:35:40Z", GoVersion:"go1.8.3", Compiler:"gc", Platform:"linux/amd64"}
```

#### 0. Prerequisites: ####

Create a dedicated namespace - [Namespace](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/0_prerequisites/namespace.yml)

#### 1. ZooKeeper: ####
- [Service](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/1_zookeeper/zookeeper-service.yml)
- [ConfigMap](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/1_zookeeper/zookeeper-configmap.yml)
- [PodDisruptionBudget](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/1_zookeeper/zookeeper-poddisruptionbudget.yml)
- [Deployment](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/1_zookeeper/zookeeper-deployment.yml) or [StatefulSet](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/1_zookeeper/zookeeper-statefulset.yml)

#### 2. Kafka: ####
- [Service](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/2_kafka/kafka-service.yml)
- [ConfigMap](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/2_kafka/kafka-configmap.yml)
- [PodDisruptionBudget](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/2_kafka/kafka-poddisruptionbudget.yml)
- [Deployment](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/2_kafka/kafka-deployment.yml) or [StatefulSet](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/2_kafka/kafka-statefulset.yml)

#### 3. Schema Registry: ####
- [Service](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/3_schema-registry/schema-registry-service.yml)
- [Ingress](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/3_schema-registry/schema-registry-ingress.yml)    
- [ConfigMap](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/3_schema-registry/schema-registry-configmap.yml)
- [PodDisruptionBudget](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/3_schema-registry/schema-registry-poddisruptionbudget.yml)
- [Deployment](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/3_schema-registry/schema-registry-deployment.yml)

#### 4. REST Proxy: ####
- [Service](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/4_rest-proxy/rest-proxy-service.yml)
- [Ingress](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/4_rest-proxy/rest-proxy-ingress.yml)    
- [ConfigMap](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/4_rest-proxy/rest-proxy-configmap.yml)
- [PodDisruptionBudget](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/4_rest-proxy/rest-proxy-poddisruptionbudget.yml)
- [Deployment](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/kubernetes/4_rest-proxy/rest-proxy-deployment.yml)

### Running using Minikube: ###

#### Versions used: ####

```shell
minikube version && kubectl version
```

```
minikube version: v0.23.0
Client Version: version.Info{Major:"1", Minor:"8", GitVersion:"v1.8.3", GitCommit:"f0efb3cb883751c5ffdbe6d515f3cb4fbe7b7acd", GitTreeState:"clean", BuildDate:"2017-11-09T07:27:47Z", GoVersion:"go1.9.2", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"8", GitVersion:"v1.8.0", GitCommit:"0b9efaeb34a2fc51ff8e4d34ad9bc6375459c4a4", GitTreeState:"dirty", BuildDate:"2017-10-17T15:09:55Z", GoVersion:"go1.8.3", Compiler:"gc", Platform:"linux/amd64"}
```

#### Prerequisites: ####

One has to start the minikube using the xhyve driver. 

- Start Minikube [minikube-start.sh](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/minikube-start.sh)
- Stop Minikube [minikube-stop.sh](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/minikube-stop.sh)
- Delete Minikube [minikube-delete.sh](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/minikube-delete.sh)
- Check Minikube dashboard [minikube-dashboard.sh](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/minikube-dashboard.sh)
- Check kubectl's current context [minikube-check.sh](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/minikube-check.sh)

#### 1. ZooKeeper: ####
- [Service #1](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/1_zookeeper/zookeeper1-service.yml)
- [Service #2](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/1_zookeeper/zookeeper2-service.yml)
- [Service #3](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/1_zookeeper/zookeeper3-service.yml)
- [Pod #1](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/1_zookeeper/zookeeper1-pod.yml)
- [Pod #2](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/1_zookeeper/zookeeper2-pod.yml)
- [Pod #3](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/1_zookeeper/zookeeper3-pod.yml)

#### 2. Kafka: ####
- [Service #1](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/2_kafka/kafka1-service.yml)
- [Service #2](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/2_kafka/kafka2-service.yml)
- [Service #3](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/2_kafka/kafka3-service.yml)
- [Service #4](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/2_kafka/kafka4-service.yml)
- [Service #5](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/2_kafka/kafka5-service.yml)
- [Pod #1](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/2_kafka/kafka1-pod.yml)
- [Pod #2](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/2_kafka/kafka2-pod.yml)
- [Pod #3](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/2_kafka/kafka3-pod.yml)
- [Pod #4](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/2_kafka/kafka4-pod.yml)
- [Pod #5](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/2_kafka/kafka5-pod.yml)

#### 3. Schema Registry: ####
- [Service #1](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/3_schema-registry/schema-registry-service.yml)
- [Pod #1](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/3_schema-registry/schema-registry-pod.yml)

#### 4. REST Proxy: ####
- [Service #1](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/4_rest-proxy/rest-proxy-service.yml)
- [Pod #1](https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob/master/minikube/4_rest-proxy/rest-proxy-pod.yml)

### Dual licensed under: ###

* [MIT License]
* [Oracle Binary Code License Agreement]

   [Confluent Open Source Platform]: <https://www.confluent.io/product/confluent-open-source/>
   [Oracle JDK]: <http://www.oracle.com/technetwork/java/javase/downloads/index.html>
   [Docker Machine]: <https://docs.docker.com/machine/install-machine/>
   [Important Notes/Caveats]: <http://docs.confluent.io/current/cp-docker-images/docs/intro.html#important-notes-caveats>
   [Official Documentation]: <http://docs.confluent.io/>
   [Apache ZooKeeper]: <https://zookeeper.apache.org/>
   [Apache Kafka]: <https://kafka.apache.org/>
   [Schema Registry]: <http://docs.confluent.io/current/schema-registry/docs/index.html>  
   [REST Proxy]: <http://docs.confluent.io/current/kafka-rest/docs/index.html>   
   [Apache Kafka Connect]: <https://kafka.apache.org/documentation/#connect>
   [MIT License]: <https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob//master/LICENSE>
   [Oracle Binary Code License Agreement]: <https://github.com/MihaiBogdanEugen/confluent-platform-scripts/blob//master/Oracle_Binary_Code_License_Agreement%20for%20the%20Java%20SE%20Platform_Products_and_JavaFX>