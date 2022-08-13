---
layout: post
category: rant
---
Facebook has been around for quite some time now, and it has evolved over the years to incorporate all the technical niceties that were exciting to experiment with when they came out. Credit where credit is due, Facebook managed to connect billions of people together[^1] and was a core part of interacting during high school and keeping up with them afterwards. Recently however, Facebook has come under much trouble after they decided to make their applications more like competitor TikTok[^2]. Users of Instagram, which is owned by Facebook, had the most backlash[^3] when it came to this decision which ultimately made the company revert the decision and spare the app... for now at least. 

This news was the final straw to break the camel's back for me and I felt like I had to take control of the situation of my presence on social media platforms. With the added news that Facebook's monthly active users had seen the first drop in the history of the company[^4], it implied to me that others were also getting fed up and looking to other solutions. From the outlook of Facebook, this drop can also be a sign as what is to come of the company as they will now have to act more desperate to regain a positive gradient irrespective of the user experience.

From all the news, I looked at the social media websites that I had on my phone and asked myself if I really need any of these at all. This motivated me to take a closer look and really think about which companies do I really want to support with my presence. Now, I am quite a data hoarder when it comes to my own information on the internet. Thus, it is important for me to be able to save the data that is stored on the servers about myself so that I have a backup in case I need it for any future uses or even for plain nostalgia sake. After perusing through my phone application list, LinkedIn, Twitter, Snapchat, Instagram, Discord and of course Facebook were all the social media applications that I had on my phone which were now neatly placed on the chopping block. Here is the outcome of what I did to each app:

- **LinkedIn**: I decided to keep my account as it is currently a useful tool to me for when I fully graduate from University later this year. App was uninstalled.
- **Twitter**: I had 2 accounts in total I had not touched in years. Nitter[^5] is a decent enough twitter viewer where no account is required. Data downloaded with no trouble. 2 Accounts deleted and app uninstalled.
- **Snapchat**: I had not used this in 4 years. The app was just sitting there. Data downloaded with trouble: when downloading the data, it will just include website links to your content and not the data itself. You **MUST** go through each link and download them individually yourself to really have all of your data. Malicious compliance really, but I did manage to get all my data so OK. Account deleted and app uninstalled.
- **Instagram**: I loved using Instagram with the open source Barninsta[^6] interface. It was actually enjoyable to use Instagram with all the additional features and removal of many annoying ones. However, Instagram started flagging my account and locking me out due to "suspicious behavior" which I guess is code word for "Not seeing any ads". Website downloaded without issue (the account deletion screen uses the very old Instagram which is a nice touch). Account deleted and app uninstalled.
- **Discord**: I still actively rely on Discord to speak with some good friends. As much as I would love to remove it, I have removed any trace of myself and am only in channels where relevant. App uninstalled.
- **Facebook**: The data request sends you your data partially as encrypted files with no possibility to access them.

Uhh, what?... so what happened with Facebook? Well... I am not too sure how they managed to mess this up like this? Honestly, I am not sure how it could have gone on for this long either. The GDPR has been in effect since 25th May 2018[^7] and I thought that these laws should have forced all companies to make this process easier with the threat of major fines to the companies who break them. So that we are all on the same page, let's take a look at which articles of the GDPR this is fundamentally breaking (in my opinion):
1. **Chapter 3, Section 2, Article 15:** Right of access by the data subject
2. **Chapter 3, Section 3, Article 20:** Right to data portability

Both of these articles basically should allow the data subject (me in this case) to access all the data that is held by the data controller. At the end of the day, it is my data that they are storing, so I should have the right to see it right? Unfortunately, if I cannot read the data that they send me, I do not think that it being in compliance with the above stated articles.

To prove that I really tried my absolute best to figure out what is going on here, I want to take you all on an adventure of the download attempts I had over the past week or so. Buckle up!

# The Quest for my Facebook Data!
I started my adventure of requesting downloads from Facebook back on the 29th July. Naive me looked at the download request page thinking how intuitive it looks, and I liked how you could really customize what sort of data you would like to download about yourself. The download format can be done in a human-readable way using a small HTML frontend and the machine-readable method of JSON can also be used. Neat! I clicked download and moved to doing something actually important. I woke up the next day excited to read an email that the process had completed and that I can download the data from their page. Awesome! I go ahead and bulk download all the zip files that contain my data. Upon first inspection, the files looked fine with everything neatly laid out into different folders. 

Suddenly, upon opening zip number 3 I was greeted with an odd looking file that did not match the style of the others. What is this? A .zip.enc file? Never heard of it! After googling for this file type, I came across the fileinfo page[^8] containing information about this file type. From the information on this page, it seems that it is a file type only found in the "Download Your Information" feature of Facebook and occurs if the data was not processed properly during the data retrieval. In other words "Mistakenly encrypted". To give the benefit of the doubt, I decided to just shrug and request my information again hoping that this was just true accident. You wouldn't believe what I managed to find the exact same problem. After this occurred again, I tried something that I never thought I would do ever in my life. I tried to find and contact Facebook support. 

