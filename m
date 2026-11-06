Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973907;
	b=f1F87RN9pMiYpMsodeO/DvRPm2bvA25YHDl3t8NWIq7sWWDjtAI97LUG1uJ0DvnTjrsb
	 vG5QxeDyjqmT1COtaT7NPCriZMu+PFBut3qYshb8Sd95bp2hnHzZorUbwLia4OmKCpJ8q
	 s/MY/TJIXkwMFu59QNOZZa86RO5I98noPDkOBi61BJ7hPuqkD43I5D+d21Y5aj2ejrivq
	 +YpQoDh4KdJTMZusJgolf3+oQYkIc8gyXATAbXJtWdst0sf/w1WrMG6gB2cR5O9k90QwC
	 ld2/3xmXruVNCPr3tc+i4DFIVOBAj3oOHtVTmQzBIeKhik5gxRyJCpQPYc1m2fFjHdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973907;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JLfwMbD8ieMoKHUumYpmrrpv16KRq8OjWRwIwoqLIhM=;
	b=pJXyHcaDf97mCFvYI++LCfiLGELygEpLSdSxKA0GJarQQ0Cku8DB1rf3E3YsLskdTrn5
	 oq4tXol5nT182YF3bIMM9bjn5O5s8md8IJmErAippEYQlYWIK+ntCR3LVoWOdUCdw1nNc
	 Nxq++nmxQcq3DFGIkxZaNI8mski0/4zR4ufcC2sp+fNBDQrHdo/bQKL3SIZDgmeICuaGs
	 12bdvEa4lYEvYQiDErC5bDQdUGnV4O3VPhg0HiFd6HzTQjfFxM45h/+xCZsSrPGUZGdUH
	 2ncpTzUuCUvSDq8rP9a9tTK6LIX/y256Pwey+/LG0NjZfpGQqZT+PdXrgsYRCf+PvIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bzH26ZJR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABF0606A333
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bzH26ZJR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1081F008A1;
	Fri,  6 Nov 2026 14:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793973906;
	bh=JLfwMbD8ieMoKHUumYpmrrpv16KRq8OjWRwIwoqLIhM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bzH26ZJRh9EE+PUgkvxHRxbHNZH9JxHwpCx9HLF/J4A7WRGUHCjHyAYOa5SVGTy8b
	 /oiohiqQwXTVHR70Pw26NFtVtdos/V97tLgIyVgms64HJT3EScRY7eB1NRPvg+u0k4
	 1MUcfFOadvU3nvv8d7d6FdJWu1UmvHAb8+uQPZyPtVWf2LL6BGjwGktBrprfIiCwlp
	 l2AP1wf1WD4VfeX1tqLNrOGO2BQjY+lwlK9KRoHIg5wbO5fleHNCYC4HfNTKzh+Mdf
	 Madtg/qTYqV+ITNUadM7j9xYwrdkd+iw3cRJlnaqxQXSWQkI/iNJtJToMYszkufGQJ
	 rgwRAE68/yN+g==
Message-ID: <sashiko-outbox-201536@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/5] phy: Add common Innosilicon HDMI PHY helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261106-jh7110-inno-hdmi-phy-v7-2-d49368303800@samsung.com>
References: <20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com>
 <CGME20261106135506eucas1p228bf1f8e1cacdc716e6bf22b847f49d9@eucas1p2.samsung.com>
 <20261106-jh7110-inno-hdmi-phy-v7-2-d49368303800@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:05:05 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] phy: inno-hdmi: 32-bit overflow in
  inno_hdmi_phy_pre_pll_recalc_rate()
- [Low] phy: inno-hdmi: unscaled vco_rate logged in
  inno_hdmi_phy_pre_pll_recalc_rate()
--

commit 24c4317981476fc596167091376edec998895a08
Author: Michal Wilczynski <m.wilczynski@samsung.com>

phy: Add common Innosilicon HDMI PHY helpers

This commit adds a helper library for the Innosilicon HDMI PHY pre-PLL,
providing pixel clock lookup, clock rate calculation, and register
programming functions to be shared across SoC drivers.

> diff --git a/drivers/phy/phy-inno-hdmi.c b/drivers/phy/phy-inno-hdmi.c
> new file mode 100644
> index 0000000000000..6900d4d83e464
> --- /dev/null
> +++ b/drivers/phy/phy-inno-hdmi.c

