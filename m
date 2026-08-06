Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991A4435521
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009557; cv=none; b=KUnbJks2Pg6zra9bug9MnlaOMOIz2u5W8zdP2ha/mcQTTgs8aGwA9AUT3bGBOwmrAgJrWqYl0TBQrx1+QJPTd9NxDUvFU7wKURy+1lXJu6Q0a4anmQW3DzmGhMvyoGZK6DwLmIXDN20YyqgxJKp3xifPXJugirY721XGNexG0sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009557; c=relaxed/simple;
	bh=i5sUnHPTwyStnAfKhrt5vgiqlIDOIt5vQzGaS6+eoTQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rpzr7zbijyryErE3mMXh7MOrdYL3gZqS7Po1kSp28z1L7+XXg/G/vYm+TNhDpAUAyoig9fT78lcbr2gU+IB++G7syvgsykFglH9S4G2pNKzJztVDdFvYIn/qRL0wZKiuQMeo3GEgjNIu9lCw/suefr90VDLQOWHg3+6XArj2Xdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBUXBkHB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBUXBkHB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0161F00A3A;
	Thu,  6 Aug 2026 09:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786009555;
	bh=YLipMrm5pTnU/LnlCxvqoxJeLbp34f/sXqAyahB6jjo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IBUXBkHBOKd+ieHgLDnh83eRhhgUl71VZHYTeUCoWVW9n+gPRIqyYHaTHIIVBneef
	 X5itJgECardH/hdg0J85qEC8F2QagI0LbE2YU8MuC74j2KAytm5+3tbKqRIRVq1n9L
	 ZcnUbnD2h98BOAAgfV5xGPhsCtYibMu6quHxy18OEHUrDRL983DJNqka5QEpZF2j3N
	 n+Frk46zvJbtdKTnU59AHlD774UsdG2jUcG837FsKOkxe6CVnIvAskJJ5MtBxje8bG
	 iqbOx+2elCvEnOq2EV4X3HRsU9l188RDrnLBE8EOdVpWt1dGrwe44ZpI7wLJO+p2d3
	 ISUtAp4qgioGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/10] clk: ambarella: add CV75 CCU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-6-6b09707c5fe9@ambarella.com>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-6-6b09707c5fe9@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:45:53 +0000
Message-Id: <20260806094554.CB0161F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] `do_div()` is incorrectly used on `unsigned long` variables, causi=
ng stack memory corruption on 32-bit architectures.
- [High] The generic divider implementation contains logic bugs that cause =
it to check the wrong bit for status, fail to disable clocks, and corrupt d=
ivider values.
- [High] A zero or invalid parent rate causes a fatal divide-by-zero panic =
during PLL parameter calculation.
- [High] Infinite loop in `amb_pll_calc_params` when `parent_rate` is small=
er than the maximum post-divider.
- [Medium] `amb_pll_calc_params` omits static `fsdiv` and `fsout` dividers =
from its rational target approximation, resulting in incorrect rates.
- [Medium] `amb_pll_set_rate` fails to apply `pre_scaler` and `post_scaler`=
 to target calculations, breaking rate configurations.
- [Medium] Stale hardware register read causes the incorrect VCO range to b=
e selected for fractional PLL modes.
- [Medium] Integer PLL rates are unnecessarily restricted to coarse multipl=
es of `parent_rate / 2`.
--

--- Patch [6]: [PATCH v2 06/10] clk: ambarella: add CV75 CCU driver ---
commit 3c34aa8f15f802b4bcbd9606eec16b27a37dd8d9
Author: Long Zhao <longzhao@ambarella.com>

clk: ambarella: add CV75 CCU driver

This commit adds a minimal Ambarella clock controller driver for the CV75 S=
oC,
providing core PLL, bus, and UART clocks required for early console bring-u=
p.

> diff --git a/drivers/clk/ambarella/ccu_mux_div.c b/drivers/clk/ambarella/=
ccu_mux_div.c
> new file mode 100644
> index 0000000000000..33430506f8ed1
> --- /dev/null
> +++ b/drivers/clk/ambarella/ccu_mux_div.c
[ ... ]
> +static unsigned long amb_div_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct amb_div *div =3D to_amb_div(hw);
> +	unsigned long rate;
> +	u32 val;
> +
> +	regmap_read(div->map, div->offset, &val);
> +
> +	if (val & BIT(div->width))
> +		return 0;

[Severity: High]
Does this check the correct bit? The code checks BIT(div->width) directly
against the raw register value before shifting it by div->shift. If
div->shift is non-zero, this evaluates the wrong hardware bit.

