# Ada's Turn

Ada's client alerts her that it's her turn. Let's pretend for demonstration
purposes that her only available action this turn is to do a single move. She
makes the choice in her client and it will send the message by posting it as the
body to the `actions` url for her player:

``` json
{
  "type": "action",
  "state": {...},
  "state_hash": "<sha_256_state_hash>",
  "action": {
    "type": "MOVE",
    "from": "clearing_1",
    "to": "clearing_2",
    "warriors": 3,
  },
  "log": [{
    "text": "Ada moves three warriors from clearing A to clearing B",
    "client": "Ada moves 3x|cat| from |clearing_1| to |clearing_2|",
  }]
}
```

The `state_hash` field is a client specific hash of the state generated after
this action is applied. The `state` field is the full state for the server to
save.

> [!TIP]
> The Game API doesn't care what method the clients use to hash the state as
> long as the result is a SHA-256 compatible (256-bit as 32-character
> hexidecimal) result.

The `action` field requires a `type` field. The value of `type` and the rest of
the fields are fully game dependent.

The `log` field requires an array of objects with `text` fields and may
optionally include other fields. The `text` field is a pure string
representation of what happened with this action. The optional `client` field
can be used by the game client to store a formatted string so that the client
can display log messages with colors or emojis, or whatever else they want to
support. Other fields are allowed here as well for that same purpose.

Some actions (like we'll see soon) can have multiple log messages since the game
client might do other automated tasks.
