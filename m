Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6129F26A0B9
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 06:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777011883; cv=none; b=NUhOMeg5p9xLjaijV4w/ZqQ8KKZqV4lhQqfgwyBQt+a/KTrKjxQqmhWIGT44FJP90ygroigFMVBaV1D+ukyx5hgHOlZG66hhDHY4G0yKtAm37+7zQr1IxuRT6QUa8zWIGhYIGGplAtZ63FyhRYsYAWbo9iE8Ba8p0bxqMvjwme8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777011883; c=relaxed/simple;
	bh=jWnKWFsq2UQMYrWu/2lPXunCsMi2nCGVKHLymQhz4/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qWWJbm3g+0mK98si4XHJwphwIYjyVIUGJT9km4wVHuddxTBrqA7zFgnB5ltVUwtvy99vuAzAJXZJkfmhITGO4104iAkLhxoql/6Ox0cTj8swOnE21GOSvbd+azmBRNax+MxuovUmyV4z7y4f6hNluQ5iMCBRBBC8Ab0xvYo81C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-60fbbac2938so2951855137.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 23:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777011881; x=1777616681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FapzwhdvoGXDd8qZ19lMZ3BT1g7fv1HHVzqpUQuOKIY=;
        b=MAP7USWPDYislZi7KQRWf26OueIdFAAxjw5+d4RhBkI18DpqKH9N1pvmsoFYMx8ksM
         LqH7SFkDysSVeRqecxCQOCG87/adrTUZI0yCw4/tRlgU9UbO3gKQu0cde1kbvpTI3q/M
         Cg9Btr45QBmRE2J+TesoC0wBfNPvtEkmwYl/9fIRGtuSuMaff4bUQjGv1jPKpySE3pJ4
         NDnSbbLbiMPay1UuJp5zD54MsSB203iXoVkUT9UIpbHVlkia4J/8ZcJwR1/vLwXdUUuk
         warAqqe4H5lY02U25RQYoQpHkFBduXSDmUJUUlFDad0Bp2DXzxLi8q1wl9Ti44cihjKK
         b+KQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TquXp7WshDNm4m5bv7ymoQBiwt7iq4geGBbCDcFFunNZecAqhka6bFl4capucI7fhj5y8MUCL5uR2@vger.kernel.org
X-Gm-Message-State: AOJu0YxJGCMJeYbru9zJnGoALQoZeIPRTgYNn844r/1e4EOnDZuqRnvD
	Kl/7uvSnDgFQcdU6HJFN4m/UoCwSo7/DoYzpjPi07eUb7bq2Nfcg9BouM2hQa7TKP/U=
X-Gm-Gg: AeBDietgIel4lUK7vIR4Up6o3WcfjPVmbuk6IY83rUqfgZ4cU4TPIuKUvIzJMAIFr+W
	t8Gig9NWqxXVLsPcQgAefig4WxiXHqBSSkLJzW0yUOewgrCmj94isPHDtchxU2KsrHBwxLuRTHO
	G6Fz1hOSFgzW0hf0R+QCOrlTT2PkCc/+mT3TmL8AJiU5p+lI7413PgH8RontEO3/+ETSgMgg7RL
	6BV8Nj/rfCvyXzVWRlyuyHrrh4p1lKySlynmRoV6caqGp+0xSmjxDDwzJSwZapLhB9tjMP2ltI8
	xvh3WTuVXxO7sJKize1QOKRrMmoKzZG5yajrcA6nD+WF/XD23v7b2WSa43piObvLupyP0uU4UHv
	bU5Jf0lPepwSl3B0FzCNcf4LTLKIsi9Zfa0sNK65UR/GFJWjzEHxCp763HBg/cMwwTMv66ebgeX
	coNlNEd4eLv70CtyWdcYvi3pJbnRBQgG/vACjL71N0ppxiMjVK9YGEDFkztcVfy+7+xaitHmJyz
	20=
