Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B293E7BAD
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337860; cv=none; b=VB8SsWvr807paxspwHd5XnggQrPc0G9KXTYSvpOj92jFQkPIdBhr2p2uVxUcu8YQiIUNCsFI2SCDbngbOXM2RD69HvKkeY6XbKGrVcf4QyKYxZ90JxjLjUd7XgBkqD2IG6L9iXSSnfjPCrlB7CPuodz0hqlA4b7+4lEUCbmoVUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337860; c=relaxed/simple;
	bh=+T96TtjpVbViYum8jfclhJvF09b2roobUrDen81rdH0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QzM8fsNBcecq9GATWWCQcN7zq66uas2xRRuR6IMqrQsBwkYITa+6vh2SUxhLUMNXtfFfz86QpvR5bdU74gAh1vX/y91lxIFQxg4z7YR8qcNTIOBpOoHg6OESumslnrq+bmOLzbUod0zpiE1/5IKrTJcLIjJidIIRMISjB+Nl4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mg1MqSo+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mg1MqSo+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B241F00A3D;
	Wed,  2 Sep 2026 08:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788337857;
	bh=kag//HzmQCR3mdayCu2veHpX02enMTBqvqgA5CRpLqY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mg1MqSo+vtjOfyg11uRima+eXzNDAbd47ecPsIPwkjxk7IDR6xpAcVZZUdPfzSO5E
	 F7fb/nCKtQnJ7ZpFnjwplHg6K2mNvpQNaOtLTVkdRSQ7avUj1c7Rj+WjIjHwtZVlK9
	 Kzm5S27UmA2XblSl996Gv/do16g8DmakT4vBlZMFhu6xYlGPy/m0+AfR/P416bsmmT
	 m3fGEa2Y+S1GcOtAqXTxGN1AEHX85cE0y9sGw5DPXJu8YJHM4lpq8ZanDzT+zh9i8U
	 tIx/xApRK3HYKFwNI2diy2il3edeoyzeDs9YdojjqxOEHXB7EpWT3CBsedgTJEBmqw
	 g3AX89heqrkuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 11/12] net: pcs: airoha: add PCS driver for
 Airoha AN7581 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901083001.8044-12-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
 <20260901083001.8044-12-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 08:30:56 +0000
Message-Id: <20260902083057.49B241F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Incorrect read-modify-write pattern on Write-1-to-Clear (W1C) inte=
rrupt status registers causes silent drop of pending interrupts.
- [High] Missing `phy_init()` and `phy_power_on()` prevents the generic USB=
 PHY from functioning.
- [High] Concurrent or sequential bringup of multi-port PCS configurations =
destructively resets shared hardware blocks.
- [High] Zero-nanosecond hardware reset pulse due to missing delay between =
assert and deassert.
- [High] Missing delay in RX signal detection polling loop outruns hardware=
 analog circuitry.
- [Medium] Missing Kconfig dependency on CONFIG_PHYLINK leads to build fail=
ures.
- [Medium] Unconditional dereference of `of_device_get_match_data()` leads =
to a kernel panic.
- [Medium] Uninitialized stack variable `speed_reg` is written to hardware =
registers.
- [Medium] Ignored error return from hardware reset operation causes MMIO o=
perations on un-reset or powered-down blocks.
--

commit 59d4d3d112fe3684eed0c56c85a2887fbba5ef98
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: airoha: add PCS driver for Airoha AN7581 SoC

Add PCS driver for Airoha AN7581 SoC for Ethernet/PON/PCIe/USB SERDES
and permit usage of external PHY or connected SFP cage.

> diff --git a/drivers/net/pcs/airoha/Kconfig b/drivers/net/pcs/airoha/Kcon=
fig
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/Kconfig
[ ... ]
> +config PCS_AIROHA_AN7581
> +	tristate "Airoha AN7581 PCS driver"
> +	depends on ARCH_AIROHA || COMPILE_TEST
> +	select PCS_AIROHA

[Severity: Medium]
Will this lead to build failures if CONFIG_PHYLINK is not selected? It
appears this driver directly calls phylink APIs like
phylink_mii_c22_pcs_decode_state() but doesn't depend on or select PHYLINK.

