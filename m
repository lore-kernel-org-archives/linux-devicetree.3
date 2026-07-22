Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6761D3F3267
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 17:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784740342; cv=none; b=Eu3ORLD5kFFX8674WSeSg7bhXmXcgkJpyUPV4paOGJZKOBGT8JHWKExAQ4Y17sV4Cc9/O1tsh2deLXKNCH726V6A7Pv/We7AKqhCfuQGgXieMDBn/ws0Cfjl6ug/qV3YxYQRA8MOqgAPGnt3PE/JEMVGc0yOHSh/5rYgTkzDKjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784740342; c=relaxed/simple;
	bh=37LGKFtMAvIkD2bLMzhPbvfj2dBH9HUmxUg0dE/eojM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1bqqZHAce2z+yi7yyQp0iGdOVIZqBu78QJdXzzeGsKAuCqE7lYg+6l0FGY2wr8b94OWvdBF2B+nkdd+OShNkKXvCVCR+iEXa/wx3uSeuu8O/+LCA9cqnPFk5ybgw2p0lXW3BBoPgQ4shcO+c2u/J/BcwUJG0KRcwq146HXVBKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SV13zt4O; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SV13zt4O"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bf9466412fso5874736e0c.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784740335; x=1785345135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6YX3CosssI6KHChiFe/bPd9GHkJ0zXvX16gTAellRDk=;
        b=SV13zt4OyMQ3U/Tjl0WPdcoEtSZBsl33XXZmbjRXu+PHOTM6RksbCMDPS9xDIGKBGt
         F9R4XWEjI1wBpsO2g81EyxL1s4XNAnuFp1eURNFQAoiUfr6PUDokIkw6rMZgEmrGVs3v
         iFrn9FHPET/PJI7OMMACHR0HtikfWS5sg0Pr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784740335; x=1785345135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YX3CosssI6KHChiFe/bPd9GHkJ0zXvX16gTAellRDk=;
        b=bUI7Up8ggHALtBkrLOQtjqS9nEPceUUnZDBwQ38HyoYHbcisHa+APg9UD9whro0s7o
         nmL/ykJYgGs0+qX51+7bPoc3oUERLSEPspyfqyihRvcJBt8OYMVDV/zPsHNTyEg6uVm1
         VZ7XBrmEeSfVlcoJJiVM9/qdbVtCa3AILZGf037u5oJJIrqc6h9rfd6eLBlesJHjdIQ2
         4Nlj5ndPBaGDEJaiZsQECqjUQopoV0DJDYwi4F52R1VwO9mT7aw7w+Xahda+S/QR0b/z
         wiM4mVRV51OlwJzVV5Ylsi7kvb6iN5mNtW0/fmyKxgrIwqB0l5XQt4upcGYtrwctMU1w
         orPw==
X-Forwarded-Encrypted: i=1; AHgh+RrhBKWTnsVjclwDsYcEBPRgzg94KYjMajjtDeUPaPxQ0QvSHVtr1DTcxOtSo+1E36bxYJ24Kkh9ySS0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyka5JPi3/0wvqrWuVQsExS5BOWlFkxmGRixmaKECyKCCTxreLH
	DE+cj3gSKlmzlrwy9eUoRUI+R07t83es0twVsea+x//u9vFbhmFI86YvUA0iuMYN7rNX5M+/gCY
	j4h4=
X-Gm-Gg: AR+sD11vu3oACENveRyv8aOcrNLFHQSl0MCD1fEMWdHUgkLPpqxiLOuVLLGFGcrtzDw
	GXB6phbhvzJMTXjecUH9UE3lp/4pnRTqFQm1pW0nnKDLubHJj3VukcBhr8Bh6EhXEt8r89/zvSM
	PxG5rabF+7pVRRjVVKPtOv+87xEcw2Tlb5C6HB4xmGC+rh37uo1UN+41EpkEUcI5bxn36C8dv40
	p7bhWP1ZU2gGn4e5GjuLwj6gxrSafFQivQs4OYl/KwRck+Qx/lNs3DFb+ytUeAPOISb/se4grrv
	kLN8lXZiWvTaaUFY1LsKrzzzXzqouw6HANgfq87FCdC4HVcX5Clt++7ScA4tqodfXvm9blQJFtg
	mtPxajLk7bZOaXQT6Nlx0kwN7pbcrMze/v6gFAZjG16wrdCvAWYiYPape4970TM0kSmMXZNT+IC
	ORnGaF6Siq4AGTaXlqSTBXHPzqbMYiJxQM6a+CtFib
X-Received: by 2002:a05:6122:8d3:b0:5bf:9a63:9586 with SMTP id 71dfb90a1353d-5c1bf95699amr9035387e0c.13.1784740334825;
        Wed, 22 Jul 2026 10:12:14 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c2c6275d2asm3733056e0c.1.2026.07.22.10.12.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 10:12:14 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-966d70b9e1cso4318790241.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:12:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp5M6A9z/Za6lrKsWRxzO+0RBPRtHNq55bTgN+tfPCMeyuBV8F/CdJOCBjCcMvx6NMKYd1s5msZaHBl@vger.kernel.org
X-Received: by 2002:a05:6102:41ac:b0:739:77a7:90bc with SMTP id
 ada2fe7eead31-74753727549mr9620851137.23.1784740331107; Wed, 22 Jul 2026
 10:12:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org> <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
 <208b12fb-8f6f-4cc4-9517-bc59180aa094@kernel.org> <CAD=FV=XOGjLUF-1qOY=zCYJYq85MzkJ_56WbhraTcyAjU_z+RA@mail.gmail.com>
