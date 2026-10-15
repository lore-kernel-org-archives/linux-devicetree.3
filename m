Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83A14ED19E
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076964; cv=pass; b=Dg+DzxmKzojflRoXpSh2qNTgQk7GYSiy7NsooCR/F6IbO9+wKvlOnLuNzcASD2XhjrqKHOKU+83f8J19AquTz6I//sGzjnneKn8AjxEeZva3EpgPtcXWuzADltgjZAFBZAkDehlr2G7eVxTVdtFygesPQYgxwuSWDRJ089LB68A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076964; c=relaxed/simple;
	bh=MLiIS6oDDFsD34KL+G8e/3T/Al1HvZKZmMra2+d9nPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lde8+qjU+OL/6TmJrPFbtMFw9T8X60GgC/mX7BrPrcybPZyK3aFqzuGGkTDCXbZ/xQTd2uwvQENKU+IGX1EtLmFCGilmBJ7FvdEJe6XBd9WBG6lYCPAaYkJ+nELLNy9Ppw1PoaZ4lAvrWH+nGg4tlvxW8KQl++kq4yX5wnAVRTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQg36TEz; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQg36TEz"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-77bf892b496so694623137.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792076962; cv=none;
        d=google.com; s=arc-20260327;
        b=Evmec/5idTQ4cyUNd5s5Eb2iE6UUo0WYKCQorN59qV4tbbq3wYD9y6EQsdGTvxnATo
         9Y1t+iBIkpmF46dSNcovTGEH0vvBvnT5KtiyCzjtHC3b+j/aPzc1JzhH12Z/cmgmfCDY
         EdzbLYQnXtHYLxlJjNZ6NbxAnH8t2HP51Y3EtvOff/U9CNERFIad4ET4XewBg0Tf1JbP
         qp/jm9npvMM6EsolmhDzFhCtiweW1+K5fgG7P4GIxgaM5RMKJEIc8tkBzgE6JxQ53N2C
         wsuQdBDdofk4bqY3j88ou5G0jsWIyNyv0LFQ52DA3tSE6sUZIcllCcugKzc9mCMbGnNo
         Q6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g+la5oRry/ejNEDlylEClTFnvYZE1MGV2kYV0bWmL7E=;
        fh=WaEW8cdrVeYSyhRSNce0PyWtEijiqJJB67qaJYvHPrg=;
        b=Rf64pcBxP5oxbosnItq/cpYPr84AlnIdKwQ0gUkpp4oO9jgr8ZP5LkFlsEsF41/tFE
         WydWi4nNBeszU3wl1kub4d8u3G9kqiPz5hJH/boaRh7m7XoKRJ/mVvIbH63J+z1wKoTD
         Pk9wBzHZbLzU6Jnd7EWVlbTY3Bw873APajsDgFQeJfjJi4R1xv38HUcr5XjVdIjReO51
         8vXSDMzlw5z40QRsTw8rMZ2svx6Whcx89/GPL02DlL4mOVawrJnuUVmKbt45dGCdyrrF
         7fA+mDBLqKHtxDN1ipA95OkzVTRirvmf9WHclCHOgktqpdI/9NgDfw2VRn6JaZIPGorj
         V+Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792076962; x=1792681762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g+la5oRry/ejNEDlylEClTFnvYZE1MGV2kYV0bWmL7E=;
        b=TQg36TEzyCqEVlrmNC0UxqMrPE5sepbat/yH5ioQLyEO8oNDOVOo/JZohv2XOWZ9za
         9rUUvaCBykPZOi8I1Yps2UwVv8ljUFDivKTTzvZsqW0jCtOMwcpnO51gGelgJ2k3olkG
         NLZ+1C/c4DehaLCai8jAPldrCL1Hjg/FDDIfL8F2tQcSjtd6ILJ+S1e24SZOAwxwh78x
         gbQFHPmVHLisVCgXfC/rcO6ZjoY5dJP1w4R7fb5iJgl8kbqvqpljS1I/X4VV1y5I5HYE
         lGYODCjLFxZV4Je47QGp29RP6a8wgC8h82RimGZWTH/HKwtBIUUGwHaM8f18uWUYxrGo
         077Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076962; x=1792681762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+la5oRry/ejNEDlylEClTFnvYZE1MGV2kYV0bWmL7E=;
        b=OqpzOI7Eqc9EmxY5WUkoxYyPYwwa6MDNS7HH8ATxMDvMiogMBPg98uglCZE3ZUF1wj
         gRvpk3ptIJiGlBUWbcyMUvj1Nm4EFJ1EA7jzpRBFWba0oQ81T7MMWZAzCJu6XqAkkUlP
         3uzDyRTDG8gQYFTuxgLGV/WR/uVogGrKuF+nsN7RZBO4U4JgQ95GGpiU+P0qOT/5bwuf
         U6GtLl6VCoin1XPBntI/UUOo4/dbp74rInjCOoM88YmPq2Ap5pUf667Cuw8ZIHRRj0Yk
         n2dLlRni3VqcUIf04w+CtpdedtnY7Kt/Fz+5cjXcpLSzX5q2LcvtPeMkPEQPGGL3D129
         tmZA==
X-Forwarded-Encrypted: i=1; AKwUvBz+L0ki2eq0+EeY0wjPRxpHgi8P/Bmtkiew3SnUzJoLcqcE0cxDFaIBkE5DJexKJlxMgSVB5fNXR0MR@vger.kernel.org
X-Gm-Message-State: AFq9FYIfsyMMU8rXNBuYTkrVTx/qDXoC0GmwRurC77M5ZEW/D7WLBtBY
	7zIexxJdJyOGGDUYNV5UYo12/SBxAHnXXPM4/ReP/x8AF2rbpL44SkSwo9phZDi39QDasgKNjcc
	skuwICIbzENp7YiuXAF3JSaV7/d/HEmc=
