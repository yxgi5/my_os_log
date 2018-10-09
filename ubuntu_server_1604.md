## add sudoers ##
```
# chmod +w /etc/sudoers
# gedit /etc/sudoers
（等效于visudo命令）
// add this line
andy ALL=(ALL:ALL) ALL

# chmod -w /etc/sudoers
```

## 安装gnome ##
alex@iZ8vb9hu2kftezexm9ehyiZ:~$ sudo apt-get install gnome
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  linux-headers-4.4.0-87 linux-headers-4.4.0-87-generic linux-image-4.4.0-87-generic linux-image-extra-4.4.0-87-generic
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  account-plugin-aim account-plugin-google account-plugin-jabber account-plugin-salut account-plugin-yahoo acl adwaita-icon-theme aisleriot alacarte anacron apg
  app-install-data appstream aptdaemon aptdaemon-data argyll argyll-ref aspell aspell-en at-spi2-core avahi-daemon avahi-utils baobab bijiben bluez bluez-obexd bogofilter
  bogofilter-bdb bogofilter-common brasero brasero-cdrkit brasero-common caribou caribou-antler cheese cheese-common chrome-gnome-shell colord colord-data cpp-5
  cracklib-runtime cups-pk-helper dbus-x11 dconf-cli dconf-editor dconf-gsettings-backend dconf-service dconf-tools desktop-base desktop-file-utils dictionaries-common
  diffstat dirmngr dleyna-renderer dleyna-server dns-root-data dnsmasq-base dvd+rw-tools emacsen-common empathy empathy-common enchant eog espeak-data evince evince-common
  evolution evolution-common evolution-data-server evolution-data-server-common evolution-data-server-online-accounts evolution-plugins fairymax file-roller finger firefox
  five-or-more folks-common fontconfig fontconfig-config fonts-cantarell fonts-dejavu-core fonts-opensymbol fonts-stix four-in-a-row freepats freerdp-x11 g++-5 gawk gcc-5
  gcc-5-base gconf-service gconf-service-backend gconf2 gconf2-common gcr gdisk gdm3 gedit gedit-common gedit-plugins genisoimage geoclue geoclue-2.0 geoclue-ubuntu-geoip
  ghostscript gimp gimp-data gir1.2-accountsservice-1.0 gir1.2-atk-1.0 gir1.2-atspi-2.0 gir1.2-caribou-1.0 gir1.2-champlain-0.12 gir1.2-clutter-1.0 gir1.2-clutter-gst-3.0
  gir1.2-cogl-1.0 gir1.2-coglpango-1.0 gir1.2-evince-3.0 gir1.2-freedesktop gir1.2-gck-1 gir1.2-gcr-3 gir1.2-gdata-0.0 gir1.2-gdesktopenums-3.0 gir1.2-gdkpixbuf-2.0
  gir1.2-gdm-1.0 gir1.2-geocodeglib-1.0 gir1.2-gfbgraph-0.2 gir1.2-git2-glib-1.0 gir1.2-gkbd-3.0 gir1.2-gmenu-3.0 gir1.2-gnomebluetooth-1.0 gir1.2-gnomedesktop-3.0
  gir1.2-gnomekeyring-1.0 gir1.2-goa-1.0 gir1.2-grilo-0.2 gir1.2-gst-plugins-base-1.0 gir1.2-gstreamer-1.0 gir1.2-gtk-3.0 gir1.2-gtkchamplain-0.12 gir1.2-gtkclutter-1.0
  gir1.2-gtksource-3.0 gir1.2-gucharmap-2.90 gir1.2-gweather-3.0 gir1.2-ibus-1.0 gir1.2-javascriptcoregtk-4.0 gir1.2-json-1.0 gir1.2-mediaart-2.0 gir1.2-mutter-3.0
  gir1.2-networkmanager-1.0 gir1.2-nmgtk-1.0 gir1.2-notify-0.7 gir1.2-packagekitglib-1.0 gir1.2-pango-1.0 gir1.2-peas-1.0 gir1.2-polkit-1.0 gir1.2-rb-3.0 gir1.2-rest-0.7
  gir1.2-secret-1 gir1.2-soup-2.4 gir1.2-telepathyglib-0.12 gir1.2-telepathylogger-0.2 gir1.2-totem-1.0 gir1.2-totem-plparser-1.0 gir1.2-tracker-1.0 gir1.2-upowerglib-1.0
  gir1.2-vte-2.91 gir1.2-webkit2-4.0 gir1.2-wnck-3.0 gir1.2-xkl-1.0 gir1.2-zeitgeist-2.0 gir1.2-zpj-0.0 gjs gkbd-capplet glib-networking glib-networking-common
  glib-networking-services gnome-accessibility-themes gnome-backgrounds gnome-bluetooth gnome-calculator gnome-chess gnome-clocks gnome-color-manager gnome-contacts
  gnome-control-center gnome-control-center-data gnome-core gnome-desktop3-data gnome-dictionary gnome-disk-utility gnome-documents gnome-font-viewer gnome-games
  gnome-getting-started-docs gnome-icon-theme gnome-icon-theme-symbolic gnome-keyring gnome-klotski gnome-logs gnome-mahjongg gnome-maps gnome-menus gnome-mines gnome-music
  gnome-nettool gnome-nibbles gnome-online-accounts gnome-online-miners gnome-orca gnome-packagekit gnome-packagekit-data gnome-packagekit-session gnome-photos gnome-robots
  gnome-screenshot gnome-session gnome-session-bin gnome-session-common gnome-settings-daemon gnome-settings-daemon-schemas gnome-shell gnome-shell-common
  gnome-shell-extension-weather gnome-shell-extensions gnome-software gnome-software-common gnome-sound-recorder gnome-sudoku gnome-sushi gnome-system-log
  gnome-system-monitor gnome-terminal gnome-terminal-data gnome-tetravex gnome-themes-standard gnome-themes-standard-data gnome-tweak-tool gnome-user-guide gnome-user-share
  gnome-video-effects gnupg-agent gnupg2 goobox grilo-plugins-0.2-base grilo-plugins-0.2-extra growisofs gsettings-desktop-schemas gsettings-ubuntu-schemas gsfonts
  gstreamer1.0-clutter-3.0 gstreamer1.0-libav gstreamer1.0-nice gstreamer1.0-plugins-bad gstreamer1.0-plugins-bad-faad gstreamer1.0-plugins-bad-videoparsers
  gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-ugly-amr gstreamer1.0-pulseaudio gstreamer1.0-x gtk2-engines
  gtk2-engines-pixbuf gucharmap guile-2.0-libs gvfs gvfs-backends gvfs-bin gvfs-common gvfs-daemons gvfs-fuse gvfs-libs hamster-applet hamster-indicator hardening-includes
  hicolor-icon-theme hitori hoichess humanity-icon-theme hunspell-en-us hwdata i965-va-driver iagno ibus iio-sensor-proxy im-config imagemagick imagemagick-6.q16
  imagemagick-common indicator-applet indicator-application indicator-bluetooth indicator-datetime indicator-keyboard indicator-messages indicator-power indicator-sound
  inkscape ippusbxd iputils-arping liba52-0.7.4 libaa1 libaacs0 libabw-0.1-1v5 libaccount-plugin-1.0-0 libaccount-plugin-generic-oauth libaccount-plugin-google
  libaccounts-glib0 libaccounts-qt5-1 libamd2.4.1 libao-common libao4 libappindicator1 libappindicator3-1 libappstream-glib8 libappstream3 libapt-pkg-perl libart-2.0-2
  libasan2 libasound2 libasound2-data libasound2-plugins libaspell15 libass5 libassuan0 libasyncns0 libatasmart4 libatk-adaptor libatk-bridge2.0-0 libatk1.0-0
  libatk1.0-data libatkmm-1.6-1v5 libatomic1 libatspi2.0-0 libaudio2 libauthen-sasl-perl libavahi-core7 libavahi-glib1 libavahi-gobject0 libavahi-ui-gtk3-0 libavc1394-0
  libavcodec-ffmpeg56 libavfilter-ffmpeg5 libavformat-ffmpeg56 libavresample-ffmpeg2 libavutil-ffmpeg54 libbabl-0.1-0 libbdplus0 libblas-common libblas3 libbluetooth3
  libbluray1 libbonobo2-0 libbonobo2-common libbonoboui2-0 libbonoboui2-common libboost-date-time1.58.0 libboost-filesystem1.58.0 libbrasero-media3-1 libbrlapi0.6 libbs2b0
  libburn4 libcaca0 libcacard0 libcairo-gobject2 libcairo-perl libcairo2 libcairomm-1.0-1v5 libcamd2.4.1 libcamel-1.2-54 libcanberra-gtk3-0 libcanberra-gtk3-module
  libcanberra-pulse libcanberra0 libcapnp-0.5.3 libcaribou-common libcaribou-gtk-module libcaribou-gtk3-module libcaribou0 libcc1-0 libccolamd2.9.1 libcdio-cdda1
  libcdio-paranoia1 libcdio13 libcdparanoia0 libcdr-0.1-1 libcgi-fast-perl libcgi-pm-perl libchamplain-0.12-0 libchamplain-gtk-0.12-0 libcheese-gtk25 libcheese8
  libcholmod3.0.6 libchromaprint0 libcilkrts5 libclass-accessor-perl libclone-perl libclucene-contribs1v5 libclucene-core1v5 libclutter-1.0-0 libclutter-1.0-common
  libclutter-gst-2.0-0 libclutter-gst-3.0-0 libclutter-gtk-1.0-0 libcmis-0.5-5v5 libcogl-common libcogl-pango20 libcogl-path20 libcogl20 libcolamd2.9.1 libcolord-gtk1
  libcolord2 libcolorhug2 libcoverart1 libcoverartcc1v5 libcrack2 libcryptui0a libcrystalhd3 libdaemon0 libdata-alias-perl libdatrie1 libdbusmenu-glib4 libdbusmenu-gtk3-4
  libdbusmenu-gtk4 libdc1394-22 libdca0 libdconf1 libde265-0 libdee-1.0-4 libdigest-hmac-perl libdiscid0 libdjvulibre-text libdjvulibre21 libdleyna-connector-dbus-1.0-1
  libdleyna-core-1.0-3 libdmapsharing-3.0-2 libdotconf0 libdouble-conversion1v5 libdrm-amdgpu1 libdrm-common libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libdv4
  libdvdnav4 libdvdread4 libe-book-0.1-1 libebackend-1.2-10 libebook-1.2-16 libebook-contacts-1.2-2 libecal-1.2-19 libedata-book-1.2-25 libedata-cal-1.2-28
  libedataserver-1.2-21 libedataserverui-1.2-1 libegl1-mesa libemail-valid-perl libenchant1c2a libencode-locale-perl libeot0 libepoxy0 libespeak1 libetonyek-0.1-1 libevdev2
  libevdocument3-4 libevent-2.0-5 libevolution libevview3-3 libexempi3 libexif12 libexiv2-14 libexporter-tiny-perl libexttextcat-2.0-0 libexttextcat-data libfaad2
  libfarstream-0.2-5 libfcgi-perl libfcitx-config4 libfcitx-gclient0 libfcitx-utils0 libfftw3-double3 libfftw3-single3 libfile-basedir-perl libfile-desktopentry-perl
  libfile-listing-perl libfile-mimeinfo-perl libflac8 libflite1 libfluidsynth1 libfolks-eds25 libfolks-telepathy25 libfolks25 libfont-afm-perl libfontconfig1 libfontenc1
  libfreehand-0.1-1 libfreerdp-cache1.1 libfreerdp-client1.1 libfreerdp-codec1.1 libfreerdp-common1.1.0 libfreerdp-core1.1 libfreerdp-crypto1.1 libfreerdp-gdi1.1
  libfreerdp-locale1.1 libfreerdp-plugins-standard libfreerdp-primitives1.1 libfreerdp-rail1.1 libfreerdp-utils1.1 libfwupd1 libgail-3-0 libgail-common libgail18 libgbm1
  libgc1c2 libgcab-1.0-0 libgcc-5-dev libgck-1-0 libgconf-2-4 libgcr-3-common libgcr-base-3-1 libgcr-ui-3-1 libgd3 libgdata-common libgdata22 libgdict-1.0-9 libgdict-common
  libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgdm1 libgee-0.8-2 libgegl-0.3-0 libgeoclue-2-0 libgeoclue0 libgeocode-glib0 libgeonames0 libgfbgraph-0.2-0 libgfortran3
  libgif7 libgimp2.0 libgit2-24 libgit2-glib-1.0-0 libgjs0e libgl1-mesa-dri libgl1-mesa-glx libglade2-0 libglapi-mesa libglew1.13 libglib-perl libglib2.0-0 libglib2.0-bin
  libglibmm-2.4-1v5 libglu1-mesa libgme0 libgmime-2.6-0 libgnome-2-0 libgnome-bluetooth13 libgnome-desktop-3-12 libgnome-keyring-common libgnome-keyring0 libgnome-menu-3-0
  libgnome2-0 libgnome2-bin libgnome2-common libgnomecanvas2-0 libgnomecanvas2-common libgnomekbd-common libgnomekbd8 libgnomeui-0 libgnomeui-common libgnomevfs2-0
  libgnomevfs2-common libgnomevfs2-extra libgoa-1.0-0b libgoa-1.0-common libgoa-backend-1.0-1 libgom-1.0-0 libgom-1.0-common libgomp1 libgpgme11 libgphoto2-6
  libgphoto2-l10n libgphoto2-port12 libgpod-common libgpod4 libgraphite2-3 libgrilo-0.2-1 libgs9 libgs9-common libgsf-1-114 libgsf-1-common libgsf-bin libgsl2 libgsm1
  libgsound0 libgssdp-1.0-3 libgstreamer-plugins-bad1.0-0 libgstreamer-plugins-base1.0-0 libgstreamer-plugins-good1.0-0 libgstreamer1.0-0 libgtk-3-0 libgtk-3-bin
  libgtk-3-common libgtk-vnc-2.0-0 libgtk2-perl libgtk2.0-0 libgtk2.0-bin libgtk2.0-common libgtkglext1 libgtkmm-2.4-1v5 libgtkmm-3.0-1v5 libgtksourceview-3.0-1
  libgtksourceview-3.0-common libgtkspell0 libgtkspell3-3-0 libgtop-2.0-10 libgtop2-common libgucharmap-2-90-7 libgudev-1.0-0 libgupnp-1.0-4 libgupnp-av-1.0-2
  libgupnp-dlna-2.0-3 libgupnp-igd-1.0-4 libgusb2 libgvnc-1.0-0 libgweather-3-6 libgweather-common libgxps2 libharfbuzz-icu0 libharfbuzz0b libhtml-form-perl
  libhtml-format-perl libhtml-parser-perl libhtml-tagset-perl libhtml-tree-perl libhttp-cookies-perl libhttp-daemon-perl libhttp-date-perl libhttp-message-perl
  libhttp-negotiate-perl libhttp-parser2.1 libhunspell-1.3-0 libhyphen0 libibus-1.0-5 libical1a libice6 libidl-2-0 libido3-0.1-0 libiec61883-0 libieee1284-3 libijs-0.35
  libilmbase12 libimage-magick-perl libimage-magick-q16-perl libimobiledevice6 libindicator3-7 libindicator7 libinput-bin libinput10 libio-html-perl libio-pty-perl
  libio-socket-inet6-perl libio-socket-ssl-perl libio-string-perl libipc-run-perl libipc-system-simple-perl libisofs6 libitm1 libjack-jackd2-0 libjansson4 libjasper1
  libjavascriptcoregtk-3.0-0 libjavascriptcoregtk-4.0-18 libjbig2dec0 libjson-glib-1.0-0 libjson-glib-1.0-common libjte1 libkate1 libkpathsea6 libksba8 liblangtag-common
  liblangtag1 liblapack3 liblcms2-2 libldb1 liblightdm-gobject-1-0 liblinear3 liblircclient0 liblist-moreutils-perl libllvm6.0 liblouis-data liblouis9 liblqr-1-0 liblsan0
  libltdl7 liblua5.3-0 liblwp-mediatypes-perl liblwp-protocol-https-perl libmad0 libmagick++-6.q16-5v5 libmagickcore-6.q16-2 libmagickcore-6.q16-2-extra
  libmagickwand-6.q16-2 libmailtools-perl libmbim-glib4 libmbim-proxy libmeanwhile1 libmediaart-2.0-0 libmetacity-private3a libmhash2 libmimic0 libminiupnpc10 libmirclient9
  libmircommon7 libmircore1 libmirprotobuf3 libmission-control-plugins0 libmjpegutils-2.1-0 libmm-glib0 libmms0 libmng2 libmodplug1 libmozjs-24-0v5 libmp3lame0 libmpeg2-4
  libmpeg2encpp-2.1-0 libmpg123-0 libmplex2-2.1-0 libmpx0 libmspub-0.1-1 libmtdev1 libmtp-common libmtp-runtime libmtp9 libmusicbrainz5-2 libmusicbrainz5cc2v5 libmutter0g
  libmwaw-0.3-3 libmythes-1.2-0 libnatpmp1 libnautilus-extension1a libndp0 libneon27-gnutls libnet-dbus-perl libnet-dns-perl libnet-domain-tld-perl libnet-http-perl
  libnet-ip-perl libnet-libidn-perl libnet-smtp-ssl-perl libnet-ssleay-perl libnetfilter-conntrack3 libnetpbm10 libnice10 libnm-glib-vpn1 libnm-glib4 libnm-gtk-common
  libnm-gtk0 libnm-util2 libnm0 libnma-common libnma0 libnotify4 libnpth0 libnss-mdns liboauth0 libodfgen-0.1-1 libofa0 libogg0 libopenal-data libopenal1 libopencore-amrnb0
  libopencore-amrwb0 libopencv-calib3d2.4v5 libopencv-contrib2.4v5 libopencv-core2.4v5 libopencv-features2d2.4v5 libopencv-flann2.4v5 libopencv-highgui2.4v5
  libopencv-imgproc2.4v5 libopencv-legacy2.4v5 libopencv-ml2.4v5 libopencv-objdetect2.4v5 libopencv-video2.4v5 libopenexr22 libopenjpeg5 libopus0 liborbit-2-0 liborbit2
  liborc-0.4-0 liborcus-0.10-0v5 libp11-kit-gnome-keyring libpackagekit-glib2-16 libpagemaker-0.0-0 libpam-gnome-keyring libpanel-applet0 libpango-1.0-0 libpango-perl
  libpangocairo-1.0-0 libpangoft2-1.0-0 libpangomm-1.4-1v5 libpangox-1.0-0 libpangoxft-1.0-0 libpaper-utils libpaper1 libparse-debianchangelog-perl libpciaccess0
  libpcre16-3 libpcsclite1 libpeas-1.0-0 libpeas-1.0-0-python3loader libpeas-common libperl5.22 libperlio-gzip-perl libpixman-1-0 libplist3 libpolkit-agent-1-0
  libpolkit-backend-1-0 libpolkit-gobject-1-0 libpoppler-glib8 libpoppler58 libportaudio2 libpostproc-ffmpeg53 libprotobuf-lite9v5 libproxy1v5 libpst4
  libpulse-mainloop-glib0 libpulse0 libpulsedsp libpurple-bin libpurple0 libpwquality-common libpwquality1 libqmi-glib5 libqmi-proxy libqqwing2v5 libqt5core5a libqt5dbus5
  libqt5gui5 libqt5network5 libqt5opengl5 libqt5printsupport5 libqt5qml5 libqt5quick5 libqt5sql5 libqt5sql5-sqlite libqt5svg5 libqt5webkit5 libqt5widgets5 libqt5xml5
  libquadmath0 libquvi-scripts libquvi7 libraptor2-0 librasqal3 libraw1394-11 libraw15 librdf0 libreoffice-avmedia-backend-gstreamer libreoffice-base-core libreoffice-calc
  libreoffice-common libreoffice-core libreoffice-draw libreoffice-gnome libreoffice-gtk libreoffice-impress libreoffice-math libreoffice-pdfimport
  libreoffice-style-elementary libreoffice-style-galaxy libreoffice-writer librest-0.7-0 librevenge-0.0-0 librhythmbox-core9 librsvg2-2 librsvg2-common librygel-core-2.6-2
  librygel-db-2.6-2 librygel-renderer-2.6-2 librygel-renderer-gst-2.6-2 librygel-server-2.6-2 libsamplerate0 libsane libsane-common libsbc1 libschroedinger-1.0-0
  libsdl1.2debian libsecret-1-0 libsecret-common libsgutils2-2 libshine3 libshout3 libsidplay1v5 libsigc++-2.0-0v5 libsignon-extension1 libsignon-glib1
  libsignon-plugins-common1 libsignon-qt5-1 libsm6 libsmbclient libsnapd-glib1 libsnappy1v5 libsndfile1 libsocket6-perl libsodium18 libsofia-sip-ua-glib3 libsofia-sip-ua0
  libsonic0 libsoundtouch1 libsoup-gnome2.4-1 libsoup2.4-1 libsoxr0 libspandsp2 libspectre1 libspeechd2 libspeex1 libspeexdsp1 libspice-client-glib-2.0-8
  libspice-client-gtk-3.0-4 libsrtp0 libssh-gcrypt-4 libssh2-1 libstartup-notification0 libstdc++-5-dev libstdc++6 libsub-name-perl libsuitesparseconfig4.4.6
  libswresample-ffmpeg1 libswscale-ffmpeg3 libtag1v5 libtag1v5-vanilla libtagc0 libtalloc2 libtbb2 libtdb1 libtelepathy-farstream3 libtelepathy-glib0 libtelepathy-logger3
  libtevent0 libtext-levenshtein-perl libthai-data libthai0 libtheora0 libtie-ixhash-perl libtimezonemap-data libtimezonemap1 libtotem-plparser-common libtotem-plparser18
  libtotem0 libtracker-control-1.0-0 libtracker-miner-1.0-0 libtracker-sparql-1.0-0 libtsan0 libtwolame0 libtxc-dxtn-s2tc0 libubsan0 libudisks2-0 libumfpack5.7.1
  libunity-control-center1 libunity-protocol-private0 libunity-scopes-json-def-desktop libunity-settings-daemon1 libunity9 libupower-glib3 liburi-perl liburl-dispatcher1
  libusbmuxd4 libusbredirhost1 libusbredirparser1 libv4l-0 libv4lconvert0 libva1 libvisio-0.1-1 libvisual-0.4-0 libvo-aacenc0 libvo-amrwbenc0 libvorbis0a libvorbisenc2
  libvorbisfile3 libvpx3 libvte-2.91-0 libvte-2.91-common libwacom-bin libwacom-common libwacom2 libwavpack1 libwayland-client0 libwayland-cursor0 libwayland-egl1-mesa
  libwayland-server0 libwbclient0 libwebkit2gtk-4.0-37 libwebkit2gtk-4.0-37-gtk2 libwebkitgtk-3.0-0 libwebkitgtk-3.0-common libwebp5 libwebpdemux1
  libwebrtc-audio-processing-0 libwildmidi-config libwildmidi1 libwinpr-crt0.1 libwinpr-dsparse0.1 libwinpr-environment0.1 libwinpr-file0.1 libwinpr-handle0.1
  libwinpr-heap0.1 libwinpr-input0.1 libwinpr-interlocked0.1 libwinpr-library0.1 libwinpr-path0.1 libwinpr-pool0.1 libwinpr-registry0.1 libwinpr-rpc0.1 libwinpr-sspi0.1
  libwinpr-synch0.1 libwinpr-sysinfo0.1 libwinpr-thread0.1 libwinpr-utils0.1 libwmf-bin libwmf0.2-7 libwnck-3-0 libwnck-3-common libwnck-common libwnck22 libwpd-0.10-10
  libwpg-0.3-3 libwps-0.4-4 libwww-perl libwww-robotrules-perl libx11-protocol-perl libx11-xcb1 libx264-148 libx265-79 libxapian22v5 libxatracker2 libxaw7 libxcb-dri2-0
  libxcb-dri3-0 libxcb-glx0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-present0 libxcb-randr0 libxcb-render-util0 libxcb-render0 libxcb-shape0 libxcb-shm0
  libxcb-sync1 libxcb-util1 libxcb-xf86dri0 libxcb-xfixes0 libxcb-xkb1 libxcb-xv0 libxcomposite1 libxcursor1 libxdamage1 libxfixes3 libxfont1 libxfreerdp-client1.1 libxft2
  libxi6 libxinerama1 libxkbcommon-x11-0 libxkbcommon0 libxkbfile1 libxklavier16 libxml-parser-perl libxml-twig-perl libxml-xpathengine-perl libxmu6 libxpm4 libxrandr2
  libxrender1 libxres1 libxshmfence1 libxslt1.1 libxss1 libxt6 libxtst6 libxv1 libxvidcore4 libxvmc1 libxxf86dga1 libxxf86vm1 libyajl2 libyaml-0-2 libyaml-libyaml-perl
  libyelp0 libytnef0 libzapojit-0.0-0 libzbar0 libzeitgeist-2.0-0 libzephyr4 libzmq5 libzvbi-common libzvbi0 lightsoff lintian lp-solve lua-lpeg mcp-account-manager-uoa
  media-player-info mesa-va-drivers metacity metacity-common mobile-broadband-provider-info modemmanager mousetweaks mutter mutter-common nautilus nautilus-data
  nautilus-sendto ndiff netpbm network-manager network-manager-gnome network-manager-pptp nmap notification-daemon p11-kit p11-kit-modules patchutils perl perl-base
  perl-modules-5.22 pidgin-data pinentry-gnome3 polari policykit-1 policykit-1-gnome poppler-data ppp pptp-linux pulseaudio pulseaudio-module-bluetooth
  pulseaudio-module-x11 pulseaudio-utils python-appindicator python-bs4 python-cairo python-chardet python-dbus python-gconf python-gi python-gnome2 python-gobject
  python-gobject-2 python-gtk2 python-html5lib python-lxml python-notify python-numpy python-pyatspi python-pyorbit python-six python-talloc python-wnck python-xdg
  python3-aptdaemon python3-aptdaemon.gtk3widgets python3-aptdaemon.pkcompat python3-brlapi python3-bs4 python3-cairo python3-cups python3-cupshelpers python3-defer
  python3-gi-cairo python3-html5lib python3-louis python3-lxml python3-mako python3-markupsafe python3-pyatspi python3-speechd python3-uno python3-xdg qttranslations5-l10n
  quadrapassel realmd rhythmbox rhythmbox-data rhythmbox-plugin-cdrecorder rhythmbox-plugin-zeitgeist rhythmbox-plugins rtkit rygel rygel-playbin rygel-tracker samba-libs
  seahorse seahorse-daemon session-migration sessioninstaller signon-keyring-extension signon-plugin-oauth2 signon-plugin-password signon-ui signon-ui-service signon-ui-x11
  signond simple-scan snapd snapd-login-service sound-theme-freedesktop speech-dispatcher speech-dispatcher-audio-plugins spice-client-glib-usb-acl-helper squashfs-tools
  swell-foop system-config-printer-common system-config-printer-gnome system-config-printer-udev t1utils tali telepathy-gabble telepathy-haze telepathy-idle
  telepathy-logger telepathy-mission-control-5 telepathy-rakia telepathy-salut totem totem-common totem-plugins tracker tracker-extract tracker-gui tracker-miner-fs
  transfig transmission-common transmission-gtk ubuntu-mono ubuntu-system-service ubuntu-touch-sounds udisks2 unity-asset-pool unity-control-center
  unity-control-center-faces unity-control-center-signon unity-settings-daemon uno-libs3 unoconv unzip upower ure usb-modeswitch usb-modeswitch-data usbmuxd va-driver-all
  vinagre vino wamerican whois wodim wpasupplicant x11-common x11-utils x11-xkb-utils x11-xserver-utils xboard xbrlapi xdg-user-dirs-gtk xdg-utils xfonts-100dpi xfonts-base
  xfonts-encodings xfonts-utils xserver-common xserver-xephyr xserver-xorg xserver-xorg-core xserver-xorg-input-all xserver-xorg-input-evdev xserver-xorg-input-synaptics
  xserver-xorg-input-vmmouse xserver-xorg-input-wacom xserver-xorg-video-all xserver-xorg-video-amdgpu xserver-xorg-video-ati xserver-xorg-video-fbdev
  xserver-xorg-video-intel xserver-xorg-video-nouveau xserver-xorg-video-qxl xserver-xorg-video-radeon xserver-xorg-video-vesa xserver-xorg-video-vmware xul-ext-ubufox yelp
  yelp-xsl zeitgeist-core zenity zenity-common zip
