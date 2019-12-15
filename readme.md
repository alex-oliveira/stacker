# STACKER



## Installation

Navigate to root system.
````
$ cd /
````

Clone the project repository.
````
$ git clone https://github.com/alex-oliveira/stacker.git
````



## Initialize a stack

Create a folder for your apps and navigate to it.
````
$ mkdir /apps
$ cd /apps
````

Create a new project based on the "earth" stack.
````
$ /stacker/init.sh myapp earth
````



## Stack list
|         | NGINX | NGINX/PHP | MYSQL | POSTGRES | REDIS |
|---------|-------|-----------|-------|----------|-------|
| mercury |   X   |           |   X   |          |       |
| venus   |   X   |           |   X   |          |   X   |
| earth   |   X   |           |       |     X    |       |
| mars    |   X   |           |       |     X    |   X   |
| jupiter |       |     X     |   X   |          |       |
| saturn  |       |     X     |   X   |          |   X   |
| uranus  |       |     X     |       |     X    |       |
| neptune |       |     X     |       |     X    |   X   |
