# FeedMe
This is Eric Thiele's response to the [Engineering Challenge](https://github.com/peck/engineering-assessment?tab=readme-ov-file)

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
- pip
- Kivy

# Getting Started

- Running `make`:
  - will set up your local Dev environment
    
- Running `make run`
  - **STILL UNDER CONTRUCTION**
  - launch the app in the iPhone simulator

- Setting up your local Dev environment includes
  - Installs **Homebrew** on a Mac, if you haven't already
  - Installs **python**, **pip**
  - Creates **FeedMeEnv** - a Python Virtual environment
  - Installs **kivy-ios** in that Virtual environment - more info [here](https://kivy.org/) and [here](https://github.com/kivy/kivy-ios)
 
# Pencils Down - for now...

I've bitten off more than I can chew in a couple of days.

I *think* this proves I have some skills.  Dunno if it's enough to "move forward" with interview process.

# My thought process...

Given such an open ended challenge, and my desire to impress - I figured an interactive mobile app was definitely the way to go.

- Initially thought I'd head down the NodeJS / React path.
- Realized that was going to be WAY too steep a learning curve.
- I searched for Python-based frameworks, and found several references to Kivy.  Why Python?  I feel stronger in Python than Elixir. Yes, I'm aware EL is an Elixir shop.
- I did some of the basics of setting up a new GH repo, setting up my personal token at GH, setting up a Makefile to incorporate a Virtual Environment for Python
- I cobbled together some code 
- I found the correct API endpoint for the SF food truck data
- And then I proceeded to fall flat on my face.  The interactive map functionality was dependent on a kivy/MapView module.  Or is it kivy_garden/Mapview?  I've spent a lot of time butting my head against this wall, of how to properly get the module installed & *visible* to my **feedme.py** app.  A bit of a rabbit hole.  Conflicting build docs.  Stack Overflow and other places weren't much help.  Then I noticed that the docs for mapview are over 2 years old.  <sigh> 

Looks like I bet on the wrong stack.  Eventually, I'm sure I can be successful.  I would just have to dive fully into learning how to use Xcode to build the entire Kivy project.

But it looks like that could be several more days of trial & error.

I've already spent probably 16 hours without anything I'd call success.
I *HAVE* learned things I didn't know 4 days ago.  So not a total loss.

I hope we move forward.
I won't be surprised if we don't
