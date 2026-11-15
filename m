Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743746;
	b=ODNLnPaqAoXuF2SrPmgBn1sR2td2oD4c/z98kPB2JbcuaOA1OKM5GdHc89vu2G0ewqUL
	 1LQirqKVu6jvuzUPaG8qE+FAHkHA5BVCHL6iTYtl7cRIfDzdGUV1h14ZxXH8OqfyI26fp
	 VoFRPkI5SVcmTPv8gLDc1z7coPdwKVf71kdwhfWZ11NaTHlPBShD+aoAHIHBCGk9a/xj4
	 9OVAaX7eoixexNv+MgSDA4gbwUR4HyMfy1Lhp0m//BR1qdm6GG44fdGhUt3H4Y+IkhQZa
	 KGeHo0w9fEMC4A0lN5Tz+tN/7MTJFKHoYDHC7SGXCR4Y4eiDJincsIMx23ZZAklUb6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743746;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=si1tSdkMmrU6Pinznwemqt1kiFpuGNbFlT8OV4JIa60=;
	b=3Ag/aKU5wlOEcGbIjKxCqpxl9vqmf9S+NNWbBw0NykSuAuaz8mlSfbvjVYX7dp1oUjVC
	 uftpR764JlYO74MW0eyOStUr4SPqLlr+Vzg1ePmD7HOeC4Fk5+OPC2Wy78M0N0lrY8LGs
	 PpEsDAl0ivmQkX41xBYHrVYmd73D4AoN73NFxxtsZwkWl6ikuB/j3S3wGQL4Et5E/sKfU
	 kNP1co6gtLgILiYfC1JpdZGlpIbiUV6xHKvJ5P7E8F6AzSFrBxAgY2IYvmbPzrFfblfhW
	 nwZDqU5qBzFTKb6hPCiR7pEW+wVNgdnCn37i7GkGLdKvNXXY/VzBIreAJDyDirTLLrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jk3LtHSK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43140606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 11:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jk3LtHSK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE461F000C7
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 11:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794743745;
	bh=si1tSdkMmrU6Pinznwemqt1kiFpuGNbFlT8OV4JIa60=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=jk3LtHSKi3Mkp6oMCVw35WfpC5ZEaiFTAVoH781KG0YGTYFGCrAjxI93EMvCKKz4A
	 1MqFwsGjYsaKlp+ANtMH8LS1tcZ/wj+MoRC1oWWBx86rlQVIqMS9Z5256LOW8U6I4w
	 6Ilw/ju9rU+BbgG+13tWbl64hBO2FGClyCNqd80kOI8pN35zLG7Gtvvix4HgTcZwwx
	 VAHlZgMoA2C9p5TuuWzAkQg4MFqRm3TG547No2QaNHXRRRGToW8sRbYUxL2eWsiaA0
	 j748WrDPEjPZfeCEVKqun8xU2oXra0MgeIfEyEo9Y1/lKLabTSYyjkiHyMqHB5npAt
	 G/7WxtO6r+d1w==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so27791811fa.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 03:55:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH8EOMYj1ZiWglLshBNlbEpIaLyhGzA/9IDPTP3G25ebFlUlIlxnKDR5QSErZVBIdydUCt7Szr43fNf@vger.kernel.org
X-Gm-Message-State: APuU4Z9lzKStVy9fbtRbYO/u5S95aYNd1j3WaZcSz2DoZsV46sMEdTmi
	8MRWycBcrDA4Fj64Cj60o/+EzMMeHbJkJsHGkRUoJm0ZMj6NiHQMMNh6i4oG/jhkqcoq3UlviiE
	7SnrHD5BgmPLYotaZfwGrD7tlPv2KIa0=
X-Received: by 2002:a05:651c:421b:b0:3ab:751:6ba8 with SMTP id
 38308e7fff4ca-3ae2b5564f5mr20174841fa.28.1794743744142; Sun, 15 Nov 2026
 03:55:44 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech>
 <20261112-a733-clk-v7-6-db7c5451ffa2@pigmoral.tech> <sashiko-outbox-212336@kernel.org>
