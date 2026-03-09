# Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS CloudFront - Content Delivery Network (CDN)

##### Why CloudFront?
- CDN service caches static contents of a server near to the requesting user. If the source server is far away for a user, CDN helps loading the static content quicker from near by edge computer.

##### If CDN doesn't exists what happens?
- If CDN doesn't exist, the user requesting from far location would have to hop through multiple paths physically to reach the far away server.

##### How CloudFront solves this issue?
- User request is routed to near by CloudFront Edge and takes a private AWS dedicated low latency cable to the origin server and caches the static content near by to the user region.

##### Notes
- CloudFront VPC can be configured as single public endpoint and from there request goes through private VPC via NAT gateway.
- `CloudFront regional edge` -> Sets up point of presence around the ergion.
- `Origin Access Control` can be configured for an S3 bucket where the req coming via CloudFront can be allowed. Which will block public direct access to S3.
- `Geo Restriction` on cloudFront can be set where the request can and can not come from.
- `Price class All, 200 and 100` are some pricing plans.
    - All region (expensive), or only NA region etc, based on pricing class, where we could cache will be restricted.
- `Invalidate Cache` -> Marks a path which never caches.
- Works on `Layer 7` (Http/Https)
