# Focused
Java/JDBC/JPA/SQL/Hibernate Group Project

## Full Stack Group MVC Project

### Technologies
* Spring MVC
* JPA
* MySQL
* HTML/CSS

### Collaborators
* Steve Nagle
* Pat Gaston
* Elijah Ginter

### Overview
This application circumvents the expensive process of formally assembling a focus group and connects businesses directly with it's target demographic.


### Requirements
Below are a list of features for this group project. The scope of the project is not limited to, but must contain these features. It is important to get the basic functionality down before moving on to the more advanced topics.

**Feature sets will include:**
* A fully developed database schema. The database must be connected to your Java code using JPA.

* Our friend C.R.U.D, this time manipulating objects and saving them in an appropriate database table.

* A user log in, which is authenticated by a mySQL table. There should be different permission levels for the users, one admin that can add/update/delete content present on the site.

* A correct implementation of a session object, this can be used to track a logged in user and any changes they make (for example, a shopping cart or favorites list).

* A way to track an individual users previous experiences on the site. For example if it is a food ordering system, a list of previous orders.

### TODO:
##### Milestone #1: Set roles, configure tools and determine a plan. (Do this together)
* (One of you) create a public Github repository and invite your teammates as collaborators.
* Write a README.md file for your repository ([Markdown Cheatsheet][mdcheat]). Include:
    * Your names (or at least usernames).
    * The technologies you want to use.
    * Why you are building the application.
    * The methodologies you are using to build the application (group project, agile etc).
* Create a `.gitignore` file, and include the following in it:
  * .DS_Store
  * target
  * build
* Create a [Trello][trello] board and invite your teammates to it.
* Develop user stories from the requirement and add them to your Trello icebox.
* Build a wireframe for your site together. (So that you are all on the same page -- [more info on how to do that here][wireframe])
* Slack a link to your Trello board, repository and your wireframe to Andrew. (This counts as submitting your proposal)

##### Milestone #2: Schema developed and tested
* Determine the relationships you will need for your database. Draw a schema that you will use for reference as you develop your application and distribute it to your team.
* Create and populate your database.
* Check that your relationships are correct with queries.
* Create a dump file to roll your database back to in the event that your lose data integrity.

##### Milestone #3: Basic UI functionality (MVP)
* Pages are served by a SpringMVC application.
* Pages link together according to requirement.
* Basic styles and site architecture are present.
* Users can login.
* There are different user permission levels (one admin).
* Application is deployed to AWS.  

##### Milestone #4: Dynamic application functionality
* Content is served from a mySQL database via your Spring MVC Controller.
* You have a Dao interface and JpaDao class that implements it.
* Content can be created, read, updated, and deleted (remember CRUD?) and be persisted to your database.
* Application is deployed to AWS.  
