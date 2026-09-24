Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C55F2E62A4
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 01:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212187; cv=none; b=ft9wXjYdzhfSlq/UfAL20jQEKubxBGRVb7E/u/2jvBgH/aNVCqSICQqzbMp8blSaNSWERBNp0nMiw2t20t24sDvknP8wVNTVZrNrJylhdMPeesjZRkD1FLrwS/XMfqZ0IsNBBmkw0fbW7wQ0a7FhuM85oNhyfv+eBoHXIomH2xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212187; c=relaxed/simple;
	bh=PHkLKt4d4QIlfY63V+uWzQBjlxFIGDo36Oj45nlJ0QQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JuxdJn0TwvU4B8xwqFQ0/hH4yx0eG8pm58KX/f8xxvhvQzTXczHqyJQ4HvjqkE/el3XEuo/Bx8jYPqPD2bnPcc4fgV831U+VPkc/NcmKNekYIMhFi6b/qG9jm0BopRUqbx7Jk5NU2/oB3Jw9mEJpZI/mnA3VWCLBuWRTlDfnnvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzBa65m7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzBa65m7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0434C1F00898;
	Thu, 24 Sep 2026 01:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790212186;
	bh=M9kO7FmtMEzP8gMrH+gvM8k0d3Azo2oY4SpE+5//blo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CzBa65m7BctmKIUNJ23SIyooSoufdi2XGWFomZkSHugH2CYn6H//4EJ1SoTyvG55V
	 MBiJTfPk9h7Vcs4cNDVNHt0Zueis711nDphL2zfUhtpxk6U6Fy66sa5t2ACBTeOEiK
	 grdDy0QvxqNfVItdDdgM7rrF067+KLOBMkHq/8euWx+9rS3GErZ/mUQcdRm6EsSX2h
	 qrBTL0D4Y5sBC/BfLQFV1cuAST4tMw57hKg5X4X4KvfUd/xkWgosi0zr9e75h+NjZ7
	 AB3XACCxyDCBipo79qjkVLqyJ7RNIOb1j8c8ettpbdpI3e3x+gBAQmzXtnr9WW5Dmj
	 dS1Q8wrIR6N+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC net-next 9/9] net: stmmac: qcom-ethqos: add Qualcomm
 Nord support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-9-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-9-4b1c682af70f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 01:09:45 +0000
Message-Id: <20260924010946.0434C1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] net: stmmac: qcom-ethqos: USXGMII clock remains disabled due to co=
py-paste error
- [High] net: stmmac: qcom-ethqos: SGMII loopback permanently enabled for n=
on-SerDes PHY modes on Nord
- [High] net: stmmac: qcom-ethqos: missing USXGMII SerDes PHY mode configur=
ation
- [Low] net: stmmac: qcom-ethqos: build failure due to undeclared DWMAC_COR=
E_25GMAC
--

commit f5df70773c629bcedc94b2086fbc5776c1a49506
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: qcom-ethqos: add Qualcomm Nord support

This commit adds support for the Qualcomm Nord ETHQOS controllers based on
the Synopsys DesignWare 25GMAC IP. It configures the Nord platform data,
DW25GMAC core register layout, USXGMII wrapper programming, and an EEE clock
vote.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index a99a78880c0fb..a03c8e203920a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
[ ... ]
> @@ -201,6 +229,15 @@ qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *e=
thqos, bool enable)
>  		      EMAC_WRAPPER_SGMII_PHY_CNTRL1);
>  }
> =20
> +static void
> +qcom_ethqos_set_sgmii_loopback_nord(struct qcom_ethqos *ethqos, bool ena=
ble)
> +{
> +	rgmii_updatel(ethqos,
> +		      SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN,
> +		      enable ? SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN : 0,
> +		      EMAC_WRAPPER_SGMII_PHY_CNTRL1_V4);
> +}

[Severity: High]
Does this leave the SGMII loopback permanently enabled for non-SerDes PHY
modes on Nord?

Looking at ethqos_clks_config(), .set_sgmii_loopback(..., true) is called
unconditionally. However, for non-SerDes modes, .mac_finish is NULL, so
.set_sgmii_loopback(..., false) is never invoked.

The generic qcom_ethqos_set_sgmii_loopback() has a safety check for
ethqos->needs_sgmii_loopback and ethqos->phy_mode to prevent this, but the
new Nord-specific function lacks it.

