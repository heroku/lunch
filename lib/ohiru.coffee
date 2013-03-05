ical = require('ical')

Date::getWeek = ->
  onejan = new Date(@getFullYear(), 0, 1)
  Math.ceil (((this - onejan) / 86400000) + onejan.getDay() + 1) / 7

class Ohiru

  constructor: ->
    @lunchUrl = "http://www.google.com/calendar/ical/heroku.com_u7jak60ob03hhe8h79mdncs2a0%40group.calendar.google.com/public/basic.ics"

  getLunches: (cb) ->
    ical.fromURL @lunchUrl, {}, (err, data) ->

      lunches = []
      thisWeek = (new Date()).getWeek()
      thisYear = (new Date()).getYear()

      # Find this week's lunches
      for key, lunch of data
        lunchWeek = new Date(lunch.start).getWeek()
        lunchYear = new Date(lunch.start).getYear()
        if lunchWeek is thisWeek and lunchYear is thisYear
          lunches.push
            summary: lunch.summary
            description: lunch.description
            date: lunch.start

      # Sort lunches chronologically
      lunches.sort (a, b) ->
        time_a = a.date.getTime()
        time_b = b.date.getTime()
        if time_a is time_b then 0 else if time_a < time_b then -1 else 1

      cb(lunches)

exports.init = () ->
  new Ohiru()