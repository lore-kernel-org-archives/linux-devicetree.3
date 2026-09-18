Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E20931716E
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789692329; cv=none; b=GbnT6paQtZWmOmfRESjSR45nLuMXcvspwPMVh6YerPtYOjTRslKF+ooCSZ9/LsB2JndyxTRDQ6sY6U9TG5++1BuSmYd8hNIasv6r1JXU/G0ezpCjFX2iwomuiqdcyhtVdFxifCZDATAqKeO/9V5F68PLD4qkMV7hYpyk59bIorY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789692329; c=relaxed/simple;
	bh=RjIJlo4+EVcxZewnJg/C1xRXWE5ZALARL4nVd3GJyyE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=foAc+zwlLrqu375XGFh+f3FZGM0HujU/yeTMIygpayTgzgc4ZpXUoe4Mw6O1vbcqMtnELCpCZiHlB715SlAdaKbUoQzemca/2G6WE/l8nRIV+nYuQfL4AbHFw6pnSHdNUNdFF2sQMkR2v2ON0SKF9e+Cq85WMVNijE0npdlWxSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4lrNj6k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4lrNj6k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493D21F000FF;
	Fri, 18 Sep 2026 00:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789692325;
	bh=cgPqP+d5lik3IyNNSXFEq6LaVdBLWe4/dT/xN8UbxRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y4lrNj6kBDJM5+5d3S0yA2H9SUvyL8CM12ux0HqRgy3viOjwgLp5XMxg6lA2GjxXq
	 9qolOYgB14/DZZinPwpLi8ENGeIlf5jJdV2pc8pUaQ/NFDpzDDu0A1NC5gYCyD3kkJ
	 rlJeGzpW7f45u/92OJg43MxgiL0M6yUCA5cxLCDr5e3NNLiEoA9NjInQiPSOPwwDsW
	 zQ2hQ1V5jeY9htRNVtQtl7km7bHyntH5GCIYKARmFzkmEWNKY9KfgqT1SUjo9ZWXOA
	 0fuAxG01fEmYtpU+8lGHLsTzM89kyyqDVTJkNEkPdb01m3QGgwKlKuudYLKIf1Yvm0
	 1D5ufmArubbBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 11/12] net: pcs: airoha: add PCS driver for
 Airoha AN7581 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916235200.20712-12-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
 <20260916235200.20712-12-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 00:45:24 +0000
Message-Id: <20260918004525.493D21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] pcs: device-wide reset affects active sibling ports
- [High] pcs: missing phy_init and phy_power_on for generic PHY
- [High] pcs: missing locking and state tracking for shared PLLs
- [High] pcs: incorrect read-modify-write on W1C interrupt registers
- [Medium] pcs: missing cleanup for forced 1000BASEX AN flags
- [Medium] pcs: immediate reset deassertion lacks required delay
- [Medium] pcs: insufficient delay in RX signal hardware polling loop
--

commit a250ffe33504cd882a0d71d088548e87ac70aed4
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: airoha: add PCS driver for Airoha AN7581 SoC

This commit adds a new PCS driver for the Airoha AN7581 SoC. It supports
Ethernet, PON, PCIe, and USB SERDES blocks in various modes including USXGM=
II,
10G-BASER, 2500BASE-X, and SGMII.

> diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs=
/airoha/pcs-airoha-common.c
> --- a/drivers/net/pcs/airoha/pcs-airoha-common.c
> +++ b/drivers/net/pcs/airoha/pcs-airoha-common.c
> @@ -133,6 +133,6 @@ static int airoha_pcs_setup_scu(struct airoha_pcs_pri=
v *priv,
> =20
>  	ret =3D reset_control_bulk_assert(ARRAY_SIZE(priv->rsts),
>  					priv->rsts);
>  	if (ret)
>  		return ret;
> =20
>  	ret =3D reset_control_bulk_deassert(ARRAY_SIZE(priv->rsts),
>  					  priv->rsts);

[Severity: High]
This performs a device-wide macro reset every time the function is called f=
or a
single port. For multi-port devices like AIROHA_PCS_PCIE, wouldn't a
configuration change (like link up or down) on one port reset the entire
MAC/PHY block, disrupting active sibling ports?

[Severity: Medium]
Also, asserting and immediately deasserting the reset without a delay (such=
 as
usleep_range()) generates a near-instantaneous reset pulse. Is this suffici=
ent
for the hardware IP to properly clear its internal state machines?

[ ... ]

> @@ -274,18 +274,18 @@ static void airoha_pcs_interrupt_init_usxgmii(struc=
t airoha_pcs_priv *priv,
> =20
>  	/* Clear any pending interrupt */
>  	regmap_set_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_INT_STA_2,
>  			AIROHA_PCS_USXGMII_RPCS_FSM_DEC_ERR_INT |
>  			AIROHA_PCS_USXGMII_R_TYPE_E_INT |
>  			AIROHA_PCS_USXGMII_R_TYPE_T_INT |
>  			AIROHA_PCS_USXGMII_R_TYPE_D_INT);
> =20
>  	regmap_set_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_INT_STA_3,
>  			AIROHA_PCS_USXGMII_FAIL_SYNC_XOR_ST_INT |
>  			AIROHA_PCS_USXGMII_RX_BLOCK_LOCK_ST_INT |
>  			AIROHA_PCS_USXGMII_LINK_UP_ST_INT |
>  			AIROHA_PCS_USXGMII_HI_BER_ST_INT);
> =20
>  	regmap_set_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_INT_STA_4,
>  			AIROHA_PCS_USXGMII_LINK_DOWN_ST_INT);

[Severity: High]
Does using regmap_set_bits() (which performs a read-modify-write) on
Write-1-to-Clear (W1C) interrupt status registers unintentionally clear
unrelated pending interrupts? Since it reads the currently active interrupts
and writes them all back as 1s, it could drop all interrupts pending at the
time of the read. Should regmap_write() be used instead?

[ ... ]

