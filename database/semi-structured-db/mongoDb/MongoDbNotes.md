# Getting started with docker
## Author Easwaran Govindarajan

# MongoDB 

MongoDB is a semi-structured general document based database, where each records are JSON documents.
MongoDB Atlas is a cloud-native Document Database as a Service, where the MongoDB core is running in a public cloud (free tier included).

Atlas URL : `https://cloud.mongodb.com/v2/669bee9d2b57fa6efcfe36f0#/overview`

## Installation Guide
- MongoDB can be installed in windows using installation wizard from MongoDB website.
- Homebrew can be used to install in macos `brew install mongodb-community@7.0` and respective package managers for other linux distros.
- Additionally, you can install MongoDB in your docker to isolate and manage easily.
- Or simple use MongoDB Cloud Atlas and connect your application, or choose your own cloud and mongoDB services.

## MongoDB Terms
- Document -> `Document is the basic unit of data in MongoDB`
- Collections -> `Group of related documents is Collections, it can be of any type (flexible schema model)`
- Database -> `A database is a container of the mongoDB collections`

## Example of an MongoDB Document - BSON
```json
{
  "_id": ObjectId("5a934e000102030405000000"),
  "name": "John Doe",
  "age": 30,
  "email": "johndoe@example.com",
  "address": {
    "street": "123 Main St",
    "city": "Anytown",
    "state": "CA",
    "zipcode": "12345"
  },
  "interests": ["hiking", "reading", "traveling"],
  "registered": true,
  "registration_date": ISODate("2024-07-20T12:00:00Z")
}
```

## MongoDB Document Model
- MongoDB is a Document based database system which is more scalable, reliable on most importantly the data is stored in JSON format which makes data analytics on top of the document is simple.
- MongoDB displays the data in JSON format.
- MongoDB stores the data in BSON format (Binary JSON), which is an extension of JSON to support additional datatypes like ObjectID.
- `ObjectID` is an special datatype in BSON acts as an primary key. This ID will be automatically generated if your document don't have an ID (_id)field.
- Documents may contain different field and different data type (Flexible Schema), however do the schema design before implementation. -> `Polymorphic Data`
- We can also set `Schema Validation` rules to optionally validate the data type before saving the document.
- A fields in the document can be in any order and can differ from one document to another in same collection.

## Data Modeling
- Data that are accessed together should be stored together.
- Relationships: 
    -    `One to One` -> One data entity connected to one data entity only in another set in a single document.
            - Eg: One movie have one director
        
                ```json
                    {
                    "_id": ObjectId("5a934e000102030405000000"),
                    "movie": "Ponniyin Selvan",
                    "director": "Maniratnam",
                    "runtime": 190
                    }
                ```
    -    `One to Many` -> One data entity connected to many data entity in another set in a single document.
            - Eg: One movie can be directed by many directors
        
                ```json
                    // Movie Document
                    {
                    "_id": ObjectId("5a934e000102030405000000"),
                    "title": "Navarasa",
                    "chapters": [
                        // Director Document
                        { "_id": ObjectId("3a934e000102030405000011"), 
                        "director": "Gautham Vasudev Menon",
                        "title": "Guitar Kambi Mele Nindu"},
                        {"_id": ObjectId("3a934e000102030405000012"), "director" : "Karthik Subbaraj", "title" : "peace"},
                        {"_id": ObjectId("3a934e000102030405000013"), "director" : "Arvind Swami", "title" : "Rowthiram"}
                        {"_id": ObjectId("3a934e000102030405000014"), "director" : "Bejoy Nambiar", "title" : "Edhiri"}
                    ],
                    "runtime": 160
                    }
                ```

    -    `Many to Many` -> Many data entity connected to many data entity in any another set in a single document.
            - Eg: Same like one to many, but both the documents can have nested cross references

                ```json
                    // Movie Document
                    {
                    "_id": ObjectId("5a934e000102030405000000"),
                    "title": "Navarasa",
                    "chapters": [
                        // Director Document
                        { "_id": ObjectId("3a934e000102030405000011"), 
                        "director": "Gautham Vasudev Menon",
                        "title": "Guitar Kambi Mele Nindu"},
                        {"_id": ObjectId("62hx7e000102030405000111"), "director" : "Karthik Subbaraj", "title" : "peace"},
                        {"_id": ObjectId("3a934e000102030405000013"), "director" : "Arvind Swami", "title" : "Rowthiram"}
                        {"_id": ObjectId("3a934e000102030405000014"), "director" : "Bejoy Nambiar", "title" : "Edhiri"}
                    ],
                    "runtime": 160
                    }
                ```

                ```json
                    // Director Document
                    {
                    "_id": ObjectId("62hx7e000102030405000111"),
                    "director_name": "Karthik Subbaraj",
                    "movies": [
                        // Movie Document
                        { "_id": ObjectId("5a934e000102030405000000"),
                          "_id": ObjectId("5a934e000102030405000001"),
                          "_id": ObjectId("5a934e000102030405000002"),
                        }
                    ]
                    }
                ```

