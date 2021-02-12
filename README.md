# docker-sam

A Docker image for AWS SAM. The primary is to use it with the 3 musketeers.

In your `docker-compose.yml` file
```
  sam:
    image: anhnguyen072/sam-cli:1.15.0
    env_file: .env
    working_dir: /opt/app
    volumes:
    - .:/opt/app:rw
    - ~/.aws:/root/.aws
```