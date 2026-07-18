Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CB437267C
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365282; cv=none; b=hQGMTNRHRYo4Ssx/if/h3CMnxwWxt31b26shJC37hcb6pX79wVgFzg+Tn0AEuQ8ZtsOogg8/jL5U2LiD/DDo7rSCk/eSX2DVDyIdTfiEXO0qKkEsNgv2wVo8UZcWW4XACEAqAaR56697U3hRswm00TpXETPKqpIdbUWvabLAeII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365282; c=relaxed/simple;
	bh=zKeY4qaGff+DLdBOeVsjbnffUNbWZwdz5VoL7HfPSOY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FEVzJJ5Yp8R1Nji5AjSlDClNv8FBjUztpBhN/j7k7G+vM5GucDKBnGaV81NGXDJH8WtNDUG82oBOC3+4+CtiJ+CCupo1Terc3o0cA2Y+ReicojmGqNNeas89FF1KI2yYu8H6PR+Jj4Bw8Lv64iIejETZXR6ok8+j96jgYxpbCS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bla9dSJQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bla9dSJQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F231F000E9;
	Sat, 18 Jul 2026 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784365281;
	bh=2sXQXnu7x1OvGxRuQwQJnPgYLE3QGVyyKtgvmagzlO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bla9dSJQ5PVhpV9C/Van5QrMSG/2LQKXoc4AkiZjcCNHtbOPbKUoGRi/3/a36NaVh
	 8kUsCI79YiX4x1YwuBsE846cQcywVFXzn9PBdix8YfR9cFNqVbGtIBYNaSDQVB2oue
	 Tuck8r9f2dom8mjffPL/OhDxWg8jQggdYVOuD1q939mOdTu9H1oCb4u4PkACJJBSEt
	 rXtPj1u86wztDLFUbq/xFCYHOn6mJ98BtWeN3RNbtcbBg7gHxru1IAqefODQItfMvF
	 C9gYwCtyNIsC5z/742xjvyou2dfhHtc4NcwTUxSFfDDbM7J2lOKsnIIiUYZvwf7KQk
	 wSI8GHCnwioEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 11/12] net: pcs: airoha: add PCS driver for
 Airoha AN7581 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717065448.1498335-12-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-12-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 09:01:20 +0000
Message-Id: <20260718090120.C0F231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] SPEED_10 configuration incorrectly sets MAC link mode to 100M inst=
ead of 10M.
- [High] AN_FORCE_CL37 auto-negotiation register is mistakenly written to t=
he hsgmii_pcs regmap instead of hsgmii_an.
- [High] Generic PHY is acquired for USB port types but never initialized o=
r powered on.
- [High] Stack variables are used uninitialized due to unchecked `regmap_re=
ad()` return values.
- [High] Initialization of a single port incorrectly resets and modifies sh=
ared hardware state (reset lines and PLLs) used by other active ports.
- [High] Zero-delay MMIO polling loop immediately after a hardware trigger =
causes unreliable signal detection.
- [Medium] Read-modify-write operation on W1C (write-1-to-clear) interrupt =
status registers accidentally clears unmasked interrupts.
--

--- Patch [11]: [PATCH net-next v9 11/12] net: pcs: airoha: add PCS driver =
for Airoha AN7581 SoC ---
commit 87ad2d5e05008754a1a8736668451b5aa64ba606
Author: Christian Marangi <ansuelsmth@gmail.com>
Date:   Fri Jul 17 06:54:11 2026 +0000

    net: pcs: airoha: add PCS driver for Airoha AN7581 SoC

This commit adds a new PCS driver for the Airoha AN7581 SoC, supporting
Ethernet, PON, PCIe, and USB SERDES. The driver provides support for various
operating modes including USXGMII, 10G-BASER, 2500BASE-X, 1000BASE-X, and
SGMII.

> diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs=
/airoha/pcs-airoha-common.c
> new file mode 100644
> index 0000000000000..781f89adf3abf
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-airoha-common.c
> @@ -0,0 +1,1324 @@

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
> +	/* TODO better handle reset from MAC */
> +	ret =3D reset_control_bulk_assert(ARRAY_SIZE(priv->rsts),
> +					priv->rsts);

[Severity: High]
Does this assert shared device-level reset lines that might affect other
active ports on the MAC? If so, this could interrupt connections on those
ports during initialization.

> +	if (ret)
> +		return ret;
> +
> +	ret =3D reset_control_bulk_deassert(ARRAY_SIZE(priv->rsts),
> +					  priv->rsts);
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
> +
> +	/* Disable every Interrupt */
> +	regmap_clear_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_CTRL_0,
> +			  AIROHA_PCS_USXGMII_T_TYPE_T_INT_EN |
> +			  AIROHA_PCS_USXGMII_T_TYPE_D_INT_EN |
> +			  AIROHA_PCS_USXGMII_T_TYPE_C_INT_EN |
> +			  AIROHA_PCS_USXGMII_T_TYPE_S_INT_EN);
> +
> +	regmap_clear_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_CTRL_1,
> +			  AIROHA_PCS_USXGMII_R_TYPE_C_INT_EN |
> +			  AIROHA_PCS_USXGMII_R_TYPE_S_INT_EN |
> +			  AIROHA_PCS_USXGMII_TXPCS_FSM_ENC_ERR_INT_EN |
> +			  AIROHA_PCS_USXGMII_T_TYPE_E_INT_EN);
> +
> +	regmap_clear_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_CTRL_2,
> +			  AIROHA_PCS_USXGMII_RPCS_FSM_DEC_ERR_INT_EN |
> +			  AIROHA_PCS_USXGMII_R_TYPE_E_INT_EN |
> +			  AIROHA_PCS_USXGMII_R_TYPE_T_INT_EN |
> +			  AIROHA_PCS_USXGMII_R_TYPE_D_INT_EN);
> +
> +	regmap_clear_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_CTRL_3,
> +			  AIROHA_PCS_USXGMII_FAIL_SYNC_XOR_ST_INT_EN |
> +			  AIROHA_PCS_USXGMII_RX_BLOCK_LOCK_ST_INT_EN |
> +			  AIROHA_PCS_USXGMII_LINK_UP_ST_INT_EN |
> +			  AIROHA_PCS_USXGMII_HI_BER_ST_INT_EN);
> +
> +	regmap_clear_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_CTRL_4,
> +			  AIROHA_PCS_USXGMII_LINK_DOWN_ST_INT_EN);
> +
> +	/* Clear any pending interrupt */
> +	regmap_set_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_INT_STA_2,
> +			AIROHA_PCS_USXGMII_RPCS_FSM_DEC_ERR_INT |
> +			AIROHA_PCS_USXGMII_R_TYPE_E_INT |
> +			AIROHA_PCS_USXGMII_R_TYPE_T_INT |
> +			AIROHA_PCS_USXGMII_R_TYPE_D_INT);

[Severity: Medium]
Will using a read-modify-write operation like regmap_set_bits on a
write-1-to-clear interrupt status register inadvertently read all pending
interrupts as 1s and write them back, thereby clearing all pending
interrupts and not just the masked ones?

> +
> +	regmap_set_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_INT_STA_3,
> +			AIROHA_PCS_USXGMII_FAIL_SYNC_XOR_ST_INT |
> +			AIROHA_PCS_USXGMII_RX_BLOCK_LOCK_ST_INT |
> +			AIROHA_PCS_USXGMII_LINK_UP_ST_INT |
> +			AIROHA_PCS_USXGMII_HI_BER_ST_INT);

