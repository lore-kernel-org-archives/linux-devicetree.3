Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F314736C0C8
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620347; cv=none; b=Qhnq0hBfVfQST5H59GdZx1lYe55jVU2NJOPoXCDWbAIr5CwYDLperrNRdooZ1vRadwHuELmXDlnetEkVLEEHM5+f/0W8mT5LTQ51XiYrMqbN9YYFUUzh537FpyH/fJ8XWjSLKbr59fqHttJdAhH8ABYIPfuA8CGOVqnKlYaWQQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620347; c=relaxed/simple;
	bh=QwhcZb2T7l3HCGMYV5TWvBZBU3YLsjKn8wkNQDvsplM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TX4JyM0rksh/DZNO72kRWvnFQVgPs5J8EJlzFySP1JdenRhr86rnxruoUlmrAJN46mZpIBHdsMqRSZkLB1A7Tsz6v7KoT2+ykXLa/UyHqCmRDbx9n7j77l5H3D0lEizPTSh8fMjIRbRHCvDkCQwvJFad7niAMmlHDE/NbvxV4go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOL/y1Jz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOL/y1Jz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BB91F00A3A;
	Tue, 16 Jun 2026 14:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781620345;
	bh=cs/J7IGzAJTKte9/1BHtyFhrXJ7TxN4h7yrmG4TqGjI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UOL/y1JzhMtZnhjQp7D0vJghLX6OdrvSWaQFraAz3zG7JwGloMNBwBp3NUuqy5xLN
	 qYaUhuMVo2JfU/kdwJmzc0Q5/Iko1bv8gUhCrtH/nvL/w2cwFW3pWCKcupm19SaL2V
	 neWTkE+C70EZSU72I6LohKQX0iueO48uIiT7nRDgJ3AUhxie4PXH0YGX1tw5br8W+T
	 lJXiDsuhg5aOTD7smp023ct/z5s9rv5QWfG8ry/fN1XhqTZdqQPMZEuJV8B+gKPUNX
	 HF0UB+eYD+nohTztcfTH7V3p+zDG5yG+WTqpqOWMNjz9lNDxSXkBfBxZCrrQqc8N5M
	 X8+bVjcwYD5+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 11/12] net: pcs: airoha: add PCS driver for
 Airoha AN7581 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615122950.22281-12-ansuelsmth@gmail.com>
References: <20260615122950.22281-12-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 14:32:25 +0000
Message-Id: <20260616143225.A8BB91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] Off-by-one error and lack of signedness check in `airoha_pcs_get` =
allows out-of-bounds array access.
- [High] Unconditional dereference of `match_data` during probe can cause a=
 kernel panic if the driver is bound without a device tree node.
- [High] Switch statements for link speed leave critical register configura=
tion variables completely uninitialized for unexpected speeds.
- [High] The acquired generic PHY for USB is never initialized or powered o=
n.
- [High] Per-port interface mode is stored in the shared `priv->interface` =
global state, causing race conditions in multi-port devices.
- [High] Incorrect TX constant used for RX mode configuration, which breaks=
 SGMII and 1000BASE-X on PCIe.
- [High] Per-port PCS operations modify shared device-level hardware state =
without synchronization, disrupting active ports.
- [Medium] Multiple state-reading functions fail to check the return value =
of `regmap_read()`, resulting in the use of uninitialized stack variables.
- [Low] The signal detection loop executes one more iteration than intended=
, potentially causing false positives.
- [Low] Assignments are separated by commas instead of semicolons, creating=
 an unintended massive expression statement.
- [Low] The result of `airoha_pcs_setup_scu`, which performs critical reset=
 assertions and deassertions, is silently ignored by `airoha_pcs_pre_config=
`.
--

commit 7fccf4b912ca13e1f4f141393b6432c311a781e1
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: airoha: add PCS driver for Airoha AN7581 SoC

