Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DE73D668E
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 07:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937819; cv=none; b=WHr1WNRm9P1KTbJpFepre4HnEzjCa+H2LAW3MLEk2is15fi/5t9alq+xgtGSjEHelqtH8A4gQBZpw4Ii78ZBLL71mWWqa0erdacMdZll2Xstvy6SjQU5ZZxrARl7/3g98fej6hkYnXOiPASdY/RLvVJOC7aafNI/x3eLuLrzmUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937819; c=relaxed/simple;
	bh=xtvAdc18ghBTpVdh52XHh10xl6bE+yFY3X/qpW3LJN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ooqg7kqgW2UlYtGmMdpjODdpRQEihXNxmlHfRsKLzHnw3povsxEX1Az1Gf3lLC7dCGsroxA2bwDHE+TYTHHxXnc2J5RagAfibF/izrfPA1opk7krjyIbmrydzdSCCIMPSodrTiI4TYOE4jDt8gC9/Rrn7Ms2KBRVWPN/8E58SOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c671456e25so5088043e0c.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 00:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788937817; x=1789542617;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MbiU+Gmg7tt4Ds22WMmgVMp5D6+AnMt3i1Pvl+3BP1U=;
        b=SeaYKMyxlqAIDh7Nv8E6JsSalphQbnFI46xmTZCMvw3/XYlzLyG6kIslzGkxCFJk/V
         f/+yBnIQ4VFIYLUZVaB4rx817oo+DLevl9hOOwaOfu2CvvaDqpZWljO54wXWSkUZaPCZ
         lvKGnwO2zWc1x5LWKFAiYMzuT2WFcSGt4RcnfvCA/yBgdvgYGV2jqf24xsJuhsX0hdzA
         Nf/So/E9Jrt4b5QE9iBIgCDWF9v+sIftTmIMC16B54B6RtA2tqQTgbPLoItGLX5+ib4o
         t17ZNeg3f7tG9jL0CpLdAlxN1l3OpsCVe8pmoCPVjqvale2Ms/53HnA+/aLrXzAzXHkB
         w4Sg==
X-Forwarded-Encrypted: i=1; AKwUvBzFnJpXXxz+pa1MKd4B1/ZqiGKx+KtS8zAD9U8SKzmkN494AteZP49q1hyU/R1edr0W7NHnBnweUcwG@vger.kernel.org
X-Gm-Message-State: AFuF++ntSmSPVW9j6WqMFV57Y1olTKINH1VrWgFefi2YRlos7tgI819N
	/HH1dx9zZp+oyykoUhCx80tf/Q+IpS9QhNGAq/TPOJ1w9qtR28r0VHArEt4U4BbK
X-Gm-Gg: AYBFou1O3UWQ1obFlPG2jnF6YHOpzTLw1HStYh30bSLppTphgMd8Un9RKa5DNzjzMR+
	rxKYzOIwKi6eRRXCAhf4DapgiHse1JoZkc9CN1HmGOqYyikWv3c9oJLWwdt0UVl8KgdUd/y0Y1e
	rT8SC0uGrQQaUOEWX5YuusOOKspd7giYEWbACyHCwgTVCvi0MDUwjhLScegV6/lkbAFH8XFK0uM
	nCbc1W9Ev5ltwdAyhu+Cn669v4jQeAakUzpdyqMlKOtoLaEFQoMWwGi7J3AFLd2wuI1d1bvVfAt
	GsvriCU9enEYu76UuvK+bLXQ57MjKKQTOR3Ifyw87v0mFxbBBMX0UiFHVB7kHLqW6YjhBggUAKA
	nb+BQgl7a2EjLSjX98wu8w5mVpHlzQqZ5FsEvNXe3AUY/xkpNbYl8DfAoqqoyqEnzuCcAy6JkvL
	7XahVjRbP4ejY02vrc/lusQ8d9MCsEccak7vTS68uA2wY4YjcYY4qQFXut7H5Eqsop3TYd2+Mxl
	q5CUpc12pzH8h2GsSkJbCpuY2Hid/T2jtJ9j7sqmnm7Ceg=
X-Received: by 2002:a05:6122:6b83:10b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c7dcf71bf6mr8773839e0c.7.1788937816764;
        Wed, 09 Sep 2026 00:10:16 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3b2cb1sm11486871e0c.16.2026.09.09.00.10.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:10:10 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-78fb1fb9508so319361137.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 00:10:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwGQGdAxyDaUX8Lw4g4/PzmpXv3MaBN8q+ky6y4V7S0+rD217l5QGdczQSNK576sC98B5ubCEejwmTH@vger.kernel.org
X-Received: by 2002:a67:ce08:0:b0:78f:efcb:23dc with SMTP id
 ada2fe7eead31-78fefcb246dmr362053137.13.1788937809146; Wed, 09 Sep 2026
 00:10:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
 <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org> <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
 <43eccc85-fca3-4c69-9114-b45ab5e1b487@mailbox.org> <CAMuHMdVWm1JzmXx1++dhvHbnBbVqQnVVAANfmH5Y24bhJU7pXQ@mail.gmail.com>
 <b837e41d-ba6f-40bf-89db-b62ccd2be467@mailbox.org>
