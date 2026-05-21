Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A493ED5C9
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367789; cv=none; b=tvT2o6Q4uANwawUM/tlChy9Sd032SBvAgFxn0yzKqBUIzt/TlkcGGjbB/ZTr64mngNYaAwS6vN/ZvOPPQ+SbpbJXl9g+mloY9/ZmhO8ufg8HZPA3hvTUsa/ndXe/gMWYnxSM/taAfhm1BJLIWgZoLRNcNTNHMbNrLJ/yWM8sBKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367789; c=relaxed/simple;
	bh=m1Y65Lyg2fL4wsYSFCMqbB35FpZU3Z8OCxaF0/KXfDk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hFTaCcTeaEG2bEd3+zg3KPqU+HqrnOpvkNZIfs8N2VD19diqKnRbW7R1rB4S5TjeZ/d2Tlkq12CQDGPKBmSSWDdiR/MkHO0q6TvHFxHcW0LbZlopehZYGMJ3ofLwAJh8nMLx34Zkc2Irhqtl/Lq1Ed7xcKZTvn1XN6aX01T2L1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzHThAUd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzHThAUd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE4B1F000E9;
	Thu, 21 May 2026 12:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779367787;
	bh=ZaX1yRVwoAIQPo5u8yZwxTQxL6Z39uxFZlr7eDcOV4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JzHThAUdcbXu4fIwPnIDPFd3yDUWiDmOx6vTZ65dzh/Uwjf/p0QYINVMm/4BH39rZ
	 wypJF/7oNC3qRMKj47IFyQyTk4dXOyB82vZe6WzclZV54o/YmNhKpnM7+WXezATn57
	 16d870TRgF4HDuIyUR1l3VJ02RdHUuUYaUzO0nz1TUc1Twqig9VN/l0n1tW9Fr4TXG
	 TtT+2tShgj9T5pAJG7l1Y20/mWZmsASmORaDbZaBpUo5+I9A2+PAkg3+NuSICqFpZ+
	 MEvzSvssbGCX78dL9qIqohF5H1kOj2ub5UnjPY5AmR9n9tusL7b4PFw3wQZx2GBY/X
	 h0EMV18zylLTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260521-x1e-csi2-phy-v6-2-9d73d9bd7d20@linaro.org>
References: <20260521-x1e-csi2-phy-v6-2-9d73d9bd7d20@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 12:49:47 +0000
Message-Id: <20260521124947.4BE4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Extensive resource leaks on error paths in power_on and set_clock_=
rates, and missing OPP rate reset in power_off.
- [High] phy_qcom_mipi_csi2_configure overrides the DT-parsed lane count wi=
thout bounds checking against the physical layout.
- [High] Unconditional dereference of pd_list leads to a NULL pointer deref=
erence panic.
- [High] Division by zero occurs if the timer clock rate resolves to 0.
- [High] Settle count calculation can underflow to a very large positive va=
lue.
- [Medium] The ops->lanes_disable callback is omitted in phy_qcom_mipi_csi2=
_power_off.
- [Medium] Clock lane positioning and lane polarities are parsed but entire=
ly ignored.
- [Medium] The probe function allows the absence of an OPP table, but power=
_on strictly requires it.
- [Medium] qcom_csi2_phy_xlate accesses PHY arguments without checking args=
_count.
- [Medium] Unvalidated data-lanes integer from DT can cause an out-of-bound=
s bitwise shift.
--

commit 3c373b3ab7783a677ec4c98f344d8b1c57e2e110
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
existing CAMSS CSI PHY init sequences are imported in order to save time
and effort in later patches.

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 0000000000000..8cdff35be2da9
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
[ ... ]
> +static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_cl=
k_rate)
> +{
[ ... ]
> +	timer_period_ps =3D div_u64(PSEC_PER_SEC, timer_clk_rate);
> +	settle_cnt =3D t_hs_settle_ps / timer_period_ps - 6;

[Severity: High]
Can this subtraction underflow to a very large positive value?

If the system has a low timer clock rate resulting in a high
timer_period_ps, the division could yield a value less than 6. Since
settle_cnt is an unsigned 8-bit integer, wrapping around to a large
value could severely misconfigure the PHY hardware timings.

> +
> +	return settle_cnt;
> +}
[ ... ]
> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *c=
si2phy,
> +					   struct mipi_csi2phy_stream_cfg *cfg)
> +{
[ ... ]
> +	settle_cnt =3D phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2p=
hy->timer_clk_rate);
> +
> +	val =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;

[Severity: Medium]
The commit message states that data-lane and clock lane positioning and
polarity selection are supported. Are the polarity fields ignored here?

It appears the clock lane enable bit is hardcoded and the polarity fields
parsed from the DT are not programmed into the PHY registers.

> +	for (i =3D 0; i < cfg->num_data_lanes; i++)
> +		val |=3D BIT(lane_cfg->data[i].pos * 2);

[Severity: Medium]
Can this result in an out-of-bounds shift?

The pos value is read from the device tree as an unvalidated 32-bit
integer. A malformed DT with large lane positions (e.g. > 15) could
result in a shift value >=3D 32, which is undefined behavior and might
truncate the hardware configuration mask.

