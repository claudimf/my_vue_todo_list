# My To-Do list

For study purpose.

## Software Stack

The project is using the following stacks:

* [PostgreSQL](https://www.postgresql.org/docs/15/index.html) - object-relational database
* [Ruby on Rails](https://rubyonrails.org/2025/3/12/Rails-Version-8-0-2-has-been-released) - for backend API
* Front end is implemented using [Vue.js](https://vuejs.org/guide/introduction.html).

## Architecture

### Backend (Rails API)

- Uses **Rails 8 (API-only)** with **PostgreSQL**.
- Implements **Kafka** (via `karafka` gem) for event-driven messaging.
- Publishes events when a To-Do item is **created**, **updated**, or **deleted**.

### Frontend (Vue.js)

- Uses **Vue 3 + Vite** for a lightweight frontend.
- Listens to events via a **WebSocket** or a **polling mechanism**.
- Allows users to **create**, **update**, and **delete** To-Do items.

### Event Streaming (Kafka)

- **Kafka** is used to handle real-time event streaming.
- The backend **produces events** when a to-do item changes.
- The backend **consumes events** and logs them for auditing.

## Local environments

You can find in each folder an example file for env variables called ".env.example" like this one that you can find in "backend/.env.example".

## 🐳 Developing using Docker

### File permissions:
If you create files inside of your container to have access locally you must change the permissions:

```sh
sudo chown -R $USER:$USER .
```
### Building project locally:
In the root folder we have a file named '01_build_local_project.sh' to build the project locally, so you just need to run:

```sh
bash 01_build_local_project.sh
```

## Running rspec tests

Running rspec tests locally:
```
bash 03_run_tests_locally.sh
```

## References:

[Curso gratuito Vue.js 3](https://www.youtube.com/watch?v=9DRY-aNPta0)  
[Karafka](https://karafka.io/docs/)  
[PostgreSQL](https://www.postgresql.org/docs/15/index.html)  
[Ruby on Rails](https://rubyonrails.org/2025/3/12/Rails-Version-8-0-2-has-been-released)
[Apache ZooKeeper](https://zookeeper.apache.org/)  
[Apache Kafka](https://kafka.apache.org/)  
[Docker](https://www.docker.com/)  
[My Karafka App - Ruby on Rails + Kafka + Docker](https://github.com/claudimf/ruby_on_rails_kafka_docker)  