> +
> +	val >>=3D div->shift;
> +	val &=3D clk_div_mask(div->width);
> +
> +	rate =3D divider_recalc_rate(hw, parent_rate, val, NULL,
> +				   div->flags, div->width);
> +	if (div->fix_divider)
> +		do_div(rate, div->fix_divider);

[Severity: High]
Can this cause a stack buffer overflow on 32-bit architectures? The do_div
macro expects a 64-bit u64 pointer. Because this driver can be built for
32-bit targets via COMPILE_TEST, unsigned long is 32 bits on those systems.
Passing a 32-bit variable causes the macro to write 64 bits, overwriting
adjacent stack memory.

> +
> +	return rate;
> +}
> +
> +static int amb_div_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
> +{
[ ... ]
> +	req->rate =3D scaled.rate;
> +	req->best_parent_rate =3D scaled.best_parent_rate;
> +	req->best_parent_hw =3D scaled.best_parent_hw;
> +	if (div->fix_divider)
> +		do_div(req->rate, div->fix_divider);

[Severity: High]
Could this corrupt the adjacent fields in the clk_rate_request struct? The
do_div macro writes 64 bits to req->rate, which is an unsigned long and
thus only 32 bits on 32-bit builds.

> +
> +	return 0;
> +}
> +
> +static int amb_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct amb_div *div =3D to_amb_div(hw);
> +	int val, mask;
> +
> +	if (div->fix_divider)
> +		rate *=3D div->fix_divider;
> +
> +	if (!rate) {
> +		val =3D BIT(div->width);
> +	} else {
> +		val =3D divider_get_val(rate, parent_rate, NULL,
> +				      div->width, div->flags);
> +		if (val < 0)
> +			return val;
> +	}
> +
> +	mask =3D (div->flags & CLK_DIVIDER_ONE_BASED) ?
> +		clk_div_mask(div->width + 1) : clk_div_mask(div->width);
> +
> +	regmap_update_bits(div->map, div->offset, mask << div->shift,
> +			   val << div->shift);

[Severity: High]
Can this prevent the clock from being disabled? The update mask for
zero-based dividers uses clk_div_mask(div->width), which excludes
BIT(div->width). When setting a rate of 0, val evaluates to BIT(div->width),
but it gets masked out here, silently leaving the clock enabled with a zero
divider.

> +
> +	if (!(div->flags & CLK_DIVIDER_ONE_BASED)) {
> +		regmap_update_bits(div->map, div->offset, BIT(0), BIT(0));
> +		regmap_update_bits(div->map, div->offset, BIT(0), 0);
> +	}

[Severity: High]
Will toggling BIT(0) directly on the register corrupt the actual divider
field if div->shift is 0?

> diff --git a/drivers/clk/ambarella/ccu_pll.c b/drivers/clk/ambarella/ccu_=
pll.c
> new file mode 100644
> index 0000000000000..1293836e222e5
> --- /dev/null
> +++ b/drivers/clk/ambarella/ccu_pll.c
[ ... ]
> +static int amb_pll_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
> +{
> +	struct amb_pll *pll =3D to_amb_pll(hw);
> +	unsigned long half_refclk =3D req->best_parent_rate / 2;
> +
> +	if (pll->frac_mode)
> +		return 0;
> +
> +	if (!half_refclk)
> +		return 0;

[Severity: High]
If the best parent rate is 0 or 1, half_refclk evaluates to 0, returning 0
(success). Doesn't this allow a 0 parent rate to reach amb_pll_set_rate,
which then calls amb_pll_calc_params and triggers a divide-by-zero panic?

> +
> +	req->rate =3D roundup(req->rate, half_refclk);
> +
> +	return 0;
> +}

[Severity: Medium]
Does this artificially restrict the integer PLL solver? By forcibly rounding
up the requested frequency to multiples of parent_rate / 2, this prevents
the framework from utilizing the fine-grained post-divider (sout) inside
amb_pll_calc_params to generate precise integer ratios.