Suggested packages:
  gnome-cards-data argyll-doc gir1.2-colordgtk-1.0 aspell-doc spellutils avahi-autoipd db5.3-util doc-base vcdimager libdvdcss2 dvdauthor readom gnome-video-effects-frei0r
  chromium | chromium-browser colord-sensor-argyll gcc-5-locales cdrskin unrar evolution-ews evolution-plugins-experimental evolution-data-server-dbg arj lha lzip lzop
  ncompress p7zip-full rzip sharutils unace unalz unar zoo fonts-lyx g++-5-multilib gcc-5-doc libstdc++6-5-dbg gawk-doc gcc-5-multilib libgcc1-dbg libgomp1-dbg libitm1-dbg
  libatomic1-dbg libasan2-dbg liblsan0-dbg libtsan0-dbg libubsan0-dbg libcilkrts5-dbg libmpx0-dbg libquadmath0-dbg gconf-defaults-service zeitgeist-datahub cdrkit-doc
  ghostscript-x hpijs gimp-help-en | gimp-help gimp-data-extras xul-ext-adblock-plus xul-ext-gnome-keyring iceweasel-l10n-all bbchess crafty fruit glaurung gnuchess phalanx
  sjeng stockfish toga2 libcanberra-gtk-module gnome-hearts gnome-system-tools apache2-bin libapache2-mod-dnssd gnome-video-effects-extra gnupg-doc parcimonie xloadimage
  frei0r-plugins samba-common python-evolution hunspell openoffice.org-hunspell | openoffice.org-core ibus-clutter ibus-doc ibus-qt4 imagemagick-doc autotrace enscript
  ffmpeg gnuplot grads graphviz hp2xx html2ps mplayer povray radiance sane-utils texlive-base-bin ufraw-batch click powerd unity-system-compositor
  unity-greeter-session-broadcast pstoedit dia | dia-gnome libsvg-perl libxml-xql-perl python-uniconvertor ruby libesd0 | libesd-alsa0 alsa-utils nas libgssapi-perl
  libbluray-bdj libbonobo2-bin cdrdao gstreamer1.0-fluendo-mp3 libfont-freetype-perl libcanberra-gtk0 libchromaprint-tools python-acoustid libgles2-mesa | libgles2
  firmware-crystalhd libdv-bin oss-compat libenchant-voikko exiv2 fcitx libfftw3-bin libfftw3-dev alsa-base libgd-tools glew-utils libgnomevfs2-bin gamin | fam
  gnome-mime-data gpgsm gphoto2 grilo-plugins-0.2 fonts-droid texlive-lang-cjk gsl-ref-psdoc | gsl-doc-pdf | gsl-doc-info | gsl-ref-html libvisual-0.4-plugins
  gstreamer1.0-tools libgtk2-perl-doc libdata-dump-perl libusbmuxd-tools jackd2 libjasper-runtime liblcms2-utils lightdm liblinear-tools liblinear-dev lirc
  libcrypt-ssleay-perl minissdpd natpmp-utils avahi-autoipd | zeroconf opus-tools libhtml-template-perl libxml-simple-perl pcscd libtcl8.6 libtk8.6 libqt5libqgtk2
  qt5-image-formats-plugins qtwayland5 raptor2-utils rasqal-utils libraw1394-doc librdf-storage-postgresql librdf-storage-mysql librdf-storage-sqlite
  librdf-storage-virtuoso redland-utils libreoffice-base ocl-icd-libopencl1 libreoffice-style-breeze libreoffice-style-hicontrast libreoffice-style-human
  libreoffice-style-oxygen libreoffice-style-sifr libreoffice-style-tango libreoffice-evolution fonts-crosextra-caladea fonts-crosextra-carlito libreoffice-gcj
  libreoffice-java-common default-jre | gcj-jre | openjdk-7-jre | openjdk-6-jre | sun-java5-jre | sun-java6-jre | java5-runtime | jre librsvg2-bin hplip libsane-extras
  sg3-utils sidplay-base sofia-sip-doc libspectre1-dbg speex srtp-utils libstdc++-5-doc unity-common url-dispatcher libwmf0.2-7-gtk libauthen-ntlm-perl xapian-tools
  libunicode-map8-perl libunicode-string-perl xml-twig-tools binutils-multiarch libtext-template-perl account-plugin-gadugadu account-plugin-groupwise account-plugin-icq
  account-plugin-irc account-plugin-mxit account-plugin-myspace account-plugin-sametime account-plugin-sip account-plugin-yahoojp account-plugin-zephyr
  network-manager-openconnect-gnome network-manager-openvpn-gnome network-manager-vpnc-gnome network-manager-pptp-gnome perl-doc libterm-readline-gnu-perl
  | libterm-readline-perl-perl pinentry-doc poppler-utils fonts-japanese-mincho | fonts-ipafont-mincho fonts-japanese-gothic | fonts-ipafont-gothic fonts-arphic-ukai
  fonts-arphic-uming fonts-nanum pavumeter pavucontrol paman paprefs python-dbus-doc python-dbus-dbg python-gnome2-doc python-gi-cairo python-gobject-2-dbg python-gtk2-doc
  python-genshi python-lxml-dbg python-lxml-doc gfortran python-nose python-numpy-dbg python-numpy-doc python3-genshi python3-lxml-dbg python3-beaker python-mako-doc
  rygel-mediathek rygel-preferences rygel-ruih tumbler libttspico-utils speech-dispatcher-doc-cs speech-dispatcher-festival speech-dispatcher-flite python3-smbc gromit xfig
  xfsprogs reiserfsprogs exfat-utils btrfs-tools mdadm cryptsetup-bin gnome-screensaver | xscreensaver gnome-screensaver java5-runtime comgt wvdial libfglrx-amdxvba1 wpagui
  libengine-pkcs11-openssl mesa-utils nickle cairo-5c xorg-docs-core xfonts-scalable gpointing-device-settings touchfreeze xinput firmware-amd-graphics
  xserver-xorg-video-r128 xserver-xorg-video-mach64
