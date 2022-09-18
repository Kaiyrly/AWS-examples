# Authentication

Todo app implemented using basic flutter features and uses AWS Amplify datastore to save the todolist in database, and sync data between database and local machine.

This app is implemented using basic flutter features and uses AWS Amplify authentication to sign up and sign in the user

## References

* This example uses the same example code provided on this website, https://docs.amplify.aws/lib/auth/signin/q/platform/flutter/#register-a-user


## Features used in the example

### Sign up the user

To sign up the user , we pass the user data to Amplify.Auth.signUpUser()

### Confirm the user

To confirm the user’s email , we pass the confirmation code to Amplify.Auth.confirmUser()

### Sign in

To sign in, we pass login information to Amplify.Auth.signInUser


##Complatibility test

| Android Emulator | ios Emulator| macOs (12.5.1)| Chrome |
|:--------------|:--------------:|:--------------:|:--------------:|
|O|?|x|O|
