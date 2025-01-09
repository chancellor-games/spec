# Log

You can get the full game log with `/games/<game_id>/log`:

``` json
{
  "game": {
    "id": "<game_id>",
    "name": "Ada's Fun Root Game",
    "state": "setup",
    "seed": "<seed>",
    "created_by": "<player_ada_id>",
    "created_at": "2023-06-13T09:41:00+00:00",
    "actions": 2,
    "variants": 0
  },
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
  },{
    "action": { "order": 2, "variant": 0, "current": true },
    "text": "Carol crafts a Sword",
    "client": "Carol |woodland| crafts a |sword|",
  },{
    "action": { "order": 2, "variant": 0, "current": true },
    "text": "Carol earns 2 points",
    "client": "Carol |woodland| earns 2 |points|",
  },{
    "action": { "order": 2, "variant": 0, "current": true },
    "text": "Carol wins the game with 30 points!",
    "client": "Carol |woodland| wins the game with 30 |points|! |party|",
  }]
```
