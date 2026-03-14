## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Autthor Easwaran Govindarajan

## Event Driven Architecture for Data-Streaming

**Two Types of software communication**
- Synchronous Communication (App-to-App)
    - Real-time interaction with other service/application.
    - Dependent and tightly coupled, leads to challenges in failures. 
- Async/Event Based Communication (Application-to-Queue-to-Application)
    - For depcouple, allowing independent scaling for more resilient to traffic spikes and failures.
    - Front-End --> Queue ---> DB Backend

## Decoupling solutions in AWS

- **SQS (Queue Model)**
    - Message are queued for processing, consumers can scale independently
    - Unlimited Throughput and `14 days retention`, message `max size of 1024 KB per message`, long-polling can be set up to `20 seconds`
    - `Secure SQS` At-Rest, In-Flight and Client-Side Encryption.
    - You can assign a groupID and organize by single/sepecific consumers
- **SNS (Pub/Sub Model)**
    - Publishers sends messages to an SNS topic, multiple subscribers process message independently 
- **Kinesis (Real-Time Streaming)**
    - Streams the data in realtime.