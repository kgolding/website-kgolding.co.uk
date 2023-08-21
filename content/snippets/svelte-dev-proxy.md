+++
title = "Svelte dev proxy and relative paths"
description = ""
tags = ["svelte", "js"]
+++

Talk to REST api's when developing svelte apps, and support releative paths on deployment.

<!--more-->

Edit vite.config.js, and change too:

```
import { defineConfig } from 'vite'
import { svelte } from '@sveltejs/vite-plugin-svelte'
export default defineConfig({
  plugins: [svelte()],

  // Relative URL
  base: '',

  server: {
    proxy: {
      '/': {
        target: 'http://change-to-your-api-server.com',
        changeOrigin: true,
        secure: false,
        ws: true,
      }
    }
  }
})
```