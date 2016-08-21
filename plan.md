Models
  User
    Has many conversations
    has many posts
    has the following attributes:
      Required:
        username
        password
        email
      Optional:
        age
        location
        image_url
        number of posts
        moderator/admin

  conversation
    Belongs to a User
    Has many posts
    Has an OP

  Post
    Belongs to a User
    Belongs to a conversation
    Has a time_created and time_modified

Controllers
  User
    Sign up
    Log in
    Log out
    Users index(mod only)
    Ban/unban(mod only)
    Profile page
    User's conversations
    User's posts
    Edit profile
    Delete account(user and admin only)

  conversation
    conversation index
    Individual conversation
    New conversation
    Edit OP

  Post
    post reply
    edit post (owner and mod only)
    Delete post (owner and mod only)

Views
  User
   signup form
   login form
   profile page
   all conversations from user
   all posts from user
   edit profile form
   users index


  conversation
    conversation index
    individual conversation (include new post form)
    edit/delete OP form

  Post
    Edit post
