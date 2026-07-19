Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BAA11CA9
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784469562; cv=none; b=AMRI5rMc8QGjslv/MUxRBgrELX+o3bmLSInnKZ6f3CvlH0JOUUWYEtd8buTmpi3inFiJpBzCKL0lgSg093QMFr9oowfCFaHSP8z9jEWBGKbr1upTb9pKl/feDfetwCmVdqGWFbJMS9i90jxXNuf7koDwkDCwfLDOXchu7ayixw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784469562; c=relaxed/simple;
	bh=rpW1EhrV+pkOK/vL38Q327sJVXenkaF3fJZD5k2ECII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hl5pSgvXbJbrAg5/nJfAWjiRKZ/9WYtz9L9zzkPZuyDjCAgOzmYhsvbeffbJ2geLUhSv9trILeKuD+lr1R8HbwU0cYE4kqAgkzCASQwPo8xiXgukaBCcQ7TU5Pil70LSfeoCkkzg9xHNUzMlFvR1HbPHENfsdlD2YKHgLSnTekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbiDmX3l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbiDmX3l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2195A1F00A3A;
	Sun, 19 Jul 2026 13:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784469560;
	bh=D4euhyKxSH+o9FUQlL4NSW614rpSVbu7d4mZO2wvMkc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CbiDmX3lnOdkHx1cJLBS38kHtmZzRsdiXUnzhFrrzlmfqKEuAgGmfHpoHiKHRRhMC
	 6Ia0qRWhdGoZYuIuKAg4Vs597eB/dC0lUuRtWT/9Xfovz2ZbxhrarH1m8bX2S49Id7
	 rn2E8CLzSwe0MCafgTnVVEHMpMK/DzYpeJ2fO8M5bzG8ZZfsv2MX01kpS85qjONSkW
	 4ZMcesLKV8EImlgsVeOsRACwvxtyIDmrSdfAahmV3SAOcSM1fhIDsK4TGCbd7JmbPm
	 BAD+t4r616T83WyVcc6Gzd3U+j7+h9sbPOZnJ8PCOBazgHTi0kA2OMkDOFY3hm5UkP
	 vGGO312gKZY5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: robh@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com
In-Reply-To: <20260719-x1e-csi2-phy-v12-2-cc7311326d1b@linaro.org>
References: <20260719-x1e-csi2-phy-v12-0-cc7311326d1b@linaro.org>
 <20260719-x1e-csi2-phy-v12-2-cc7311326d1b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 13:59:19 +0000
Message-Id: <20260719135920.2195A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Valid calculated settle_cnt of 0 is erroneously rejected as an err=
or, causing PHY initialization to fail.
- [High] Potential NULL pointer dereference in clock name comparison during=
 probe when parsing malformed device trees.
- [Medium] Missing PM_OPP Kconfig dependency causes unconditional runtime p=
robe failures.
--

--- Patch [2]: [PATCH v12 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY dr=
iver ---
commit 7fdedc509474184e47a62af468ae08b71f96dfd5
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

This commit adds a new MIPI CSI2 driver in DPHY mode. It imports existing
CAMSS CSI PHY initialization sequences to support devices like the
qcom,x1e80100-csi2-phy.

> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 60a0ead127fa9..779a3511ba852 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -28,6 +28,20 @@ config PHY_QCOM_EDP
>  	  Enable this driver to support the Qualcomm eDP PHY found in various
>  	  Qualcomm chipsets.
> =20
> +config PHY_QCOM_MIPI_CSI2
> +	tristate "Qualcomm MIPI CSI2 PHY driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on OF
> +	depends on PM
> +	depends on COMMON_CLK
> +	select GENERIC_PHY
> +	select GENERIC_PHY_MIPI_DPHY

[Severity: Medium]
Should this Kconfig entry select or depend on PM_OPP?

Without CONFIG_PM_OPP enabled, the stub for devm_pm_opp_of_add_table()
used during probe will return -EOPNOTSUPP, causing the driver probe to
unconditionally fail with an "invalid OPP table" error.

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c

[ ... ]

> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *c=
si2phy,
> +					   struct mipi_csi2phy_stream_cfg *cfg)
> +{
> +	const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_regs(csi=
2phy);
> +	struct mipi_csi2phy_lanes_cfg *lane_cfg =3D &cfg->lane_cfg;
> +	u8 settle_cnt;
> +	u8 val;
> +	int i;
> +
> +	settle_cnt =3D phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2p=
hy->timer_clk_rate);
> +	if (!settle_cnt)
> +		return -EINVAL;

[Severity: High]
Does this incorrectly reject a valid settle count of zero?

Looking at the math in phy_qcom_mipi_csi2_settle_cnt_calc():

phy_qcom_mipi_csi2_settle_cnt_calc() {
        ...
        settle_cnt =3D t_hs_settle_ps / timer_period_ps - 6;
        return settle_cnt;
}

If the link frequency and timer clock rate yield exactly 6 timer periods
for t_hs_settle, the calculation results in 0. By rejecting 0 here,
legitimate MIPI CSI2 configurations might fail to initialize.

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy=
/qualcomm/phy-qcom-mipi-csi2-core.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c

[ ... ]

> +static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D devm_clk_bulk_get_all(dev, &csi2phy->clks);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get clocks\n");
> +
> +	if (num_clk !=3D ret) {
> +		return dev_err_probe(dev, -ENODEV, "clock count %d expected %d\n",
> +				     ret, num_clk);
> +	}
> +
> +	for (i =3D 0; i < num_clk; i++) {
> +		if (!strcmp(csi2phy->clks[i].id, "timer")) {

[Severity: High]
Could csi2phy->clks[i].id be NULL here?

The clk_bulk_get_all() infrastructure can leave the .id field as NULL if
the device tree node has a "clocks" property but is missing "clock-names".
Calling strcmp() on a NULL pointer will cause a kernel panic during probe
when parsing malformed device trees.

> +			csi2phy->timer_clk =3D csi2phy->clks[i].clk;
> +			break;
> +		}
> +	}
> +	if (!csi2phy->timer_clk)
> +		return dev_err_probe(dev, -ENODEV, "no timer clock\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-x1e-csi2-p=
hy-v12-0-cc7311326d1b@linaro.org?part=3D2