- There are two primary way of moding a This can be achieved using 
                - 1) `Embedding` -> We take related data and insert into the document. (Eg: Same as OnetoMany example above)
                - 2) `Referencing` -> Refer to documents in another collection in our document.
                    - Referencing Eg: Filming locations are in locations collections and it is being referred using Object ID.
    
                        ```json
                            {
                            "_id": ObjectId("5a934e000102030405000000"),
                            "title": "Navarasa",
                            "chapters": [
                                {"director" : "Gautham Vasudev Menon", "title" : "Guitar Kambi Mele Nindu"},
                                {"director" : "Karthik Subbaraj", "title" : "peace"},
                                {"director" : "Arvind Swami", "title" : "Rowthiram"}
                                {"director" : "Bejoy Nambiar", "title" : "Edhiri"}
                            ],
                            "runtime": 160,
                            "filming_locations": [
                                ObjectId("4a934e000102030405000001"),
                                ObjectId("4a934e000102030405000002")
                            ]
                            }
                        ```

- Embedded documents (also know as Nested Documents) can cause significant issues.
    - Embedded documents will make the document larger and slows down the application performance.
    - Contiunously adding data without limit can create unbounded documents.
    - Unbounded documents may exceed the `BSON document threshold of 16 MB`.
- When we have to store related data seperate in a document or may be in different collection, we can use `_id` field and create a reference.
- Using Referencing is called linking or `data normalization`.
- Referencing provides smaller documents and avoids duplication of data.
- However, referencing creates a overhead while querying from multuple documents costs extra resources and impacts read performance.

| Embedding                                    | Referencing                                      |
|----------------------------------------------|--------------------------------------------------|
| Pro: Single query to retrieve data | Pro: No duplication of data        |
| Pro: Single operation to update/delete data | Pro: Smaller document size, references stored instead |
| Con: Data Duplication | Con: Need to join data from multiple documents |
| Con: Large documents | Con: Updates can be more complex, multiple documents may need updating |

- Utilize Schema design patterns, that are guidlelines that helps developers plan, organize and model data.
- Some common schema anti-patterns such as massive arrays, massive number of collections, bloated documents, unncessary indexes, queries without indexes.
- Use tools in MongoDB Atlas such as Data Explorer (Available in free tier) and Performance Advisor (Not available in free tier).

## Connect to MongoDB Database

- MongoDB can be connected to `Shell`, `MongoDB Compass` or any other `Applications`.
- Two formats for connection string
    - Standard Format: Connect to standlone clusters, replica sets or sharded clusters.
    - DNS Seed List Format: Released in v3.6, provides a DNS server list to our connection string. Gives more flexibility of deployment and ability to change servers in rotation without reconfiguring clientes.
- Connect to Atlas Cluster:
    - Navigate to Atlast -> Database -> Find Connect button -> Choose from the list.
    - Mention the driver name to get the connection string.
    - In connectoion string, the `mongodb+srv://` where the mongodb refers to the database name and the `srv` is to set TLS to true for configuring DNS seed list.
    - Followed by the username, password, cluster info and port details along with other options like retry timeout, TLS, SSL, read and write consents.

- MongoDB Shell is an NodeJS REPL Environment, this gives access to JS Functions and expressions.

## Insert Document into Collection