[ ... ]

> +unsigned long
> +inno_hdmi_phy_pre_pll_recalc_rate(const struct inno_hdmi_phy_pre_pll *pl=
l,
> +				  unsigned long parent_rate)
> +{
> +	unsigned int control, div_1, div_2, div_3, pclk_div_ab, pclk_div_cd;
> +	unsigned int frac_div_7_0, frac_div_15_8, frac_div_23_16, div;
> +	u8 nd, no_a, no_b, no_d;
> +	unsigned long frac, rate;
> +	u64 vco, vco_rate;
> +	u16 nf;
> +	int ret;

[ ... ]

> +	nd =3D div_1 & INNO_PRE_PLL_PRE_DIV_MASK;
> +	nf =3D (div_2 & INNO_PRE_PLL_FB_DIV_11_8_MASK) << 8;
> +	nf |=3D div_3;
> +	vco =3D parent_rate * nf;
> +
> +	if (!(div_2 & INNO_PRE_PLL_FRAC_DIV_DISABLE)) {
> +		ret =3D inno_read(pll, INNO_PRE_PLL_FRAC_DIV_7_0, &frac_div_7_0);
> +		if (ret)
> +			goto err;
> +		ret =3D inno_read(pll, INNO_PRE_PLL_FRAC_DIV_15_8, &frac_div_15_8);
> +		if (ret)
> +			goto err;
> +		ret =3D inno_read(pll, INNO_PRE_PLL_FRAC_DIV_23_16,
> +				&frac_div_23_16);
> +		if (ret)
> +			goto err;
> +
> +		frac =3D frac_div_7_0 | (frac_div_15_8 << 8) |
> +		       (frac_div_23_16 << 16);
> +		vco +=3D DIV_ROUND_CLOSEST(parent_rate * frac,
> +					 BIT(INNO_FRAC_DIV_WIDTH));
> +	}

[Severity: Medium]
Can parent_rate * nf and parent_rate * frac overflow on 32-bit
architectures?

Both parent_rate and frac are unsigned long, and nf is u16, so both
multiplications are evaluated in 32-bit arithmetic on 32-bit systems
before widening to u64 vco.  With a 24 MHz reference clock, parent_rate *
nf overflows 32 bits when nf >=3D 179, and parent_rate * frac overflows for
any 24-bit fractional divider entry, causing
inno_hdmi_phy_pre_pll_recalc_rate() to return a corrupted pixel clock
rate.  Casting parent_rate to u64 and using DIV_ROUND_CLOSEST_ULL() would
avoid the truncation.

> +
> +	vco_rate =3D vco;
> +
> +	if (control & INNO_PCLK_VCO_DIV_5_MASK) {
> +		div =3D nd * 5;
> +	} else {
> +		no_a =3D pclk_div_ab & INNO_PCLK_DIV_A_MASK;
> +		no_b =3D FIELD_GET(INNO_PCLK_DIV_B_MASK, pclk_div_ab) + 2;
> +		no_d =3D pclk_div_cd & INNO_PCLK_DIV_D_MASK;
> +
> +		div =3D nd * (no_a =3D=3D 1 ? no_b : no_a) * no_d * 2;
> +	}
> +
> +	/*
> +	 * An unprogrammed pre-PLL reads its dividers back as zero, which would
> +	 * leave do_div() dividing by it.
> +	 */
> +	if (!div) {
> +		dev_dbg(pll->dev, "pre-PLL dividers read back as zero\n");
> +		return 0;
> +	}
> +
> +	do_div(vco, div);
> +
> +	rate =3D DIV_ROUND_CLOSEST((unsigned long)vco, 1000) * 1000;
> +
> +	/* The VCO is only in spec between 1.4 and 3.2 GHz, so log it. */
> +	dev_dbg(pll->dev, "%s rate %lu vco %llu\n", __func__, rate, vco_rate);

[Severity: Low]
Does vco_rate miss the division by the reference pre-divider nd?

Because nd is folded into div rather than applied to vco before vco_rate =3D
vco, dev_dbg() logs nd times the actual VCO frequency whenever prediv > 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-jh7110-inn=
o-hdmi-phy-v7-0-d49368303800@samsung.com?part=3D2
