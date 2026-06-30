Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E79413244
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 16:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782835882; cv=none; b=daX+Hsj/7LihnFdF3JLhPyAI6Mi1d/6faXNnAJg/z7RznUmOyJADrziaU3x2w3+CtuWeeVb9boXJnFZ+0tTLVYj1RBqsi0r2/gNqWPAI3nRzVVvlTSR2IhVdaCU4g35P2tUuCparEjs8ViDq46Gkbk5OkqaQpNsxzFqCQaCeJUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782835882; c=relaxed/simple;
	bh=oBBC/M9QT0fMChiLeB9iMYIvDKzSdCdq1ILNjbDtfVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IlN7bQo3R6z1HvWP5iID5zsdf6fz2H2dsgeSWXC3nItfcu1zKNP+BqBoo9yJ5j5Ug1tFh/x3qLxKA4CT7q0jS+6aMPY8TkYdPeSr3HEEWvha75XFrzj+RvaST2CW+F4Z05b4FjQFt8+HAfGlkMpmwPBd3ZT79str2Ie7DdXvVxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GM+gpEZ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GM+gpEZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020FB1F000E9;
	Tue, 30 Jun 2026 16:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782835881;
	bh=xodYpkK6VutLItdylXRTDrGrIhAcMHlZRAKc9/5RE90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GM+gpEZ2TVLRU7M0EvNJhAd2EQt6Rn8sq+lU3Yk6dFf8fDa8D4c87yeiaCCwFdfw3
	 bpaqZJCTaGJqiQqzhL1M+iHHUJ4OPtqEBbdXADLly4/+pMIHLmmcPX1xoREEyV7azF
	 PCONYtKnwXC9aa9udH8ae8k2SVjkT0AHchPUTrRGzNbCL32GJ8ak4X4H37dJyIkUZc
	 s4Q0K7DsdyiabPYXEkmLJnkJS95233+fO/uPg7tFV8c/UZsPwZ8tBIEhPInX+WTC2c
	 vopMY11jNWvnrOg+e+bqwM3G4YMRAiUpTmIo6pAiHUKi53wdS4ebjqM5YxY9AGUPom
	 +4GM6Q5DA2rNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] clk: cs2600: Add Fractional-N clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Fitzgerald" <rf@opensource.cirrus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260630155549.824059-3-rf@opensource.cirrus.com>
References: <20260630155549.824059-1-rf@opensource.cirrus.com>
 <20260630155549.824059-3-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 16:11:20 +0000
Message-Id: <20260630161121.020FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The `cs2600_unfreeze` guard uses inverted lock/unlock operations, =
leaving the device permanently frozen.
- [High] Clock rates and dividers are updated without the necessary hardwar=
e freeze guard, risking clock glitches.
- [High] Data race on statically defined `parent_names` array in `cs2600_cl=
k_register`.
- [High] The `cs2600_pll_out_recalc_rate` callback returns uninitialized so=
ftware state instead of interrogating the hardware.
- [High] Refcount underflow in `cs2600_pll_out_unprepare` due to early retu=
rn in `cs2600_pll_out_prepare`.
- [Medium] The `determine_rate` callbacks incorrectly return `-EINVAL` and =
emit log spam instead of rounding `req->rate`.
- [Medium] Missing `clk_in` validation in smart mode leads to 0 parents, br=
eaking rate calculation.
--

commit ce7a3c3019cf88623a644142e879bd585ca8f100
Author: Paul Handrigan <paulha@opensource.cirrus.com>

clk: cs2600: Add Fractional-N clock driver

Add driver for the Cirrus Logic CS2600 fractional-N clock synthesizer
and multiplier.

> diff --git a/drivers/clk/cirrus/clk-cs2600.c b/drivers/clk/cirrus/clk-cs2=
600.c
> new file mode 100644
> index 0000000000000..73937ac868fcd
> --- /dev/null
> +++ b/drivers/clk/cirrus/clk-cs2600.c

[ ... ]

> +static void cs2600_clear_freeze(struct cs2600 *cs2600)
> +{
> +	regmap_clear_bits(cs2600->regmap, CS2600_PLL_CFG2, CS2600_FREEZE_EN);
> +}
> +
> +DEFINE_GUARD(cs2600_unfreeze, struct cs2600 *,
> +	     cs2600_clear_freeze(_T), cs2600_set_freeze(_T))

[Severity: High]
Are the lock and unlock operations inverted here?

The macro DEFINE_GUARD takes the _lock (entry) operation first and _unlock
(exit) operation second. The device defaults to an unfrozen state
(FREEZE_EN=3D0). By passing cs2600_clear_freeze as the entry operation, it =
is
initially a no-op, and passing cs2600_set_freeze on exit permanently freezes
the hardware.

Could this cause subsequent writes to critical registers to be ignored or h=
eld
indefinitely, breaking the device configuration?

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

[Severity: High]
Does this function need to interrogate the actual hardware state?