- There are two ways to insert a document to a collection.
    - insertOne() -> db.<collection>.insertOne() [ Eg: db.grades.insertOne()] //If the collection is not existing, the mongoDB will automatically create the collection
            - Example: db.grades.insertOne(
                {
                    student_id: 500,
                    scores: [
                        {
                            type: "quiz",
                            score: 50
                        },{
                            type: "homework",
                            score: 70
                        }
                    ]
                }
            )
            Output:
                ```json
                {
                    acknowledged: true.
                    insertedId: ObjectId("34h124352B4144fn2fk23f5")
                }
                ```
    - insertMany(): Expects an array of documents, db.<collection>.insertMany()
        - Eg: db.grades.insertMany([
            <document 1>,
            <document 2>,
            <document 3>
        ])
        Output:
                ```json
                {
                    acknowledged: true.
                    insertedIds: {
                       '0' :  ObjectId("34h124352B4144fn2fk23f5"),
                        '1' : ObjectId("34h124352B4144fn2fk23f5"),
                       '2' : ObjectId("34h124352B4144fn2fk23f5")
                    }
                }
                ```

## Finding Documents in a MongoDB Collection - Using find()

- Use find() method to view all the documents in the collection.
- db.<collection>.find()
- To retrive a specific document we can either use `$eq` operator to find the field and value directly.
- Eg: `db.zips.find({state: "AZ"})`
- Or Using `$in` operator we can find the values in the list specified in the array.
    - Eg: `db.zips.find({city: {
            $in: ["PHEONIX", "CHICAGO"]
         }
        })

## Finding Documents in a MongoDB Collection - using Comparator

- `$gt` (greater than) -> Returns documents where the field contains value greater than the specified value [`db.sales.find({"items.price" : {$gt: 50}})`]
- `$lt` (less than) -> `db.sales.find({"items.price" : {$lt: 50}})`
- `lte` (less than or equal to) -> `db.sales.find({"items.price" : {$lte: 50}})`
- `gte` (greater than or equal to) -> `db.sales.find({"items.price" : {$gte: 50}})`
- Few more operators, check out documentation.
- Syntax: `<field>: { <operator> : <value> }`

## Query on Array Elements in MongoDB

- `$elemMatch` -> Matches a specific element criteria
- `$eq` -> Use eq operator along with elemMatch to return only the array with this element exists.
- Example:  
    ```json
    db.account.find({
        products : {
            $elemMatch : {$eq : "InvestmemtStocks"}
        }
    });
    ```

### Find a Document by Using the $elemMatch Operator
Use the $elemMatch operator to find all documents that contain the specified subdocument. For example:

db.sales.find({
  items: {
    $elemMatch: { name: "laptop", price: { $gt: 800 }, quantity: { $gte: 1 } },
  },
})

## Logical Operators in MongoDB

- `$and` -> Logical And operator  
- `$or` -> Logical OR operator
Expression:
    db.<collection>.find({
        $or : [
            {"airline" : "Southwest Airlines"} ,{"stops" : {"$gte" : 1}}
            {"airline" : "Delta Airlines"} ,{"stops" : {"$gte" : 2}}

            ]
    });
    
Example:
    db.routes.find({
        $and : [{"airline" : "Southwest Airlines"} ,{"stops" : {"$gte" : 1}}]
    });

### Find a Document by Using the $and Operator and $or operator together

Use the $and operator to use multiple $or expressions in your query.
```json
db.routes.find({
  $and: [
    { $or: [{ dst_airport: "SEA" }, { src_airport: "SEA" }] },
    { $or: [{ "airline.name": "American Airlines" }, { airplane: 320 }] },
  ]
})
```


## Connect MongoDB to Java App
- Synchronus and Async drivers are available
- Connect to Your Atlas Cluster

1. Create a new file called Connection.java with the following code. This file uses your MongoDB connection string and the MongoClient to establish a connection with your Atlas cluster:
```java
package com.mongodb.quickstart;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import org.bson.Document;

import java.util.ArrayList;
import java.util.List;

public class Connection {

    public static void main(String[] args) {
        String connectionString = System.getProperty("mongodb.uri");
        try (MongoClient mongoClient = MongoClients.create(connectionString)) {
            List<Document> databases = mongoClient.listDatabases().into(new ArrayList<>());
            databases.forEach(db -> System.out.println(db.toJson()));
        }
    }
}
```

2. In the project's root folder, run the following command to compile your Maven project and connect to your Atlas cluster: 

mvn compile exec:java -Dexec.mainClass="com.mongodb.quickstart.Connection" -Dmongodb.uri="<connectionString>"mvn compile exec:java -Dexec.mainClass="com.mongodb.quickstart.Connection" -Dmongodb.uri="<connectionString>"

