Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940509;
	b=NM95iOvmDaCzpYyoOAfU6+gWdwzbaWt15hT9jQ/9vEzTlolalsnsdglTVDfSetX/1XAX
	 CW4LMNp5tyeez8FWM6sXbZ+SAVNTPAXNZx3MyVJBQdb63MQFuWrRAmOrCdmv+ospqvSty
	 MEe5zBFQNZGTR9JhfSQdrehDsx4CXZ4Sis4Mw8/kqY7zHm1E0BnKqiGO0YxZMGgG/IDe/
	 S3TA1m58kIkUKaLsDNTywwVPQbhmVfJykd2eobSCx5ltpMrIRtAAvXvkYS4/cmETOHr3P
	 c6NOLdnFQqXHJ/1BhGzgkYImnFLsd9N9RLSPr6wVAPYLrp1/L3F/VwKkCBVSjIsjfJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940509;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oZfdPrrdZfElPuEO85KmEX3S3NzzaCZJZpEk1xlvqyU=;
	b=0X5PbM8J85e/Eo7sPP1GkM6ymTu4BPZe4gM857JjlxP2/eqcF5fYyR36pnxVaGnWG45/
	 IvJbBVYbwd0wV19M3UB0jH+1ay6UNb0Oon8xyM5VvOuPDt7+dBt+4Yxv6AVZDZinktbQF
	 TJh2UGlNeSS1oZldPXBlC0JAPrQGFy7DtxrgyDOUCiLyk4szN962GbRWi4Tmt8ITOXg1J
	 rqqnIxBfkTvEGbGa7ME8prANsEly60hXFNyMcT42gx7FS+AGtHmDiWrScgRXwLREHk1yP
	 /rd73OGbTyQczRGkdA6g2LvZXAJUDsENosZHATtODx7tmGa9FWX7qW0nuVLV6zX83fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FUKx5eEI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85D2606A33A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FUKx5eEI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8080C1F000CC;
	Tue, 17 Nov 2026 18:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940509;
	bh=oZfdPrrdZfElPuEO85KmEX3S3NzzaCZJZpEk1xlvqyU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FUKx5eEI5tCvgrQYm6UKuC/Oc4d9WMtxnNa0sXdr38crOE3vPu9SuCVrvJA2kDGZR
	 nkf5c2QGfPO0Ox+E167OftSeumYsp5kX3DaGIqqW+DiUyLG1SE+ayDfEER8ZkZEEQN
	 jAC3PRYJoO55x2wXg9IYW9foisva3tUXjRteaNLnZkvYsIBNxiN34KxJ342Pe+1BNv
	 XdPtA9SJxZd6CNHAqCkj16mxSk8EHm6MqeUmRMGUKErr8jjTSUPioXrR/XtlYMZ/pX
	 i6D9Mddq/M4kLlD0MFt+dbZjI+o6S1mu8U+4FbkZWYoS5EMv+eKqTLVBdiJBXvvp2M
	 j4I6iyRbnPLpA==
Message-ID: <sashiko-outbox-219356@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [net-next v5 7/7] net: dsa: mediatek: support EN751221 switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116183332.168858-8-cjd@cjdns.fr>
References: <20261116183332.168858-1-cjd@cjdns.fr>
 <20261116183332.168858-8-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:35:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] net: dsa: mt7530: missing dsa_unregister_switch() in
  mt7988_probe()
- [High] net: dsa: mt7530: premature mt7530_setup_mdio() before switch
  reset in mt7988_setup()
- [Medium] net: dsa: mt7530: peer phylink race and PMCR clobber in
  TRGMII calibration
- [Medium] net: dsa: mt7530: missing child_bus mdio_lock in core_write()
  and core_rmw()
- [Low] net: dsa: mt7530: comment and bit update mismatch in
  mt7988_setup()
--

commit 86fcc48d199eaeddf4405613e3b2f52247299102
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: support EN751221 switch

This commit adds support for the EcoNet EN751221 on-die MMIO MT7530 switch
and external MDIO MCM MT7530 switch, along with TRGMII calibration for the
inter-switch link between them.

> diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
> index ab6d92ab3ec0b..989fe95ec4f36 100644
> --- a/drivers/net/dsa/mt7530-mmio.c
> +++ b/drivers/net/dsa/mt7530-mmio.c
> @@ -12,6 +12,7 @@
>  static const struct of_device_id mt7988_of_match[] =3D {
>  	{ .compatible =3D "airoha,an7583-switch", .data =3D &mt753x_table[ID_AN=
7583], },
>  	{ .compatible =3D "airoha,en7581-switch", .data =3D &mt753x_table[ID_EN=
7581], },
> +	{ .compatible =3D "econet,en751221-switch", .data =3D &mt753x_table[ID_=
EN751221], },
>  	{ .compatible =3D "econet,en7528-switch", .data =3D &mt753x_table[ID_EN=
7528], },
>  	{ .compatible =3D "mediatek,mt7988-switch", .data =3D &mt753x_table[ID_=
MT7988], },
>  	{ /* sentinel */ }

[Severity: High]
When econet,en751221-switch is paired with the downstream MDIO switch
econet,en751221-gswitch, can a failure in mt7530_setup_mdio() leave priv->ds
registered in the DSA tree after probe fails?

drivers/net/dsa/mt7530-mmio.c:mt7988_probe() {
    ...
	ret =3D dsa_register_switch(priv->ds);

	if (ret)
		return ret;
    ...
	mnp =3D of_get_child_by_name(pdev->dev.of_node, "mdio");
	if (mnp) {
		of_node_put(mnp);
		ret =3D mt7530_setup_mdio(priv);
	}

	return ret;
}

When mt7988_probe() runs before the downstream MDIO switch has been probed,
dsa_register_switch() links the switch's ports into dst->ports and returns 0
without calling mt753x_setup().  mt7988_probe() then calls
mt7530_setup_mdio(priv) for the first time, as introduced in commit "net: d=
sa:
mediatek: support MDIO switch downstream of MMIO switch".  If
mt7530_setup_mdio() fails (for example, if of_irq_get() in mt7530_setup_irq=
()
returns -EPROBE_DEFER), mt7988_probe() returns the error without calling
dsa_unregister_switch(priv->ds).  The driver core then frees the devm-manag=
ed
priv and priv->ds while dst->ports retains dangling dp->ds pointers and a
leaked reference on the conduit net_device, causing a use-after-free on the
next dsa_switch_find() walk during a probe retry.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 4390982a5e225..701e6b3b928f2 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -49,6 +49,9 @@ static const struct mt7530_mib_desc mt7530_mib[] =3D {
>  static int
>  mt753x_ctrl_phy_addr(struct mt7530_priv *priv)
>  {
> +	if (priv->id =3D=3D ID_EN751221)
> +		return 12;
> +
>  	if (WARN_ON_ONCE(!priv->mdiodev))
>  		return 0;
> =20
> @@ -349,12 +352,19 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_inter=
face_t interface)
>  	regmap_read(priv->regmap, MT753X_MTRAP, &xtal);
>  	xtal &=3D MT7530_XTAL_MASK;
> =20
> +	/* EN751221 on-die does not report clock speed in MTRAP */
> +	if (priv->id =3D=3D ID_EN751221)
> +		xtal =3D MT7530_XTAL_25MHZ;
> +
>  	if (xtal =3D=3D MT7530_XTAL_25MHZ)
>  		ssc_delta =3D 0x57;
>  	else
>  		ssc_delta =3D 0x87;
> =20
> -	if (priv->id =3D=3D ID_MT7621) {
> +	if (priv->id =3D=3D ID_EN751221_EXT || priv->id =3D=3D ID_EN751221) {
> +		/* PLL frequency: 362.5Mhz */
> +		ncpo1 =3D 0x1d00;
> +	} else if (priv->id =3D=3D ID_MT7621) {

[Severity: Medium]
When mt7530_setup_port6() runs on the MMIO-based ID_EN751221 switch, do
core_write() and core_rmw() perform multi-step MMD sequences on
priv->child_bus without holding priv->child_bus->mdio_lock?

drivers/net/dsa/mt7530.c:mt7530_mutex_lock() {
	if (priv->bus)
		mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
}

drivers/net/dsa/mt7530.c:core_write() {
    ...
	if (!bus)
		bus =3D priv->child_bus;

	if (WARN_ON_ONCE(!bus))
		return;

	mt7530_mutex_lock(priv);

	/* Write the desired MMD Devad */
	ret =3D bus->write(bus, ctl_phy, MII_MMD_CTRL, MDIO_MMD_VEND2);
    ...
}

On ID_EN751221, priv->bus is NULL, so core_write() and core_rmw() fall back
to priv->child_bus, while mt7530_mutex_lock() is a no-op because it only
checks priv->bus.  Each bus->write() and bus->read() call only acquires
priv->reg_mutex for a single Clause 22 transfer, so concurrent MDIO traffic
on priv->child_bus (such as phylib polling PHY 12 or regmap accesses to the
downstream ID_EN751221_EXT switch) can interleave between the MII_MMD_CTRL
and MII_MMD_DATA transfers and corrupt the MMD register access:

CPU0                                  CPU1
mt7530_setup_port6()
  core_write(ondie, ...)
    mt7530_mutex_lock(ondie) [no-op]
    bus->write(..., MII_MMD_CTRL, ...)
    bus->write(..., MII_MMD_DATA, reg)
                                      phy_state_machine() / ext regmap
                                        mdiobus_read(ondie->child_bus, ...)
    bus->write(..., MII_MMD_CTRL, ...)
    bus->write(..., MII_MMD_DATA, val)  <-- interleaved MMD sequence

Locking and unlocking bus->mdio_lock on whichever bus (priv->bus or
priv->child_bus) is selected would serialize the full MMD sequence.

> @@ -471,6 +481,251 @@ mt7531_pll_setup(struct mt7530_priv *priv)
[ ... ]
> +static void
> +en751221_trgmii_pair_setup(struct mt7530_priv *ext, int ext_port,
> +			   struct mt7530_priv *ondie, int ondie_port)
> +{
> +	u8 default_taps_ondie[NUM_TRGMII_CTRL];
> +	u8 default_taps_ext[NUM_TRGMII_CTRL];
> +	u32 mcr_down, mcr_up;
> +	int channel;
> +	int reg_val;
> +
> +	/* BOTH: Put interfaces in a downed state */
> +	mcr_down =3D PMCR_IFG_XMIT(PMCR_IFG_XMIT_64) | PMCR_MAC_MODE |
> +		   MT7530_FORCE_MODE | PMCR_MAC_RX_EN | PMCR_BACKOFF_EN |
> +		   PMCR_BACKPR_EN | PMCR_FORCE_SPEED_1000 | PMCR_FORCE_FDX;
> +	regmap_write(ondie->regmap,  MT753X_PMCR_P(ondie_port), mcr_down);
> +	regmap_write(ext->regmap, MT753X_PMCR_P(ext_port), mcr_down);
> +	usleep_range(5000, 6000);
> +
> +	/* BOTH: Reset TX */
> +	regmap_set_bits(ext->regmap, MT7530_TRGMII_TXCTRL, TX_RST);
> +	regmap_set_bits(ondie->regmap, MT7530_TRGMII_TXCTRL, TX_RST);
> +	usleep_range(5000, 6000);
> +	regmap_clear_bits(ext->regmap, MT7530_TRGMII_TXCTRL, TX_RST);
> +	regmap_clear_bits(ondie->regmap, MT7530_TRGMII_TXCTRL, TX_RST);
> +
> +	/* BOTH: Reset RX controllers down */
> +	regmap_set_bits(ext->regmap, MT7530_TRGMII_RCK_CTRL, RX_RST);
> +	regmap_set_bits(ondie->regmap, MT7530_TRGMII_RCK_CTRL, RX_RST);
> +
> +	/* BOTH: Set TX drive strength, MCM uses more */
> +	en751221_set_tx_drive(ondie, 8, 8, 7, 7);
> +	en751221_set_tx_drive(ext, 11, 11, 15, 15);
> +
> +	/* BOTH: Reset RX controllers up */
> +	regmap_clear_bits(ext->regmap, MT7530_TRGMII_RCK_CTRL, RX_RST);
> +	regmap_clear_bits(ondie->regmap, MT7530_TRGMII_RCK_CTRL, RX_RST);
> +
> +	/* BOTH: Ports up */
> +	mcr_up =3D mcr_down | PMCR_MAC_TX_EN | PMCR_FORCE_LNK;
> +	regmap_write(ondie->regmap, MT753X_PMCR_P(ondie_port), mcr_up);
> +	regmap_write(ext->regmap, MT753X_PMCR_P(ext_port), mcr_up);
[ ... ]
> +static void
> +mt7530_cal_interswitch_trgmii(struct dsa_port *dp)
> +{
> +	struct dsa_switch *ds =3D dp->ds;
> +	struct dsa_switch *peer_ds;
> +	struct dsa_port *peer_dp;
> +	struct mt7530_priv *peer;
> +	struct mt7530_priv *priv;
> +	struct dsa_link *dl;
> +	u32 pmsr =3D 0;
> +
> +	priv =3D ds->priv;
> +
> +	if (priv->id !=3D ID_EN751221_EXT)
> +		return;
> +
> +	if (dp->type !=3D DSA_PORT_TYPE_DSA)
> +		return;
> +
> +	regmap_read(priv->regmap, MT7530_PMSR_P(dp->index), &pmsr);
> +
> +	if (!(pmsr & PMSR_LINK))
> +		return;
[ ... ]
> @@ -3263,6 +3564,9 @@ static void mt753x_phylink_mac_link_up(struct phyli=
nk_config *config,
>  	}
> =20
>  	regmap_set_bits(priv->regmap, MT753X_PMCR_P(dp->index), mcr);
> +
> +	if (interface =3D=3D PHY_INTERFACE_MODE_TRGMII)
> +		mt7530_cal_interswitch_trgmii(dp);
>  }

[Severity: Medium]
Does en751221_trgmii_pair_setup() clobber the flow-control bits in
MT753X_PMCR_P and race with the peer port's phylink_resolve() work item?

mt753x_phylink_mac_link_up() sets PMCR_FORCE_TX_FC_EN and PMCR_FORCE_RX_FC_=
EN
in MT753X_PMCR_P(dp->index) before calling mt7530_cal_interswitch_trgmii(dp=
),
which then overwrites MT753X_PMCR_P on both ondie_port and ext_port using
regmap_write(..., mcr_up), dropping both flow-control bits.

In addition, each port's phylink_resolve() work item is only serialized by =
its
own pl->state_mutex, and mt7530_cal_interswitch_trgmii() checks PMSR_LINK on
priv->regmap (which was just forced up) rather than on peer->regmap, and on=
ly
runs when priv->id =3D=3D ID_EN751221_EXT.  While en751221_trgmii_pair_setu=
p()
sleeps in usleep_range(5000, 6000) with both ports forced down for TRGMII
reset, on-die port 5's phylink_resolve() can run concurrently and re-enable
MT753X_PMCR_P(ondie_port) mid-reset, or resolve after external port 6 when
mt7530_cal_interswitch_trgmii() is skipped because priv->id !=3D ID_EN75122=
1_EXT:

kworker (ext port 6)                  kworker (ondie port 5)
mt753x_phylink_mac_link_up()
  regmap_set_bits(..., mcr)
  mt7530_cal_interswitch_trgmii()
    en751221_trgmii_pair_setup()
      regmap_write(ondie, PMCR, mcr_down)
      usleep_range(5000, 6000)
                                      mt753x_phylink_mac_link_up()
                                        regmap_set_bits(ondie, PMCR, mcr)
                                          <-- brings port up during reset
      regmap_set_bits(..., TX_RST)
      ...
      regmap_write(..., PMCR, mcr_up) <-- overwrites TX/RX flow control

[ ... ]

> @@ -3617,6 +3922,15 @@ static int mt7988_setup(struct dsa_switch *ds)
>  				   AN7583_CSR_PHY_CORE_REG_CLK_SEL |
>  				   FIELD_PREP(AN7583_CSR_ETHER_AFE_PWD, 0));
> =20
> +	/*
> +	 * EN751221 is an MT7530 but it is MMIO so setup is largely the same
> +	 * as the MMIO MT7531, but CHG_TRAP and INDIRECT_ACCESS must be set.
> +	 */
> +	if (priv->id =3D=3D ID_EN751221)
> +		regmap_update_bits(priv->regmap, MT753X_MTRAP,
> +				   MT7530_CHG_TRAP | MT7530_PHY_INDIRECT_ACCESS,
> +				   MT7530_CHG_TRAP);
> +
>  	/* Reset the switch PHYs */
>  	regmap_write(priv->regmap, MT7530_SYS_CTRL, SYS_CTRL_PHY_RST);

[Severity: High]
When ID_EN751221 has the downstream ID_EN751221_EXT switch on its MDIO bus,
does mt7988_setup() reset the on-die switch after mt7988_probe() has already
initialized its IRQ chip and MDIO bus?

During mt7988_probe() for ID_EN751221, dsa_register_switch() returns 0
without calling mt753x_setup() -> mt7988_setup() because ID_EN751221_EXT has
not been probed yet.  mt7988_probe() then calls mt7530_setup_mdio(priv),
which runs mt7530_setup_irq() (programming MT7530_SYS_INT_EN) and registers
the MDIO bus to probe ID_EN751221_EXT before priv->rstc has been deasserted
or MT753X_MTRAP has been configured.  Once ID_EN751221_EXT registers with D=
SA,
dsa_tree_setup_switches() runs mt7988_setup() on ID_EN751221, which asserts
and deasserts priv->rstc and writes SYS_CTRL_PHY_RST, wiping out the
interrupt controller state configured by mt7530_setup_irq(), while the seco=
nd
mt7530_setup_mdio() call returns early because priv->child_bus is already
set.  Also, if the mdio child node is marked disabled in Device Tree,
mt7530_setup_mdio() leaves priv->child_bus NULL after calling
mt7530_setup_irq(), so the second mt7530_setup_mdio() call invokes
mt7530_setup_irq() a second time.

[Severity: Low]
The comment in mt7988_setup() says that both CHG_TRAP and INDIRECT_ACCESS
must be set, whereas the regmap_update_bits() call passes
MT7530_CHG_TRAP | MT7530_PHY_INDIRECT_ACCESS as the mask and only
MT7530_CHG_TRAP as the value, which clears MT7530_PHY_INDIRECT_ACCESS.  Was
MT7530_PHY_INDIRECT_ACCESS meant to be cleared here (as in mt7530_setup()) =
or
set?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116183332.1688=
58-1-cjd@cjdns.fr?part=3D7
