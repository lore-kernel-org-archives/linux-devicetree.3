Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421805;
	b=12//NlUhK8yEssY2fzMvilZH7H1WJMBEYYQ4ZLd9Udhi0ubj0xILQU+MCJ13QnqknOQD
	 jGlPG4zGlOvuKe6+B/Mq83qzZ+99fvtGm3SGR/beooFfZ3JXrIF7mMM+EXZEsRw395GVH
	 orr7ki6oy8Povbs3PjT2/aW9hLQLWOrdlarZoVDeHlw/lWCS5xW2IdtDt9HA7qSdq6U5u
	 05/g0k4waSsFpnGlm/w50DQvNEDh7aH96SMsnHj8+AAoevpEJyCjiF4ofqexxZwzBv5ia
	 5VWLBbaHvNezskbPdMgwUQxsx+8lWeRKWLqHnZOJOtCkrNysj3BziayeUv2u+HW++PA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421805;
	h=Received:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Yo6/2OGJfxhXILo4QGIB9gHfvFskGfKjbh+hNyiFvf8=;
	b=U/Ff146td2dZ9hLE16OlolBNbywpr6dSCHjz0qy3jZlv+u0mSYiqUYy/5te6mDXNtSra
	 P7DFa2yA+N8tphNk0kvbAHF2c7sfpCuryAsURV9MY/eVIliw8vDu5BB55+KWMiQuMHZRP
	 lWeAuL/TIcGq+ctAKTsJDSmgi1GDBP7P/Z71QpZZxNxDRnHo4DfCf5wWIK25VIlifatKa
	 /fWL00UqLE/kUFA1ZCQblv76A7VMu8VC3Ux36i7NIihOcUuRZTQ1AyOVbJxQ0EPaN60GX
	 AVSVUrt61U8FCDMmn96xalN75VTKic+pns2Qfz5TqpFueY0QiI/cnBkcFpqRGiXbOug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D035360724B6
	for <devicetree.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:56:45 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD413E44F3
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421805; cv=none; b=Uj6FoHaQ9QeQumfCwYjURrP8dldjSGsbIiNKla3oWZAiiv6oXuTo4ngL21kQtCJARUYRA7Bl90gNedxemhVSurI4ZhyTyYtLk8SGlta5RZZdfyM1EDtGPsCsb/CK0Edyzk8kj9/WlGHSKtvUvurWhINh5YwOrFINzPMct6GKRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421805; c=relaxed/simple;
	bh=+5tzO8aCL83c5Kk9ARXsVnhNDY1XZ/tMHseqvaZ/klI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=paG5NNIvbU7gC+ceOvYnGTKgYI2NFCU7bi3dZdRCXmEV85CjVKPP47bLbav/xgfCasZHAYZXTyldrUSOeAu9pyQKPobWJWxvKUGuWrN8XdWXXdWdP8Mies/OQ3s5mxQUsuRb/fY65FjojAadaHGXZU0OfpHpk6XrtOWMBhR8ngg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-988c7371716so598266241.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421802; x=1793026602;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yo6/2OGJfxhXILo4QGIB9gHfvFskGfKjbh+hNyiFvf8=;
        b=Dr0tfo7UhjpMsa0aJD/5FVdaYyY+YT++Bp7q9S3C185bYLofVDWxDH5L8z2LQT0p+K
         jdfUXqTlCT9t5L2h826cJwxmh3AE5eIJ6k/royMtOl6fhRT3VN8g88bXz4+4R7kf4tm9
         pPy5lpnfilTim31QXyOnEK/+Ck8VpSPFmj4aTYjv93+K7NRKzkFw8wK8lKCPavu8yYSg
         DlSepovCu24JFMx/FqFCHQLdnljeqghdjhESr5F7G81JnBgIuAEtgfNJJJIZFyFnQxmk
         WaJxG4PQwnzl8H3OVYSv6vgabXlaNonqyX0u6UfvBkbg0mJAjx0BX2ZeGfOhu7kbaiCk
         2iEA==
X-Forwarded-Encrypted: i=1; AKwUvByNJ1yYQfNPpLULKvYPmFcGmZFQFeJUnIBWmHoN+c96n+iITR0ADoAb4hS/jZ5x3qJI+YIv8RcKOOc2@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3SiYW31s9xgBl6+xhpKZHS0iISzT3Urpp/ETdcEYABDj5uvq2
	euqmrSxkzlx0K6X4/q1NZ2kzdzy3ppGHlOV+OgcuKZTcegYUqAXHu3+t57YF+/+VoGw=
X-Gm-Gg: AYBFou1sm6ch7+O5QZ1kVUdYuSCDolxXD3YBU25KzmOXLbY+tRq8EbsF45TWTbK02++
	+SDYQns2lob8ZBkOfNb3i+3xcZ7AzbCsUKBTsDBe0pvn5ZcDQFTiNXTb4IsesssExIP1T/2aK+m
	in82+lyQQr6SyJTHHmZDT327QdkRi6r1YFRVpNqZzfZIh3rGQ/1h4kqzl3MzTgnsmVTVQNxkWu0
	zWQ7XyLTW2DrhgGblYT1qlh0AQO+wHgUZvVP0DVK2jTRkIqvCDs4TveeDszX85VtexSvAw4LIa/
	ZpvAGoiULqnFcSnXdQY82m0cjMfsCJ3djK/Mg5WQ9WcGlKPUD4VLEvHQS71RmKkzLSmn7IWQm7h
	Kuta0bK99Nl5jlB9eXapdcrPDaDsjMyd7V+6d2ktv16ugFCOimNInutO1G5vC6zR8Hfiq3t84wM
	c2de9N66Ka/4ssQh/QxzO0z5+gh6g/cjjniNLdjjsQYsYHIjyG3EC62F9f/lqxUHnq8Fg1eqCsS
	Q2d/IxyjROpyq6WGc0xv29FTn4ZF0UcQASj
