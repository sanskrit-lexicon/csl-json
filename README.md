# csl-json

_Created: 29-05-2026 · Last updated: 11-07-2026_

JSON build of the Cologne Digital Sanskrit Lexicon (CDSL) dictionaries, part of
the [sanskrit-lexicon](https://github.com/sanskrit-lexicon) project. This
repository holds a small converter plus the **pre-built JSON files** it produces
for each dictionary, ready for use in web applications and offline tools.

The JSON files under
[`ashtadhyayi.com/`](https://github.com/sanskrit-lexicon/csl-json/tree/main/ashtadhyayi.com)
are consumed by the [ashtadhyayi.com](https://ashtadhyayi.com) website for
dictionary lookup.

## Contents

| Path | Purpose |
|---|---|
| [`json_from_babylon.py`](https://github.com/sanskrit-lexicon/csl-json/blob/main/json_from_babylon.py) | Converts a single dictionary's Babylon-format source → `.json` |
| [`redo.sh`](https://github.com/sanskrit-lexicon/csl-json/blob/main/redo.sh) | Full pipeline: refresh `hwnorm1` and `csl-orig`, build Babylon files via `cologne-stardict`, then convert every dictionary to JSON |
| [`redo_temp.sh`](https://github.com/sanskrit-lexicon/csl-json/blob/main/redo_temp.sh) | Partial rebuild for development use |
| [`ashtadhyayi.com/`](https://github.com/sanskrit-lexicon/csl-json/tree/main/ashtadhyayi.com) | Pre-built JSON, one file per dictionary (`mw.json`, `pwg.json`, `ap90.json`, …) |
| [`CLAUDE.md`](https://github.com/sanskrit-lexicon/csl-json/blob/main/CLAUDE.md) | Repo guidance for Claude Code sessions |

## Dictionaries

37 dictionaries are currently built, one JSON file each:

```
acc ae ap90 armh ben bhs bop bor bur cae ccs gra gst ieg inm krm lan mci md
mw mw72 mwe pd pe pgn pui pw pwg sch shs skd snp stc vcp vei wil yat
```

## Pipeline

The full rebuild is orchestrated by
[`redo.sh`](https://github.com/sanskrit-lexicon/csl-json/blob/main/redo.sh):

1. Pull the latest `hwnorm1` and copy `hwnorm1c.txt` into `cologne-stardict/input/`.
2. Pull the latest `csl-orig`.
3. Run `cologne-stardict/make_babylon.py <dict>` for every dictionary.
4. Run
   [`json_from_babylon.py`](https://github.com/sanskrit-lexicon/csl-json/blob/main/json_from_babylon.py)
   `<dict>` for every dictionary.

### Common commands

Full rebuild:

```bash
sh redo.sh
```

Convert a single dictionary:

```bash
python2 json_from_babylon.py <dict>
```

## Dependencies

- **Python 2** — the converter is invoked as `python2` (a Python 3 migration is
  not yet done).
- **[cologne-stardict](https://github.com/sanskrit-lexicon/cologne-stardict)** —
  produces the Babylon-format sources this repo converts.
- **[hwnorm1](https://github.com/sanskrit-lexicon/hwnorm1)** — headword
  normalization input.
- **[csl-orig](https://github.com/sanskrit-lexicon/csl-orig)** — source
  dictionary data.

## Issue conventions

Issues follow the [Cologne tooling-repo taxonomy](https://github.com/sanskrit-lexicon/csl-observatory/blob/main/runbook/cologne-tooling-runbook.md):
one type label, one severity (`trivial` · `minor` · `major` · `critical`), and a
milestone. Converter-scoped domain labels are `domain:transcoding`,
`domain:roundtrip`, and `domain:edge-cases`. Tracked on the org
[Tooling Roadmap](https://github.com/orgs/sanskrit-lexicon/projects/9) project.
The tracker is currently empty (0 open issues).

## License

This repository contains both source code and dictionary/data files, which are
licensed separately:

- **Source code** (e.g. `*.py`, `*.php`, `*.js`, `*.sh`) is licensed under the
  **GNU General Public License v3.0** — see [`licenses/GPL-3.0.txt`](https://github.com/sanskrit-lexicon/csl-json/blob/main/licenses/GPL-3.0.txt).
- **Dictionary and data files** are licensed under **Creative Commons
  Attribution-ShareAlike 4.0 International (CC-BY-SA-4.0)** — see
  [`LICENSE`](https://github.com/sanskrit-lexicon/csl-json/blob/main/LICENSE).

_Dr. Mārcis Gasūns_