During boot, the Common Clock Framework relies on recalc_rate to determine =
the
active hardware rate. Because cs2600->pll_target_rate initializes to 0, this
will report 0 Hz even if the bootloader previously configured and enabled t=
he
PLL.

Will this break downstream consumers that depend on inheriting the correct
operational clock rate from the hardware?

[ ... ]

> +static int cs2600_pll_out_set_rate(struct clk_hw *hw, unsigned long rate,
> +				   unsigned long parent_rate)
> +{
> +	struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +	struct regmap *regmap =3D clk_hw->priv->regmap;
> +	struct cs2600 *cs2600 =3D clk_hw->priv;
> +	unsigned int ratio, smart_s_ratio;
> +	bool hi_res;
> +	int ret;
> +
> +	ret =3D cs2600_calc_ratio(cs2600, rate, parent_rate, &ratio, &hi_res);

[Severity: High]
Should this function acquire the unfreeze guard before modifying the ratio
registers?

This function performs multiple 16-bit regmap_write operations to update a
32-bit ratio. Without suspending the hardware state machine during these
updates, the chip might briefly operate with a corrupted 32-bit ratio
(half old, half new).

Could this missing guard cause clock glitches, frequency spikes, or a
temporary loss of lock?

[ ... ]

> +static int cs2600_pll_out_prepare(struct clk_hw *hw)
> +{
> +	struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +	struct regmap *regmap =3D clk_hw->priv->regmap;
> +	struct cs2600 *cs2600 =3D clk_hw->priv;
> +	int ret;
> +
> +	ret =3D regmap_test_bits(regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret)
> +		return 0;

[Severity: High]
Will this early return cause a refcount underflow later?

If the PLL is already enabled (for example, by the bootloader), this functi=
on
returns 0 immediately and skips calling clk_prepare_enable(cs2600->ref_clk).

However, cs2600_pll_out_unprepare() unconditionally calls
clk_disable_unprepare(cs2600->ref_clk).=20

When CCF disables an unused clock or a consumer unprepares it, wouldn't the
driver drop a software reference to ref_clk that was never actually acquire=
d,
potentially shutting down the shared reference clock for other hardware?

[ ... ]

> +static int cs2600_bclk_determine_rate(struct clk_hw *hw,
> +				      struct clk_rate_request *req)
> +{
> +	struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +	struct cs2600 *cs2600 =3D clk_hw->priv;
> +
> +	if (req->rate > CS2600_BCLK_OUT_MAX ||
> +	    req->rate < CS2600_BCLK_OUT_MIN) {
> +		dev_err(cs2600->dev, "Invalid bclk rate %lu", req->rate);
> +		return -EINVAL;
> +	}

[Severity: Medium]
Should this callback adjust req->rate to the closest supported frequency
instead of returning -EINVAL?

CCF determine_rate callbacks are expected to round the requested rate.
Returning -EINVAL breaks standard rate negotiation like clk_round_rate().
This also applies to cs2600_fsync_determine_rate().

Also, because consumers routinely request unachievable bounds during initial
rate negotiation, printing a dev_err() here may cause unnecessary kernel
log spam.

[ ... ]

> +static int cs2600_clk_register(struct cs2600 *cs2600)
> +{
> +	static const char *parent_names[2];

[Severity: High]
Is it safe to share this static array across all driver instances without
synchronization?

If multiple CS2600 devices are probed simultaneously via asynchronous probi=
ng
or on independent buses, their probe threads could concurrently overwrite
this static array before calling devm_clk_hw_register().

Would this corrupt the clock topologies, causing one device to register with
the parent names intended for another?

> +	const struct clk_hw *out_clocks_parent;
> +	struct clk_init_data init[ARRAY_SIZE(cs2600->hw)] =3D { };
> +	int ret, i, n, input_num =3D 0;

[ ... ]

> +	/* ref_clk_in is only a parent option in manual mode */
> +	if (!cs2600_is_smart_mode(cs2600))
> +		parent_names[input_num++] =3D __clk_get_name(cs2600->ref_clk);
> +
> +	if (cs2600->clk_in)
> +		parent_names[input_num++] =3D __clk_get_name(cs2600->clk_in);
> +
> +	init[CS2600_PLL_OUT].parent_names =3D parent_names;
> +	init[CS2600_PLL_OUT].num_parents =3D input_num;

[Severity: Medium]
What happens if clk_in is NULL when the device operates in smart mode?

The driver fetches clk_in as optional using devm_clk_get_optional(). If
cs2600_is_smart_mode() is true and clk_in is missing from the device tree,
input_num will be 0.

Registering the PLL with num_parents =3D 0 leaves the PLL without a valid
parent clock in the CCF. Will this cause downstream frequency calculations
to fail or evaluate to 0, despite the hardware relying on an external clock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630155549.8240=
59-1-rf@opensource.cirrus.com?part=3D2