In-Reply-To: <CAD=FV=XOGjLUF-1qOY=zCYJYq85MzkJ_56WbhraTcyAjU_z+RA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Jul 2026 10:11:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VtNuF8E3OpV4pAS78-prMpaWgPy=+GtiFaeMVhki8jAA@mail.gmail.com>
X-Gm-Features: AUfX_mxvQ1AOoNj8OTI8i9aE7gStQVh4N4s4w7gmV1VP-TIiWsTp_ivnIG4C0EQ
Message-ID: <CAD=FV=VtNuF8E3OpV4pAS78-prMpaWgPy=+GtiFaeMVhki8jAA@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 16, 2026 at 9:31=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > >>> +patternProperties:
> > >>> +  "^mailbox@[0-9a-f]+$":
> > >>> +    type: object
> > >>> +    description:
> > >>> +      Each sub-node is a single-channel mailbox.
> > >>
> > >> This does not look like correct representation. You have one mailbox
> > >> controller with multiple mailboxes, not multiple mailbox controllers=
 of
> > >> single channel boxes.
> > >
> > > I spent quite a bit of time debating this when rewriting the driver.
> > > While we could certainly hack things into the existing "mailbox with =
a
> > > bunch of channels", IMO it would be a worse representation of the
> > > hardware.
> > >
> > > I discussed this in the wall of text in this patch series, but
> > > re-hashing it here:
> > >
> > > Each "mailbox" in the mailbox array is more like a full-fledged
> > > mailbox than a channel within a mailbox. Each (single-channel)
> > > mailbox:
> > > * Has its own client register space.
> >
> > That's nothing special yet. Many providers of multiple resources have
> > these resources in dedicated registers. Arguing this, each GPIO in a
> > GPIO controller as well has its own register space so is basically a
> > GPIO controller on its own.
> >
> > > * Has its own interrupt.
> >
> > Just like GPIOs...
>
> Sure, having a giant list of interrupts and register offsets isn't the
> end of the world.
>
>
> > > * Can have a different amount of memory for messages.
> > > * Can have its own conventions for communication.
>
> I notice you didn't respond to the above bullets. How would I deal
> with different mailboxes in the array having different communication
> conventions? Different mailboxes in the array might have different
> "payload" sizes. Some mailboxes in the array might use "queue" mode
> conventions and some might not. Do I need to devise some complex
> scheme for describing which mailboxes in the array use which
> convention?
>
>
> > Well, this could be. But you still have one child per channel (cells=3D=
0)
> > and all children address space is in parent's space, so that's clear
> > indication. It's one controller with multiple, although some different,
> > channels.
>
> Sure, it's definitely one IP block and I'm not arguing against that.
>
>
> > > If we tried to represent the mailbox array as a single mailbox with a
> > > bunch of channels, each instance would have a different number of
> > > "reg" entries and a different number of interrupts. We would also nee=
d
> >
> > No, you would have only one device node. Very clean solution instead of
> > 100 children for each individual mailbox.
>
> There are definitely not anywhere near 100 children. At most a given
> instance of an MBA IP block could have 32 mailboxes. In practice, most
> have fewer.
>
>
> > It's the same with clocks (TI) - you do not get device node per clock,
> > even if TI did it 10 years ago. You do not get here device node per cha=
nnel.
>
> Sure, the clock history is one thing to look at here. IMO, this is not
> the right comparison, though. Trying to describe all of the complexity
> of a clock tree in device tree is an exercise in futility. It's just
> too complex to get it right, and there really are hundreds of clocks.
> The mailbox array, on the other hand, is a much simpler beast.
>
> I think regulators and PMICs are a better comparison here. When we
> describe a PMIC in the device tree, do we have a single PMIC node and
> then have clients refer to a "regulator ID" to index into which
> specific regulator in the PMIC they want? No, we don't. We use
> sub-nodes for each specific regulator. This gives us a nice place in
> the device tree to put information about each individual regulator,
> since each regulator in a PMIC is different.
>
> Certainly if we had a mailbox controller with a bunch of identical
> channels then describing them as sub-nodes wouldn't make sense.
> Existing in-tree mailbox controllers have a bunch of homogenous
> channels, and thus the existing solution of using a channel ID works
> well. Here, the sub-nodes buy us something and provide for a cleaner
> solution.
>
> I don't understand the downside of my current proposal. It represents
> the hardware better (both the HW designers' intentions and the reality
> of its structure), avoids adding complexity to the device tree, and
> feels clean.

FWIW, I still feel fairly strongly about the fact that #mailbox-cells
shuld be 0 here and the fact that each mailbox in this mailbox array
is best expressed in the device-tree by its own node since. In other
words, the best model for this hardware is an array of single-channel
mailboxes, not one mailbox with many channels. The main reason is that
each mailbox in the array is _not_ homogeneous and is not intended to
be. The main argument is that every mailbox in the array can have a
different message-buffer size. While we can discover the
message-buffer size of each mailbox in the array at runtime by reading
hardware registers, the different message-buffer sizes suggest that
each mailbox in the array is designed to be able to use a different
message-passing convention. The message-passing convention is defined
by the firmware on the remote side and is _not_ discoverable, so we
need a place in the device tree to describe it for each mailbox. Each
mailbox in the array having its own node is the proper place to put
information about this convention.

Krzysztof: Do you still oppose this? I feel pretty strongly, so before
changing this to some awkward bindings, I'd love to get confirmation.
I'd also be interested if anyone else on the CC list has opinions on
the topic.

-Doug
