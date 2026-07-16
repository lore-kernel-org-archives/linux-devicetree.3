Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3639938239D
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219531; cv=none; b=TNi1HJlLCsCCEOe6i8XVqGM3geC6vcI6OgT5yQ24g9+U/0sj3mZZ2RGHxiynQVQgCuJ/H8ycXfYZXWaSZidpM/l+zGi7ucGeM6IUPSwjJ8287eur9E5gNpAFnLnKilYnbNiDnTwAF8I+n1pgKtf7sKrwuZ3Czyc8znxrt9iCeoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219531; c=relaxed/simple;
	bh=M6a7x0sg+dVAjE0Txgq7XtY6czCMmgGKuXqVwquIz5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2xMJwto5j+hOu3M1fpZQZ+67rMhqjDuGj4r5dBcq/bUUB4NqZO6Iol4FNEYj0lLCPxlZfz72GkwgZgcI/eiiUwaxlV1aRlpVElb3wexCEx2sKvsuM44LwBD0lWUl1gZv34BX0/aEcl9l1ZZV9DVel+HAPi4mGYV/jZdXzTLkfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NMYhUvXr; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NMYhUvXr"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9696369925aso2237654241.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784219522; x=1784824322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=APiwPwxrp0Nqxoas85A4o7DfSgVInEX2Y+304zRUNvg=;
        b=NMYhUvXrpwo44px1BGNBjdz8YnqVWEkFgpQpmYNav9WhBzosHOmXIU4XPSLls9qaMJ
         +oA2u9ZqYE646eUu8Py0rngk+vcjQ9uB2ncAtpZXj3b97dgsUcBtoPPIdeqQg8MFqQTj
         fZBQmFq5EpTP6Dx/284y6iDJaRYsu6bpL41Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219522; x=1784824322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=APiwPwxrp0Nqxoas85A4o7DfSgVInEX2Y+304zRUNvg=;
        b=ThbS4jAWHG92XYn37V1Y4xCoYbBHskbToHENBWO0R/C7aBtI7Vv3jJ9sualBhahyzS
         vtZIYqBbX1O28lF2+A2ZdFjCXMtltE52g0St7vXKZrl2L4O6QNtxz/8dvL7vhVQ1YoVy
         g6LtIBevAEuVbSDM1tQz2+B/HjZeGxJ7+DrcZEysVDlGd35zlvWhttru5CWTw6c+BZgR
         BRRUD1r8PGuoMblEqCT+9ioZwq/3eitZ8DR8FCtLNQq39meiL2u7iDBZUQr6zG5nbWnE
         QHhrFgJd60mguw/9H+PAPjE83bcMp+mPber9x3SqNsMAQzqoCRE3iF9bSa+TNk6d3WeS
         iWpg==
X-Forwarded-Encrypted: i=1; AHgh+RoG11j/WTLgUaJW6ZDwhbzt5I3kWeG0m3uATLEl4jl2WceevoYIydJhNc7s6yJcqYjymPcPsqUfaiuL@vger.kernel.org
X-Gm-Message-State: AOJu0YwOyNXl4msrJwFCg9/kUCcJGF/KSHWhH9AZj17BAQ1TLvixauMt
	mOiKkBCgnnQZlQfE3G45Faa4YFGXo1sePbZsKAmZU2uiESypVf4svAl8p7Ufmr0UEzmoizPTao1
	MIMw=
X-Gm-Gg: AfdE7cliJ7gBOHSsAAa/hk5YHzp/hk/PkWiuWQ2yvqAggllVpZNSiRdD8DVngVb8Yce
	0JOaLx4WK2Im3sFHXpeS3b9VUY1LCXBIciK+oo6sKTWmosw06VS3q/8EOS7TwM1dBezh6SW3MkT
	1pZrIFqBgzyuflqcShaIuCisK7Bsrnqs9Xhd/TtS6cHbMdn81uUrDs+1CYkZZvZHx+NDslNb+zw
	1szgHufbSuX0XFYnNtB98RIJGAGvrrl/30lE6UJ3RjWCahwWW+k4Qq3/WZsFtbKrIQRu8CnROOQ
	NqHoZEpl+RyhLJkGnDjGxNBQdSF8Sg9yKuih+qd3VsKH/RpRGmJ2f7kUAohs6Wj2eo4UElHVMGD
	s15tTd71VHcv5wDr7zd4ouy+071SHc55Jp/Bket08RVfmtNgDyw5JGMV6FVAd12OWLYT+wKRv57
	wqyhgH8MSDV+bb4vADFuuCXlnaBFjhq58hG44sDLyuLCeTMC6JNZpHpT8=
