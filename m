Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7137D378D87
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118844; cv=none; b=SicMEpfsBsERmrdhHvdTRTz1HafcoSQ0UHvxZ1h/Q8gsFwGBfwQ4Oqujk3La6qju4Q9A8UZ4oeQEmjMFDoSsgPRvu0znFEqZdMiBlBcvLOPR0cW755BG559XHyTjx3biZYpZ2buUOcMEYhGLN5VKpxntG1hPZglVyHKUIIyEZBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118844; c=relaxed/simple;
	bh=gmd3jyCBfrSxS1tftrRdPxW7LKnKnrkbkjIZEvQH0PI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T19flewK+hRg4VpKZgUXjyBFGcwKRuIQD6HCcbzsrD5hHU1ne5W3zxQV8vn3dx2bq8If17ZF6NSh2o/e+9u/Dc7erm3O4W/zGsVU/TYXMMWbL6O7yrsNs16FRjqtVwON7LSXuwhlgLSvdK2AVwcOwXEEkYX8/BkEQlCSCPeIXgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+tmiwFC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+tmiwFC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2B51F000E9;
	Fri,  7 Aug 2026 16:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786118843;
	bh=fdDoQzEPWLHZ+rkDNDoWvMXm0RRc3CKizctkmmT0RIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V+tmiwFCgQWI11tlfKCGoy9MCRJVSzryetlNiCdwU+v5dKlQqS3id5bK+C39GnVV8
	 UGNk1l0qhSYZSAAuidSJF87rSiLiGbysJn3jJbNzqM5ZxxqR/y/wEOV3TSFqcWjgb3
	 mqXPlkx0+QoDfRf3Wl+x6YnbUOaS5oCFwAEBrdYn1Q8rBJC8X+m8ATPZJhOYeeCBnv
	 Te/R4NQu9wwcNBj4v7Ci6VUZy1wKB1BwZT5XySIYSMJG7m3wU3ksd7eZDwsbAJUOp5
	 IeJmIgd3agPMXWk9uXIjHzlRq1EZcecObu9jjUpJNlxXORVEk1i82l5O925/k7dybE
	 FL+JUWGX0/zkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] clk: cs2600: Add Fractional-N clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Fitzgerald" <rf@opensource.cirrus.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807155406.752721-3-rf@opensource.cirrus.com>
References: <20260807155406.752721-1-rf@opensource.cirrus.com>
 <20260807155406.752721-3-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 16:07:21 +0000
Message-Id: <20260807160722.4E2B51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The driver fails to toggle the FREEZE_EN bit after writing to froz=
en registers, preventing new configurations from taking effect.
- [Medium] cs2600_pll_out_recalc_rate computes a new theoretical ratio inst=
ead of querying the actual hardware frequency.
- [Medium] The driver exposes the internal PLL_OUT clock to consumers despi=
te explicit comments intending to restrict it.
- [Medium] dev_err is inappropriately called in determine_rate and ratio ca=
lculations for unsupported parameters, causing log spam.
--

--- Patch [2]: [PATCH v7 2/3] clk: cs2600: Add Fractional-N clock driver ---
commit 75202f90081b654ba7061c4d517a6849df860547
Author: Paul Handrigan <paulha@opensource.cirrus.com>

    clk: cs2600: Add Fractional-N clock driver
   =20
    Add driver for the Cirrus Logic CS2600 fractional-N clock synthesizer
    and multiplier.

