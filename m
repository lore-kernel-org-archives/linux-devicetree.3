Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3513A6B8F
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598423; cv=none; b=uZBDTSKrsPF2/HyOACZLlsqVpY7EaFpk/RczftdwULzHdq0VGaRPFu/7P8HbqNwRmNZeNpFwsK3E3SeFUsyoIUg41UoGRRYGbvpIauFIs9WSF97tJMLDWueO7Y4K/Tj9MHSMFNpkCxs22yCMd8+DNFAdpVWeZhp7wcxcxq8GHfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598423; c=relaxed/simple;
	bh=LsuoM6vSS2icn4IcCYbHnTFkI9szULOyzJ6/FpfPSuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C++c2LN7hISmH910Yy+XH6AGC3wVX/a1mp3soljqj6iLt7r6bQGwSI+F1h+Gh2dIUK1iasgJVzuyFCsv3mUTNwuyVHKQlgqs9HUz8VrwyLiteaB9l4EeCNb7iulgxKUY4eX8WTAj20tts5cG7qmoE9/Dopf9S9SDTxxqzH1ikvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56cd71a7630so703883e0c.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 01:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598418; x=1775203218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHzybmIOhEZ6f1NrVP3jgghQyfbqKSz0qw+kQmDQIR0=;
        b=b7r4mwc6D/9qYWZ072PkMeAOKCpV2ybrIW8qOns+C5gfK4bXV1Fdzdk0PYAPsBTOnL
         NgwHwD//JregP7VsbYm2HW50fmW+3NKvlqGtBtGG5r4rSqtplGBue3CZkcJxY0kT3Fub
         8yifYVC8AxxRxffnJL/flfcu+zbm+TyaRbOVKt6Ds0HU804dfXqMuntNkgX3Ax+pEeqP
         a7etv/GAMe1RKDbL2L0Ofkk3m/Vlq9ZSuQ7K6ytOpFJDb6PnzIcj9UhkJUgFGL4BKKWp
         I0eaMaQdO9hR/6zrWnxPWz8Vw9EHu68LwTYUGwvTrQkAQYXIXJSOnGDI5+zUiFgprBgA
         rNJA==
X-Forwarded-Encrypted: i=1; AJvYcCUC20Lm0vjRemR+I6BjS1JDvgMr602hXlewNghwvBnY3lPLF3pXF3AxAGZCjQIvX418hiLA0zk3zHov@vger.kernel.org
X-Gm-Message-State: AOJu0YwdrNt0zF6EJxRpCMXiGgR9J8kAGoYK+K0PnShiZgmFJ+X8YlTZ
	nxOEkqnf7WBxDIFU9LdOL3zeFvjhJICtQImwiYONnydizUMrtM8JUDxOOsyl8tcazeY=
X-Gm-Gg: ATEYQzyYQjpvzVFzR/qyM1QLvkmQEE1aQ/hOJzPvZKQSFPyMvmuZPNEbaNhSadyjlkM
	MIlirh5Rz3eesnDFCEXUn78JRenS9VmzUzB5j8LH9sXkigFBbS9XUpu3PSNaREPVty4GGXQ9T+w
	bxCSQwTNIkC1WUvuY397lqLFYjd2l8C2aiOiNoICaAODsX66Ih2nUDvMNU4vRIv0wARPTLIrUNl
	FA4aMHDoU5ULWGDZN46TUi7/PNE6zy0AF0+9tGjxMeTuhAAFc3Xu7pKoryp/wMJqoMd42wFhLTL
	1FBhctdDsav6j3VOFmblCD+VSH2lPtlJVXZrb5mLHuQ4FqPworpRgkc8Rks7GiD8teR2kndfQ5r
	kQb+K4pw/75TZKEKxBwqd6Q76swiTVwo43P8dz27Cq0f5N/D/UPCPmdbG4aDMDyRAGzdDnRkMAx
	PGaew5V2r/fQLYQcPVCvesqy+KTs7NZW+C4uexlfrjQ5bXfHytct7ImQxIjQnhNqqFkBQ5Gf/28
	Ec=
X-Received: by 2002:a05:6122:2986:b0:56a:7f37:d18f with SMTP id 71dfb90a1353d-56d4a4cb964mr507805e0c.3.1774598418229;
        Fri, 27 Mar 2026 01:00:18 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31c3097fsm7852468e0c.7.2026.03.27.01.00.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 01:00:17 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56ce15c6898so681072e0c.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 01:00:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeZQEWjh3ArVJszUkmgO5jLMaD4+fqSEvapMhTASXKg3by5Y1oaJMo6YAtfrk6+P+4Xm4DNG77u+Gw@vger.kernel.org
X-Received: by 2002:a05:6102:560b:b0:5ff:d1c8:a85e with SMTP id
 ada2fe7eead31-604f930a02dmr530378137.32.1774598416378; Fri, 27 Mar 2026
 01:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com>
 <20260319155334.51278-5-john.madieu.xa@bp.renesas.com> <CAMuHMdVbP5Bbr9KuxoEb48zUvubT3CN7sC9oVat2NcNWaBwOtQ@mail.gmail.com>
 <TY6PR01MB1737720136E84FAF590F637C4FF56A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB1737720136E84FAF590F637C4FF56A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Mar 2026 09:00:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5W7bWa7CBYNoQqOKQVogmmnCbt1u8RREc_7p+0fNGmg@mail.gmail.com>
