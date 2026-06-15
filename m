Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FBC184524
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781521376; cv=none; b=Q57iOHlBVgUd1KA6R2bQJ0JnoR6sB6CydjSYGQrJd8sgEpopshjWmZ/FEW7wu/jjbnjgCikFigSuv0sHurlbk2dopqASnTZwryyVZ41F7wDnW0E2k+TmItfPSp38zvOxiuYdEN9Jm7QBT8t+rSPuo28Sq3FNp7YQJvjTlun/Q/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781521376; c=relaxed/simple;
	bh=4jkT0uvzSa90c323GI73iBnRkpu2ikJUcprF84Tm8aY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m+BHoMgpAHbgFTuTpx0yxAtCzfxHRepYjHDPBfsFlX6z72iav1UCLUN41hWzXhrnGRtT4J/1YFdwHUTHjzdX2H1HxJBvVmi39varRhfmUyA1+TOkZjLZxm+/pl8KiIaw+SCsM0/CHVyf5DkeT+F0vjzXqYm5C6E0puz3PYXBvLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKth3x6R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKth3x6R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C14D1F000E9;
	Mon, 15 Jun 2026 11:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781521374;
	bh=oIhsAN61xzQXrxeoRkFD/7Z11wFKTPi0G55s3NPsQR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cKth3x6RyvJlJ3Ky128F4amLa1aZtBaK82kXQC7sRMFRIMW6W7qeTmvDF/wUF42WP
	 N2kpqAXNIEVkGL52kzFipmPtRCWLVoxkXSXm0TAvyARQdYtB+PkVJQNXMQXj+vmffn
	 OiT6r9wEkj5nPTkE0ULAeIGwpqm4hco1HRwto5acls9WI/Nb47/N3KU0vkcGoLZrBl
	 zqawu1cJHPEJJ2nGovBMZBwcO81PDr1g2Qfi47sJxZZr1Gl5vfJV0ffWQieaaQBgLK
	 DJb1tiSoWF8bkSDPWUMJLyrYTmS0IQUAOamIoqfrreriUq8KqiMERxE0+QPqU7yod2
	 YmZgxPM+6cpdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260615104845.4122868-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615104845.4122868-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 11:02:53 +0000
Message-Id: <20260615110254.6C14D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] CCF statelessness contract violation corrupts driver state and har=
dware configuration.
- [High] Missing NULL check on `clk_hw_get_parent_by_index()` return value =
leads to kernel panic.
- [High] Division by zero panic in `r9a09g077_cpg_pll3_clk_recalc_rate` on =
uninitialized hardware.
- [Medium] Logic bug: Raw hardware value used directly as an array index in=
 `recalc_rate`.
- [Medium] Integer truncation of the 64-bit rate parameter allows invalid r=
equests to bypass boundary limits.

Pre-existing issues:
- [High] Use-After-Free (UAF) due to devm_kzalloc allocation assigned to a =
static pointer.
--

commit f2062943d79173a69b191f32a7edd6f6097d4c7d
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2=
H display pipeline

Add the clock definitions and PLL logic required to supply the LCDC
(VSPD/FCPVD/DU) blocks on the RZ/T2H (R9A09G077) SoC. The RZ/T2H display
subsystem depends on a dedicated PLL (PLL3) and a set of new derived
clocks.

> diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9=
a09g077-cpg.c
> index 93b15e06a19bc..3e73f2b6e5dcc 100644
> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

[ ... ]

