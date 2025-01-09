# Actions

You can get actions at `/games/<game_id>/actions`. This result is paginated and
defaults to recent events first. All variants are included by default.

``` json
"TBD"
```

You can get information about a single action with `order: α` and `variant: β`
at `/games/<game_id>/actions/α?variant=β`:

``` json
{
  "game": "<game_id>",
  "player": "<player_betty_id>",
  "order": 5,
  "variant": 0,
  "current" true,
  "action": {
    "type": "MOVE",
    "from": "clearing_1",
    "to": "clearing_2",
    "warriors": 3,
  },
  "parent": { "order": 4, "variant": 0 },
  "siblings": [{ "order": 5, "variant": 2 }, { "order": 5, "variant": 1 }],
  "log": [{
    "text": "Ada made a great play as the cats",
    "client": "Ada made a great play as |cat|"
  }],
  "created_at": "2024-06-13T09:41:00+00:00",
}
```

You can also view the tree of actions without any details at
`/games/<game_id>/tree` which results in something like:

``` json
{
  "actions": 5,
  "variants": 2,
  "tree": [
    [{ "order": 0, "variant": 0, "current": true }],
    [{ "order": 1, "variant": 0, "current": true }],
    [{ "order": 2, "variant": 0, "current": true }],
    [{ "order": 3, "variant": 0, "current": true }, { "order": 3, "variant": 2 }],
    [{ "order": 4, "variant": 0, "current": true }, { "order": 4, "variant": 2 }],
    [{ "order": 5, "variant": 0, "current": true }, { "order": 5, "variant": 2 }, { "order": 5, "variant": 1 }],
  ]
}
```
