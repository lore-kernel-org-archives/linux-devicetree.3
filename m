Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575BB4772B4
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142203; cv=none; b=a292mQNOgMUi1xSMC5ZKHUD/54uwni93lpP6WTB/woQTzNBI3p7lMplux6Ww6A9Wb1bCdb4Ia+RVucVvlbu+NrtAbgVaFVSkggaFhivzW8EPgra91Sm3FrhLS1Jasczz8Kxx2NVRXZTvppoe14G9SLXXAYv+DspRivmauPnVH74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142203; c=relaxed/simple;
	bh=toDT5ln4/2otwApqA+60ce6EStjKj26NlB8TxGGtHTc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WkCcZcjEyjaXtEmCQgelt/kBmvL1k56qqIXgvi5sDmuwpjtQe5wJWQa80r+G0aRhoxUOKrxFJw/sALIuQ3aM6wLLdosSd0lfF57cRyJvszWxnF6JIDSLp/gwgsXy4XE4DlNyiwYbm1NL/Z0NUt0bYiT/oO0RYwowTqd38AygGSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiMCpa6U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiMCpa6U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4846E1F000FF;
	Fri, 11 Sep 2026 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789142201;
	bh=73uTfeFMu9/xVvopMPeT6jjeQlBMO5pBA6IxMwBr8kk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oiMCpa6UQcMSJLoOWiWHxrKf7TGKIK/43kvns1ERnqKq3kZDtHnl6Wvk83TVfI7eq
	 8n+3LESB6Eo+/nvAanDjiSCfaiPpJnNugEy8iexuIZHjT64FUVEU3Z4YbKg1RQrRL6
	 5UEpmNbfAVfy+L6eHuRpvSDR0kTbbdmmBoSPgTy86bxkPe9RwBgLkvIZi6atSqP8Q1
	 vf6WFcov9XOpeSHs66/K8wuZ5eXZzvuZuYRd8cE24/99WUMnKVGPYXWu0kKgO7Q4Mw
	 EJ/IBBD5PBVicXAjyPHJvAPNOE8igHCPZ5R/wK9/4j8LVscPb+2DzfcjcCehFz9G7p
	 Gl9tuvlu12oTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/17] phy: qcom: edp: Introduce Nord phy_ver_ops and
 phy_cfg descriptor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260911-nord-drv-dt-v1-16-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-16-e25c073cf1b6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 15:56:40 +0000
Message-Id: <20260911155641.4846E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The common power-on flow unconditionally writes to the legacy TX_B=
AND offset, which corrupts registers on the Nord platform.
- [High] The Nord LDO configuration ignores DP mode and applies incorrect e=
DP settings, contradicting the Hardware Programming Guide.
--

commit ff420262cd547c67f8bafbb24b3a2db77628fd60
Author: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

phy: qcom: edp: Introduce Nord phy_ver_ops and phy_cfg descriptor

Add qcom_edp_phy_ops_nord wiring all eight Nord-specific callbacks and
nord_edp_phy_cfg collecting the Nord AUX, VCO divider, swing/pre-emphasis
tables and ver_ops.

> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/p=
hy-qcom-edp.c
> index 361f4e4673518..338f28cb404fb 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -1847,6 +1847,29 @@ static int qcom_edp_phy_tx_res_cfg_nord(const stru=
ct qcom_edp *edp)
>  }
> =20
> =20
> +static const struct phy_ver_ops qcom_edp_phy_ops_nord =3D {
> +	.com_power_on		=3D qcom_edp_phy_power_on_nord,
> +	.com_resetsm_cntrl	=3D qcom_edp_phy_com_resetsm_cntrl_nord,
> +	.com_bias_en_clkbuflr	=3D qcom_edp_com_bias_en_clkbuflr_nord,
> +	.com_configure_pll	=3D qcom_edp_com_configure_pll_nord,
> +	.com_configure_ssc	=3D qcom_edp_com_configure_ssc_nord,
> +	.com_ldo_config		=3D qcom_edp_ldo_config_nord,

[Severity: High]
Does this hardcode the incorrect LDO configuration for DP mode?

The comments for qcom_edp_ldo_config_nord() document that DP mode must use
0x00 and eDP mode must use 0xD1.

However, the implementation seems to unconditionally hardcode 0xd0 and 0x03,
ignoring edp->is_edp completely:

qcom_edp_ldo_config_nord()
	ldo_config =3D 0xd0;
	phy_ldo_cfg =3D 0x03;

	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);

Could this cause instability or link failures when running in DP mode due to
contradicting the hardware requirements?

> +	.phy_tx_lane_cfg	=3D qcom_edp_phy_tx_lane_cfg_nord,

[Severity: High]
Can the common power-on flow corrupt registers on the Nord platform here?

When qcom_edp_phy_power_on() runs, it calls this phy_tx_lane_cfg() callback
which correctly programs the Nord-specific TX_BAND offset at 0x0024:

qcom_edp_phy_power_on()
	if (edp->cfg->ver_ops->phy_tx_lane_cfg) {
		ret =3D edp->cfg->ver_ops->phy_tx_lane_cfg(edp);
        ...

But immediately afterward, the common flow unconditionally writes to the
legacy TX_BAND offset:

qcom_edp_phy_power_on()
	/* TX-0 register configuration */
    ...
	writel(0x04, edp->tx0 + TXn_TX_BAND);

Since TXn_TX_BAND moved to 0x0024 on Nord, writing to the legacy offset
(0x0028) might clobber whatever unknown register resides there now.

Would it be better to conditionally bypass the legacy TX_BAND write when the
Nord specific callback is used?

> +	.phy_tx_res_cfg		=3D qcom_edp_phy_tx_res_cfg_nord,
> +};
> +
> +static const struct qcom_edp_phy_cfg nord_edp_phy_cfg =3D {
> +	.is_edp			=3D false,
> +	.aux_cfg		=3D edp_phy_aux_cfg_nord,
> +	.vco_div_cfg		=3D edp_phy_vco_div_cfg_nord,
> +	.dp_swing_pre_emph_cfg	=3D &nord_dp_swing_pre_emph_cfg,
> +	.edp_swing_pre_emph_cfg	=3D &nord_edp_swing_pre_emph_cfg,
> +	.ver_ops		=3D &qcom_edp_phy_ops_nord,
> +	.phy_status_reg		=3D DP_PHY_STATUS_NORD,
> +	.bias1_en_2lane		=3D 0x03,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-nord-drv-d=
t-v1-0-e25c073cf1b6@oss.qualcomm.com?part=3D16