In-Reply-To: <sashiko-outbox-212336@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 19:55:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v658ba1c441OM88wLA5fP_89HX3=Q4dPhq0pmY9y=Whx2A@mail.gmail.com>
X-Gm-Features: AclHuK_d3htjuLr3x8BIcggSBQikkOMEOBotOaL5HIOpBAn8HEtebLRwKXpMKpI
Message-ID: <CAGb2v658ba1c441OM88wLA5fP_89HX3=Q4dPhq0pmY9y=Whx2A@mail.gmail.com>
Subject: Re: [PATCH v7 6/8] clk: sunxi-ng: a733: Add mod clocks support
To: sashiko-reviews@lists.linux.dev, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, 
	Jernej Skrabec <jernej@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 3:18=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] clk: sunxi-ng: a733: unintended CLK_SET_RATE_PARENT on
>   eink_clk
> - [Medium] clk: sunxi-ng: a733: missing CLK_SET_RATE_PARENT on media mod
>   clocks
> --
>
> commit 6e107a79cabf47c1760cd7e323625401bc6ffc47
> Author: Junhui Liu <junhui.liu@pigmoral.tech>
>
> clk: sunxi-ng: a733: Add mod clocks support
>
> This commit adds module clock definitions for the Allwinner A733 SoC to t=
he
> sun60i-a733 CCU driver.
>
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi=
-ng/ccu-sun60i-a733.c
> > index 8bc603393f5a5..5ea65bf5b5e05 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
>
> [ ... ]
>
> > @@ -511,6 +521,893 @@ static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(mbus_c=
lk, "mbus", mbus_parents, 0x588
>
> [ ... ]
>
> > +static const struct clk_hw *eink_parents[] =3D {
> > +     &pll_periph0_480M_clk.common.hw,
> > +     &pll_periph0_400M_clk.hw,
> > +};
> > +static SUNXI_CCU_M_HW_WITH_MUX_GATE(eink_clk, "eink", eink_parents, 0x=
a60,
> > +                                 0, 5,       /* M */
> > +                                 24, 3,      /* mux */
> > +                                 BIT(31),    /* gate */
> > +                                 CLK_SET_RATE_PARENT);
>
> [Severity: Medium]
> Should eink_clk omit CLK_SET_RATE_PARENT?  Unlike eink_panel_clk, eink_pa=
rents
> only contains pll_periph0_480M_clk and pll_periph0_400M_clk.  Because
> pll_periph0_480M_clk uses writable ccu_div_ops without read-only or gate
> protection, calling clk_set_rate() on eink_clk can reprogram the shared
> 480 MHz peripheral PLL divider used by UART, GIC, MBUS, SPI, UFS, and USB
> clocks.

I dropped this flag when applying.

> [ ... ]
>
> > +static const struct clk_hw *npu_parents[] =3D {
> > +     &pll_npu_clk.common.hw,
> > +     &pll_periph0_800M_clk.common.hw,
> > +     &pll_periph0_600M_clk.hw,
> > +     &pll_periph0_480M_clk.common.hw,
> > +     &pll_ve0_clk.common.hw,
> > +     &pll_ve1_clk.common.hw,
> > +     &pll_de_3x_clk.common.hw,
> > +};
> > +static SUNXI_CCU_M_HW_WITH_MUX_GATE(npu_clk, "npu", npu_parents, 0xb00=
,
> > +                                 0, 5,       /* M */
> > +                                 24, 3,      /* mux */
> > +                                 BIT(31),    /* gate */
> > +                                 0);
> > +
> > +/*
> > + * GPU_CLK =3D ClockSource * ((16 - M) / 16)
> > + * Here we use a div_table to select M values that result in integer d=
ivisors.
> > + */
> > +static struct clk_div_table gpu_div_table[] =3D {
> > +     { .val =3D 0, .div =3D 1 },
> > +     { .val =3D 8, .div =3D 2 },
> > +     { .val =3D 12, .div =3D 4 },
> > +     { .val =3D 14, .div =3D 8 },
> > +     { .val =3D 15, .div =3D 16 },
> > +     { /* sentinel */ },
> > +};
> > +static const struct clk_parent_data gpu_parents[] =3D {
> > +     { .hw =3D &pll_gpu0_clk.common.hw, },
> > +     { .hw =3D &pll_periph0_800M_clk.common.hw, },
> > +     { .hw =3D &pll_periph0_600M_clk.hw, },
> > +     { .hw =3D &pll_periph0_400M_clk.hw, },
> > +     { .hw =3D &pll_periph0_300M_clk.hw, },
> > +     { .hw =3D &pll_periph0_200M_clk.hw, },
> > +};
> > +static struct ccu_div gpu0_clk =3D {
> > +     .enable         =3D BIT(31),
> > +     .div            =3D _SUNXI_CCU_DIV_TABLE(0, 4, gpu_div_table),
> > +     .mux            =3D _SUNXI_CCU_MUX(24, 3),
> > +     .common         =3D {
> > +             .reg            =3D 0xb20,
> > +             .features       =3D CCU_FEATURE_UPDATE_BIT,
> > +             .hw.init        =3D CLK_HW_INIT_PARENTS_DATA("gpu0", gpu_=
parents,
> > +                                                        &ccu_div_ops, =
0),
> > +     }
> > +};
>
> [ ... ]
>
> > +static const struct clk_hw *i2spcm_parents[] =3D {
> > +     &pll_audio0_4x_clk.common.hw,
> > +     &pll_audio1_div2_clk.hw,
> > +     &pll_audio1_div5_clk.hw,
> > +     &pll_periph0_200M_clk.hw,
> > +};
> > +static SUNXI_CCU_M_HW_WITH_MUX_GATE(i2spcm0_clk, "i2spcm0", i2spcm_par=
ents, 0x1200,
> > +                                 0, 5,       /* M */
> > +                                 24, 3,      /* mux */
> > +                                 BIT(31),    /* gate */
> > +                                 0);
>
> [ ... ]
>
> > +static const struct clk_parent_data display_parents[] =3D {
> > +     { .hw =3D &pll_video0_4x_clk.common.hw },
> > +     { .hw =3D &pll_video1_4x_clk.common.hw },
> > +     { .hw =3D &pll_video2_4x_clk.common.hw },
> > +     { .hw =3D &pll_periph0_2x_clk.common.hw },
> > +};
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(tcon_lcd0_clk, "tcon-lcd0", disp=
lay_parents, 0x1500,
> > +                                   0, 5,     /* M */
> > +                                   24, 3,    /* mux */
> > +                                   BIT(31),  /* gate */
> > +                                   0);
>
> [Severity: Medium]
> Are the display (tcon_lcd0..2_clk, combphy0..1_clk, edp_tv_clk, hdmi_tv_c=
lk),
> audio (i2spcm0..4_clk, i2spcm2_asrc_clk, spdif_tx_clk, dmic_clk), GPU
> (gpu0_clk), and NPU (npu_clk) module clocks missing CLK_SET_RATE_PARENT?
>
> The parent video and audio PLL post-dividers (pll_video0..2_4x/3x_clk and
> pll_audio1_div2/div5_clk) set CLK_SET_RATE_PARENT specifically so downstr=
eam
> module clocks can adjust the dedicated video and audio PLLs, and pll_audi=
o0,
> pll_gpu0, and pll_npu are likewise dedicated to those blocks.  Without
> CLK_SET_RATE_PARENT on these module clocks, clk_set_rate() is limited to
> dividing the boot-time PLL rate and cannot configure exact pixel clocks, =
audio
> sample rates, or GPU/NPU frequencies.

I added CLK_SET_RATE_PARENT to all the audio clocks and CSI master clocks.

We need to revisit the other ones later. They have at least one of the
configurable dividers from the periph PLLs, so if we set CLK_SET_RATE_PAREN=
T
here it's possible that the common PLL rate would get changed (like what
Sashiko mentioned above?!).

I would prefer that the PLL outputs that have rates mentioned be changed
into fixed factor or read-only dividers (now that we do support this type).


ChenYu
