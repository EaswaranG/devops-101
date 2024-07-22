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