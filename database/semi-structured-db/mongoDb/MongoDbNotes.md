# Getting started with docker
## Author Easwaran Govindarajan

## MongoDB 

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

# Example of an MongoDB Document
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

## MongoDB Notes
- MongoDB is a Document based database system which is more scalable, reliable on most importantly the data is stored in JSON format which makes data analytics on top of the document is simple.