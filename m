Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F68F319857
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 23:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780009695; cv=none; b=CIIiFOMK26ycozCDqpQ9J87wONpKKg4/q1J+eGT8WGMlHglFQYlYIaICCYVlhlissJfgvjyXMHK9DDz5Ds8DOGcjjcvIbSPUrOvdyIh8e0p1wf9cP8uW7hvDdwDdrHe/JlEoRwaIYvUKuvpTeu+Fd9S2sSsNK/5UmwB1o7i8rhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780009695; c=relaxed/simple;
	bh=igAYccafVUZm80q6GjuxEnrNJJg3iS4+Jc9OnW9Q8CI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uuQMnc1jnFKXcvIqTrDHF1doJS3CCwq2cuyC8Xh3Kn7JuBjfxRRMVZk923hmT/EPpl2U6Wpdr3EWdzTmiRnfyqauvtd5iKv3nd0WgK8eUYetGk79EFTJz/dxLnNASE0cJn2P6IYoof/fimff1vgga1Hyist6IDcm2Czn+oWvTIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQCaulm7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQCaulm7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270971F00A3A;
	Thu, 28 May 2026 23:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780009693;
	bh=/PeBcC808Ob1l1QX1qE1qwmuu0nGHBf5uJpCB9XStdk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WQCaulm7dUazLi1k++0GRG9Je5wZhHaexQiKNplAJLyV28yhy5vxswtueeiaY0MBJ
	 ZtyVa8Wfw98H9FiPzTKrGyVa/vrfYIMWcxhxp//8TMDHVvCAJ+Es9PJAgQbnvAvWyp
	 OfzEluZmpJ4naaejhvwbBjP6WQXJ5bihuZKWK0fhD7+Mbmw+DEBqvrXZTq6MCC4Gbz
	 5BIlkkOuUBE0ejZ+A4LvlKBhVli0HWN7hNcidhz2MIAfFijChqCMouQV0wlRejO8Us
	 OrbLIKWcaVoyQywgZv3BAi3RK874/Y5BvKxDk05AkLxs/hm+zgGdMIPDlMfWcsPUbA
	 cisaL92ULM04Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 4/5] clk: zte: Introduce a driver for zx297520v3
 LSP clocks and resets.
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-zx29clk-v3-4-c7fe54ea388f@gmail.com>
References: <20260529-zx29clk-v3-4-c7fe54ea388f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 23:08:12 +0000
Message-Id: <20260528230813.270971F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The `LSP_CLOCK` macro swaps the PCLK and WCLK gate bit offsets com=
pared to the documentation block.
- [High] Timers and Watchdogs are missing divisor configurations despite be=
ing documented to have them.
- [Medium] Missing use of `dev_err_probe` when handling potential probe def=
errals from clock lookups.
- [Medium] The 'pclk' clock is requested redundantly twice during the probe=
 function.
- [Medium] The TDM clock divisor configuration differs from other blocks sh=
aring the exact same hardware ID.
- [Low] Usage of `offsetof()` instead of `struct_size()` to calculate memor=
y allocation bounds for a struct with a flexible array member.
--

commit 6fe6d621ba374fdf4c496c8baf190e122aa53ca3
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 LSP clocks and resets.

