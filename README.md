# The Challenge
We have a need to record up and down votes on Colorado's Best hiking trails!  All of the data is coming in through a RabbitMQ message bus. Using Docker, Rails, PostgreSQL, and RabbitMQ, stand up a docker stack composed of containers that exchange data via Pub/Sub and REST architecture.

## Lifecycle
* A JSON message is dropped into RabbitMQ. Feel free to do this however you'd like: rake task, rails console, etc. The message is formatted thusly: `{"name":"Chimney Gulch Trail","vote":1,"voter":{"first_name":"Forrest","last_name":"Grant"}}`
* The Pub/Sub container should receive that message
* Parse the JSON message, and POST the attributes to the REST container
* The REST container should receive the POST attributes, and persist them in a postgres database
* The REST container should provide a `/hiking_trails.json` endpoint that lists each trail and its current vote count

## Details and Notes
* Use `docker-compose` for orchestration
* There should be a minimum of 4 containers:
  * rabbitmq: the rabbitmq exchange
  * postgres: the postgres DB
  * message-processor: receives messages coming off the queue, POSTs then to the API
  * api: Rails API app
* Specs are encouraged!

# Additional Project Links:
* Agile project board: https://github.com/amypetrie/hiking_trails_challenge/projects/1
* DockerHub repository page: https://cloud.docker.com/repository/docker/amypetrie/hiking_trails_challenge/general
* Heroku deployment: https://hiking-trails-challenge.herokuapp.com/
