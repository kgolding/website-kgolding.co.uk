+++
title = "eslint - allow console logging"
description = "How to enable console logging with eslint"
tags = ["vuejs", "eslint"]
+++
You can globally allow console logging when using eslint, and/or disable it on a line by line basis:
<!--more-->

To disable eslint showing errors for a single line use `eslint-disable-next-line` on the line above.

Or, to globally disable the eslint error for console logging, add the following to the package.json file and stop those `warning: Unexpected console statement (no-console)` errors.

**package.json**
```json
{
...
"eslintConfig": {
    "rules": {
      "no-console": "off"
    }
  }
}
```