In-Reply-To: <b837e41d-ba6f-40bf-89db-b62ccd2be467@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:09:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVt8LQbpXfPB_MVhPP0Ro_n3L8VkOJCs1oF=WNe8MkcAQ@mail.gmail.com>
X-Gm-Features: AcwNN1VSSE2fLPvAgm84NJgnwSpTg-UVtPnuSPQuKoRSOCrHArKIFOH_BqKYQOA
Message-ID: <CAMuHMdVt8LQbpXfPB_MVhPP0Ro_n3L8VkOJCs1oF=WNe8MkcAQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 9 Sept 2026 at 03:34, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/8/26 9:49 AM, Geert Uytterhoeven wrote:
> >>>> On 9/4/26 1:15 PM, Geert Uytterhoeven wrote:
> >>>>>> +++ b/drivers/gpio/gpio-rcar.c
> >>>>>
> >>>>>> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
> >>>>>>
> >>>>>>     #define RCAR_MAX_GPIO_PER_BANK         32
> >>>>>>
> >>>>>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >>>>>
> >>>>> IMO passing a pointer to offs complicates the code.  Perhaps pass offs
> >>>>> by value, and return the adjusted offset or a negative error code?
> >>>>
> >>>> I want to avoid that, since if I only return error value, I can then do
> >>>> simple:
> >>>>
> >>>> ret = gpio_rcar_remap_offset(...);
> >>>> if (ret)
> >>>>      return ret;
> >>>>
> >>>> in gpio_rcar_read() and gpio_rcar_write(), which are the only two call
> >>>> sites of this function.
> >>>
> >>> gpio_rcar_read() and gpio_rcar_write() do not return error codes.
> >>> I was thinking of
> >>>
> >>>       offs = gpio_rcar_remap_offset(p, offs);
> >>>       if (offs < 0)
> >>>               return 0;
> >>>
> >>> which is almost the same, but avoids passing offs by address.
> >>
> >> Is there any benefit to it, compared to keeping the value and return
> >> code separate ?
> >
> > Naive me (I am not a compiler writer) thinks the compiler may have a
> > harder time to optimize the code when addresses are involved.
>
> Will the compiler generate code that is worse in the end ?
>
> >>>>>> +{
> >>>>>> +       /* R-Car Gen4 and older do not need any offset remap. */
> >>>>>> +       if (!p->info.has_layout_gen5)
> >>>>>> +               return 0;
> >>>>>> +
> >>>>>> +       /*
> >>>>>> +        * R-Car Gen5 register layout is slightly different and the offsets
> >>>>>> +        * that have to be added to or subtracted from each register offset
> >>>>>> +        * can be divided into five groups, listed below.
> >>>>>> +        */
> >>>>>> +       switch (*offs) {
> >>>>>> +       case IOINTSEL...OUTDT:
> >>>>>> +               return 0;
> >>>>>> +       case INDT:
> >>>>>> +               *offs += 0x10;
> >>>>>> +               return 0;
> >>>>>> +       case INTDT...EDGLEVEL:
> >>>>>> +               fallthrough;
> >>>>>> +       case BOTHEDGE:
> >>>>>> +               *offs += 0x70;
> >>>>>> +               return 0;
> >>>>>> +       case OUTDTSEL:
> >>>>>> +               *offs -= 0x34;
> >>>>>> +               return 0;
> >>>>>> +       case INEN:
> >>>>>> +               *offs -= 0x38;
> >>>>>> +               return 0;
> >>>>>> +       default:
> >>>>>> +               /*
> >>>>>> +                * This here must never be reached, if this is reached, that
> >>>>>> +                * means there is a catastrophic failure in the driver. Skip
> >>>>>> +                * any IO read/write to prevent further damage.
> >>>>>> +                */
> >>>>>> +               WARN_ON(1);
> >>>>>
> >>>>> A build-time failure would be better.  I tried BUILD_BUG() instead,
> >>>>> but unfortunately gcc is not smart enough to notice this case is
> >>>>> never reached.  __always_inline doesn't seem to help either.
> >>>> I had one more idea -- how about we convert the driver to mmio regmap,
> >>>> use opaque register numbers throughout the driver to identify registers
> >>>> to the regmap (maybe not a great idea), and then implement .read/.write
> >>>> callbacks in the regmap_config which instead of doing plain
> >>>> readl()/writel() for register IO would instead do this remapping ?
> >>>> Regmap could validate that the opaque register numbers are only the
> >>>> expected register numbers and reject all the others. Maybe the opaque
> >>>> register numbers could instead of Gen4 register offsets. What do you think ?
> >>>
> >>> That's similar (but more complex?) than the array look-up
> >>> in drivers/tty/serial/sh-sci.c I pointed to before.
> >>> drivers/i2c/busses/i2c-riic.c uses the same method.
> >>
> >> Those do not use regmap (drivers/base/regmap/), do they ?
> >
> > No they don't.
>
> What about my regmap suggestion ?
>
> >>> I.e. just convert the existing register defines into an enum, and use
> >>> that to index a table with the family-specific offsets?
> >>
> >> Are we back to the table look up discussion instead of remap function ?
> >
> > Yes, I think that's the simplest and best-performing solution
>
> The performance benefit of the table look up was never confirmed.

You think a single array element retrieval would be more expensive
than an out-of-line call to regmap, involving function pointers and
(oh yes) a table look-up?

> > : one
> > extra table look-up (array indexing) in gpio_rcar_{read,write}(),
> > compared to an extra function call to gpio_rcar_remap_offset().
>
> The function is inlined by the compiler. The table look up will likely
> suffer due to non-locality of the data in cache.

It is not inlined by gcc 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04.1).
The table needs 13x2 bytes, which fits in a cache line on anything
but m68k.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