Recommended packages:
  ubuntu-control-center-signon
The following NEW packages will be installed:
  account-plugin-aim account-plugin-google account-plugin-jabber account-plugin-salut account-plugin-yahoo acl adwaita-icon-theme aisleriot alacarte anacron apg
  app-install-data appstream aptdaemon aptdaemon-data argyll argyll-ref aspell aspell-en at-spi2-core avahi-daemon avahi-utils baobab bijiben bluez bluez-obexd bogofilter
  bogofilter-bdb bogofilter-common brasero brasero-cdrkit brasero-common caribou caribou-antler cheese cheese-common chrome-gnome-shell colord colord-data cracklib-runtime
  cups-pk-helper dbus-x11 dconf-cli dconf-editor dconf-gsettings-backend dconf-service dconf-tools desktop-base desktop-file-utils dictionaries-common diffstat dirmngr
  dleyna-renderer dleyna-server dns-root-data dnsmasq-base dvd+rw-tools emacsen-common empathy empathy-common enchant eog espeak-data evince evince-common evolution
  evolution-common evolution-data-server evolution-data-server-common evolution-data-server-online-accounts evolution-plugins fairymax file-roller finger firefox
  five-or-more folks-common fontconfig fontconfig-config fonts-cantarell fonts-dejavu-core fonts-opensymbol fonts-stix four-in-a-row freepats freerdp-x11 gawk gconf-service
  gconf-service-backend gconf2 gconf2-common gcr gdisk gdm3 gedit gedit-common gedit-plugins genisoimage geoclue geoclue-2.0 geoclue-ubuntu-geoip ghostscript gimp gimp-data
  gir1.2-accountsservice-1.0 gir1.2-atk-1.0 gir1.2-atspi-2.0 gir1.2-caribou-1.0 gir1.2-champlain-0.12 gir1.2-clutter-1.0 gir1.2-clutter-gst-3.0 gir1.2-cogl-1.0
  gir1.2-coglpango-1.0 gir1.2-evince-3.0 gir1.2-freedesktop gir1.2-gck-1 gir1.2-gcr-3 gir1.2-gdata-0.0 gir1.2-gdesktopenums-3.0 gir1.2-gdkpixbuf-2.0 gir1.2-gdm-1.0
  gir1.2-geocodeglib-1.0 gir1.2-gfbgraph-0.2 gir1.2-git2-glib-1.0 gir1.2-gkbd-3.0 gir1.2-gmenu-3.0 gir1.2-gnomebluetooth-1.0 gir1.2-gnomedesktop-3.0 gir1.2-gnomekeyring-1.0
  gir1.2-goa-1.0 gir1.2-grilo-0.2 gir1.2-gst-plugins-base-1.0 gir1.2-gstreamer-1.0 gir1.2-gtk-3.0 gir1.2-gtkchamplain-0.12 gir1.2-gtkclutter-1.0 gir1.2-gtksource-3.0
  gir1.2-gucharmap-2.90 gir1.2-gweather-3.0 gir1.2-ibus-1.0 gir1.2-javascriptcoregtk-4.0 gir1.2-json-1.0 gir1.2-mediaart-2.0 gir1.2-mutter-3.0 gir1.2-networkmanager-1.0
  gir1.2-nmgtk-1.0 gir1.2-notify-0.7 gir1.2-packagekitglib-1.0 gir1.2-pango-1.0 gir1.2-peas-1.0 gir1.2-polkit-1.0 gir1.2-rb-3.0 gir1.2-rest-0.7 gir1.2-secret-1
  gir1.2-soup-2.4 gir1.2-telepathyglib-0.12 gir1.2-telepathylogger-0.2 gir1.2-totem-1.0 gir1.2-totem-plparser-1.0 gir1.2-tracker-1.0 gir1.2-upowerglib-1.0 gir1.2-vte-2.91
  gir1.2-webkit2-4.0 gir1.2-wnck-3.0 gir1.2-xkl-1.0 gir1.2-zeitgeist-2.0 gir1.2-zpj-0.0 gjs gkbd-capplet glib-networking glib-networking-common glib-networking-services
  gnome gnome-accessibility-themes gnome-backgrounds gnome-bluetooth gnome-calculator gnome-chess gnome-clocks gnome-color-manager gnome-contacts gnome-control-center
  gnome-control-center-data gnome-core gnome-desktop3-data gnome-dictionary gnome-disk-utility gnome-documents gnome-font-viewer gnome-games gnome-getting-started-docs
  gnome-icon-theme gnome-icon-theme-symbolic gnome-keyring gnome-klotski gnome-logs gnome-mahjongg gnome-maps gnome-menus gnome-mines gnome-music gnome-nettool
  gnome-nibbles gnome-online-accounts gnome-online-miners gnome-orca gnome-packagekit gnome-packagekit-data gnome-packagekit-session gnome-photos gnome-robots
  gnome-screenshot gnome-session gnome-session-bin gnome-session-common gnome-settings-daemon gnome-settings-daemon-schemas gnome-shell gnome-shell-common
  gnome-shell-extension-weather gnome-shell-extensions gnome-software gnome-software-common gnome-sound-recorder gnome-sudoku gnome-sushi gnome-system-log
  gnome-system-monitor gnome-terminal gnome-terminal-data gnome-tetravex gnome-themes-standard gnome-themes-standard-data gnome-tweak-tool gnome-user-guide gnome-user-share
  gnome-video-effects gnupg-agent gnupg2 goobox grilo-plugins-0.2-base grilo-plugins-0.2-extra growisofs gsettings-desktop-schemas gsettings-ubuntu-schemas gsfonts
  gstreamer1.0-clutter-3.0 gstreamer1.0-libav gstreamer1.0-nice gstreamer1.0-plugins-bad gstreamer1.0-plugins-bad-faad gstreamer1.0-plugins-bad-videoparsers
  gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-ugly-amr gstreamer1.0-pulseaudio gstreamer1.0-x gtk2-engines
  gtk2-engines-pixbuf gucharmap guile-2.0-libs gvfs gvfs-backends gvfs-bin gvfs-common gvfs-daemons gvfs-fuse gvfs-libs hamster-applet hamster-indicator hardening-includes
  hicolor-icon-theme hitori hoichess humanity-icon-theme hunspell-en-us hwdata i965-va-driver iagno ibus iio-sensor-proxy im-config imagemagick imagemagick-6.q16
  imagemagick-common indicator-applet indicator-application indicator-bluetooth indicator-datetime indicator-keyboard indicator-messages indicator-power indicator-sound
  inkscape ippusbxd iputils-arping liba52-0.7.4 libaa1 libaacs0 libabw-0.1-1v5 libaccount-plugin-1.0-0 libaccount-plugin-generic-oauth libaccount-plugin-google
  libaccounts-glib0 libaccounts-qt5-1 libamd2.4.1 libao-common libao4 libappindicator1 libappindicator3-1 libappstream-glib8 libappstream3 libapt-pkg-perl libart-2.0-2
  libasound2 libasound2-data libasound2-plugins libaspell15 libass5 libassuan0 libasyncns0 libatasmart4 libatk-adaptor libatk-bridge2.0-0 libatk1.0-0 libatk1.0-data
  libatkmm-1.6-1v5 libatspi2.0-0 libaudio2 libauthen-sasl-perl libavahi-core7 libavahi-glib1 libavahi-gobject0 libavahi-ui-gtk3-0 libavc1394-0 libavcodec-ffmpeg56
  libavfilter-ffmpeg5 libavformat-ffmpeg56 libavresample-ffmpeg2 libavutil-ffmpeg54 libbabl-0.1-0 libbdplus0 libblas-common libblas3 libbluetooth3 libbluray1 libbonobo2-0
  libbonobo2-common libbonoboui2-0 libbonoboui2-common libboost-date-time1.58.0 libboost-filesystem1.58.0 libbrasero-media3-1 libbrlapi0.6 libbs2b0 libburn4 libcaca0
  libcacard0 libcairo-gobject2 libcairo-perl libcairo2 libcairomm-1.0-1v5 libcamd2.4.1 libcamel-1.2-54 libcanberra-gtk3-0 libcanberra-gtk3-module libcanberra-pulse
  libcanberra0 libcapnp-0.5.3 libcaribou-common libcaribou-gtk-module libcaribou-gtk3-module libcaribou0 libccolamd2.9.1 libcdio-cdda1 libcdio-paranoia1 libcdio13
  libcdparanoia0 libcdr-0.1-1 libcgi-fast-perl libcgi-pm-perl libchamplain-0.12-0 libchamplain-gtk-0.12-0 libcheese-gtk25 libcheese8 libcholmod3.0.6 libchromaprint0
  libclass-accessor-perl libclone-perl libclucene-contribs1v5 libclucene-core1v5 libclutter-1.0-0 libclutter-1.0-common libclutter-gst-2.0-0 libclutter-gst-3.0-0
  libclutter-gtk-1.0-0 libcmis-0.5-5v5 libcogl-common libcogl-pango20 libcogl-path20 libcogl20 libcolamd2.9.1 libcolord-gtk1 libcolord2 libcolorhug2 libcoverart1
  libcoverartcc1v5 libcrack2 libcryptui0a libcrystalhd3 libdaemon0 libdata-alias-perl libdatrie1 libdbusmenu-glib4 libdbusmenu-gtk3-4 libdbusmenu-gtk4 libdc1394-22 libdca0
  libdconf1 libde265-0 libdee-1.0-4 libdigest-hmac-perl libdiscid0 libdjvulibre-text libdjvulibre21 libdleyna-connector-dbus-1.0-1 libdleyna-core-1.0-3 libdmapsharing-3.0-2
  libdotconf0 libdouble-conversion1v5 libdrm-amdgpu1 libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdv4 libdvdnav4 libdvdread4 libe-book-0.1-1 libebackend-1.2-10
  libebook-1.2-16 libebook-contacts-1.2-2 libecal-1.2-19 libedata-book-1.2-25 libedata-cal-1.2-28 libedataserver-1.2-21 libedataserverui-1.2-1 libegl1-mesa
  libemail-valid-perl libenchant1c2a libencode-locale-perl libeot0 libepoxy0 libespeak1 libetonyek-0.1-1 libevdev2 libevdocument3-4 libevent-2.0-5 libevolution libevview3-3
  libexempi3 libexif12 libexiv2-14 libexporter-tiny-perl libexttextcat-2.0-0 libexttextcat-data libfaad2 libfarstream-0.2-5 libfcgi-perl libfcitx-config4 libfcitx-gclient0
  libfcitx-utils0 libfftw3-double3 libfftw3-single3 libfile-basedir-perl libfile-desktopentry-perl libfile-listing-perl libfile-mimeinfo-perl libflac8 libflite1
  libfluidsynth1 libfolks-eds25 libfolks-telepathy25 libfolks25 libfont-afm-perl libfontconfig1 libfontenc1 libfreehand-0.1-1 libfreerdp-cache1.1 libfreerdp-client1.1
  libfreerdp-codec1.1 libfreerdp-common1.1.0 libfreerdp-core1.1 libfreerdp-crypto1.1 libfreerdp-gdi1.1 libfreerdp-locale1.1 libfreerdp-plugins-standard
  libfreerdp-primitives1.1 libfreerdp-rail1.1 libfreerdp-utils1.1 libfwupd1 libgail-3-0 libgail-common libgail18 libgbm1 libgc1c2 libgcab-1.0-0 libgck-1-0 libgconf-2-4
  libgcr-3-common libgcr-base-3-1 libgcr-ui-3-1 libgd3 libgdata-common libgdata22 libgdict-1.0-9 libgdict-common libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgdm1
  libgee-0.8-2 libgegl-0.3-0 libgeoclue-2-0 libgeoclue0 libgeocode-glib0 libgeonames0 libgfbgraph-0.2-0 libgfortran3 libgif7 libgimp2.0 libgit2-24 libgit2-glib-1.0-0
  libgjs0e libgl1-mesa-dri libgl1-mesa-glx libglade2-0 libglapi-mesa libglew1.13 libglib-perl libglib2.0-bin libglibmm-2.4-1v5 libglu1-mesa libgme0 libgmime-2.6-0
  libgnome-2-0 libgnome-bluetooth13 libgnome-desktop-3-12 libgnome-keyring-common libgnome-keyring0 libgnome-menu-3-0 libgnome2-0 libgnome2-bin libgnome2-common
  libgnomecanvas2-0 libgnomecanvas2-common libgnomekbd-common libgnomekbd8 libgnomeui-0 libgnomeui-common libgnomevfs2-0 libgnomevfs2-common libgnomevfs2-extra
  libgoa-1.0-0b libgoa-1.0-common libgoa-backend-1.0-1 libgom-1.0-0 libgom-1.0-common libgpgme11 libgphoto2-6 libgphoto2-l10n libgphoto2-port12 libgpod-common libgpod4
  libgraphite2-3 libgrilo-0.2-1 libgs9 libgs9-common libgsf-1-114 libgsf-1-common libgsf-bin libgsl2 libgsm1 libgsound0 libgssdp-1.0-3 libgstreamer-plugins-bad1.0-0
  libgstreamer-plugins-base1.0-0 libgstreamer-plugins-good1.0-0 libgstreamer1.0-0 libgtk-3-0 libgtk-3-bin libgtk-3-common libgtk-vnc-2.0-0 libgtk2-perl libgtk2.0-0
  libgtk2.0-bin libgtk2.0-common libgtkglext1 libgtkmm-2.4-1v5 libgtkmm-3.0-1v5 libgtksourceview-3.0-1 libgtksourceview-3.0-common libgtkspell0 libgtkspell3-3-0
  libgtop-2.0-10 libgtop2-common libgucharmap-2-90-7 libgudev-1.0-0 libgupnp-1.0-4 libgupnp-av-1.0-2 libgupnp-dlna-2.0-3 libgupnp-igd-1.0-4 libgusb2 libgvnc-1.0-0
  libgweather-3-6 libgweather-common libgxps2 libharfbuzz-icu0 libharfbuzz0b libhtml-form-perl libhtml-format-perl libhtml-parser-perl libhtml-tagset-perl libhtml-tree-perl
  libhttp-cookies-perl libhttp-daemon-perl libhttp-date-perl libhttp-message-perl libhttp-negotiate-perl libhttp-parser2.1 libhunspell-1.3-0 libhyphen0 libibus-1.0-5
  libical1a libice6 libidl-2-0 libido3-0.1-0 libiec61883-0 libieee1284-3 libijs-0.35 libilmbase12 libimage-magick-perl libimage-magick-q16-perl libimobiledevice6
  libindicator3-7 libindicator7 libinput-bin libinput10 libio-html-perl libio-pty-perl libio-socket-inet6-perl libio-socket-ssl-perl libio-string-perl libipc-run-perl
  libipc-system-simple-perl libisofs6 libjack-jackd2-0 libjansson4 libjasper1 libjavascriptcoregtk-3.0-0 libjavascriptcoregtk-4.0-18 libjbig2dec0 libjson-glib-1.0-0
  libjson-glib-1.0-common libjte1 libkate1 libkpathsea6 libksba8 liblangtag-common liblangtag1 liblapack3 liblcms2-2 libldb1 liblightdm-gobject-1-0 liblinear3
  liblircclient0 liblist-moreutils-perl libllvm6.0 liblouis-data liblouis9 liblqr-1-0 libltdl7 liblua5.3-0 liblwp-mediatypes-perl liblwp-protocol-https-perl libmad0
  libmagick++-6.q16-5v5 libmagickcore-6.q16-2 libmagickcore-6.q16-2-extra libmagickwand-6.q16-2 libmailtools-perl libmbim-glib4 libmbim-proxy libmeanwhile1
  libmediaart-2.0-0 libmetacity-private3a libmhash2 libmimic0 libminiupnpc10 libmirclient9 libmircommon7 libmircore1 libmirprotobuf3 libmission-control-plugins0
  libmjpegutils-2.1-0 libmm-glib0 libmms0 libmng2 libmodplug1 libmozjs-24-0v5 libmp3lame0 libmpeg2-4 libmpeg2encpp-2.1-0 libmpg123-0 libmplex2-2.1-0 libmspub-0.1-1
  libmtdev1 libmtp-common libmtp-runtime libmtp9 libmusicbrainz5-2 libmusicbrainz5cc2v5 libmutter0g libmwaw-0.3-3 libmythes-1.2-0 libnatpmp1 libnautilus-extension1a libndp0
  libneon27-gnutls libnet-dbus-perl libnet-dns-perl libnet-domain-tld-perl libnet-http-perl libnet-ip-perl libnet-libidn-perl libnet-smtp-ssl-perl libnet-ssleay-perl
  libnetfilter-conntrack3 libnetpbm10 libnice10 libnm-glib-vpn1 libnm-glib4 libnm-gtk-common libnm-gtk0 libnm-util2 libnm0 libnma-common libnma0 libnotify4 libnpth0
  libnss-mdns liboauth0 libodfgen-0.1-1 libofa0 libogg0 libopenal-data libopenal1 libopencore-amrnb0 libopencore-amrwb0 libopencv-calib3d2.4v5 libopencv-contrib2.4v5
  libopencv-core2.4v5 libopencv-features2d2.4v5 libopencv-flann2.4v5 libopencv-highgui2.4v5 libopencv-imgproc2.4v5 libopencv-legacy2.4v5 libopencv-ml2.4v5
  libopencv-objdetect2.4v5 libopencv-video2.4v5 libopenexr22 libopenjpeg5 libopus0 liborbit-2-0 liborbit2 liborc-0.4-0 liborcus-0.10-0v5 libp11-kit-gnome-keyring
  libpackagekit-glib2-16 libpagemaker-0.0-0 libpam-gnome-keyring libpanel-applet0 libpango-1.0-0 libpango-perl libpangocairo-1.0-0 libpangoft2-1.0-0 libpangomm-1.4-1v5
  libpangox-1.0-0 libpangoxft-1.0-0 libpaper-utils libpaper1 libparse-debianchangelog-perl libpciaccess0 libpcre16-3 libpcsclite1 libpeas-1.0-0 libpeas-1.0-0-python3loader
  libpeas-common libperlio-gzip-perl libpixman-1-0 libplist3 libpolkit-agent-1-0 libpolkit-backend-1-0 libpoppler-glib8 libpoppler58 libportaudio2 libpostproc-ffmpeg53
  libprotobuf-lite9v5 libproxy1v5 libpst4 libpulse-mainloop-glib0 libpulse0 libpulsedsp libpurple-bin libpurple0 libpwquality-common libpwquality1 libqmi-glib5 libqmi-proxy
  libqqwing2v5 libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5opengl5 libqt5printsupport5 libqt5qml5 libqt5quick5 libqt5sql5 libqt5sql5-sqlite libqt5svg5
  libqt5webkit5 libqt5widgets5 libqt5xml5 libquvi-scripts libquvi7 libraptor2-0 librasqal3 libraw1394-11 libraw15 librdf0 libreoffice-avmedia-backend-gstreamer
  libreoffice-base-core libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw libreoffice-gnome libreoffice-gtk libreoffice-impress libreoffice-math
  libreoffice-pdfimport libreoffice-style-elementary libreoffice-style-galaxy libreoffice-writer librest-0.7-0 librevenge-0.0-0 librhythmbox-core9 librsvg2-2
  librsvg2-common librygel-core-2.6-2 librygel-db-2.6-2 librygel-renderer-2.6-2 librygel-renderer-gst-2.6-2 librygel-server-2.6-2 libsamplerate0 libsane libsane-common
  libsbc1 libschroedinger-1.0-0 libsdl1.2debian libsecret-1-0 libsecret-common libsgutils2-2 libshine3 libshout3 libsidplay1v5 libsigc++-2.0-0v5 libsignon-extension1
  libsignon-glib1 libsignon-plugins-common1 libsignon-qt5-1 libsm6 libsmbclient libsnapd-glib1 libsnappy1v5 libsndfile1 libsocket6-perl libsodium18 libsofia-sip-ua-glib3
  libsofia-sip-ua0 libsonic0 libsoundtouch1 libsoup-gnome2.4-1 libsoup2.4-1 libsoxr0 libspandsp2 libspectre1 libspeechd2 libspeex1 libspeexdsp1 libspice-client-glib-2.0-8
  libspice-client-gtk-3.0-4 libsrtp0 libssh-gcrypt-4 libssh2-1 libstartup-notification0 libsub-name-perl libsuitesparseconfig4.4.6 libswresample-ffmpeg1 libswscale-ffmpeg3
  libtag1v5 libtag1v5-vanilla libtagc0 libtalloc2 libtbb2 libtdb1 libtelepathy-farstream3 libtelepathy-glib0 libtelepathy-logger3 libtevent0 libtext-levenshtein-perl
  libthai-data libthai0 libtheora0 libtie-ixhash-perl libtimezonemap-data libtimezonemap1 libtotem-plparser-common libtotem-plparser18 libtotem0 libtracker-control-1.0-0
  libtracker-miner-1.0-0 libtracker-sparql-1.0-0 libtwolame0 libtxc-dxtn-s2tc0 libudisks2-0 libumfpack5.7.1 libunity-control-center1 libunity-protocol-private0
  libunity-scopes-json-def-desktop libunity-settings-daemon1 libunity9 libupower-glib3 liburi-perl liburl-dispatcher1 libusbmuxd4 libusbredirhost1 libusbredirparser1
  libv4l-0 libv4lconvert0 libva1 libvisio-0.1-1 libvisual-0.4-0 libvo-aacenc0 libvo-amrwbenc0 libvorbis0a libvorbisenc2 libvorbisfile3 libvpx3 libvte-2.91-0
  libvte-2.91-common libwacom-bin libwacom-common libwacom2 libwavpack1 libwayland-client0 libwayland-cursor0 libwayland-egl1-mesa libwayland-server0 libwbclient0
  libwebkit2gtk-4.0-37 libwebkit2gtk-4.0-37-gtk2 libwebkitgtk-3.0-0 libwebkitgtk-3.0-common libwebp5 libwebpdemux1 libwebrtc-audio-processing-0 libwildmidi-config
  libwildmidi1 libwinpr-crt0.1 libwinpr-dsparse0.1 libwinpr-environment0.1 libwinpr-file0.1 libwinpr-handle0.1 libwinpr-heap0.1 libwinpr-input0.1 libwinpr-interlocked0.1
  libwinpr-library0.1 libwinpr-path0.1 libwinpr-pool0.1 libwinpr-registry0.1 libwinpr-rpc0.1 libwinpr-sspi0.1 libwinpr-synch0.1 libwinpr-sysinfo0.1 libwinpr-thread0.1
  libwinpr-utils0.1 libwmf-bin libwmf0.2-7 libwnck-3-0 libwnck-3-common libwnck-common libwnck22 libwpd-0.10-10 libwpg-0.3-3 libwps-0.4-4 libwww-perl libwww-robotrules-perl
  libx11-protocol-perl libx11-xcb1 libx264-148 libx265-79 libxapian22v5 libxatracker2 libxaw7 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-icccm4 libxcb-image0
  libxcb-keysyms1 libxcb-present0 libxcb-randr0 libxcb-render-util0 libxcb-render0 libxcb-shape0 libxcb-shm0 libxcb-sync1 libxcb-util1 libxcb-xf86dri0 libxcb-xfixes0
  libxcb-xkb1 libxcb-xv0 libxcomposite1 libxcursor1 libxdamage1 libxfixes3 libxfont1 libxfreerdp-client1.1 libxft2 libxi6 libxinerama1 libxkbcommon-x11-0 libxkbcommon0
  libxkbfile1 libxklavier16 libxml-parser-perl libxml-twig-perl libxml-xpathengine-perl libxmu6 libxpm4 libxrandr2 libxrender1 libxres1 libxshmfence1 libxslt1.1 libxss1
  libxt6 libxtst6 libxv1 libxvidcore4 libxvmc1 libxxf86dga1 libxxf86vm1 libyajl2 libyaml-0-2 libyaml-libyaml-perl libyelp0 libytnef0 libzapojit-0.0-0 libzbar0
  libzeitgeist-2.0-0 libzephyr4 libzmq5 libzvbi-common libzvbi0 lightsoff lintian lp-solve lua-lpeg mcp-account-manager-uoa media-player-info mesa-va-drivers metacity
  metacity-common mobile-broadband-provider-info modemmanager mousetweaks mutter mutter-common nautilus nautilus-data nautilus-sendto ndiff netpbm network-manager
  network-manager-gnome network-manager-pptp nmap notification-daemon p11-kit p11-kit-modules patchutils pidgin-data pinentry-gnome3 polari policykit-1 policykit-1-gnome
  poppler-data ppp pptp-linux pulseaudio pulseaudio-module-bluetooth pulseaudio-module-x11 pulseaudio-utils python-appindicator python-bs4 python-cairo python-chardet
  python-dbus python-gconf python-gi python-gnome2 python-gobject python-gobject-2 python-gtk2 python-html5lib python-lxml python-notify python-numpy python-pyatspi
  python-pyorbit python-six python-talloc python-wnck python-xdg python3-aptdaemon python3-aptdaemon.gtk3widgets python3-aptdaemon.pkcompat python3-brlapi python3-bs4
  python3-cairo python3-cups python3-cupshelpers python3-defer python3-gi-cairo python3-html5lib python3-louis python3-lxml python3-mako python3-markupsafe python3-pyatspi
  python3-speechd python3-uno python3-xdg qttranslations5-l10n quadrapassel realmd rhythmbox rhythmbox-data rhythmbox-plugin-cdrecorder rhythmbox-plugin-zeitgeist
  rhythmbox-plugins rtkit rygel rygel-playbin rygel-tracker samba-libs seahorse seahorse-daemon session-migration sessioninstaller signon-keyring-extension
  signon-plugin-oauth2 signon-plugin-password signon-ui signon-ui-service signon-ui-x11 signond simple-scan snapd snapd-login-service sound-theme-freedesktop
  speech-dispatcher speech-dispatcher-audio-plugins spice-client-glib-usb-acl-helper squashfs-tools swell-foop system-config-printer-common system-config-printer-gnome
  system-config-printer-udev t1utils tali telepathy-gabble telepathy-haze telepathy-idle telepathy-logger telepathy-mission-control-5 telepathy-rakia telepathy-salut totem
  totem-common totem-plugins tracker tracker-extract tracker-gui tracker-miner-fs transfig transmission-common transmission-gtk ubuntu-mono ubuntu-system-service
  ubuntu-touch-sounds udisks2 unity-asset-pool unity-control-center unity-control-center-faces unity-control-center-signon unity-settings-daemon uno-libs3 unoconv unzip
  upower ure usb-modeswitch usb-modeswitch-data usbmuxd va-driver-all vinagre vino wamerican whois wodim wpasupplicant x11-common x11-utils x11-xkb-utils x11-xserver-utils
  xboard xbrlapi xdg-user-dirs-gtk xdg-utils xfonts-100dpi xfonts-base xfonts-encodings xfonts-utils xserver-common xserver-xephyr xserver-xorg xserver-xorg-core
  xserver-xorg-input-all xserver-xorg-input-evdev xserver-xorg-input-synaptics xserver-xorg-input-vmmouse xserver-xorg-input-wacom xserver-xorg-video-all
  xserver-xorg-video-amdgpu xserver-xorg-video-ati xserver-xorg-video-fbdev xserver-xorg-video-intel xserver-xorg-video-nouveau xserver-xorg-video-qxl
  xserver-xorg-video-radeon xserver-xorg-video-vesa xserver-xorg-video-vmware xul-ext-ubufox yelp yelp-xsl zeitgeist-core zenity zenity-common zip
