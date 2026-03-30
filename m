Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057863939D3
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896900; cv=none; b=jCPshE/Ell+FNHW6cY395N9dD5K5FzW/WDkjTuf4bZ76qP+XetDyXL2vI+I+gXBP7RBQ3nNjtJoQOQjwcAtY6z8uDQX6jnVOFklHEXLHZd9ex5ldCPsS2cOi4DVmuTK/lTW1a6cr+lJIDE4rqL84ucVK5dC6Ulh5VZ2tEO3QYZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896900; c=relaxed/simple;
	bh=PZJA8OYSHkcjEb6yeCr4bU8DRy/2gacrQ+n6Z6q9zPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ayqh7aZDOsM32zqTwhpVBCdKa+rtZlmc4wbbkP7XCJ43VEsVp4nZ0wZVASRW8PT9lN2i4Mh708DMyrs8VyJnUoB6tEbijFtBbeqhH0uTggM9z9d6CSb3Nj8jlnKiKoTmNNY3V5FCvSjbS3Z4FucF4IKaRhBgX3mAHt92+oeycHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8d0288d24f6so338844885a.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896898; x=1775501698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmbdfERIdYVjSOaA8rBMP7lXVvFsi5yyzuqKEhnFPsQ=;
        b=rpnN6AqmLQEbUsrMXY6RBuKFCnoOL5srGhDYkj5VLzZXVVL8ausXf0qQa9816sQMNr
         0F6i9vpnzBpq+JekXJKQwrlUUyt8+6bgMIR4VlBfZeSu2Xq9Zj4sCm3Gb1t4909+xApW
         89tdZsSv010aDY9rcjQWndP/9uXsBVmQHM398tkxXY4plJ+0gKtawrYLjVoQ3YI+b2kL
         s3F8pRAese3VqAq/fk8TyHzFtpaAJgQJoeVYUl/hpLjvIYkJEzx4hEXR2D3EomjclYrH
         qqaAFe6Q2o1XvxcRWlSpdP22BBMydz87gC/zMemOcDS3g/ef9dzT7wsyFBQnajqrGOv9
         9v9w==
X-Forwarded-Encrypted: i=1; AJvYcCXkUdrz6HsY5kBWiBcixLTFneJQHqebSNnvyfYpBdyMsJrtdFbi2vAsKT2ObDJx+9avaYztMMV60T6d@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9vORnCA5eQQtKX0UKKAiPiVwQl+weyYIWx3BxPt2u07KesnLQ
	98VN5pxI8L0Go8CT9aIjO6XznkpjyrasLPwzcbxUZ/IhFT2aTcq2BbA2ZP9mUOmw
X-Gm-Gg: ATEYQzxvF2NerNn0SPZMZ3Sjaq6D6CTI9KW3jUm/j3u1roeIAcC/WfIfMXKsVGqVbhx
	G2l96kp/quGTlZoxWe9DtqZ9RfcUPI6PMc/izzR0iVragTg++r1se6schqRtMndDpxySEjLTk2r
	AtJlLKwNkKvvu3hTgRM6DjmYATQ9rvqIWe3sy3LOLLbeNSfyE+7qGNGT1hXta17tBgR1x+Bh1g6
	nW092c5Fi56UriD50Ijs7fbLMkBt/MwIvpIgmobamQPpssvhIuOpAt6189ZuCfoGrpBuqeHTfFH
	Sj6bhGTxVa9lC0lnP6h1w1J3b1mc+QaSGGJnNP/+SCNqGd+8U2wPydBuu+36c03ZCti9KcPJIkw
	kjnsZt59kfXAfAyX987Iff6s2E4cjWdzMPxaXQgK45yHWkGbQ3fSBVbw6dazc80Lpmn7mpXocu3
	hZ6OQ9OUuWPXsb3X646EOjf0ujpVda2jIk20dMUwFc14m51pqcyYSIgFpO5ofeqhu8
X-Received: by 2002:a05:620a:480a:b0:8d0:dba:30e9 with SMTP id af79cd13be357-8d1aa38109emr102038685a.9.1774896897917;
        Mon, 30 Mar 2026 11:54:57 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027f06ee8sm829035685a.14.2026.03.30.11.54.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:54:57 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5091d71aa11so59328431cf.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:54:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvCapxSZUceJ/29Z3dbONdIOmdUP/QI+enqPoPv4irT0CInueEt6nDHN/zw1kWi6YwkZdC/O87Z8fK@vger.kernel.org