This patch introduces the driver for ZTE zx297520v3 LSP clocks and resets.
It defines the clock mapping, composite clock parameters, and probe routine.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> index 986042dd4caf9..a67b7fe332f31 100644
> --- a/drivers/clk/zte/clk-zx297520v3.c
> +++ b/drivers/clk/zte/clk-zx297520v3.c
> @@ -755,6 +755,191 @@ static int zx297520_topclk_probe(struct platform_de=
vice *pdev)
> +/* LSP clock entries have a common pattern: Bit 0 for PCLK, Bit 1 for WC=
LK. Bit 4 (and sometimes
> + * more) for WCLK mux.

[ ... ]

> + * Timer reg	function	div	dev offset(lsp + xxxx)	ID
> + * 0x0: Read-only, probably device identifier			0x00752100
> + * 0x4:		timer_l1	Y	0x1000			0x02020000
> + * 0x8:		watchdog_l2	Y	0x2000			0x02020000
> + * 0xc:		watchdog_l3	Y	0x3000			0x02020000

[ ... ]

> +#define LSP_CLOCK(offset, name, mux, div_shift, div_size) {\
> +		ZX297520V3_##name##_RESET, ZX297520V3_##name##_WCLK, ZX297520V3_##name=
##_PCLK,\
> +		#name, offset, 8, offset, 0, 1, "lsp_pclk", offset, 4, 4, mux, ARRAY_S=
IZE(mux),\
> +		offset, div_shift, div_size, 0}

[Severity: High]
Does this mapping reverse the PCLK and WCLK gate shifts?

The struct definition expects wclk_gate_shift then pclk_gate_shift, which
maps 0 to wclk and 1 to pclk in this macro. The documentation block at the
top notes Bit 0 for PCLK and Bit 1 for WCLK.

> +static const struct zx297520v3_composite lsp_clocks[] =3D  {
> +	LSP_CLOCK(0x4,	TIMER_L1,	timer_lsp_sel,	0,	0),
> +	LSP_CLOCK(0x8,	WDT_L2,		timer_lsp_sel,	0,	0),
> +	LSP_CLOCK(0xc,	WDT_L3,		timer_lsp_sel,	0,	0),

[Severity: High]
The documentation block indicates that these timers and watchdogs have a
divisor (indicated by 'Y'), but the divisor size parameter is set to 0 here.
Are these missing their divisor configurations?

[ ... ]

> +	LSP_CLOCK(0x30,	SPI0,		spi_lsp_sel,	12,	4),

[ ... ]

> +	LSP_CLOCK(0x48,	SPI1,		spi_lsp_sel,	12,	4),
> +	LSP_CLOCK(0x4c,	TIMER_L11,	timer_lsp_sel,	12,	4),
> +	LSP_CLOCK(0x50,	TDM,		tdm_lsp_sel,	16,	4),

[Severity: Medium]
TDM uses a divisor shift of 16 here, but other components sharing the same
0x01040000 device ID (like SPI0 and SPI1) use a divisor shift of 12. Is 16
the correct divisor shift for this block?

> +};
> +
> +#undef LSP_CLOCK
> +
> +static int zx297520_lspclk_probe(struct platform_device *pdev)
> +{
> +	static const char * const parent_names[] =3D { "mpll_d5", "mpll_d4", "m=
pll_d6", "mpll_d8",
> +						     "mpll_d12", "osc26m", "osc32k", "pclk",
> +						     "tdm_wclk", "dpll_d4",
> +	};
> +
> +	struct zx29_clk_controller *lsp;
> +	struct device *dev =3D &pdev->dev;
> +	void __iomem *base;
> +	struct clk *parent;
> +	unsigned int i;
> +	int res;
> +
> +	lsp =3D devm_kzalloc(dev, offsetof(struct zx29_clk_controller,
> +					 resets[ZX297520V3_LSPRST_END]), GFP_KERNEL);

[Severity: Low]
Is it preferable to use struct_size() for this flexible array allocation
instead of offsetof() to ensure proper bounds checking?

> +	if (!lsp)
> +		return -ENOMEM;

[ ... ]

> +	parent =3D devm_clk_get_enabled(dev, "pclk");
> +	if (IS_ERR(parent)) {
> +		dev_err(dev, "failed to find lsp pclk\n");
> +		return PTR_ERR(parent);
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(parent_names); ++i) {
> +		parent =3D devm_clk_get(dev, parent_names[i]);

[Severity: Medium]
The parent_names array includes pclk, which causes it to be requested
again in this loop after already being fetched with devm_clk_get_enabled().
Should pclk be removed from the parent_names array?

> +		if (IS_ERR(parent)) {
> +			dev_err(dev, "failed to find lsp %s clock\n", parent_names[i]);
> +			return PTR_ERR(parent);
> +		}

[Severity: Medium]
Can devm_clk_get() return -EPROBE_DEFER here? If so, using dev_err_probe()
might be better to avoid spamming the logs during probe deferral.

> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-zx29clk-v3=
-0-c7fe54ea388f@gmail.com?part=3D4