Now, I am going to say this as directly as possible. Facebook support does not exist, and I am honestly not sure if it ever has. There is no phone number, no email address, no live chat. The only options that a normal user gets is a not so useful FAQ page and the ability to give feedback by the "Help us improve Facebook" and "Something went wrong" options. Oh boy, yes. Something did go wrong, please how can you help me? The option leads you to fill out a form with category, details, and you can even add a screenshot! Well, this is no help. Since it was my only option though, I did start off with being professional and giving the exact steps that I was doing and that there were problems with the output files. I also continued requesting downloads... 7 in total to be exact. No response from any up until now. Let's dig into my adventure even more!

# Timeline of Download attempts 
- **2022-07-28:** I was a happy man
- **2022-07-29:** All Time - High Quality - Everything - HTML
- **2022-07-30:** All Time - High Quality - Everything - HTML
- **2022-07-31:** All Time - High Quality - Everything - HTML
    - This one somehow took a really long time
- **2022-08-03:** All Time - High Quality - Everything - JSON
    - I was starting to go crazy, so I tried JSON output. Same problem. Was on the verge of giving up.
    - I also started collecting additional metadata of the downloads
- **2022-08-07:** All Time - High Quality - Everything - HTML
    - Back at it again!
- **2022-08-08:** All Time - High Quality - Everything - HTML
- **2022-08-09:** All Time - High Quality - Mixed - HTML
    - Here I started to look for the problem categories

# A Worrying Surprise

| Date  | Number of Zips | Total Size (GB)  |
| ----- |:--------------:|:----------------:|
| 2022-08-03 | 4 | 9.270 |
| 2022-08-07 | 5 | 9.914 |
| 2022-08-08 | 4 | 8.990 | 
| 2022-08-09 | N/A | 8.563 |

As mentioned in my timeline, on the 3rd of August I decided to also keep track of additional metadata of the files downloaded from the "Information Retrieval Tool". I was surprised to find how different each download was in terms of size. Some downloads had to be contained in 5 while others only had to take up 4. Each had its own unique total file size. I am uncertain if this is because Facebook fails to retrieve my information every time or if the encrypted files take up that much more space and fail differently every time. I am not sure. Though Can I be certain if I really am getting all my information even if it is correct?

# A Short Side Quest to View the Individual Files
On the 9th of August I decided to try and download each category they list individually to see where the .zip.enc files are coming from. 

While going through all the categories, I found an interesting discovery when getting the "Posts" category after wondering why the zip size was only 367 MB. Therefore, please take this word of warning into account: Under the "What's included?" section, they mention that "Your photos" are included in this section. They are not. Well... The photos you posted in your posts are included, but not the photos that you uploaded to an album. You might be thinking "well... duh... you downloaded the category specifically named posts" and I agree with you. However, the help text specifically states "Photos you've uploaded and shared". This wording would have me believe that the photos that I added to albums are also included in this upload. In order to download your albums, you have to go to them manually and click the download button for each one. This sounds like an easy fix, but imagine if you made 1000s of albums for all kinds of events which I know many people do. In addition, honestly why not include all albums as part of the download? Facebook obviously doesn't care about bandwidth or storage issues as they will let me recreate my broken information requests even though the tool does not work.

After going through each category each with surprising little data content, I could not find any encrypted files until I stumbled across the "messages" category. Total size: 8.168 GB. Wow, that's a lot! It was this section that was taking up all the space! Sure enough, the .zip.enc files were to be found here. After finding out about this, I was thinking maybe I set up some end-to-end encryption setting on Facebook. Alas, Facebook does not have such a setting. At least not yet. They announced two days ago that they are testing it out[^9]. I wonder if they would start using this excuse in the future when their retrieval tool still doesn't work and just say "But then it must be end-to-end encrypted!".

# A Short .zip.enc Tangent
For anyone who is interested, I decided to check up on the description that fileinfo [^8] gave with respect to the .zip.enc file actually being encrypted data and if I could trust that assertion. 

What I first wanted to see if the file wasn't just a regular zip file. This would have been very strange, however it was worth a try. Attempting to open the file in xarchiver just spat out an error message. I decided to take a closer look and see if the starting bytes (i.e. magic number) of the file matched anything else that it could be. The zip format has its magic number stored in little endian format as `0x04034b50`. If we take a look at the zip.enc file using some simple commands (where the Xs constitute my Facebook ID):
```sh
$ xxf facebook_XXXXXXXXXX.zip.enc | head -1
00000000: e358 f9f3 f6ba af13 5e49 e999 cae0 0625  .X......^I.....%
```
Guess it really is not a zip then. Due to endian format, we should have been seeing `00000000: 504b 0304 .....` at the start as mentioned before. The starting bytes do not match any other known file formats and encryption algorithms don't really tend to add any magic numbers to the header of their files, so the file could really either be complete random data or an encrypted/encoded version. It's not a trivial task to find out how exactly it was done though.

