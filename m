Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD021DF75B
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 03:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779507327; cv=none; b=nGhiI7bIJF5y7zXpBuotmEJ3Fy76sDxV8Fmgk0Vix2LnjPi8TfstErN5bXhl0ucvOjwQTT4BsQoF8Ma3rEN4dUckBirkhwZ3doO2/Lu3B8hHI4lbkXZZqlqQfCffvdFOytk5JB9SlfuWSIzHzWELn9XQV+uMjvX/508Qy8adAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779507327; c=relaxed/simple;
	bh=yS927IdpXmeGmHTcESMY6ya/DW7oJKq+epRQy0d8tvA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gJWUXYbiVzlgy/5h0e2F6hkwW5C77sIDd3yRmq0y3die6F68giLuqyrY6lb8GB4uWgxwp6rYXSVIZK/oVm0DPU0gLJgYsp/V9Ow9DZ0m3lLJ1D4GCD8poFn5TfIkalqCU4vOmj3uP8SVORvEV2hzNQ4N9wg+mhC1+xGv5iW4J0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XISny7sF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XISny7sF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEF51F000E9;
	Sat, 23 May 2026 03:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779507325;
	bh=VRywW5F37j2qV3275543F+fj5bUeRip07uaA/sCyw5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XISny7sFg3fGnOZOCDHvjHr0K795xLBqVap2NwYu8TRDGrqg23Wx5dPo2Xq693vIe
	 kJc9SG60tnCjqbUcO0KpvDEpGANtMyD+4iPbcC3C5VmmAYrHiAQPtTNnB8sDqVqrU6
	 wfZ9bTTj+y38Lfb8idb/kUOJm+Kng0vOQ5E6kZZpCsV89muIKEVTp/5myQ8O7WCKuc
	 t9b4P95VSqpze4v+6gsCYplQ+7esUnA/x261FfnGZajRWYwFBp5dgNLYaz5JU4KczV
	 lHgUFtS4sgEqMZYUbagQTzC0VDYoXsQ9QIcsVh3M8AfA68yBA4LODc0QZfMcU0CqoB
	 k0T2B8W+Nnqbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
References: <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 03:35:24 +0000
Message-Id: <20260523033525.6FEF51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Integer underflow in PHY settle count calculation.
- [High] Missing bounds checking for device tree lane arrays leads to out-o=
f-bounds IO memory writes.
- [High] Unconditional dereference of csi2phy->pd_list can cause a kernel p=
anic if power domains are missing.
- [Medium] Probe ignores -ENODEV from OPP table initialization, but power_o=
n unconditionally fails without it.
- [Medium] qcom_csi2_phy_xlate lacks args_count validation before reading a=
rgs array.
--

commit 66168a7f8131d0b43bbb6d3d1472182c1beff538
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

