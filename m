Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED8B3AC0C0
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003485; cv=none; b=MfAPk0+/VB4wXDvg0Cu3FWUjntMhjKnyQ2XmR8/Q6oa8WH25tt/IiD93d4OwA8ZGg4sS17sziEVcRFfkJUvsmfLSaTQINLZz4JG/M2wFaPczHjNVKwNqLvyOALSzYp/tqt2g8bXqd/nSD2SkgWXXnTdaw5GRupAt9cpwdxYUqHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003485; c=relaxed/simple;
	bh=ysKyVWJJAMNDWOIEIl/FwXKmJC/2+T41Elx7N1xztSk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J5D/jx5B+2eSlSY8skez4mYIxReg6d1Rd/jS78KApyUSyGIzuzbq//6DzRunoo9WbeOFWzGGIakI1A43cbdU+anOVi2FKmh0Fa7buC71o5aqWgjtIucJl2+clSxzxyPutdCh8jheTEDVJFzvhf8ZFO3ZPUFq/w7McAPbrgw7FTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0L3R19u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0L3R19u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA031F00893;
	Tue,  9 Jun 2026 11:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781003484;
	bh=1cWE87AtgOYzh2Z1yoRTyLk1k3r3hpqK8LzDE+kWKag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E0L3R19uES5lz2LJgkDgO6bcPjfQU0uMVEGrUi4F8+tuyqf0hzNhJDgIGT0dZAk/J
	 iCw88jMq97L7+cwLEp3jVgSERQ2X1APQWX1w5lvHOmxZ4EaCZHauXtHMzWYU7wVS7X
	 XkokoZ/pU9Yfc8GQNFH5K7CQApkE02CkapFn/2OdOrHzcKTq627xqpm2d+bfahQyE2
	 b9bJJEBmYtdBiyHqAsDfMXa24sLmuQIG5ko86ojBGupm5vYYEdW0v/hPFHMQm7T2HH
	 BAfFC7ozUNY/KeakBjCv/WYWo5zo/rFNhp491ySfCbROJY3pvhXKscJvKolHgPTy/y
	 BzBEW8p6Udpbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260609105924.962573-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609105924.962573-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 11:11:23 +0000
Message-Id: <20260609111124.2AA031F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Unsafe cast of a dynamically-parented grandparent clock leads =
to type confusion and potential kernel panic.
- [Critical] Uninitialized stack variable `init` passed to clock registrati=
on framework causes undefined behavior and kernel panic.
- [High] The `determine_rate` callbacks illegally mutate internal hardware =
caching state, breaking the clock framework's stateless query design.
- [High] Unchecked hardware reads can cause a division by zero panic during=
 clock tree initialization.
--

commit d7d90136d8420c2d9ce47a37c13ff3a993298ca0
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H display=
 pipeline

Add the clock definitions and PLL logic required to supply the LCDC
(VSPD/FCPVD/DU) blocks on the RZ/T2H (R9A09G077) SoC. Introduce a new PLL
clock type and implement rate recalculation, programming and locking sequen=
ces
for PLL3.

> diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9=
a09g077-cpg.c
> index 93b15e06a19bc..44c8b5aaa2afb 100644
> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

[ ... ]

> @@ -480,6 +576,272 @@ r9a09g077_cpg_fselxspi_div_clk_register(struct devi=
ce *dev,
>  	return hw->clk;
>  }
> =20
> +static unsigned long r9a09g077_cpg_pll3_clk_recalc_rate(struct clk_hw *h=
w,
> +							unsigned long parent_rate)
> +{
> +	struct pll_clk *pll_clk =3D to_pll(hw);
> +	u32 ctr0, ctr1;
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

[Severity: High]
Can pdiv be 0 here if the hardware defaults to a 0 state or the bootloader
has not initialized the PLL?

If pdiv is 0, will this DIV_ROUND_CLOSEST_ULL() macro trigger a division by
zero panic during clock tree initialization?

> +}
> +
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
> +	if (!rzv2h_cpg_get_pll_pars(pll_clk->limits, &pll_clk->pll_parameters,
> +				    rate_millihz)) {
> +		dev_dbg(pll_clk->dev,
> +			"failed to determine rate for req->rate: %lu\n",
> +			req->rate);
> +		return -EINVAL;
> +	}
> +	req->rate =3D DIV_ROUND_CLOSEST_ULL(pll_clk->pll_parameters.freq_millih=
z, MILLI);
> +	pll_clk->cur_rate =3D req->rate;

[Severity: High]
Is it safe to mutate the driver's cached state (pll_clk->cur_rate and
pll_clk->pll_parameters) inside a .determine_rate callback?

Since the Common Clock Framework expects .determine_rate to be a stateless
query, could speculative queries like clk_round_rate() corrupt the cached
parameters, causing a subsequent clk_set_rate() for a different rate to
program the hardware with the wrong values?

> +
> +	return 0;
> +}

[ ... ]

> +static int r9a09g077_cpg_lcdc_div_determine_rate(struct clk_hw *hw,
> +						 struct clk_rate_request *req)
> +{
> +	struct r9a09g077_lcdc_div_clk *dsi_div =3D to_lcdc_div_clk(hw);
> +	struct pll_clk *pll_clk =3D to_pll(clk_hw_get_parent(clk_hw_get_parent(=
hw)));

[Severity: Critical]
Does this safely cast the grandparent hardware structure to struct pll_clk?

The immediate parent of this clock is CLK_SEL_CLK_PLL3, which is a mux that
can be parented to either .loco or .pll3. If the bootloader leaves the mux
parented to the fixed .loco clock, will clk_hw_get_parent() return the
fixed clock's hw structure instead?

If so, would casting it to struct pll_clk via to_pll() and dereferencing
its fields (like pll_clk->limits below) cause out-of-bounds memory accesses
and a panic?

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
> +
> +	if (!rzv2h_cpg_get_pll_divs_pars(pll_clk->limits, &dsi_params, table,
> +					 i, freq_millihz)) {
> +		dev_err(dsi_div->dev,
> +			"LCDC divider failed to determine rate for req->rate: %lu\n",
> +			req->rate);
> +		return -EINVAL;
> +	}
> +
> +	req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_params.div.freq_millihz, MILLI);
> +	req->best_parent_rate =3D req->rate * dsi_params.div.divider_value;
> +	dsi_div->divider =3D dsi_params.div.divider_value;
> +	pll_clk->cur_rate =3D req->best_parent_rate;
> +	pll_clk->pll_parameters =3D dsi_params.pll;

[Severity: High]
Does modifying dsi_div->divider, pll_clk->cur_rate, and
pll_clk->pll_parameters here violate the stateless design of CCF rate queri=
es?

Similar to r9a09g077_cpg_pll3_determine_rate(), could speculative queries
corrupt the internal state of both this driver and its grandparent's PLL?

> +
> +	return 0;
> +}

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

[Severity: Critical]
Is it intentional that the struct clk_init_data init variable is allocated
on the stack without being zero-initialized (e.g., struct clk_init_data
init =3D {};)?

Will unassigned fields like parent_data and parent_hws contain random stack
garbage, causing the framework to attempt to dereference them in
devm_clk_hw_register() and resulting in a panic?

> +	const struct clk *parent;
> +	const char *parent_name;
> +	struct clk_hw *hw;
> +	int ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609105924.9625=
73-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D5