[ ... ]

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
> +
> +	bmsr =3D (AIROHA_PCS_HSGMII_AN_SGMII_AN_COMPLETE |

[Severity: High]
If regmap_read() fails here, wouldn't bmsr and lpa be left uninitialized?
Evaluating uninitialized stack variables might lead to random state machine
behavior. Can we add return value checks here?

> +		AIROHA_PCS_HSGMII_AN_SGMII_REMOTE_FAULT |
> +		AIROHA_PCS_HSGMII_AN_SGMII_AN_ABILITY |
> +		AIROHA_PCS_HSGMII_AN_SGMII_LINK_STATUS) & bmsr;
> +	lpa =3D AIROHA_PCS_HSGMII_AN_SGMII_PARTNER_ABILITY & lpa;
> +
> +	phylink_mii_c22_pcs_decode_state(state, neg_mode, bmsr, lpa);
> +}

[ ... ]

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

[Severity: High]
Is AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_FORCE_CL37 being written to the wrong
regmap here? It appears to be an auto-negotiation register that should be
written to the hsgmii_an block, rather than hsgmii_pcs.

> +	}
> +
> +	if (interface =3D=3D PHY_INTERFACE_MODE_2500BASEX) {
> +		regmap_set_bits(maps->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_0,
> +				AIROHA_PCS_HSGMII_AN_SGMII_RESET_PHY);
> +	}

[ ... ]

> +static void airoha_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg=
_mode,
> +			       phy_interface_t interface, int speed, int duplex)
> +{

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
> +				speed_reg =3D AIROHA_PCS_LINK_MODE_P0_100M;
> +				if_mode =3D AIROHA_PCS_HSGMII_AN_SPEED_FORCE_MODE_10;
> +				ck_gen_mode =3D AIROHA_PCS_HSGMII_PCS_FORCE_CUR_SGMII_MODE_10;

[Severity: High]
Does SPEED_10 mistakenly assign the 100M constant to speed_reg instead of
AIROHA_PCS_LINK_MODE_P0_10M? This looks like it might incorrectly program t=
he
hardware to 100Mbps.

> +				break;
> +			}
> +
> +			if (interface =3D=3D PHY_INTERFACE_MODE_SGMII) {
> +				regmap_update_bits(maps->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_A=
N_13,
> +						   AIROHA_PCS_HSGMII_AN_SPEED_FORCE_MODE,
> +						   if_mode);

[ ... ]

> +static int airoha_pcs_probe(struct platform_device *pdev)
> +{
> +	const struct airoha_pcs_match_data *data;
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
The generic PHY is acquired for USB port types, but does it ever get
initialized or powered on anywhere else in the driver? It appears the hardw=
are
might remain powered down without a call to phy_init() and phy_power_on().

> +	}
> +
> +	switch (data->port_type) {

[ ... ]

> diff --git a/drivers/net/pcs/airoha/pcs-an7581.c b/drivers/net/pcs/airoha=
/pcs-an7581.c
> new file mode 100644
> index 0000000000000..24fc15b6e29e1
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-an7581.c
> @@ -0,0 +1,2093 @@

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

[Severity: High]
Does this code unconditionally modify port 0's JCPLL state and reset it, ev=
en
when port 1 is being configured? If so, this could potentially destroy the
active hardware state of the other port.

> +
> +	/* Enable PLL force selection and Force Disable */
> +	regmap_update_bits(pcs_pma, AIROHA_PCS_PMA_PXP_JCPLL_CKOUT_EN,
> +			   AIROHA_PCS_PMA_FORCE_SEL_DA_JCPLL_EN |
> +			   AIROHA_PCS_PMA_FORCE_DA_JCPLL_EN,
> +			   AIROHA_PCS_PMA_FORCE_SEL_DA_JCPLL_EN);

[ ... ]

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

[Severity: High]
Are these back-to-back regmap reads executed immediately after the hardware
trigger without any delay? Since analog signal scans usually require some
settling time, could the loop finish before the hardware completes the scan,
resulting in unreliable signal detection?

> +		if (val & AIROHA_PCS_RX_SIGDET)
> +			count++;
> +	}
> +
> +	/* Consider signal presence if we detect signal at least 4 times */
> +	return count >=3D AIROHA_PCS_MAX_RX_SIGDET_PRESENCE_CNT;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717065448.1498=
335-1-ansuelsmth@gmail.com?part=3D11
