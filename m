Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C0F2BE057
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905879; cv=none; b=DSWvOYjjk9flCirPUe20G3/sH5Eyu/k1wEG2KXVh/nGrDFe9VeOmNcuL9fANx9TBHRkif/HvluQ64nwU/i/m9r1NrINjnfsZlZWz6KevlCVK0V+gZuFXLraBJWf8xx5Vq2ozFUifm/+XH55mzRqNrQ5tV3ByPuLQCOIFHxcelWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905879; c=relaxed/simple;
	bh=z7+L3VOAjgLHaH4MVkp5aEAF0BoqNl89+uQ1lpmJsIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=alPX+q2o+pfn2LOUUJtJyZXsut6ptlf64IEZxKAHff35+P72CDnBeFO3DqMNxgxoPkPKmkDYvYzd43WnJlyw9AoVHEiHIA92XDFWWfpnq6Y89mlQCi6UImhAB3n8bjsqDexg5YjnkKGDoych7KyrmDa9YhOS17IIdkv6+/k7i/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGOKWcM8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGOKWcM8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0950B1F000E9;
	Fri, 24 Jul 2026 15:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784905876;
	bh=OtFa1vHybmbUf6+hFXgEWvPbQ+NMOmcpHzzu6UPUZmI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dGOKWcM8Pv42bB/IH12uZ7va9lJ2QW2B3F2J4T6rNzE99ZwG+IrswK8rBMGYsxRfg
	 BysfBQr/5RC4PFZqCuMTiReGqPBTBbn+6mecxOdo2t8XeruAYQxfGxYeuYmhsNZeZl
	 82STW+o/1x4zyfIoLMRZixlUmtNhUILfhHEDefv3nqsccXEttcHqaPBYAribg9S8gW
	 lTa1eah131P0MN1Uv1cVBqZzmHxH38KhFw2YMPxAgEd4LzzOYTK4nxasLCrF8HqWW3
	 RTW2f37GDyB+B8DaewIxDnLt0U/LdWXMiZOUhadQWrtUvEszcTqYyTys4DL1+R2JVE
	 o5Q1n1vIzdATA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-6-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-6-a8b8679d215f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 15:11:15 +0000
Message-Id: <20260724151116.0950B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] 64-bit divisor passed to DIV_ROUND_CLOSEST_ULL causes 32-bit trunc=
ation and potential divide-by-zero panics.
- [Medium] Non-atomic register updates when switching to PON mode can cause=
 transient invalid clock states.
- [Medium] `clk_pon_refclk_determine_rate()` returns 0 on invalid rate requ=
ests instead of an error code.
- [Medium] Missing PLL analog soft reset when entering UNIPHY fixed mode.
- [Medium] UNIPHY mode is incorrectly excluded from rate rounding for near-=
match requests.
- [Medium] Missing error check on regmap_read in clk_pon_refclk_recalc_rate=
 leads to use of uninitialized variable.
--

--- Patch [6]: [PATCH 06/12] clk: qcom: ipq-cmn-pll: Add PON reference cloc=
k support ---
commit 66c5c5bce6266424eec1b5f6855bb022b40a0322
Author: Luo Jie <jie.luo@oss.qualcomm.com>

clk: qcom: ipq-cmn-pll: Add PON reference clock support

This commit adds support for the PON reference clock to the IPQ CMN PLL dri=
ver.
The clock supports UNIPHY and PON modes, with configurable dividers.

> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pl=
l.c
> index 020ad12ca1f2b..1ae32052b5634 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c

[ ... ]

> @@ -540,6 +545,155 @@ static struct clk_hw *ipq_cmn_pll_ppe_register(stru=
ct platform_device *pdev,
>  	return &ppe_clk->hw;
>  }
> =20
> +/*
> + * PON (Passive Optical Network) reference clock operations.
> + * The PON refclk is derived from CMN PLL rate / 2, then divided by
> + * a configurable 8-bit divider (1-255).
> + */

[ ... ]

