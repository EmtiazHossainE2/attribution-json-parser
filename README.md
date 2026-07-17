# Attribution JSON Parser — sGTM Custom Template

Extract dot-notation values from attribution JSON payloads in Google Tag Manager server-side (sGTM).

## What It Does

Parses JSON strings (e.g. `attribution_data` from localStorage) and returns values at any dot-notation path.

**Input:**
- `jsonInput` — serialized JSON string  
- `path` — dot-notation path, e.g. `first_touch.gclid` or `last_touch.utm_source`

With input `{"first_touch": {"gclid": "Cj0K..."}, "last_touch": {"utm_source": "google"}}` and path `first_touch.gclid`, the template returns `Cj0K...`.

**Output:** string (or JSON-stringified object/array) at the given path, or empty string if path not found.

## Usage

### 1. Download

```bash
git clone https://github.com/EmtiazHossainE2/attribution-json-parser.git
```

### 2. Upload to sGTM

1. Open your sGTM container (e.g. GTM-PBFLHVWC)
2. Go to **Templates** > **New**
3. Click the three dots ⋮ > **Import**
4. Select `Attribution JSON Parser.tpl`
5. Save

### 3. Create Variables

Once imported, create **Variables** with type set to your custom template:

| Name | Template | Parameters |
|---|---|---|
| FT - gclid | Attribution JSON Parser | jsonInput = `custom_properties`<br/>path = `first_touch.gclid` |
| FT - utm_source | Attribution JSON Parser | jsonInput = `custom_properties`<br/>path = `first_touch.utm_source` |
| LT - gclid | Attribution JSON Parser | jsonInput = `custom_properties`<br/>path = `last_touch.gclid` |
| schema_version | Attribution JSON Parser | jsonInput = `custom_properties`<br/>path = `schema_version` |

`jsonInput` typically references the `custom_properties` event data variable. The `path` uses dot notation to traverse the JSON tree.

## Pipeline Context

This template is part of a broader attribution pipeline:

```
Web GTM → localStorage "attribution_data" → GA4 events (custom_properties param) → sGTM GA4 Client → Attribution JSON Parser variables → Event Data variables → Google Sheets / Google Ads
```

## Local File

`Attribution JSON Parser.tpl` — the sGTM custom template in standard `.tpl` format. Import this file directly into any sGTM container via Templates UI.

## Author

Built for server-side GTM attribution tracking. Supports first-touch / last-touch models with gclid, gbraid, wbraid, utm fields, and timestamps.
