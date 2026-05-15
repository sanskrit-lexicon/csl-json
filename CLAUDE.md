# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**csl-json** converts the Cologne Digital Sanskrit Lexicon dictionaries from Babylon format into JSON, making them available for use in web applications and offline tools. The pre-built JSON files for each dictionary are stored here.

The JSON files in `ashtadhyayi.com/` are used by the [ashtadhyayi.com](https://ashtadhyayi.com) website for dictionary lookup.

## Architecture

| File/Directory | Purpose |
|---|---|
| `json_from_babylon.py` | Converts a single dictionary's `.babylon` file → `.json` |
| `redo.sh` | Full pipeline: updates hwnorm1 → updates csl-orig → builds babylon files (via cologne-stardict) → converts all to JSON |
| `redo_temp.sh` | Partial rebuild (development use) |
| `ashtadhyayi.com/` | Pre-built JSON files for each dictionary (`acc.json`, `ae.json`, `mw.json`, etc.) |

### Pipeline (orchestrated by `redo.sh`)

1. Pull latest `hwnorm1` and copy `hwnorm1c.txt` to `cologne-stardict/input/`
2. Pull latest `csl-orig`
3. Run `cologne-stardict/make_babylon.py <dict>` for all dictionaries
4. Run `csl-json/json_from_babylon.py <dict>` for all dictionaries

### Dictionary list

`acc ae ap ap90 ben bhs bop bor bur cae ccs gra gst ieg inm krm mci md mw mw72 mwe pd pe pgn pui pw pwg sch shs skd snp stc vcp vei wil yat lan armh`

## Common Commands

### Full rebuild
```bash
sh redo.sh
```

### Convert a single dictionary
```bash
python2 json_from_babylon.py <dict>
```

## Dependencies

- **Python 2** (the scripts use `python2` — note: Python 3 migration may be needed)
- **cologne-stardict** sibling repo — Babylon file sources
- **hwnorm1** sibling repo — headword normalization
- **csl-orig** sibling repo — source dictionary data
