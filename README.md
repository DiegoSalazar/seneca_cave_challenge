# Seneca Cave Challenge

This repo houses my solution to the challenge described below.

## Original Instructions

This is the exercise we give to full-stack engineering candidates here at Seneca Systems.

At its heart, it's conceptually very simple. You'll be given a set of randomly generated
two-dimensional "caves" whose tiles represent point values. A sample cave might look like
this:

.2.1.33.s.7.p
.7.71.6.2.63.
3551...9.....
.745668.7.2..
5..45...p..4.
8..4p.529..99
85...2.5....9
..1..69.....3
28.16p1.83.5.
2....7.....9.
.1.p.......58
.pp3...p5..61
...2...6p.769
....3.7.633.p
.......585..5

1-9 = points, which you get for traveling over
p   = pickaxe, which doubles point values from then on. Pickaxes are cumulative
s   = starting point, which is where your journey begins
.   = empty tile

You'll also be given a limited number of moves to make, and you can only travel
over each tile once.

Your job is to write code that starts at "s" and picks a route that generates the most
points you can pick up in the number of moves given. The route must be given as a string
of moves to make from the starting point, like `dddlulurru` where

l = left
r = right
u = up
d = down

In order to pass the challenge, you must score no less than 75% of the reference score,
as determined using POST /attempts/solve, detailed below. Your script should run in less
than one minute for any given set of inputs.

## API

There are four API endpoints you can use to complete your challenge:

```
  POST /attempts/start

    Description
      Generates a new challenge attempt.

    Request
      name: Your name
      email: Your email address

    Response
      email: Same as above
      name: Same as above
      token: Identifier for this challenge attempt
      challenge: Base64-encoded JSON string described in the Challenge Object section
      started_at: ISO 8601 timestamp for when this attempt started in UTC

    Example request
      {
        "email": "nick@seneca.systems",
        "name": "Nick DeMonner"
      }

    Example response
      {
        "email": "nick@seneca.systems",
        "name": "Nick DeMonner",
        "token": "3G1uCjk6SAUzw6ugqyynv9",
        "challenge": "W3sid2lkdGgiOjQsImhlaWdodCI6NiwibW92ZXMiOjE...",
        "started_at": "2016-09-11T18:28:52Z"
      }

```

```

  GET /attempts/:token

    Description
      Fetches a given attempt by token in case you misplace it the first time.

    Request
      token: Your name

    Response
      See POST /attempts/start

    Example request
      GET /attempts/3G1uCjk6SAUzw6ugqyynv9

    Example response
      See POST /attempts/start

```

```
  POST /attempts/solve

    Description
      Solves the challenge using the reference solver implemented on the server.
      Use this endpoint to get an idea of what kind of score the server is looking
      for in order to pass. Don't try to simply submit the solution returned as your
      own--we'll run your script to make sure its output matches the solution you
      submit.

    Request
      token: Attempt identifier

    Response
      solution: A set of comma-delimited solution strings, one string for each cave
      challenge: Base64-encoded JSON string described in the Challenge Object section
      started_at: ISO 8601 timestamp for when this attempt started in UTC

    Example request
      {
        "token": "3G1uCjk6SAUzw6ugqyynv9",
      }

    Example response
      {
        "solution": "dddluluuuu,rrdru,ddlluruuuluuurrdrdrrurulul...",
        "score": 63893912,
        "run_time": "0.42037499999999994 seconds"
      }

```

```
  POST /attempts/finish

    Description
      This is the most important endpoint, because you'll use it to post your
      generated solution. We'll review the `script` used, so be sure to include
      `instructions` if executing it isn't straight forward.

    Request
      token: Attempt identifier
      script: Base64-encoded script file which takes a file

    Response
      solution: A set of comma-delimited solution strings.
      challenge: Base64-encoded JSON string described in the Challenge Object section
      started_at: ISO 8601 timestamp for when this attempt started in UTC

    Example request
      {
        "token": "4P24rVR5MK6b8HRXW4UOT6",
        "script": "Y2xhc3MgQ2F2ZVNvbHZlcgogIGNsYXNzIFRvb01hbnlNb3Zlcy...",
        "solution": "uuurddrrruru,rrdrruullllllldddrddrurr,lluulllluld...",
        "instructions": "Move `script` into a file called...",
        "language": "ruby"
      }

    Example response
      {
        "reference_score": 54726889,
        "player_score": 47145384,
        "passed": true
      }
```

## Challenge Object

Once base64-decoded, the challenge value is an array of objects with the following shape:


```javascript
  {
    "layout": ".2.1.33.s.7.p,.7.71.6.2.63.,3551...9.....",
    "width": 13,
    "height": 15,
    "moves": 8
  }
```

 - **layout:** a series of comma-delimited rows, where the number of rows equals the height of the cave
  - **width:** length of each row of the cave
  - **height:** number of rows in the cave
  - **moves:** max length of the solution string you're allowed to generate for this cave

## Endgame

Once you've POSTed /attempts/finish to the server, just email nick@seneca.systems
to let us know to review your solution! You may start many attempts on the same email
address, but we'll only count your first `finish` for the purposes of passing the
exercise.

Don't spend too much time on this challenge, or overthink it much. Focus on algorithms,
not language or concurrency/parallelism. The reference solver is quite naive, written in
Ruby with almost no optimization, and still runs reasonably fast.