The following packages will be upgraded:
  cpp-5 g++-5 gcc-5 gcc-5-base libasan2 libatomic1 libcc1-0 libcilkrts5 libdrm-common libdrm2 libgcc-5-dev libglib2.0-0 libgomp1 libitm1 liblsan0 libmpx0 libperl5.22
  libpolkit-gobject-1-0 libquadmath0 libstdc++-5-dev libstdc++6 libtsan0 libubsan0 perl perl-base perl-modules-5.22
26 upgraded, 1272 newly installed, 0 to remove and 78 not upgraded.
Need to get 638 MB of archives.
After this operation, 2,557 MB of additional disk space will be used.
Do you want to continue? [Y/n] 










sudo apt-get install x11vnc
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages were automatically installed and are no longer required:
  linux-headers-4.4.0-87 linux-headers-4.4.0-87-generic linux-image-4.4.0-87-generic linux-image-extra-4.4.0-87-generic
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  libtcl8.6 libtk8.6 libvncclient1 libvncserver1 tcl tcl8.6 tk tk8.6 x11vnc-data
Suggested packages:
  tcl-tclreadline
The following NEW packages will be installed:
  libtcl8.6 libtk8.6 libvncclient1 libvncserver1 tcl tcl8.6 tk tk8.6 x11vnc x11vnc-data
