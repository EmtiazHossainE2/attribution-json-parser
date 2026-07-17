# Attribution JSON Parser – sGTM Custom Template

Parse first-touch/last-touch attribution JSON in server-side GTM. Extract values via dot-notation paths.

## Quick Start

1. **Download** – Click `Attribution JSON Parser.tpl` above, or clone repo, or [download ZIP](https://github.com/EmtiazHossainE2/attribution-json-parser/archive/refs/heads/main.zip)
2. **Unzip** – extract `.tpl` file
3. **Import** – sGTM Container > Templates > New > ⋮ > Import > select `.tpl` > Save

## Usage

Create Variables with type set to this template. Pass `custom_properties` as `jsonInput` (from event data), and dot-notation path (e.g. `first_touch.gclid`, `last_touch.utm_source`).

## Full Guide

Detailed setup + architecture: [Blog: First-Touch vs Last-Touch Attribution Schema in GTM](https://emtiaz-v2.com/blog/first-touch-last-touch-attribution-schema-gtm)
