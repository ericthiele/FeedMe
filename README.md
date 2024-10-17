# FeedMe
This is my response to the Engineering Challenge - https://github.com/peck/engineering-assessment?tab=readme-ov-file

Reviewing the links supplied at the bottom of the challenge, 
I noticed that the page at https://data.sfgov.org/Economy-and-Community/Mobile-Food-Facility-Permit/rqzj-sfat/data 
had a tab for Developers - https://www.sf.gov/resource/2023/open-data-developer-resources

So I'm choosing to NOT reinvent the wheel of creating a database.
I'll use API requests to request data as needed.

My vision is a mobile app that plots the food trucks on a map of San Francisco
and a search interface that allows the user to filter the food trucks displayed,
based on:
- truck or push cart
- type of food (taco, seafood, etc)
- is current time within hours of operation?

# Future enhancements:
- supply walking directions to selected food truck
- support for cities other than San Francisco
- place orders on line
- picture of the selected truck, so user knows what they're hunting for
- picture of cook(s)?
- monetize app with food truck ads
- supply link to Yelp to provide review on the selected truck

# Implementation choices

I've never written a mobile app, this is a stretch goal.

I'm going to use:
- MacBook Pro
- python
- React Native
- target iPhones initially, so using Xcode

# Getting Started

- Setup your local Dev environment
  - Install Homebrew if you haven't already\
  `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
  - Install Nodejs\
  `brew install node`