0 upgraded, 10 newly installed, 0 to remove and 78 not upgraded.
Need to get 2,926 kB of archives.
After this operation, 9,674 kB of additional disk space will be used.
Do you want to continue? [Y/n]




vnc密码
sudo x11vnc -storepasswd /etc/x11vnc.pass


上面的无效，删掉






startx
sudo apt-get install xinit





sudo apt-get install tightvncserver 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  linux-headers-4.4.0-87 linux-headers-4.4.0-87-generic
  linux-image-4.4.0-87-generic linux-image-extra-4.4.0-87-generic
Use 'sudo apt autoremove' to remove them.
Suggested packages:
  tightvnc-java
The following NEW packages will be installed:
  tightvncserver
0 upgraded, 1 newly installed, 0 to remove and 78 not upgraded.
Need to get 633 kB of archives.


sudo apt-get install vnc4server tightvncserver vnc4server
Reading package lists... Done
Building dependency tree       
Reading state information... Done
tightvncserver is already the newest version (1.3.10-0ubuntu3).
The following packages were automatically installed and are no longer required:
  linux-headers-4.4.0-87 linux-headers-4.4.0-87-generic
  linux-image-4.4.0-87-generic linux-image-extra-4.4.0-87-generic
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  x11-apps x11-session-utils xbase-clients xbitmaps
Suggested packages:
  vnc-java mesa-utils x11-xfs-utils
