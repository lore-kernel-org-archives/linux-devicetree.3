Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E005B225403
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 00:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603718; cv=none; b=U8+l3KX3FcNAgMdN8JAaDTRROqzh1sX/yq5EvFJDQlaYJ8Jgn/vADeD0GNua2TK56Qnkpt7p1a8maL6KRcM5eXwfyk06y9PmQ+uqqeP9F+N4wMiDZZMqNhZLaFa9uZ4jZ1K7fTNzfkSOLTwegDdxPNNYkZDGstXWleTthjKW5ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603718; c=relaxed/simple;
	bh=pRAk7foY/DUGjEbnQZoFLzbD9g4nCnqGCV5/GSBSOfM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l42mV7EqEyrwosSCa3IS2d58+LRUR7hcXeKCcZw8WBWVp/d0p/cOX3SU+3ckCxy43IxO5A3Vi5B31Np3gD/hXRYrPZnllgOwNeLDDx4gQVTXhc/A7sqpuja75D/ntJdp3KSY00XbvxtF2m4/UD31Dm+bxTgk/LuTXS515th+m5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQoKq/YM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQoKq/YM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613251F000FF;
	Thu, 17 Sep 2026 00:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789603714;
	bh=MMxh5Y2XGIBli5WDqvkQ78g//L7qYT0cVlHqUzTO6h8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RQoKq/YMv2cOCHvZyScKI2OESrMTyhzR6fnoT4JwMBRC53LrbPBss/pOyTjFH+dPe
	 Sn4WwSnyypS2gK2KsYDqeQFJnp8Lpa5mtnxP7BuB8hmdl/nZ+GLnV2Ke+mmqCUDBs7
	 vlnoR+qazYcXZyn4iuam1Mua74C4NG1JNTlP1RFoZ0b4XqPl1dn8t6sqLGKOjcm/oj
	 vMJuT1QrTcWesM202nk+p5sUdz4bCRd+f+Q12WFw4dUNPwo0UpDiL9zb/nDN9ARhM5
	 ZKBONLQ3cY02Uj1Dnvtq676QKUcblF46aQM5owoNpPoYiPixXlRmVXhCGmJe6LKtJU
	 1GO2/k4WO1Nbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260917-x1e-csi2-phy-v18-2-6515b5255fa9@linaro.org>
References: <20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org>
 <20260917-x1e-csi2-phy-v18-2-6515b5255fa9@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 00:08:33 +0000
Message-Id: <20260917000834.613251F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] phy: mipi-csi2: valid settle_cnt of 0 is incorrectly treated as =
an error
- [Low] phy: mipi-csi2: missing bitmask on hardware version read
- [Low] phy: mipi-csi2: unused clk_names array and incomplete clock validat=
ion
--

commit 96f989cd7293176051d565c67a575abc0e3f18e1
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

This commit adds a new MIPI CSI2 DPHY driver for Qualcomm platforms,
supporting the "qcom,x1e80100-csi2-phy" device. It imports existing
CAMSS CSI PHY initialization sequences to configure data and clock lanes.

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 0000000000000..966d79c98f9b2 100644
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -0,0 +1,385 @@
[ ... ]
> +static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_devic=
e *csi2phy)
> +{
> +	const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_regs(csi=
2phy);
> +	u32 tmp;
> +
> +	writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
> +
> +	tmp =3D readl_relaxed(csi2phy->base +
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
> +	csi2phy->hw_version =3D tmp;

[Severity: Low]
Does this read allow non-version bits to corrupt the final hardware version
value?

The subsequent reads for bytes 1-3 apply a bitmask (e.g., & 0xFF00) to
discard garbage in the upper bits, but this first read assigns the value
directly. Could stray bits in the higher registers from offset 12 corrupt
the assembled version string?

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
> +	ui_ps =3D div64_u64(PSEC_PER_SEC, link_freq);
> +	ui_ps /=3D 2;
> +	t_hs_prepare_max_ps =3D 85000 + 6 * ui_ps;
> +	t_hs_settle_ps =3D t_hs_prepare_max_ps;
> +
> +	timer_period_ps =3D div_u64(PSEC_PER_SEC, timer_clk_rate);
> +
> +	if ((t_hs_settle_ps / timer_period_ps) < 6)
> +		return 0;
> +
> +	settle_cnt =3D t_hs_settle_ps / timer_period_ps - 6;
> +
> +	return settle_cnt;
> +}
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
> +	if (cfg->link_freq <=3D 0)
> +		return -EINVAL;
> +
> +	settle_cnt =3D phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2p=
hy->timer_clk_rate);
> +	if (!settle_cnt)
> +		return -ENODEV;

[Severity: Medium]
Will this erroneously reject valid hardware configurations?

The calculation in phy_qcom_mipi_csi2_settle_cnt_calc() evaluates to 0 when
the ratio is exactly 6, but it also returns 0 when the ratio is less than 6
to indicate an error.

Since phy_qcom_mipi_csi2_lanes_enable() checks if (!settle_cnt), does this
overlap cause a valid configuration to be spuriously rejected as an error?

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy=
/qualcomm/phy-qcom-mipi-csi2-core.c
> index 0000000000000..c0a4fa20eaf0c 100644
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -0,0 +1,463 @@
[ ... ]
> +static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	for (i =3D 0; i < num_clk; i++) {
> +		if (!csi2phy->clks[i].id)
> +			return dev_err_probe(dev, -EINVAL, "Missing clock-names\n");
> +
> +		if (!strcmp(csi2phy->clks[i].id, "timer")) {
> +			csi2phy->timer_clk =3D csi2phy->clks[i].clk;
> +			break;
> +		}
> +	}

[Severity: Low]
Does this loop exit early upon finding the timer clock, failing to validate
the remaining dynamically loaded clocks?

Because devm_clk_bulk_get_all() does not use the carefully defined
soc_cfg->clk_names array, breaking early here appears to bypass expected
clock validation. Would the driver blindly accept misnamed clocks instead of
enforcing the expected platform clock list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-x1e-csi2-p=
hy-v18-0-6515b5255fa9@linaro.org?part=3D2
