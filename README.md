Logbot
======

Logbot keeps a record of all messages sent on your IRC server. This means that you don't have to miss out on IRC conversations that happened when you were offline.

Installation
---------
Logbot needs to be hosted so that it can recieve messages from your IRC channel. You can use Heroku.

### Create a Heroku App

```bash
$ git clone git@github.com:nilenso/logbot.git
$ cd logbot
$ heroku create
$ git push heroku master
```

### Set up Postgres
  

```bash
$ heroku addons:add heroku-postgresql:dev
$ heroku pg:wait
$ heroku config | grep HEROKU_POSTGRESQL

# The previous command should show you something like HEROKU_POSTGRESQL_GREEN_URL.
# Use this for the next command.

$ heroku pg:promote HEROKU_POSTGRESQL_GREEN_URL
```

### Deploy

```bash
$ git push heroku master
```

Send IRC Messages to Logbot
---------------------

### Webhook

Now that you have Logbot set up, you need to send all your IRC messages to it.

Logbot accepts `POST` requests at the `/api/messages` endpoint, with the following params:

| Property        | Type           | Description  |
| ------------- |:-------------:| -----|
| **body**      | Text | The body a single IRC message |
| **nick**      | String      |   The nickname of the user who sent the message |

### Hubot

If you use [Hubot](http://github.com/github/hubot), you're in luck. We wrote a script for Hubot that sends all messages over to a Logbot instance. You can grab the code for that [here](https://github.com/nilenso/nilensobot/blob/master/scripts/logbot.coffee).

Put it in a file called `logbot.coffee` inside the scripts folder of your Hubot. Then, tell Hubot where your Logbot server lives by setting the `LOGBOT_URL` config variable.
If you're using Heroku:

```bash
heroku config:add LOGBOT_URL=http://my-logbot-instance.herokuapp.com/
```

After you've done this, all your messages should be saved in your Logbot.

Credits
-------
Logbot was written by Timothy Andrew at [Nilenso Software LLP](http://nilenso.com)

[![Nilenso Logo](http://nilenso.com/images/nilenso_logos/nilenso-inverse.png)](http://nilenso.com)