> +	help
> +	  This module provides helper to phylink for managing the Airoha
> +	  AN7581 PCS for SoC Ethernet and PON SERDES.
> diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs=
/airoha/pcs-airoha-common.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-airoha-common.c
[ ... ]
> +static int airoha_pcs_setup_scu(struct airoha_pcs_priv *priv,
> +				int index, phy_interface_t interface)
> +{
> +	const struct airoha_pcs_match_data *data =3D priv->data;
> +	int ret;
> +
> +	switch (data->port_type) {
> +	case AIROHA_PCS_ETH:
> +		airoha_pcs_setup_scu_eth(priv, interface);
> +		break;
> +	case AIROHA_PCS_PON:
> +		airoha_pcs_setup_scu_pon(priv, interface);
> +		break;
> +	case AIROHA_PCS_PCIE:
> +		airoha_pcs_setup_scu_pcie(priv, index, interface);
> +		break;
> +	case AIROHA_PCS_USB:
> +		break;
> +	}
> +
> +	ret =3D reset_control_bulk_assert(ARRAY_SIZE(priv->rsts),
> +					priv->rsts);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D reset_control_bulk_deassert(ARRAY_SIZE(priv->rsts),
> +					  priv->rsts);

[Severity: High]
Does this execute a zero-nanosecond hardware reset pulse? Calling deassert
immediately after assert without a small delay (such as usleep_range) might
violate the hardware's minimum reset assertion time, making the reset
unreliable.

[Severity: High]
Could unconditionally asserting the global mac and phy reset lines here dis=
rupt
other active ports? Since the PCIE configuration supports multiple ports,
bringing up a new port appears to destructively reset the entire shared
MAC/PHY block.

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
[ ... ]
> +static void airoha_pcs_interrupt_init_usxgmii(struct airoha_pcs_priv *pr=
iv,
> +					      int index)
> +{
> +	struct airoha_pcs_maps *maps =3D &priv->maps[index];
[ ... ]
> +	/* Clear any pending interrupt */
> +	regmap_set_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_INT_STA_2,
> +			AIROHA_PCS_USXGMII_RPCS_FSM_DEC_ERR_INT |
> +			AIROHA_PCS_USXGMII_R_TYPE_E_INT |
> +			AIROHA_PCS_USXGMII_R_TYPE_T_INT |
> +			AIROHA_PCS_USXGMII_R_TYPE_D_INT);

[Severity: High]
Can this read-modify-write pattern on write-1-to-clear (W1C) interrupt stat=
us
registers silently drop pending interrupts?

By using regmap_set_bits(), the current register state is read (with any ac=
tive
interrupts set to 1) and written back along with the mask. For W1C register=
s,
writing back those 1s clears all currently pending interrupts globally, ins=
tead
of just the targeted bits. It might be safer to use regmap_write() directly.

> +
> +	regmap_set_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_INT_STA_3,
> +			AIROHA_PCS_USXGMII_FAIL_SYNC_XOR_ST_INT |
> +			AIROHA_PCS_USXGMII_RX_BLOCK_LOCK_ST_INT |
> +			AIROHA_PCS_USXGMII_LINK_UP_ST_INT |
> +			AIROHA_PCS_USXGMII_HI_BER_ST_INT);
> +
> +	regmap_set_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_INT_STA_4,
> +			AIROHA_PCS_USXGMII_LINK_DOWN_ST_INT);
[ ... ]
> +static void airoha_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg=
_mode,
> +			       phy_interface_t interface, int speed, int duplex)
> +{
> +	struct airoha_pcs_port *port =3D to_airoha_pcs_port(pcs);
> +	struct airoha_pcs_priv *priv =3D port->priv;
> +	const struct airoha_pcs_match_data *data;
> +	struct airoha_pcs_maps *maps;
> +
> +	maps =3D &priv->maps[port->index];
> +	data =3D priv->data;
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

[Severity: Medium]
Could this result in uninitialized stack variables being written to the har=
dware
registers?

If phylink passes SPEED_UNKNOWN due to link loss or an unhandled forced mod=
e,
the switch block is bypassed. This leaves speed_reg uninitialized before it
gets bitwise OR'd and passed into regmap_update_bits().

> +		}
> +	}
[ ... ]
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

[Severity: Medium]
Should the error code from airoha_pcs_setup_scu() be checked and handled he=
re?

By ignoring the return value, the driver blindly proceeds to execute MMIO
operations using regmap_set_bits() against the pcs_mac registers. If the
reset operation fails, writing to an un-reset or powered-down block may
cause system bus hangs.

