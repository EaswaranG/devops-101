## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS ML Tools Preview

- `Rekognition` : Detects faces, labels, and celebrities in images/videos
- `Transcribe` : Converts speech to text (Eg: Subtitiles, call transcripts)
- `Polly` : Converts text to natural-sounding speech using SSML
- `Translate` : AI-powered language translation
- `Lex` : Alexa powered, builds chatbots with speech an text interfaces
- `Connect` : Cloud-based contact center for customer support
- `Comprehend` : NLP Services for sentiment analysis and entity recognition. Can connect to transcribe and translate
- `Sage Maker` : End-to-end ML Platform for developers and data scientists
- `Forecast` : Generates accurate business forecasts using ML
- `Kendra` : AI-Powered enterprise search engine
- `Personalize` : Provides real-time personalized recommendations
- `Textract` : Extracts text and data from scanned documents

--------

##### AWS Rekognition
- Developers can download the Rekognition SDK from AWS docs and run a `facial detection` or `labels` such as colour etc or `content moderation`, `text in image`, directly from their application to Rekognition using SDK.
- Example: While your application is accepting uploading a media content, to moderate the uploaded content such as celebrity picures uploaded, detect text.
- `Key features` are automated content moderation, custom confidence threshold to set a minimum confidence score for flagged content, Amazon Augmented AI (A2I) enables manual review of flagged content, regulatory content.

##### AWS Transcribe
- Speech-to-text service via API, we can connect this with your call center to run data-analysis on the transcribe to see how many people uses this services and how can that be improved etc.
- Real time transcribe with features such as `PII Redaction`, `Content Moderation` etc.

##### AWS Polly
- Text-to-Speech (TTS) service, which is used in IVR systems to read a pre-defined texts such as runbooks, polly uses a natural voice to generate a lifelike voice.
- Support `SSML tags` such as giving a pause, break, fillers to be as natural as possible.
- Example: `<speak> Hi There, <break> How are you ?</speak>`

##### AWS Translate
- Developers can integrate Translate services in to their apps. This is as as same as Google Translate.

##### AWS Lex
- Uses Alexa intelligence for Automatic Speech recognition, Natural Language Understanding to recognize intent, chatbots.
- Can integrate to AWS Connect to create custom contact flows and integrate with CRM Systems.

##### AWS Comprehend
- Matural Language Processing service that extract insights and relationships to text using Machine Learning.
- Analyze customer interactions from email, chat log and runs `sentiment analysis`.

##### AWS Sage Maker
- ML Model builder for developers and data scientists to build, train and deploy ML models at scale.
- Unified environment and simplified ML process. Streamlines the model and platform for model tuning and evaluation.
- `Key components`: SageMaker Studio (IDE), Notebooks (Jupyter Nodebook service), Model Training, Model Deployment, SageMaker Autopilot, SageMaker Ground Truth (data labeling service).

##### AWS Personalize
- ML Service to give recommendations to business to provide real-time personalized recommendations without requiring ML expertise. It uses Amazon recommendation engine and integrates seamlessly into existing websites, applications, email and SMS marketing.
- Develoeprs can use the SDK.

##### AWS Textract
- To extract text from the documents or images.
- In banking application, this service can be used to extract text from e-deposit cheques.
- Extracts structured and unstructured data, reads handwriting.

##### AWS Forecast
- Business forecast using ML Models and historical data.

##### AWS Kendra
- Search Engine: Used to search data in the documents. If your application requires some documents to be updated, AWS Kendra can be used to run a search inside the documents.

--------