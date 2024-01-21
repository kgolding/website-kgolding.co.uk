+++
title = "Insert date/time with a custom keyboard shortcut"
description = ""
tags = ["KDE", "linux"]
date = "2024-01-21"
+++

How to map a keyboard shortcut `Ctrl-Shift-D` to type in the date and time `2024-01-21_0953` in any application/command line.

<!--more-->

I find myself inserting the date/time in a sortable format, typically when sharing a file with others frequently, so this page explains how to create a keyboard shortcut.

## Why?

Let's say I have a document `Dummy guide.odt`, which is a live document in that is getting updates. When I share this document, I will export it to PDF (to ensure it is displayed as intended on any recipient's machine). After hitting `Export as PDF`, I change the filename to `Dummy guide 2024-01-21_1007.pdf`, by hitting the right arrow, ` ` and then `Ctrl-Shift-D`.

{{< rawhtml >}}
<video width=100% controls>
    <source src="/img/date-time-custom-shortcut/LibreOffice-ExportAsPdf-DateTime-Shortcut-2024-01-21_10-07-28_edit.mp4" type="video/mp4">
    Your browser does not support the video tag.  
</video>
{{< /rawhtml >}}

## How

I'm running Kubuntu 22.04, but this should work on most X11 based Linux desktops.

1. `sudo apt install xdotool`
1. Open `Settings` > `Workspace/Shortcuts` > `Custom Shortcuts`
1. Create a custom keyboard shortcut with the command `xdotool type --clearmodifiers $(date +%Y-%m-%d_%H%M)`
1. Assign `Ctrl-Shift-D` to the new keyboard shortcut

{{< rawhtml >}}
<video width=100% controls>
    <source src="/img/date-time-custom-shortcut/Kubuntu-NewDateTime-Shortcut-2024-01-21_10-20-53.mp4" type="video/mp4">
    Your browser does not support the video tag.  
</video>
{{< /rawhtml >}}
