# pagxxiii_twitter
Twitter analysis of PAGXXIII

I thought it would be fun to learn how to analyze data from Twitter by looking at the #PAGXXIII hashtag. The code here is based off of the this post by Stephen Turner http://gettinggeneticsdone.blogspot.com/2012/07/plotting-frequency-of-twitter-hashtag.html

I used the twitteR and ROAuth packages. In this implementation you have to go to https://apps.twitter.com/ to create an app that is used for authentication. After you create an app, navigate to the Keys and Access Tokens tab to find the consumer key and consumer secret values.

As a one-time setup you create authentication credentials.

```R
# One-time authentication setup
library(twitteR)
library(ROAuth)

# Set working directory
setwd('~/Scripts')

# Authenticate with Twitter app
cred <- OAuthFactory$new(consumerKey="xxxxxxxxx",
                         consumerSecret="xxxxxxxxx",
                         requestURL="https://api.twitter.com/oauth/request_token",
                         accessURL="https://api.twitter.com/oauth/access_token",
                         authURL="https://api.twitter.com/oauth/authorize")
# Talk to the Twitter API
cred$handshake()

# After entering this command you will see:
# To enable the connection, please direct your web browser to: 
# https://api.twitter.com/oauth/authorize?oauth_token=xxxxxxxxxxx
# When complete, record the PIN given to you and provide it here:

# Go to the provided link (or you may be directed there automatically).
# Click the authorize button and copy the provided PIN.
# Enter the PIN into the R console to complete the authentication.

# Save the credentials so that you can skip these steps later
save(cred, file="~/Scripts/cred.RData")
```

The rest of the code is in the included R script
