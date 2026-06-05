Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70422F49F1
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780667078; cv=none; b=sS2uVuVi+1sI/RKs301iOtSDEBeMOuCsDIaRmOi2rl+uXUrGTlUJoFyX/SzjBKVuwTWOtvKaFfwahcb2DpeaoY4RW+azD1vcbTSXMligrd+83oMHdevT2roDScV8uJ0+jImor3NTsbJGvFFjfBxV2+P/Om1u0mFqWisW79vWQ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780667078; c=relaxed/simple;
	bh=CFF3h2aKCRs0mVERo0w9Jab73K/yL/FpUgQ+LRq2KzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzMyohYZdKPQFJ4ubcLr66AUm8yN5uwKEGNbtUpS5dVnNVP7mCrc9llgd2Qa8mZqzl+rqQEZDD3pNXPoCMOBXgkcJXrQf5ioYSe7XuOtJBflyl97HDhqqp4z66fiAeL/faRdiOZiXe2gydPeBGtwe49f6iPSDBnS1fz+3XAVnTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36b8d414666so1180529a91.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 06:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780667074; x=1781271874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/NHmMIAbF26BQ6q+U+2X1MzRNnwP89We/x5SvIc/NU=;
        b=KwQJQXxFyhGFiilWYRDc4HZD3k2/JctcI7Ub7bUmE8LrAS4KjXNxk+91uuB9bQ7O//
         JNCUF5G0kd8aKtF2eLMqfxbVGvjkN9W9+9gNJNJzSWeaqnJVeFPkNPWlK5TsqgEAsbjQ
         rdV4xps+fVW1w0VPlUb1+NU5C/xruM6vf5UY9Hj/nXYpEW1tD7CIGwjhFjtHrfqgryKo
         uXSfNYRsmGXN+TqNByasMp6yTWzfYRvnh6vImGwHqgRScpIu1xBh2xJTddwfzKEFqKlO
         /9kK5aydbB3tyP/GeV3Opvr+QpRWA2WdeHkz4MeHu5hLMU4z7g31j64wPcFBKwREimn2
         Epkw==
X-Forwarded-Encrypted: i=1; AFNElJ+zv9slXCTLjAK9LEu9NubWXaoBilPwJHbQ+BdVU+sjy0MEC432vMaHhdueFpdl2KplE/uZcx5ME02A@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Uvf6bXOAP49bf41otXUUjoDP23CCZ9tAbjd/vv0OSEi3yl1m
	wYJa+cOv8ZTlSEGjdf9A2/e33cctkfa8kjEDvnpfLyY1t42DXANKzF/qvsvnnx0y
X-Gm-Gg: Acq92OHUN9eBnG7h9FFnswtbdQOJXbI1liSCzX09+YfDkPsj56S4gutuTiF9u+1IRrI
	WOFOhoDMluxQdLTFHybmWD3m91EOZVNr8fFoo/xcOwrYS7x+QHJBsdjefARdf3rxzm+YgqdFdxl
	7An8IFuB3eQVUHjY+5T3MliYROFPZ9JzgIpVRi/ILW09PUFlUSpa3lKi25PVAFvDKGIG6f8fhFq
	8UXFjJKPou1xp5mh5uHUzpdapeXJk/rIsHo5coXqJF1ruYIEL9ort//4gGfwUk4Rm6O4JWHj0jB
	60e5s2FJRNyWIFjODkjFeADMrEclDQXCssUM3lj2ZCa0lXozZ4tYXQu4CiojZ02uj6JUHQNlZP1
	tJIYpQLcY5IpTjF2MBumrFEaQTrnvss81+1+xazpJe6zjX+ubwwc0R83lujhYAcsiEgUJ3s7PRI
	hJ78ROyJnforCkbKFKCoygJKFsjgyOGceCIsH5o3gq9s/MKT3h9wv7NdMO0VqFyD3AA92I1MWv5
	g==
