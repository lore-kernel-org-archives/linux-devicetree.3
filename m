Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA71D3B4E8C
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641104; cv=none; b=cm8wa0JpGvpYdNXxXrcgiV0h029Dlh/cgqPrGL4xGHsvTgEsM5QKR/TUyfkRD2yvRiO4U+Eh8+6FBZC7gCGd38xgYjZu7hTl/lNunGBieEwSQrV0up4CadkHT1tzGLZTnEupNf6o+1fMulTXsr60YIbwRbpAMjAvcBZL5VqhNX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641104; c=relaxed/simple;
	bh=W4ocsbAken2i1Z0tr+aaOqS3kOkoeXQXKr5uS8XVQrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=trfZW3Op6gpiIHBVkxJBhnWch+kr7uUcWdB9FXZG7M0a8TePvB/du2n+cB4JcMPo2PCzoEJ1KZ34balQ15H0wpf3d8EUvXG4y7zdnvLOqVCN5BoiI1whvpnTkoVG51KuHseW2uZ4d8g/bZFZW0TGjz+m9lS0OdeuVuE69Gav3oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56d85881a68so2176147e0c.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641101; x=1776245901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENmHKB8IOhUHnCXPKR1y0jyIBHSgRsTMWLYy39EVq6U=;
        b=fGHrIpd3LCNY/QuQ8rz3cFx/AfHljS6t2WGl44ovDhLb2RsC50AHhQENpL1lk4Fgj8
         WnGnluvgT5FZ3nKmxeUDcImf5wMb1ylbniWhdAiAYXy/NNPERVf7L3kaWBamQCCJDucc
         6jQVEmzb5WF9n20s9NAp4FFs4u8W7nIzfaZu/fLSWi6qMnVpYSvR3YmKAWykQq5zRNry
         tZlR/O289ctxG8iiFYmf9Pv9klklaAELar9iV8DIA+SYG4ZgYpAAkxlgFs06/JwfB2EY
         u35gMJguUpqrZYRaAory6iZ63YmSCXbld2N/9U6kTAClVfxDvZcgTwhTYMKRwIJZciOS
         1Ivg==
X-Forwarded-Encrypted: i=1; AJvYcCV0blH7We1P+lxb1WlMmcBynruCODb+YZnoecpMC9GkpeyKFSfSIXJ6wezn7JR8eJGYiOcu5E/txx+Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyLnwlS1SBn/59GbFYQlQ+ogmtrAvP6SMCKbQWxaR4wVSTk0/JD
	mrNGUrrNoCDbQ+q6PRIwlOkqdqNamO6lJIcVgYdInIcSaX2BVvyJjC07MIaGpV/w
X-Gm-Gg: AeBDiesMF5TF5pV3BJQW05FaDUPfuY3RP2OT2/vEdS/SOR02n6b6ruadcdeJEB1NtHZ
	0OPtqF2zbxVQ/7Ih9thskYh2fHpi16vYTOXSLUMamgOB3iaCmY4cTvrCXX/8GoubSrUlUvPkvPL
	Go5zOT3XqFWj+UjbdofuiUGnUVOzamb9tKhi/79HVNLE8jjCGIcX2jDtCsjbgLCuWepOtqeXDW8
	hxt0wI8T+IFj1irwoghCobm2wG+FxospRnSvMgoeoNdR0Bm8BTkgjhPH5kbcVrd2pQuj4xiJUWx
	d2RgNi0PjFNryQPXL2mIPhiegJyS3m7ulFrmrlgL33q3OB2OZU1VOyhvxCudL9v9fj87rZjOyR7
	sUfGJ/PMFEMTsrLFbx5522HbIYlGo7xNubZxBAsBBq+C8WUnnBEqT4qp3IzGcWkVHdlvtTxF+y+
	EPCbY7s1g/NxPCEGx7hiYUVE0IUli38FXdpP60kcbF5eX1J9iWFZYozElnM2vD
X-Received: by 2002:a05:6122:4891:b0:56d:9e98:4676 with SMTP id 71dfb90a1353d-56daba1f4famr7962761e0c.13.1775641100843;
        Wed, 08 Apr 2026 02:38:20 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bce02f3sm19604573e0c.14.2026.04.08.02.38.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:38:20 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-604fb44270aso2035690137.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:38:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTFWKr40AqzzKz54oeA4gkL9W/25lHFkUxXKel6DPilL+WNC+LX6OReyVeKMPbRy5gIIFM3EvH6PGD@vger.kernel.org
X-Received: by 2002:a05:6102:f9a:b0:5df:8f4:61e6 with SMTP id
 ada2fe7eead31-605a50dbbb6mr7039796137.32.1775641100526; Wed, 08 Apr 2026
 02:38:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402090524.9137-1-john.madieu.xa@bp.renesas.com> <20260402090524.9137-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260402090524.9137-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 11:38:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+a7cXRY=yEmXQW9=rYnyMCifhZs+je8LDHL6r=mBDMw@mail.gmail.com>
