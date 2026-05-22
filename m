Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AE8425CF4
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463667; cv=none; b=f7Yp7a9faW0MY7CNTrwaCMhBw2PlgPDzsveGfKdzix5aG9Q1ILsaifVgKsRXxHk99ARhUmdNb/mIjw5HHhXxxbEutekCscB50KCTdkn8dU2gmMjnjoBlDFaNWQ+enDSoSW5zuFdRUaa43s/XviCymOzmiSNsO41H3VSPzFjkIYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463667; c=relaxed/simple;
	bh=LDAYGZIlPdAcoJ7LOwuTILkn4XiYOZV90CDtnbDZ+xI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mNJxGK6hiP+VfIdHeDJMHfdz2pbsqwn/xiZObiwh94TLWH7pxol7z+Nfe4Q+0ybFuohMJXfaQWOtQ0+ukwJPbxLA20iP7R9jtGYNqK9JyznHpmbiegZlLmlwB6V1lMIfFcaEXN0D4NeOK+e7pnqSZmOIApkjhBAEwtgPnjamFvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4MR/Vs+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4MR/Vs+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F881F000E9;
	Fri, 22 May 2026 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779463664;
	bh=HpNIDhErX6WEl2sahFkCGeg7bgbmEz7YjFWCvdU9JQI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J4MR/Vs+GeKg60oH9YW+RoEobVeWJ1AlN72r1PFXNbPw0FZYEWPp7lMaH0Sw4iRf9
	 UqLPQm+GQeQDt8rgCmocNDo7IpBStk1RyjwoxiWiMwn5Z+UhnF4UtkEF4O/swhGl2R
	 mxyu9gZ67510K5yhUvIxAwrxshqrFTo/6DX1O+Dv5sYGuEm5xlFs8qPsCR4ogoSZyC
	 556CuvKECkepXLgnO5HjfGHdmHRxeVik8HpZsNa6Dm73+ZGOeQjvxmlTn/kzxiRV/z
	 UtgabfB/a/mfmgF47O46CswEZ+1iAC4ZCkjUSWEBOT9Gq6ZICozDz/fwuTNG4QDdhk
	 DrRuD9040QLNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522-x1e-csi2-phy-v7-2-79cb1280fad6@linaro.org>
References: <20260522-x1e-csi2-phy-v7-2-79cb1280fad6@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 15:27:43 +0000
Message-Id: <20260522152743.E1F881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Lane polarity configuration overwrites the same hardcoded register=
 instead of applying per-lane offsets.
- [High] The driver attaches PM domains but fails to enable Runtime PM or p=
ower them on.
- [High] Unconditional dereference of `pd_list` which can be NULL.
- [High] The power-off sequence incorrectly drops the PM domain performance=
 state before disabling clocks and dropping the OPP rate.
- [High] A zero return value from `clk_round_rate()` is incorrectly treated=
 as success, leading to a divide-by-zero panic.
- [Medium] Missing resource cleanup in the error paths of `phy_qcom_mipi_cs=
i2_power_on()`.
- [Medium] Integer underflow in `settle_cnt` calculation.
- [Medium] Unvalidated lane positions from Device Tree lead to undefined be=
havior in bitwise shifts.
- [Low] Missing bounds check on `args_count` in the PHY xlate callback.
--

commit 9960771b4e31e9a37ca7022cc7945264d506b447
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Fri May 22 14:45:10 2026 +0000

phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
existing CAMSS CSI PHY init sequences are imported in order to save time
and effort in later patches.

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> new file mode 100644
> index 0000000000000..1e7729d4ee5d0
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
[ ... ]
> +static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_cl=
k_rate)
> +{
[ ... ]
> +	timer_period_ps =3D div_u64(PSEC_PER_SEC, timer_clk_rate);
> +	settle_cnt =3D t_hs_settle_ps / timer_period_ps - 6;

[Severity: Medium]
Could this underflow if timer_period_ps is large?

Because settle_cnt is an unsigned u8, an underflow here would result in a
large wrap-around value (like 251) being written to the hardware,
corrupting the PHY timing settings.

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
> +	/* Lane position enable in common reg offset */
> +	val =3D BIT(csi2phy->stream_cfg.lane_cfg.clk.pos);
> +	for (i =3D 0; i < cfg->num_data_lanes; i++)
> +		val |=3D BIT(lane_cfg->data[i].pos);

[Severity: Medium]
Is it possible for unvalidated lane positions from the Device Tree to
cause undefined behavior here?

If a parsed position value is >=3D 32, this might result in an invalid
shift. Additionally, since val is a u8, any position >=3D 8 would
silently truncate to 0 and fail to enable the lane.

> +
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
> +
> +	/* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
> +	for (i =3D 0; i < cfg->num_data_lanes; i++) {
> +		if (lane_cfg->data[i].pol) {
> +			writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRLn(9));

[Severity: High]
Does this overwrite the same hardcoded register for all lanes?

Since CSIPHY_2PH_LN_CSI_2PHASE_CTRLn(9) expands to a static offset, this
repeatedly writes to lane 0's polarity register regardless of which lane
is being configured, and seems to ignore the clock lane polarity setting
entirely.

> +		}
> +	}
> +
[ ... ]
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy=
/qualcomm/phy-qcom-mipi-csi2-core.c
> new file mode 100644
> index 0000000000000..578926bfaef45
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
[ ... ]
> +static int
> +phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
> +				   s64 link_freq)
> +{
[ ... ]
> +	for (i =3D 0; i < csi2phy->pd_list->num_pds; i++) {

[Severity: High]
Can pd_list be NULL here?

If CONFIG_PM_GENERIC_DOMAINS is disabled, devm_pm_domain_attach_list()
returns 0 but leaves csi2phy->pd_list as NULL. This would lead to a
kernel panic when dereferencing pd_list->num_pds.

> +		unsigned int perf =3D dev_pm_opp_get_required_pstate(opp, i);
> +
> +		ret =3D dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i=
], perf);
[ ... ]
> +	timer_rate =3D clk_round_rate(csi2phy->timer_clk, link_freq / 4);
> +	if (timer_rate <=3D 0) {
> +		ret =3D timer_rate;
> +		goto unset_opp_rate;

[Severity: High]
If clk_round_rate() returns 0, does this incorrectly treat it as a success?

Setting ret to 0 and jumping to unset_opp_rate would leave timer_clk_rate
as 0, which later causes a divide-by-zero panic in
phy_qcom_mipi_csi2_settle_cnt_calc().

> +	}
> +
> +	ret =3D clk_set_rate(csi2phy->timer_clk, timer_rate);
[ ... ]
> +static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
> +{
[ ... ]
> +	ret =3D clk_bulk_prepare_enable(csi2phy->soc_cfg->num_clk,
> +				      csi2phy->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks, %d\n", ret);
> +		goto unset_rate;
> +	}
> +
> +	ops->reset(csi2phy);
[ ... ]
> +unset_rate:
> +	dev_pm_opp_set_rate(csi2phy->dev, 0);

[Severity: Medium]
Does this error path miss cleaning up the PM domain performance states?

While it drops the OPP rate and regulator votes, it completely skips
unwinding the performance states that were elevated during
phy_qcom_mipi_csi2_set_clock_rates(), leaking the votes.

> +
> +poweroff_phy:
> +	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
> +			       csi2phy->supplies);
> +
> +	return ret;
> +}
> +
> +static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
> +{
> +	struct mipi_csi2phy_device *csi2phy =3D phy_get_drvdata(phy);
> +	const struct mipi_csi2phy_hw_ops *ops =3D csi2phy->soc_cfg->ops;
> +	int i;
> +
> +	ops->lanes_disable(csi2phy, &csi2phy->stream_cfg);
> +
> +	for (i =3D 0; i < csi2phy->pd_list->num_pds; i++)
> +		dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], 0);
> +
> +	clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
> +				   csi2phy->clks);

[Severity: High]
Is this sequence dropping the PM domain performance state before
disabling the clocks?

Removing the voltage (performance state) while hardware logic is still
driven by high-frequency clocks can cause logic timing failures and system
hangs.

Also, similarly to phy_qcom_mipi_csi2_set_clock_rates(), accessing
pd_list->num_pds unconditionally here could panic if pd_list is NULL.

> +	dev_pm_opp_set_rate(csi2phy->dev, 0);
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

[Severity: Low]
Can we add a bounds check for args->args_count here?

If a malformed Device Tree node specifies #phy-cells =3D <0>, this will
read uninitialized memory from the args array.

> +		dev_err(csi2phy->dev, "mode %d -EOPNOTSUPP\n", args->args[0]);
> +		return ERR_PTR(-EOPNOTSUPP);
> +	}
[ ... ]
> +static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to attach power-domain list\n");

[Severity: High]
Are we missing Runtime PM initialization for the attached PM domains?

devm_pm_domain_attach_list() creates virtual devices, but without
pm_runtime_enable() and pm_runtime_get_sync(), these domains remain
suspended. As a result, any dev_pm_genpd_set_performance_state() votes
are just cached and never applied to the hardware, leaving the PHY
unpowered.

> +
> +	for (i =3D 0; i < num_clk; i++)
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-x1e-csi2-p=
hy-v7-0-79cb1280fad6@linaro.org?part=3D2
