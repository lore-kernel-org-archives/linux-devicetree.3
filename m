Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428180;
	b=IeZL3ijrkV2REIhVhfsVuDbVNwE477wthQjOzyPJG1FOOs81X7x78UXXbXlR13DjK79y
	 4dBJig5nS4k+U0KuHNl7nwCVDcRbQRKUOKojiKwtMO7J8tarNX96E8MMtw4MGk7GMe8DE
	 I6cHqUvG1qXOItnJdjgTaF60dht5ymIhz6YLQz4Lg+ccuXUSTCUjQoy894VYc90JtgZ0I
	 kODvi+YHm3/N4WmDN2eezIYATEY5ZkM7vXSJ+IlqTx1g/QXQH4j70bVD+OYxlPEe73YPs
	 T5b3J+MgmbZ80iL66HGpbxwWeOF5zfY0fJyuiNOkYuwLUaNXRWdL93gSJUqo/UiYzfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428180;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PmiGcIdjfKIGHCu1gzOSxutdw7IHUOocB921VJoVgxA=;
	b=uaKWyUaec6exKe0oPi7hNXE4DmeHC4FJY9EfQqE99wKuZ8v/izFKshwqPoi2dt9OzPiJ
	 hyUXvKfrpf/npyzJhsjvNOl2mYvu59o7DIa8jD5MF4wMbobyln9/qa2PhTU3mUOX05pOL
	 x+96k0I133NnE1JhNV7laJaLqrRmoGEKBJkddwHVIt0MC7nMm6co2bDHNHdvsJyA+XbGz
	 8ERcZpHJvllM6X9+vEn7GeNmwXn6+jFHRxrlPjB7KqIbsXfvZfPSBC6P3uazbSXadKc4a
	 MbJ4hz+pAwTHHNumv9SiShGovyz3vTNmi92e9Qfx5fW1FWSTuJTEQcod5mPvTy5kntg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7950606A31A
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7950606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso317291166b.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428178; x=1793032978;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PmiGcIdjfKIGHCu1gzOSxutdw7IHUOocB921VJoVgxA=;
        b=hbgxUGgw5wZutWBMSSf3nTmFJzbVnSGC8do1jhafuRwIW1j4Oajym+w4ERXE5qzSu8
         ZzvekofIY9Q8akN38aNgoqP/JsjWVb+Kl/SBZ2rfbY8GlOVc6ZbmwKC0oNzqncmskigr
         dBNY8VSmle8fWv5wSywrw289CXcolDND3zTHN7IL/BqQSeDw9TFlNmoFE1Yn9NwibUQB
         vD2/CE0un9EIQMHwqf5URCIMHbSvH+JBXI2yadG+XTRQ0T13dtaOrLDg0NRMHRHgtj/f
         edYcQF47ErbR2oWE5lKdl+aztVqNvaLW9z+CLGJh0ZAVk8zEcVVX1lJlCbyQIg2uq4rh
         zdqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSYAvAkSUDXjPEHihcU/Uo4OnlFjk7Kz0QzCzXnHhk7GrrpFBkqU108+Zs1MwOSGedCoRF2ZcdZXG+@vger.kernel.org
X-Gm-Message-State: AFq9FYID8cIwNJvV9+qaJIqdN7eqNNW+28g9POHkBEce9ZJt79exvpzj
	RQaNBGpN9LKj10wuDmz3roCmjGwyPEjI0t9D0qqgd9RJXZCevVCNm8bv6zQ8VBtilE0=
X-Gm-Gg: AYBFou1DvFMNO2x0mOVa1DhFm5D6F1rzq1pUBtHVOhD9QX+UuCLAQJGeOx0NAlt+twV
	2dwGxgvqLCK3QsEAruRAG0wUqg/0cV1ClwKYaaANPvokWKYU69ASpClhjZS4K+pUAy2q8AjU/Lw
	e63RSMz4UPNHr5LJsm64OtrmJHLs0s1PVsN1Ta1QuX46on7dPyKP4GNoAdWRlQqEcTncCmYHs3H
	gFLUaR1sr8cQgzRElfQiDevRbr3f2EmiciUcOWNrQQSiuar/HDwV4k7YopT8AtVBepGLhTlKbaZ
	F/7rIt7vLxK62DG+97G8SJ2JJ59z6JQA9gFKx6JWhSIj5HO26KnkH/vmqUAbF/hxcs+qWuK4x0y
	xTF+CDF5/HOr/lZH0n5bQ1sYqot76zmy7jna86mIdN0lnNaOjO/C95a/NOsrOaFM+csS1mxWDG5
	WPe4SmCjZEhMR3paiSKzztA/1qGrf+zwceqQEckad8PqTYTTjGskZKWSrNIgYpQyqX7i9Bgy5RP
	GTtmGMT+xUZXg1m5QzfcYI43qD9Dhc15HINLu2DtgYE3xsRbKbZN6XvjoAJoKiscUUM5/lk0GSp
	+Y+0bcqjhLScZNS5sg==
