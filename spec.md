# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - This app is made using Sinatra
- [x] Use ActiveRecord for storing information in a database - ActiveRecord is used to connect to the database
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) - Includes a User, Conversation, and Post class
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - User has many conversations and posts. Conversations have many posts
- [x] Include user accounts - Has a User class that represents users
- [x] Ensure that users can't modify content created by other users - Makes sure unly users and moderators can modify user profiles, posts and conversations created by users.
- [x] Include user input validations - Makes sure conversations aren't created without a topic and at least one post and that posts aren't created without content
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) - incorporates flash messages when validations fail
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
