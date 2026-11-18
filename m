Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005773;
	b=m8k0I8v+DKNZmibZtvCZeIMje6YEnFfzzzy1wngl6J/Iv0pHklDJsxKk8AYIlzp0bqmQ
	 1DwkI0g7Hit4OVVeSwaXjL1RLMAAS6YRALSnrF9dFxy+9kCI4OerMr4SDVp8qO4qGy9Fy
	 zVN4eY+lU5hd0SPG2SO2d7LFeW9ean2ynz1/jTkDhNswKokOExCsnqc0AJJXdQBQ8Xiu6
	 hM41GfQp5yaKXpnHeREB+2eWkaJftEK8e02THsEadm7vIBgvX0kbwL+1lKRJ9Q9xqhyAb
	 wZ5xxowPUxyFYijOzNCweX+CHD927/WgtwCrokbGnh94ab8u56Wj7EtvustxiXcSotw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005773;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2GFlolVXl1DDHso0oPTj7h2hEMlDqIWKZaEJs1SKJKg=;
	b=ktG2ca9Dwc5aDQ9dZwBR4BwlqqVPtOG4Loa0kzwto2kCV+/BoE9ZDeo91CucJAYePM6d
	 V/r3X+3GwNmYGSCu278ygfB6990uO5e/GY8tl1XN4FzjoPfD+lv/g7mUksv9UooKs8GzE
	 ebXT0YarRpyrxEoqXq2AX4wJGJT2ovlzcwUnAtT8QYCmWIcbgW6o8FOsre3dRX1DIT90h
	 IxjpuuA6Oe4Sy+Ca8jhtCrNRGYmoqRB2GcVvjXBwAW1Q2C3FsVPp8g26fHcmtovZmzPrb
	 5HzwNBdDMPYPuGCK23oKLfCOLS1pT+Ve3u5VxbHEuTxJcrQnDNQll9yJyL2RVCk4jlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FdGV0Q1y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E39B606A33B
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FdGV0Q1y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158111F000C6;
	Wed, 18 Nov 2026 12:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005773;
	bh=2GFlolVXl1DDHso0oPTj7h2hEMlDqIWKZaEJs1SKJKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FdGV0Q1yCTdV5iH6JwcHGxYMIP2HpP5oApko5TJ7dyybw8FbX0ZDae5ByCsmkBTt4
	 iftWKD1EbIeHdLHVrK6CBlgz16jaH6E5gPRIKwOjypIqBvoHyoIGZhldkuE4SA98Ow
	 VPZCN71NsyfmcYeLQm3b0lwz1bn6SRTcCJe4vUp7vBjOJxs3kD4u4mXRH0kV0MeiQq
	 weCmKU5VmI+sosMPnQ0wGL8XWHLu0BFDyKvyqEQEy7/dVfW3/82T23cDRrWFWONRuN
	 YeZrFH0R1zR0fzw4fXXmCj9djkfytDj5qAWTQfgfKF1SqSu9aPR8uiyMcqSQQt39EF
	 VyDAhHHKp6EgQ==
Message-ID: <sashiko-outbox-220933@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 14/15] net: pcs: airoha: add PCS driver for
 Airoha AN7581 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117123956.11981-15-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
 <20261117123956.11981-15-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:42:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] net: pcs: airoha: broken syscon lookup and RMW race on
  airoha,scu
- [High] net: pcs: airoha: missing 1000BASE-X setup in
  airoha_pcs_config() and link_up()
- [High] net: pcs: airoha: invalid in-band AN capability reported for
  2500BASE-X
- [High] net: pcs: airoha: unsynchronized shared PLLs and resets on
  dual-port PCIe PCS
- [Medium] net: pcs: airoha: stale forced register bits across interface
  mode changes
- [Medium] net: pcs: airoha: link left up in
  airoha_pcs_get_state_10gbaser() default case
- [Medium] net: pcs: airoha: missing rxlock_workaround() call in
  airoha_pcs_get_state_10gbaser()
--

commit 6861815bdffccd11682b61e1e2c5599025467a68
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: airoha: add PCS driver for Airoha AN7581 SoC