Just for fun, I decided to lastly check out the information entropy of the file in question. Basically checking out how random the file really is. On Debian Linux, there is a very handy command to test this out, so I had a go. The output has been slightly truncated:
```sh
$ ent facebook_XXXXXXXXXX.zip.enc
Entropy: 8.000000 bits per byte (perfect)
Chi Squared dist 514913145 samples at 269.73, random would exceed 25.17% of time.
Arithmetic Mean: 127.4979 (127.5 = random)
Monte Carlo value for Pi is 3.141541911 (0% error)
Serial Correlation coefficient is 0.000056 (uncorrelated = 0.0)
```

I won't go into too much detail about what all these values mean, but just give a general explanation of what this is showing. With an entropy of 8 bits per byte, all bits of information are required to keep a lossless version of the file and is therefore very dense. Very good encryption and compression algorithms target the 8bits per byte range as no space is being wasted and finding patterns in the file is tremendously difficult. Of course, there will be variations within the file, so it won't always be at 8, but to 7 significant figures is pretty good! 

The other test I wanted to describe a bit more was the Chi-squared test. In short the chi-square test tests to see if the variation in the collected data (my file) follows a particular given pattern (complete random sequence). The tool `ent` gives a value between 0% and 100% which indicates that the sequence is not random the more it tends towards the extremes. Comparing the information from my file to that of a random sequence would not exceed out value of 269.73 per sample 25.17% of the time (as well as the remaining values really) shows that the sequence is likely to be encrypted or just pure random. This would take any sort of file encoding out of the question, as file encoding would still reveal its inherent structure. This leaves with the possibility of this file being just random junk, or with it being encrypted. 

Since I am pretty sure that Facebook would not waste its bandwidth and storage facilities to host large random noise files, I think I can be pretty confident that these are just encrypted files that contain my information (Imagine if they included someone else's information?..).


# What to make out of it?
Facebook does not care about the GDPR. Facebook also does not want to fix the problem. The fact that the experience of requesting your own data was the worst on the largest social media platform compared to its competitors and even its own subsidiaries is completely unacceptable. I was expecting to be done with this task after one day of bulk downloading everything from every service. In the end, I find yet another example of seemingly gross malpractice with no way of being able to get help on the issue. You might not want to delete your Facebook account yet, but do realize that posts from various form websites about this issue have existed for at least 2 years[^10] and the situation seems to have only gotten worse. In addition, the fact that photos from your albums are not included at all with the tool, and they have to be manually downloaded elsewhere is unexpected and not fair to its users. I am still unsure whether I should just end up ignoring the encrypted message files and delete my account anyway. What is stopping me is that I do not know which messages these even are, and it is difficult to find out due to the total size of over 8 GB going all the way back to 2008.

If you are also interested in seeing if some or all of your messages are in this strange .zip.enc format, go ahead and check out the [Download Your Information](https://www.facebook.com/dyi/) page on Facebook and select the date range to be "All time". If you happen to also have .zip.enc files after a few times of trying, are an EU citizen and think this is violating your rights, I urge you to take 15 minutes of your time to submit a complaint to your National Data Protection Commission. You can find a [full list of these here](https://edpb.europa.eu/about-edpb/about-edpb/members_en).

---
{: data-content="References"}

[^1]: Data from Statista showing Facebook's monthly active user count https://www.statista.com/statistics/264810/number-of-monthly-active-facebook-users-worldwide/
[^2]: Facebook to make the Facebook app more like TikTok: https://www.nytimes.com/2022/07/21/technology/facebook-app-changes-home.html
[^3]: Instagram reverting changes to turning all TikTok: https://metro.co.uk/2022/07/29/instagram-u-turn-on-tiktok-style-changes-after-massive-backlash-17090562/
[^4]: Facebook MAU down for the first time in history: https://www.businessinsider.com/meta-facebook-user-numbers-shrink-first-time-ever-2022-2
[^5]: Nitter - Open source Twitter front-end: https://github.com/zedeus/Nitter
[^6]: Barninsta - Open source Instagram front-end (use at own risk for your account): https://f-droid.org/packages/me.austinhuang.instagrabber/
[^7]: GDPR timeline: https://edps.europa.eu/data-protection/data-protection/legislation/history-general-data-protection-regulation_en
[^8]: .zip.enc file format description: https://fileinfo.com/extension/zip.enc
[^9]: Facebook testing end-to-end: https://about.fb.com/news/2022/08/testing-end-to-end-encrypted-backups-and-more-on-messenger/
[^10]: Reddit post on the same issue: https://www.reddit.com/r/facebook/comments/kn5l8a/i_downloaded_an_export_of_my_data_from_facebook/
