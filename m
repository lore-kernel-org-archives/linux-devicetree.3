Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB7937B407
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781878278; cv=none; b=RzhczRK9NLnQ57ENi5cVfuIhzL111+KICGaUEETUz1Jphu/cP9tPrjAKwMj9gVvocB44dUyIZkZUuBs47vPzo8cr/hTwwzGAyBSuP8LulkZoyEypTw1KSIOT/330fnSmckpTK945mHxdN13jWozSPKgloz3muN5UvlLINu+6IZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781878278; c=relaxed/simple;
	bh=wHgMCLAaSJI8xN4woQSVlq/Kyi9mRB8xkV/xmPjur7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aKIOpumNNu1A8I4tOZvQMxXbMW0N2LV29Dq1prP1zGbOKahmdE4HDcIcFJo4QEItEmJQJ0S/ff4dadSK2nt19aHUKOa6oQPA94krEq2USCr7kJidCeu5n4e24ARKKPcyOclILrFBY2E/5aAheovKJ2W/McQmFBSN10IEbhQuy9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzVa+7Oj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzVa+7Oj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE5A1F00A3F;
	Fri, 19 Jun 2026 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781878274;
	bh=jd+ZikS+8LY8IOasqZJcZujr1nVp2n+iuejLLymg5Nw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CzVa+7Oj4XjMFbLaz06uQ0RlTdTcoHIioojAP5LbG+c9kRnqKD31Z4Iqx4NVh1ttp
	 IZcAnKsyO5s8EnIFxq6DlxpoRCxz1zabdwsLX2GhgFxb4BdY3wxMfp8eDyzkhEHUBG
	 HsZfQKrF2ud/Bz2okzFE8yE88Atq5GD/NzEEFLXLXtDim+zWRDqcRLxKUtnDLDdrQQ
	 s5H0S7JQDdA+AubxclbJ/eafhQKMSWKGnbN1cqOoxRRBR+vvyfglEe0DHGvb9PnG6p
	 OeGgu2/3UDqw4Rk7Ie2migsTD3VBl7PiRsWKg0tW2NJRnZwVwXdQpE0Oc8r3NcfShw
	 M6ebpNISq4EXg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next v8 11/12] net: pcs: airoha: add PCS driver
 for Airoha AN7581 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618125752.1223-12-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
 <20260618125752.1223-12-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 14:11:13 +0000
Message-Id: <20260619141114.0EE5A1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Bringing up a second port on multi-port devices (e.g., PCIe) inadv=
ertently resets the shared global reset lines and analog PLLs, breaking the=
 active link on the first port.
- [High] Sticky AN configuration bits break subsequent inband auto-negotiat=
ion configurations.
- [High] The driver acquires a generic PHY for USB ports but never initiali=
zes or powers it on.
- [High] Multiple regmap_read() calls fail to check for error codes, leadin=
g to uninitialized stack memory being consumed.
- [Medium] The RX signal detection loop polls the hardware status register =
6 times back-to-back without any delay.
- [Medium] The return value of `airoha_pcs_setup_scu()` is ignored, which c=
an lead to writing to hardware registers while the device is still held in =
reset.
- [Medium] Missing delay between reset assertion and deassertion.
- [Medium] Using read-modify-write on Write-1-to-Clear (W1C) interrupt stat=
us registers will unintentionally clear unhandled interrupts.
--

commit 1a7ffd4436659e2a919b7ea23223e2dc899f6f4c
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: net: pcs: airoha: add PCS driver for Airoha AN7581 SoC

This commit adds a new PCS driver for the Airoha AN7581 SoC, supporting
Ethernet, PON, PCIe, and USB SERDES. It registers as a PCS provider for
fwnode usage and supports various modes including USXGMII, 10G-BASER, and
SGMII.

> diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs=
/airoha/pcs-airoha-common.c
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-airoha-common.c
> @@ ... @@
> +static int airoha_pcs_setup_scu(struct airoha_pcs_priv *priv,
> +				int index, phy_interface_t interface)
> +{
[ ... ]
> +	/* TODO better handle reset from MAC */
> +	ret =3D reset_control_bulk_assert(ARRAY_SIZE(priv->rsts),
> +					priv->rsts);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D reset_control_bulk_deassert(ARRAY_SIZE(priv->rsts),
> +					  priv->rsts);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Will the hardware reliably detect this reset?  The reset is asserted and
immediately deasserted without any delay (such as usleep_range) between the=
m,
which might result in a pulse too short for the hardware to sample correctl=
y.

[Severity: High]
Does this unconditionally reset the global device-wide mac and phy reset li=
nes
on every port's pre_config?  In multi-port scenarios like PCIe, bringing up=
 a
second port seems like it would inadvertently reset these shared lines and
destroy the active configuration of the already-running first port.

> diff --git a/drivers/net/pcs/airoha/pcs-an7581.c b/drivers/net/pcs/airoha=
/pcs-an7581.c
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-an7581.c
> @@ ... @@
> +static void an7581_pcs_jcpll_bringup(struct airoha_pcs_priv *priv,
> +				     int index, phy_interface_t interface)
> +{
[ ... ]
> +	/* This comment only apply to Serdes PCIe that expose
> +	 * 2 PCS.
> +	 *
> +	 * The Serdes PCIe expose 2 PCS but always require
> +	 * the PMA for the first PCS to be configured
> +	 * for correct functionality for JCPLL.
> +	 */
> +	pcs_pma =3D priv->pcs_pma[0];

[Severity: High]
Could this hardcoded access to port 0's PMA registers break an active link?
By toggling the shared analog PLLs and resets via priv->pcs_pma[0] when
configuring port 1, it appears this might drop the link of port 0.

> @@ ... @@
> +static bool an7581_pcs_have_rx_signal(struct airoha_pcs_priv *priv, int =
index)
> +{
> +	struct regmap *pcs_pma =3D priv->pcs_pma[index];
> +	unsigned int count =3D 0;
> +	u32 val;
> +	int i;
> +
> +	regmap_write(pcs_pma, AIROHA_PCS_PMA_DIG_RESERVE_0,
> +		     AIROHA_PCS_TRIGGER_RX_SIDGET_SCAN);
> +
> +	/* Scan 6 times for RX sigdet module to detect RX signal */
> +	for (i =3D 0; i < AIROHA_PCS_MAX_RX_SIGDET_TRY; i++) {
> +		regmap_read(pcs_pma, AIROHA_PCS_PMA_DIG_RO_RESERVE_2,
> +			    &val);
> +		if (val & AIROHA_PCS_RX_SIGDET)
> +			count++;
> +	}

[Severity: Medium]
Can the analog circuitry complete the scan in time?  The loop polls the sta=
tus
register 6 times back-to-back without any temporal spacing, meaning the CPU
might instantaneously sample the exact same state in a few nanoseconds befo=
re
the hardware has time to vary its output.

> diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs=
/airoha/pcs-airoha-common.c
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-airoha-common.c
> @@ ... @@
> +static int airoha_pcs_config(struct phylink_pcs *pcs, unsigned int neg_m=
ode,
> +			     phy_interface_t interface,
> +			     const unsigned long *advertising,
> +			     bool permit_pause_to_mac)
> +{
[ ... ]
> +	if (interface =3D=3D PHY_INTERFACE_MODE_1000BASEX &&
> +	    neg_mode !=3D PHYLINK_PCS_NEG_INBAND_ENABLED) {
> +		regmap_set_bits(maps->hsgmii_pcs, AIROHA_PCS_HSGMII_PCS_CTROL_1,
> +				AIROHA_PCS_SGMII_SEND_AN_ERR_EN);
> +
> +		regmap_set_bits(maps->hsgmii_pcs, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_FO=
RCE_CL37,
> +				AIROHA_PCS_HSGMII_AN_FORCE_AN_DONE);
> +	}

[Severity: High]
Are these sticky AN configuration bits ever cleared if the port is later
reconfigured for a mode that requires inband auto-negotiation?  Since the
USB port does not issue a global reset during bringup, these force AN done
bits might permanently leak and break inband AN until a hard reboot.

> @@ ... @@
> +static int airoha_pcs_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	if (data->port_type =3D=3D AIROHA_PCS_USB) {
> +		struct phy *phy;
> +
> +		phy =3D devm_phy_get(dev, NULL);
> +		if (IS_ERR(phy))
> +			return dev_err_probe(dev, PTR_ERR(phy), "failed to get phy\n");
> +
> +		priv->phy =3D phy;
> +	}

> diff --git a/drivers/net/pcs/airoha/pcs-an7581.c b/drivers/net/pcs/airoha=
/pcs-an7581.c
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-an7581.c
> @@ ... @@
> +int an7581_pcs_usb_bringup(struct airoha_pcs_priv *priv,
> +			   int index, phy_interface_t interface)
> +{
> +	int ret;
> +
> +	ret =3D phy_set_mode_ext(priv->phy, PHY_MODE_ETHERNET, interface);
> +	if (ret)
> +		return ret;

[Severity: High]
Does this code ever initialize or power on the generic PHY?  The PHY is
acquired during probe and its mode is set during bringup, but there are no
calls to phy_init() or phy_power_on().  Failing to do so leaves the PHY
unclocked or powered down, rendering the USB PCS non-functional.

> diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs=
/airoha/pcs-airoha-common.c
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-airoha-common.c
> @@ ... @@
> +static void airoha_pcs_pre_config(struct phylink_pcs *pcs,
> +				  phy_interface_t interface)
> +{
> +	struct airoha_pcs_port *port =3D to_airoha_pcs_port(pcs);
> +	struct airoha_pcs_priv *priv =3D port->priv;
> +	struct airoha_pcs_maps *maps;
> +
> +	maps =3D &priv->maps[port->index];
> +
> +	/* Select HSGMII or USXGMII in SCU regs */
> +	airoha_pcs_setup_scu(priv, port->index, interface);
> +
> +	/* MPI MBI disable */
> +	regmap_set_bits(maps->pcs_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,

[Severity: Medium]
Is it safe to ignore the return value of airoha_pcs_setup_scu() here?
If the reset toggling fails, the hardware might remain held in reset,
which could cause subsequent MMIO writes to stall the bus or fail silently.

> @@ ... @@
> +static void airoha_pcs_get_state_sgmii(struct airoha_pcs_priv *priv,
> +				       unsigned int neg_mode, int index,
> +				       struct phylink_link_state *state)
> +{
> +	struct airoha_pcs_maps *maps =3D &priv->maps[index];
> +	u32 bmsr, lpa;
> +
> +	regmap_read(maps->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_1,
> +		    &bmsr);
> +	regmap_read(maps->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_5,
> +		    &lpa);

[Severity: High]
Does this code risk using uninitialized stack variables?  The return values=
 of
regmap_read() are not checked. If the MMIO read fails due to power manageme=
nt
or hardware faults, random stack data in bmsr and lpa will be used to set
network state parameters, leaking garbage into the networking stack.

> @@ ... @@
> +static void airoha_pcs_interrupt_init_usxgmii(struct airoha_pcs_priv *pr=
iv,
> +					      int index)
> +{
[ ... ]
> +	/* Clear any pending interrupt */
> +	regmap_set_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_INT_STA_2,
> +			AIROHA_PCS_USXGMII_RPCS_FSM_DEC_ERR_INT |
> +			AIROHA_PCS_USXGMII_R_TYPE_E_INT |
> +			AIROHA_PCS_USXGMII_R_TYPE_T_INT |
> +			AIROHA_PCS_USXGMII_R_TYPE_D_INT);

[Severity: Medium]
Will this unintentionally clear unhandled interrupts?  Using regmap_set_bit=
s()
performs a read-modify-write operation.  If these status registers are
Write-1-to-Clear (W1C), it will read all active interrupts and write them b=
ack
as 1, silently clearing all pending interrupts instead of just the ones
specified in the mask.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618125752.1223=
-1-ansuelsmth@gmail.com?part=3D11