[ ... ]
> @@ -485,6 +527,47 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqo=
s *ethqos, int speed)
>  	return 0;
>  }
> =20
> +static void ethqos_configure_usxgmii(struct qcom_ethqos *ethqos)
> +{
[ ... ]
> +	rgmii_updatel(ethqos, USXGMII_CLK_BLK_GMII_CLK_BLK_SEL, 0,
> +		      EMAC_WRAPPER_USXGMII_MUX_SEL);
> +	rgmii_updatel(ethqos, USXGMII_CLK_BLK_CLK_EN, 0,
> +		      EMAC_WRAPPER_USXGMII_MUX_SEL);
> +
> +	rgmii_updatel(ethqos, USXGMII_CLK_BLK_GMII_CLK_BLK_SEL,
> +		      USXGMII_CLK_BLK_GMII_CLK_BLK_SEL,
> +		      EMAC_WRAPPER_USXGMII_MUX_SEL);
> +}

[Severity: High]
Will this leave the USXGMII clock permanently disabled?

The code clears USXGMII_CLK_BLK_CLK_EN to disable the clock, but then
incorrectly writes to USXGMII_CLK_BLK_GMII_CLK_BLK_SEL again instead of
setting USXGMII_CLK_BLK_CLK_EN to re-enable it.

This appears to be a copy-paste error that will prevent the network interfa=
ce
from functioning in USXGMII mode.

[ ... ]
> @@ -625,7 +708,8 @@ static int ethqos_mac_finish_serdes(struct net_device=
 *ndev, void *priv,
>  	struct qcom_ethqos *ethqos =3D priv;
>  	int ret =3D 0;
> =20
> -	qcom_ethqos_set_sgmii_loopback(ethqos, false);
> +	if (ethqos->set_sgmii_loopback)
> +		ethqos->set_sgmii_loopback(ethqos, false);
> =20
>  	if (interface =3D=3D PHY_INTERFACE_MODE_SGMII ||
>  	    interface =3D=3D PHY_INTERFACE_MODE_2500BASEX)
>  		ret =3D phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
>  				       interface);
> =20
>  	return ret;
>  }

[Severity: High]
Is the PHY_INTERFACE_MODE_USXGMII check missing here?

Since this function is now configured as the .mac_finish callback for the
newly added PHY_INTERFACE_MODE_USXGMII, omitting it from this condition
causes the SerDes PHY configuration to be silently bypassed, which will
prevent link establishment.

[ ... ]
> @@ -817,8 +924,33 @@ static int qcom_ethqos_probe(struct platform_device =
*pdev)
>  	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>  }
> =20
> +static const struct ethqos_emac_por emac_nord_por[] =3D {
> +	{ .offset =3D RGMII_IO_MACRO_CONFIG,    .value =3D 0x00C04D03 },
> +	{ .offset =3D SDCC_HC_REG_DLL_CONFIG,   .value =3D 0x2004642C },
> +	{ .offset =3D RGMII_IO_MACRO_CONFIG2,   .value =3D 0x00222060 },
> +	{ .offset =3D RGMII_IO_MACRO_SCRATCH_2, .value =3D 0x4c },
> +};
> +
> +static const struct ethqos_emac_driver_data emac_nord_data =3D {
> +	.rgmii_por =3D emac_nord_por,
> +	.num_rgmii_por =3D ARRAY_SIZE(emac_nord_por),
> +	.dma_addr_width =3D 40,
> +	.link_clk_name =3D "phyaux",
> +	.core_type =3D DWMAC_CORE_25GMAC,

[Severity: Low]
Does this cause a build failure?

The patch assigns DWMAC_CORE_25GMAC to .core_type, but this enum value is
not defined in enum dwmac_core_type in include/linux/stmmac.h.

> +	.set_sgmii_loopback =3D qcom_ethqos_set_sgmii_loopback_nord,
> +	.dwxgmac_addrs =3D {
> +		.dma_even_chan_base =3D 0x00008500,
> +		.dma_odd_chan_base  =3D 0x00008580,
> +		.dma_chan_offset    =3D 0x00001000,
> +		.mtl_chan_base      =3D 0x00008000,
> +		.mtl_chan_offset    =3D 0x00001000,
> +		.timestamp_base     =3D 0x00007000,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-qcom_xpcs_=
nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com?part=3D9