X-Received: by 2002:a05:6102:f0e:b0:7b5:1ca4:9df1 with SMTP id ada2fe7eead31-7cc3672bd70mr1850893137.5.1792421801770;
        Mon, 19 Oct 2026 07:56:41 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc772ca218sm344003137.11.2026.10.19.07.56.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:56:40 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso439609241.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:56:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYe9SgmD6k+6ES/Zk6+gbbB7Ju8brfOlG8lNuphuz8O+Cwq6PJzpSiCbVniBic8PL3hqw1sy109iSH@vger.kernel.org
X-Received: by 2002:a05:6102:f86:b0:7cb:288a:b66d with SMTP id
 ada2fe7eead31-7cc369ac7b5mr1684195137.20.1792421799154; Mon, 19 Oct 2026
 07:56:39 -0700 (PDT)
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
 <20261019144256.GC763679@killaraus.ideasonboard.com>
In-Reply-To: <20261019144256.GC763679@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:56:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
X-Gm-Features: AclHuK9UZUEUyPMO3TO_vFhUiV57c9SStFUdXlV8TRdwkOQjKO9ySUhEkuMfo5c
Message-ID: <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
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

On Mon, 19 Oct 2026 at 16:42, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 16, 2026 at 05:55:40PM +0200, Geert Uytterhoeven wrote:
> > Prepare for mapping to other than fixed-rate clocks by adding a clk_hw
> > pointer to the clk_map structure, and populating it up-front.
> >
> > Move r8a78000_cpg_priv.fixed_hws into fill_clk_map(), as it is no longer
> > needed afterwards, and drop NUM_FIXED_CLKS.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > @@ -16,19 +16,24 @@
> >
> >  #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
> >
> > +struct clk_map_in {
>
> The "_in" suffix isn't very explicit.

I can add a comment...

> > +     int dt_id;              /* DT binding clock ID or -1 sentinel */
> > +     u32 fw_id;              /* FIXED_CLK() ID */
> > +};
> > +
> >  struct clk_map {
> >       int dt_id;              /* DT binding clock ID or -1 sentinel */
> >       u32 fw_id;              /* FIXED_CLK() ID */

BTW, do you think it would be worthwhile to reuse clk_map_in here?

> > +     struct clk_hw *hw;
> >  };

> > @@ -92,35 +94,69 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
> >       return hw;
> >  }
> >
> > -static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
> > +static struct clk_hw **register_fixed_clks(struct device *dev)
> >  {
> > -     struct device *dev = priv->dev;
> > +     unsigned int n = ARRAY_SIZE(fixed_clk_rates);
> > +     struct clk_hw **hws, *hw;
> >       unsigned long rate;
> > -     struct clk_hw *hw;
> >       const char *name;
> >
> > -     for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
> > +     hws = devm_kcalloc(dev, n, sizeof(*hws), GFP_KERNEL);
> > +     if (!hws)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     for (unsigned int i = 0; i < n; i++) {
> >               rate = fixed_clk_rates[i];
> >               name = devm_kasprintf(dev, GFP_KERNEL, "cpg-%lu", rate);
> >               if (!name)
> > -                     return -ENOMEM;
> > +                     return ERR_PTR(-ENOMEM);
> >
> >               hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
> >               if (IS_ERR(hw))
> > -                     return PTR_ERR(hw);
> > +                     return ERR_CAST(hw);
> >
> > -             priv->fixed_hws[i] = hw;
> > +             hws[i] = hw;
> >       }
> >
> > -     return 0;
> > +     return hws;
> > +}
> > +
> > +static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
> > +                                       const struct clk_map_in *map_in)
> > +{
> > +     struct device *dev = priv->dev;
> > +     struct clk_hw **fixed_hws;
> > +     struct clk_map *map;
> > +     unsigned int i;
> > +
> > +     fixed_hws = register_fixed_clks(dev);
> > +     if (IS_ERR(fixed_hws))
> > +             return ERR_CAST(fixed_hws);
> > +
> > +     for (i = 0; map_in[i].dt_id >= 0; i++) { }
>
> This is avoidable by passing { map, ARRAY_SIZE(map) } as match data
> instead of just the map.

True, and I did consider this.
The same mechanism is used in the MDLC driver, where using ARRAY_SIZE()
would quickly became a bigger burden due to the presence of many
more maps.  So for consistency, I kept it the same in both drivers.
An initialization macro might make it more manageable, though.

> > +
> > +     map = devm_kcalloc(dev, i + 1, sizeof(*map), GFP_KERNEL);
> > +     if (!map)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     for (i = 0; ; i++) {
> > +             map[i].dt_id = map_in[i].dt_id;
> > +             if (map[i].dt_id < 0)
> > +                     break;
> > +
> > +             map[i].fw_id = map_in[i].fw_id;
> > +             map[i].hw = fixed_hws[map[i].fw_id];
> > +     }
> > +
> > +     devm_kfree(dev, fixed_hws);
>
> Why not plain kcalloc/kfree ?

To avoid having to free it manually at multiple (three) locations,
both in the error paths and the success path?

>
> > +     return map;
> >  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
