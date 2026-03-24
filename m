Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B731E3FCB38
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359461; cv=none; b=c9uxzk10ypzkI0JA94dqXr0o5lEyb2CtIFoQmSm4IITASkQXcnMwaei8Id4bkVHtyL1v/MrgLTY+GqNwSqOnUWr01mWVV1dUi2NL1HYxUP/vPkWRFJyFLbg/HGoeSZ1T2vdHuLG1tArM52en9P+6S0J6fXanadnxnsLxpvHiR7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359461; c=relaxed/simple;
	bh=jxD2923ET52CY8fhMQtErtaWu+053QLtVBSwzxbDk0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiPWW25t26vdRUFryKHkXHcxU5PVOLYThv05F2usEKGu6fTb3e4iaEWmaTjHY5rHVxujeVHmtus8k44bhzxyucYISaNNvvbtm18t1JwbxA6ndeYWc0NSEjLF4Ym7tsT+vTJMeBA64N43UFcaj6yVtuFWWEXBtXaFyYOOLB2CeHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-602a0648aa3so816846137.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359457; x=1774964257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFHE6SbqkfrINgqOev1LeMJP9y3Lb6YlEweE9fpbW9I=;
        b=JkDmi2L8LftUrRnPsaeV0S3Y1pL1J6MtuNnXC6+0Ld05gVGtNvo7cAxVGcN4z8eV7r
         8IA64NDahvsdKzI4c7Ym4ctQC8PeqHrlcWVUQglPIhP00kAtUrsVaWlYPwJla0Vh+gEZ
         1rgGdyJYtj1PrJzNpPBANX8WcFDgDsq8Swl63A8gOTnIgNDq4lLRRFdhApQZke1eGDtw
         ssWT0C2Dy2AWZD5x3gQN3Qe7h5hnYOKg3zFrytI7g5HUL2KLJAggwO7YAEZGwl3y52dk
         /lFBKMuHIIsv9N+kDdJxLuV8IANMJooF097b06GXXQs145yUNd3bJDBvmbbePMtqL8BA
         e1kA==
X-Forwarded-Encrypted: i=1; AJvYcCUPdRe7Y8lxy4Kn+10/B+q8AopzwdhVTuwBs6zqEbKI5JFtCrZt1u595/OXH5NscHbdAL5M62QFLjsJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw9wNzrNpKFueZ/QPq4AtL9g61yQdJ81VqwTd+JyEKKCEsqTXj
	UXZxKpTnjWMc90lfO00aTt6yaIK4CZZLB2I2sjL8IYTI/CSCZIhqZvw5o8QV4pntQYo=
X-Gm-Gg: ATEYQzzslRGK+AO5pwqYRTdMeeBHggQBCTkJggsVEOoXGV97yTSxZgHU88yOY2J6JKR
	537z6y6NyfVnz3gfPajge/jyDzEo37Nm1MfSS6ism7TROn/NQ21+j4MzdXJUmgsvOpp2PrXw86X
	j0gBI5/7vFjaOXqdK3a3wbkb0LQ0RL3wcsAC9GEIxHHySBaprEpEvJo9J0kX3N7wPTTngcKy99H
	UL/FxTnmIGwzKDlk5FNulcPYlBMzPaIi5J9uM4YXDRrf5S1FJRKN/c9RuFVrhOW8BwlSc9mq3Su
	s4nqXxKdLYBQtxdwdp921qKthBbJ9DTM/TV1NtLLLfQ5rrOhxoN7uVRsWjw120kiNiw6TXL4/xl
	plYfMUKzR/Xv39NZ8xMjWSW2QGOdxhlpSNtGswefyDFEVBLThVLFW68yiXm2tTauyMhtO7x2kpL
	ohom6B89ednaR4vhgKFrfk3D1EntbvtTUEf6qtRy50BRR0D7GlS6tofwRgIRtt6Q+x
X-Received: by 2002:a05:6102:c0c:b0:5f7:307e:80d9 with SMTP id ada2fe7eead31-602aed2cf6cmr7952075137.28.1774359457228;
        Tue, 24 Mar 2026 06:37:37 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95136c4e2a3sm12354493241.7.2026.03.24.06.37.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:37:36 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56cd842b60bso831786e0c.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:37:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9lR8ofAV4rfX1pxgbroigVZxjZmhI0XD0IgUbvymuUY8roxZMorGJnjrzWJlseZNhYUCGEuYqBRMu@vger.kernel.org
X-Received: by 2002:a05:6122:7d2:b0:56b:5893:d042 with SMTP id
 71dfb90a1353d-56cde498b94mr8236000e0c.12.1774359455206; Tue, 24 Mar 2026
 06:37:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com> <20260319155334.51278-13-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260319155334.51278-13-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 14:37:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9uvkcU789W+K38qxVTVQbFHGOaBgqNkj7SbTR8WShoA@mail.gmail.com>