This commit adds a phylink PCS provider driver for the Ethernet, PON, PCIe,
and USB SerDes controllers on the Airoha AN7581 SoC.

> diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs=
/airoha/pcs-airoha-common.c
> new file mode 100644
> index 0000000000000..8a764b95d4d1f
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-airoha-common.c
[ ... ]
> +static void airoha_pcs_get_state_usxgmii(struct airoha_pcs_priv *priv, i=
nt index,
> +					 struct phylink_link_state *state)
> +{
> +	const struct airoha_pcs_match_data *data =3D priv->data;
> +	struct airoha_pcs_maps *maps =3D &priv->maps[index];
> +	u32 an_done =3D 0, lpa =3D 0;
> +
> +	/* Trigger HW workaround if needed. If an error is reported,
> +	 * consider link down and test again later.
> +	 */
> +	if (data->rxlock_workaround && data->rxlock_workaround(priv, index)) {
> +		state->link =3D false;
> +		return;
> +	}
[ ... ]
> +static void airoha_pcs_get_state_10gbaser(struct airoha_pcs_priv *priv, =
int index,
> +					  struct phylink_link_state *state)
> +{
> +	struct airoha_pcs_maps *maps =3D &priv->maps[index];
> +	u32 status =3D 0, curr_mode =3D 0;
> +
> +	/* Toggle AN Status */

[Severity: Medium]
Should airoha_pcs_get_state_10gbaser() also call data->rxlock_workaround()
before reading the link status, just like airoha_pcs_get_state_usxgmii()
does?

10GBASE-R uses the same PMA, CDR, and usxgmii_pcs hardware blocks as
USXGMII, and an7581_pcs_rxlock_workaround() checks
AIROHA_PCS_USXGMII_PCS_STUS_1 against the PMA RX SigDet module to reset the
CDR when RX fails to lock.  Without that call here, a 10GBASE-R link that
hits this hardware condition will never trigger the CDR reset recovery and
will stay down.

> +	regmap_set_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_CONTROL_6,
> +			AIROHA_PCS_USXGMII_TOG_PCS_AUTONEG_STS);
> +	regmap_clear_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_CONTROL_=
6,
> +			  AIROHA_PCS_USXGMII_TOG_PCS_AUTONEG_STS);
> +
> +	regmap_read(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_BASE_R_10GB_T_PCS_STU=
S_1,
> +		    &status);
> +	regmap_read(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_STATS_0, &curr=
_mode);
> +
> +	state->link =3D !!(status & AIROHA_PCS_USXGMII_RX_LINK_STUS);
> +
> +	switch (curr_mode & AIROHA_PCS_USXGMII_CUR_USXGMII_MODE) {
> +	case AIROHA_PCS_USXGMII_CUR_USXGMII_MODE_10G:
> +		state->speed =3D SPEED_10000;
> +		break;
> +	case AIROHA_PCS_USXGMII_CUR_USXGMII_MODE_5G:
> +		state->speed =3D SPEED_5000;
> +		break;
> +	case AIROHA_PCS_USXGMII_CUR_USXGMII_MODE_2_5G:
> +		state->speed =3D SPEED_2500;
> +		break;
> +	default:
> +		state->speed =3D SPEED_UNKNOWN;
> +		return;
> +	}

[Severity: Medium]
Does returning in the default case leave state->link set to true when
AIROHA_PCS_USXGMII_RX_LINK_STUS is set?

When phylink_resolve() sees state->link true with SPEED_UNKNOWN, it calls
phylink_link_up(), where airoha_pcs_link_up() hits its own default case on
SPEED_UNKNOWN and returns early before clearing AIROHA_PCS_XFI_RXMPI_STOP |
AIROHA_PCS_XFI_RXMBI_STOP | AIROHA_PCS_XFI_TXMPI_STOP |
AIROHA_PCS_XFI_TXMBI_STOP in AIROHA_PCS_XFI_MAC_XFI_GIB_CFG.  phylink then
reports the carrier as up while the PCS datapath remains stopped.

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
Should this block also run for PHY_INTERFACE_MODE_1000BASEX?