X-Gm-Features: AQROBzBW_0NoE-RyS2BqqQAlrdl0pZXBq89zZ06PmjJcnH1QXimxqhe4p2F4Ftk
Message-ID: <CAMuHMdU+a7cXRY=yEmXQW9=rYnyMCifhZs+je8LDHL6r=mBDMw@mail.gmail.com>
Subject: Re: [PATCH v2 02/24] clk: renesas: r9a09g047: Add audio clock and
 reset support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Thomas Gleixner <tglx@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	John Madieu <john.madieu@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Thu, 2 Apr 2026 at 11:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add clock and reset entries for audio-related modules on the RZ/G3E SoC.
>
> Target modules are:
>  - SSIU (Serial Sound Interface Unit) with SSI ch0-ch9
>  - SCU (Sampling Rate Converter Unit) with SRC ch0-ch9, DVC ch0-ch1,
>    CTU/MIX ch0-ch1
>  - ADMAC (Audio DMA Controller)
>  - ADG (Audio Clock Generator) with divider input clocks and audio
>    master clock outputs
>
> While at it, reorder plldty_div16 to group it with other plldty fixed
> dividers.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c

> @@ -460,6 +483,96 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
>                                                 BUS_MSTOP(2, BIT(15))),
> +       DEF_MOD("ssif_clk",                     CLK_PLLCLN_DIV8, 15, 5, 7, 21,

Please preserve sort order (by _onindex, _onbit);

> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("scu_clk",                      CLK_PLLCLN_DIV8, 15, 6, 7, 22,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("scu_clkx2",                    CLK_PLLCLN_DIV4, 15, 7, 7, 23,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("admac_clk",                    CLK_PLLCLN_DIV8, 15, 8, 7, 24,
> +                                               BUS_MSTOP(2, BIT(5))),
> +       DEF_MOD("adg_clks1",                    CLK_PLLCLN_DIV8, 15, 9, 7, 25,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_clk_200m",                 CLK_PLLCLN_DIV8, 15, 10, 7, 26,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_audio_clka",               CLK_AUDIO_CLKA, 15, 11, 7, 27,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_audio_clkb",               CLK_AUDIO_CLKB, 15, 12, 7, 28,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_audio_clkc",               CLK_AUDIO_CLKC, 15, 13, 7, 29,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi0_clk",                 CLK_PLLCLN_DIV8, 22, 0, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi1_clk",                 CLK_PLLCLN_DIV8, 22, 1, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi2_clk",                 CLK_PLLCLN_DIV8, 22, 2, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi3_clk",                 CLK_PLLCLN_DIV8, 22, 3, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi4_clk",                 CLK_PLLCLN_DIV8, 22, 4, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi5_clk",                 CLK_PLLCLN_DIV8, 22, 5, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi6_clk",                 CLK_PLLCLN_DIV8, 22, 6, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi7_clk",                 CLK_PLLCLN_DIV8, 22, 7, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi8_clk",                 CLK_PLLCLN_DIV8, 22, 8, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi9_clk",                 CLK_PLLCLN_DIV8, 22, 9, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("dvc0_clk",                     CLK_PLLCLN_DIV8, 23, 0, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("dvc1_clk",                     CLK_PLLCLN_DIV8, 23, 1, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("ctu0_mix0_clk",                CLK_PLLCLN_DIV8, 23, 2, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("ctu1_mix1_clk",                CLK_PLLCLN_DIV8, 23, 3, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src0_clk",                     CLK_PLLCLN_DIV8, 23, 4, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src1_clk",                     CLK_PLLCLN_DIV8, 23, 5, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src2_clk",                     CLK_PLLCLN_DIV8, 23, 6, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src3_clk",                     CLK_PLLCLN_DIV8, 23, 7, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src4_clk",                     CLK_PLLCLN_DIV8, 23, 8, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src5_clk",                     CLK_PLLCLN_DIV8, 23, 9, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src6_clk",                     CLK_PLLCLN_DIV8, 23, 10, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src7_clk",                     CLK_PLLCLN_DIV8, 23, 11, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src8_clk",                     CLK_PLLCLN_DIV8, 23, 12, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src9_clk",                     CLK_PLLCLN_DIV8, 23, 13, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("scu_supply_clk",               CLK_PLLCLN_DIV8, 23, 14, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("ssif_supply_clk",              CLK_PLLCLN_DIV8, 24, 0, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi0_clk",                     CLK_PLLCLN_DIV8, 24, 1, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi1_clk",                     CLK_PLLCLN_DIV8, 24, 2, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi2_clk",                     CLK_PLLCLN_DIV8, 24, 3, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi3_clk",                     CLK_PLLCLN_DIV8, 24, 4, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi4_clk",                     CLK_PLLCLN_DIV8, 24, 5, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi5_clk",                     CLK_PLLCLN_DIV8, 24, 6, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi6_clk",                     CLK_PLLCLN_DIV8, 24, 7, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi7_clk",                     CLK_PLLCLN_DIV8, 24, 8, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi8_clk",                     CLK_PLLCLN_DIV8, 24, 9, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi9_clk",                     CLK_PLLCLN_DIV8, 24, 10, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
>  };
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