> +
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
[ ... ]
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy=
/qualcomm/phy-qcom-mipi-csi2-core.c
> index 0000000000000..d8bdb2dd3c2ac
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
[ ... ]
> +static int
> +phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
> +				   s64 link_freq)
> +{
[ ... ]
> +	opp =3D dev_pm_opp_find_freq_ceil(dev, &opp_rate);
> +	if (IS_ERR(opp)) {

[Severity: Medium]
Since the probe function tolerates -ENODEV for the OPP table, won't
power_on unconditionally fail here if the table is actually missing?

> +		dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\n",
> +			link_freq);
> +		return PTR_ERR(opp);
> +	}
> +
> +	for (int i =3D 0; i < csi2phy->pd_list->num_pds; i++) {

[Severity: High]
What happens to pd_list if CONFIG_PM is disabled?

devm_pm_domain_attach_list() returns 0 when CONFIG_PM is disabled, but
pd_list will remain NULL. This would cause a NULL pointer dereference
here and in phy_qcom_mipi_csi2_power_off().

> +		unsigned int perf =3D dev_pm_opp_get_required_pstate(opp, i);
> +
> +		ret =3D dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i=
], perf);
> +		if (ret) {
> +			dev_err(csi2phy->dev, "Couldn't set perf state %u\n",
> +				perf);
> +			dev_pm_opp_put(opp);
> +			return ret;

[Severity: High]
Does this leak the performance state for previously set domains?=20

If the loop fails on a later iteration, it appears to return without resett=
ing
the domains that were already successfully configured.

> +		}
> +	}
> +	dev_pm_opp_put(opp);
> +
> +	ret =3D dev_pm_opp_set_rate(dev, opp_rate);
> +	if (ret) {
> +		dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
> +		return ret;
> +	}
> +
> +	timer_rate =3D clk_round_rate(csi2phy->timer_clk, link_freq / 4);
> +	if (timer_rate < 0)
> +		return timer_rate;
> +
> +	ret =3D clk_set_rate(csi2phy->timer_clk, timer_rate);
> +	if (ret)
> +		return ret;
> +
> +	csi2phy->timer_clk_rate =3D timer_rate;

[Severity: High]
What if clk_round_rate() returns 0?

If the clock is disabled or misconfigured, timer_rate could be 0. Later,
phy_qcom_mipi_csi2_settle_cnt_calc() calls
div_u64(PSEC_PER_SEC, timer_clk_rate), which would result in a division
by zero and a kernel panic.

> +
> +	return 0;
> +}
> +
> +static int phy_qcom_mipi_csi2_configure(struct phy *phy,
> +					union phy_configure_opts *opts)
> +{
[ ... ]
> +	stream_cfg->link_freq =3D dphy_cfg->hs_clk_rate;
> +	stream_cfg->num_data_lanes =3D dphy_cfg->lanes;

[Severity: High]
Does this blindly overwrite the DT-parsed lane count without bounds
checking against the physical layout?

If a consumer requests more lanes than are physically mapped in the
device tree, the hardware configuration could iterate out-of-bounds of
the initialized array elements, repeatedly applying bitmasks for physical
position 0.

> +
> +	return 0;
> +}
> +
> +static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
> +{
[ ... ]
> +	ret =3D clk_bulk_prepare_enable(csi2phy->soc_cfg->num_clk,
> +				      csi2phy->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks, %d\n", ret);
> +		goto poweroff_phy;
> +	}
> +
[ ... ]
> +poweroff_phy:
> +	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
> +			       csi2phy->supplies);
> +
> +	return ret;

[Severity: High]
Does this error path leak the performance state and OPP rate?

It seems to only disable regulators, completely missing the cleanup for
dev_pm_genpd_set_performance_state() and dev_pm_opp_set_rate().

> +}
> +
> +static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
> +{
> +	struct mipi_csi2phy_device *csi2phy =3D phy_get_drvdata(phy);
> +	int i;
> +
> +	for (i =3D 0; i < csi2phy->pd_list->num_pds; i++)
> +		dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], 0);

[Severity: High]
Does this leave the OPP frequency vote elevated?

It doesn't look like dev_pm_opp_set_rate(dev, 0) is called to release
the OPP frequency vote.

[Severity: Medium]
Is the ops->lanes_disable() callback intentionally omitted here?

Disabling the clocks and regulators without invoking the callback
bypasses the hardware-specific teardown sequence (like clearing
CLK_ENABLE and COMMON_PWRDN_B). Could this leave the PHY in an invalid
logical state for the next power-on cycle?

> +
> +	clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
> +				   csi2phy->clks);
> +	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
> +			       csi2phy->supplies);
> +
> +	return 0;
> +}
[ ... ]
> +static struct phy *qcom_csi2_phy_xlate(struct device *dev,
> +				       const struct of_phandle_args *args)
> +{
> +	struct mipi_csi2phy_device *csi2phy =3D dev_get_drvdata(dev);
> +
> +	if (args->args[0] !=3D PHY_TYPE_DPHY) {

[Severity: Medium]
Can this access uninitialized stack memory?

If the device tree node has #phy-cells =3D <0>, args_count will be 0, and
reading args->args[0] might yield uninitialized memory, leading to
unpredictable behavior or the incorrect rejection of valid PHY bindings.
Should args->args_count be checked first?

> +		dev_err(csi2phy->dev, "mode %d -EOPNOTSUPP\n", args->args[0]);
> +		return ERR_PTR(-EOPNOTSUPP);
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-x1e-csi2-p=
hy-v6-0-9d73d9bd7d20@linaro.org?part=3D2
