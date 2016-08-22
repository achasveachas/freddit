Models
  User
    Has many conversations -x
    has many posts -x
    has the following attributes:
      Required:
        username -x
        password -x
        email -x
      Optional:
        age -x
        location -x
        image_url -x
        number of posts -x
        moderator/admin -x

  conversation
    Belongs to a User -x
    Has many posts -x
    Has an OP -x

  Post
    Belongs to a User -x
    Belongs to a conversation -x
    Has a time_created and time_modified -x

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
