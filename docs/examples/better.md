# Betty's Turn

Let's pretend that Betty only joins the game at this point by being sent a URL
from Ada. Ada's client generated a url for Betty that was something like:
`https://client/games/<game_id>/players/<player_betty_id>`.

> [!NOTE]
> We don't actually care what this URL looks like since it's on the
> client. Somehow the client needs to learn what the `<game_id>` and
> `<player_betty_id>` are. It doesn't matter how.

When Betty loads this URL her client will first request some information from
the Game API server by sending a GET request to
`https://server/games/<game_id>/players/<players_betty_id>` which will return:

``` json
{
  "game": {
    "id": "<game_id>",
    "name": "Ada's Fun Root Game",
    "state": "active",
    "seed": "<seed>",
    "created_by": "<player_ada_id>",
    "created_at": "2023-06-13T09:41:00+00:00",
    "actions": 1,
    "variants": 0,
    "urls": {
      "events": "https://server/games/<game_id>/events"
    }
  },
  "players": [{
    "id": "<player_ada_id>",
    "name": "Ada",
    "seat": 1,
    "faction": "cat",
    "color": "orange",
  },{
    "id": "<player_betty_id>",
    "name": "Betty",
    "seat": 2,
    "faction": "eyrie",
    "color": "blue",
    "urls": {
      "actions": "https://server/games/<game_id>/players/<player_betty_id>",
      "events": "https://server/games/<game_id>/players/<player_betty_id>/events"
    }
  },{
    "id": "<player_carol_id>",
    "name": "Carol",
    "seat": 3,
    "faction": "woodland",
    "color": "green",
  }]
}
```

She will then connect to the `events` url and get the following message:

``` json
{
  "type": "connected",
  "game": {
    "id": "<game_id>",
    "name": "Ada's Fun Root Game",
    "state": "active",
    "seed": "<seed>",
    "created_by": "<player_ada_id>",
    "created_at": "2023-06-13T09:41:00+00:00",
    "actions": 1,
    "variants": 0,
  },
  "state": {...},
  "state_hash": "<sha_256_state_hash>",
  "log": [{
    "action": { "order": 0, "variant": 0, "current": true },
    "text": "Ada starts as the Marquise de Cat",
    "client": "Ada starts as |cat|",
  },{
    "action": { "order": 0, "variant": 0, "current": true },
    "text": "Betty starts as the Eyrie Dynasty",
    "client": "Betty starts as |eyrie|",
  },{
    "action": { "order": 0, "variant": 0, "current": true },
    "text": "Carol starts as the Woodland Alliance",
    "client": "Carol starts as |woodland|",
  },{
    "action": { "order": 1, "variant": 0, "current": true },
    "text": "Ada moves three warriors from clearing A to clearing B",
    "client": "Ada moves 3x|cat| from |clearing_1| to |clearing_2|",
  }]
  "players": [{
    "id": "<player_ada_id>",
    "name": "Ada",
    "seat": 1,
    "faction": "cat",
    "color": "orange",
  },{
    "id": "<player_betty_id>",
    "name": "Betty",
    "seat": 2,
    "faction": "eyrie",
    "color": "blue",
  },{
    "id": "<player_carol_id>",
    "name": "Carol",
    "seat": 3,
    "faction": "woodland",
    "color": "green",
  }]
}
```

The state tells her client that Betty is up next (how is game dependent). For
sake of argument we're goign to pretend that the only action available to her on
her turn is to make an attack. Her attack needs a random result from the
server. The first thing she does is request it by sending this message:

``` json
{
  "type": "random",
  "request": ["2x1d4"]
}
```

A client should always request ALL of the random data it needs at one time (for
a single action) in one request. The request field supports an array of
requests. One simple format of a request is the one shown above: `<α>x<β>d<γ>`
which means "Give me α different results of rolling a γ sided-die β times and
summing the results". This should be suitable for many different games. Other
request types (which might mean using full JSON objects instead of a simple
string) may be supported in the future.

The server then sends a random result to all clients:

``` json
{
  "type": "random",
  "id": "<random_result_2_id>",
  "action": {
    "order": 2,
    "variant": 0,
    "current": true
  },
  "request": ["2x1d4"],
  "result": [3, 2],
  "sig": "<random_result_2_sig>",
}
```

This random result is saved on the server related to action `2`. There can only
be one random request per action. It by definition doesn't change the state but
is saved and signed by the server so that all clients can tell that the server
generated it.

Betty's client then uses that information to create her action and send it:

``` json
{
  "type": "action",
  "state": {...},
  "state_hash": "<sha_256_state_hash>",
  "action": {
    "type": "ATTACK",
    "in": "clearing_3",
    "player": "<player_carol_id>"
  },
  "log": [{
    "text": "Betty attacks Carol in clearing C",
    "client": "Betty |eryie| attacks Carol |woodland| in |clearing_3|",
  }]
}
```

All clients now get a new action message:

``` json
{
  "type": "action",
  "player": "<player_betty_id>",
  "order": 2,
  "current" true,
  "variant": 0,
  "state_hash": "<sha_256_state_hash>",
  "action": {
    "type": "ATTACK",
    "in": "clearing_3",
    "player": "<player_carol_id>"
  },
  "log": [{
    "text": "Betty attacks Carol in clearing C",
    "client": "Betty |eryie| attacks Carol |woodland| in |clearing_3|",
  }]
}
```

Since all clients will already have the random information associated with this
action they should all be able to verify their state matches the hash.
