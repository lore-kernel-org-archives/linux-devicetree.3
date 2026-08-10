Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2833E558C
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376102; cv=none; b=fCsVaiFmijbnj1yYp6QUxo14IvGrN86Z5xU4Zk3puA6/znc55O1taXUBlDwIO5xYMuNM9aikfjg8sZE2czrJUz+s8uXWAvTmHALxRYXs9sL4rEBMuV3H4iMzoXnVC6xoAzRfJ0A4AbgTSqJhvIThr3+jphPHIY0i4rAcDkqIC3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376102; c=relaxed/simple;
	bh=v2X/qFTKhEWl9w9+03oXecpIVvhrFrzjOCau2uvjiek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeLCTepqP+AKYuOrE4/G5jfupwssagjV8jlD0JFitPfkXiUZqrxux7M4zYJTRy5RPaxyfGCdEZ2LDH/xmnC9XcMiEbfy9NL8nJKs61HTnXBYwlCk2VbSBHRZdIb3vFJ5PBNgCkNL3Bh8bIll/Kpla+4BcCdEqHrO8ZzmReksj3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8f256eaedf8so18886046d6.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376099; x=1786980899;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uWDR9skH5cx/JxnFLoh56vDW6LJ+vetkUcp06X/F6BE=;
        b=rIw6iyOpQdnbxNbYiIfAeK/lAaXxSxw/9rPMAvhEOfHYbdwuCVLwOm+Rj+noHs2Xdg
         oc3awoFaFyBPeXLR4jFvYjetSoseU/86YO5FnP0YW1F7OlvmzyhjrCwEyMpYjs30z2FR
         O13weLo/yfqkQhdysEi0obq3Oeu1DUNbeOCBbWU0OdrpSNpwBBQKQ/3h9yZxtGLLTg/r
         qFjf7g9j/8lesPQfX4doegZK+fAsE0NPQxerUVVQoL4zsZR7dkFfIQoFA98YkdNvJpg2
         3qmbSK5rT9GcO29JLi4m0izOBM/qZTh94oUrnHUeTMUKsf1p5SP9OLn51EQlGyw3TOnN
         60aA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9F5xSsgt1RPNQp+50zCmsjn96lm9LbWoWaKpyB1q6PldjCAVvCpBOYJwcZS0SpnfYpnW+2mi1qANT@vger.kernel.org
X-Gm-Message-State: AOJu0YyOCiPvNVU8dW/kXgZhl/ADzxhcI2469wLvIbe+OwdwtCy+zo11
	FGwIE89mU7ZBwg9oV2in0RXg/o4wkGyw5pEuvwCtuusIG2KZhGKGUlHDftHDZ3ew
X-Gm-Gg: AR+sD13+ZT1fmNnv4/3Yii26JbmJI2yfplBQYmv4qJqqMKBgEE/k4GUFEN6waU+EPH6
	AqpZmU/7rvmLK+x4+/RRAljIchbT4AqtLLKtqZgpALjtHzHjbBOeiX+JvyVGPjsKiCNXIsiUfQF
	5wEZROlPiwq1Gg5YggYVtMLcQZ11uCz0yK3yXC4H9SQYsTpo88gYmiRpHtv1KqO8ggSjXHUngit
	Dtv6exrio47hsFfcs/lLA/FTamKgGVzxRyVCQ7IsMXuXzbwhx0FKJ23FGvafXNniZ6vsSNi2xLD
	EknpNMRFr8yFs809OnBPwZm4tjobbKNO9jzgNdxDIiNyO+k8NLvcc3I/c11sn7bNxbiLciqAFbo
	w7dN8HXWGF6Se0/HEGt/RY2kM2XLzeC3BJxLjm2LY/uK3eYyhR3TwhudPZqIgcjbZD0vSmzxSEg
	ZCE7xPMT/5oQ2xI6so4wIIomhrRFQOHOECKI3mFU0/DOHtylW8ld3HpMxHYjvQae6L+YQu3A66T
	Xv/d1WxYpxsNicmehCnQ5yxFagk9EeJdhnyn8cN3Q==
X-Received: by 2002:a05:620a:a713:b0:934:7ffc:7f90 with SMTP id af79cd13be357-9367991a162mr1925988085a.36.1786376098502;
        Mon, 10 Aug 2026 08:34:58 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e03ae96sm804533185a.8.2026.08.10.08.34.58
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 08:34:58 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e5d6f35c1so163867685a.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:34:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoPdmCjdIZvs4ppx6SbzmFE+jaAIitLumiRP0Tjy91pvUC4GM5pp6T2G5jbKTaBGtiD7V4lgr6X/XFC@vger.kernel.org
X-Received: by 2002:a05:6102:41a3:b0:739:626d:4473 with SMTP id
 ada2fe7eead31-764e1236bf4mr4640136137.0.1786375757471; Mon, 10 Aug 2026
 08:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260716123434.2576253-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260716123434.2576253-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 17:29:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEm4yjOH0ziVR3CVDsDJDyJWE7K3GNQpCEiWW5bxaJNw@mail.gmail.com>
