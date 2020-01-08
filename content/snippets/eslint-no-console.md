+++
title = "eslint - allow console logging"
description = "How to enable console logging with eslint"
tags = ["vuejs", "eslint"]
+++
Add the following to the package.json file to stop `warning: Unexpected console statement (no-console)` errors.
<!--more-->

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

