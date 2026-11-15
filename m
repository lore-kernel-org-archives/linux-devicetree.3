Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739520;
	b=IAGmj50EqmrU7d5MAOK2K5wKLvLR8cxtIvAB7R2xEoRYvf2F0JolDNoDUzE01UumHMFt
	 +IH4BdtzyphjlajPtukJ77S1v7WASGMctqeMeugGC/gT459jh05UqSqlq804LT3rn3QIi
	 kl/0K+7XL+X8vqElOZLuNlC5FeUCvcctIhF1bftthKSeZBW47ba2hp/QxzE2ZXOsAIcsC
	 ySCoCa4IA0VtB4FMlxlom0J8UiFOTMSO2VzL3usroTuh00ngpQ/MwGfNaxsfkURziUkid
	 LzUqW1NqgU4o0Kb80NEd7szBi1IW0iRwik+ZbHriG3Q5p4JKMFQN7tMCQevqQb7wW4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739520;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nKfKyOmVgZmo5aJKEZI5PYurTLHg+pwPqMKfoGvIw+s=;
	b=dzX8ghrs8zWBewYNeVOtljfjcMkjuWdzeF4H/6m1fitCZIa0VGkvUAk33t8JoG18xf3s
	 azGVXLOJNjWElKzF0gqW+lvkbq0JV2sMJXEIn6hmdXJoXwdHJDbyHGACIvxw6pMdZ6/ZJ
	 XinCSrdajGH63YVmRCpHCJ/kxpxon/zIUeoQ3DWB+bImrO0hbNbLcOGOArFN3SBF+3q5v
	 L+HbLdKqyiMCt8/qEN7vGneF1Xw+LnjC2mXY2gcAGe99e5gDBC0IbKbsL6GXi31WKiThH
	 fGmGrYbzuYgV3pMziawRWOrXlsbTVr09nl0tzD+hTvTBfvt8nped/a6NjleSuEiJFlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVmVyVRZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E951A606A329
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVmVyVRZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76AA41F000C7;
	Sun, 15 Nov 2026 10:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739519;
	bh=nKfKyOmVgZmo5aJKEZI5PYurTLHg+pwPqMKfoGvIw+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JVmVyVRZMpWgsl6A94xOhZ3yB0SdIynw9gY1GobuP3sSyp25lFkkOstvb+QXccOSw
	 2101lHyVdNbr66RrH3G+xfSWRYLl3cque/UY1WezvkGjt9s5IiGsp2rIRnI2Fjogs+
	 vz311vr2qQV2e8cc/rtnE3gh45xlqom/WdVtrEQmoeJYQME9upywGOHtHhWj2BdVU0
	 kt/BE7SSwPBETPKBJwzU3JzFs6Ou6SfNbCX8F5pS5ptnVn6mhIyv5zRXdc4CEe3Elr
	 VxsG23RGc56oG6gQP4LPSb87gwsDIvv8Z/K6REUHzRj/yIFpPTKJKlIH0tsnqQIoGh
	 09Rvph9y2YfJg==
Message-ID: <sashiko-outbox-215404@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 14/15] net: pcs: airoha: add PCS driver for
 Airoha AN7581 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114104426.235620-15-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
 <20261114104426.235620-15-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:45:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] net: pcs: airoha: missing 1000BASE-X AN setup in
  airoha_pcs_config()
- [High] net: pcs: airoha: invalid in-band AN capability reported for
  2500BASE-X
- [High] net: pcs: airoha: broken syscon lookup and RMW race on
  airoha,scu
- [High] net: pcs: airoha: unsynchronized shared PLLs and resets in
  an7581_pcs_bringup()
- [Medium] net: pcs: airoha: missing Kconfig dependencies for PHYLINK
  and REGMAP_MMIO
- [Medium] net: pcs: airoha: uninitialized speed_reg in
  airoha_pcs_link_up()
--

commit 5496b74992ab5a11c007cdfeb5d147b3fefaeace
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: airoha: add PCS driver for Airoha AN7581 SoC

This commit adds a phylink PCS driver for the Ethernet, PON, PCIe and USB
SerDes on the Airoha AN7581 SoC, supporting USXGMII, 10GBASE-R, 2500BASE-X,
1000BASE-X and SGMII modes.

> diff --git a/drivers/net/pcs/airoha/Kconfig b/drivers/net/pcs/airoha/Kcon=
fig
> new file mode 100644
> index 0000000000000..1aa4c0d33b87d
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config PCS_AIROHA
> +	tristate
> +	select FWNODE_PCS
> +
> +config PCS_AIROHA_AN7581
> +	tristate "Airoha AN7581 PCS driver"
> +	depends on ARCH_AIROHA || COMPILE_TEST
> +	select PCS_AIROHA