The following NEW packages will be installed:
  vnc4server x11-apps x11-session-utils xbase-clients xbitmaps
0 upgraded, 5 newly installed, 0 to remove and 78 not upgraded.
Need to get 2,345 kB of archives.
After this operation, 8,164 kB of additional disk space will be used.
Do you want to continue? [Y/n] 

删掉

$ sudo apt-get install xrdp vnc4server xbase-clients
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  linux-headers-4.4.0-87 linux-headers-4.4.0-87-generic linux-image-4.4.0-87-generic linux-image-extra-4.4.0-87-generic
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  x11-apps x11-session-utils xbitmaps
Suggested packages:
  vnc-java mesa-utils x11-xfs-utils
The following NEW packages will be installed:
  vnc4server x11-apps x11-session-utils xbase-clients xbitmaps xrdp


sudo dconf-editor
依次展开org->gnome->desktop->remote-access，然后取消 “requlre-encryption”的勾选


$ vncserver
sudo netstat -tlup | grep vnc
sudo netstat -anp | grep 5900
sudo /etc/init.d/xrdp restart

sudo iptables -I INPUT -p tcp --dport 5901 -j ACCEPT

nc -z -w 1 47.92.87.217 5901


可以使用如下的方法启动多个桌面的VNC：

vncserver :1
vncserver :2
vncserver :3


