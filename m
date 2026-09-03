Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BE64F30F4
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 20:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788468881; cv=none; b=gbASIgPi3AQp+lqBaIpohMoLT9mMR8PXENwQiJP00OrzV8jGcWo5cDIWlzwPmF3O1dRtpGe3lsVmz2WNbPl93wQy1ZZeS7MRPgvj1bLYRAGT0BNsIWpljWuvvZJua7YwO957IJ9PbeiEgT4jB/IB7Nt6UqP3BXtPz7jB6Uvsms0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788468881; c=relaxed/simple;
	bh=JkbG6bLKBAQvTXxTv3/ryN6Jpt3t0r+47SqhRX/Fp7Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZhYJBWvrVNForNEGBRV6cCAjTs7YLyT1yMoA1RVW98lY2na7JEhbp2OPTI+legG3qR9nRhIwiqwPIBKDx9HF9KTt4rCXJvdbKH4DDjGxRgPaE9+x3AIoo2+uuc0DZ+aQ9K0sdmDUYjzjBvbbEI+LDfsU3UH76dFXZ9nIvdbQvo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TryPiCaP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TryPiCaP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA4E1F000E9;
	Thu,  3 Sep 2026 20:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788468877;
	bh=aE9v9B5eRnSI6xpicfymScibzPae9lIzGDw+sAemqpg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TryPiCaPrsWHDjSCEm5lBmFNFCzdD1HeunMKNdbljIo+xe7JRwuDnLBHb40wYpulO
	 zb9bHJQuHmt5LLv9jBApe4hRTMOaAvyLNrmcEJKc8eKDmXhU1QrSAAZQcfYDZoc6Ug
	 WvT2IYNkSYS4NGBl8/Xemia+cFvda+zgXj2MzLbF2o5B7GMyHZUF351rVxDRRkJ+lV
	 1buVae6tXyMoSm/7RxQYTZaIduiCoe4WYGxqvJ7GGnXGwO+dlx6ejUT4zw3ThtwBct
	 BJvTJ24QgIqp7hKYBYnKVbtsz0lw3h4Zt3elI7FqDW8wos/vRqKzSeDNkbiySyZyfL
	 xzOXRLGEnB+iQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260903-x1e-csi2-phy-v17-2-26606fa9a039@linaro.org>
References: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
 <20260903-x1e-csi2-phy-v17-2-26606fa9a039@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 20:54:36 +0000
Message-Id: <20260903205436.DEA4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The MIPI D-PHY configuration ignores the requested number of act=
ive lanes, enabling all physically mapped lanes instead.
--

commit 80184194d436b4ea64c9ebc79907070b59c9de53
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

Adds a new MIPI CSI2 driver in DPHY mode by importing existing CAMSS CSI
PHY init sequences. Supports the qcom,x1e80100-csi2-phy device and includes
data/clock lane positioning and polarity selection.

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy=
/qualcomm/phy-qcom-mipi-csi2-core.c
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
[ ... ]
> +static int phy_qcom_mipi_csi2_configure(struct phy *phy,
> +					union phy_configure_opts *opts)
> +{
> +	struct mipi_csi2phy_device *csi2phy =3D phy_get_drvdata(phy);
> +	struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &opts->mipi_dphy;
> +	struct mipi_csi2phy_stream_cfg *stream_cfg =3D &csi2phy->stream_cfg;
> +	int ret;
> +
> +	ret =3D phy_mipi_dphy_config_validate(dphy_cfg);
> +	if (ret)
> +		return ret;
> +
> +	if (dphy_cfg->lanes < 1 || dphy_cfg->lanes > CSI2_MAX_DATA_LANES)
> +		return -EINVAL;
> +
> +	stream_cfg->link_freq =3D dphy_cfg->hs_clk_rate;

[Severity: Medium]
Should the requested active lane count from opts->mipi_dphy.lanes be stored
in stream_cfg here? Currently, dphy_cfg->lanes is validated but the value
does not appear to be saved for later use by the PHY enable routines.

> +
> +	return 0;
> +}
[ ... ]
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
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
[ ... ]
> +	/*
> +	 * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
> +	 * - Bits [0,2,4,6] =E2=86=92 D-PHY data lanes(LN0, LN2, LN4, LN6)
> +	 * - Bits [1,3,5] =E2=86=92 C-PHY trio lanes(LN1, LN3, LN5)
> +	 * - Bit [7] =E2=86=92 D-PHY clock lane(LNCK) dedicated clock enable
> +	 */
> +	val =3D BIT(lane_cfg->clk.pos);
> +	for (i =3D 0; i < cfg->num_data_lanes; i++)
> +		val |=3D BIT(lane_cfg->data[i].pos * 2);

[Severity: Medium]
Does this loop unconditionally enable all physically mapped lanes instead
of the dynamically requested lane count?

If a MIPI CSI-2 consumer calls phy_configure() requesting fewer active lanes
than the hardware maximum mapped in the device tree, the PHY will still
power up all of them here since cfg->num_data_lanes is derived from the
device tree parsing. Should this use a dynamically configured lane count,
or at least reject the configuration in phy_qcom_mipi_csi2_configure if it
doesn't match the hardware?

> +
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-x1e-csi2-p=
hy-v17-0-26606fa9a039@linaro.org?part=3D2