X-Received: by 2002:a05:6102:370c:b0:738:e2ba:6ee4 with SMTP id ada2fe7eead31-7457e684f5bmr7136857137.5.1784219522228;
        Thu, 16 Jul 2026 09:32:02 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed258bb75sm12369163241.1.2026.07.16.09.31.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 09:31:59 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bfaa014978so2387259e0c.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:31:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpcZArh28n05T0NaPWjXnxll6B98pUfvvL+vwcuaiPFpAif6shlRWZfqk2JMPzagmn8v+oU+U1XcTAX@vger.kernel.org
X-Received: by 2002:a05:6122:208c:b0:5bf:8fdf:89d with SMTP id
 71dfb90a1353d-5c10eddf329mr6674207e0c.9.1784219518543; Thu, 16 Jul 2026
 09:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org> <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
 <208b12fb-8f6f-4cc4-9517-bc59180aa094@kernel.org>
In-Reply-To: <208b12fb-8f6f-4cc4-9517-bc59180aa094@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 Jul 2026 09:31:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XOGjLUF-1qOY=zCYJYq85MzkJ_56WbhraTcyAjU_z+RA@mail.gmail.com>
X-Gm-Features: AUfX_my0b9oOkbCP3pS_I5q2w-6_jGf9HQ5lScUiSPnwh5yrj8idkqJOr-EqJaY
Message-ID: <CAD=FV=XOGjLUF-1qOY=zCYJYq85MzkJ_56WbhraTcyAjU_z+RA@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Joonwon Kang <joonwonkang@google.com>, 
	Subhash Jadavani <sjadavani@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Lucas Wei <lucaswei@google.com>, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 15, 2026 at 10:47=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> > I don't suppose I can change your mind here? If we take
> > "google,lga-mailbox-array" as the generic, then going foward a few
> > generations we end up with:
> >
> > properties:
> >   compatible:
> >     oneOf:
> >       - const: google,lga-mailbox-array
> >       - items:
> >           - enum:
> >               - google,next-mailbox-array
> >               - google,nextnext-mailbox-array
> >               - google,another-mailbox-array
> >           - const: google,lga-mailbox-array
>
> This is the expected appriach.
>
> >
> > If we keep "google,mailbox-array" as the generic, then going forward a
> > few generations we end up with this, which seems nicer / less
> > confusing:
> >
> > properties:
> >   compatible:
> >     items:
> >       - enum:
> >           - google,lga-mailbox-array
> >           - google,next-mailbox-array
> >           - google,nextnext-mailbox-array
> >           - google,another-mailbox-array
> >       - const: google,mailbox-array
>
> It is the discouraged approach. I already have a few real examples for
> Qualcomm when people added such generic mailbox and after some time it
> turned out not generic. So people wanted to add an another generic one...

OK, I'll change it to use "google,lga-mailbox-array" as the generic.


> >>> +  reg:
> >>> +    minItems: 1
> >>> +    items:
> >>> +      - description: Host registers (not accessible to client)
> >>> +      - description: Global registers (not present on newer IP block=
s)
> >>
> >> You have only one SoC. One SoC has only one IP block, no?
> >
> > Nope! There are several instances of the MBA IP block per SoC. I tried
> > to explain the situation exhaustively, but there's always the tradeoff
> > between explaining thoroughly and providing too much text.
>
> That's ok, the "newer" is confusing.
>
> >
> > To answer this specific question concretely, there is one MBA per
> > remote processor. Looking at the downstream DTS, I see at least these
> > MBA instances:
> > * AOC (Always On Compute)
> > * GSA (Google Security Anchor)
> > * GDMC (Google Debug Monitor Core)
> > * CPM (Central Power Manager)
> >
> > Each of these 4 MBA instances has its own "global" registers.
> >
> > To provide more context, each MBA instance can support communication
> > beyond just the AP (Apps Processor). For instance, the AOC's MBA
> > instance could be used to talk between the AOC and AP and also between
> > the AOC and CPM. Let's take this as an example. In this case:
> >
> > * The AOC is the "host" of this MBA.
> > * The AP is a "client" of this MBA.
> > * The CPM is another "client" of this MBA.
> >
> > The AOC is the only one with access to the "host" registers.
> >
> > Everyone (AOC, AP, CPM in this case) has access to the read-only
> > "global" registers describing the MBA instance.
> >
> > The clients have access to several banks of client registers, one per
> > mailbox they can access. The host (AOC in this case) also has access
> > to the client register spaces since that's where the shared message
> > memory is located.
> >
> > The overall MBA instance is best identified by the address of the host
> > registers, even if the client (the AP in this case) can't access those
> > registers.
> >
> > On newer versions of the IP block the "global" register bank was
> > removed and the read-only registers that were part of it were simply
> > copied to each client instance.
> >
> > Does that clarify?
>
> Yeah, just s/on newer/on all/ ?

