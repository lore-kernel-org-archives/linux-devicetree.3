Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDBE426EB8
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502101; cv=none; b=iVzXmGPQqNP8Aoi7xPDtFPVHO332qAG+4D+JDLls5LIxWUHYMoaEWxP7sSzNtDkv85pQUE0GxFWzc7/5ltGmtR3BZDh2uM/F0mlGtL5hQkXiEo8Us7ZncmIrWWIH/GI2662umkyihCo8cEKNdVexh0jK7mSUzJ99YRwSeC96Kv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502101; c=relaxed/simple;
	bh=tbJ253PFx9x5yNzj5UwJ6NOeR+kNAWIoXX3lT6fDO10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MHHHnUQmai04j2KlwvQd4Sd+Sl4sWnKpPzndjx0UEolFMgkrOLDr3Bmxp66ZgFyhMzQhAG4yLKl9S5VTl9cOIHeckVClLyrLYF76J21Pc1QkmNSpaWR/LHdtCoE1YJxrHr+lMvdZbylor0/ADEU04MakpCbfh4R1Lpz6i1gVDJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kA/Uzzd3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kA/Uzzd3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EED81F000E9;
	Fri, 31 Jul 2026 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785502099;
	bh=cTHa4aZieb6nuxNXocIVPZZHH7qFUyq9BTa3hUDa2Do=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kA/Uzzd34dA1ygZgxSdf5hVWxYGQA6NWWUD2K4vMwYux1GID353LoKAcwTqakbpII
	 pENCqLZZLFXBeBgXbc43FmkOqIAAgZoN7KhdxoY14ef5pKto8W9PNAAc7RSP7MH0qo
	 xm+o/R29MGXqctT0Ho+aHkDVIYdd7S0hRp2dHncZ/ehE3mAfg404jA1ik16qtrQ92U
	 eErgom0F/iDT577QYURMl8kTHmbeDxx63e6VzyNdBrtzoOMkmKDcEI7mHJutdMvNnO
	 3blGQJfCJ0nO8aGTO6yF/C5nNY9LbDkV/Joh/upcGsbKzW7rfBtBmF92/Cw7Reb6AB
	 +41GRpAQcgcNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 10/11] net: pcs: airoha: add PCS driver for
 Airoha AN7581 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730102444.1967900-11-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
 <20260730102444.1967900-11-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 12:48:19 +0000
Message-Id: <20260731124819.8EED81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Per-port `phylink_pcs_ops` configuration callbacks unconditionally=
 reset global hardware lines and reconfigure shared PLLs, which will silent=
ly drop active links and corrupt state on other ports in a multi-port confi=
guration.
- [High] `airoha_pcs_post_config` unconditionally overwrites flow control s=
ettings, ignoring pause negotiation.
- [High] Concurrent hardware state modification inside `pcs_get_state` race=
s with configuration paths, leading to state corruption.
- [High] Tight read loop immediately after triggering a hardware scan will =
fail to detect the RX signal because it does not allow the hardware suffici=
ent time to complete the operation.
- [Medium] Using `regmap_set_bits()` to clear pending interrupts performs a=
 read-modify-write on a Write-1-to-Clear (W1C) interrupt status register, i=
nadvertently clearing unrelated pending interrupts.
- [Medium] Multiple hardware configuration routines evaluate uninitialized =
stack variables when `regmap_read()` fails.
- [Medium] Switch statement fallthrough leaves `speed_reg` uninitialized fo=
r `PHY_INTERFACE_MODE_2500BASEX` if the requested speed differs from `SPEED=
_2500`.
- [Medium] The hardware reset assertion and deassertion occur back-to-back =
without any propagation delay, which may result in a glitch-like pulse that=
 fails to properly reset the PHY/MAC.
--

--- Patch [10]: [PATCH net-next v10 10/11] net: pcs: airoha: add PCS driver=
 for Airoha AN7581 SoC ---
commit 30773bae6473b72be8d07e5ac639902c307ba3ac
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: airoha: add PCS driver for Airoha AN7581 SoC

Add PCS driver for Airoha AN7581 SoC for Ethernet/PON/PCIe/USB SERDES
and permit usage of external PHY or connected SFP cage. Supported modes
are USXGMII, 10G-BASER, 2500BASE-X, 1000BASE-X and SGMII.

> diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs=
/airoha/pcs-airoha-common.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-airoha-common.c
[ ... ]
> +static int airoha_pcs_setup_scu(struct airoha_pcs_priv *priv,
> +				int index, phy_interface_t interface)
> +{
[ ... ]
> +	ret =3D reset_control_bulk_assert(ARRAY_SIZE(priv->rsts),
> +					priv->rsts);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D reset_control_bulk_deassert(ARRAY_SIZE(priv->rsts),
> +					  priv->rsts);

[Severity: High]
When configuring a multi-port device like the PCIe interface, does toggling
these global reset lines during port 1's bringup disrupt active traffic on
port 0?

[Severity: Medium]
Is there a risk of the reset pulse being too short? The deassert follows
immediately after assert without any hold-time delay, which might prevent t=
he
hardware blocks from fully resetting.

[ ... ]
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
Could using regmap_set_bits() here unintentionally clear other pending
interrupts? Since these are Write-1-to-Clear (W1C) registers, a
read-modify-write might write back '1's for unrelated active interrupts that
happened to be pending during the read.

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
> +
> +	/* Toggle AN Status */
> +	regmap_set_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_CONTROL_6,
> +			AIROHA_PCS_USXGMII_TOG_PCS_AUTONEG_STS);

[Severity: High]
Since phylink_pcs_ops->pcs_get_state can be called asynchronously by polling
workqueues, can these state-modifying hardware writes (and the multi-step
resets triggered in the workaround) collide with other configuration routin=
es?

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
[ ... ]
> +			}
[ ... ]
> +			regmap_update_bits(maps->multi_sgmii, AIROHA_PCS_MULTI_SGMII_SGMII_ST=
S_CTRL_0,
> +					   AIROHA_PCS_LINK_MODE_P0 |
> +					   AIROHA_PCS_FORCE_SPD_MODE_P0,
> +					   speed_reg |
> +					   AIROHA_PCS_FORCE_SPD_MODE_P0);

[Severity: Medium]
If the interface is PHY_INTERFACE_MODE_2500BASEX but the speed evaluates to
something other than SPEED_2500, could this write uninitialized memory from
speed_reg to the hardware?

[ ... ]
> +static int airoha_pcs_post_config(struct phylink_pcs *pcs,
> +				  phy_interface_t interface)
> +{
[ ... ]
> +	/* Enable TX/RX flow control */
> +	regmap_set_bits(maps->pcs_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
> +			AIROHA_PCS_XFI_TX_FC_EN);
> +	regmap_set_bits(maps->pcs_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
> +			AIROHA_PCS_XFI_RX_FC_EN);

[Severity: High]
Does this override the pause negotiation settings applied earlier in
pcs_config? Unconditionally writing these bits appears to ignore the
permit_pause_to_mac configuration entirely.

> diff --git a/drivers/net/pcs/airoha/pcs-an7581.c b/drivers/net/pcs/airoha=
/pcs-an7581.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-an7581.c
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

[Severity: High]
Why is pcs_pma[0] hardcoded here (and similarly in an7581_pcs_txpll_bringup)
when setting up the shared PLLs? Similar to the global reset lines, wouldn't
reconfiguring the shared PLL during port 1's bringup disrupt an already
active link on port 0?

[ ... ]
> +static unsigned int an7581_pcs_apply_cdr_pr_idac(struct airoha_pcs_priv =
*priv,
> +						 int index, u32 cdr_pr_idac)
> +{
> +	struct regmap *pcs_pma =3D priv->pcs_pma[index];
> +	u32 val;
[ ... ]
> +	regmap_read(pcs_pma, AIROHA_PCS_PMA_RX_FREQDET, &val);
> +
> +	return FIELD_GET(AIROHA_PCS_PMA_FL_OUT, val);

[Severity: Medium]
If regmap_read() fails, wouldn't val remain uninitialized stack garbage?
Should the return code be checked before extracting fields from it?

[ ... ]
> +static int an7581_pcs_phya_bringup(struct airoha_pcs_priv *priv,
> +				   int index, phy_interface_t interface)
> +{
[ ... ]
> +	regmap_read(pcs_pma, AIROHA_PCS_PMA_RX_FREQDET, &val);
> +	if (!(val & AIROHA_PCS_PMA_FBCK_LOCK)) {

[Severity: Medium]
Is it safe to evaluate val without checking the return value of
regmap_read() first?

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
Will this tight loop execute too quickly for the physical hardware scan to
complete? Without a short delay between triggering the scan and polling the
results, it seems this might return false negatives.

[Severity: Medium]
Also, val is being evaluated here without checking if regmap_read() succeed=
ed.

[ ... ]
> +int an7581_pcs_rxlock_workaround(struct airoha_pcs_priv *priv, int index)
> +{
> +	struct airoha_pcs_maps *maps =3D &priv->maps[index];
> +	u32 val;
> +
> +	/* Check if PCS is UP or Down */
> +	regmap_read(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_STUS_1, &val);
> +	if (val & AIROHA_PCS_USXGMII_PCS_RX_LINK_STATUS_UP)

[Severity: Medium]
Similar to the previous reads, val could be uninitialized if regmap_read()
fails.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730102444.1967=
900-1-ansuelsmth@gmail.com?part=3D10
