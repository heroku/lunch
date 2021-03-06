ical = require('ical')

Date::getWeek = ->
  onejan = new Date(@getFullYear(), 0, 1)
  Math.ceil (((this - onejan) / 86400000) + onejan.getDay() + 1) / 7

Date::getDayOfYear = ->
  d = new Date(@getFullYear(), 0, 0)
  Math.floor (this - d) / 8.64e+7

class Ohiru

  constructor: ->
    @lunchUrl = process.env.CALENDAR_URL

  getLunches: (cb) ->
    ical.fromURL @lunchUrl, {}, (err, data) ->

      lunches = []
      thisWeek = (new Date()).getWeek()
      thisYear = (new Date()).getYear()
      today = (new Date()).getDayOfYear()

      # Find this week's lunches
      for key, lunch of data
        lunchDay = new Date(lunch.start).getDayOfYear()
        lunchWeek = new Date(lunch.start).getWeek()
        lunchYear = new Date(lunch.start).getYear()
        if lunchWeek is thisWeek and lunchYear is thisYear
          l =
            summary: lunch.summary
            description: lunch.description
            date: lunch.start
          l.today = true if lunchDay is today
          lunches.push(l)

      # Sort lunches chronologically
      lunches.sort (a, b) ->
        time_a = a.date.getTime()
        time_b = b.date.getTime()
        if time_a is time_b then 0 else if time_a < time_b then -1 else 1

      cb(lunches)

exports.init = () ->
  new Ohiru()