X-Received: by 2002:a05:6102:6052:b0:610:6e69:5239 with SMTP id ada2fe7eead31-616f80724ddmr13069453137.23.1777011881229;
        Thu, 23 Apr 2026 23:24:41 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589097ec5csm10658451241.4.2026.04.23.23.24.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 23:24:38 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56eec951db1so2217443e0c.3
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 23:24:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9gblzhMZbFfAvYJnNUMp4ORACq701oDRlFutnuIcBPD8DEdmXGGcz0ZRdU6w6hjQZNTFqZD+s4QhrE@vger.kernel.org
X-Received: by 2002:a05:6122:f8c:b0:56f:6cc0:681e with SMTP id
 71dfb90a1353d-56fa57db05dmr15358381e0c.1.1777011877979; Thu, 23 Apr 2026
 23:24:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
 <20260415124731.3684773-2-john.madieu.xa@bp.renesas.com> <20260417-energetic-practical-frigatebird-5b93ad@quoll>
 <TY6PR01MB17377C02109A651FBCB31CFDBFF2B2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB17377C02109A651FBCB31CFDBFF2B2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 08:24:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUnbxjbj6ahebyH8VKg5RJEjoZ=bRNRv85EHyYC=Fuvow@mail.gmail.com>
X-Gm-Features: AQROBzBh__-xpGTZuPSCZvvq_Mj1-8UpRxwY9s8nlkbsDmTamvZ85Y60nHWYt7M
Message-ID: <CAMuHMdUnbxjbj6ahebyH8VKg5RJEjoZ=bRNRv85EHyYC=Fuvow@mail.gmail.com>
Subject: Re: [PATCH v5 01/14] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, John Madieu <john.madieu@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Fri, 24 Apr 2026 at 03:39, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > On Wed, Apr 15, 2026 at 12:47:18PM +0000, John Madieu wrote:
> > > Add a standalone device tree binding for the Renesas RZ/G3E
> > > (R9A09G047) sound controller.
> > >
> > > The RZ/G3E sound IP is based on R-Car Sound but differs in several ways:
> > > - Uses unprefixed sub-node names (ssi, ssiu, src, dvc, mix, ctu) instead
> > >   of R-Car's rcar_sound,xxx prefixed names.
> > > - Supports up to 5 DMA controllers per direction, allowing multiple DMA
> > >   entries with repeated channel names in SSIU, SRC and DVC sub-nodes.
> > > - Has 47 clocks including per-SSI ADG clocks (adg.ssi.0-9), SCU clocks
> > >   (scu, scu_x2, scu_supply), SSIF supply clock, AUDMAC peri-peri clock,
> > >   and ADG clock.
> > > - Has 14 reset lines including SCU, ADG and AUDMAC peri-peri resets.
> > > - SSI operates exclusively in BUSIF mode.
> > >
> > > These differences make the RZ/G3E binding incompatible with the
> > > existing renesas,rsnd.yaml, so it is added as a separate standalone
> > > binding with its own $ref to dai-common.yaml.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.
> > > +++ yaml

> > > +  "#sound-dai-cells":
> > > +    enum: [0, 1]
> >
> > Why is this flexible? That's a defined device meaning you have one XOR
> > more DAIs. Not "1 and more".
>
> The IP exposes ten independent SSI interfaces, and a board can
> reasonably wire either a single SSI to one codec or several SSIs
> to several codecs. The cells value follows that wiring: 0 when
> the phandle is `<&rcar_sound>` for the single-DAI case, 1 when
> it is `<&rcar_sound N>` selecting a specific DAI index.

How does this work if both types of wiring are present?
e.g. SSI1 wired to one codec, and SSI2-4 wired to several codecs?

> > > +  clock-names:
> > > +    items:
> > > +      - const: ssi-all
> > > +      - const: ssi.9
> >
> > Use consistently -
>
> Agreed, I'll switch to hyphens for all indexed entries
> in both lists (ssi-0..9, src-0..9, mix-0..1, ctu-0..7,
> dvc-0..1, adg-ssi-0..9).
>
> > > +      - const: ssi.8
> > > +      - const: ssi.7
> > > +      - const: ssi.6
> > > +      - const: ssi.5
> > > +      - const: ssi.4
> > > +      - const: ssi.3
> > > +      - const: ssi.2
> > > +      - const: ssi.1
> > > +      - const: ssi.0
> > > +      - const: src.9
> > > +      - const: src.8
> > > +      - const: src.7
> > > +      - const: src.6
> > > +      - const: src.5
> > > +      - const: src.4
> > > +      - const: src.3
> > > +      - const: src.2
> > > +      - const: src.1
> > > +      - const: src.0
> > > +      - const: mix.1
> > > +      - const: mix.0
> > > +      - const: ctu.1
> > > +      - const: ctu.0

Why are these listed in descending order...

> > > +      - const: dvc.0
> > > +      - const: dvc.1

... and these in ascending order?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