X-Gm-Features: AUfX_mxfmVTB6woxgoCnGx3pPeCPHCjtZ4q0ym9LciGln7n8cSU0E7kTq7doZmc
Message-ID: <CAMuHMdWEm4yjOH0ziVR3CVDsDJDyJWE7K3GNQpCEiWW5bxaJNw@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] clk: renesas: r9a09g077: Register SYSC regmap
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 16 Jul 2026 at 14:34, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Register a syscon regmap for the System Controller (SYSC) integrated into
> the RZ/T2H and RZ/N2H CPG block.
>
> Unlike traditional Renesas CPG/MSSR implementations, the RZ/T2H and RZ/N2H
> CPG block also integrates the SYSC, which provides low-power management,
> clock monitoring, write protection and peripheral configuration registers
> shared by multiple drivers.
>
> Implement the RZ/T2H-specific .post_init() callback to create and register
> a syscon regmap covering the SYSC register space using the CPG device node.
> For backward compatibility, return without registering the regmap when the
> mapped resources correspond to older Device Trees that expose only the
> legacy 64 KiB CPG register window.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Dropped dangerous registers from writeable_readable list.
> - Renamed sysc_init to post_init and updated signature to take
>   cpg_mssr_pub struct.
> - Created a single regmap covering both SYSC register regions
>   instead of two separate regmaps.
> - Updated commit message

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> @@ -87,6 +90,19 @@ MODULE_IMPORT_NS("RZV2H_CPG");
>  #define CPG_PLL_MON(x)         ((x) - 0x10)
>  #define CPG_PLL_MON_LOCK       BIT(0)
>
> +#define RZT2H_SYSC_SIZE                        0x20000

This is the size of the two SYSC regions combined (more below).

> +#define RZT2H_SYSC_OFFSET              0x10000
> +#define RZT2H_SYSC_BLOCK_MASK          BIT(16)
> +#define RZT2H_SYSC_OFFSET_MASK         GENMASK(15, 0)
> +#define RZT2H_SYSC_BLOCK(x)            FIELD_GET(RZT2H_SYSC_BLOCK_MASK, x)
> +#define RZT2H_SYSC_REG_OFFSET(x)       FIELD_GET(RZT2H_SYSC_OFFSET_MASK, x)
> +#define RZT2H_SYSC_BASE(b0, b1, x)     (RZT2H_SYSC_BLOCK(x) ? (b1) : (b0))

Passing the two bases looks a bit ugly to me...

> +
> +struct r9a09g077_sysc_reg {
> +       void __iomem *base0;
> +       void __iomem *base1;

What about combining them into an array?

    void __iomem base[2];

The you can do

    void __iomem *base = sysc->base[RZT2H_SYSC_BLOCK(reg)];

below?

> +};
> +
>  enum rzt2h_clk_types {
>         CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,   /* Clock with divider */
>         CLK_TYPE_RZT2H_MUX,                     /* Clock with clock source selector */
> @@ -875,6 +891,118 @@ r9a09g077_cpg_clk_register(struct device *dev, const struct cpg_core_clk *core,
>         }
>  }
>
> +static int r9a09g077_regmap_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +       struct r9a09g077_sysc_reg *sysc = context;
> +       void __iomem *base = RZT2H_SYSC_BASE(sysc->base0, sysc->base1, reg);
> +
> +       *val = readl(base + RZT2H_SYSC_REG_OFFSET(reg));
> +
> +       return 0;
> +}

> +static bool r9a09g077_writeable_readable_sysc0(struct device *dev, unsigned int reg)
> +{
> +       switch (reg) {
> +       /* ELOPA/B and GTIOCSEL */
> +       case 0x0000 ... 0x0008:
> +       /* Encoder config */
> +       case 0x1000 ... 0x1164:
> +       /* PCIe config */
> +       case 0x2000 ... 0x2024:
> +       case 0x2030 ... 0x2054:
> +       case 0x2060:
> +       /* xSPI config */
> +       case 0x3000 ... 0x300C:
> +       case 0x3100 ... 0x310C:
> +       /* MD_MON */
> +       case 0x4100:
> +       /* PRCRN */
> +       case 0x4200:
> +               return true;
> +
> +       default:
> +               return false;
> +       }
> +}
> +
> +static bool r9a09g077_writeable_readable_sysc1(struct device *dev, unsigned int reg)
> +{
> +       switch (reg) {
> +       /* WDTDCRm */
> +       case 0x5100 ... 0x5114:
> +       /* PRCRS */
> +       case 0x6000:
> +               return true;
> +
> +       default:
> +               return false;
> +       }
> +}
> +
> +static bool r9a09g077_writeable_readable_sysc(struct device *dev, unsigned int reg)
> +{
> +       if (RZT2H_SYSC_BLOCK(reg))
> +               return r9a09g077_writeable_readable_sysc1(dev, RZT2H_SYSC_REG_OFFSET(reg));
> +
> +       return r9a09g077_writeable_readable_sysc0(dev, RZT2H_SYSC_REG_OFFSET(reg));

I like symmetry, though ;-)