> +
> +	/* MPI MBI disable */
> +	regmap_set_bits(maps->pcs_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
> +			AIROHA_PCS_XFI_RXMPI_STOP |
> +			AIROHA_PCS_XFI_RXMBI_STOP |
> +			AIROHA_PCS_XFI_TXMPI_STOP |
> +			AIROHA_PCS_XFI_TXMBI_STOP);
[ ... ]
> +static int airoha_pcs_probe(struct platform_device *pdev)
> +{
> +	const struct airoha_pcs_match_data *data;
> +	struct fwnode_pcs_provider *pcs_provider;
> +	struct device *dev =3D &pdev->dev;
> +	struct airoha_pcs_priv *priv;
> +	int index, ret;
> +
> +	data =3D of_device_get_match_data(dev);
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->ports =3D devm_kcalloc(dev, data->num_port,

[Severity: Medium]
Can this cause a NULL pointer dereference panic if the driver is bound
via sysfs to a platform device lacking an Open Firmware node?

of_device_get_match_data() returns NULL in that scenario, leading to an
unconditional dereference when reading data->num_port.

> +				   sizeof(*priv->ports), GFP_KERNEL);
> +	if (!priv->ports)
> +		return -ENOMEM;
> +
> +	priv->dev =3D dev;
> +	priv->data =3D data;
> +
> +	if (data->port_type =3D=3D AIROHA_PCS_USB) {
> +		struct phy *phy;
> +
> +		phy =3D devm_phy_get(dev, NULL);
> +		if (IS_ERR(phy))
> +			return dev_err_probe(dev, PTR_ERR(phy), "failed to get phy\n");
> +
> +		priv->phy =3D phy;

[Severity: High]
Does this generic PHY require phy_init() and phy_power_on() to function?

While the driver acquires the PHY reference and later configures its mode in
an7581_pcs_usb_bringup() using phy_set_mode_ext(), it never initializes or
powers the PHY on. This might leave the PHY in a powered-down state, preven=
ting
the link from coming up.

> +	}
[ ... ]
> diff --git a/drivers/net/pcs/airoha/pcs-an7581.c b/drivers/net/pcs/airoha=
/pcs-an7581.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-an7581.c
[ ... ]
> +static void an7581_pcs_jcpll_bringup(struct airoha_pcs_priv *priv,
> +				     int index, phy_interface_t interface)
> +{
> +	struct regmap_field **pcs_ana_fields =3D priv->pcs_ana_fields[index];
> +	struct regmap *pcs_pma;
> +	u32 kband_vref;
> +
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_1000BASEX:
> +	case PHY_INTERFACE_MODE_2500BASEX:
> +		kband_vref =3D 0x10;
> +		break;
> +	case PHY_INTERFACE_MODE_USXGMII:
> +	case PHY_INTERFACE_MODE_10GBASER:
> +		kband_vref =3D 0xf;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	/* This comment only apply to Serdes PCIe that expose
> +	 * 2 PCS.
> +	 *
> +	 * The Serdes PCIe expose 2 PCS but always require
> +	 * the PMA for the first PCS to be configured
> +	 * for correct functionality for JCPLL.
> +	 */
> +	pcs_pma =3D priv->pcs_pma[0];

[Severity: High]
Is there a risk that unconditionally writing to the shared PLL registers on
port 0's PMA could disrupt an already active port?

Since the driver lacks synchronization and reference counting, bringing up a
subsequent port may destructively reconfigure the shared PLL while the first
port is in use.

> +
> +	/* Setup LDO */
> +	usleep_range(200, 300);
[ ... ]
> +int an7581_pcs_usb_bringup(struct airoha_pcs_priv *priv,
> +			   int index, phy_interface_t interface)
> +{
> +	int ret;
> +
> +	ret =3D phy_set_mode_ext(priv->phy, PHY_MODE_ETHERNET, interface);
> +	if (ret)
> +		return ret;

[Severity: High]
Should this sequence include phy_init() and phy_power_on() for the generic
PHY? Without explicitly initializing and powering on the PHY, it might rema=
in
in reset, preventing the network link from working.

> +
> +	if (interface =3D=3D PHY_INTERFACE_MODE_2500BASEX) {
[ ... ]
> +static bool an7581_pcs_have_rx_signal(struct airoha_pcs_priv *priv, int =
index)
> +{
> +	struct regmap *pcs_pma =3D priv->pcs_pma[index];
> +	unsigned int count =3D 0;
> +	u32 val =3D 0;
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

[Severity: High]
Does this tight polling loop outrun the hardware analog circuitry?

Without a delay (like usleep_range or cpu_relax) inside the loop, the CPU m=
ay
finish all 6 reads before the hardware has time to complete its scan and as=
sert
the signal detection bit. This could lead to a false negative, causing the
driver to erroneously conclude the link is down.

> +
> +	/* Consider signal presence if we detect signal at least 4 times */
> +	return count >=3D AIROHA_PCS_MAX_RX_SIGDET_PRESENCE_CNT;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901083001.8044=
-1-ansuelsmth@gmail.com?part=3D11