phylink_mii_c22_pcs_encode_advertisement() encodes the Clause 37
1000BASE-X full-duplex and pause advertisement bits, but because this check
only matches PHY_INTERFACE_MODE_SGMII, 1000BASE-X never programs
AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_4 or toggles
AIROHA_PCS_HSGMII_AN_SGMII_RA_ENABLE in
AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_0.

In addition, airoha_pcs_config() clears AIROHA_PCS_LINK_MODE_P0 and
AIROHA_PCS_FORCE_SPD_MODE_P0 in AIROHA_PCS_MULTI_SGMII_SGMII_STS_CTRL_0 for
SGMII, 1000BASE-X, and 2500BASE-X, but the non-inband branch of
airoha_pcs_link_up() only sets them back for PHY_INTERFACE_MODE_SGMII and
PHY_INTERFACE_MODE_2500BASEX, leaving forced 1000BASE-X without its link
speed configured in multi_sgmii.

[ ... ]

> +static unsigned int airoha_pcs_inband_caps(struct phylink_pcs *pcs,
> +					   phy_interface_t interface)
> +{
> +	return LINK_INBAND_ENABLE | LINK_INBAND_DISABLE;
> +}

[Severity: High]
Does advertising LINK_INBAND_ENABLE for PHY_INTERFACE_MODE_2500BASEX break
2500BASE-X link bring-up when in-band negotiation is requested?

When phylink_pcs_neg_mode() sees LINK_INBAND_ENABLE for 2500BASE-X, it can
select PHYLINK_PCS_NEG_INBAND_ENABLED.  However, airoha_pcs_config()
unconditionally clears AIROHA_PCS_HSGMII_AN_SGMII_RA_ENABLE for
PHY_INTERFACE_MODE_2500BASEX, and airoha_pcs_link_up() only handles
PHY_INTERFACE_MODE_SGMII when neg_mode =3D=3D PHYLINK_PCS_NEG_INBAND_ENABLE=
D,
skipping the else branch that programs AIROHA_PCS_LINK_MODE_P0_2_5G |
AIROHA_PCS_FORCE_SPD_MODE_P0 in AIROHA_PCS_MULTI_SGMII_SGMII_STS_CTRL_0.
Returning LINK_INBAND_DISABLE for PHY_INTERFACE_MODE_2500BASEX (and
PHY_INTERFACE_MODE_10GBASER) would match what the hardware configuration
supports.

[ ... ]

> +	/* SCU is used to toggle XFI or HSGMII in global SoC registers */
> +	if (!priv->phy) {
> +		priv->scu =3D syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,sc=
u");
> +		if (IS_ERR(priv->scu))
> +			return PTR_ERR(priv->scu);
> +	}

[Severity: High]
Does syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,scu") always
return -EPROBE_DEFER on AN7581?

The "airoha,scu" phandle points to the clock-controller@1fb00000 node,
whose compatible is "airoha,en7581-scu" without "syscon", and
en7581_clk_hw_init() in drivers/clk/clk-en7523.c maps that region with
devm_platform_ioremap_resource() without registering a syscon regmap.
syscon_regmap_lookup_by_phandle() therefore never finds a registered syscon
and permanently defers probe for the Ethernet, PON, and PCIe PCS devices.

Furthermore, en7581_serdes_phy_set_mode() in drivers/clk/clk-en7523.c
already modifies the same SCU registers (REG_NP_SCU_SSR3 at 0x94 and
REG_NP_SCU_SSTR at 0x9c) using raw readl()/writel() under
en_clk_priv::lock, which would race with regmap_update_bits(priv->scu, ...)
in airoha_pcs_setup_scu_eth(), airoha_pcs_setup_scu_pon(), and
airoha_pcs_setup_scu_pcie().

> diff --git a/drivers/net/pcs/airoha/pcs-an7581.c b/drivers/net/pcs/airoha=
/pcs-an7581.c
> new file mode 100644
> index 0000000000000..95e155a7fa621
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-an7581.c
[ ... ]
> +	/* Set RX rate ctrl */
> +	if (interface =3D=3D PHY_INTERFACE_MODE_2500BASEX)
> +		regmap_update_bits(pcs_pma, AIROHA_PCS_PMA_RX_FLL_2,
> +				   AIROHA_PCS_PMA_CK_RATE,
> +				   AIROHA_PCS_PMA_CK_RATE_10);

