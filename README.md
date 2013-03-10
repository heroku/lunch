# Ohiru

What's for lunch at Heroku this week? Find out at
[lunch.herokai.com](http://lunch.herokai.com) or use the
[API](http://lunch.herokai.com/lunches.json):

```sh
curl -H 'Accept: application/json' http://lunch.herokai.com
```

## Dev

Lunch requires the environment variable `CALENDAR_URL` to be set to your lunch
**public** iCal feed.

```sh
npm install
foreman start
```