[Severity: Medium]
Does PCS_AIROHA need dependencies or selects for PHYLINK, REGMAP_MMIO,
GENERIC_PHY and MFD_SYSCON?

airoha_pcs_init_named_regmap() calls devm_regmap_init_mmio() and
__an7581_pcs_alloc_regmap_fields() calls devm_regmap_field_alloc(), which
have no stubs when CONFIG_REGMAP is disabled and fail to link without
CONFIG_REGMAP_MMIO.  The driver also calls phylink helpers such as
phylink_mii_c22_pcs_decode_state(), phylink_decode_usxgmii_word() and
phylink_mii_c22_pcs_encode_advertisement() (which require CONFIG_PHYLINK),
devm_phy_get() and phy_set_mode_ext() (which fail to link if PCS_AIROHA=3Dy
and GENERIC_PHY=3Dm), and syscon_regmap_lookup_by_phandle() (which returns
-ENOTSUPP without CONFIG_MFD_SYSCON).

> diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs=
/airoha/pcs-airoha-common.c
> new file mode 100644
> index 0000000000000..9964d4df2ec97
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-airoha-common.c

[ ... ]

> +	/* Setup SGMII AN and advertisement in DEV_ABILITY */
> +	if (interface =3D=3D PHY_INTERFACE_MODE_SGMII) {
> +		if (neg_mode =3D=3D PHYLINK_PCS_NEG_INBAND_ENABLED) {
> +			int advertise =3D phylink_mii_c22_pcs_encode_advertisement(interface,
> +										 advertising);
> +			if (advertise < 0)
> +				return advertise;
> +
> +			regmap_update_bits(maps->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN=
_4,
> +					   AIROHA_PCS_HSGMII_AN_SGMII_DEV_ABILITY,
> +					   FIELD_PREP(AIROHA_PCS_HSGMII_AN_SGMII_DEV_ABILITY,
> +						      advertise));
> +
> +			regmap_set_bits(maps->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_0,
> +					AIROHA_PCS_HSGMII_AN_SGMII_RA_ENABLE);
> +		} else {
> +			regmap_clear_bits(maps->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_=
0,
> +					  AIROHA_PCS_HSGMII_AN_SGMII_RA_ENABLE);
> +		}
> +	}

[Severity: High]
Should this block also run when interface is PHY_INTERFACE_MODE_1000BASEX?

phylink_mii_c22_pcs_encode_advertisement() encodes the Clause 37
ADVERTISE_1000XFULL, ADVERTISE_1000XPAUSE and ADVERTISE_1000XPSE_ASYM bits
for 1000BASE-X (while returning constant 0x0001 for SGMII).  Guarding this
with only PHY_INTERFACE_MODE_SGMII leaves AIROHA_PCS_HSGMII_AN_SGMII_REG_AN=
_4
and AIROHA_PCS_HSGMII_AN_SGMII_RA_ENABLE unconfigured in 1000BASE-X mode,
breaking Clause 37 auto-negotiation and pause advertisement.

[ ... ]

> +		if (interface =3D=3D PHY_INTERFACE_MODE_SGMII ||
> +		    interface =3D=3D PHY_INTERFACE_MODE_2500BASEX) {
> +			u32 ck_gen_mode;
> +			u32 speed_reg;
> +			u32 if_mode;
> +
> +			switch (speed) {
> +			case SPEED_2500:
> +				speed_reg =3D AIROHA_PCS_LINK_MODE_P0_2_5G;
> +				break;
> +			case SPEED_1000:
> +				speed_reg =3D AIROHA_PCS_LINK_MODE_P0_1G;
> +				if_mode =3D AIROHA_PCS_HSGMII_AN_SPEED_FORCE_MODE_1000;
> +				ck_gen_mode =3D AIROHA_PCS_HSGMII_PCS_FORCE_CUR_SGMII_MODE_1000;
> +				break;
> +			case SPEED_100:
> +				speed_reg =3D AIROHA_PCS_LINK_MODE_P0_100M;
> +				if_mode =3D AIROHA_PCS_HSGMII_AN_SPEED_FORCE_MODE_100;
> +				ck_gen_mode =3D AIROHA_PCS_HSGMII_PCS_FORCE_CUR_SGMII_MODE_100;
> +				break;
> +			case SPEED_10:
> +				speed_reg =3D AIROHA_PCS_LINK_MODE_P0_10M;
> +				if_mode =3D AIROHA_PCS_HSGMII_AN_SPEED_FORCE_MODE_10;
> +				ck_gen_mode =3D AIROHA_PCS_HSGMII_PCS_FORCE_CUR_SGMII_MODE_10;
> +				break;
> +			}
> +
> +			if (interface =3D=3D PHY_INTERFACE_MODE_SGMII) {
> +				regmap_update_bits(maps->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_A=
N_13,
> +						   AIROHA_PCS_HSGMII_AN_SPEED_FORCE_MODE,
> +						   if_mode);
> +
> +				regmap_update_bits(maps->hsgmii_pcs, AIROHA_PCS_HSGMII_PCS_AN_SGMII_=
MODE_FORCE,
> +						   AIROHA_PCS_HSGMII_PCS_FORCE_CUR_SGMII_MODE |
> +						   AIROHA_PCS_HSGMII_PCS_FORCE_CUR_SGMII_MODE_SEL,
> +						   ck_gen_mode |
> +						   AIROHA_PCS_HSGMII_PCS_FORCE_CUR_SGMII_MODE_SEL);
> +			}
> +
> +			regmap_update_bits(maps->multi_sgmii, AIROHA_PCS_MULTI_SGMII_SGMII_ST=
S_CTRL_0,
> +					   AIROHA_PCS_LINK_MODE_P0 |
> +					   AIROHA_PCS_FORCE_SPD_MODE_P0,
> +					   speed_reg |
> +					   AIROHA_PCS_FORCE_SPD_MODE_P0);
> +		}

