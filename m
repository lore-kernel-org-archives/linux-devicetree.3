Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B474052BA
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194839; cv=none; b=LMC2/Rgjbvy2ca0dl+fPsXZOOFB9CZPYl3qmkLwddXXj1XPKsIa8uLp7MdfcGOfCTEcNCOLLh9Yv4hRpMTM7WpwioBJ3qPEnIH03A0a4DgKjI1taXNUWmZZqumY552F0Bg5yOUVBEChxQGGJKZl+CfeulJCwKQ9LEAFTpVbjh8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194839; c=relaxed/simple;
	bh=inVaZwe0gx4k0dXFPFyqP/PBfYNzOJG9EzWWYLxGoQI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aFSHcWJq2s+c+neOEO3nWfstt7sI3hMxRyoNBbocgomYLhH6m+3FjDYMUHvHOcsYuwri3ROybdnXz7uwks0ZBv+6tiLinIqAtwPM12XQ3hAgDNDgKJJIOzBfv9fTFpIRrBvHh6mP+6qIbwYnfJrrWW9jj6PexeGxrSA841zg8lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJ5qHEJB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJ5qHEJB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1471F00A3A;
	Sat,  8 Aug 2026 13:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786194838;
	bh=PSRymrNed9Yd6vNfvqUozggi8pGTxvgw++VMiYm+gio=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UJ5qHEJBl9RLtF3wY2kYx9W1IOAY31BU59hhlR1yHGYPoJPgjz6pbzaI12rkg8xtL
	 XN47PED3qzMbCXQ51bMF9bllTtdFDOsUcZQtHx0fZjqlO6IGb+G6Rb/ssmqEg62+In
	 6AxaZe6DPmi+C6BFTDQnspeLLHBlJSuqdnI/7k8oHhxLMZDCx3IoidJNVYvLszzBPC
	 fGZ3lo4IcoxiEiEfHVYj3SLSIWLql4CsaeHOD1v9UFx9/guIULn5Z4Zb+3zb0B61rC
	 ihQiGvZmpWAxd01N7CZ/culSF+fB60y4YxpptPrFEB4ZxpxyhR+haahg5OA7lqj0YP
	 SlL1N2EvWstzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 11/12] net: pcs: airoha: add PCS driver for
 Airoha AN7581 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807131301.192060-12-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-12-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 13:13:57 +0000
Message-Id: <20260808131357.DB1471F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Unconditional global reset and shared PLL reconfiguration disrupts=
 active multi-port setups.
- [High] NULL pointer dereference when instantiated without OF match data.
- [High] Unintentional clearing of unhandled interrupts due to RMW on W1C r=
egisters.
- [High] Uninitialized stack variables written to hardware registers.
- [Medium] Hardware calibration degradation due to infinite continuation on=
 perfect match.
--

--- Patch [11]: [PATCH net-next v11 11/12] net: pcs: airoha: add PCS driver=
 for Airoha AN7581 SoC ---
commit aec569f759beda361ff885957891c7c73a20bfd6
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: net: pcs: airoha: add PCS driver for Airoha AN7581 SoC

This commit introduces a new PCS driver for the Airoha AN7581 SoC, supporti=
ng
Ethernet, PON, PCIe, and USB SERDES. It supports multiple interface modes
including USXGMII, 10G-BASER, 2500BASE-X, 1000BASE-X, and SGMII.

> diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs=
/airoha/pcs-airoha-common.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-airoha-common.c
> @@ -0,0 +1,1303 @@
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

[Severity: High]
Does this unconditional global reset disrupt active multi-port setups?

In airoha_pcs_setup_scu(), asserting and deasserting the shared bulk resets
for the entire PCS block will affect all ports. If the driver manages a
multi-port instance, bringing up a secondary port might dynamically crash t=
he
link on an already-active primary port.