> +static unsigned long clk_pon_refclk_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)
> +{
> +	struct clk_cmn_pll *pon_clk =3D to_clk_cmn_pll(hw);
> +	u32 val, div;
> +
> +	regmap_read(pon_clk->regmap, CMN_PLL_PON_CONFIG, &val);
> +
> +	/* Check if in UNIPHY mode (bit 9 =3D 0) - fixed 31.25 MHz */
> +	if (!(val & CMN_PLL_PON_MODE_SEL))

[Severity: Medium]
Could this use uninitialized memory if the underlying MMIO read fails?

The return value of regmap_read() is a standard negative error code on fail=
ure.
Since it is not checked, val may be left uninitialized if the read fails,
causing garbage clock rates to be returned to the framework.

> +		return 31250000UL;
> +
> +	/* PON mode: calculate from divider */
> +	div =3D FIELD_GET(CMN_PLL_PON_DIV_CTRL, val);
> +	if (WARN_ON_ONCE(!div))
> +		return 0;
> +
> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * div);
> +}
> +
> +static int clk_pon_refclk_determine_rate(struct clk_hw *hw,
> +					 struct clk_rate_request *req)
> +{
> +	unsigned long div;
> +
> +	if (WARN_ON_ONCE(!req->rate))
> +		return 0;

[Severity: Medium]
Should this return a negative error code (like -EINVAL) instead of 0?

Returning 0 tells the Common Clock Framework that the rate request was
successfully determined and adapted, which will cause it to proceed to call
set_rate() with rate =3D 0.

> +
> +	/* UNIPHY fixed mode */
> +	if (req->rate =3D=3D 31250000UL)
> +		return 0;

[Severity: Medium]
Does this exact match prevent near-match rounding to UNIPHY mode?

If a consumer requests 31249999 Hz, it seems it would bypass this exact mat=
ch
and fall back to calculating a PON mode divider. This might yield a worse
rate, even though the hardware inherently supports exactly 31.25 MHz.

> +
> +	div =3D DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * req->r=
ate);

[Severity: High]
Can this cause a divide-by-zero panic on 32-bit platforms?

DIV_ROUND_CLOSEST_ULL() internally uses do_div(), which fundamentally
requires a 32-bit divisor. When the requested rate is large enough,
2ULL * req->rate can exceed 32 bits. On 32-bit platforms, do_div() silently
truncates the 64-bit divisor to 32 bits, which could result in a divisor of=
 0.

> +
> +	/* Clamp to valid range (1-255) */
> +	div =3D clamp_t(unsigned long, div, 1, 255);
> +
> +	req->rate =3D DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * =
div);
> +	return 0;
> +}
> +
> +static int clk_pon_refclk_set_rate(struct clk_hw *hw, unsigned long rate,
> +				   unsigned long parent_rate)
> +{
> +	struct clk_cmn_pll *pon_clk =3D to_clk_cmn_pll(hw);
> +	unsigned long div;
> +	int ret;
> +
> +	if (rate =3D=3D 0)
> +		return -EINVAL;
> +
> +	/* UNIPHY fixed mode (31.25 MHz) */
> +	if (rate =3D=3D 31250000UL)
> +		return regmap_clear_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
> +					 CMN_PLL_PON_MODE_SEL);

[Severity: Medium]
Is it intentional to bypass the analog soft reset here?

The soft reset is performed at the end of the function for PON mode. If
entering UNIPHY mode also requires a soft reset to reliably latch or
stabilize the new clock output, the hardware might be left in an
inconsistent state.

> +
> +	div =3D DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * rate);

[Severity: High]
Can this cause a divide-by-zero panic on 32-bit platforms?

Similar to the determine_rate callback, the 64-bit expression 2ULL * rate
is passed to a macro that expects a 32-bit divisor.

> +	if (div =3D=3D 0 || div > 255)
> +		return -EINVAL;
> +
> +	/* Switch to PON mode */
> +	ret =3D regmap_set_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
> +			      CMN_PLL_PON_MODE_SEL);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
> +				 CMN_PLL_PON_DIV_CTRL,
> +				 FIELD_PREP(CMN_PLL_PON_DIV_CTRL, div));

[Severity: Medium]
Can this sequential update cause transient invalid clock states?

There is a brief window where the mode bit is set to PON mode, but the
divider has not yet been updated. If the previous divider was 0 or
inappropriate, it might expose downstream hardware to an invalid
frequency or glitch.

> +	if (ret)
> +		return ret;
> +
> +	return clk_cmn_pll_ana_soft_reset(pon_clk->regmap);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-qcom_ipq52=
10_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com?part=3D6
