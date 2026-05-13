Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AD92D839C
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778633784; cv=none; b=drz/4qKBdaFUx6P4LTiz/70CjsQfoadiKelsEc/rTvYTMPZKczRBglXYyaG7WU/c/fcUNwVzmeyc5H69hpFl4uONjn2kTT3aZH6vhnV4RcNRBp2mZmjOv4dlnkWmOzu9YDuw2mxUXrkBhBl/UevwntI7JO/KQVZpFPbQa+0/vBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778633784; c=relaxed/simple;
	bh=kvNgHxm/AWeFLioaIE7iyI3yxJRwwYn/smmLtvRE5k4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IEeKZ2WOSWapL1CZLK+IaYJDJQmEOCC2NMN1zaJgERLosV7/ESV3qr7ZBrlBXPZLjqxV5XiO+vo6FD47AX2eTUTV1YsHAtORmjkmgwuxPaW686s1rMFVMfIy2m3VBuiGCm7lTwSQgtKRoYGt8LnlD0Y3LjpEjjalPAhG+tWp6mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXLDfeNH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXLDfeNH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25A2C2BCB0;
	Wed, 13 May 2026 00:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778633783;
	bh=kvNgHxm/AWeFLioaIE7iyI3yxJRwwYn/smmLtvRE5k4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=RXLDfeNHF0LBNGzcXWFU2LuwuNAzIn4MihHNfahUUR5pv6iYtrNL4JnDE2C/Mb7jN
	 nP83DfBYN2D9uhU70YKoNBdh/AqjaCD1hay1lJTnrXlblEhLriKu9O4WJJ7EveTj08
	 hwdw88fCIkXL27pwMyL0xNNQOiVDWboUXAF6b9SGkuha+7978CTb8MxsUhiw4olGtD
	 K8WMPwaomLNsKoW5SA+a81ykwXkgeECjzyN7KD4ZONNrj8gikeb/eTQhqAxwGuwI9z
	 3ud0ul15BQH+pWu6jhq1+E7aZ3R1FVuOzoJ/pi3nwN0AeM9+SVhQ7DHzgQNQbfUcd5
	 n+QwM7680PCBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: wsa+renesas@sang-engineering.com, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260511191910.1945705-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511191910.1945705-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 00:56:22 +0000
Message-Id: <20260513005622.C25A2C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] Uninitialized `struct clk_init_data` allocated on the stack ca=
uses kernel panics.
- [High] Invalid downcast of grandparent clock causes type confusion and me=
mory corruption.
- [High] State mutation in `determine_rate` callbacks violates Common Clock=
 Framework constraints.
- [High] Missing locking during read-modify-write on the highly shared `SCK=
CR3` register.
- [High] Potential divide-by-zero kernel panic in `r9a09g077_cpg_pll3_clk_r=
ecalc_rate`.
- [Medium] Integer truncation of requested 64-bit clock rates leads to unex=
pected hardware frequencies.
- [Medium] Amplified rounding error during `best_parent_rate` calculation.
--

commit 92d34dcfa10f7893860a62c602064adfd5fe8364
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H display=
 pipeline

This patch adds the clock definitions and PLL logic required to supply the =
LCDC
blocks on the RZ/T2H SoC. It introduces a new PLL clock type, implements ra=
te
recalculation and locking sequences, and adds the corresponding muxes and
divider entries.

> diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9=
a09g077-cpg.c
> index 93b15e06a19bc..64d45dbea5f1e 100644
> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

[ ... ]

> +static unsigned long r9a09g077_cpg_pll3_clk_recalc_rate(struct clk_hw *h=
w,
> +							unsigned long parent_rate)
> +{
> +	struct pll_clk *pll_clk =3D to_pll(hw);
> +	unsigned int ctr0, ctr1;
> +	u8 pdiv, sdiv;
> +	u64 rate;
> +	u16 mdiv;
> +	s16 kdiv;
> +
> +	ctr0 =3D readl(CPG_PLL3_VCO_CTR0(pll_clk->reg));
> +	ctr1 =3D readl(CPG_PLL3_VCO_CTR1(pll_clk->reg));
> +
> +	pdiv =3D FIELD_GET(CPG_PLL3_VCO_CTR0_PDIV, ctr0);
> +	mdiv =3D FIELD_GET(CPG_PLL3_VCO_CTR0_MDIV, ctr0);
> +	kdiv =3D (s16)FIELD_GET(CPG_PLL3_VCO_CTR1_KDIV, ctr1);
> +	sdiv =3D FIELD_GET(CPG_PLL3_VCO_CTR1_SDIV, ctr1);
> +
> +	rate =3D mul_u64_u32_shr(parent_rate, (mdiv << 16) + kdiv, 16 + sdiv);
> +
> +	return DIV_ROUND_CLOSEST_ULL(rate, pdiv);
> +}

Is it possible for pdiv to be 0 if the hardware boots in an uninitialized
state?

The DIV_ROUND_CLOSEST_ULL macro will cause a kernel panic if the divisor
is zero.

