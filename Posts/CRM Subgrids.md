# CRM Subgrids
Aww yeah, my blog post!!
* povej za HTTPS
* povej, zakaj rabiš
* povej, kako si dobil URL
* povej, kako si rešil

I tested my assumptions using an IFrame directly on the form. Dynamics' Form Editor allows you to add a WebResource onto a form, but it also allow you to put just an Iframe. You provide the URL and the content pops up. Yaay! The ribbon worked.

I was looking at the bare iframe - it was working but my solution wasn't. And I imagined it working. Then a brilliant idea hit my mind. What if I could just adjust the url of the working frame? And it turned out to be just the thing I was looking for. When I was configuring the IFrame I totally overlooked the last tab called Events. There you have an option to attach an event which triggers when the frame loads.
### But..
That did not work either... When I attached the handler to DOM

Še vedno ni funkcioniralo. (Opiši, kako se je FORM vedno znova ponovno nalagal, ker je bil v loopu - Event se je prožil ob vsakem nalaganju. V funkciji je bil ukaz, naj se ponovno naloži)

Then I attached event handler to the `onLoad` event of the form. But that did not work either, due to some idiotic CRM feature. When the page loads, Dynamics waits for a few seconds, then it destroys the `Xrm` object. It is still in the scope, but almost all attributes return `null` when read.

Even people on the web doesn't know what is going on:

https://community.dynamics.com/crm/f/117/t/180633
* CHROME FRAME context selection - XRM is not null on Content frame