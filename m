Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1232FFFA5
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784464888; cv=none; b=osYWv3zAWDMu46f6WMnSjOOxQ+K1BdI0A17l5hWNtEuiaE9DnsPArF1p77GXxJUiQ42E9t6x9lYSNCf39gZwP5vLaCXhSONGEBLmo2/QzUtpjf2gtbOlLkPkSoAAC0i0RY8GFXj2qYIr9klhpWvv2VZkvw9x+V0zDqSaTvT7cO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784464888; c=relaxed/simple;
	bh=GCo6YJEygGPCyt/V4LFACkAEoRdXqXX0l8TXX85Kcpk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=daP0QcvbPUctI+OBDTY+gT11respvrLJniuImHiDtqDtEFhMiewtHx7vhrNiNKH2uadoeCI7iIStCWaMrNF92EjFSd6boBYX9RrhI/kw4VYIyxkDXo4vTeppkrPVnf/WkSejDHbUzv0wUsi+RT1j49Nr6sQqwMB/KoZEQTrPZkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzcqtF82; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzcqtF82"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397901F000E9;
	Sun, 19 Jul 2026 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784464886;
	bh=GeFBb3N9J34UxhGdOzpnMX394XWwhLeCIgGjXNPJDAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lzcqtF82MLvka/W9fXL3v3J/L/8ourKoMKWZEbCExBHry7OG3xnGHyaT1of5RIdPc
	 iMr/6KA4DMK463DpWDtKIkbH0fz2mhQtHxShL0mUKntp0wi6T4+yu8YyeLqLuRGH+Q
	 kV5xRkBchyH0CTxLYzgU+6TqOYdI2D+YnLjCaCLZ7H1nHDRo5dJU5Q9fyM6M1lLf4S
	 T5m1MFduFHEhNlA0ae0p1MP6Vmh4ymFS0ne4bkosVS9vjjPzq4AAlCzxlwFFV/HTNF
	 0grvp32iy4rEa1HhemDiqP7OLAi9iOyVgwayOg2/0efzKpQx50vJKPO1b89Hh1N85Q
	 KnLXCe2dASUHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, media-ci@linuxtv.org, olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260719-x1e-csi2-phy-v11-2-9d0a1ed0632d@linaro.org>
References: <20260719-x1e-csi2-phy-v11-0-9d0a1ed0632d@linaro.org>
 <20260719-x1e-csi2-phy-v11-2-9d0a1ed0632d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 12:41:25 +0000
Message-Id: <20260719124126.397901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Insufficient validation of the `data-lanes` property allows values=
 up to 7, leading to integer truncation and out-of-bounds MMIO writes into =
common PHY registers.
- [Medium] The driver statically configures lanes based on the device tree =
instead of respecting dynamic `dphy_cfg->lanes` requests, violating the MIP=
I D-PHY API contract.
- [Medium] Setting lane polarity unconditionally overwrites the entire `CTR=
L9` register instead of performing a read-modify-write.
- [Low] Unmasked assignment of the first byte in `hw_version` may corrupt t=
he final value with undefined upper bits.
--

--- Patch [2]: [PATCH v11 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY dr=
iver ---
commit cff02f6508398df4f254c675b3580c3c848e17c2
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

This commit adds a new MIPI CSI2 PHY driver in DPHY mode for Qualcomm
hardware. It ports logic from existing camss drivers to initialize and
configure data and clock lanes based on device tree properties.

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c

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
Does this assignment to csi2phy->hw_version need a mask like & 0xFF?

If the hardware register returns non-zero garbage values in the upper 24
bits, those bits might remain in hw_version and corrupt the final value
when the subsequent shifted bytes are OR'ed in.

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

[Severity: High]
Could this cause an integer truncation?

Because the val variable is defined as a u8, shifting by 8 or more will
silently truncate to 0. If a lane position is >=3D 4, lane_cfg->data[i].pos=
 * 2
becomes >=3D 8, which means the driver might fail to power up the lane.

> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
> +
> +	/* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
> +	for (i =3D 0; i < cfg->num_data_lanes; i++) {
> +		if (lane_cfg->data[i].pol) {
> +			u8 pos =3D lane_cfg->data[i].pos;
> +
> +			writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(pos * =
2));

[Severity: High]
Can this result in an out-of-bounds memory write?

If pos is >=3D 4, pos * 2 is >=3D 8. The CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n ma=
cro
will compute an offset that overflows the physical lane register space and
aliases directly into the common PHY register block, potentially clobbering
common registers.

[Severity: Medium]
Is it safe to use an absolute writel() here instead of a read-modify-write?

Writing BIT(2) directly clears any hardware defaults or reserved bits that
might be present in the rest of the register. This also creates asymmetric
handling since the register is left untouched if polarity is false.

> +		}
> +	}
> +
> +	if (lane_cfg->clk.pol)
> +		writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cf=
g->clk.pos));

[Severity: Medium]
Similarly, could this absolute write clobber the clock lane CTRL9 register?

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
> +
> +	return 0;
> +}

[Severity: Medium]
Should the dynamically requested dphy_cfg->lanes value be saved into the
active configuration here?

The value is validated but discarded, meaning the driver will always
statically power up the maximum number of lanes configured in the device
tree instead of respecting dynamic requests from the consumer. Does this
violate the MIPI D-PHY API contract for dynamic lane configuration?

[ ... ]

> +static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *=
csi2phy)
> +{
> +	struct mipi_csi2phy_stream_cfg *stream_cfg =3D &csi2phy->stream_cfg;

[ ... ]

> +	csi2phy->stream_cfg.lane_cfg.clk.pos =3D CSI2_DEFAULT_CLK_LANE;
> +	csi2phy->stream_cfg.lane_cfg.clk.pol =3D lane_polarities[0];
> +
> +	for (i =3D 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
> +		if (data_lanes[i] > CSI2_MAX_LANE_NUM) {

[Severity: High]
Is CSI2_MAX_LANE_NUM (7) too large for this bounds check?

As noted in phy_qcom_mipi_csi2_lanes_enable(), allowing lane numbers >=3D 4
results in pos * 2 being >=3D 8 later on, which causes both truncation in t=
he
u8 bitmask and out-of-bounds writes into the common PHY register region.

> +			dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
> +			ret =3D -EINVAL;
> +			goto out_put;
> +		}
> +		csi2phy->stream_cfg.lane_cfg.data[i].pos =3D data_lanes[i];
> +		csi2phy->stream_cfg.lane_cfg.data[i].pol =3D lane_polarities[i + 1];
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-x1e-csi2-p=
hy-v11-0-9d0a1ed0632d@linaro.org?part=3D2
