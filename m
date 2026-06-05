Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB5E2C21F7
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666678; cv=none; b=aIVeWLZ9/Fro2M2kwmNTteRjnjHCJiK0O8n/BzrNuSki4MJAqp7Faq+4TBlZSWDZvE77dZuqONQ4LiohqFDGj3l+HopKTdJt057LdCr0SmRfdwmxAX+QR7ng661nnTztofNV8b3ib35RCmVKRyISPHe/aFfp7rKeMCVFCAc6RBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666678; c=relaxed/simple;
	bh=2aZEH0J2VU5XhjSzChfxXZtpAytXZoxQRRnO59GhRp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BedFJwNhSAV0AQSOf+eirMDOVkyvVsjaDHH3Xec94kB3WrvF7Nwiv2KzTV4DIat5TV4oeX1+a3GXrgGn9N/oEtKI+jgMkxuQ7Otao/VMXYPMEZNRQ2OJuJTtb8eYiEkPjXdItWtM3ZnM+xoraD7YfqwFnzyicH+W0ZLNksD3mro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59ccf81e74bso608578e0c.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 06:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780666676; x=1781271476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mbWYv3/oYKk7SXXBsDpY1xgHffMAZJ0Tb8VCAbQ5qE=;
        b=H/5IF0mrFAACn+aBACc+3z/zKc8XLk6nMmkwcc7iAEsQOMSE2VIT7mfQ9r3aFu2W3f
         vLrSGhOWoCW0ZJdJUDjC+NVAiAI0eTGnRbj0gRiHtcvuVmcAHdiioD1u97TAGmqvnSRn
         wu88QgYscWXIqWhR1H2wRKNcXE/LSkCy1qa9VzttXxsuLPBEGFvDpqeumSoWpVto+Vts
         99frJId+z2O4FMuu4JywfmLvK+tCBL6GhAFZlpvtIxgu+h0jJdA13mYW6I2ET6EHqoMV
         q8HN75L/9OAXEyTdgSncMw8zI7ZgVOY77QZKA+2TyNMVCiQDMFBwtKCBCRMJomn8y8Oh
         MoYw==
X-Forwarded-Encrypted: i=1; AFNElJ9LAF4Bl/EB9nrWsk0Y+M4V05eW5jqiSuwk5n7C9RDAHsD7Pntv1Qf3Nh7ES+azwS3BERla1XExwBn+@vger.kernel.org
X-Gm-Message-State: AOJu0YwtLm1VWKCW5P8/2gVnObdJwqfU7fKljeH1gryVS2oC71im0Q4k
	C1Tq4gaPHS5rzXoHnqjhCV65PHNm3+BGWWCnuI2D8cfbXEgNA0bNJrWmIFUe9hPQ
X-Gm-Gg: Acq92OEOicIc7G7p8wiZL8AuLOfZ0Q4L0UuH+Os3w3A1GV33Y1t1F8rWNzqCNDuywOk
	hibv8FteRCpVGOb3XMtdATnoXQct1eS67vqrpCcC4n3scQXcl9XQ+aFrUen1XsDJr6ml4NHKi/L
	JN7qunmYaPWAHoDxVef4Z1muQF+oRuIBi781lxobJSiH9tyLLug2u4wDqGN7kYd3IAl5M12U4qy
	8MvmYWaqaDUV6/rWxSSPCKveY0zioe9YqNoeKmy0dtHSIG+DbeUQYYydmqvnjop8tER/v39ltdY
	mvUYedNtCwO5z50R2W3qyax8VB57yQWAuzE0NL6ibnQKneL4JmK3wyZBQmCPq6twIx8Nx8fYVAt
	QLS7Ju20EogtZ1yachCeAjQmfzl0W4rZx0/z4r5sDV4x8mixZMac1qxf2os96PxzlGHiajerP+h
	Q7hMMiulVHe+IoAC1vE4b253Te+V6Fk9Asv/xeWE+RBL8SkbVNnJhPntzq638AyMm2nvxl+Da2d
	TY=
