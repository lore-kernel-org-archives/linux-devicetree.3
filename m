Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F379063CB
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 02:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784343072; cv=none; b=FURdJ/ixrOoPn7la6IPqERApGw+qhRpm22XpIuS1hS3tJqQiZtlkUoc6/tl59ebHev94bd22q+Ub3Gnpk0AqM8TCTiVsaYV985WVJ7gKEju/Ks3PL+RFScNagNbnoEJvRWvl7GNxEYMA6UxUzRXvSe9KTVOr0kltY1Q+RPPLj/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784343072; c=relaxed/simple;
	bh=lYTvReqpKFzpk2B4UvM0Re5djCOnXkTvBFVEow6VZLE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M+0aHnPawKiSVA2YpOwTkcjGXTisDzScQblcCvCT0DFhifG1DPaJGxvjL3zGX6raBo8ydsoOq8L7fwLAHOI3jJaaf1ep9SFyAWvpMGkG302+AMGx0lAYmhpFOvcYNVkdL1k6+aM2IqWTq7YGT1906cG+HGA86YEVzBbieGEIAYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpxTU5N2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpxTU5N2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED601F000E9;
	Sat, 18 Jul 2026 02:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784343070;
	bh=hfqshca3ABZCCxCo1Cns1ILbSPQRed2D2qDVbungei0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GpxTU5N2I7X/WdjZtmXmiFPAjVeS4rXjb0d8Ttn+J6btDrUGHqLakytg92zC+yfr5
	 HcnNZ1FwC8AvEd+sOJ1cju+AtOuTc+dcd6zBZ0/P+wxRDbwUUdwCLWAHqyU7P3nkuL
	 jBNK7dCan5t2N9daptQDGXQUpZWd+Zgj+Dx+M+gnt43hyvRzkqUF65pTSCYeVSHC7G
	 ITytLwFvr3VF2yVMtFXHvi0Uv3eSEpP+RCF/Y6b1WQOShHhixudts1UJonYk4ilKyq
	 wQBX4Rxt61dB4gXRagKFSD+JRXkIe5FYAmh4hSyjn/NZAWYAWXEJWzokLu+Hn7gOYD
	 BKqsF2hWCUecg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org
In-Reply-To: <20260718-x1e-csi2-phy-v10-2-5720a7888953@linaro.org>
References: <20260718-x1e-csi2-phy-v10-0-5720a7888953@linaro.org>
 <20260718-x1e-csi2-phy-v10-2-5720a7888953@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 02:51:09 +0000
Message-Id: <20260718025109.EED601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect translation of logical to physical lanes causes register=
 offset errors and bitwise truncation.
- [High] Integer truncation in division leads to potential division-by-zero=
 panic in settle count calculation.
- [Low] Hardware version register read does not mask upper bits, potentiall=
y corrupting the version struct.
--

--- Patch [2]: [PATCH v10 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY dr=
iver ---
commit 3a4ef513bbeefe5185b0f08d343f98883cbe66ca
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

This commit adds a new MIPI CSI2 driver in DPHY mode initially. It supports
devices like "qcom,x1e80100-csi2-phy" and imports CAMSS CSI PHY init sequen=
ces.

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 0000000000000..5ac0d041b36b7
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
Is it possible for the hardware register to return garbage or reserved bits=
 in
the upper bytes here? Since this first read is assigned directly without
masking (e.g., tmp & 0xFF), any upper garbage bits would remain in hw_versi=
on
and wouldn't be cleared by the subsequent bitwise OR operations.

> +
> +	tmp =3D readl_relaxed(csi2phy->base +
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
> +	csi2phy->hw_version |=3D (tmp << 8) & 0xFF00;

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

[Severity: High]
Does this code silently truncate link_freq?

The div_u64() macro expects a u32 divisor, but link_freq is an s64. This wi=
ll
implicitly truncate the 64-bit link_freq value to 32 bits.

If link_freq happens to be an exact multiple of 2^32, the truncated divisor
becomes exactly 0, which would cause a division-by-zero panic. Frequencies
exceeding 4.29 GHz would also be silently corrupted.

Could this be updated to use div64_u64() or similar to avoid truncation?

> +	ui_ps /=3D 2;
> +	t_hs_prepare_max_ps =3D 85000 + 6 * ui_ps;

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
> +
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
Can this bitmask overflow the u8 val?

If the device tree uses physical indices (e.g., 4 or 6) for pos, pos * 2
becomes 8 or 12. Since val is a u8, using BIT(8) or BIT(12) will overflow
and silently truncate to 0, failing to enable the corresponding hardware la=
ne.

> +
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
> +
> +	/* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
> +	for (i =3D 0; i < cfg->num_data_lanes; i++) {
> +		if (lane_cfg->data[i].pol) {
> +			u8 pos =3D lane_cfg->data[i].pos;
> +
> +			writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(pos));

[Severity: High]
Does this correctly map logical to physical lanes?

The CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(pos) macro computes 0x200 * pos + 0x24.
However, D-PHY data lane blocks are spaced at offsets 0, 0x400, 0x800, and
0xC00.

If pos is a logical index like 1, this would access offset 0x200 (which is a
C-PHY lane) instead of the intended 0x400.

> +		}
> +	}
> +
> +	if (lane_cfg->clk.pol)
> +		writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cf=
g->clk.pos));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-x1e-csi2-p=
hy-v10-0-5720a7888953@linaro.org?part=3D2
