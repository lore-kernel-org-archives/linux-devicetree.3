Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD9A3D16F1
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690705; cv=none; b=Xj0ElYWJqjKEmetY2EY3vdphL0wFwdHmCaDpmceKNRELw28vtAmv9yrAso9gySWmsvWS8XT3b+nXSjest/Bo8Gq1QaBfFLXrF901TrK7xEzQrM/DSpzqd5jI1zdP+9TgE8ENPzZpXrqBRL+1tzKm32VZ2177pgdG7dg75LmA/1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690705; c=relaxed/simple;
	bh=05HtEekKnLhODQoM/NJU1MleMJk27P+YZTUKE2RwX2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tiG0N3r4MZBxH7Zp4K6sy/puox58K0Cl1UmJky957xQopgU4ET30jx4TjZa4181LzvqE/lb2d4wFf1m/L0k/3IQTFOjfLENFx+EG3j/mtvCuh62lq4i+vw08ZhF7Xxvnbqsqox4MAS2QbAmOsbvEUdRm5rFcFB9H4Uqwc6K3X9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59d07df448bso3942446e0c.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690701; x=1782295501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/+25ljVbrV0cFHF02tOeYF6TAhfGn2KQZp2f/CD5R4=;
        b=VQcVKjlVimzENO3JO9z7d5saZBuuMpmAmpSIdeLz/3mJBYBXTsrPv4pBkCjaPwAf/Q
         wgEyK39ajMeTlgwSVFeO3iEvGJ93L6orVNfFZKR/VdzWUg7DzkLpdIkMbDXszgqpW9Jx
         o6gfGKDv0QtV7FD7zkeKtptx28OEsqxT/+dgMiKKLfrowr92eSGFUEtvm0bZGbxLoUE7
         SJtY8oOqavEhl7I9Sk40f9P9F+kwDOtisgbYArtzSr0hagHrTeeKEKwWORNughqdgbNt
         ZrpvelxGQyUyLz1aYP0agw9TIltAisBrDDwxj6TAkhFa6yAZU1cPUUFOii9kM2nZ+fUS
         981A==
X-Forwarded-Encrypted: i=1; AFNElJ9atIom1Bj8/X35o4kF5zgJOp7yZbED4vi8RFvQxbK5NsScEVIe9EhNjIWEOw6ZM7Ygz4nQHnax/OLb@vger.kernel.org
X-Gm-Message-State: AOJu0Yysya6lJnYLGbUH4D6q22bH55XzA7CtCxxwKGMsurfnvjGKzL3x
	Jn6lh6wfEgsOmRi2jsqzaIEGcoK2hVCIRcnl1wqwTLrvFK7DCv6qw8Ingk+NNsDd
X-Gm-Gg: Acq92OEjcsw7sBHvrU5H6wgsaN+ousrkz1KusqmB2HH1isX47+EDyxRJxRgUPdnBQ68
	zUqnJODXCdv6ZXtZYKTj0EBEqa6PTnVZcbuuKLdZSA0mK7fJoWbVbFLH7m9xxhlOF4tvjecaNIg
	VkGtUsSOg8aWAr6xWQNcmhEcNGd/n9y9yVCtz8I84mInrLCyYMEE5BLS0imWkbREdH8CI4sCN/W
	fhMoPF9FjRjU+KDUnu7nyXwVZxT3jXWNQAVKeAnvwmBMHH4pTOnPDXhN9qH4AwXHNRpgAVq7Ics
	BbK8HYL480Q3n9le9zAzmmTEExAnGHcoElZbVOaBach70kfRX4X0LCxO4FC8NO3V8kRKJzEtUka
	J+rmtbRsVCMMFRYwjStsAAz3XVMXUoUAklz8CE8e2LFP/i+avPpp07s0ck107jUTlSKJ/EjtPFY
	lAImM4rOWp3emKp3HEaTcfYaza+sNOY1VYCZsWIEar8urc9mTfDA==
X-Received: by 2002:a05:6102:38c9:b0:6c5:d55d:c093 with SMTP id ada2fe7eead31-7245d31e66dmr1945802137.8.1781690701259;
        Wed, 17 Jun 2026 03:05:01 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966ceca5f6fsm2436587241.1.2026.06.17.03.05.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:05:00 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-725cf9a923aso349855137.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:05:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9YIpBt8BckmS/0grCg9kMkEFYO2/CbleXFT0SdbLpTdQI+fiZEljDN6WMl6QglHBVxBuBHaoLbcuvg@vger.kernel.org
X-Received: by 2002:a05:6102:1513:b0:71e:39e9:ce5a with SMTP id
 ada2fe7eead31-7246d11266fmr1475284137.26.1781690700505; Wed, 17 Jun 2026
 03:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:04:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVN7dfF6bah0Ca=G-uHZwJ7JDyQb5NoE59PPfAuXp+mHg@mail.gmail.com>
X-Gm-Features: AVVi8CfvzgARP_H_QUsETrMu4OFV4lGTR_oJF8-LhQSQALrUoXJKUkxdtqOFv-s
Message-ID: <CAMuHMdVN7dfF6bah0Ca=G-uHZwJ7JDyQb5NoE59PPfAuXp+mHg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] clk: renesas: rzv2h-cpg: Extract PLL calculation
 math into a library
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Move the common PLL and divider parameter calculation logic from the
> core rzv2h-cpg driver into a standalone library file.
>
> Introduce the CLK_RZV2H_CPG_LIB Kconfig configuration symbol and create
> rzv2h-cpg-lib.c to house rzv2h_cpg_get_pll_pars() and
> rzv2h_cpg_get_pll_divs_pars().
>
> Keep rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars() in the original
> driver as wrappers that call into the new library helper endpoints.
> These wrappers are maintained for this cycle because they are actively
> referenced by the DSI driver; they will be safely removed in a subsequent
> cycle once the DSI driver is updated to use the new APIs from the library,
> preventing cross-subsystem build breakages.
>
> This restructuring allows other Renesas SoC clock drivers, such as the
> upcoming RZ/T2H and RZ/N2H platforms that utilize similar LCDC clock
> divider mathematical logic, to share the iterative calculation helper
> infrastructure without duplication.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -213,4 +213,27 @@ static inline bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits
>  }
>  #endif
>
> +#ifdef CONFIG_CLK_RZV2H_CPG_LIB
> +bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
> +                           struct rzv2h_pll_pars *pars, u64 freq_millihz);
> +
> +bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> +                                struct rzv2h_pll_div_pars *pars,
> +                                const u8 *table, u8 table_size, u64 freq_millihz);
> +#else
> +static inline bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
> +                                         struct rzv2h_pll_pars *pars,
> +                                         u64 freq_millihz)
> +{
> +       return false;
> +}
> +
> +static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> +                                              struct rzv2h_pll_div_pars *pars,
> +                                              const u8 *table, u8 table_size,
> +                                              u64 freq_millihz)
> +{
> +       return false;
> +}
> +#endif
>  #endif

What about just dropping the old functions, and adding two simple
compatibility defines in the header file:

    #define rzv2h_get_pll_pars rzv2h_cpg_get_pll_pars
    #define rzv2h_get_pll_divs_pars rzv2h_cpg_get_pll_divs_pars

That way there is less code to change in the next phase.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
