# Authorization System API

This system is build to authorize users based on their permissions, the actions that they want to perform and the application that they are using. 

This system manages the Applications available, the Actions related to each application and the permissions needed to do every action. 


## Versions

+ Ruby 3.3.0
+ Rails 7.1.3.4


## Build

Once cloned the app run the next command: 

``` bundle install ```

## Database creation (sqlite3)
First of all you need to execute the next command to migrate the database and create the models:

``` rails db:migrate ```

## Database initialization
After that this project has a basic data that allow you to have information to test the system using postman or similar applications. 
This information is located on the db/seeds.rb file. 

To populate the database run the next command:

``` rails db:seed ```

You can check the data runing following the next steps: 

1. Run `` rails c `` (This open the console to interact with sqlite3)
2. Run `` Application.all `` (This gives you all the applications)
3. Run `` Action.all `` (This gives you all the Actions)
4. Run `` Permission.all `` (This gives you all the Permissions)
5. Run `` ActionPermission.all `` (This gives you all the relations between actions and permissions.)


## Run Sytem
To run the system, simply execute the following command. It is recommended that you complete the previous steps first:

``` rails s ```

The server should start on port 3000: `` http://localhost:3000 ``


## Postman collection to test the sysyem:
Here is the postman collection with some calls prepared to test the system. 

[Authorization API Collection](https://www.postman.com/lunar-shuttle-200815/workspace/public-achaghirc/collection/11026541-e0c397c1-5bbb-4170-a95a-44a366986327?action=share&creator=11026541)


Hope everything works like a charm! If you need any help, feel free to reach out to me via email: chaghir.amine@gmail.com
