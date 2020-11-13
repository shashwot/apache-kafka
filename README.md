# Apache Kafka and Zookeeper

Apache Kafka is a popular distributed message broker designed to efficiently handle large volumes of real-time data. A Kafka cluster is not only highly scalable and fault-tolerant, but it also has a much higher throughput compared to other message brokers such as ActiveMQ and RabbitMQ. Though it is generally used as a publish/subscribe messaging system, a lot of organizations also use it for log aggregation because it offers persistent storage for published messages.

A publish/subscribe messaging system allows one or more producers to publish messages without considering the number of consumers or how they will process the messages. Subscribed clients are notified automatically about updates and the creation of new messages. This system is more efficient and scalable than systems where clients poll periodically to determine if new messages are available.

# Running Apache Kafka

```
$ docker run -itd --name kafka -p 9092:9092 -p 2181:2181 shashwot/apache-kafka
```

# Testing

Let’s publish and consume a “Hello World” message to make sure the Kafka server is behaving correctly. Publishing messages in Kafka requires:

A producer, which enables the publication of records and data to topics.
A consumer, which reads messages and data from topics.
First, create a topic named TutorialTopic by typing:

```
$ docker exec -it kafka bash

$ /opt/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic TutorialTopic

```
Output:
Created topic "TutorialTopic".

<br>

You can create a producer from the command line using the kafka-console-producer.sh script. It expects the Kafka server’s hostname, port, and a topic name as arguments.

Publish the string "Hello, World" to the TutorialTopic topic by typing:
```
$ echo "Hello, World" | /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic TutorialTopic > /dev/null
```

Next, you can create a Kafka consumer using the kafka-console-consumer.sh script. It expects the ZooKeeper server’s hostname and port, along with a topic name as arguments.

The following command consumes messages from TutorialTopic. Note the use of the --from-beginning flag, which allows the consumption of messages that were published before the consumer was started:

```
$ /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic TutorialTopic --from-beginning
```
