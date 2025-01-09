# Game Creation

In this example we'll assume the players are playing on a web client hosted at
`https://client` and using a Game API server hosted at `https://server`.

Ada goes to their client's homepage and creates a new game. They get asked
questions (game dependent) about player count and other game options.

At that point their client will send a POST request to `https://server/games` to
request a new game. The body of this request needs to have some basic server
settings about players:

``` json
{
  "game": {
    "name": "Ada's Fun Root Game",
  },
  "players": [{
    "name": "Ada",
    "faction": "cat",
    "color": "orange"
  },{
    "name": "Betty",
    "faction": "eyrie",
    "color": "blue"
  },{
    "name": "Carol",
    "faction": "woodland",
    "color": "green"
  }]
}
```

The server responds with some data that will help the game client setup initial
state:

``` json
{
  "game": {
    "id": "<game_id>",
    "name": "Ada's Fun Root Game",
    "state": "setup",
    "seed": "<seed>",
    "created_by": "<player_ada_id>",
    "created_at": "2023-06-13T09:41:00+00:00",
    "actions": 0,
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
    "urls": {
      "actions": "https://server/games/<game_id>/players/<player_ada_id>",
      "events": "https://server/games/<game_id>/players/<player_ada_id>/events"
    }
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
    "urls": {
      "actions": "https://server/games/<game_id>/players/<player_carol_id>",
      "events": "https://server/games/<game_id>/players/<player_carol_id>/events"
    }
  }]
}
```

We can see that the game and each player received an ID. The game had some
metadata created including a `seed` value. When creating a game you can specify
a `seed` value as part of the initial game request if you want.

Each player also received an `seat` number. This number is random and the
clients don't have to use it, but it could be useful to help setup some games.

The current state of the game is `setup` which means the server needs an initial
state from the creating player.
