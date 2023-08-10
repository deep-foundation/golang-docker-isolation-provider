# golang-docker-isolation-provider

- `/healthz` - GET - 200 - Health check endpoint
  - Response:
    - `{}`
- `/init` - GET - 200 - Initialization endpoint
  - Response:
    - `{}`
- `/call` - GET - 200 - Call executable code of handler in this isolation provider
  - Request:
    - body:
      - params:
        - jwt: STRING - Deeplinks send this token, for create gql and deep client
        - code: STRING - Code of handler
        - data: {} - Data for handler execution from deeplinks
          > If this is type handler
          - oldLink - from deeplinks, link before transaction
          - newLink - from deeplinks, link after transaction
          - promiseId - from deeplinks, promise id
  - Response:
    - `{ resolved?: any; rejected?: any; }` - If resolved or rejected is not null, then it's result of execution


## Restart docker

```bash
npm ci
npm run package:build
docker build -t golang-docker-isolation-provider .

docker run -d -p 3210:3210 -e PORT=3210 golang-docker-isolation-provider

docker ps
```
