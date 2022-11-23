# NetworkManager

The network manager was created using Swift concurrency (async/awai). It can do the following:
- Log where username and password are coming in the form of `form-data`
- `HTTP GET`
- `HTTP POST`
- `HTTP PATCH`
- `HTTP PUT`
- `HTTP DELETE`
- In an event where a `401` is returned. Initial assumption is that the token has expired. The request is re-tried with new token

**Steps of authentication:**
  - Succesful
     - Recieve token from API
     - Store token in keychain // This needs to be called at login in the View
     - Store username in keychain (for token refresh) // This needs to be called at login in the View
     - Store password in keychain (for token refresh) // This needs to be called at login in the View
  - Failure:
     - Error `401` is thrown


**Note:**

- This package will not work as is. Currently its using `local host` for both live and debug environment. 
- The `login` method will return the Token only (at success). To store the items in keychain, you will have to use `LoginAuth.saveToken` or its alternatives.
- See https://github.com/Muhammed9991/swift-concurrency-network-manager for a dummy project with login and logout screen (need your own API at the moment, however you can check the implementation)