X-Received: by 2002:a17:90b:2583:b0:36d:649b:ea46 with SMTP id 98e67ed59e1d1-370eeff1e59mr4045852a91.2.1780667074387;
        Fri, 05 Jun 2026 06:44:34 -0700 (PDT)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c6748f9sm6411681a91.5.2026.06.05.06.44.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 06:44:34 -0700 (PDT)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304f0039c02so3288347eec.1
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 06:44:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9tJu3USfCAGUYZx26j6wZ84jXIKwchCg+19V4R3zw8hmO1HLbtSo1C/pBfDSBYTuSwAoBvPWzD/Fyf@vger.kernel.org
X-Received: by 2002:a05:6102:6447:b0:6f0:3c5c:76a with SMTP id
 ada2fe7eead31-6fede2771c1mr1647286137.0.1780666709130; Fri, 05 Jun 2026
 06:38:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260511191910.1945705-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260511191910.1945705-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jun 2026 15:38:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBT7NFYCC-NrSxV7+Y1+76ZPc_ikGK5keRLCXEs-2_8A@mail.gmail.com>
X-Gm-Features: AVVi8CclYwL9WKaFhvlLy2AwgRj6jcLeq2B2Tj0Wg7PaSGMN4PnbodDRHC61qUc
Message-ID: <CAMuHMdVBT7NFYCC-NrSxV7+Y1+76ZPc_ikGK5keRLCXEs-2_8A@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: cpg-mssr: Add table-driven MSTP
 dummy-read delay for LCDC on RZ/T2H
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
> Per the RZ/T2H hardware manual, to secure processing after release from
> the module-stop state, dummy read the same MSTPCRm register at least
> seven times for most IP blocks, at least 100 times for LCDC and at
> least 300 times for RTC before proceeding with subsequent processing.
>
> The existing udelay(10) satisfies the seven dummy-read requirement for
> most IP blocks. Extend this to support per-IP dummy-read requirements
> by introducing a table-driven lookup, rzt2h_mstp_delay_table, where
> each entry records the MSTPCRm register index, bit position and the
> minimum dummy-read count from the hardware manual, converted to
> microseconds via RZT2H_MSTP_READS_TO_US().
>
> Introduce cpg_rzt2h_mstp_get_delay_us() to replace the open-coded
> udelay(10) calls. In cpg_mstp_clock_endisable() the exact register and
> bit are known so the lookup matches on both fields. In
> cpg_mssr_resume_noirq() the register is known but not the individual
> bit, so pass RZT2H_MSTP_ANY_BIT causing the lookup to match on the
> register alone and return the delay for the first matching entry.
>
> Add an entry for LCDC which requires at least 100 dummy reads. Adding
> support for further IP blocks with non-default requirements only needs
> a new entry in rzt2h_mstp_delay_table with no logic changes needed.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -96,6 +96,24 @@ static const u16 mstpcr_for_gen4[] = {
>  #define RZT2H_MSTPCR_BLOCK(x)          ((x) >> RZT2H_MSTPCR_BLOCK_SHIFT)
>  #define RZT2H_MSTPCR_OFFSET(x)         ((x) & RZT2H_MSTPCR_OFFSET_MASK)
>
> +/* Dummy read counts as specified by the RZ/T2H hardware manual */
> +#define RZT2H_MSTP_DEFAULT_DUMMY_READS 7
> +#define RZT2H_MSTP_LCDC_DUMMY_READS    100
> +
> +/*
> + * Time per dummy read in nanoseconds, derived from the original udelay(10)
> + * which was used to satisfy the 7 dummy-read requirement:
> + * 10000 ns / 7 reads = 1429 ns per read.
> + */
> +#define RZT2H_MSTP_DUMMY_READ_NS       1429
> +#define RZT2H_MSTP_READS_TO_US(n)      (((n) * RZT2H_MSTP_DUMMY_READ_NS) / 1000)

IMHO this is overly complicated and hard to follow...

> +#define RZT2H_MSTP_DEFAULT_DELAY_US    RZT2H_MSTP_READS_TO_US(RZT2H_MSTP_DEFAULT_DUMMY_READS)

i.e. this is just 10 again?

> +
> +#define RZT2H_MSTPCRM_INDEX            12
> +#define RZT2H_MSTPCRM04_LCDC           4

Everywhere else (DEF_MOD(), DTS) we refer to module clocks using the
sparse base-10 combined number, i.e. "1204", so I think it would be
better to do the same here.

> +
> +#define RZT2H_MSTP_ANY_BIT             U32_MAX
> +
>  static const u16 mstpcr_for_rzt2h[] = {
>         RZT2H_MSTPCR(0, 0x300), /* MSTPCRA */
>         RZT2H_MSTPCR(0, 0x304), /* MSTPCRB */
> @@ -113,6 +131,35 @@ static const u16 mstpcr_for_rzt2h[] = {
>         RZT2H_MSTPCR(1, 0x334), /* MSTPCRN */
>  };
>
> +/**
> + * struct rzt2h_mstp_delay_entry - MSTP dummy-read requirement for RZ/T2H
> + *
> + * @reg: Index into control_regs[]. Exact match.
> + * @bit: MSTP bit position, or RZT2H_MSTP_ANY_BIT for register-level match.
> + * @delay_us: Computed delay in microseconds to satisfy the dummy read requirement.
> + */
> +struct rzt2h_mstp_delay_entry {
> +       u32 reg;
> +       u32 bit;

The sparse base-10 combined number or packed index would need just a
single u32...

> +       u32 delay_us;
> +};
> +
> +/*
> + * Per RZ/T2H HW manual: to secure processing after release from the
> + * module-stop state, dummy read the same register at least seven times
> + * (except RTC and LCDC) after writing to initiate release from the
> + * module-stop state. For RTC, dummy read at least 300 times and for
> + * LCDC, at least 100 times.
> + *
> + * Instead of performing the actual dummy reads, an equivalent delay is
> + * added using udelay(), computed from the required read count via
> + * RZT2H_MSTP_READS_TO_US().
> + */
> +static const struct rzt2h_mstp_delay_entry rzt2h_mstp_delay_table[] = {
> +       { RZT2H_MSTPCRM_INDEX, RZT2H_MSTPCRM04_LCDC,
> +         RZT2H_MSTP_READS_TO_US(RZT2H_MSTP_LCDC_DUMMY_READS) },

"210" (us)?

> +};
> +
>  /*
>   * Standby Control Register offsets (RZ/A)
>   * Base address is FRQCR register
> @@ -253,6 +300,20 @@ static void cpg_rzt2h_mstp_write(struct cpg_mssr_priv *priv, u16 offset, u32 val
>         writel(value, base + RZT2H_MSTPCR_OFFSET(offset));
>  }
>
> +static unsigned int cpg_rzt2h_mstp_get_delay_us(u32 reg, u32 bit)
> +{
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(rzt2h_mstp_delay_table); i++) {
> +               const struct rzt2h_mstp_delay_entry *e = &rzt2h_mstp_delay_table[i];
> +
> +               if (e->reg == reg && (e->bit == bit || bit == RZT2H_MSTP_ANY_BIT))
> +                       return e->delay_us;
> +       }

Given there are only two modules (LCDC and RTC) that need special
handling, a table sounds like overkill to me.
For exact matching, a switch() statement with two entries and a default
would do.
For wildcard bit matching, perhaps you can use a mask?

    unsigned int mask = bit_valid ? GENMASK(31, 0) : GENMASK(31, 5));

    if (idx == (MOD_CLK_PACK(1204) & mask)) {
            /* LCDC needs 300 dummy reads, or 210 us */
            return 210;
    } else if (idx == (MOD_CLK_PACK(605) & mask)) {
            /* RTC needs 100 dummy reads, or 70 us */
            return 70;
    } else {
            /* default 7 dummy reads, or 10 us */
            return 10;
    }

What do you think?

> +
> +       return RZT2H_MSTP_DEFAULT_DELAY_US;

You might as well just do the udelay() here, too.

> +}
> +
>  static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
>  {
>         struct mstp_clock *clock = to_mstp_clock(hw);
> @@ -312,7 +373,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
>                  * register, we simply add a delay after the read operation.
>                  */
>                 cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
> -               udelay(10);
> +               udelay(cpg_rzt2h_mstp_get_delay_us(reg, bit));

In this function, you do have the packed clock index (clock->index).

>                 return 0;
>         }
>
> @@ -1142,7 +1203,7 @@ static int cpg_mssr_resume_noirq(struct device *dev)
>                         cpg_rzt2h_mstp_write(priv, priv->control_regs[reg], newval);
>                         /* See cpg_mstp_clock_endisable() on why this is necessary. */
>                         cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
> -                       udelay(10);
> +                       udelay(cpg_rzt2h_mstp_get_delay_us(reg, RZT2H_MSTP_ANY_BIT));

Here you don't have it, but idx = reg * 32, and bit_valid = false;

>                         continue;
>                 } else
>                         writel(newval, priv->pub.base0 + priv->control_regs[reg]);

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
