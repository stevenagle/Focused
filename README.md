# Focused
Java/JDBC/JPA/SQL/Hibernate Group Project

## Full Stack Group MVC Project

### Technologies
* Spring MVC
* JPA
* MySQL
* HTML/CSS

### Collaborators
* Steve Nagle (http://github.com/stevenagle)
* Pat Gaston (http://github.com/patgaston3)
* Elijah Ginter (http://github.com/eginter)

### Overview
This application circumvents the expensive process of formally assembling a focus group and connects businesses directly with it's target demographic.  Focused is an online Focus Group connection web-app.


### Requirements
Below are a list of features for this group project. The scope of the project is not limited to, but must contain these features. It is important to get the basic functionality down before moving on to the more advanced topics.

**Feature sets will include:**
* A fully developed database schema. The database must be connected to your Java code using JPA.

* Our friend C.R.U.D, this time manipulating objects and saving them in an appropriate database table.

* A "Reviewer" log in, which is authenticated in the MySQL database and which fetches and serves a unique view and functionality set for the program.  Reviewers are able to view posted products, separated into "rated" and "unrated" product sets, and view the product-features that "Companies" submit. They are then able to rate (1 through 5) the product-features.  Rated products are updated in the database and returned to "Companies" for their viewing.  Reviewers have session objects implemented for them to prevent issues, persist changes/views, and utilize a session-based shopping cart feature that can track items that they've placed into a shopping cart.  Reviewers can edit their personal details, rate product-features, and browse a rewards shopping cart.

* A "Company" log in, which is also authenticated in the MySQL database and which fetches and serves a unique company-based view and functionality set for the program.  Companies are able to post products and their related features for the Reviewers to rate, and companies are able to see the aggregate average scores of each product which has been rated.  Companies can add new products, add new features, edit existing products and features, remove products and features, edit their company details. 
