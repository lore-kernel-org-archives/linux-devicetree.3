Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929B74EE844
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 23:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790377388; cv=none; b=iQHy4npdCEgKAnrfnJpTSkhsh3CTsYNeBbyY9IkD1wcMcvhsLnQO9N5862HoBt283WJTAFdqfTuWN4SlV8vCs9kVFwtDUrWUmXVoQMTzSrXgGMyMDruDeBcg6se+FjOhxOb2iVnkXxoGM4eDWPN+CLRSbTWTi1Iy7Nvto1WneWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790377388; c=relaxed/simple;
	bh=iKHEGw3oA+LmUmXchtRPJ5EFIL/36CbmgcZLGeaKnNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R2X6Md/NZ7SPwSv4me6r/pT1J0Dwzd6fmrx9mfIOlNup+7iaFuPBIz6HJHeUpsPa5BmN1PeZNNXMDPxbbrwKjcwuDD1vr7P1aZOrCjflTp0HFI75JTZWggLlOp4OsZWPLB42a4EmTyTtpgI9MYlDrMbKUxBycGMs7bZh3J94gNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/GhkgI8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/GhkgI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD571F0089A;
	Fri, 25 Sep 2026 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790377385;
	bh=ZUDJL8bFFn6mLifwxO1m+nSkSINk6BmY7sTaU9wdpVQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N/GhkgI8dBn+RlG5ifJPFdCwpd79HVE7DdFpQxD3n1Pq26vbv7j1ONb2IcLi6XdSu
	 fmCXJEfPQap8gd3trs9+QtSBwPfRiuB8slK+KOGD0j4P0U7VnnZEcOfhPcfpqrU0II
	 SbFNgh2KzJa81eSyJBC3orJuYUCPyuHG6bjfNnRCWW1h5t+MuHM2i0eBO++4jGvZe0
	 TUx+iZHwtwI+083FLaMKBjIEZ6A671nN+Pvc4Pc9TvLMELs9bmSFrnVMYMeP+8z9MP
	 OIbHSeqnlo1AEOt0PrdNJMDwETxuPP8lM7zzRoKyddQ+KyCnv4zZpdnE030FylYqaa
	 PRD7epHYXoW1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 11/12] net: pcs: airoha: add PCS driver for
 Airoha AN7581 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260924230211.11519-12-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
 <20260924230211.11519-12-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 23:03:04 +0000
Message-Id: <20260925230305.0BD571F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] net: pcs: airoha: uncoordinated shared resource resets disrupt act=
ive multi-port links
- [High] net: pcs: airoha: logic bug in FIELD_PREP clobbers XTAL_TOP_RESERV=
E register
- [Medium] net: pcs: airoha: missing default switch case causes uninitializ=
ed variable usage
- [Low] net: pcs: airoha: mismatch between comment and macro for maximum ca=
libration retries
--

commit 6e5693f88efad46bf7131d0ace5d0278a3c0f5ca
Author: Christian Marangi <ansuelsmth@gmail.com>

    net: pcs: airoha: add PCS driver for Airoha AN7581 SoC

This commit adds a new PCS driver for the Airoha AN7581 SoC. It supports Et=
hernet, PON, PCIe, and USB SERDES configurations, with multiple interface m=
odes including USXGMII and SGMII.

> diff --git a/drivers/net/pcs/airoha/pcs-airoha.h b/drivers/net/pcs/airoha=
/pcs-airoha.h
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-airoha.h
> @@ -0,0 +1,1311 @@

[ ... ]

> +#define AIROHA_PCS_MAX_CALIBRATION_TRY		50

[Severity: Low]
Does this macro definition mismatch the logic described in the comments?

The comment in an7581_pcs_phya_bringup() indicates 10 retries are used, but=
 the
macro evaluates to 50.

> diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs=
/airoha/pcs-airoha-common.c
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
Does this disrupt other active ports on the same chip?

It looks like bringing up a secondary port unconditionally asserts a device=
-wide
bulk reset here, which would destroy the link state of already active ports.

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

[Severity: Medium]
What happens if an unexpected speed is provided here?