[Severity: Medium]
If a port switches interface modes at runtime, do several mode-specific
register fields retain stale values from the previous mode?

Here in an7581_pcs_rx_bringup(), AIROHA_PCS_PMA_CK_RATE is set for
2500BASE-X but never restored for other modes, and
AIROHA_PCS_PMA_FORCE_SEL_DA_FE_VOS in AIROHA_PCS_PMA_PXP_RX_FE_VOS is set
for non-10G modes but never cleared when switching to USXGMII or 10GBASE-R.
Similarly, in airoha_pcs_config(), AIROHA_PCS_HSGMII_PCS_MODE2_EN,
AIROHA_PCS_HSGMII_PCS_MAC_MODE, and AIROHA_PCS_HSGMII_PCS_FORCE_RATEADAPT
in AIROHA_PCS_HSGMII_PCS_CTROL_6, AIROHA_PCS_SGMII_SEND_AN_ERR_EN in
AIROHA_PCS_HSGMII_PCS_CTROL_1, and AIROHA_PCS_HSGMII_AN_FORCE_AN_DONE in
AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_FORCE_CL37 are set for SGMII/1000BASE-X
but not cleared for 2500BASE-X; and in airoha_pcs_link_up(),
AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_EN in
AIROHA_PCS_HSGMII_RATE_ADAPT_CTRL_11 and
AIROHA_PCS_HSGMII_PCS_FORCE_CUR_SGMII_MODE_SEL in
AIROHA_PCS_HSGMII_PCS_AN_SGMII_MODE_FORCE are set for 10GBASE-R and forced
SGMII respectively without being cleared in other modes.

[ ... ]

> +int an7581_pcs_bringup(struct airoha_pcs_priv *priv, int index,
> +		       phy_interface_t interface)
> +{
> +	struct regmap_field **pcs_ana_fields =3D priv->pcs_ana_fields[index];
> +
> +	/* Enable Analog Common Lane */
> +	regmap_field_write(pcs_ana_fields[AN7581_PCS_CMN_EN], 0x1);
> +
> +	/* Setup PLL */
> +	an7581_pcs_pll_bringup(priv, index, interface);
> +
> +	msleep(100);
> +
> +	/* Setup PHYA */
> +	return an7581_pcs_phya_bringup(priv, index, interface);
> +}

[Severity: High]
On the dual-port PCIe PCS ("airoha,an7581-pcs-pcie", num_port =3D 2), can
configuring or bringing up one port disrupt or race with the other port?

Each port registers its own phylink_pcs instance attached to a separate
phylink state lock, and struct airoha_pcs_priv has no lock serializing
operations across the two ports.  When either port runs
airoha_pcs_pre_config() -> airoha_pcs_setup_scu(), it asserts and deasserts
the shared device-wide priv->rsts ("mac" and "phy") reset lines.  Then, in
airoha_pcs_config() -> an7581_pcs_bringup(), both an7581_pcs_jcpll_bringup()
and an7581_pcs_txpll_bringup() operate on priv->pcs_pma[0] and the shared
JCPLL and TXPLL registers in priv->pcs_ana, force-disabling both PLLs and
reprogramming interface-dependent parameters while the sibling port may be
passing traffic or calibrating:

CPU0 (port 0)                         CPU1 (port 1)
airoha_pcs_config()
  an7581_pcs_bringup()
    an7581_pcs_pll_bringup()
      /* enables JCPLL & TXPLL */
    msleep(100)
    an7581_pcs_phya_bringup()
      an7581_pcs_rx_prcal()
                                      airoha_pcs_pre_config()
                                        airoha_pcs_setup_scu()
                                          reset_control_bulk_assert(priv->r=
sts)
                                      airoha_pcs_config()
                                        an7581_pcs_bringup()
                                          an7581_pcs_txpll_bringup()
                                            /* force-disables shared TXPLL =
*/
        an7581_pcs_apply_cdr_pr_idac()
          /* calibrates with PLL disabled */  <-- calibration / link failure

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117123956.1198=
1-1-ansuelsmth@gmail.com?part=3D14