X-Received: by 2002:a05:6122:468c:b0:573:a6f2:65f with SMTP id 71dfb90a1353d-5ac5510dc66mr1624217e0c.6.1780666675790;
        Fri, 05 Jun 2026 06:37:55 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413f91f2esm6726729241.4.2026.06.05.06.37.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 06:37:54 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59e23d70dfaso642010e0c.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 06:37:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ878qfVi/I/Lt7uFAnHdHOosYeMw3xiovDLe4+N0lEbV69xHwTUmLfBvACleII+FuUQEzvEKsZoPeom@vger.kernel.org
X-Received: by 2002:a05:6122:4b05:b0:5a0:9ad4:7016 with SMTP id
 71dfb90a1353d-5ac57e02261mr1463187e0c.10.1780666673234; Fri, 05 Jun 2026
 06:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260511191910.1945705-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260511191910.1945705-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jun 2026 15:37:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVjvdX2Ve-Sf91oJoCWcO-fF-363ytO66Pr=SBA69N+g@mail.gmail.com>
X-Gm-Features: AVVi8CftNp2l3YTCG72NkTVwV1FmtccWLHXsNjSPXXHE1Sq7KdRdjdvppMf_SNw
Message-ID: <CAMuHMdWVjvdX2Ve-Sf91oJoCWcO-fF-363ytO66Pr=SBA69N+g@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 11 May 2026 at 21:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Use a per-SoC PLL reference input frequency for PLL parameter
> calculations instead of relying on the hardcoded 24MHz constant.
>
> Add an input_fref field to struct rzv2h_pll_limits and derive the PLL
> reference frequency from it in rzv2h_get_pll_pars(). Fall back to the
> existing 24MHz value when no SoC-specific input is provided.
>
> This allows the existing PLL divider calculation logic to be reused
> unchanged on SoCs such as RZ/T2H, which use a 48MHz PLL reference
> input instead of the 24MHz reference used on RZ/V2H(P), while keeping
> current RZ/V2H(P) behaviour intact.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -242,6 +242,7 @@ struct rzv2h_plldsi_div_clk {
>  bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
>                         struct rzv2h_pll_pars *pars, u64 freq_millihz)
>  {
> +       unsigned long input_fref = limits->input_fref ?: RZ_V2H_OSC_CLK_IN_MEGA;
>         u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
>         u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
>         struct rzv2h_pll_pars p, best;

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -53,6 +53,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
>   * various parameters used to configure a PLL. These limits ensure
>   * the PLL operates within valid and stable ranges.
>   *
> + * @input_fref: Reference input frequency to the PLL (in MHz)

Iff there is a default, it should be documented here?

> + *
>   * @fout: Output frequency range (in MHz)
>   * @fout.min: Minimum allowed output frequency
>   * @fout.max: Maximum allowed output frequency
> @@ -78,6 +80,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
>   * @k.max: Maximum delta-sigma value
>   */
>  struct rzv2h_pll_limits {
> +       u32 input_fref;
> +
>         struct {
>                 u32 min;
>                 u32 max;
> @@ -156,6 +160,7 @@ struct rzv2h_pll_div_pars {
>
>  #define RZV2H_CPG_PLL_DSI_LIMITS(name)                                 \
>         static const struct rzv2h_pll_limits (name) = {                 \
> +               .input_fref = 24 * MEGA,                                \

Why add this if 24 * MEGA is the default value anyway?
Why not do the same for the two similar RZ/G3E macros?
Perhaps the default handling and the RZ_V2H_OSC_CLK_IN_MEGA macro
should just be dropped?

>                 .fout = { .min = 25 * MEGA, .max = 375 * MEGA },        \
>                 .fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },     \
>                 .m = { .min = 64, .max = 533 },                         \

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
