Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9442447ECC2
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 21:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631641; cv=none; b=l9GKnpbFIuDAHnH2/CF52GUaRpYzn5QgM/PUAxLPIVduIk/TJHCfWqWPApf+adOq+07pYqJNLNWnYNb9473zms6vkTKXd93tdkxMB8jlCqbTbLlxef0Y8Sf4a9Ze1txcPTZJ/Gzjr2nn4WO6nB9dI2V892VOXNhNTzbFOdYixTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631641; c=relaxed/simple;
	bh=cUrLPKJjgy3ZOSpGyKl+54PttfAnoO5dJ/JZfZKuxY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHfd3o5LfeDj+NuqRttuot2Ttm4U/trUVcYgUon0wGmdWy175q3sM4mw/EszEoLoYDSGK9gpK8mwzzkIyatk3cRFSw/da2/YUZz4+ZwNLJxC+fAi2MrM9GZ0cM3cC7n8E2r9adomm3HB8DdgDniZOvGB7rXYzJG48EzXl5r1TXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bm/tn5cg; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bm/tn5cg"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a5a0703ae7so2337251fa.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790631638; x=1791236438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qMXZhXOkxtrjP55SDYES5mqvZlQYPy+Z9IGMIJjgKbE=;
        b=bm/tn5cghhEBY6tX7ijbNsV2EPS4brfRHYjyXPx8EbR5LFcLkWhoQhaSqiQzv4R1O1
         GMTIxjum99roddYTAPDAnic9qZX9iCFPtAcjQX8pycriWX1OTUcKFhJNxWZOqLx2udma
         N4kpe/rexHNut3By+q1ESiuME1M2/W8dFRAFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790631638; x=1791236438;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMXZhXOkxtrjP55SDYES5mqvZlQYPy+Z9IGMIJjgKbE=;
        b=nThNmBoeJf1h5ADdv3fUG0WsrwlxqbkAB62TZhcW+k15HZD2/1bg4cp8jYhjAQmWKG
         O55wwgd+TMnWzg7T6achT9EX4KZEYWt0rKDufVEeFeLL7mMx7AuLV2fk58uxqjx3XnbB
         yQcgBsnDBOuaRpe5v9M2mY5aBi+2gJlf+hkty1eYABA6r1hpZaoHYsdCyBixd8JtTnT6
         zBSKSFzAxIIOlc9tjE0nTnlNsliAk14jmODKP3eSslfhN8OTmL0RwmA597+nbeV5JwZJ
         1+YstjBqxzYMs9YbN918yU8cD+FXmFHVtOJ+2Ya0FfJXkb+R6yOU5EQ6Hu+/GuPt80tH
         Djgw==
X-Forwarded-Encrypted: i=1; AKwUvBwnY/Jn0N8cLo38O2C4yF7t7AnNyHrjn5qX+cufxyxE7LfhHxeGVjGyjBH1r+ItieDiSqmwmaRmXZ8L@vger.kernel.org
X-Gm-Message-State: AFq9FYIQCEAp4A7K5UHEGXQxZIzY8tz/ZQpa0zzqnBDREtfdi/tMsbw9
	JvLgxS9ECN+Obf0n7YpaHIQXPqiqHf0rqPtbd+I0HJVDb2ClFufeAOgTSy8fecl1gpb5DhCT14E
	H+RE=
X-Gm-Gg: AYBFou1j0A2HqMVlw0IIKEEtUHFIsFMSL0f/N0oynXo2WoBjSkzKaRrRs7Be0dXiUoe
	VADXvrbheB+a7wd8uYrEpK8Fq+Hkkt3PXDtMcRiiCiEYSQQ4mwYQ62unQSD9S5Gnh56LSm/SxAJ
	mJvStnTuu8RxVO3JOA42i+McEaRGHcyUuVxIp/8QdcB2Myxj3Yp9E2C8rVnYspD4vpIdHbVlSw1
	5zYOzJ3xwRR4qExIKWX+Hzj7gW9GAd5wkIJgOsB2oFPfz13cyd2E0VNA1LMUD5c2NBX/t5d+RcO
	uzID2l38rAfYbe6BWSX9/XYu0jyrPGANDNmrPutHXS1ZC6noyjY/IE9KTw1ivM5DbA9pI87im39
	desvpGykB0aYFtXx37qHtYFLQGUELabG2CVciL3pi7VDH386xKO/ZjabCUx3nugjkjw6EWarZal
	2briWv+FhQyfaE/k8gGynzZa9t7mUXQfz1XAF7xkgTZPCWsDUz5IdTqrnXrcnnc2ajultJ8K3gz
	MoCKpXjC18CzhgsBhnGU1tyQ9csCEKAr14ahl0=
