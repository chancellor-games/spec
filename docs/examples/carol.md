# Carol's Turn

In our pretend game it's now Carol's turn (let's assume she's already connected)
and she decides to craft a card in her hand. Let's pretend this finishes the
game (in order to show an action that does more to the state than just a single
action):

``` json
{
  "type": "action",
  "state": {...},
  "state_hash": "<sha_256_state_hash>",
  "game": {
    "state": "finished",
    "winners": ["<player_carol_id>"]
  },
  "action": {
    "type": "CRAFT",
    "card": 45
  },
  "log": [
    {
      "text": "Carol crafts a Sword",
      "client": "Carol |woodland| crafts a |sword|",
    },
    {
      "text": "Carol earns 2 points",
      "client": "Carol |woodland| earns 2 |points|",
    },
    {
      "text": "Carol wins the game with 30 points!",
      "client": "Carol |woodland| wins the game with 30 |points|! |party|",
    }
  ]
}
```

You can see that she requests that the game is marked `finished` and the
`winners` field is set to an array of winning player ids.
