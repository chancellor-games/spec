# Game Meta Data

The metadata for a game can be retrieved at `/games/<game_id>`. This will return
something like:

``` json
{
  "game": {
    "id": "<game_id>",
    "name": "Ada's Fun Root Game",
    "state": "setup",
    "seed": "<seed>",
    "created_by": "<player_ada_id>",
    "created_at": "2023-06-13T09:41:00+00:00",
    "actions": 98,
    "variants": 2,
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

In this example all root fields in the `game` object are required and managed by
the API itself. In the player objects only `id` is required. `index` is created
by the API (a random player ordering that can be used by the games if
needed). `name` is optional and most clients should set it. Fields like
`faction` and `color` are just created by the game client for their game. A lot
of objects in the Game API support any extra fields on objects to support game
features.