IMO the separate sysc0 and sysc1 functions don't add much value.
What about:

    offset = RZT2H_SYSC_REG_OFFSET(reg);
    switch (RZT2H_SYSC_BLOCK(reg)) {
    case 0:
            switch (offset) {
                    ...
            }

    case 1:
            switch (offset) {
                    ...
            }
    }

    return false;

> +}
> +
> +static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
> +{
> +       struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
> +       struct r9a09g077_sysc_reg *sysc_reg;
> +       struct regmap *regmap;
> +
> +       /*
> +        * Return early if the SYSC sizes are not as expected for backwards
> +        * compatibility with older device trees.
> +        */
> +       if (pub->size0 != RZT2H_SYSC_SIZE || pub->size1 != RZT2H_SYSC_SIZE)

While RZT2H_SYSC_SIZE is the correct value to use here, it is not
correct from a semantic point of view.

> +               return 0;
> +
> +       if (!regmap_cfg)
> +               return -ENOMEM;
> +
> +       sysc_reg = devm_kzalloc(dev, sizeof(*sysc_reg), GFP_KERNEL);
> +       if (!sysc_reg)
> +               return -ENOMEM;
> +
> +       /* Only allow access in the SYSC regions */
> +       sysc_reg->base0 = pub->base0 + RZT2H_SYSC_OFFSET;
> +       sysc_reg->base1 = pub->base1 + RZT2H_SYSC_OFFSET;
> +
> +       regmap_cfg->name = "rzt2h_sysc";
> +       regmap_cfg->reg_bits = 32;
> +       regmap_cfg->reg_stride = 4;
> +       regmap_cfg->val_bits = 32;
> +       regmap_cfg->fast_io = true;
> +       regmap_cfg->max_register = RZT2H_SYSC_SIZE - 1;

This is the size of the two blocks combined.

> +       regmap_cfg->readable_reg = r9a09g077_writeable_readable_sysc;
> +       regmap_cfg->writeable_reg = r9a09g077_writeable_readable_sysc;
> +
> +       regmap = devm_regmap_init(dev, &r9a09g077_sys_regmap_bus, sysc_reg, regmap_cfg);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       return of_syscon_register_regmap(dev->of_node, regmap);
> +}
> +
>  const struct cpg_mssr_info r9a09g077_cpg_mssr_info = {
>         /* Core Clocks */
>         .core_clks = r9a09g077_core_clks,
> @@ -889,4 +1017,6 @@ const struct cpg_mssr_info r9a09g077_cpg_mssr_info = {
>
>         .reg_layout = CLK_REG_LAYOUT_RZ_T2H,
>         .cpg_clk_register = r9a09g077_cpg_clk_register,
> +
> +       .post_init = r9a09g077_post_init,
>  };
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
> index 80f4403ea2ba..2987c34f2ba2 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -1267,6 +1267,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
>  {
>         struct cpg_mssr_priv *priv;
>         unsigned int nclks, i;
> +       struct resource res;
>         int error;
>
>         if (info->init) {
> @@ -1285,13 +1286,23 @@ static int __init cpg_mssr_common_init(struct device *dev,
>         priv->dev = dev;
>         spin_lock_init(&priv->pub.rmw_lock);
>
> -       priv->pub.base0 = of_iomap(np, 0);
> +       error = of_address_to_resource(np, 0, &res);
> +       if (error)
> +               return error;
> +
> +       priv->pub.size0 = resource_size(&res);
> +       priv->pub.base0 = ioremap(res.start, priv->pub.size0);
>         if (!priv->pub.base0) {
>                 error = -ENOMEM;
>                 goto out_err;
>         }
>         if (info->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
> -               priv->pub.base1 = of_iomap(np, 1);
> +               error = of_address_to_resource(np, 1, &res);
> +               if (error)
> +                       goto out_err;
> +
> +               priv->pub.size1 = resource_size(&res);
> +               priv->pub.base1 = ioremap(res.start, priv->pub.size1);

Instead of complicating the code here, r9a09g077_post_init() might as
well call of_address_to_resource(dev->of_node) itself.

>                 if (!priv->pub.base1) {
>                         error = -ENOMEM;
>                         goto out_err;
> @@ -1414,6 +1425,9 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
>
>         error = cpg_mssr_reset_controller_register(priv);
>
> +       if (!error && info->post_init)
> +               error = info->post_init(priv->dev, &priv->pub);

No cleanup in case of error, so the regmap is considered optional, right?

> +
>  reserve_exit:
>         cpg_mssr_reserved_exit(priv);
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
