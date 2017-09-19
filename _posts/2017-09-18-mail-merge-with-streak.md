---
title: Small-batch bespoke emails with Gmail and Streak
date: 2017-09-18 00:00:00 Z
---

You've seen the same boilerplate emails come into your inbox which you immediately archive for being wrong, out-of-date, or simply forgetting the merge tag (F you people that leave $FNAME). When it came to my first time sending out a batch email, it was only to a dozen or so people about booking user research time. However, I had a major sticking point thinking I was sending out a spammy email. Luckily I had met the team behind Streak and knew the power of mail merge to make something a little more individual and helpful.

We're going to continue using my real life example email, a sponsorship request for Hack Design. Here's the actual email template I sent out:

```
Hey there $FNAME,

Wanted to reach out about $COMPANY becoming a Hack Design partner. Since 2012, we've helped hundreds of thousands take their first steps in learning design. We're looking to partner with a handful of companies in order to offset server costs and support producing new lessons in 2018.

Partnership perks:

* Logo placement with link on the home page.
* Text link in our footer, 30,000+ page views per month.
* Text link in every email, 200,000+ which go out every month.
* Free posting on our job board, set to release by the end of the year.

As of right now, we have 245,000+ subscribers. It's likely that with new lessons going out next year, you'll see these numbers easily double. Because of that, our sponsorship tier costs $XXX per month. If you're able to commit to sponsoring before October 1st, I will grandfather you in to the super early bird pricing of $YYY per month through the end of 2018.

If you have any questions or are ready to sponsor, please hit reply.

$POSTSCRIPT

Thank you so much,
Alex Baldwin
```

My emails aren't very long, encourage replying as the primary action, and I hope use variables in a tasteful way.

## Make each email personal

You may have noticed the odd `$POSTSCRIPT` variable in my template. The P.S. at the end of the message is super easy for readers to skip to and it's almost guaranteed that it'll be read. That's the key to the whole thing. Almost every recipient I know personally or have done research on. It would be a huge missed opportunity to not acknowledge that personal connection. For speed purposes, it's easiest to do this part in Google Sheets.

1. Add another column called `Postscript` to your Google Sheet.
2. For each recipient write a custom note that will go at the end of your email, i.e. "P.S. It was super nice meeting you at SXSW 2017, still waiting for you to come visit San Francisco."
3. If you don't know them personally already, at least make the effort to do your research and make a connection. It's easy enough to comment on some of their work you admire, I'm talking to you recruiters who never look at my portfolio.
4. Export your Google Sheet to a CSV.

### Import your CSV into Streak

Thankfully since we've been working in Google Sheets, we'll be able to straight import into Streak without any fuss. 

1. [Install Streak](https://www.streak.com/) for your browser and open Gmail.
2. Go through the authentication flow for Streak.
3. From the Gmail sidebar, hit `Pipelines +New`.
4. Pick any of the types, I usually do `Business Development` and then quickly rename it to my project name.
5. Optionally, invite anyone else to collaborate on this pipeline.
6. On your pipeline page, press the gray more icon.
7. Click `Import boxes from Google Sheets`.
8. Follow yet another authentication process.
9. Go through the steps to finish your import by mapping your columns to Streak data. They have a lot of options, for those with more data feel free to connect it all up.

You'll see everything from Google Sheets, now nicely organized in your Streak pipeline as a `Lead`. You can now track as someone goes through your funnel to `Closed - Won`, it's the big time sales process for the little guy.

## Send out that hand-crafted email with Streak

After all that prep work, we're finally ready to put the pieces together. Getting used to the interface and finding the small links or buttons can be quite a chore. Streak is a tool meant for sending much larger batches for sales professionals. We can lay low under the quotas with basic features and get a ton out of it. 

When I was doing marketing for commercial real estate, we used to use Excel and Microsoft Word to send out massive mailing campaigns. The mail merge feature for Streak works just like it's offline Microsoft counterpart except with much better tracking and ability to follow up.

### Put it all together and get ready to hit send

1. Hit `Compose` in Gmail.
2. Click the link `Mail merge`.
3. Select your Streak pipeline as the recipients.
4. Write your beautiful email template and use the `Customize with Template` link at the bottom to sprinkle in customizations.
5. When you're subject line is perfect and your template customized hit `Send`, releasing your artisanal emails to their proper recipients.

## More coming soon

Next up we'll wrap by tracking and following up with our small batch of recipients.

This article is part two of a three part series, released weekly. You can [read part one here](/outbound-with-clearbit/). Subscribe to get access first.