> +static int amb_pll_calc_params(struct amb_pll *pll, unsigned long rate,
> +			       unsigned long parent_rate, u32 ctrl2_val,
> +			       u32 *intp, u32 *sdiv, u32 *sout,
> +			       u32 *vcodiv, u32 *fsdiv, u32 *fsout)
> +{
[ ... ]
> +	max_numerator =3D min(128UL, max_numerator);
> +	if (!max_numerator)
> +		return -EINVAL;
> +
> +	max_denominator =3D AMB_PLL_MAX_SOUT;
> +	rate_tmp =3D rate;
> +	rational_best_approximation(rate_tmp, parent_rate, max_numerator,
> +				    max_denominator, &intp_ul, &sout_ul);

[Severity: Medium]
Should the rate approximation factor in the static fsdiv and fsout dividers?
The rational_best_approximation is called assuming the output rate
relationship is solely parent_rate * intp / sout. Because the true hardware
equation includes fsdiv and fsout, omitting them from the target ratio
approximation results in incorrectly calculated parameters.

> +
> +	while (parent_rate * *fsdiv * intp_ul * *sdiv / *fsout / sout_ul >
> +	       rate) {
> +		unsigned long resolution =3D parent_rate / AMB_PLL_MAX_SOUT;
> +
> +		if (rate_tmp <=3D resolution)
> +			return -EINVAL;
> +
> +		rate_tmp -=3D resolution;

[Severity: High]
Is there a risk of an infinite loop here if parent_rate is very low? If
parent_rate is less than AMB_PLL_MAX_SOUT (16), resolution truncates to 0.
Subtracting 0 leaves rate_tmp unchanged, causing the loop condition to
evaluate as permanently true.

> +		rational_best_approximation(rate_tmp, parent_rate,
> +					    max_numerator, max_denominator,
> +					    &intp_ul, &sout_ul);
> +	}
[ ... ]
> +static int amb_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct amb_pll *pll =3D to_amb_pll(hw);
[ ... ]
> +	ret =3D amb_pll_calc_params(pll, rate, parent_rate, ctrl2_val,
> +				  &intp, &sdiv, &sout, &vcodiv, &fsdiv,
> +				  &fsout);

[Severity: Medium]
Should this adjust the requested rate and parent_rate using the hardware
pre_scaler and post_scaler? Unlike amb_pll_recalc_rate which reads these
scalers from hardware registers, amb_pll_set_rate passes the raw rate and
parent_rate directly into amb_pll_calc_params, which will configure the PLL
clocks to incorrect frequencies.

> +	if (ret)
> +		return ret;
> +
> +	if (soc_data->ctrl2_val)
> +		regmap_write(pll->map, reg[CTRL2_OFFSET], soc_data->ctrl2_val);
> +
> +	ctrl_val =3D ((intp - 1) & 0x7f) << 24;
> +	ctrl_val |=3D ((sdiv - 1) & 0xf) << 12;
> +	ctrl_val |=3D ((sout - 1) & 0xf) << 16;
> +	if (soc_data->pll_version >=3D 2) {
> +		ctrl_val |=3D vcodiv =3D=3D 2 ? soc_data->vcodiv_val : 0;
> +		ctrl_val |=3D fsdiv =3D=3D 2 ? soc_data->fsdiv_val : 0;
> +		ctrl_val |=3D fsout =3D=3D 2 ? soc_data->fsout_val : 0;
> +	}
> +
> +	regmap_write(pll->map, reg[CTRL_OFFSET], ctrl_val);
> +	regmap_write(pll->map, reg[FRAC_OFFSET], 0);
> +
> +	old_rate =3D amb_pll_recalc_rate(hw, parent_rate) * pll->fix_divider;
> +	rate_tmp =3D old_rate > rate ? 0 : rate - old_rate;
> +	if (rate_tmp && pll->frac_mode) {
> +		u64 dividend, divider;
> +
> +		dividend =3D (u64)rate_tmp * sout * fsout;
> +		dividend <<=3D 32;
> +		divider =3D (u64)sdiv * fsdiv * parent_rate;
> +		frac_val =3D DIV_ROUND_CLOSEST_ULL(dividend, divider);
> +		regmap_write(pll->map, reg[FRAC_OFFSET], frac_val);
> +		ctrl_val |=3D CTRL_FRAC_MODE;
> +	}
> +
> +	if (soc_data->pll_version >=3D 2) {
[ ... ]
> +	} else {
> +		u32 fvco_mhz, range;
> +
> +		fvco_mhz =3D amb_pll_calc_vco(pll, parent_rate) / 1000000UL;

[Severity: Medium]
Does amb_pll_calc_vco() use a stale hardware register read to determine the
VCO frequency? The CTRL_FRAC_MODE bit is enabled in the local ctrl_val
variable above, but not yet written to the hardware register. When
amb_pll_calc_vco() reads the register directly, it misses the uncommitted
fractional change, which can lead to the driver selecting the wrong
VCO_RANGE boundary.

> +		for (range =3D 0; range < ARRAY_SIZE(soc_data->vco_range);
> +		     range++) {
> +			if (fvco_mhz > soc_data->vco_range[range])
> +				break;
> +		}
> +		range =3D ARRAY_SIZE(soc_data->vco_range) - range - 1;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-longzhao-u=
pstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com?part=3D6
