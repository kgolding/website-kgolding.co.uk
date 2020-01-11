+++
title = "Vue.js config - development mode proxy"
description = "How to proxy web requests when developing a Vue.js application"
tags = ["vuejs", "proxy"]
+++
Use the vue.config.js below to proxy web requests when in development mode. This allows you to use the Vue development server but to have API calls go to a different server.
<!--more-->

Change the `http://192.168.100.82:8000` to that of your API server.

The "publicPath: ..." allows the deployed application to use a relative path, meaning it can be installed in a directory or the root of the http server.

**vue.config.jf**
```js
module.exports = {
  publicPath: process.env.NODE_ENV === 'production' ? './' : '/',

  devServer: {
    proxy: {
      '/': {
        target: 'http://192.168.100.82:8000',
        ws: false
      }
    }
  },
}

```

