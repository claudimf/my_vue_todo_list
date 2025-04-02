# My To-Do list

For study purpose.

## Software Stack

The project is using the following stacks:

* [PostgreSQL](https://www.postgresql.org/docs/15/index.html) - object-relational database
* [Ruby on Rails](https://rubyonrails.org/2025/3/12/Rails-Version-8-0-2-has-been-released) - for backend API
* Front end is implemented using [Vue.js](https://vuejs.org/guide/introduction.html).

### Local environments

You can find in each folder an example file for env variables called ".env.example" like this one that you can find in "backend/.env.example".

### 🐳 Developing using Docker

#### File permissions:
If you create files inside of your container to have access locally you must change the permissions:

```sh
sudo chown -R $USER:$USER .
```
#### Building project locally:
In the root folder we have a file named '01_build_local_project.sh' to build the project locally, so you just need to run:

```sh
bash 01_build_local_project.sh
```