X-Gm-Gg: AYBFou2YNN9e72QJ39ZkimZtg7/5aSgNMGva+0DRO4ResgLl91p8e+Ck1QxRoQTp0wz
	UnW37axfNNOuzDd8uu5aJOMCPnMeikkU86ghZiOLQaMdvKl6uMGwcDzCHp/lAzjYE4FVWdRYpMi
	klgrhj8m/kP/sDeD61SYrCD6EgYN5GnX9LQbO6noK7+5AHpah7ZzZu5gH+mZqzOmhlQ2kYr5szp
	bMfBaGOfqqRqLMAeqA38SJByxA7mRbcge1DWIYTZ6QblVeWZwvGWbVexU+Tt1UFrKZb0PCFzcPn
	5XBPiLBdpTsVFPFDIjqAXPyognouB66a//aG+kzs8gpt2Ja9dAeQUq10Tt5WD1/LzK73qjmsg2R
	CcLT2js8KvWuqkYDRTLDcRy5nic9QfUAdDTBIC5pn+uxOFYAK5LjlMHpShWlXEsSfNobpuAqCaO
	msR5fwiWYDV7ensKlemtiyha/TznsWelit0fD+kI9y4JCk
X-Received: by 2002:a67:e713:0:b0:7b4:bdf5:9307 with SMTP id
 ada2fe7eead31-7cb3a17c668mr4997492137.30.1792076961441; Thu, 15 Oct 2026
 08:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
 <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-4-5d3fc6ad2da1@gmail.com> <20261015071943.7OihPadq@linutronix.de>
In-Reply-To: <20261015071943.7OihPadq@linutronix.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 09:09:08 -0600
X-Gm-Features: AclHuK-qAIJ8Ws5pW7BZAdTu8Nckn4yY6BNzqqth23CDA7sDTjbDwYfiY-Jvt6s
Message-ID: <CADvTj4q9cqLY5fB=u+ZdS4K18V3T-AuQ=_6aMNOgcMyXC8yYeg@mail.gmail.com>
Subject: Re: [PATCH v7 04/16] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:19=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-10-14 19:33:51 [-0600], James Hilliard wrote:
> > --- a/drivers/mtd/nand/raw/sunxi_nand.c
> > +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> > @@ -454,16 +457,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc=
 *nfc, u32 events,
> >               timeout_ms =3D NFC_DEFAULT_TIMEOUT_MS;
> >
> >       if (!use_polling) {
> > -             init_completion(&nfc->complete);
> > +             reinit_completion(&nfc->complete);
> >
> >               writel(events, nfc->regs + NFC_REG_INT);
> >
> >               ret =3D wait_for_completion_timeout(&nfc->complete,
> >                                               msecs_to_jiffies(timeout_=
ms));
> > -             if (!ret)
> > +             if (!ret) {
> > +                     /* Drain the handler before it can restore an old=
 IRQ mask. */
> > +                     disable_irq(nfc->irq);
> >                       ret =3D -ETIMEDOUT;
> > -             else
> > +             } else {
> >                       ret =3D 0;
> > +             }
> >
> >               writel(0, nfc->regs + NFC_REG_INT);
> >       } else {
> > @@ -476,6 +482,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc =
*nfc, u32 events,
> >
> >       writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
> >
> > +     if (!use_polling && ret) {
> > +             /* Flush the mask and acknowledgment before re-enabling t=
he IRQ. */
> > +             readl(nfc->regs + NFC_REG_INT);
> > +             enable_irq(nfc->irq);
>
> Shouldn't you re-read NFC_REG_ST, checking if the event became true even
> in the case of a timeout?
> Say the interrupt wake the thread but the thread never had a chance
> to run. The timer (on another CPU) had a chance to run and did wake this
> thread. Checking the event in the timeout case would help to prevent
> that.

Yes. I've folded a recheck into the IRQ fix for v8, after draining the
handler but before masking and acknowledging the controller events.

One detail is that the handler acknowledges each event and removes it
from NFC_REG_INT. For transfers waiting for both command and DMA
completion, one event may therefore have been consumed already.
Checking status against the original event mask would miss that case.

The timeout path now checks only the remaining enabled events:

      if (!ret) {
              u32 pending, status;

              disable_irq(nfc->irq);
              irq_disabled =3D true;

              pending =3D readl(nfc->regs + NFC_REG_INT) & events;
              status =3D readl(nfc->regs + NFC_REG_ST);
              ret =3D (status & pending) =3D=3D pending ? 0 : -ETIMEDOUT;
      } else {
              ret =3D 0;
      }

An empty remaining mask also counts as success: it means the handler
processed all requested events while the timeout path was draining it.

irq_disabled is initialized to false at function entry. After masking
and acknowledging the events, cleanup uses that flag rather than ret:

      if (irq_disabled) {
              readl(nfc->regs + NFC_REG_INT);
              enable_irq(nfc->irq);
      }

That preserves the write flush and ensures the IRQ is re-enabled even
when the recheck changes the timeout result to success. Successful
waits and polling are otherwise unchanged.

>
> > +     }
> > +
> >       if (ret)
> >               dev_err(nfc->dev, "wait interrupt timedout\n");
> >
>
> Sebastian
