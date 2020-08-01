---
title: "Generating DOCX from Go"
date: 2020-08-01T21:31:32Z
description: "How to generate a DOCX file from golang using pandoc"
tags: ["go", "linux", "os"]
---

I needed a way to generate a DOCX Word format file from a golang application I was building, and my research proved to find a small number of options and one very good but expensive option [unidoc.io](https://unidoc.io/)
<!--more-->

My solution needed a way to preview the generated document in the web-browser, with an option to download a DOCX.

Gnerating the HTML was easy, I used a template HTML file and the [github.com/aymerick/raymond](https://github.com/aymerick/raymond) package to allow me to use Mustache style templating (I could have used the build-in template/html package but I find raymond much easier to use).

Once generated, I convert the HTML to a DOCX using [The universal document convertor aka pandoc](https://pandoc.org/). It works by taking a template DOCX file and renders the HTML file in the main content of the DOCX, taking on any existing document styles and retaining the header and footers, including embeded fields such as page number and page count.

This code snippet shows the approach taken:

```go
    html, err := os.Open("DOCUMENT.HTML")
	if err != nil {
		return "", err
	}

	cmd := exec.Command("/usr/bin/pandoc", "-o", "OUTPUT.DOCX", "--reference-doc=REFERENCE.DOCX", "-f", "html", "--lua-filter", "pagebreak.lua")
	stdin, err := cmd.StdinPipe()
	if err != nil {
		return "", err
	}

	go func() {
		defer stdin.Close()
		stdin.Write(html)
	}()
```

* `DOCUMENT.HTML` is the generated HTML file aka the content
* `REFERENCE.DOCX` is the reference DOCX file aka the style template
* `OUTPUT.DOCX` is the resulting file

> Importantly, the reference DOCX file must contain sample content which uses any of the styles needed e.g. Heading 1, Heading 2 etc. This content is deleted during the conversion, but if it is not there then all the style information is removed from the reference document when it is saved.


### Handling pagebreaks

The pandoc `--lua-filter` option lets us run a custom lua filter as the conversion runs. We use `pagebreak.lua` as a clever little trick to teach pandoc to convert any HTML &lt;hr&gt; tags into pagebreaks.

```lua
function HorizontalRule ()
    return pandoc.RawBlock('openxml', '<w:p><w:r><w:br w:type="page"/></w:r></w:p>')
end
```