X-Received: by 2002:a05:6122:21a7:b0:56a:ed84:e2 with SMTP id
 71dfb90a1353d-56d7bf9a1a3mr395634e0c.1.1774896484928; Mon, 30 Mar 2026
 11:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com>
 <20260319155334.51278-8-john.madieu.xa@bp.renesas.com> <20260320-peculiar-cat-of-acumen-c6f6b3@quoll>
 <TY6PR01MB173775E9970A41ED3A7FFF1DAFF52A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB173775E9970A41ED3A7FFF1DAFF52A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 20:47:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6Ac_=BugNJaqWnazdDsuzBB765jpzXt8fUasbypXFxg@mail.gmail.com>
X-Gm-Features: AQROBzBY2yW50P7_EhVQZxwFTstX-3Z9DxWPu0ijoIOHvrdSgZhFLZHzJwI06ec
Message-ID: <CAMuHMdW6Ac_=BugNJaqWnazdDsuzBB765jpzXt8fUasbypXFxg@mail.gmail.com>
Subject: Re: [PATCH 07/22] ASoC: dt-bindings: renesas,rsnd: Add RZ/G3E support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
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

On Mon, 30 Mar 2026 at 17:40, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > > RZ/G3E has a different audio architecture from R-Car Gen2/Gen3/Gen4,
> > > with additional clocks and resets:
> > > - Per-SSI ADG clocks (adg.ssi.0-9)
> > > - SCU related clocks (scu, scu_x2, scu_supply)
> > > - SSIF supply clock
> > > - AUDMAC peri-peri clock
> > > - ADG clock
> > > - Additional resets for SCU, ADG, and AUDMAC peri-peri
> > >
> > > RZ/G3E has 5 DMA controllers that can all be used by audio peripherals.
> > > To allow the DMA core to distribute channels across all available
> > > controllers, increase the maximum number of DMA entries in DVC, SRC,
> > > and SSIU sub-nodes so that multiple providers can be listed with
> > > repeated channel names.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> > > b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > index e8a2acb92646..bc8885c4fa24 100644
> > > --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > @@ -58,6 +58,7 @@ properties:
> > >            - renesas,rcar_sound-gen2
> > >            - renesas,rcar_sound-gen3
> > >            - renesas,rcar_sound-gen4
> > > +          - renesas,rcar_sound-r9a09g047     # RZ/G3E
> >
> > Do not use underscores in compatibles. Previously used wrong style is not
> > the excuse here, just like previously poor code, mistakes, bugs,
> > unreadable approches is not justification to repeat the same.
>
> Got it.
>
> > >    reg:
> > >      minItems: 1
> > > @@ -97,20 +98,22 @@ properties:
> > >
> > >    resets:
> > >      minItems: 1
> > > -    maxItems: 11
> > > +    maxItems: 14
> > >
> > >    reset-names:
> > >      minItems: 1
> > > -    maxItems: 11
> > > +    maxItems: 14
> > >
> > >    clocks:
> > >      description: References to SSI/SRC/MIX/CTU/DVC/AUDIO_CLK clocks.
> > >      minItems: 1
> > > -    maxItems: 31
> > > +    maxItems: 47
> > >
> > >    clock-names:
> > >      description: List of necessary clock names.
> > >      # details are defined below
> > > +    minItems: 1
> > > +    maxItems: 47
> > >
> > >    # ports is below
> > >    port:
> > > @@ -136,9 +139,17 @@ properties:
> > >
> > >          properties:
> > >            dmas:
> > > -            maxItems: 1
> > > +            description:
> > > +              Must contain unique DMA specifiers, one per available
> > > +              DMAC. On RZ/G3E, up to 5 for transmission.
> > > +            minItems: 1
> > > +            maxItems: 5
> > >            dma-names:
> > > -            const: tx
> > > +            minItems: 1
> > > +            maxItems: 5
> > > +            items:
> > > +              enum:
> > > +                - tx
> >
> > Multiple levels, multiple if:then: (further) - I don't find this binding
> > manageable/readable. You should split it, with common binding defining
> > common part of hardware or interface if there is such.
>
> I as you suggested, I'll split it. Just to double check, should I fix
> any bug found in there (like existing compatible strings having underscore
> separators) ? Or should I just split and make sure only new SoC support is
> bug free ?

You cannot just change existing compatible values, as they are part
of the DT ABI.

When you split RZ/G3E off into a separate file, please drop the
"rcar"-part[*] in its compatible value, and move the SoC-specific part
right after the comma.  Perhaps "renesas,r9a09g047-sound"?

[*] Disclaimer: I haven't read the RZ/G3E audio chapter yet.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
