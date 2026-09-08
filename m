Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C21D3998BE
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853772; cv=none; b=ifiDIkPAjbwRz6lNpS8gtBFwewSkwaRKFqa1Y5jTdTHu6DwXlGQoxPoGHi2ZiNut3j4wFJmRowG6vNSb3D0Kmivl/OVUDj4AiyAlVZPzwWhAHVRF8dZPjcZ6ungNUZdnuRm3qnGoXRBtLN1TJw9ygoEqW9M2S/h2CTCtIkLy9NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853772; c=relaxed/simple;
	bh=w/a+1msjGoAq5RLfsEPT89FQwvNcgfDXVDAMK+BH8PQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DIwjyBPqmUHvnqn/NMlVe7TfnCcm10SHW6xLH73F3Oo1dZUhPhJiCVOku3SHHHu2efEdoatR2tVQZewpivqRIh5ynHy2l/K/nkKNHbAdAr0RUauuk9sd0ZmSyH2yV9tzS5ujp9y6AeswEXZbc6AxHJbw+EZNnJePJgXgDknTjKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-782af6c753cso3891323137.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853769; x=1789458569;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jvWdv2bTFNskO/RaDsnSTq+0xZGM/I73gHnrYZO6XAc=;
        b=F5ZRGCOy7N5pvqLy2mQSCpcpNaGoezxxyVLP6B4CGA3lRKq54wwoEoJ2MT+j37RKwe
         MOPdfewDaedJ8AewUTR2xFxER1gB0ykL/3667vG0oancJ9M8BsbtU0edOPVddxPPqyQw
         BVkVA8H4Ihtrgd67r9pa3Ls5ZOIhlw1CW4MhloxbxQPjhSLg1149qaZPL6V55HRlomaJ
         RvewhC22b3gEJK+AFV4DM+fSWkgS9DF4PXt4lCEaYWZgGdaYBEn0vjXGqdsnhjMgdk2s
         hZES00gtNeFV/jTlN+v2omK4BKyGDKpOpfPpFyz3ykDf5iFgDkHC1RZAzPc7MVuXb8SC
         a+Dg==
X-Forwarded-Encrypted: i=1; AKwUvBzE9TN0EH43zyS5EcNfG80HNpXYG4EH7mxJ9F1gaEUNQFQqQ3CqRBsZ9bQuIKr/oxgqnEaZwRYvIOPg@vger.kernel.org
X-Gm-Message-State: AFuF++n3rtxDgBmzPme9ZWQeedxwUzM4TZ+ic9K/L6ik8R6G5N7zO7qK
	oveJILUNvUpGmoDiU0u6uOMYUtNVbPRZoAJVdTai9wPeoYf7VeJFBhW36Zeth9GM
X-Gm-Gg: AYBFou2Yb7Ri9pomHm2oI3rA9Fm8XTdDK9wiaaZOhhBWZIPjLBMc03Q7ryDDNKSC85K
	4cXg8oFwXHkO8+6p0RRpMaYv1VPkn2B4+cTV7A9RCaWMcZgBNaLj9lOU6R81EiZimmJI4GEBLaX
	X7GlCUAV7A6bGvIEfbFUEHrJzfP/vosrY5t7B5QndGEl/iufcT6QhAe4vMg+XKF6WYKDYtIa5Bx
	1a+9HWKgmU0dUXI134784AuS9m9+XGfd8ViTMsNvJB8l+WVmcK9FCdfWTxO04RRs4IF9KHyi+u2
	F2tp6gNm3jeQ1aBIrRGwEvF8XMlOui6omeJa08HdSNRjdlUfeXuGRxvZjuhk96wU6slTEtwJJhO
	f7F7GZMyKWEdRCh3yCIXeQMe/nPdCHthY/nJPfH0JTlRHNDZcfZZGq6qbYttUbeWqnL/L2u0woE
	S/h6Paj8hEHFH88uEOoSkP75WBO+Be4Z/ZRjUXGHTSHbcxcajL0TvBPDNnVTxpWvct8KtAa73H2
	TojVKQHOkR1EnpxT8N/Uo8keA==
X-Received: by 2002:a05:6102:b02:b0:786:c86c:4f5e with SMTP id ada2fe7eead31-78a4a6e7023mr12559050137.3.1788853769362;
        Tue, 08 Sep 2026 00:49:29 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98280a3aeb3sm868818241.12.2026.09.08.00.49.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:49:28 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-779d18ef706so3067246137.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:49:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxOngi6dvrBcNAxP43aHOxlteQaMVwBWPcWIErsiSw2iTCUSJwiaFMAKmX1DnezSIj5Pf7ANSoWM7xX@vger.kernel.org
X-Received: by 2002:a05:6102:1481:b0:784:b9ec:9144 with SMTP id
 ada2fe7eead31-78a4a9c3a45mr12132706137.8.1788853767856; Tue, 08 Sep 2026
 00:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
 <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org> <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
 <43eccc85-fca3-4c69-9114-b45ab5e1b487@mailbox.org>
