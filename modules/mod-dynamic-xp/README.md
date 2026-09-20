# Dynamic XP

Experience-rate control for 3.3.5a, vendored from
[azerothcore/mod-dynamic-xp](https://github.com/azerothcore/mod-dynamic-xp) with the
additions described below.

## Players

| command | effect |
| --- | --- |
| `.xp` | shows your rate and where it comes from |
| `.xp 1` / `.xp 3` / `.xp 5` / `.xp 7` | your own flat rate |
| `.xp dynamic` | your own per-band curve (see the configuration below) |
| `.xp default` | drop your choice and follow the realm again |

The choice is stored per character (`core.dynamic_xp.preset` in `character_settings`), so
it survives relogs and restarts. Players who never pick a rate follow the realm value.

## Game masters

| command | effect |
| --- | --- |
| `.xp realm` | shows the realm rate |
| `.xp realm 1` / `.xp realm 3` / `.xp realm 5` / `.xp realm 7` | sets the realm rate |
| `.xp realm dynamic` | the realm uses the per-band curve |

The realm rate is written back to `dynamicxp.conf` and is the default for every character
without a choice of its own; changing it leaves personal rates alone.

## Configuration

All keys live in `conf/dynamicxp.conf.dist`:

- `Dynamic.XP.Preset` - the realm rate: `1` (default, no bonus), `3`, `5`, `7`, or `0` for
  the per-band curve.
- `Dynamic.XP.Preset.PlayerChoice` - `1` (default) lets players choose their own rate,
  `0` restricts the choice to game masters.
- `Dynamic.XP.Rate` and `Dynamic.XP.Rate.X-X` - the per-band curve, used by preset `0`.
- `Dynamic.XP.Rate.Announce` - `0` (default) stays silent; `1` tells each player their
  rate on login.
- `Dynamic.XP.Reminder.Enable` - the realm-wide note about `.xp` (default `1`).
- `Dynamic.XP.Reminder.Interval` - minutes between reminders (default `40`, `0` disables
  the repeat).
- `Dynamic.XP.Reminder.Message` - the text of that note, sent as-is including colour codes.

The reminder is announced when a player logs in and then every `Interval` minutes, and it
respects the per-player setting that turns automatic announcements off.

## The storage key

Keep the `core.` prefix on `core.dynamic_xp.preset` while `EnablePlayerSettings` is `0`:
`Player::_SavePlayerSettings` and `_LoadCharacterSettings` skip every source that does not
start with it, so a differently named key would be held in memory and lost on relog.