> +static int r9a09g077_cpg_pll3_determine_rate(struct clk_hw *hw,
> +					     struct clk_rate_request *req)
> +{
> +	struct pll_clk *pll_clk =3D to_pll(hw);
> +	u64 rate_millihz;
> +
> +	if (req->rate =3D=3D pll_clk->cur_rate)
> +		return 0;
> +
> +	rate_millihz =3D mul_u32_u32(req->rate, MILLI);

Does this implicitly cast the 64-bit req->rate (which is an unsigned long on
ARM64) to a 32-bit integer, dropping the upper bits before multiplication?

> +	if (!rzv2h_get_pll_pars(pll_clk->limits, &pll_clk->pll_parameters,
> +				rate_millihz)) {
> +		dev_dbg(pll_clk->dev,
> +			"failed to determine rate for req->rate: %lu\n",
> +			req->rate);
> +		return -EINVAL;
> +	}
> +	req->rate =3D DIV_ROUND_CLOSEST_ULL(pll_clk->pll_parameters.freq_millih=
z, MILLI);
> +	pll_clk->cur_rate =3D req->rate;
> +
> +	return 0;
> +}

Is it safe to mutate the driver state (pll_clk->pll_parameters and
pll_clk->cur_rate) inside a determine_rate callback?

The common clock framework can call this via clk_round_rate for queries.
This could overwrite the active configuration without actually changing the
hardware.

[ ... ]

> +static int r9a09g077_cpg_lcdc_div_determine_rate(struct clk_hw *hw,
> +						 struct clk_rate_request *req)
> +{
> +	struct r9a09g077_lcdc_div_clk *dsi_div =3D to_lcdc_div_clk(hw);
> +	struct pll_clk *pll_clk =3D to_pll(clk_hw_get_parent(clk_hw_get_parent(=
hw)));

Since the grandparent clock CLK_SEL_CLK_PLL3 is a multiplexer, could the
parent hardware actually be the fixed-rate loco clock instead of a
pll_clk structure?

If so, the to_pll macro would cast a fixed-rate clock to a PLL clock,
potentially leading to out-of-bounds memory access later in this function.

> +	u8 table[RZT2H_MAX_LCDC_DIV_TABLES] =3D { 0 };
> +	struct rzv2h_pll_div_pars dsi_params;
> +	const struct clk_div_table *div;
> +	unsigned int i =3D 0;
> +	u64 freq_millihz;
> +
> +	for (div =3D dsi_div->dtable; div->div; div++) {
> +		if (i >=3D RZT2H_MAX_LCDC_DIV_TABLES)
> +			return -EINVAL;
> +		table[i++] =3D div->div;
> +	}
> +
> +	freq_millihz =3D mul_u32_u32(req->rate, MILLI);

Similar to the PLL3 callback, does this also truncate the 64-bit rate down
to 32 bits?

> +
> +	if (!rzv2h_get_pll_divs_pars(pll_clk->limits, &dsi_params, table,
> +				     i, freq_millihz)) {
> +		dev_err(dsi_div->dev,
> +			"LCDC divider failed to determine rate for req->rate: %lu\n",
> +			req->rate);
> +		return -EINVAL;
> +	}
> +
> +	req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_params.div.freq_millihz, MILLI);
> +	req->best_parent_rate =3D req->rate * dsi_params.div.divider_value;

Could calculating req->best_parent_rate using the already rounded req->rate
amplify the Hz-level rounding error?

Using the exact internal rate from dsi_params.pll.freq_millihz / MILLI
might be more accurate.

> +	dsi_div->divider =3D dsi_params.div.divider_value;
> +	pll_clk->cur_rate =3D req->best_parent_rate;
> +	pll_clk->pll_parameters =3D dsi_params.pll;
> +
> +	return 0;
> +}

Does mutating dsi_div->divider and pll_clk properties here break queries if
the framework only requested a rate check via clk_round_rate?

> +static int r9a09g077_cpg_lcdc_div_set_rate(struct clk_hw *hw,
> +					   unsigned long rate,
> +					   unsigned long parent_rate)
> +{
> +	struct r9a09g077_lcdc_div_clk *dsi_div =3D to_lcdc_div_clk(hw);
> +	const struct clk_div_table *clkt;
> +	bool divider_found =3D false;
> +	u32 val, shift;
> +
> +	for (clkt =3D dsi_div->dtable; clkt->div; clkt++) {
> +		if (clkt->div =3D=3D dsi_div->divider) {
> +			divider_found =3D true;
> +			break;
> +		}
> +	}
> +
> +	if (!divider_found)
> +		return -EINVAL;
> +
> +	shift =3D GET_SHIFT(dsi_div->conf);
> +	val =3D readl(dsi_div->reg);
> +	val &=3D ~(clk_div_mask(GET_WIDTH(dsi_div->conf)) << shift);
> +	val |=3D clkt->val << shift;
> +	writel(val, dsi_div->reg);
> +
> +	return 0;
> +}

Does this read-modify-write sequence need to be protected by pub->rmw_lock?

It looks like SCKCR3 is highly shared with other dividers like DIVSCI0ASYNC,
and concurrent modifications could race.

[ ... ]

> +static struct clk * __init
> +r9a09g077_cpg_lcdc_div_clk_register(struct device *dev,
> +				    const struct cpg_core_clk *core,
> +				    void __iomem *addr,
> +				    struct cpg_mssr_pub *pub)
> +{
> +	struct r9a09g077_lcdc_div_clk *clk_hw_data;
> +	struct clk **clks =3D pub->clks;
> +	struct clk_init_data init;

Since this is allocated on the stack without zero initialization, could
fields like parent_hws and parent_data contain uninitialized garbage?

The common clock framework might dereference these pointers during
registration before falling back to checking parent_names.

> +	const struct clk *parent;
> +	const char *parent_name;
> +	struct clk_hw *hw;
> +	int ret;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511191910.1945=
705-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D4