X-Gm-Features: AQROBzBkJOmSHv5z_VHomTtftX1LPSPJAufke2TB95A8lqe7V-8DI3QQuxsJ7o4
Message-ID: <CAMuHMdW5W7bWa7CBYNoQqOKQVogmmnCbt1u8RREc_7p+0fNGmg@mail.gmail.com>
Subject: Re: [PATCH 04/22] dt-bindings: dma: renesas,rz-dmac: Document
 optional DMA ACK cell
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Thomas Gleixner <tglx@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	John Madieu <john.madieu@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Thu, 26 Mar 2026 at 23:42, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 19 Mar 2026 at 16:55, John Madieu <john.madieu.xa@bp.renesas.com>
> > wrote:
> > > Some peripherals on RZ/V2H, RZ/V2N, and RZ/G3E SoCs require explicit
> > > ACK signal routing through the ICU. Document the optional second cell
> > > in the DMA specifier for specifying the ACK signal number.
> > >
> > > The first cell remains unchanged and specifies the encoded MID/RID and
> > > channel configuration. The optional second cell specifies the DMA ACK
> > > signal number for peripherals requiring level-based handshaking.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > Just a quick head-up, as I haven't read the actual secion in the
> > documentation yet.
> >
> > > --- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> > > +++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> > > @@ -63,17 +63,27 @@ properties:
> > >        - const: register
> > >
> > >    '#dma-cells':
> > > -    const: 1
> > > -    description:
> > > +    description: |
> > >        The cell specifies the encoded MID/RID or the REQ No values of
> > >        the DMAC port connected to the DMA client and the slave channel
> > >        configuration parameters.
> > > +      Use 1 cell for basic DMA configuration.
> > > +      Use 2 cells when DMA ACK signal routing through ICU is required
> > > +      (RZ/V2H, RZ/V2N, RZ/G3E audio peripherals such as SSIU, SPDIF,
> > SRC, DVC).
> > > +
> > > +      First cell:
> > >        bits[0:9] - Specifies the MID/RID or the REQ No value
> > >        bit[10] - Specifies DMA request high enable (HIEN)
> > >        bit[11] - Specifies DMA request detection type (LVL)
> > >        bits[12:14] - Specifies DMAACK output mode (AM)
> > >        bit[15] - Specifies Transfer Mode (TM)
> > >
> > > +      Second cell (optional, when #dma-cells = <2>):
> > > +      bits[6:0] - DMA acknowledge signal number (from ICU ACK table),
> > > +                  where 0 is a valid signal number.
> > > +                  Required for peripherals using level-based DMA
> > > +                  handshaking (SSIU, SPDIF, RSPI, SCU, ADC, PDM).
> >
> > How do you expect this to work? #dma-cells applies to all DMA consumers of
> > this provider, and these SoCs already have DMA users relying on #dma-cells
> > being one.
>
> Indeed.
>
> > In addition, you cannot have optional cells: if #dma-cells is two, then
> > all consumers must supply two cells (of course we could switch all of them
> > to two cells at once).  However, as zero is a valid signal number, we
> > cannot use that as a dummy when no DMA acknowledge signal number is needed
> > (we could use e.g. 0xffffffff instead).
> >
> > Is there any other way to provide this information?
> > E.g. could we have a table in the driver that contains this info for the
> > (presumably few) MID/RID values that need it?
>
> There are actually 89 entries, and I could identify 3 peripheral
> group with linear ACK assignments. Thus instead of static array
> we would get a simple function handling 3 req_no ranges.
>
> Something like:
>
> /*
>  * Map MID/RID request number (bits[0:9] of DMA specifier) to the ICU
>  * DMA ACK signal number, per RZ/G3E hardware manual Table 4.6-28.
>  *
>  * Three peripheral groups with linear ACK assignment:
>  *
>  *   PFC external DMA pins (DREQ0..DREQ4):
>  *     req_no 0x000-0x004 -> ACK No. 84-88  (ack = req_no + 84)
>  *
>  *   SSIU BUSIFs (ssip00..ssip93):
>  *     req_no 0x161-0x198 -> ACK No. 28-83  (ack = req_no - 0x145)
>  *
>  *   SPDIF (CH0..CH2) + SCU SRC (sr0..sr9) + DVC (cmd0..cmd1):
>  *     req_no 0x199-0x1b4 -> ACK No. 0-27   (ack = req_no - 0x199)
>  */
> static int rz_dmac_get_ack_no(const struct rz_dmac_info *info, u16 req_no)
> {
>         if (!info->icu_register_dma_ack)
>                 return -EINVAL;
>
>         /* PFC external DMA pins: ACK No. 84-88 */
>         if (req_no <= 0x004)
>                 return req_no + 84;
>
>         /* SSIU BUSIFs: ACK No. 28-83 */
>         if (req_no >= 0x161 && req_no <= 0x198)
>                 return req_no - 0x145;
>
>         /* SPDIF + SCU SRC + DVC: ACK No. 0-27 */
>         if (req_no >= 0x199 && req_no <= 0x1b4)
>                 return req_no - 0x199;
>
>         return -EINVAL;
> }

Nice!

Note that you can use ranges in case statements:

    git grep "case.*\.\.\."

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