> @@ -585,8 +585,8 @@ static int airoha_pcs_config(struct phylink_pcs *pcs,=
 unsigned int neg_mode,
> =20
>  	if (interface =3D=3D PHY_INTERFACE_MODE_1000BASEX &&
>  	    neg_mode !=3D PHYLINK_PCS_NEG_INBAND_ENABLED) {
>  		regmap_set_bits(maps->hsgmii_pcs, AIROHA_PCS_HSGMII_PCS_CTROL_1,
>  				AIROHA_PCS_SGMII_SEND_AN_ERR_EN);
> =20
>  		regmap_set_bits(maps->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_FOR=
CE_CL37,
>  				AIROHA_PCS_HSGMII_AN_FORCE_AN_DONE);
>  	}

[Severity: Medium]
These bits are set for out-of-band configurations, but there appears to be =
no
cleanup path (e.g., an else block) to clear them when inband is enabled. If
phylink later reconfigures the PCS with inband negotiation enabled, does the
PCS remain stuck with forced AN completion and broken inband autonegotiatio=
n?

[ ... ]

> @@ -776,3 +776,3 @@ static void airoha_pcs_pre_config(struct phylink_pcs =
*pcs,
> =20
>  	/* Select HSGMII or USXGMII in SCU regs */
>  	airoha_pcs_setup_scu(priv, port->index, interface);

[Severity: High]
The per-port pcs_pre_config callback triggers the global reset function
(airoha_pcs_setup_scu). Could this cause active sibling ports to be abruptly
disconnected when a configuration change occurs on one port?

[ ... ]

> @@ -1111,5 +1111,5 @@ static int airoha_pcs_probe(struct platform_device =
*pdev)
>  	if (data->port_type =3D=3D AIROHA_PCS_USB) {
>  		struct phy *phy;
> =20
>  		phy =3D devm_phy_get(dev, NULL);
>  		if (IS_ERR(phy))
>  			return dev_err_probe(dev, PTR_ERR(phy), "failed to get phy\n");
> =20
>  		priv->phy =3D phy;
>  	}

[Severity: High]
This retrieves the uninitialized generic PHY. Is it possible that the USB P=
CS
port remains non-functional because its PHY is left in a suspended or
uninitialized state without calls to phy_init() and phy_power_on()?

> diff --git a/drivers/net/pcs/airoha/pcs-an7581.c b/drivers/net/pcs/airoha=
/pcs-an7581.c
> --- a/drivers/net/pcs/airoha/pcs-an7581.c
> +++ b/drivers/net/pcs/airoha/pcs-an7581.c
> @@ -1058,3 +1058,3 @@ static void an7581_pcs_jcpll_bringup(struct airoha_=
pcs_priv *priv,
>  	/* This comment only apply to Serdes PCIe that expose
>  	 * 2 PCS.
>  	 *
>  	 * The Serdes PCIe expose 2 PCS but always require
>  	 * the PMA for the first PCS to be configured
>  	 * for correct functionality for JCPLL.
>  	 */
>  	pcs_pma =3D priv->pcs_pma[0];

[Severity: High]
This explicitly accesses a shared register map (pcs_pma[0]) from a per-port
callback. Since there is no mutex or initialization state tracking, wouldn't
concurrent or asynchronous bringups of the second port re-initialize shared=
 PLLs
and disrupt the already active first port?

[ ... ]

> @@ -1205,5 +1205,5 @@ static void an7581_pcs_txpll_bringup(struct airoha_=
pcs_priv *priv,
>  	/* This comment only apply to Serdes PCIe that expose
>  	 * 2 PCS.
>  	 *
>  	 * The Serdes PCIe expose 2 PCS but always require
>  	 * the PMA for the first PCS to be configured
>  	 * for correct functionality for TXPLL.
>  	 */
>  	pcs_pma =3D priv->pcs_pma[0];
> =20
>  	/* Setup VCO LDO Output */
>  	regmap_field_write(pcs_ana_fields[AN7581_PCS_TXPLL_LDO_VCO_OUT], 0x1);
>  	regmap_field_write(pcs_ana_fields[AN7581_PCS_TXPLL_LDO_OUT], 0x1);
> =20
>  	/* Setup RSTB */
>  	regmap_field_write(pcs_ana_fields[AN7581_PCS_TXPLL_PLL_RSTB], 0x1);

[Severity: High]
Similarly, this modifies the shared pcs_pma[0] and resets the PLL from a
per-port context, impacting both ports without locking.

[ ... ]

> @@ -1891,4 +1891,4 @@ int an7581_pcs_usb_bringup(struct airoha_pcs_priv *=
priv,
>  			   int index, phy_interface_t interface)
>  {
>  	int ret;
> =20
>  	ret =3D phy_set_mode_ext(priv->phy, PHY_MODE_ETHERNET, interface);
>  	if (ret)
>  		return ret;

[Severity: High]
This configures the generic PHY mode, but initialization and power-on
(phy_init() and phy_power_on()) are completely omitted. Does this prevent t=
he
USB PCS port from functioning correctly?

[ ... ]

> @@ -2073,6 +2073,6 @@ static bool an7581_pcs_have_rx_signal(struct airoha=
_pcs_priv *priv, int index)
> =20
>  	regmap_write(pcs_pma, AIROHA_PCS_PMA_DIG_RESERVE_0,
>  		     AIROHA_PCS_TRIGGER_RX_SIDGET_SCAN);
> =20
>  	/* Scan 6 times for RX sigdet module to detect RX signal */
>  	for (i =3D 0; i < AIROHA_PCS_MAX_RX_SIGDET_TRY; i++) {
>  		regmap_read(pcs_pma, AIROHA_PCS_PMA_DIG_RO_RESERVE_2,
>  			    &val);
>  		if (val & AIROHA_PCS_RX_SIGDET)
>  			count++;
>  	}

[Severity: Medium]
This tight polling loop fails to give the hardware sufficient time to compl=
ete
the scan or debounce the signal since the reads execute in a fraction of a
microsecond. Could this cause the RX signal detection to read the same
instantaneous hardware state and become unreliable without a delay
(e.g., usleep_range()) between iterations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916235200.2071=
2-1-ansuelsmth@gmail.com?part=3D11
