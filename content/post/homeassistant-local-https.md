---
title: "Home Assistant - Local HTTPS for ESPHome"
date: 2024-04-09T07:16:32Z
description: ""
tags: ["home-assistant", "esphome"]
---

In order to use the ESPHome add-on in Home Assistant you have to access the web portal using https.
<!--more-->

### Stage 1 - Create ssl certificates

#### Option 1 - Online service

1. Goto https://gencert.srv.lxsig.uk/
1. Enter your Home Assistants IP address & host name
1. Click Generate certificates
1. Click Download for both `Private key` and `Certificate`
1. This will have generated two files:
    * `fullchain.pem`
    * `privkey.pem`

#### Option 2 - Use openssl on local PC

1. You will need access to a computer that has openssl installed
1. Run the following command (on your local PC) to generate the new self signed certs, making sure to change the IP address to the your Home Assistant IP address:<br>
```
openssl req -sha256 -addext "subjectAltName = IP:192.168.5.53, DNS:homeassistant.local" -newkey rsa:4096 -nodes -keyout privkey.pem -x509 -days 24855 -out fullchain.pem
```
2. Answer the prompted questions changing the answers as needed:
    * Country Name (2 letter code) [AU]:`GB`
    * State or Province Name (full name) [Some-State]:`Surrey`
    * Locality Name (eg, city) []:`Banstead`
    * Organization Name (eg, company) [Internet Widgits Pty Ltd]:`Kevin Golding`
    * Organizational Unit Name (eg, section) []:
    * Common Name (e.g. server FQDN or YOUR name) []:`homeassistant.local`
    * Email Address []:`kevin@*************`
1. This will have generated two files:
    * `fullchain.pem`
    * `privkey.pem`


### Stage 2 - Install the certificates to Home Assistant

1. Login into home assistant
1. Settings -> Add-ons -> Add-on store
1. Find `File editor`, install and start it, and enable `Show in sidebar`
1. Open `File editor` from the sidebar
1. Click the top left folder icon to display the directories/files
1. Click new folder icon, and create a new `certs` folder
1. Click on the `certs` folder
1. Click on the upload file icon, and select the `fullchain.pem` file from Stage 1 and click Upload
1. Click on the upload file icon, and select the `privkey.pem` file from Stage 1 and click Upload
1. Verify that you can see both files in the `homeassisant/certs` directory


### Stage 3 - Enable https in Home Assistant

1. Following on from Stage 2, in the `File editor` navigate to the `homeassistant/` directory
1. Click on the `configuration.yaml` file to open the editor
1. At the end of the file paste in the following lines:<br>
```
http:
  ssl_certificate: /config/certs/fullchain.pem
  ssl_key: /config/certs/privkey.pem
```
4. Click Save
1. From the sidebar click `Developer Tools`
1. Click `Check configuration` and verify you get a green `Configuration will not prevent Home Assistant from starting!` message
1. Click restart, then click `Restart Home Assistant` and click confirm
1. You will now lose connection to Home Assistant - but don't worry!

### Stage 4 - Access Home Assistant over https

1. Edit the address bar and change the `http` prefix to `https` e.g. https://homeassistant.local:8123/
1. You will see a page with a warning `Your connection is not private`
1. Click the `Advanced` button
1. Click the `Proceed to ......` link 
1. You are now accessing Home Assistant over https :)

**Note 1:** The certificate has an expiry date, which for trusted certificates can only be a maximum of 18 months, but as this is an untrusted self-signed certificate it can be valid for some 68 years.

**Note 2:** Once https is enabled, you will not be able to access Home Assistant using http!

**Note 3:** You can also access Home Assistant using its IP address e.g. https://192.168.5.53:8123/