https://github.com/binhex/documentation/blob/master/docker/faq/vpn.md

First we're going to create the wg0 config file. (we are using wiregaurd because openvpn is an older standard and has a longer round trip and slower speeds)

Log into your Mullvad account and navigate to this page

Click Linux and Generate a key

Find what server you want. If strictly for downloading I would recommend a lower congestion server. Ie: if in LA pick an AZ server etc. Select "Only IPV4" <--- Container will not run w/ Ipv6 and then download the zip archive

Extract a wireguard file from the archive --They will be named "mullvad-us161.conf". right click and Rename this file to wg0.conf . Make sure it saves as a .conf file and not a .conf.txt file

Go to your binhex vpn container of choice (I'm using binhex-privoxyvpn but this works for any of his containers w/ vpn). And select these settings. Do Not enter a username or password. Custom for the vpn_provider and wiregaurd VPN_CLIENT. Start the container without the file. This will generate your wiregaurd folder.

The container will stop on it's own due to no vpn tunnel connection. Go to your favorite SFTP tool (or SMB share) and navigate to your "/mnt/user/appdata/binhex-YOURVPNCONTAINERNAME/wireguard" and drop the wg0 file in.

Start your container and open the console for the container and enter:

     curl https://am.i.mullvad.net/connected

If you have other questions shoot them my way and I'll try to answer. :)

