# Ohiru

What's for lunch at Heroku this week? Find out at
[lunch.herokuapp.com](http://lunch.herokuapp.com) or use the
[API](http://lunch.herokuapp.com/lunches.json):

```sh
curl -H 'Accept: application/json' http://lunch.herokuapp.com
```

## Dev

Lunch requires the environment variable `CALENDAR_URL` to be set to your lunch
calendar iCal feed.

```sh
npm install
foreman start
```