[Severity: Medium]
Can speed_reg be used uninitialized here when interface is
PHY_INTERFACE_MODE_2500BASEX?

Unlike the preceding USXGMII/10GBASER and SGMII/1000BASEX blocks, this
switch (speed) has no default: return; branch.  In 2500BASE-X mode,
execution skips the earlier blocks, so an unexpected speed leaves speed_reg
uninitialized when written to AIROHA_PCS_MULTI_SGMII_SGMII_STS_CTRL_0 (and
triggers compiler uninitialized-variable warnings, along with if_mode and
ck_gen_mode under SPEED_2500).

[ ... ]

> +static unsigned int airoha_pcs_inband_caps(struct phylink_pcs *pcs,
> +					   phy_interface_t interface)
> +{
> +	return LINK_INBAND_ENABLE | LINK_INBAND_DISABLE;
> +}

[Severity: High]
Does reporting LINK_INBAND_ENABLE for PHY_INTERFACE_MODE_2500BASEX break
2500BASE-X link configuration?

Because phylink_get_inband_type(PHY_INTERFACE_MODE_2500BASEX) is
INBAND_BASEX, returning LINK_INBAND_ENABLE causes phylink_pcs_neg_mode() to
select PHYLINK_PCS_NEG_INBAND_ENABLED when autonegotiation is advertised or
used with a PHY.  However, for 2500BASE-X, airoha_pcs_config()
unconditionally clears AIROHA_PCS_HSGMII_AN_SGMII_RA_ENABLE in hardware,
and airoha_pcs_link_up() only programs AIROHA_PCS_LINK_MODE_P0_2_5G in the
neg_mode !=3D PHYLINK_PCS_NEG_INBAND_ENABLED branch.

[ ... ]

> +	/* SCU is used to toggle XFI or HSGMII in global SoC registers */
> +	if (!priv->phy) {
> +		priv->scu =3D syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,sc=
u");
> +		if (IS_ERR(priv->scu))
> +			return PTR_ERR(priv->scu);
> +	}

[Severity: High]
Will syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,scu") permanently
return -EPROBE_DEFER on AN7581?

In arch/arm64/boot/dts/airoha/en7581.dtsi and
Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml, airoha,scu points
to the clock controller node with compatible =3D "airoha,en7581-scu", which
does not have "syscon" in its compatible list.  In drivers/clk/clk-en7523.c,
en7581_clk_hw_init() maps those registers with
devm_platform_ioremap_resource() and never registers a syscon regmap, so
syscon_node_to_regmap() always fails with -EPROBE_DEFER and prevents the
ETH, PON and PCIE PCS devices from probing.

In addition, en7581_serdes_phy_set_mode() in drivers/clk/clk-en7523.c
modifies REG_NP_SCU_SSR3 (0x94) and REG_NP_SCU_SSTR (0x9c) with raw
readl()/writel() under en_clk_priv::lock, which would race with
airoha_pcs_setup_scu() updating the same registers via regmap_update_bits().

> diff --git a/drivers/net/pcs/airoha/pcs-an7581.c b/drivers/net/pcs/airoha=
/pcs-an7581.c
> new file mode 100644
> index 0000000000000..95e155a7fa621
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-an7581.c

[ ... ]

