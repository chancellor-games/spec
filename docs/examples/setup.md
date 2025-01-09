# Setup

Ada's client first requests some random data:

``` json
{
  "type": "random",
  "request": ["[1-24]", "[1-5)", "8x2d6"]
}
```

and any connected clients to this game will receive the response:

``` json
{
  "type": "random",
  "id": "<random_result_0_id>",
  "action": 0,
  "current": true,
  "variant": 0,
  "request": ["[1-24]", "[1-5)", "8x2d6"]
  "result": [14, 4, [5, 8, 7, 2, 12, 12, 9, 7]],
  "sig": "<random_result_0_sig>",
}
```

Ada's client then uses this result to make the initial game state and sets it:

``` json
{
  "type": "setup",
  "state": {...},
  "state_hash": "<sha_256_state_hash>",
  "log": [{
    "text": "Ada starts as the Marquise de Cat",
    "client": "Ada starts as |cat|",
  },{
    "text": "Betty starts as the Eyrie Dynasty",
    "client": "Betty starts as |eyrie|",
  },{
    "text": "Carol starts as the Woodland Alliance",
    "client": "Carol starts as |woodland|",
  }]
}
```

Messages of `"type": "setup"` can be thought of as creating action `0`. It's
only valid when a game is in the `setup` state and can't be undone. It is the
oldest undo target. Now that initial state is setup the game can begin.

All connected clients get a started message changing the game state to `active`:

``` json
{
  "type": "started",
  "game": {
    "id": "<game_id>",
    "name": "Ada's Fun Root Game",
    "state": "active",
    "seed": "<seed>",
    "created_by": "<player_ada_id>",
    "created_at": "2023-06-13T09:41:00+00:00",
    "actions": 0,
    "variants": 0,
  },
  "state": {...},
  "state_hash": "<sha_256_state_hash>",
  "log": [{
    "text": "Ada starts as the Marquise de Cat",
    "client": "Ada starts as |cat|",
  },{
    "text": "Betty starts as the Eyrie Dynasty",
    "client": "Betty starts as |eyrie|",
  },{
    "text": "Carol starts as the Woodland Alliance",
    "client": "Carol starts as |woodland|",
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