X-Received: by 2002:a05:651c:18c6:b0:3a6:2f9d:fb7b with SMTP id 38308e7fff4ca-3a76476452cmr1117921fa.9.1790631637498;
        Mon, 28 Sep 2026 14:40:37 -0700 (PDT)
Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com. [74.125.229.205])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b58021csm31996211fa.10.2026.09.28.14.40.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 14:40:37 -0700 (PDT)
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8eb15037aso1235184e87.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzBRVQL7fBPRuHpyuLdqTLziKexyh8PzcYVW4dq9lmzL+70Y+8dslCwtU0yRF+IyjpFgIcjOKdwaRIE@vger.kernel.org
X-Received: by 2002:a05:6000:1788:b0:486:e60f:a4e3 with SMTP id
 ffacd0b85a97d-48af1a8f107mr814148f8f.1.1790631294826; Mon, 28 Sep 2026
 14:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
 <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
 <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
 <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
 <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
 <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
 <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
 <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com> <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com>
In-Reply-To: <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Sep 2026 14:34:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
X-Gm-Features: AclHuK-jZYMHfBS5WdwcZpWCPaLhVSXzZ0R6bURtHTy1RcWpghu0fszYS6_LsfU
Message-ID: <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 22, 2026 at 5:23=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> So I think clk_mailbox can acquire all 8 channels during probe and
> maintain a list of idle channels from which it picks one and uses it
> for an incoming clk_prepare(). If all channels are busy, the
> clk_prepare() will sleep/block on a wait-queue which is nudged by
> tx_done of a transfer after the channel is added back to the idle
> list.

Sorry for the delay in responding. I wanted to prototype the change
and needed time to look at it.

So I think the crux of your current suggestion is that we have a
non-idempotent "fw_xlate" function, right? We call it multiple times
with the same arguments and it returns a different channel each time?
In my prototype, it looked like this:

```C
static struct mbox_chan *goog_mba_fw_xlate(struct mbox_controller *mbox,
                                      const struct fwnode_reference_args *s=
p)
{
  int i;

  if (sp->nargs)
    return ERR_PTR(-EINVAL);

  for (i =3D 0; i < mbox->num_chans; i++) {
    if (!mbox->chans[i].cl)
      return &mbox->chans[i];
  }

  return ERR_PTR(-EBUSY);
}
```

Then the client loops around and requests the same channel over and
over again until it gets -EBUSY? Like:

```C
for (i =3D 0; i < FIFO_MAX; i++) {
  client
  chan[i] =3D mbox_request_channel(client[i], TX_CHAN);
  if (IS_ERR(chan[i]) && PTR_ERR(chan[i]) =3D=3D -EBUSY)
    break;
}
fifo_depth =3D i;
```

I _guess_ that works, but it still feels like a bit of a hack to me.
You said you were worried about people abusing the "has_queue" API.
The above feels like it's abusing the "fw_xlate" API, turning it from
something that is normally a "lookup" into an allocator function.

+Rob, Saravana, and devicetree@vger.kernel.org. DT folks: is the above
something that looks right to you?


I researched whether other upstream drivers use of_xlate() /
fw_xlate() as an "allocator" like this. I did find "exynos-mailbox,"
which appears to be doing something similar. However, upon deeper
digging it seems like "exynos-mailbox" isn't using this dynamic
allocation for any compelling reason. It looks like, really,
"exynos-mailbox" should just be returning one channel. The client
(exynos-acpm) could just use the same channel for everything since:
* It actually gets the _real_ channel ID out of the data.
* It doesn't care about txdone.
* All it does is ring a doorbell and there's no queueing.


In any case, if using fw_xlate() as an allocator is truly the only way
to proceed, I'll finish my prototype and send a v2, but I'm still
skeptical that this is better than just adding queuing into the core.
Speaking of which, I actually want to go back to something you said
earlier. I asked a bit about this but I don't think I saw a response
(sorry if I missed it!):

> It is not the diff stat but about inserting a flag in the api to
> introduce special case behavior. It is like adding one person to the
> party introduces N-1 handshakes - the has_queue flag doesn't play well
> with other configurations and may allow future platforms to abuse
> has_queue to implement hacks.

Can you elaborate more on this?

1. How does "has_queue" not play well with other configurations?
Everything should behave the same if "has_queue" isn't set, right? Are
you saying that it will make the code too hard to understand, or
something?

2. How does this allow future programs to abuse "has_queue"? Won't
they need to submit mailbox controllers to the mailbox subsystem,
meaning they'll have to go through you? If someone is using
"has_queue" to do a hack, can't you just NAK them?


One other thing that my prototype turned up: If I do the "fw_xlate()
as an allocator" solution, I believe I need to change the DT bindings
by adding a "tx-payload-size" attribute, or I need to jump through a
pile of awkward hoops. The reason is that I suddenly need to know the
number of FIFO entries much earlier. The v1 of my patch simply figured
out the "tx-payload-size" based on the first message sent, but now we
need it earlier.

While that's maybe not the end of the world, it's always unfortunate
when we have to change the DT bindings to accommodate the software
design.

-Doug
