---
image: /assets/mpd.png
layout: post
title: Elevator Music
---

Like many people in the tech sector, I spend most of my day at a computer, and like many of those people I sometimes choose to listen to something in the background while I work. This can be a nice time filler as sometimes I find myself idle, waiting for certain actions (compilation, loading) to complete, but it is not so distracting that it takes me out of the thought process of whatever I am currently working on.

I've decided to write about some of the music software that I've been using, and what I like about each one. I'm a linux/terminal guy, so don't be too surprised when some of these programs don't come with your standard GUI (though you generally can find a graphical front-end for them). I'll also point out that while I do sometimes listen to pod-casts, I mostly listen to music and these programs will be discussed with a focus on their music listening features.

### mps-youtube

It's pretty funny that for many people, Youtube (a video service) has become their defacto __music__ streaming service. I know you and I have both done this, we open a video on youtube to listen to a specifc song or album, and background the tab as we really only care about the audio stream. We do this because Youtube is both on-demand _and_ free, two properties which do not exist on any currently available music streaming service. Google has started to catch onto [this](http://www.theverge.com/2014/11/12/7201969/youtube-music-key-new-subscription-service), but for now there are better ways to listen to Youtube if thats your preffered source.

![mpsyt]({{ site.url }}/assets/mpsyt.png)

[mpsyt](https://github.com/np1/mps-youtube) allows you to stream youtube audio (and video if you want it), from the command line. It has built in search and support for playlists, and is very easy to use. It cuts out the video that we generally don't care about, and exposes itself as a music service with an almost unlimited catalog. Whenever I find myself wanting to listen to a specific song (not immediately available somewhere else) or a live performance, this is usually my first stop.

It's easily installable on most distros (I mostly use Ubuntu so here):

```sh
$ sudo apt-get install python-pip
$ pip install mps-youtube
$ mpsyt
```

### Pianobar

Pandora is one of the old standbys in the now very crowded music streaming service space. Without going into who offers the best service (pandora vs spotify, etc.), I will say that I still like Pandora even if it may be falling behind in certain areas. It's still free to use and does a decent job of playing music you generally want to hear. It has the advantage that you can generally press play and it will play music for the rest of your workday without any further input. With some of the more on-demand options, I find that I will have gone 30 minutes before realizing that the music/playlist had stopped.

![mpsyt]({{ site.url }}/assets/pianobar.png)

[Pianobar](https://github.com/PromyLOPh/pianobar) is a terminal based Pandora client which has a few advantages over it's web based counterpart. Obviously it will use less system resources since you don't need fire up your web browser or open up another tab, but most importantly, it gives you __unlimited song skips__ with __no ads__, without needing to pay for Pandora's premium service. In addition, all of the pandora features you would expect are still available here (thumb up songs, channel creation), and I can't recommend it enough to any Pandora user.

Another easy one to get started with:

```sh
$ sudo apt-get install pianobar
$ pianobar
```

### mpd + ncmpcpp

Both of the previous programs have at least one thing in common, they both stream music from somewhere else. If you still have locally stored music collections (I do) or don't always have internet access (on a plane?), you might want something else:

![ncmpcpp]({{ site.url }}/assets/mpd.png)

For this purpose, I have been using [mpd](http://www.musicpd.org/) and [ncmpcpp](http://ncmpcpp.rybczak.net/). For those not familiar with this kind of setup, mpd runs as a server locally and plays your files, while ncmpcpp acts as a client to control mpd. Due to its' client-server archicture, the client does not actually have to be running on the same machine, and you also have the option to use other clients as well (see [mpc](http://www.musicpd.org/clients/mpc/)). While few users will probably make use of this flexibility, it's neat to at last know you have such options available.

These two are definitely geared towards power users. They have all of the features you could ask for in a music player and are easily scriptable due to their command line nature. You will also need to have a locally stored collection of music, making this combo somewhat less portable from machine to machine. Setup is more involved and will require some editing of config files, but at least both are available in most standard distro repos:

```sh
$ sudo apt-get install mpd ncmpcpp
```

### Others

I've also been trying Google Play Music as it allows the user to upload their music collection and stream that for free. This is very convenient and as such I have been meaning to see if there are any alternative clients (preferably terminal based) to their web based GUI.

Anyways, thats all I have this time. If you are new to any of these programs and have found them at all intriguing, I hope you give them a try. Next time I'll be writing about [FOSS](http://en.wikipedia.org/wiki/Free_and_open-source_software) video editing programs after a recent [Computerphile video](https://www.youtube.com/watch?v=MS7hXuO2UKE&list=UU9-y-6csu5WGm29I7JiwpnA) made me realize I had a few things to say on the subject. Thanks!
