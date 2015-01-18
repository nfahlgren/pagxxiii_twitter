library(twitteR)
library(ROAuth)
library(ggplot2)

# Set working directory
setwd('~/Scripts')

# Load previously saved credentials (see README)
load("cred.RData")

# Check authorization
registerTwitterOAuth(cred)

# Search Twitter for the #PAGXXIII hashtag (I found 7434 tweets)
tweets <- searchTwitter("#PAGXXIII", n=9999)

# Convert the list to a data frame
tweets <- twListToDF(tweets)
tweets <- unique(tweets)

# Make a table of the number of tweets per user
pag.tweets <- as.data.frame(table(tweets$screenName))
names(pag.tweets) <- c("User", "Tweets")

# Order the table by number of tweets per user
pag.tweets <- pag.tweets[with(pag.tweets, order(-Tweets)), ]

# Plot tweets per user for users with 30+ tweets
ggplot(data=pag.tweets[pag.tweets$Tweets >= 30, ], aes(x=reorder(User, Tweets), y=Tweets)) +
  geom_bar(stat='identity') +
  coord_flip() +
  scale_y_continuous("Tweets") +
  scale_x_discrete("User") +
  labs(title="#PAGXXIII tweets per user") +
  theme_bw() +
  theme(axis.title = element_text(face="bold"))

# Plot tweets per hour
ggplot(data=tweets, aes(x=created)) +
  geom_bar(binwidth=60*60) +
  scale_x_datetime("Date-time") +
  scale_y_continuous("Tweets") +
  labs(title="#PAGXXIII tweets per hour") +
  theme_bw() +
  theme(axis.title = element_text(face="bold"))
