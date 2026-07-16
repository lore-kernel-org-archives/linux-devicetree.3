Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF64C33A032
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 22:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784241264; cv=none; b=heRmhHxogjEusho6+J0VRB1iI4ivCgDvv2o2K9Di4w7W5hHD5A0aFs8K5hmPNlTPL1a0Ncu2/8v6OiGOiPnAUjEN/zvUMDsNt14ujPTq5vlym2p56+hgdJH5b136QgNdBy8tJMnYXIqmH0UAoo+JWorHXblzIfDP9XY2YxXQXXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784241264; c=relaxed/simple;
	bh=Qeeaeo0f1pKJadjqphLQalVt4hZik7GVNJsFHA6L6Bg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uYJlHnwLFViDVp5HVdxvR8q8RuIeinjanChvC7amqVWZbeJut27jhURCLyEo0J/Fpr57DI+/6EDGWkM2BZC6bJbovoH+Q8osF3cHZYMHyTKPbQqMnynZdP6K1t0WzUeyJzXeaT1YqsuN3aQzVarWDLRCCRDRc3Fv1jBhYTY8ZR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+mfsKPW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+mfsKPW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEE11F000E9;
	Thu, 16 Jul 2026 22:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784241263;
	bh=wfndBa/KV9A1jJsBUoFL0jdF1YkJjzVO1J5+9ALRkus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K+mfsKPWifwEM7v6tvmdwOb1tQmxWTWA3mfqWdcu2Lu1BTO4mTxraM7slbWR05JZG
	 9BTGB//g1iwSYhgL0ten3wTzZtnJ4wy8uJKOXWAdUs5V/jA8d6XF8fmh1sIBEiDvEK
	 ohj8n9gq30Ve/T/M5yG3VNPC00VECJ0wdtzmew2yacYpVUqsptvz++4gJTYcEfiYrh
	 WKt64Qv+shnOAeXg2Kh9yCdJrqI3jD+ytCsL8PFaL2fwIYHAMvoh4jOwbPUK8KvluL
	 fDcrqCbNXaHVoJskPUOUiwbUnGedGNtQI8s5sNWTCb6VNFGyErDCfnumlvbvWK0yih
	 MrR0RpVaxFGuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 08/13] clk: zte: Add zx PLL support infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org, robh@kernel.org
In-Reply-To: <20260717-zx29clk-v7-8-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-8-408411cfcf36@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 22:34:22 +0000
Message-Id: <20260716223422.ECEE11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] zx29_pll_calc_values fails to clamp out-of-bounds frequencies, cau=
sing rate determination to abort instead of returning the closest achievabl=
e rate.
- [High] .determine_rate does not enforce req->min_rate and req->max_rate b=
oundaries.
- [Medium] Using `dev_info` inside `zx29_pll_set_rate` will spam the kernel=
 log.
--

--- Patch [8]: [PATCH v7 08/13] clk: zte: Add zx PLL support infrastructure=
 ---
commit c3e5de791970b113941346866ebf54af4b186d7d
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Add zx PLL support infrastructure

This commit adds PLL support infrastructure for ZTE zx chips, specifically=
=20
tested with the zx297520v3. It provides the standard clock operations=20
including rate calculation, parent selection, and enabling/disabling=20
of the PLLs.

> diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
> index f8ddb4c7dff66..701e580609f2b 100644
> --- a/drivers/clk/zte/pll-zx.c
> +++ b/drivers/clk/zte/pll-zx.c

[ ... ]

> +static u32 zx29_pll_calc_values(const struct zx29_clk_pll *pll, unsigned=
 long parent_rate,
> +				unsigned long rate)
> +{

[ ... ]

> +	for (j =3D 1; j <=3D postdiv2_max; j++) {
> +		for (i =3D 1; i <=3D postdiv1_max; i++) {
> +			u64 vco =3D (u64)rate * i * j;
> +			unsigned long out;
> +
> +			if (vco > ZX29_PLL_VCO_MAX_FREQ || vco < ZX29_PLL_VCO_MIN_FREQ)
> +				continue;

[Severity: High]
Does this logic fail to clamp out-of-bounds frequencies?

If a consumer requests a clock rate where the maximum evaluated VCO=20
(e.g., 10 MHz * 7 * 7 =3D 490 MHz) is less than ZX29_PLL_VCO_MIN_FREQ,=20
this loop will just continue and return 0.

Should the requested rate be clamped to the physical minimum and maximum=20
achievable bounds before computing the VCO to ensure it returns the closest=
=20
supported rate?

[ ... ]

> +static int zx29_pll_determine_rate(struct clk_hw *hw, struct clk_rate_re=
quest *req)
> +{
> +	struct zx29_clk_pll *pll =3D to_zx29_clk_pll(hw);
> +	unsigned long new_rate;
> +	u32 setting;

[ ... ]

> +	setting =3D zx29_pll_calc_values(pll, req->best_parent_rate, req->rate);
> +	if (!setting)
> +		return -EINVAL;
> +
> +	new_rate =3D zx29_pll_get_rate(pll, req->best_parent_rate, setting);
> +	if (new_rate !=3D req->rate) {
> +		dev_warn(pll->dev, "Did not find an exact match. Want %lu, got %lu\n",
> +			 req->rate, new_rate);
> +		req->rate =3D new_rate;

[Severity: High]
Does this assignment violate the caller's min/max rate constraints?

If the closest hardware rate falls outside the req->min_rate and req->max_r=
ate=20
boundaries, assigning it back to req->rate could cause the clock framework =
to=20
reject the rate change entirely, even if another slightly less optimal but=
=20
in-bounds rate was available.

> +	}
> +
> +	return 0;
> +}
> +
> +static int zx29_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +		      unsigned long parent_rate)
> +{
> +	struct zx29_clk_pll *pll =3D to_zx29_clk_pll(hw);
> +	int res =3D -EINVAL;
> +	u32 setting;
> +
> +	/* PLLs can be changed while they are running and in testing the downst=
ream hardware
> +	 * handles it gracefully - as long as the new rate is a rate the hardwa=
re can operate at.
> +	 */
> +	setting =3D zx29_pll_calc_values(pll, parent_rate, rate);
> +	if (!setting)
> +		return -EINVAL;
> +
> +	if (zx29_pll_get_rate(pll, parent_rate, setting) =3D=3D rate) {
> +		res =3D regmap_update_bits(pll->map, pll->reg, 0x00ffffff, setting);
> +		dev_info(pll->dev, "%s: Setting rate: 0x%08x\n", clk_hw_get_name(hw), =
setting);

[Severity: Medium]
Could this dev_info call cause log spam during dynamic frequency scaling?

If this PLL is used for scaling operations where .set_rate is called=20
hundreds of times per second, this will rapidly flood the kernel log.
Would dev_dbg be more appropriate for this hot path?

> +	}
> +
> +	return res;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-zx29clk-v7=
-0-408411cfcf36@gmail.com?part=3D8
