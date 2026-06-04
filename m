Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA542429827
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 11:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573740; cv=none; b=hguvwNPOTEcS1rVOpPqjrZTEoAsNTLSl1SSmb1LamPz68aD6lqXkEIsbfA2w2dPcPukbfbliOKszCh1H0C6kDp3TGYc+SJ17K7pqwbJ4+JgJ2NYZJyFIKk/thx/PokanKLL8RMa+PA1jw+Edeg6HmQlh9e/mowL4DA11ULHWC/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573740; c=relaxed/simple;
	bh=NFcn+5re6W8fOUpStLnoOpP08n3MpCoonlan2BCzqsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GFPor7BL82lUyHfX8VbQi3TcvN4WE+FSjjgTlBrI0S+YRvWEwnk/OJuvV44g8qaOnTJgQXn0HuPGoY3jw5tR/IMssNM20cA7CrXqrrHxFLbF+2op8ZCFWkUrASmKfdJkVtgSWn4WiHnljwjcEmNJFSP6deVQmDxJzSS/R1BMBCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-516d0db9372so4759741cf.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 04:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780573738; x=1781178538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SjEL3J1M6ssyuV3yx1NZqXFQtnLE7rLxALmfU/mPzo=;
        b=lmhlMXV+bFgdYrIXoXk2ZCpDw9OjFV586LJyuWYTo29JgvgddZa5Nhj1ScuinZSvWd
         tjhH5FhAt+s1oz0+e0Qss8pzCrV56HhmAJ2mvUydYgTqnrk5S8d2imd13uJ0CfT/RIph
         vOWUHY8NHCZphvqq09WWrIc7Ga5uB08Wg/WJijzpAY/oTY3GfhmhS06FllQNpYyjF0sv
         ywwSX7eOdM0/uULLaUoV5qtZVUsBGWV0CphFGN+yakxWMnCHC/TK0werr0tq3dqePNHG
         bTEiahb38rvgMxJpGHTqmkLZIwUW89E59qisCliTrfQWV2QqJ+sozwURWQLRODK1YhWa
         sYag==
X-Forwarded-Encrypted: i=1; AFNElJ/IMBtVY77/AM7O6oQ3BSVebJArjMVdx9DGhbnMqINokLX4mTWsdaiQnJt4QCyo/jvSkVYQWvfvvaeB@vger.kernel.org
X-Gm-Message-State: AOJu0YwSRRqVY/hd5akxsSxkMHfpgDTIVFXNbF5E0fQWYnRk43Y1bC+M
	ZkvX02vVov8bvDVTonXao5wJmlw4tJFkGvc/kqeUuu1J6jukG07KZM/XT9p6UcYzpCY=
X-Gm-Gg: Acq92OHnFBIfjRPR/HsPa0rrADOLDdiks9A/L7DaWi8VavusyIrZnfzZEbpnkyty6wM
	rycMz721rIys1mk2Fo4AkV+NWu0MN6anqLMo7VWFsqQFvthCt5WGhffKlJ3aTYaFtUlM6T0tIjE
	WrNhsvkk8DZkVC6zMDprPgi4qY1EF+tFzW3CaFU2WSGBni4ptVrkUm3kXcjYgzcMpja/8wtQBS7
	p8iO9ZkKMz2R8N7p215Nj2A/VbAGa4dSMD2MHM2Oa8ulaoRqI2+uJ40AEXfcNRcTZryVX0GLOFE
	JV9QkF/tNd/vI6MpMWkI8+hiuhO1U10g8D1co/zbIs34zSs/d8qOyO2jlcouMXSNEClKC9inCp0
	/JGtV6gzDK3LXrqay9tU4FGTSIsNG8a1xFbWncUvf/FCBPRcIz2Tv7GF9WTNSMzlOMEd5cOembm
	xEZWcjgDAu6NHhfAG3ItxygyP0sopwf0M3ZZeM4TCYAAX9zp0IoCbamFqynS1NXAnSTfKFlOF3E
	Mg=
X-Received: by 2002:a05:622a:313:b0:516:508b:bf4d with SMTP id d75a77b69052e-51778789b11mr113507961cf.56.1780573737917;
        Thu, 04 Jun 2026 04:48:57 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775d9efa1sm48759421cf.20.2026.06.04.04.48.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 04:48:57 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-915906a4becso72115185a.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 04:48:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ//5dJrGmGyPmXEXUvFLWUzkK/zGEoaUlVOTlC3hbZJxaY3RAFXM2bfczlNIqtACjBV2DMZzKzqL+Tt@vger.kernel.org
