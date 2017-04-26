# Welcome to our Sample Tourist App, powered by XapiX

### Contents

1. [Intro](#Intro)
2. [Prerequisites for running the script](#prereqs)
3. [The script](#script)
4. [Errors](#fae)

<a name="Intro"></a>
### Intro

Thank you for checking out our quick-and-dirty script for using XapiX to handle multiple API calls! Please note that this script, written in Ruby, is very bare-bones and unglamorous. If you would like to change any part of it at all, feel free! This was designed to be a learning tool for XapiX, but we want you to get the most out of your experience. If you have a better way of running the script, or want to add or remove functionality on your own, please do so. This is for YOU!

The idea of this script is to show you just how useful Xapix can be and how much time it can save you when you need to integrate several API calls into an app. The script is a command line app that:

1. Asks you where you are in latitude and Longitude
2. Returns to you a list of names of nearby places (from the Foursquare API)
3. Asks you to pick one of these names for which you'd like to get reviews
4. Returns to you a group of reviews consisting of a text snippet of the review, the star rating, and the URL link, all from the Yelp API

If you arrived at this repo independently of reading our Tutorial on the Xapix Blog, you can find the tutorial [here](http://x.xapix.io/blog/tourist-tutorial). The tutorial will lead you step by step through preparing for and running this script.

<a name="prereqs"></a>
### Prerequisites for running the script

First, clone this repo (type "git clone https://github.com/eferrao/Tourist-App-Tutorial-Script.git" into the command line)

The script file, foursquare_yelp_script.rb, is written in Ruby. Therefore, you will need to have the latest version of Ruby installed on your machine in order to run it.

On a Mac, the easiest way to install Ruby is to use [Homebrew](https://brew.sh/) to install Ruby and/or RVM (Ruby version manager). You'll want to make sure Ruby 2.3 is on your computer.

You'll also need a text editor (such as Sublime Text or Atom) to edit the Ruby file, so you can add your authentication key in the right spot.

Lastly, you'll need a gem called 'HTTParty' to make the API calls in the script. From the directory in which you've downloaded/cloned this repo, type "gem install httparty". You may run into write permission errors here, which we will not get into here (Google is your friend!), but you can often use Sudo, if you have it, to get around this ("sudo gem install httparty" and enter your password when prompted).

On a PC, you'll most likely need to install a command line shell such as Git Bash or Babun in order to run the script and install the proper things from there.

In general, the [tutorial](http://x.xapix.io/blog/tourist-tutorial) will help you with this as well.

<a name="script"></a>
### The Script

Following the [tutorial](http://x.xapix.io/blog/tourist-tutorial), you'll first need to set up your XapiX project to prepare your API endpoints.

Retrieve your project's authentication token from the project dashboard. Open up the script file (foursquare_yelp_script.rb) in your text editor of choice. On line 12, you'll see a placeholder that says "INSERT YOUR XAPIX PROJECT KEY HERE!!". Copy and paste the token from the project dashboard to this spot, making sure it's still surrounded by quotes.  The whole line should look like this:

header = {"Accept" => "application/json", "Authorization" => "Foursquare_tester:wXIr37UhbHkZ5Ey2fc1z5dTunXXXXXXX" }

Save the file and exit, then simply run it from the command line in Terminal by typing in "ruby foursquare_yelp_script.rb". Follow the prompts and see the magic work!

<a name="fae"></a>
### Errors

As a bare-bones script that accesses many different things, you may find that things will occasionally go wrong and the script will break.

If anything does break, our first suggestion is to simply try again. There is absolutely no error catching protections in the script, so if something goes wrong for whatever indeterminable reason, it may just not happen again the next time. This may be due to either the Foursquare or Yelp APIs, the XapiX servers, any of the cloud services we use, or something else. Unfortunately there's no easy fix here as currently built.

Some common errors will be added here in the future.
