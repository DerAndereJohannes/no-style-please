---
layout: post
category: til
---

The only times I complain about my laptop are when the fans start spinning up for preventable reasons. This usually occurs, when I am using the browser on a JavaScript heavy website (i.e., most popular websites). 

However, I have noticed that this happens too if I am watching either a higher quality or higher frame rate video in MPV. To combat this, I always resorted to the typical (lazy) solution of just choosing the lower quality source to prevent the situation from occurring at all. It recently bugged me enough though, that I finally decided to look if there are any settings I can change to prevent the fan from spinning up at all for any video source. 

It literally took me 30 seconds. Seriously, 30 seconds of googling to come to my answer and fix the problem for the rest of time. MPV doesn't use hardware acceleration by default! Whaaat! I have been using software decoding this entire time while the hardware specialized for the task was just sitting there doing nothing! **- facepalm -**


> For the reason why the decision is how it is, it is given in the man page or on [their website](https://mpv.io/manual/master/#options-hwdec){:target="_blank"}. I am unsure if it is a sound reasoning, but I am unaware of the process of creating a media player, so what would I know. 


Thankfully, enabling hardware acceleration is as simple as using `Ctrl+h` while watching a video, or setting it as default by changing a setting in the config file:

```sh
johannes@deb:~$ echo "hwdec=auto" >> ~/.config/mpv/mpv.conf
```


To demonstrate the effects that this simple change has on the resource utilization of MPV before and after the change, I decided to use my laptop to the extreme by attempting to play 4K 60fps clip on my PC. More specifically, the video clip is encoded in V9 at a bit rate of 18901 kb/s, which is probably the most recent encoding standard that my laptop has specialized hardware for. 

To make the differences even more apparent, I decided to also include the performance metrics from playing the clip in my Firefox (102esr) and Chromium (109) browsers to see how they would compare. The browsers also have hardware acceleration enabled, so they *should* supposedly also be using it. You can imagine playing the video in the browser to be the best case scenario for watching the same clip on a browser (i.e., through YouTube or any other video streaming website) before all the other JavaScript faff is added alongside it. Before we do, here are some details about the experiment:

* Hardware: Intel i5-8350U (Intel UHD Graphics 620), 24 GB RAM.
* Total PC RAM is being used (including all other processes).
* For clarification on the (non-scientific) process of getting these results: I used htop to monitor the resources and took a screenshot at about the same timestamp of the test clip. 

Now, without further ado:

| Video Player  | CPU Utilization (%) | PC RAM Consumption (MB)  |
| ----- |:--------------:|:----------------:|
| Firefox 102esr | 264 | 1150 |
| Chromium 109 | 477 | 946 |
| MPV (hwdec=off) | 222 | 962 |
| MPV (hwdec=auto) | 18 | 648 |

> Observation: Both Firefox and MPV with hwdec=off had trouble with very frequent frame drops, while the other two options played the file without a sweat.

Wow! What a difference! With a literal order of magnitude difference in resource useage, I think it is safe to say that my fan problem is no longer a problem. I find it amazing **how much of a difference you can even see between the most and least efficient players with a total of 460%**. 

This does add additional questions though. Are my browsers really using hardware acceleration? Is this just another Linux thing where it is not worth it for the developers to implement? These are perhaps questions I should look into next.

Regardless, this new find has really improved my life with allowing me to fast seek through very high quality videos while maintaining a nice and quiet room! :-)