> +	if (ret)
> +		return ret;
[ ... ]
> +static void airoha_pcs_interrupt_init_sgmii(struct airoha_pcs_priv *priv,
> +					    int index)
> +{
> +	struct airoha_pcs_maps *maps =3D &priv->maps[index];
> +
> +	/* Disable every interrupt */
> +	regmap_clear_bits(maps->hsgmii_pcs, AIROHA_PCS_HSGMII_PCS_HSGMII_MODE_I=
NTERRUPT,
> +			  AIROHA_PCS_HSGMII_MODE2_REMOVE_FAULT_OCCUR_INT |
> +			  AIROHA_PCS_HSGMII_MODE2_AN_CL37_TIMERDONE_INT |
> +			  AIROHA_PCS_HSGMII_MODE2_AN_MIS_INT |
> +			  AIROHA_PCS_HSGMII_MODE2_RX_SYN_DONE_INT |
> +			  AIROHA_PCS_HSGMII_MODE2_AN_DONE_INT);
> +
> +	/* Clear interrupt */
> +	regmap_set_bits(maps->hsgmii_pcs, AIROHA_PCS_HSGMII_PCS_HSGMII_MODE_INT=
ERRUPT,
> +			AIROHA_PCS_HSGMII_MODE2_REMOVE_FAULT_OCCUR_INT_CLEAR |

[Severity: High]
Can using regmap_set_bits() here cause unrelated pending interrupts to be l=
ost?

regmap_set_bits() performs a read-modify-write. On Write-1-to-Clear registe=
rs,
reading the active status bits and writing them back writes 1 to all curren=
tly
active interrupts, which would silently acknowledge and drop any interrupts
that fired before the write.

> +			AIROHA_PCS_HSGMII_MODE2_AN_CL37_TIMERDONE_INT_CLEAR |
[ ... ]
> +static void airoha_pcs_interrupt_init_usxgmii(struct airoha_pcs_priv *pr=
iv,
> +					      int index)
> +{
[ ... ]
> +	/* Clear any pending interrupt */
> +	regmap_set_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_INT_STA_2,
> +			AIROHA_PCS_USXGMII_RPCS_FSM_DEC_ERR_INT |

[Severity: High]
Could this read-modify-write on a W1C register lead to missed interrupts he=
re
as well?

Similar to the sgmii interrupt initialization above, regmap_set_bits() will
write back any already-set status bits and potentially clear unhandled
interrupts silently.

> +			AIROHA_PCS_USXGMII_R_TYPE_E_INT |
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

[Severity: High]
Are we certain speed matches one of the expected cases here?

If speed is unknown or unhandled, the switch statement falls through without
initializing speed_reg, if_mode, or ck_gen_mode. This would result in garba=
ge
values from the stack being written to the PCS control registers.

> +					   AIROHA_PCS_FORCE_SPD_MODE_P0);
> +		}
> +	}
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

[Severity: High]
Will this crash if the driver is bound without an OF match?

If the device is instantiated via platform mechanisms matching by name rath=
er
than through an OF node, of_device_get_match_data() will return NULL, causi=
ng
a NULL pointer dereference here when accessing data->num_port.

> +				   sizeof(*priv->ports), GFP_KERNEL);
[ ... ]
> diff --git a/drivers/net/pcs/airoha/pcs-an7581.c b/drivers/net/pcs/airoha=
/pcs-an7581.c
> new file mode 100644
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

[Severity: High]
Does hardcoding pcs_pma[0] disrupt port 1 when it is brought up?

In a multi-port scenario, an7581_pcs_jcpll_bringup() and
an7581_pcs_txpll_bringup() will unconditionally reconfigure the shared PLL =
via
pcs_pma[0]. This could dynamically crash or reset the link on an already-ac=
tive
primary port when the secondary port is configured.

> +
> +	/* Setup LDO */
[ ... ]
> +static u32 an7581_pcs_rx_prcal_idac_minor(struct airoha_pcs_priv *priv, =
int index,
> +					  u32 target_fl_out, u32 cdr_pr_idac_major)
> +{
[ ... ]
> +		/* Assume we found the deadline when the new absolue signal difference
> +		 * from target is greater than the previous and the difference is at
> +		 * least 10% greater between the old and new value.
> +		 * This is to account for signal detection level tollerance making
> +		 * sure we are actually over a deadline (AKA we are getting farther
> +		 * from target)
> +		 */
> +		dev_dbg(priv->dev, "Tested CDR Pr Idac: %x Fl Out: %x Diff: %u\n",
> +			cdr_pr_idac_tmp, fl_out, fl_out_diff_new);
> +		if (fl_out_diff && fl_out_diff_new > fl_out_diff &&
> +		    (abs_diff(fl_out_diff_new, fl_out_diff) * 100) / fl_out_diff > 10)=
 {

[Severity: Medium]
What happens if the previous iteration achieved a perfect match?

If fl_out_diff becomes 0 because of an exact match with target_fl_out, this
condition evaluates to false. The loop will then fall through to the else
branch, continuing to add bits and moving away from the perfect calibration,
resulting in hardware calibration degradation.

> +			/* Exit early if we are already at the deadline */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807131301.1920=
60-1-ansuelsmth@gmail.com?part=3D11