X-Received: by 2002:a05:6102:8017:b0:633:3040:ca5c with SMTP id
 ada2fe7eead31-6ec4cc6cc9fmr4288587137.30.1780573310828; Thu, 04 Jun 2026
 04:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 13:41:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVC_XtgRxJVjX6wnzMHYZeSGeqOmHsm4Tg6RJ0Tm=dX6w@mail.gmail.com>
X-Gm-Features: AVVi8Ccw5Ba_60Dzs2adNDvsycCaE2yjwE6AKvLwWxbsEZk5LA6wgR8624sRVIc
Message-ID: <CAMuHMdVC_XtgRxJVjX6wnzMHYZeSGeqOmHsm4Tg6RJ0Tm=dX6w@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: renesas: r9a09g047: Add audio clock and reset support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add clock and reset entries for audio-related modules on the RZ/G3E SoC.
>
> Target modules are:
>  - SSIU (Serial Sound Interface Unit) with SSI ch0-ch9
>  - SCU (Sampling Rate Converter Unit) with SRC ch0-ch9, DVC ch0-ch1,
>    CTU/MIX ch0-ch1
>  - DMACpp (Audio DMA Controller)
>  - ADG (Audio Clock Generator) with divider input clocks and audio
>    master clock outputs
>
> The ADG SSI clock outputs (adg_ssi[0-9]_clk) are parented on
> CLK_PLLCLN_DIV8 as a deliberate simplification: the ADG dynamically
> muxes each output between adg_0_clk_195m and audio_clk[a,b,c] at
> runtime via ADG_AUDIO_CLK_SEL{0,1,2}, owned by the rsnd-adg driver.
>
> While at it, reorder plldty_div16 to group it with the other plldty
> fixed dividers.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v4:
>  - Drop CLK_AUDIO_CLKA and its DEF_INPUT("audio_clka") entry, and
>    reparent adg_0_audio_clka on CLK_AUDIO_EXTAL, since AUDIO_CLKA is
>    provided by the existing AUDIO_EXTAL pin (Geert Uytterhoeven).
>  - Drop the internal core clocks Geert flagged as unused:
>    pllcm33_div4_ddiv2, pllcm33_div4_ddiv2_div2, pllcln_div32,
>    plldty_div2, plldty_div4 and cdiv5_mainosc. pllcln_div4 is kept,
>    as scu_0_clkx2 is parented on it.
>  - Rename the audio module clocks as suggested by Geert: ssif_clk ->
>    ssif_0_clk, scu_clk -> scu_0_clk, scu_clkx2 -> scu_0_clkx2,
>    admac_clk -> dmacpp_0_clk, adg_clks1 -> adg_0_clks1, adg_clk_200m
>    -> adg_0_clk_195m, adg_audio_clk{a,b,c} -> adg_0_audio_clk{a,b,c},
>    ssif_supply_clk -> ssiu_supply_clk. Update the target-module list
>    in the commit message (ADMAC -> DMACpp) to match.
>  - Rename the audio reset entries as suggested by Geert: SCU_RESET_SRU
>    -> SCU_0_RESET_SRU, ADMAC_ARESETN -> DMACpp_0_ARST,
>    ADG_RST_RESET_ADG -> ADG_0_RST_RESET_ADG.
>  - The adg_ssi[0-9]_clk parent is left unchanged as CLK_PLLCLN_DIV8.
>    Geert questioned whether this is correct, since these clocks are
>    ADG-generated. The parent is not changed; instead the commit
>    message now documents that the ADG muxes each output between
>    adg_0_clk_195m and audio_clk[a,b,c] at runtime via
>    ADG_AUDIO_CLK_SEL{0,1,2}, which no static parent can describe.

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c

> @@ -532,6 +538,96 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
>                                                 BUS_MSTOP(2, BIT(15))),
> +       DEF_MOD("ssif_0_clk",                   CLK_PLLCLN_DIV8, 15, 5, 7, 21,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),

I will reorder while applying, to preserve sort order (by _onindex/_onbit).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
