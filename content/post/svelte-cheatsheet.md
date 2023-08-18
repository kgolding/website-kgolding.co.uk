+++
title = "Svelte Cheatsheet"
description = "Svelte cheat sheet and examples"
tags = ["Svelte"]
date = "2023-02-18"
+++

Here's are some Svelte basics and language examples.

<!--more-->

## Creating an app

```
npm create vite@latest my-app -- --template svelte
cd my-app
npm install
npm run dev
npm run build
```

## Computed variables

```
$: doubled = count * 2;
$: if (count) == 2 {console.log("count is two")};
```

## Reactivity

A simple rule of thumb: the updated variable must directly appear on the left-hand side of the assignment.
- Arrays must be overwritten, use a = [...a, x] and not a.push(x)
- Something not updating - try obj = obj

## Template syntax

```
<span>{count}</span>

{@html my_html}

{#if my_var==1}
...
{:else if my_var==2}
...
{:else}
...
{/if}
```

## Loops

Add an optional key in brackets to ensure items are tracked.
```
{#each dog in dogs (dog.id)}
  {dog.name} says woof!
{/each}

{#each dog as dog, index}
  {index}: {dog.name} says woof!
{/each}

{#each dog as id, name}
  {name} says woof whose ID is {id}!
{/each}
```

## Await blocks

```
{#await promise}
	<p>...waiting</p>
{:then number}
	<p>The number is {number}</p>
{:catch error}
	<p style="color: red">{error.message}</p>
{/await}
```

## Two-way binding

```
let name = "Kevin"
...
<input bind:value={name} />
<textarea bind:value={name}></textarea>
```

## Checkbox

```
let active = true
...
<input type="checkbox" bind:checked={active} />
```

## Content editable

```
let h = "I'm editable"
...
<div contenteditable=true bind:innerHtml={h}></div>
```

## Classes

```
let x = 1
...
<div class:myClass="{x === 1}"><div>
```

Inline styles

```
let color = "red
...
<div style="color: {color}"><div>
<div style:color><div>
```

## Events

```
function handleClick(event) {}
...
<div on:click={handleClick} />
```

### Modifiers

```
function handleClick(event) {}
...
<div on:click|once|preventDefault|stopPropagation={handleClick} />
```

### Emitting events

```
import { createEventDispatcher } from 'svelte';
const dispatch = createEventDispatcher();
...
dispatch('my_event', {
  text: 'Hello!'
});
```

## References (this)

```
let myDiv;
...
<div bind:this={myDiv}></div>
```

## Properties

Just export them, and set an default value if required:
```
export let my_var;
export let my_var_with_default = 99;
```
Then use them:
```
<myComponent my_var={101} />
```
Use spread to assign multiple props:
```
<myComponent {...obj} />
```

## Lifecycle

Use onMount when fetching data on startup.
```
import { onMount, onDestroy, beforeUpdate, afterUpdate, tick } from 'svelte'

onMount(async () => { ... }))
onDestroy(() => { ... })

await tick()
```

## Stores

store.js

import { writable } from 'svelte/store';
```
export const count = writable(0);
```

app.js

```
import { count } from './stores.js';
count.update(c => c+1)
count.set(0)
...
<span>{$count}</span>
```
Any name beginning with $ is assumed to refer to a store value. It's effectively a reserved character — Svelte will prevent you from declaring your own variables with a $ prefix.
