Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B9D226CFE
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784510764; cv=none; b=t6mcDSADXV/u+ZQmJfDp54sfgS/ye+ZZmfin6FMVKDhDkZ862eTg1pQj0P4c4Ygz6Y0VGuLUdNS7uSDwjHrETkHSLzESiKk1JMEwbHypgEcS9Rvy52+ez8wiMujwFSZyezpqP9hq8Y6XV4AFnxeQqw5B0XMRhKoOaCOmXOUokRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784510764; c=relaxed/simple;
	bh=Mnydbi3uAHKvPeeWaJGjfxlY8Txt35RYVnwYbuO40Xo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nHVZOQFij0FkOMMLRMvQiVZCh64Ym3SsFsiB18tsgtwocrMkA3F21jcBP1OYozTs411ceKue/GDCmmsZ1WNI8659Kqy1GQxkLoJIfSDvPKd9S/sLZZbKMnvG3a5jYTs783yqTgtYJedeMeS0BJ510ua4fLdcX1Fl2GFJq5DUdaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNoTGlOE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNoTGlOE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC041F00A3A;
	Mon, 20 Jul 2026 01:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784510763;
	bh=8lR17PS+Su8iOHaA3iQrEy5VgOMzAQMSv3w+U50wEfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gNoTGlOEcxuieLRgArLhEcNJl0gOUGkQNx64onWWtEna8aV9bvd9bwBrT4k9AO+MA
	 Buunxi9VxqQAD7LX7frJ4FKEy+qRY7jWMBFmMPnSwE8a6K/LfD6kfZ9TrdULZkZ0H1
	 1p0bShqxkXr9FvnXQttMF+Y1HXmzKnBFhQ/j+IybWImb4/okh4SbzzTLs33vqm1i7n
	 Uf/E6uO6eptnomDXwdD+EBCMBWRe4sFmQ2/pk8/V/6mnYcutDqg6q/eoNPPQ6/RSq9
	 dzk9aPzkNeUzbwcp6pXcl9CAmGAIyQ1jQrY0IWrmvmZyAeDSPPJdeKqG+zsNs0wJZP
	 ULYuj75xRCvHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: media-ci@linuxtv.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, robh@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260720-x1e-csi2-phy-v13-2-160c31958863@linaro.org>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-2-160c31958863@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:26:02 +0000
Message-Id: <20260720012602.DFC041F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Valid calculated settle_cnt of 0 is treated as an error
- [Medium] Polarity configuration overwrites the entire CTRL9 register inst=
ead of using read-modify-write
--

--- Patch [2]: [PATCH v13 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY dr=
iver ---
commit 1d21f0b236808ec690ca4bbd5ac6190e2c2c873b
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
existing CAMSS CSI PHY init sequences are imported in order to save time
and effort in later patches.

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
> +	if (cfg->link_freq <=3D 0)
> +		return -EINVAL;
> +
> +	settle_cnt =3D phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2p=
hy->timer_clk_rate);
> +	if (!settle_cnt)
> +		return -ENODEV;

[Severity: High]
Should a return value of 0 from phy_qcom_mipi_csi2_settle_cnt_calc() be
considered valid?

If the timing parameters yield exactly 6 for t_hs_settle_ps / timer_period_=
ps,
the calculation evaluates to 0. This then causes the lane enable sequence to
fail here with -ENODEV.

Could phy_qcom_mipi_csi2_settle_cnt_calc() return a negative error code for
invalid timings instead of overloading 0 as an error value?

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
> +
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

[Severity: Medium]
Does this writel() unintentionally clobber other bits in the
CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n register?

A direct write of BIT(2) will zero out all other bits in the register. Shou=
ld
this be a read-modify-write sequence to preserve hardware defaults or
calibrations?

Additionally, if polarity configuration is disabled, the register is not
written at all, which might leave it in an inconsistent state if it was
previously modified.

> +		}
> +	}
> +
> +	if (lane_cfg->clk.pol)
> +		writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cf=
g->clk.pos));
> +
> +	val =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-x1e-csi2-p=
hy-v13-0-160c31958863@linaro.org?part=3D2