Add PCS driver for Airoha AN7581 SoC for Ethernet/PON/PCIe/USB SERDES
and permit usage of external PHY or connected SFP cage. Supported modes
are USXGMII, 10G-BASER, 2500BASE-X, 1000BASE-X and SGMII.

> diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs=
/airoha/pcs-airoha-common.c
> new file mode 100644
> index 0000000000000..5d3b136ed2b59
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-airoha-common.c
> @@ -0,0 +1,1318 @@

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
Does this assert the global bulk reset lines for the entire block regardless
of which port is being configured?

Since the hardware supports up to two ports for PCIe, bringing up the second
port will assert the shared MAC and PHY block reset lines, which could disr=
upt
the already active port.

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

> +static void airoha_pcs_get_state_usxgmii(struct airoha_pcs_priv *priv, i=
nt index,
> +					 struct phylink_link_state *state)
> +{
> +	const struct airoha_pcs_match_data *data =3D priv->data;
> +	struct airoha_pcs_maps *maps =3D &priv->maps[index];
> +	u32 an_done, lpa;
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
> +	regmap_clear_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_CONTROL_=
6,
> +			  AIROHA_PCS_USXGMII_TOG_PCS_AUTONEG_STS);
> +
> +	regmap_read(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_STATS_0, &lpa);
> +	regmap_read(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_STATS_2, &an_d=
one);
> +
> +	state->link =3D !!(lpa & MDIO_USXGMII_LINK);

[Severity: Medium]
Can regmap_read() fail and leave lpa and an_done completely uninitialized?

The return values of the read operations are not checked. If a read fails, =
the
uninitialized stack memory in these variables is then used in bitwise
operations to report the link state, leading to unpredictable results.

> +	state->an_complete =3D !!(an_done & AIROHA_PCS_USXGMII_PCS_AN_COMPLETE);
> +
> +	phylink_decode_usxgmii_word(state, lpa);
> +}

[ ... ]

