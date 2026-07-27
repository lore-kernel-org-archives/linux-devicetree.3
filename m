Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933733C13E3
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 19:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180336; cv=none; b=Ie61r9ugZkyim5UGgMrjJ9neUJ1/yBnD5kSkhbxwQYhVYwl7FMxUnC8m8LK/sKtn+bjYICzZ25qOQTDIizNPCM1NW1rq/R5e9O8puNjjHuGiyUlRrGXVGctbTpgbQ6CPLzwwUdTkPuNBKGtKLy1H5z+JCDc3BU1rI40mQKjRyyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180336; c=relaxed/simple;
	bh=p13jCcHGq6aWFPHsHtyZ1dYR6RNGHT+vDF1sMnrewug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SpJ34AgeNWqipF+UE82sPCfGMg2J4Ez3ovKwkrnbcYqefqY44YvneYSG7ZsxJcQEPFc5zdmo5F8YEgKleDfxGmn47y/EaMDADknjPygetWofjfAWj5ebh1qPFQ/+VVD+991FmxX7ek//RTwgVH3PuwUdm2Zi/xGfPqhyxQPXoys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAWQyEwq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAWQyEwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03F91F000E9;
	Mon, 27 Jul 2026 19:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785180335;
	bh=QlyrCwdqSd/XNfasiVa+yCWfLqvspZYdjbkTU/9WM8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kAWQyEwqS8mCN3QRZUTzqighHyrTFU7x6ZzqD3xjns/ETMtTStmjkYTvJ+zfMXELB
	 U3PI0YJHgig3Llh1wwbhD2t/+X5jz1065/ajJzAXuKbCsnYzi+WbkWPoIIITMXP+ou
	 5VYOvKtBS08KEJPm8g6ioSowD1F89W9nBghSBd9pjmWDBIwvWLqx2/GVlSdhkuamK+
	 /0srzSXLGG6giWOdG4dzBYctGWKoAufGjFR63Gu8s/Hm4vD8lOZ2aN7czq3WAt4RJq
	 WN927i46J1cR1InMh1wNkOlp56/PZNkLzjkmSouuII/uzG/O48Ts+1lLS8NfHK+1w5
	 aPKgg+gAFvrLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, media-ci@linuxtv.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org
In-Reply-To: <20260727-x1e-csi2-phy-v14-2-27d1bf477593@linaro.org>
References: <20260727-x1e-csi2-phy-v14-0-27d1bf477593@linaro.org>
 <20260727-x1e-csi2-phy-v14-2-27d1bf477593@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 19:25:34 +0000
Message-Id: <20260727192534.B03F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Legitimate settle count of 0 is treated as an error, breaking MIPI=
 CSI2 configurations that evaluate to exactly 6 timer periods.
- [Medium] The PHY configuration ignores the dynamically requested number o=
f data lanes, always enabling all lanes defined in the device tree.
--

--- Patch [2]: [PATCH v14 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY dr=
iver ---
commit 33347f4ee71f45db321e44127a30dfe4e40a2c84
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

This commit adds a new MIPI CSI2 driver in DPHY mode, importing the existing
CAMSS CSI PHY init sequences. It supports configuring data-lane and clock
lane positioning and polarity selection.

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> new file mode 100644
> index 0000000000000..966d79c98f9b2
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
[ ... ]
> +static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_cl=
k_rate)
> +{
[ ... ]
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

[Severity: High]
Does this incorrectly reject a valid register configuration?

When the calculated timer period ratio (t_hs_settle_ps / timer_period_ps)
evaluates to exactly 6 in phy_qcom_mipi_csi2_settle_cnt_calc(), the function
returns a settle_cnt of 0.

By treating !settle_cnt as a failure here in phy_qcom_mipi_csi2_lanes_enabl=
e(),
it seems configurations that result in exactly 6 timer periods will fail to
initialize with -ENODEV, even though 0 is a mathematically valid outcome.

> +
> +	/*
> +	 * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
> +	 * - Bits [0,2,4,6] -> D-PHY data lanes(LN0, LN2, LN4, LN6)
> +	 * - Bits [1,3,5] -> C-PHY trio lanes(LN1, LN3, LN5)
> +	 * - Bit [7] -> D-PHY clock lane(LNCK) dedicated clock enable
> +	 */
[ ... ]
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy=
/qualcomm/phy-qcom-mipi-csi2-core.c
> new file mode 100644
> index 0000000000000..02f34b7de05f5
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
Should the number of data lanes from the consumer also be recorded here?

The dphy_cfg->lanes parameter is validated, but it is not assigned to
stream_cfg->num_data_lanes. If a consumer calls phy_configure() requesting
fewer lanes than the device tree's maximum, the PHY will ignore the dynamic
request and later power up all lanes defined in the DT during
phy_qcom_mipi_csi2_lanes_enable().

Could this omission lead to a transmitter and receiver expecting a mismatch=
ed
number of active lanes, or result in unnecessary power waste?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-x1e-csi2-p=
hy-v14-0-27d1bf477593@linaro.org?part=3D2
