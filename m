Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836677;
	b=YqfYVzGUHR9WAX7JL+bI74qASC5h3QGfrpXmZBDlRJy4NF6bveAn+uy8+Ut9nQVe0bee
	 ZVTXzXmtd+3Uuf0oPzp8Ui9MPUXHhMnZgV7XOu40F2QmPIpUfWLRPbMVaifpv9g6HxQ7Y
	 4VE/dcNNqf+bNfAJHRzSRK047R/sywdtNZBFNvSbXveuaE0HQ/kTGuaIlCe7Qi+zzZST6
	 eYuXft4dHtwWDlzUk+yBCfR4Xy3oSxEi6XOU7x3JptVQ0/bxfQJdd1RBzYRJQG74YsEtp
	 wxnza/z2iQjzwfw4qfpnZVHUgzyEWMQO17dDKNQAfP4IfVdN4nwmzrnLdcumorxQH0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836677;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZB7/fR3G3xPQ2TEQq2wWWvk5pwsC+bKitpxTB4jxwOU=;
	b=OAzFvlbp+CoW21DacQ4gSzT66KxVZk5HcBt/jbZ3h0zpsx3cLug/E2hdMZJJdFQxX6cN
	 GxsVpexw2s1fxg3iKPg+iwYDQczkv1yUROi8HL4NgdWc8QdV5orVSa6tdbCyLLb80vE9f
	 LCOzB7FFWZmV5UruG3rci1RFEklTgzWqn2KiLFQz6fcHt8oZqAWZYzSHZbY3R31RKcPc7
	 jPekeb5nl9yV75SeTW4DxwAhnSbP/IQXJRieBj/39jP+9POhVo+cGnGxq9a1e+aNQuW3g
	 ehMYUTuALXATkzutAu1ckc/hchf0XaQjLQaF7U9ikHeP2eq0CpaCY7DHDDlHcXKk+IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTZdlw1S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A655F606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTZdlw1S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1AA1F000C4;
	Mon, 16 Nov 2026 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794836677;
	bh=ZB7/fR3G3xPQ2TEQq2wWWvk5pwsC+bKitpxTB4jxwOU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TTZdlw1S13KnQRAwnlN1jlxDbbEl7xOAbQ9ikEINOiNV3d/7BuQLAPOCc1LHIUmqN
	 zfomsykx0nQDp7pit6MqO1VbBy4xzbqdF9TWAhI8eSli1SoqwDVU7oFfoDmgQbpwFM
	 guzWiCOMSr3Xg0Q9GvNWseRpVA3raEl+/34GaGrZ0BepgPl2870F/fUWXyTd7LdPaH
	 79f3IVyk6mFRAnHJwow83xg15z2bEb/G7KZbU5cM4RWF2xRTnJBKvlHer9PS3vpkyF
	 f17vbugn9lgSONJbicssfjHa09ODzCBBDLIRL3imDzXUcja1qYeSBg8G3x1DSlFkd+
	 lKU5Cp0Pf1HEg==
Message-ID: <sashiko-outbox-217102@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/11] phy: qcom: edp: Add Nord eDP/DP PHY support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261116-nord-drv-dt-v3-11-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
 <20261116-nord-drv-dt-v3-11-e3d3bf0e2c49@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 13:44:36 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] phy: qcom: edp: duplicated v6/v8 definitions and misplaced Nord
  code
- [Low] phy: qcom: edp: asymmetric DRV_LVL writes in
  qcom_edp_tx_res_config_nord()
--

commit d8ce2b9ae0271c780b642dc599049c73dd865127
Author: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

phy: qcom: edp: Add Nord eDP/DP PHY support

This commit adds eDP/DP PHY support, callbacks, configuration tables, and t=
he
qcom,nord-dp-phy compatible string for the Qualcomm Nord SoC.

> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/p=
hy-qcom-edp.c
> index c61e57cc2aa7b..d5de6d322f023 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -27,6 +27,7 @@
>  #include "phy-qcom-qmp-qserdes-com-v6.h"
> =20
>  #include "phy-qcom-qmp-qserdes-dp-com-v8.h"
> +#include "phy-qcom-qmp-qserdes-dp-com-v8-nord.h"
> =20
>  /* EDP_PHY registers */
>  #define DP_PHY_CFG                              0x0010
> @@ -1514,6 +1515,262 @@ static int qcom_edp_phy_probe(struct platform_dev=
ice *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
> =20
> +static const u8 nord_dp_pre_emp_hbr_rbr[4][4] =3D {

[ ... ]

> +static const u8 edp_phy_vco_div_cfg_nord[4] =3D {
> +	0x00, 0x00, 0x02, 0x01,
> +};
> +
> +static int qcom_edp_ldo_config_nord(const struct qcom_edp *edp)
> +{
> +	const struct phy_configure_opts_dp *dp_opts =3D &edp->dp_opts;
> +
> +	writel(0xd0, edp->tx0 + TXn_LDO_CONFIG);
> +	writel(dp_opts->lanes > 2 ? 0xd0 : 0x00, edp->tx1 + TXn_LDO_CONFIG);
> +	writel(0x03, edp->edp + DP_PHY_LDO_CFG_NORD);
> +
> +	return 0;
> +}
> +
> +static int qcom_edp_tx_res_config_nord(const struct qcom_edp *edp)
> +{
> +	writel(0x06, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
> +	writel(0x06, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
> +	writel(0x06, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
> +	writel(0x06, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
> +	writel(0x06, edp->tx0 + TXn_TX_EMP_POST1_LVL);
> +	writel(0x06, edp->tx1 + TXn_TX_EMP_POST1_LVL);
> +	writel(0x05, edp->tx0 + TXn_TX_BAND_NORD);
> +	writel(0x05, edp->tx1 + TXn_TX_BAND_NORD);
> +	writel(0x12, edp->edp + DP_PHY_TX_LN0_DRV_LVL_NORD);
> +	writel(0x12, edp->edp + DP_PHY_TX_LN1_DRV_LVL_NORD);
> +
> +	return 0;
> +}

[Severity: Low]
As reported by Dmitry Baryshkov on v2 [1], should initial TX drive-level
programming be handled symmetrically between qcom_edp_tx_res_config_nord()
and qcom_edp_tx_res_config_default()?

qcom_edp_tx_res_config_nord() programs DP_PHY_TX_LN0_DRV_LVL_NORD and
DP_PHY_TX_LN1_DRV_LVL_NORD, whereas qcom_edp_tx_res_config_default() omits
TXn_TX_DRV_LVL and leaves those writes hardcoded in qcom_edp_phy_power_on():

drivers/phy/qualcomm/phy-qcom-edp.c:qcom_edp_phy_power_on() {
    ...
	ret =3D edp->cfg->ver_ops->tx_res_config(edp);
	if (ret)
		return ret;
	writel(0x1f, edp->tx0 + TXn_TX_DRV_LVL);
	writel(0x1f, edp->tx1 + TXn_TX_DRV_LVL);
    ...
}

Because qcom_edp_phy_power_on() unconditionally writes 0x1f to TXn_TX_DRV_L=
VL
after calling tx_res_config(), Nord still executes the legacy TXn_TX_DRV_LVL
writes even though it relocates drive-level control to
DP_PHY_TX_LN0_DRV_LVL_NORD and DP_PHY_TX_LN1_DRV_LVL_NORD.

> +
> +static int qcom_edp_phy_power_on_nord(const struct qcom_edp *edp)
> +{
> +	u32 val;
> +
> +	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> +	       edp->edp + DP_PHY_PD_CTL);
> +	writel(0xfc, edp->edp + DP_PHY_MODE);
> +
> +	return readl_poll_timeout(edp->pll + NORD_DP_QSERDES_COM_CMN_STATUS,
> +				  val, val & BIT(7), 5, 200);
> +}
> +
> +static int qcom_edp_phy_com_resetsm_cntrl_nord(const struct qcom_edp *ed=
p)
> +{
> +	u32 val;
> +
> +	writel(0x20, edp->pll + NORD_DP_QSERDES_COM_RESETSM_CNTRL);
> +
> +	return readl_poll_timeout(edp->pll + NORD_DP_QSERDES_COM_C_READY_STATUS,
> +				  val, val & BIT(0), 500, 10000);
> +}

[ ... ]

>  static const struct of_device_id qcom_edp_phy_match_table[] =3D {
>  	{ .compatible =3D "qcom,glymur-dp-phy", .data =3D &glymur_phy_cfg, },
>  	{ .compatible =3D "qcom,sa8775p-edp-phy", .data =3D &sa8775p_dp_phy_cfg=
, },
> @@ -1522,6 +1779,7 @@ static const struct of_device_id qcom_edp_phy_match=
_table[] =3D {
>  	{ .compatible =3D "qcom,sc8280xp-dp-phy", .data =3D &sc8280xp_dp_phy_cf=
g, },
>  	{ .compatible =3D "qcom,sc8280xp-edp-phy", .data =3D &sc8280xp_edp_phy_=
cfg, },
>  	{ .compatible =3D "qcom,x1e80100-dp-phy", .data =3D &x1e80100_phy_cfg, =
},
> +	{ .compatible =3D "qcom,nord-dp-phy", .data =3D &nord_edp_phy_cfg, },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, qcom_edp_phy_match_table);

[Severity: Low]
Can Nord reuse the existing v6 and v8 definitions instead of duplicating
them?

All 40 NORD_DP_QSERDES_COM_* offsets in phy-qcom-qmp-qserdes-dp-com-v8-nord=
.h
are identical to the QSERDES_V6_COM_* offsets in
phy-qcom-qmp-qserdes-com-v6.h, which is already included in this file.
Consequently, qcom_edp_phy_power_on_nord() and
qcom_edp_phy_com_resetsm_cntrl_nord() are identical to
qcom_edp_phy_power_on_v6() and qcom_edp_phy_com_resetsm_cntrl_v6(), and
edp_phy_vco_div_cfg_nord is identical to edp_phy_vco_div_cfg_v8.

Also, the Nord register macros, configuration tables, and callbacks are
placed after qcom_edp_phy_probe() instead of alongside the other SoC
definitions earlier in the file, and qcom,nord-dp-phy is appended to the end
of the alphabetically sorted qcom_edp_phy_match_table[].

[1] https://lore.kernel.org/r/qqfucmyebsvemdr5px33wabsxxq4owozwmxcqu62sprs5=
k32bo@kb5pjx2m4ucq

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-nord-drv-d=
t-v3-0-e3d3bf0e2c49@oss.qualcomm.com?part=3D11