> diff --git a/drivers/clk/cirrus/clk-cs2600.c b/drivers/clk/cirrus/clk-cs2=
600.c
> new file mode 100644
> index 0000000000000..977a4bf3c31dc
> --- /dev/null
> +++ b/drivers/clk/cirrus/clk-cs2600.c
[ ... ]
> +static int cs2600_calc_ratio(struct cs2600 *cs2600,
> +			     unsigned long rate,
> +			     unsigned long parent_rate,
> +			     unsigned int *ratio_out,
> +			     bool *hi_res)
> +{
[ ... ]
> +	if (ratio > CS2600_12_20_RATIO_MAX) {
> +		*hi_res =3D false;
> +		ratio >>=3D (CS2600_12_20_SHIFT - CS2600_20_12_SHIFT);
> +
> +		if (ratio > CS2600_20_12_RATIO_MAX) {
> +			dev_err(cs2600->dev, "Ratio %lu:%lu too large\n", parent_rate, rate);

[Severity: Medium]
Will this dev_err() trigger during normal speculative CCF operations like
clk_round_rate()? If determine_rate() passes an unachievable rate, this cou=
ld
spam the kernel log.

[ ... ]
> +static unsigned long cs2600_pll_out_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)
> +{
> +	struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +	struct cs2600 *cs2600 =3D clk_hw->priv;
> +
> +	if ((parent_rate =3D=3D 0) || (cs2600->pll_target_rate =3D=3D 0))
> +		return 0;
> +
> +	if (parent_rate =3D=3D cs2600->pll_parent_rate)
> +		return cs2600->pll_target_rate;
> +
> +	return cs2600_calc_rounded_integer_rate(cs2600, parent_rate, cs2600->pl=
l_target_rate);

[Severity: Medium]
Does this bypass hardware querying? The CCF expects recalc_rate() to query
the physical hardware to inherit settings (like those from the bootloader)
and report the current state.

By returning a computed rate based on the uninitialized software variable
pll_target_rate, won't CCF assume the hardware is running at 0Hz until
set_rate() is explicitly called?

[ ... ]
> +static int cs2600_pll_out_set_rate(struct clk_hw *hw, unsigned long rate,
> +				   unsigned long parent_rate)
> +{
[ ... ]
> +	ret =3D cs2600_write_ratio(cs2600, CS2600_RATIO_SLOT_1, ratio);

[Severity: High]
Is a step to toggle FREEZE_EN missing here? The commit message states
FREEZE_EN is toggled after writing to frozen bits. Since CS2600_FREEZE_EN
is never actually used in the code, won't these writes remain trapped in the
holding buffer and fail to update the active hardware registers?

[ ... ]
> +static int cs2600_pll_out_set_parent(struct clk_hw *hw, u8 index)
> +{
[ ... ]
> +	ret =3D regmap_update_bits(regmap, CS2600_PLL_CFG2, CS2600_PLL_MODE_SEL,
> +				 index);

[Severity: High]
Does this also need to toggle FREEZE_EN to latch the mode selection into the
active registers?

[ ... ]
> +static int cs2600_bclk_determine_rate(struct clk_hw *hw,
> +				      struct clk_rate_request *req)
> +{
[ ... ]
> +	div_index =3D cs2600_get_clk_div_index(cs2600_bclk_div, req->rate, req-=
>best_parent_rate);
> +	if (div_index < 0) {
> +		dev_err(cs2600->dev, "BCLK_OUT cannot be derived from the parent rate"=
);

[Severity: Medium]
Since determine_rate() is often called speculatively, could this dev_err()
fill the kernel log when CCF tests unachievable rate requests?

[ ... ]
> +static int cs2600_fsync_determine_rate(struct clk_hw *hw,
> +				       struct clk_rate_request *req)
> +{
[ ... ]
> +	div_index =3D cs2600_get_clk_div_index(cs2600_fsync_div, req->rate, req=
->best_parent_rate);
> +	if (div_index < 0) {
> +		if (req->best_parent_rate)
> +			dev_err(cs2600->dev, "FSYNC_OUT cannot be derived from the parent rat=
e");

[Severity: Medium]
Could this dev_err() also spam the log during speculative rate queries?

[ ... ]
> +static struct clk_hw *cs2600_of_clk_get(struct of_phandle_args *clkspec,
> +					void *data)
> +{
> +	unsigned int index =3D clkspec->args[0];
> +	struct cs2600 *cs2600 =3D data;
> +
> +	/* PLL_OUT is an internal clock */
> +	if (index > CS2600_OUT_CLK_MAX - 1) {

[Severity: Medium]
Does this actually prevent consumers from requesting the internal PLL_OUT
clock?

The bounds check allows index =3D=3D CS2600_PLL_OUT (which is 0), potential=
ly
allowing external device tree nodes to bypass the output clocks and
manipulate the internal PLL directly.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807155406.7527=
21-1-rf@opensource.cirrus.com?part=3D2