Because there is no default switch case catching unsupported speeds (unlike=
 other
switch statements in the same function), variables like speed_reg remain
uninitialized. If this occurs, uninitialized stack garbage will be written =
to
hardware registers.

> +					   AIROHA_PCS_FORCE_SPD_MODE_P0);
> +		}
> +	}
> +
> +	if (data->link_up)
> +		data->link_up(priv, port->index);

[ ... ]

> diff --git a/drivers/net/pcs/airoha/pcs-an7581.c b/drivers/net/pcs/airoha=
/pcs-an7581.c
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-an7581.c
> @@ -0,0 +1,2100 @@

[ ... ]

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

[Severity: High]
Could this reconfigure the shared JCPLL without locks and disrupt an already
active port 0?

Since pcs_pma[0] is modified directly without checking if another port is a=
lready
using it, configuring a secondary port may break the primary one.

[ ... ]

> +static void an7581_pcs_txpll_bringup(struct airoha_pcs_priv *priv,
> +				     int index, phy_interface_t interface)
> +{

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
Does this shared TXPLL modification have the same issue as the JCPLL above?

It appears that a secondary port bringup will unconditionally reconfigure
this shared resource without synchronization.

[ ... ]

> +static int an7581_pcs_phya_bringup(struct airoha_pcs_priv *priv,
> +				   int index, phy_interface_t interface)
> +{
> +	struct regmap *pcs_pma =3D priv->pcs_pma[index];
> +	int calibration_try =3D 0;
> +	u32 val =3D 0;
> +
> +	an7581_pcs_tx_bringup(priv, index, interface);
> +	an7581_pcs_rx_bringup(priv, index, interface);
> +
> +	usleep_range(100, 200);
> +
> +retry_calibration:
> +	an7581_pcs_cdr_reset(priv, index, interface, priv->manual_rx_calib);
> +
> +	/* Global reset clear */
> +	regmap_update_bits(pcs_pma, AIROHA_PCS_PMA_SW_RST_SET,
> +			   AIROHA_PCS_PMA_SW_HSG_RXPCS_RST_N |
> +			   AIROHA_PCS_PMA_SW_HSG_TXPCS_RST_N |
> +			   AIROHA_PCS_PMA_SW_XFI_RXPCS_BIST_RST_N |
> +			   AIROHA_PCS_PMA_SW_XFI_RXPCS_RST_N |
> +			   AIROHA_PCS_PMA_SW_XFI_TXPCS_RST_N |
> +			   AIROHA_PCS_PMA_SW_TX_FIFO_RST_N |
> +			   AIROHA_PCS_PMA_SW_REF_RST_N |
> +			   AIROHA_PCS_PMA_SW_ALLPCS_RST_N |
> +			   AIROHA_PCS_PMA_SW_PMA_RST_N |
> +			   AIROHA_PCS_PMA_SW_TX_RST_N |
> +			   AIROHA_PCS_PMA_SW_RX_RST_N |
> +			   AIROHA_PCS_PMA_SW_RX_FIFO_RST_N,
> +			   AIROHA_PCS_PMA_SW_REF_RST_N);
> +
> +	usleep_range(100, 200);
> +
> +	/* Global reset */
> +	regmap_set_bits(pcs_pma, AIROHA_PCS_PMA_SW_RST_SET,
> +			AIROHA_PCS_PMA_SW_HSG_RXPCS_RST_N |
> +			AIROHA_PCS_PMA_SW_HSG_TXPCS_RST_N |
> +			AIROHA_PCS_PMA_SW_XFI_RXPCS_BIST_RST_N |
> +			AIROHA_PCS_PMA_SW_XFI_RXPCS_RST_N |
> +			AIROHA_PCS_PMA_SW_XFI_TXPCS_RST_N |
> +			AIROHA_PCS_PMA_SW_TX_FIFO_RST_N |
> +			AIROHA_PCS_PMA_SW_REF_RST_N |
> +			AIROHA_PCS_PMA_SW_ALLPCS_RST_N |

[Severity: High]
Is it safe to trigger a hardware-level ALLPCS_RST here?

Applying this reset from an individual port's bring-up path seems like it
would destroy the state across all active PCS ports on the chip.

> +			AIROHA_PCS_PMA_SW_PMA_RST_N |
> +			AIROHA_PCS_PMA_SW_TX_RST_N |
> +			AIROHA_PCS_PMA_SW_RX_RST_N |
> +			AIROHA_PCS_PMA_SW_RX_FIFO_RST_N);
> +
> +	usleep_range(5000, 7000);
> +
> +	an7581_pcs_cdr_reset(priv, index, interface, false);

[ ... ]

> +	/* It was discovered that after a global reset and auto mode gets
> +	 * actually enabled, the fl_out from calibration might change and
> +	 * might deviates a lot from the expected value it was calibrated for.
> +	 * To correctly work, the PCS FreqDet module needs to Lock to the fl_out
> +	 * (frequency level output) or no signal can correctly be transmitted.
> +	 * This is detected by checking the FreqDet module Lock bit.
> +	 *
> +	 * If it's detected that the FreqDet module is not locked, retry
> +	 * calibration. From observation on real hardware with a 10g SFP module,
> +	 * it required a maximum of an additional calibration to actually make
> +	 * the FreqDet module to lock. Try 10 times before failing to handle
> +	 * really strange case.
> +	 */
> +	regmap_read(pcs_pma, AIROHA_PCS_PMA_RX_FREQDET, &val);
> +	if (!(val & AIROHA_PCS_PMA_FBCK_LOCK)) {
> +		if (calibration_try > AIROHA_PCS_MAX_CALIBRATION_TRY) {

[Severity: Low]
Does this macro evaluation mismatch the logic described in the comments?

The comment above indicates 10 retries are used, but the macro evaluates to=
 50.

> +			dev_err(priv->dev, "No FBCK Lock from FreqDet module after %d calibra=
tion try. PCS won't work.\n",
> +				AIROHA_PCS_MAX_CALIBRATION_TRY);
> +			return -EIO;
> +		}
> +
> +		calibration_try++;

[ ... ]

> +int an7581_pcs_usb_bringup(struct airoha_pcs_priv *priv,
> +			   int index, phy_interface_t interface)
> +{
> +	int ret;

[ ... ]

> +	regmap_update_bits(priv->pcs_ana, AIROHA_PCS_HSGMII_ANA_SGMII_PHYA_18,
> +			   AIROHA_PCS_HSGMII_ANA_SSUSB_BG_DIV,
> +			   FIELD_PREP(AIROHA_PCS_HSGMII_ANA_SSUSB_BG_DIV, 0x1));
> +
> +	regmap_update_bits(priv->pcs_ana, AIROHA_PCS_HSGMII_ANA_SGMII_PHYA_19,
> +			   AIROHA_PCS_HSGMII_ANA_SSUSB_XTAL_TOP_RESERVE,
> +			   FIELD_PREP(AIROHA_PCS_HSGMII_ANA_SSUSB_XTAL_TOP_RESERVE,
> +				      FIELD_PREP(AIROHA_PCS_HSGMII_ANA_SSUSB_XTAL_TOP_RESERVE_HV,
> +						 AIROHA_PCS_HSGMII_ANA_SSUSB_XTAL_TOP_RESERVE_NS_MONPLL_CK)));

[Severity: High]
Does this logic bug clobber the XTAL_TOP_RESERVE register?

The AIROHA_PCS_HSGMII_ANA_SSUSB_XTAL_TOP_RESERVE_NS_MONPLL_CK constant is n=
ested
inside a FIELD_PREP for the HV subfield rather than the MONCKBG subfield. T=
his
causes the bit pattern to be placed at the wrong offset (bit 19 instead of
within 7:0) and the outer FIELD_PREP zeroes out everything else, clearing t=
he LV
subfield.

> +
> +	if (interface =3D=3D PHY_INTERFACE_MODE_2500BASEX)
> +		regmap_update_bits(priv->pcs_ana, AIROHA_PCS_HSGMII_ANA_SGMII_PHYA_11,
> +				   AIROHA_PCS_HSGMII_ANA_TPHY_SPEED,
> +				   AIROHA_PCS_HSGMII_ANA_TPHY_SPEED_HSGMII);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924230211.1151=
9-1-ansuelsmth@gmail.com?part=3D11