This commit adds a new MIPI CSI2 driver for DPHY mode, importing CAMSS CSI
PHY init sequences for initial support. The driver handles data/clock lane
configuration and replaces the useless interrupt handler with regulator and
clock bulk APIs.

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> new file mode 100644
> index 0000000000000..86ec405820e62
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
[ ... ]
> +static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_cl=
k_rate)
> +{
> +	u32 t_hs_prepare_max_ps;
> +	u32 timer_period_ps;
> +	u32 t_hs_settle_ps;
> +	u8 settle_cnt;
> +	u32 ui_ps;
> +
> +	if (link_freq <=3D 0)
> +		return 0;
> +
> +	ui_ps =3D div_u64(PSEC_PER_SEC, link_freq);
> +	ui_ps /=3D 2;
> +	t_hs_prepare_max_ps =3D 85000 + 6 * ui_ps;
> +	t_hs_settle_ps =3D t_hs_prepare_max_ps;
> +
> +	timer_period_ps =3D div_u64(PSEC_PER_SEC, timer_clk_rate);
> +	settle_cnt =3D t_hs_settle_ps / timer_period_ps - 6;

[Severity: High]
Can this underflow if the ratio is less than 6?

For example, with a CSI-2 link frequency of 200 MHz, the ratio could evalua=
te
to 5. Subtracting 6 would result in an unsigned integer underflow, yielding=
 255
for the u8 variable. This could cause an inflated settle count to be written
to the PHY registers. Does this calculation need to clamp the result to 0 or
ensure the ratio is greater than or equal to 6?

> +
> +	return settle_cnt;
> +}
[ ... ]
> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *c=
si2phy,
> +					   struct mipi_csi2phy_stream_cfg *cfg)
> +{
[ ... ]
> +	/* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
> +	for (i =3D 0; i < cfg->num_data_lanes; i++) {
> +		if (lane_cfg->data[i].pol) {
> +			u8 pos =3D lane_cfg->data[i].pos;
> +
> +			writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(pos));

[Severity: High]
Does this code perform bounds checking on the device tree lane arrays?

Since the data-lanes and clock-lanes properties from the device tree are
stored in pos without validation, a large pos value could trigger
out-of-bounds IO memory writes via the CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(pos)
offset and BIT(pos) bitwise shift.

> +		}
> +	}
> +
> +	if (lane_cfg->clk.pol)
> +		writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cf=
g->clk.pos));
[ ... ]
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy=
/qualcomm/phy-qcom-mipi-csi2-core.c
> new file mode 100644
> index 0000000000000..dfeff863a406f
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
[ ... ]
> +static int
> +phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
> +				   s64 link_freq)
> +{
> +	struct device *dev =3D csi2phy->dev;
> +	unsigned long opp_rate =3D link_freq / 4;
> +	struct dev_pm_opp *opp;
> +	long timer_rate;
> +	int i, ret;
> +
> +	opp =3D dev_pm_opp_find_freq_ceil(dev, &opp_rate);
> +	if (IS_ERR(opp)) {

[Severity: Medium]
Will this fail unconditionally if the OPP table is missing?

In phy_qcom_mipi_csi2_probe(), the -ENODEV error from
devm_pm_opp_of_add_table() is explicitly ignored, allowing the probe to
succeed even if the device tree lacks an OPP table.=20

However, dev_pm_opp_find_freq_ceil() is called here unconditionally,
which would return an error and cause the power_on routine to fail. Should
we enforce the OPP table presence during probe or handle its absence
gracefully here?

> +		dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\n",
> +			link_freq);
> +		return PTR_ERR(opp);
> +	}
> +
> +	for (i =3D 0; i < csi2phy->pd_list->num_pds; i++) {

[Severity: High]
Can this dereference a NULL pointer if power domains are missing?

If the device tree lacks the power-domains property,
devm_pm_domain_attach_list() returns 0 and leaves csi2phy->pd_list as NULL.
Iterating with csi2phy->pd_list->num_pds without a NULL check would cause
a kernel panic.

> +		unsigned int perf =3D dev_pm_opp_get_required_pstate(opp, i);
[ ... ]
> +static struct phy *qcom_csi2_phy_xlate(struct device *dev,
> +				       const struct of_phandle_args *args)
> +{
> +	struct mipi_csi2phy_device *csi2phy =3D dev_get_drvdata(dev);
> +
> +	if (args->args[0] !=3D PHY_TYPE_DPHY) {

[Severity: Medium]
Should this check args->args_count before accessing the args array?

If a malformed device tree specifies #phy-cells =3D <0>, args_count will be=
 0,
and reading args->args[0] will access uninitialized memory.

> +		dev_err(csi2phy->dev, "mode %d -EOPNOTSUPP\n", args->args[0]);
> +		return ERR_PTR(-EOPNOTSUPP);
> +	}
> +
> +	csi2phy->phy_mode =3D args->args[0];
> +
> +	return csi2phy->phy;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523-x1e-csi2-p=
hy-v8-0-a85668459521@linaro.org?part=3D2