X-Received: by 2002:a17:906:99c4:b0:c3f:a728:b437 with SMTP id a640c23a62f3a-c41a0dd50damr554573266b.45.1792428177946;
        Mon, 19 Oct 2026 09:42:57 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10d4sm385906966b.27.2026.10.19.09.42.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:42:57 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so264401166b.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:42:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByw4Uf7lkghlV7njPcRIFc/XT+YgSh4ZB+06poAymUUjtT/ICk9nOqc2R/ybfsUgxxcTO2FlxkHYbGd@vger.kernel.org
X-Received: by 2002:a17:907:9605:b0:c3e:ee86:d2c with SMTP id
 a640c23a62f3a-c419f31c8bamr564444366b.27.1792427870527; Mon, 19 Oct 2026
 09:37:50 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
 <20261019144256.GC763679@killaraus.ideasonboard.com> <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
 <20261019152203.GA5830@killaraus.ideasonboard.com> <20261019161436.GD3705@killaraus.ideasonboard.com>
In-Reply-To: <20261019161436.GD3705@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:37:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRvguzV+3CpOfkR+b-a0p5TrmUUF1fV0kdafXuNLV1oA@mail.gmail.com>
X-Gm-Features: AclHuK-8scCJz9rF32kL_0712rSWvXw0tvi_Wr1HURn1pKiiIZROkb3-2ONTagY
Message-ID: <CAMuHMdVRvguzV+3CpOfkR+b-a0p5TrmUUF1fV0kdafXuNLV1oA@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 18:14, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 19, 2026 at 06:22:04PM +0300, Laurent Pinchart wrote:
> > On Mon, Oct 19, 2026 at 04:56:28PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, 19 Oct 2026 at 16:42, Laurent Pinchart wrote:
> > > > On Fri, Oct 16, 2026 at 05:55:40PM +0200, Geert Uytterhoeven wrote:
> > > > > Prepare for mapping to other than fixed-rate clocks by adding a clk_hw
> > > > > pointer to the clk_map structure, and populating it up-front.
> > > > >
> > > > > Move r8a78000_cpg_priv.fixed_hws into fill_clk_map(), as it is no longer
> > > > > needed afterwards, and drop NUM_FIXED_CLKS.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > > > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > > > > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > > > > @@ -16,19 +16,24 @@
> > > > >
> > > > >  #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
> > > > >
> > > > > +struct clk_map_in {
> > > >
> > > > The "_in" suffix isn't very explicit.
> > >
> > > I can add a comment...
> >
> > How about calling it clk_id_map ?
> >
> > > > > +     int dt_id;              /* DT binding clock ID or -1 sentinel */
> > > > > +     u32 fw_id;              /* FIXED_CLK() ID */
> > > > > +};
> > > > > +
> > > > >  struct clk_map {
> > > > >       int dt_id;              /* DT binding clock ID or -1 sentinel */
> > > > >       u32 fw_id;              /* FIXED_CLK() ID */
> > >
> > > BTW, do you think it would be worthwhile to reuse clk_map_in here?
> >
> > Possibly. I was about to recommend just using a single structure and
> > leaving the clk_hw pointer NULL and unused in .rodata, but the memory
> > waste isn't very nice, especially if we end up with many entries :-(
>
> Actually, you could even turns clk_map into
>
> struct clk_map {
>         const struct clk_id_map *map;
>         struct clk_hw *hw;
> };
>
> It should consume the same amount of space on 64-bit platforms. Doing
> the same in the MDLC driver would save space.
>
> Or, if you want to save more memory, you could drop clk_map and store
> the clk_hw in a separate array in r8a78000_cpg_priv, using the same
> indices as clk_map_id.
>
> struct r8a78000_cpg_priv {
>         struct device *dev;
>
>         const struct clk_id_map *map;
>         unsigned int num_map_entries;
>         struct clk_hw **clks;
>
>         struct clk_hw *fixed_hws[NUM_FIXED_CLKS];
> };
>
> where clks is a dynamically-allocated array fo struct clk_hw pointers,
> having the same size as the map array.

IIRC, I considered that option, but rejected it, as I still hoped to
put the (at that time multiple, per version) tables in __initconst,
so they had to be allocated and copied anyway...

> Too many options.

Hehe...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