No. Although this driver only supports the "laguna" version of the
mailbox array, I tried to look forward to what was coming in the
future. On "laguna", the "global" register bank is needed. On SoCs
past "laguna" (AKA "newer" ones) there is no global register bank.
This is why the global register bank needs to be optional.

Yes, I could add some validation to tie it to a specific SoC version,
but that doesn't really buy anything. It's just as easy to say that if
the global register bank is defined in the device tree that it exists.
If the global register bank isn't defined, the info must be in the
per-client banks.

If you insist, I can make the "global" register space non-optional for
now and we can re-litigate when official support for newer SoCs is
proposed.


> >>> +patternProperties:
> >>> +  "^mailbox@[0-9a-f]+$":
> >>> +    type: object
> >>> +    description:
> >>> +      Each sub-node is a single-channel mailbox.
> >>
> >> This does not look like correct representation. You have one mailbox
> >> controller with multiple mailboxes, not multiple mailbox controllers o=
f
> >> single channel boxes.
> >
> > I spent quite a bit of time debating this when rewriting the driver.
> > While we could certainly hack things into the existing "mailbox with a
> > bunch of channels", IMO it would be a worse representation of the
> > hardware.
> >
> > I discussed this in the wall of text in this patch series, but
> > re-hashing it here:
> >
> > Each "mailbox" in the mailbox array is more like a full-fledged
> > mailbox than a channel within a mailbox. Each (single-channel)
> > mailbox:
> > * Has its own client register space.
>
> That's nothing special yet. Many providers of multiple resources have
> these resources in dedicated registers. Arguing this, each GPIO in a
> GPIO controller as well has its own register space so is basically a
> GPIO controller on its own.
>
> > * Has its own interrupt.
>
> Just like GPIOs...

Sure, having a giant list of interrupts and register offsets isn't the
end of the world.


> > * Can have a different amount of memory for messages.
> > * Can have its own conventions for communication.

I notice you didn't respond to the above bullets. How would I deal
with different mailboxes in the array having different communication
conventions? Different mailboxes in the array might have different
"payload" sizes. Some mailboxes in the array might use "queue" mode
conventions and some might not. Do I need to devise some complex
scheme for describing which mailboxes in the array use which
convention?


> Well, this could be. But you still have one child per channel (cells=3D0)
> and all children address space is in parent's space, so that's clear
> indication. It's one controller with multiple, although some different,
> channels.

Sure, it's definitely one IP block and I'm not arguing against that.


> > If we tried to represent the mailbox array as a single mailbox with a
> > bunch of channels, each instance would have a different number of
> > "reg" entries and a different number of interrupts. We would also need
>
> No, you would have only one device node. Very clean solution instead of
> 100 children for each individual mailbox.

There are definitely not anywhere near 100 children. At most a given
instance of an MBA IP block could have 32 mailboxes. In practice, most
have fewer.


> It's the same with clocks (TI) - you do not get device node per clock,
> even if TI did it 10 years ago. You do not get here device node per chann=
el.

Sure, the clock history is one thing to look at here. IMO, this is not
the right comparison, though. Trying to describe all of the complexity
of a clock tree in device tree is an exercise in futility. It's just
too complex to get it right, and there really are hundreds of clocks.
The mailbox array, on the other hand, is a much simpler beast.

I think regulators and PMICs are a better comparison here. When we
describe a PMIC in the device tree, do we have a single PMIC node and
then have clients refer to a "regulator ID" to index into which
specific regulator in the PMIC they want? No, we don't. We use
sub-nodes for each specific regulator. This gives us a nice place in
the device tree to put information about each individual regulator,
since each regulator in a PMIC is different.

Certainly if we had a mailbox controller with a bunch of identical
channels then describing them as sub-nodes wouldn't make sense.
Existing in-tree mailbox controllers have a bunch of homogenous
channels, and thus the existing solution of using a channel ID works
well. Here, the sub-nodes buy us something and provide for a cleaner
solution.

I don't understand the downside of my current proposal. It represents
the hardware better (both the HW designers' intentions and the reality
of its structure), avoids adding complexity to the device tree, and
feels clean.


-Doug