X-Gm-Features: AQROBzBcCn1BnwXSbjTDtD6HtzQVV_AICC4S_yzN7SsVw9iP4uwy2_3tUoSu3Ao
Message-ID: <CAMuHMdW9uvkcU789W+K38qxVTVQbFHGOaBgqNkj7SbTR8WShoA@mail.gmail.com>
Subject: Re: [PATCH 12/22] ASoC: rsnd: Update SSI for RZ/G3E support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
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

On Thu, 19 Mar 2026 at 16:56, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add SSI support for the Renesas RZ/G3E SoC, which differs from earlier
> generations in several ways:
>
>  - The SSI block always operates in BUSIF mode; RZ/G3E does not implement
>    the SSITDR/SSIRDR registers used by R-Car Gen2/Gen3/Gen4 for direct SSI
>    DMA.
>    Consequently, all audio data must pass through BUSIF.
>  - Each SSI instance has its own reset line, exposed using per-SSI names
>    such as "ssi0", "ssi1", etc., rather than a single shared reset.
>
> To support these differences, update rsnd_ssi_use_busif() to always
> return 1 on RZ/G3E, ensuring that the driver consistently selects the
> BUSIF DMA path. Also update the reset acquisition logic to request the
> appropriate per-SSI reset controller based on the SSI instance name.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/rcar/ssi.c
> +++ b/sound/soc/renesas/rcar/ssi.c
> @@ -123,8 +123,15 @@ int rsnd_ssi_use_busif(struct rsnd_dai_stream *io)
>  {
>         struct rsnd_mod *mod = rsnd_io_to_mod_ssi(io);
>         struct rsnd_ssi *ssi = rsnd_mod_to_ssi(mod);
> +       struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
>         int use_busif = 0;
>
> +       /*
> +        * RZ/G3E does not support PIO mode. Always use BUSIF.
> +        */
> +       if (rsnd_flags_has(priv, RSND_SSI_ALWAYS_BUSIF))
> +               return 1;
> +
>         if (!rsnd_ssi_is_dma_mode(mod))
>                 return 0;
>
> @@ -865,6 +872,8 @@ static int rsnd_ssi_common_remove(struct rsnd_mod *mod,
>                 rsnd_flags_del(ssi, RSND_SSI_PROBED);
>         }
>
> +       rsnd_dma_detach(io, mod, &io->dma);

This goes BOOM on R-Car Gen3 and Gen4:

    Unable to handle kernel NULL pointer dereference at virtual
address 0000000000000004
    Mem abort info:
      ESR = 0x0000000096000004
      EC = 0x25: DABT (current EL), IL = 32 bits
      SET = 0, FnV = 0
      EA = 0, S1PTW = 0
      FSC = 0x04: level 0 translation fault
    Data abort info:
      ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
    [0000000000000004] user address but active_mm is swapper
    Internal error: Oops: 0000000096000004 [#1]  SMP
    CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
7.0.0-rc5-arm64-renesas-07233-g377893124b8a #3530 PREEMPT
    Hardware name: Renesas Gray Hawk Single board based on r8a779h0 (DT)
    pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : rsnd_dma_detach+0x10/0x20
    lr : rsnd_ssi_common_remove+0x48/0x74
    sp : ffff8000818ebac0
    x29: ffff8000818ebac0 x28: ffff000441c02938 x27: ffff0004408a8410
    x26: 000000000000000d x25: 0000000000000000 x24: ffff8000817b9970
    x23: 0000000000000000 x22: 000000000000000c x21: 00000000fffffdfb
    x20: ffff000441c02938 x19: ffff0004402bc080 x18: 00000000ffffffff
    x17: ffff000440ba6600 x16: ffff000440ba6a00 x15: ffff8000818eb700
    x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000030
    x11: 0101010101010101 x10: ffff800080fa7670 x9 : 1fffe00088052d21
    x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : feff636d746e722d
    x5 : 000000000000003c x4 : ffff800080a9dcc4 x3 : ffff0004402be800
    x2 : ffff000441c029b8 x1 : ffff000441c02938 x0 : 0000000000000000
    Call trace:
     rsnd_dma_detach+0x10/0x20 (P)
     rsnd_ssi_common_remove+0x48/0x74
     rsnd_probe+0x2d0/0x448
     platform_probe+0x58/0x90
     really_probe+0xb8/0x294
     __driver_probe_device+0x74/0x124
     driver_probe_device+0x3c/0x158
     __driver_attach+0xe0/0x1b4
     bus_for_each_dev+0x78/0xd4
     driver_attach+0x20/0x28
     bus_add_driver+0xe0/0x1e0
     driver_register+0x58/0x114
     __platform_driver_register+0x20/0x28
     rsnd_driver_init+0x18/0x20
     do_one_initcall+0x7c/0x184
     kernel_init_freeable+0x200/0x2e0
     kernel_init+0x20/0x1cc
     ret_from_fork+0x10/0x20
    Code: a9bf7bfd aa0003e1 910003fd f9400040 (b9400402)
    ---[ end trace 0000000000000000 ]---

> +
>         return 0;
>  }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