> +	/* This comment only apply to Serdes PCIe that expose
> +	 * 2 PCS.
> +	 *
> +	 * The Serdes PCIe expose 2 PCS but always require
> +	 * the PMA for the first PCS to be configured
> +	 * for correct functionality for JCPLL.
> +	 */
> +	pcs_pma =3D priv->pcs_pma[0];
> +
> +	/* Setup LDO */
> +	usleep_range(200, 300);
> +
> +	regmap_field_set_bits(pcs_ana_fields[AN7581_PCS_JCPLL_SPARE_L],
> +			      AIROHA_PCS_ANA_JCPLL_SPARE_L_LDO);
> +
> +	/* Setup RSTB */
> +	regmap_field_write(pcs_ana_fields[AN7581_PCS_JCPLL_RST_DLY],
> +			   AIROHA_PCS_ANA_JCPLL_RST_DLY_150_200);
> +	regmap_field_write(pcs_ana_fields[AN7581_PCS_JCPLL_PLL_RSTB], 0x1);
> +
> +	/* Enable PLL force selection and Force Disable */
> +	regmap_update_bits(pcs_pma, AIROHA_PCS_PMA_PXP_JCPLL_CKOUT_EN,
> +			   AIROHA_PCS_PMA_FORCE_SEL_DA_JCPLL_EN |
> +			   AIROHA_PCS_PMA_FORCE_DA_JCPLL_EN,
> +			   AIROHA_PCS_PMA_FORCE_SEL_DA_JCPLL_EN);

[ ... ]

> +	/* This comment only apply to Serdes PCIe that expose
> +	 * 2 PCS.
> +	 *
> +	 * The Serdes PCIe expose 2 PCS but always require
> +	 * the PMA for the first PCS to be configured
> +	 * for correct functionality for TXPLL.
> +	 */
> +	pcs_pma =3D priv->pcs_pma[0];
> +
> +	/* Setup VCO LDO Output */
> +	regmap_field_write(pcs_ana_fields[AN7581_PCS_TXPLL_LDO_VCO_OUT], 0x1);
> +	regmap_field_write(pcs_ana_fields[AN7581_PCS_TXPLL_LDO_OUT], 0x1);
> +
> +	/* Setup RSTB */
> +	regmap_field_write(pcs_ana_fields[AN7581_PCS_TXPLL_PLL_RSTB], 0x1);
> +	regmap_field_write(pcs_ana_fields[AN7581_PCS_TXPLL_RST_DLY], 0x4);
> +	regmap_field_write(pcs_ana_fields[AN7581_PCS_TXPLL_REFIN_DIV],
> +			   AIROHA_PCS_ANA_TXPLL_REFIN_DIV_1);
> +	regmap_field_write(pcs_ana_fields[AN7581_PCS_TXPLL_REFIN_INTERNAL], 0x1=
);
> +
> +	/* Enable PLL force selection and Force Disable */
> +	regmap_update_bits(pcs_pma, AIROHA_PCS_PMA_PXP_TXPLL_CKOUT_EN,
> +			   AIROHA_PCS_PMA_FORCE_SEL_DA_TXPLL_EN |
> +			   AIROHA_PCS_PMA_FORCE_DA_TXPLL_EN,
> +			   AIROHA_PCS_PMA_FORCE_SEL_DA_TXPLL_EN);

[Severity: High]
On the 2-port PCIe SerDes PCS (airoha,an7581-pcs-pcie), can bringing up or
reconfiguring one port disrupt the other port?

The two ports are exposed as independent phylink_pcs instances driven by
separate phylink state machines without cross-port locking:

CPU0 (port 0 phylink)             CPU1 (port 1 phylink)
airoha_pcs_config(port 0)
  an7581_pcs_bringup()
    an7581_pcs_pll_bringup()
    msleep(100)
                                  airoha_pcs_pre_config(port 1)
                                    airoha_pcs_setup_scu()
                                      reset_control_bulk_assert(priv->rsts)
                                  airoha_pcs_config(port 1)
                                    an7581_pcs_jcpll_bringup()
                                      /* clears FORCE_DA_JCPLL_EN on pma[0]=
 */
                                    an7581_pcs_txpll_bringup()
                                      /* clears FORCE_DA_TXPLL_EN on pma[0]=
 */
    an7581_pcs_phya_bringup()  <-- calibrates while shared PLLs are disabled

Even when not racing concurrently, reconfiguring one port asserts the
shared device-wide MAC/PHY reset lines in airoha_pcs_setup_scu() and
force-disables and reprograms the shared JCPLL and TXPLL in
priv->pcs_pma[0] and priv->pcs_ana (including interface-dependent TXPLL
parameters), dropping an active link on the sibling port.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114104426.2356=
20-1-ansuelsmth@gmail.com?part=3D14