> +static int airoha_pcs_config(struct phylink_pcs *pcs, unsigned int neg_m=
ode,
> +			     phy_interface_t interface,
> +			     const unsigned long *advertising,
> +			     bool permit_pause_to_mac)
> +{
> +	struct airoha_pcs_port *port =3D to_airoha_pcs_port(pcs);
> +	struct airoha_pcs_priv *priv =3D port->priv;
> +	const struct airoha_pcs_match_data *data;
> +	struct airoha_pcs_maps *maps;
> +	int index =3D port->index;
> +	u32 rate_adapt;
> +	int ret;
> +
> +	maps =3D &priv->maps[port->index];
> +	priv->interface =3D interface;

[Severity: High]
Does storing the interface mode in the shared priv structure cause race
conditions or state corruption for multi-port devices?

Since PCIe configuration uses two ports, configuring the second port will
overwrite the mode for the first port. When airoha_pcs_an_restart() is later
called, it will read the wrong interface mode. Should this state be stored
per-port in the airoha_pcs_port structure instead?

> +	data =3D priv->data;

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
> +
> +	if (neg_mode =3D=3D PHYLINK_PCS_NEG_INBAND_ENABLED) {

[ ... ]

> +	} else {
> +		if (interface =3D=3D PHY_INTERFACE_MODE_USXGMII ||
> +		    interface =3D=3D PHY_INTERFACE_MODE_10GBASER) {
> +			u32 mode;
> +			u32 rate_adapt;
> +
> +			switch (speed) {
> +			case SPEED_10000:
> +				rate_adapt =3D AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_100=
00;
> +				mode =3D AIROHA_PCS_USXGMII_MODE_10000;
> +				break;
> +			case SPEED_5000:
> +				rate_adapt =3D AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_500=
0;
> +				mode =3D AIROHA_PCS_USXGMII_MODE_5000;
> +				break;
> +			case SPEED_2500:
> +				rate_adapt =3D AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_250=
0;
> +				mode =3D AIROHA_PCS_USXGMII_MODE_2500;
> +				break;
> +			case SPEED_1000:
> +				rate_adapt =3D AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_100=
0;
> +				mode =3D AIROHA_PCS_USXGMII_MODE_1000;
> +				break;
> +			case SPEED_100:
> +				rate_adapt =3D AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_100;
> +				mode =3D AIROHA_PCS_USXGMII_MODE_100;
> +				break;
> +			}
> +
> +			/* Force USXGMII to selected speed */
> +			regmap_update_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_CONTR=
OL_7,
> +					   AIROHA_PCS_USXGMII_MODE, mode);

[Severity: High]
Can an unhandled speed leave these local variables completely uninitialized?

The switch statements for speed lack a default case. For example, if SPEED_=
10
is passed in USXGMII mode, variables like mode and rate_adapt are never set.
The code then proceeds to write these uninitialized stack variables into
hardware control registers via regmap_update_bits().

> +
> +			if (interface =3D=3D PHY_INTERFACE_MODE_10GBASER)
> +				regmap_update_bits(maps->hsgmii_rate_adp, AIROHA_PCS_HSGMII_RATE_ADA=
PT_CTRL_11,

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

[Severity: Low]
Is it safe to ignore the return value of airoha_pcs_setup_scu() here?

That function performs important reset assertions and deassertions. If
reset_control_bulk_deassert() fails, the hardware stays in reset, but this
function will silently proceed to perform register writes against a reset
block.

> +
> +	/* MPI MBI disable */
> +	regmap_set_bits(maps->pcs_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,

[ ... ]

> +static int airoha_pcs_init_named_regmap(struct platform_device *pdev,
> +					const char *name, struct regmap **regmap)
> +{
> +	struct regmap_config regmap_config =3D { };
> +	void *base;
> +
> +	base =3D devm_platform_ioremap_resource_byname(pdev, name);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap_config.name =3D name;
> +	regmap_config.reg_bits =3D 32,
> +	regmap_config.val_bits =3D 32,
> +	regmap_config.reg_stride =3D 4,

[Severity: Low]
Are these comma operators intentional?

The regmap_config fields are being initialized using commas instead of
semicolons. This creates a single expression rather than distinct statement=
s,
which might confuse human readers and static analysis tools.

> +
> +	*regmap =3D devm_regmap_init_mmio(&pdev->dev, base, &regmap_config);
> +
> +	return PTR_ERR_OR_ZERO(*regmap);
> +}

[ ... ]

> +static struct phylink_pcs *airoha_pcs_get(struct fwnode_reference_args *=
pcsspec,
> +					  void *data)
> +{
> +	struct airoha_pcs_priv *priv =3D data;
> +	struct device *dev =3D priv->dev;
> +	int index =3D 0;
> +
> +	switch (priv->data->port_type) {
> +	case AIROHA_PCS_ETH:
> +	case AIROHA_PCS_PON:
> +	case AIROHA_PCS_USB:
> +		if (pcsspec->nargs) {
> +			dev_err(dev, "invalid number of cells in 'pcs-handle' property\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		break;
> +	case AIROHA_PCS_PCIE:
> +		if (pcsspec->nargs !=3D 1) {
> +			dev_err(dev, "invalid number of cells in 'pcs-handle' property\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		break;
> +	}
> +
> +	if (pcsspec->nargs)
> +		index =3D pcsspec->args[0];
> +
> +	if (index > priv->data->num_port) {
> +		dev_err(dev, "invalid index cell in 'pcs-handle' property\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return &priv->ports[index].pcs;

[Severity: High]
Does this check allow an out-of-bounds array access?

The priv->ports array is sized by data->num_port. The check evaluates to fa=
lse
when index equals data->num_port, allowing access one element past the end =
of
the array.

Also, since index is a signed integer initialized from a u64, could a very
large unsigned value truncate to a negative number and bypass this check
entirely?

> +}
> +
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

[Severity: High]
Can of_device_get_match_data() return NULL here?

If the driver is bound manually via sysfs instead of through a device tree
node, this will return NULL. The code then unconditionally dereferences
data->num_port, which would cause a kernel panic. Should this include a NULL
check?

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
Does this code acquire the PHY without ever initializing or powering it on?

The driver calls devm_phy_get() but there are no corresponding calls to
phy_init() or phy_power_on(). Without these, the PHY hardware might remain
unclocked or powered down, which could cause bus hangs when phy_set_mode_ex=
t()
is called later in an7581_pcs_usb_bringup().

> +	}
> +
> +	switch (data->port_type) {

[ ... ]

> diff --git a/drivers/net/pcs/airoha/pcs-an7581.c b/drivers/net/pcs/airoha=
/pcs-an7581.c
> new file mode 100644
> index 0000000000000..638e20cac97ea
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
Is it intentional to hardcode priv->pcs_pma[0] here even when configuring
port 1?

This re-initializes the shared PLL whenever any port is brought up. For a
dual-port PCIe configuration, initializing the second port will disrupt the
shared PLL and cause clock loss for the first port.

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

[ ... ]

> +static void an7581_pcs_rx_bringup(struct airoha_pcs_priv *priv,
> +				  int index, phy_interface_t interface)
> +{
> +	struct regmap_field **pcs_ana_fields =3D priv->pcs_ana_fields[index];
> +	struct regmap *pcs_pma =3D priv->pcs_pma[index];
> +	u32 phyck_div, phyck_sel;
> +	u32 pr_cdr_beta_dac;
> +	u32 cdr_pr_buf_in_sr;
> +	bool cdr_pr_cap_en;
> +	u32 sigdet_vth_sel;
> +	u32 rx_rate_ctrl;
> +	u32 xfi_rx_mode;
> +	u32 osr;
> +
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_1000BASEX:
> +		osr =3D BIT(1) | BIT(0); /* 1.25G */
> +		pr_cdr_beta_dac =3D BIT(3);
> +		rx_rate_ctrl =3D 0;
> +		cdr_pr_cap_en =3D false;
> +		cdr_pr_buf_in_sr =3D BIT(2) | BIT(1) | BIT(0);
> +		sigdet_vth_sel =3D BIT(2) | BIT(1);
> +		phyck_div =3D BIT(5) | BIT(3) | BIT(0);
> +		phyck_sel =3D BIT(0);
> +		xfi_rx_mode =3D AIROHA_PCS_PMA_XFI_TX_MODE_1G25;

[Severity: High]
Is this using a TX mode constant for an RX configuration?

AIROHA_PCS_PMA_XFI_TX_MODE_1G25 has a different bit layout (shifted to bit =
3)
compared to the RX mode mask which operates on bits 11 to 9.

When this is applied, the TX bits fall outside the RX mask and get filtered
out. This will write 0 to the RX mode field, improperly configuring it to 1=
0G3
instead of 1G25.

> +		break;
> +	case PHY_INTERFACE_MODE_2500BASEX:

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
> +	/* Scan 5 times for RX sigdet module to detect RX signal */
> +	for (i =3D 0; i <=3D 5; i++) {

[Severity: Low]
Does this loop execute six times instead of the five times mentioned in the
comment?

The loop uses i <=3D 5, which iterates for 0 through 5. Since the logic loo=
ks
for count >=3D 4 to determine a valid signal, checking six times lowers the
threshold percentage and might return true on marginal or false signals.

> +		regmap_read(pcs_pma, AIROHA_PCS_PMA_DIG_RO_RESERVE_2,
> +			    &val);
> +		if (val & AIROHA_PCS_RX_SIGDET)
> +			count++;
> +	}
> +
> +	/* Consider signal presence if we detect signal at least 4 times */
> +	return count >=3D 4;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615122950.2228=
1-1-ansuelsmth@gmail.com?part=3D11