In-Reply-To: <43eccc85-fca3-4c69-9114-b45ab5e1b487@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 09:49:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWm1JzmXx1++dhvHbnBbVqQnVVAANfmH5Y24bhJU7pXQ@mail.gmail.com>
X-Gm-Features: AcwNN1V14nvpkxMTS1YJ9lEZFP5Wka8HrashHqoyW3yt83iI5VS79ckl8xfvtwY
Message-ID: <CAMuHMdVWm1JzmXx1++dhvHbnBbVqQnVVAANfmH5Y24bhJU7pXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 7 Sept 2026 at 18:37, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/7/26 9:53 AM, Geert Uytterhoeven wrote:
> > On Sat, 5 Sept 2026 at 23:57, Marek Vasut <marek.vasut@mailbox.org> wrote:
> >> On 9/4/26 1:15 PM, Geert Uytterhoeven wrote:
> >>>> +++ b/drivers/gpio/gpio-rcar.c
> >>>
> >>>> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
> >>>>
> >>>>    #define RCAR_MAX_GPIO_PER_BANK         32
> >>>>
> >>>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >>>
> >>> IMO passing a pointer to offs complicates the code.  Perhaps pass offs
> >>> by value, and return the adjusted offset or a negative error code?
> >>
> >> I want to avoid that, since if I only return error value, I can then do
> >> simple:
> >>
> >> ret = gpio_rcar_remap_offset(...);
> >> if (ret)
> >>     return ret;
> >>
> >> in gpio_rcar_read() and gpio_rcar_write(), which are the only two call
> >> sites of this function.
> >
> > gpio_rcar_read() and gpio_rcar_write() do not return error codes.
> > I was thinking of
> >
> >      offs = gpio_rcar_remap_offset(p, offs);
> >      if (offs < 0)
> >              return 0;
> >
> > which is almost the same, but avoids passing offs by address.
>
> Is there any benefit to it, compared to keeping the value and return
> code separate ?

Naive me (I am not a compiler writer) thinks the compiler may have a
harder time to optimize the code when addresses are involved.

> >>>> +{
> >>>> +       /* R-Car Gen4 and older do not need any offset remap. */
> >>>> +       if (!p->info.has_layout_gen5)
> >>>> +               return 0;
> >>>> +
> >>>> +       /*
> >>>> +        * R-Car Gen5 register layout is slightly different and the offsets
> >>>> +        * that have to be added to or subtracted from each register offset
> >>>> +        * can be divided into five groups, listed below.
> >>>> +        */
> >>>> +       switch (*offs) {
> >>>> +       case IOINTSEL...OUTDT:
> >>>> +               return 0;
> >>>> +       case INDT:
> >>>> +               *offs += 0x10;
> >>>> +               return 0;
> >>>> +       case INTDT...EDGLEVEL:
> >>>> +               fallthrough;
> >>>> +       case BOTHEDGE:
> >>>> +               *offs += 0x70;
> >>>> +               return 0;
> >>>> +       case OUTDTSEL:
> >>>> +               *offs -= 0x34;
> >>>> +               return 0;
> >>>> +       case INEN:
> >>>> +               *offs -= 0x38;
> >>>> +               return 0;
> >>>> +       default:
> >>>> +               /*
> >>>> +                * This here must never be reached, if this is reached, that
> >>>> +                * means there is a catastrophic failure in the driver. Skip
> >>>> +                * any IO read/write to prevent further damage.
> >>>> +                */
> >>>> +               WARN_ON(1);
> >>>
> >>> A build-time failure would be better.  I tried BUILD_BUG() instead,
> >>> but unfortunately gcc is not smart enough to notice this case is
> >>> never reached.  __always_inline doesn't seem to help either.
> >> I had one more idea -- how about we convert the driver to mmio regmap,
> >> use opaque register numbers throughout the driver to identify registers
> >> to the regmap (maybe not a great idea), and then implement .read/.write
> >> callbacks in the regmap_config which instead of doing plain
> >> readl()/writel() for register IO would instead do this remapping ?
> >> Regmap could validate that the opaque register numbers are only the
> >> expected register numbers and reject all the others. Maybe the opaque
> >> register numbers could instead of Gen4 register offsets. What do you think ?
> >
> > That's similar (but more complex?) than the array look-up
> > in drivers/tty/serial/sh-sci.c I pointed to before.
> > drivers/i2c/busses/i2c-riic.c uses the same method.
>
> Those do not use regmap (drivers/base/regmap/), do they ?

No they don't.

> > I.e. just convert the existing register defines into an enum, and use
> > that to index a table with the family-specific offsets?
>
> Are we back to the table look up discussion instead of remap function ?

Yes, I think that's the simplest and best-performing solution: one
extra table look-up (array indexing) in gpio_rcar_{read,write}(),
compared to an extra function call to gpio_rcar_remap_offset().

As a bonus, storing -1 for a non-existing register in the look-up table
would let us get rid of the four existing .has_<reg> booleans, e.g.

   -        if (p->info.has_both_edge_trigger)
   +        if (p->info.regs[BOTHEDGE] >= 0)
                    gpio_rcar_modify_bit(p, BOTHEDGE, hwirq, both);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
