---
title: "Hacking Convert to Case button"
date: 2018-08-19T09:59:50+02:00
draft: true
---



I have to thank Mycroft for the idea I present in this blog post. This time he complained about the Convert to case functionality.

When you grab an email from some queue, you can convert it to a Case. This is a built in feature and it works as it should. An email has a From field and when you convert the case, the system sets the customer field to that value. The problem is that it is a contact. Since everything regarding billing is account oriented, you have to change the name of the one that sent you the message to the account to which they belong. Mycroft was complaining about how annoying it was always having to do it by hand.



So I thought about it and came up with an idea: There is an origin field in the Case entity. If you instruct the app to convert your mail, it sets the origin to Email. So I made a simple plugin that fires on case creation, checks wheter there is a value in the origin field and if the value is set to Email, it looks up the parent account of the contact and updates the value of the Customer field. Here is the (final) code:



I registered the plugin step as a Pre operation and tested it. After some trial and error, I managed to make it work.



A few weeks later, Mycroft came to me again. I have to say that in the meantime others have spotted that functionality too (mostly due to my coworker who puts together a document weekly, that outlines all changes that happend during the week) and none of them experienced any problem. But Mycroft is a pro bug finder and he proved it once more this time.



He is the only one in our company, who uses CRM for Outlook plugin. This interesting pile of software caused numerous problems before, but he insists to use it anyway.



When you convert the case through Outlook, unlike the webapp it leaves the origin field empty. And that prevented my plugin to fire.



So I had to fix it. I found another idea: let’s query the service for all emails regarding this case. I used the advanced find form to get the FetchXML query and put everything together.



Dodaj gif, kako pogledaš FetchXML



Insert Slow down meme here...



But...



The catch is that my plugin fires before the case starts to exist. Therefore the system doesn’t have it’s GUID yet, so it can’t set the regarding field in the mail record and so the mail cannot be found as related to the case.



That bugged me. I reimagined the situation and thought, maybe I could set the step to Post operation, but that did not work either. I stood up and took a walk from my desk to the toilet. Then I asked my boss, how frequently does he set the customer field to a contact and he replied that he can’t remember any occasion.



OK... there you go. I deleted every check connected to the regarding mail and that was it. The code became so simple, that I set up a workflow instead:



Moral of the story

Man, I did it again. The same mistake I keep repeating over and over again.

Try not to overdo your ideas. Usually the solution is just a few clicks away and you really should think about it bedore you code.

Thank you, for your attention!