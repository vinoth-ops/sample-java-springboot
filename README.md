This is a sample Spring boot starter application which accepts HTTP request on api/hello endpoint

<H1>Build with Docker</H1>:
Clone the repository and run the below command from project root:

docker build -t sample-spring-app .

This outputs a docker image which is ready for execution. The application is exposed on port 8080

Execute below command to run the image:
docker run -d -p 8080:8080 sample-spring-app


<H1> Build Locally with Maven </H1>
Clone the repo, ensure you have java installed

Run: ./mvnw package && java -jar target/<artifactname>.jar
