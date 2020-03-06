# Welcome to our weatherApp project!

## Getting Started

To get started, go ahead and clone this repository to the location of your choosing by doing the following:

```
$ git clone https://github.com/adao88/weatherApp.git
```

You will also need an API key for Google Maps and the AccuWeather. Within the `home.ejs` and `userHome.ejs` files, you will have to provide your API. They are marked in the file for your convenience. If you search the document for `*** USE YOUR API KEY HERE ***`, you can find all the locations you have to place your respective API key. You will only have to replace the Google Maps API key at the end of the document. The rest are the AccuWeather API keys. NOTE: when replacing some of the AccuWeather API keys, only replace the text between `apikey=` and `&q`. Please see the image below as a reference.

![API Key Replace](/public/img/replace_key.png)

## Running Locally

Make sure you have [Node.js](http://nodejs.org/) and the [Heroku CLI](https://cli.heroku.com/) installed.

```
$ npm install
$ npm start
```

then

```
$ heroku local web
```

Your app should now be running on [localhost:5000](http://localhost:5000/).
To navigate to the home page, go to [localhost:5000/home](http://localhost:5000/home).

If everything worked properly, it should look like this...
![Home Screen](/public/img/homescreen.png)

If you want to log in or create an account, you can do so at the top in the navbar. The application should work regardless of if you have an account or not.

## Searching

To search for a location, simply type the location you are interested in. Click the location and then press the search icon. The map should display the location you searched. A side-panel should also have appeared to display the weather information of the place you searched.

![Searching](/public/img/searching.gif)

## Adding and deleting markers

If you wish to keep track of a given location, you can add that location by clicking the Track This Location button. Similarly, if you want to remove that location, you can remove it with the red button.
![Searching](/public/img/add_delete.gif)

That is all the functionality this application has. Hopefully it works for you :)

## Deploying to Heroku

```
$ heroku create
$ git push heroku master
$ heroku open
```

or

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Documentation

For more information about using Node.js on Heroku, see these Dev Center articles:

- [Getting Started with Node.js on Heroku](https://devcenter.heroku.com/articles/getting-started-with-nodejs)
- [Heroku Node.js Support](https://devcenter.heroku.com/articles/nodejs-support)
- [Node.js on Heroku](https://devcenter.heroku.com/categories/nodejs)
- [Best Practices for Node.js Development](https://devcenter.heroku.com/articles/node-best-practices)
- [Using WebSockets on Heroku with Node.js](https://devcenter.heroku.com/articles/node-websockets)