> @@ -480,6 +576,276 @@ r9a09g077_cpg_fselxspi_div_clk_register(struct devi=
ce *dev,
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
If the hardware comes out of reset with a value of 0 or the bootloader hasn=
't
configured the PLL, will pdiv be 0 here? If so, could this division trigger=
 a
divide-by-zero kernel panic during boot when the CCF calls recalc_rate()?

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

[Severity: Medium]
Since req->rate is a 64-bit unsigned long, does casting it directly to a
32-bit integer via mul_u32_u32() implicitly truncate the rate? If a request=
ed
rate exceeds the 32-bit bounds, could this truncation alias it into a lower
range and bypass boundary limits instead of rejecting the out-of-bounds
request?

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
Does mutating pll_clk->cur_rate here violate the statelessness contract of
the Common Clock Framework? Since determine_rate is invoked during
clk_round_rate() purely to query hypothetical rates, saving the rate to the
device state here could corrupt the driver state if the queried rate is nev=
er
actually applied.

> +
> +	return 0;
> +}
> +
> +static int r9a09g077_cpg_pll3_set_rate(struct clk_hw *hw, unsigned long =
rate,
> +				       unsigned long parent_rate)
> +{
> +	struct pll_clk *pll_clk =3D to_pll(hw);
> +	struct rzv2h_pll_pars *params =3D &pll_clk->pll_parameters;

[Severity: High]
Because pll_parameters is updated in determine_rate() and used here instead
of calculating parameters based on the passed rate argument, does this mean
any rate query (which triggers determine_rate) will overwrite the state and
cause a subsequent set_rate() to program the wrong frequency?

[ ... ]

> +static int r9a09g077_cpg_lcdc_div_determine_rate(struct clk_hw *hw,
> +						 struct clk_rate_request *req)
> +{
> +	struct r9a09g077_lcdc_div_clk *dsi_div =3D to_lcdc_div_clk(hw);
> +	struct clk_hw *mux_hw =3D clk_hw_get_parent(hw);
> +	u8 table[RZT2H_MAX_LCDC_DIV_TABLES] =3D { 0 };
> +	struct rzv2h_pll_div_pars dsi_params;
> +	const struct clk_div_table *div;
> +	struct pll_clk *pll_clk;
> +	unsigned int i =3D 0;
> +	u64 freq_millihz;
> +
> +	/* index 1 is always .pll3 in sel_clk_pll3[] */
> +	pll_clk =3D to_pll(clk_hw_get_parent_by_index(mux_hw, 1));

[Severity: High]
Is there a missing NULL check here? If clk_hw_get_parent_by_index() fails to
resolve the parent clock and returns NULL, to_pll() will calculate an inval=
id
offset. Will this cause a fatal page fault when pll_clk->limits is
dereferenced later in this function?

> +
> +	for (div =3D dsi_div->dtable; div->div; div++) {
> +		if (i >=3D RZT2H_MAX_LCDC_DIV_TABLES)
> +			return -EINVAL;
> +		table[i++] =3D div->div;
> +	}
> +
> +	freq_millihz =3D mul_u32_u32(req->rate, MILLI);

[Severity: Medium]
Similar to the PLL3 determine_rate function, does using mul_u32_u32() here
truncate the 64-bit req->rate and allow out-of-bounds rate requests to bypa=
ss
limits?

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
Is it safe to mutate both the local divider state and the grandparent's PLL
state (pll_clk->cur_rate and pll_parameters) during a stateless query?
Like the issue in r9a09g077_cpg_pll3_determine_rate(), saving this
hypothetical state could overwrite the hardware configuration state if the
rate is just being queried.

[ ... ]

> +static unsigned long
> +r9a09g077_cpg_lcdc_div_recalc_rate(struct clk_hw *hw,
> +				   unsigned long parent_rate)
> +{
> +	struct r9a09g077_lcdc_div_clk *dsi_div =3D to_lcdc_div_clk(hw);
> +	u32 div;
> +
> +	div =3D readl(dsi_div->reg);
> +	div >>=3D GET_SHIFT(dsi_div->conf);
> +	div &=3D clk_div_mask(GET_WIDTH(dsi_div->conf));
> +	div =3D dsi_div->dtable[div].div;

[Severity: Medium]
Should div be used to iterate through the .val members of dtable rather
than being used directly as an array index? Although this might avoid a cra=
sh
if dtable_2_32 sequentially maps values 0-15 to indices 0-15, it seems
fragile and inconsistent with r9a09g077_cpg_lcdc_div_set_rate() which
properly iterates through the array to find the matching divider.

> +
> +	return DIV_ROUND_CLOSEST_ULL(parent_rate, div);
> +}

This is a pre-existing issue, but I noticed a potential Use-After-Free in
r9a09g077_cpg_fselxspi_div_clk_register():

drivers/clk/renesas/r9a09g077-cpg.c:r9a09g077_cpg_fselxspi_div_clk_register=
() {
...
	if (!xspi_div_ops) {
		xspi_div_ops =3D devm_kzalloc(dev, sizeof(*xspi_div_ops), GFP_KERNEL);
...
	init.ops =3D xspi_div_ops;
...
}

[Severity: High]
Since xspi_div_ops is a static pointer but allocated with device-managed
memory (devm_kzalloc), will this memory be freed if the driver is unbound?
On a subsequent rebind, does the static pointer retain its dangling value a=
nd
cause the clock framework to use freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615104845.4122=
868-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D5