sudo  vncserver -kill :1       
sudo  vncserver -kill :2
数字 1 为桌面号，对应客户端的端口为5901，以此类推2,3,4.... 

 nano ~/.vnc/xstartup

替换为如下内容：

#!/bin/shxrdb $HOME/.Xresources

xsetroot -solid grey

x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &

# x-window-manager &

gnome-session &



gnome&

（使用GNOME桌面）

tightvncserver -geometry 1024x720 :1




 sudo apt-get install xinetd
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  linux-headers-4.4.0-87 linux-headers-4.4.0-87-generic
  linux-image-4.4.0-87-generic linux-image-extra-4.4.0-87-generic
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  libfile-copy-recursive-perl update-inetd
The following NEW packages will be installed:
  libfile-copy-recursive-perl update-inetd xinetd
0 upgraded, 3 newly installed, 0 to remove and 78 not upgraded.
Need to get 147 kB of archives.
After this operation, 493 kB of additional disk space will be used.





最后，就是使RealVNC Server服务生效并启动了。如果你想使用RealVNC 的Server模式，则使用如下命令：

# systemctl enable vncserver-x11-serviced.service
# systemctl start vncserver-x11-serviced.service

如果你想使用Virtual模式，则使用如下命令：

# systemctl enable vncserver-virtuald.service
# systemctl start vncserver-virtuald.service







sudo apt-get install x-window-system-core
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Note, selecting 'xorg' instead of 'x-window-system-core'
The following packages were automatically installed and are no longer required:
  linux-headers-4.4.0-87 linux-headers-4.4.0-87-generic
  linux-image-4.4.0-87-generic linux-image-extra-4.4.0-87-generic
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  xfonts-scalable xinput xorg-docs-core
Suggested packages:
  xorg-docs xfonts-75dpi x11-xfs-utils
The following NEW packages will be installed:
  xfonts-scalable xinput xorg xorg-docs-core
0 upgraded, 4 newly installed, 0 to remove and 73 not upgraded.
Need to get 374 kB of archives.
After this operation, 702 kB of additional disk space will be used.
Do you want to continue? [Y/n] 


sudo apt-get install gdm




ssh alex@192.168.0.82
vncserver -kill :1
vncserver :1 -geometry 1902x1080








