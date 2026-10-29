Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793236461;
	b=Z8Jk//Vo8axOzjgacb/G8009j8zo047YchZBOwqa4bq1TBsHiouRiVDWE44vog9yKOzz
	 rajX87hYyeTRa8cBpKpnS5bhrqSVkBWYR7S7IOokFpVnwJfYR5Jw2chfSyypx7IM1wJxW
	 U0sqLTPnmiicBX3r7t9KLA+OTb3E8QL1li19v4iBD/H2xtcBJ4xetgytCEVOvMOjRS1NF
	 LZc39PqGAIBSoC9kiuldG544d6Ica+LCKDFQCYZtWr6fut0UmJPYl4pv/gHBrgIBeJcC0
	 Ens109TR+lLI5M2Z4/AU0Ak2oFwvXsZ4hfqaitBaGmypAUPRk/lr6LCZmZNjP4+x6uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793236461;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9LwYS6Lecv+8baKol1VDn3UT7LjKryLrLo6IeuDkpfQ=;
	b=TzwaFA1RA8IrAU+4+REvd/7rxan8W5MKBn7DyAWmGp6q+O4n9hBX2RVvE1SxSeLl/2V0
	 Wmp7nVR7thOcJFb3V/JQ7S28IwefChwsLXlMPzUdoNCKZQ63vwA8+R6k7a2QmKLsmQUrm
	 AgRrdA80KHx7EJtuHvgzUOZQQ8dsn6ur/ENGKeeaNGIysBS7uVrQqG1QCF0e+NP2F+7cC
	 GQSpfuqdu5UxIMP9OioYaXMYW2tsVQDpTfUPNAMtQs4IV4IhCod8fjzXsviE/NgoSnFhs
	 a475cUnrjUOQG3hi0aJ6esZl837+88ryKl8NdoN2zWFW5nILln7lPa088uw8XL+xJ0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LuZZKJwb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9538F606A323
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LuZZKJwb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EACD1F01829;
	Thu, 29 Oct 2026 01:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793236460;
	bh=9LwYS6Lecv+8baKol1VDn3UT7LjKryLrLo6IeuDkpfQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LuZZKJwbe1M2bfF0mR8vDmtZHtA525XHcPNwvSl9DeVMarPI3IpRXg9Oo5mHsY+U3
	 EHy1hrDh7PKoG9DKxBFM5h+LKfYOcQk453Ftb+Mji3h/IpeOaURpZ0egYEgAOUlEMh
	 bBNCp0zVRQC9pj3bf5A1ZevG/0tt4XiqNJGU8o4u/UOo/C2kuT7J+Rq+6ytofPCFCY
	 jZx/CD87yG9iHvG56n05el0DdekD7/MFLAXG1TDKwOTtV67ao0lFA0mdPBSz+sXGfS
	 StSr9bB03cDe5unRGkvXBq4wjdT3MtVEcN6mUEOI6lHJavmILAShY/cTqEqulNS9Kb
	 vUDdQK+0sbZzA==
Message-ID: <sashiko-outbox-188589@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] net: dsa: mediatek: support EN751221 switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028011317.1557238-8-cjd@cjdns.fr>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
 <20261028011317.1557238-8-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 01:14:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] net: dsa: mt7530: wrong DT compatible for EN751221 MCM in mt7530_o=
f_match
- [High] net: dsa: mt7530: missing MT7530_CHG_TRAP when modifying MT753X_MT=
RAP on ID_EN751221
- [High] net: dsa: mt7530: missing mdio_lock on child_bus in core_write() a=
nd core_rmw()
- [High] net: dsa: mt7530: recursive and circular lockdep splat on priv->re=
g_mutex
- [Medium] net: dsa: mt7530: swapped default_taps in en751221_trgmii_pair_s=
etup()
- [Medium] net: dsa: mt7530: race and PMCR overwrite in en751221_trgmii_pai=
r_setup()
- [Low] net: dsa: mt7530: pointer sign mismatch in en751221_trgmii_pair_set=
up()
--

commit 85ba58f824cbae0004b2e71d18d07ad1fa1648f5
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: support EN751221 switch

This commit adds DSA support for the EcoNet EN751221 on-die MT7530 switch
and its optional external MCM gigabit MT7530 switch, along with startup
calibration for the TRGMII cascade link connecting them.

> diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
> index 0be107dc6759a..03ef6a9f2084e 100644
> --- a/drivers/net/dsa/mt7530-mdio.c
> +++ b/drivers/net/dsa/mt7530-mdio.c
> @@ -139,6 +139,7 @@ mt7531_create_sgmii(struct mt7530_priv *priv)
>  }
> =20
>  static const struct of_device_id mt7530_of_match[] =3D {
> +	{ .compatible =3D "econet,en751221", .data =3D &mt753x_table[ID_EN75122=
1_EXT], },
>  	{ .compatible =3D "mediatek,mt7621", .data =3D &mt753x_table[ID_MT7621]=
, },
>  	{ .compatible =3D "mediatek,mt7530", .data =3D &mt753x_table[ID_MT7530]=
, },
>  	{ .compatible =3D "mediatek,mt7531", .data =3D &mt753x_table[ID_MT7531]=
, },

[Severity: High]
Should the compatible string in mt7530_of_match[] be
"econet,en751221-gswitch" instead of "econet,en751221"?

In Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml, the
compatible string for the multi-chip module gigabit MT7530 in the EN751221
SoC is defined as:

      - description:
          Multi-chip module gigabit MT7530 in EN751221 SoC
        const: econet,en751221-gswitch

whereas "econet,en751221" is the top-level SoC compatible string in
Documentation/devicetree/bindings/mips/econet.yaml. With "econet,en751221"
in mt7530_of_match[], won't a device tree conforming to the binding fail
to match and probe the MCM switch?

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index dbe3887097dbc..c44f2084b1730 100644
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
> @@ -347,12 +350,19 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_inter=
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

[Severity: High]
When mt7530_setup_port6() runs on the MMIO-based ID_EN751221 switch, it
calls core_clear(), core_write(), and core_set() (which wraps core_rmw()).

In core_write() and core_rmw(), when priv->bus is NULL, bus falls back to
priv->child_bus:

	if (!bus)
		bus =3D priv->child_bus;

	if (WARN_ON_ONCE(!bus))
		return;

	mt7530_mutex_lock(priv);

	/* Write the desired MMD Devad */
	ret =3D bus->write(bus, ctl_phy, MII_MMD_CTRL, MDIO_MMD_VEND2);

However, mt7530_mutex_lock() and mt7530_mutex_unlock() only check
priv->bus:

static void
mt7530_mutex_lock(struct mt7530_priv *priv)
{
	if (priv->bus)
		mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
}

When priv->bus is NULL on ID_EN751221, mt7530_mutex_lock() is a no-op, so
core_write() and core_rmw() perform multi-step Clause 22 MMD indirect
accesses (MII_MMD_CTRL and MII_MMD_DATA on PHY address 12) via raw
bus->write() and bus->read() calls without holding
priv->child_bus->mdio_lock.

Although each individual mt7531_ind_c22_phy_write() or
mt7531_ind_c22_phy_read() call acquires priv->reg_mutex for a single
Clause 22 transfer, can concurrent accesses on priv->child_bus (such as
phylib polling port 4's GPHY at address 12 or accessing the downstream
ID_EN751221_EXT switch) interleave with the multi-step MMD sequence and
corrupt the register access?

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

[Severity: Low]
Since reg_val is passed as &reg_val to regmap_read() below, which expects
an unsigned int * argument, should reg_val be declared as u32 or unsigned
int to avoid a -Wpointer-sign compiler warning?

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
> +
> +	/* MCM: Set Ext->SoC TX delay to 0 */
> +	for (channel =3D 0; channel < NUM_TRGMII_CTRL; channel++)
> +		regmap_clear_bits(ext->regmap, EN7530_TRGMII_TD_CTRL(channel),
> +				  TGMII_TD_TAP_MASK);
> +
> +	/* SOC: ODT */
> +	regmap_set_bits(ondie->regmap, MT7530_TRGMII_RCK_RTT,
> +			DQS1_GATE | DQS0_GATE | EN751221_B17);
> +
> +	/* SOC: Undocumented */
> +	for (channel =3D 0; channel < NUM_TRGMII_CTRL; channel++)
> +		regmap_write(ondie->regmap,  (0x7a14 + channel * 8),
> +			     0x3227700);
> +
> +	/* MCM: Spread spectrum clock*/
> +	core_clear(ext, CORE_PLL_GROUP8, RG_LCDDS_SSC_EN);
> +
> +	/* BOTH: Zero clock delay */
> +	regmap_clear_bits(ext->regmap, MT7530_TRGMII_RCK_CTRL,
> +			  DQSI0_TAP_MASK);
> +	regmap_clear_bits(ondie->regmap, MT7530_TRGMII_RCK_CTRL,
> +			  DQSI0_TAP_MASK);
> +
> +	/* BOTH: Collect and then zero every RX TAP */
> +	for (channel =3D 0; channel < NUM_TRGMII_CTRL; channel++) {
> +		reg_val =3D 0;
> +		regmap_read(ext->regmap, MT7530_TRGMII_RD(channel), &reg_val);
> +		default_taps_ext[channel] =3D FIELD_GET(RD_TAP_MASK, reg_val);
> +		regmap_clear_bits(ext->regmap, MT7530_TRGMII_RD(channel),\
> +				  RD_TAP_MASK);
> +
> +		reg_val =3D 0;
> +		regmap_read(ondie->regmap, MT7530_TRGMII_RD(channel), &reg_val);
> +		default_taps_ondie[channel] =3D FIELD_GET(RD_TAP_MASK, reg_val);
> +		regmap_clear_bits(ondie->regmap, MT7530_TRGMII_RD(channel),\
> +				  RD_TAP_MASK);
> +	}
> +
> +	en751221_trgmii_calibrate_direction(ondie, ext, default_taps_ondie);
> +	en751221_trgmii_calibrate_direction(ext, ondie, default_taps_ext);

[Severity: Medium]
Are default_taps_ondie and default_taps_ext swapped in these two
en751221_trgmii_calibrate_direction() calls?

In en751221_trgmii_calibrate_direction(struct mt7530_priv *tx,
struct mt7530_priv *rx, u8 *default_taps), default_taps is used to log the
old tap on rx->dev and to restore RD_TAP in rx->regmap if calibration
fails:

		if (best_tap > -1) {
			regmap_update_bits(rx->regmap, rx_reg, RD_TAP_MASK,
					   RD_TAP(best_tap));

			log[best_tap] =3D 'X';

			dev_info(rx->dev,
				 "TRGMII lane %d: %s tap %d old %d\n",
				 channel, log, best_tap, default_taps[channel]);
		} else {
			regmap_update_bits(rx->regmap, rx_reg, RD_TAP_MASK,
					   RD_TAP(default_taps[channel]));

When rx is ext, default_taps_ondie is passed instead of default_taps_ext,
and when rx is ondie, default_taps_ext is passed instead of
default_taps_ondie.

> +
> +	dev_info(ondie->dev, "TRGMII inter-switch link initialized\n");
> +}
> +
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
> +
> +	list_for_each_entry(dl, &ds->dst->rtable, list) {
> +		if (dl->dp !=3D dp)
> +			continue;
> +
> +		peer_dp =3D dl->link_dp;
> +
> +		if (peer_dp->type !=3D DSA_PORT_TYPE_DSA)
> +			continue;
> +
> +		peer_ds =3D dl->link_dp->ds;
> +
> +		if (!of_device_is_compatible(peer_ds->dev->of_node,
> +					     "econet,en751221-switch"))
> +			continue;
> +
> +		peer =3D peer_ds->priv;
> +
> +		if (peer->id !=3D ID_EN751221)
> +			continue;
> +
> +		en751221_trgmii_pair_setup(priv, dp->index, peer,
> +					   peer_dp->index);
> +	}
> +}

[Severity: Medium]
Can en751221_trgmii_pair_setup() race with phylink_resolve() on the peer
switch port and overwrite flow-control settings on both ports?

During dsa_tree_setup_ports(), phylink_start() queues independent
pl->resolve work items on system_power_efficient_wq for both the external
switch's DSA port (port 6) and the on-die switch's DSA port (port 5).
mt753x_phylink_mac_link_up() invokes mt7530_cal_interswitch_trgmii() while
holding only the local port's dp->pl->state_mutex, and checks PMSR_LINK on
priv->regmap (which was just forced up in MT753X_PMCR_P(dp->index)) rather
than synchronizing with peer_dp.

While en751221_trgmii_pair_setup() writes mcr_down to
MT753X_PMCR_P(ondie_port), sleeps in usleep_range(5000, 6000) during TX/RX
reset, and calibrates the link, peer_dp's phylink_resolve() work can run
concurrently and modify MT753X_PMCR_P(5) via mt753x_phylink_mac_link_up()
or mt753x_phylink_mac_link_down(). In addition, writing hardcoded mcr_up
values via regmap_write() to MT753X_PMCR_P(ondie_port) and
MT753X_PMCR_P(ext_port) overwrites PMCR_FORCE_TX_FC_EN and
PMCR_FORCE_RX_FC_EN set by mt753x_phylink_mac_link_up().

>  static void
>  mt7530_mib_reset(struct dsa_switch *ds)
>  {
> @@ -1414,7 +1669,8 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
> =20
>  	mutex_unlock(&priv->reg_mutex);
> =20
> -	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621)
> +	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621 &&
> +	    priv->id !=3D ID_EN751221 && priv->id !=3D ID_EN751221_EXT)
>  		return 0;
> =20
>  	if (port =3D=3D 5)
> @@ -1441,7 +1697,8 @@ mt7530_port_disable(struct dsa_switch *ds, int port)
> =20
>  	mutex_unlock(&priv->reg_mutex);
> =20
> -	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621)
> +	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621 &&
> +	    priv->id !=3D ID_EN751221 && priv->id !=3D ID_EN751221_EXT)
>  		return;
> =20
>  	/* Do not set MT7530_P5_DIS when port 5 is being used for PHY muxing. */

[Severity: High]
Does setting up the downstream ID_EN751221_EXT switch on the upstream
ID_EN751221 switch's MDIO bus trigger a recursive and circular lockdep
warning on priv->reg_mutex?

Both switches initialize priv->reg_mutex at the same mutex_init() call
site in mt7530_probe_common(), so both mutexes share a single lockdep
class key.

During mt7530_setup() on the external switch, unguarded regmap accesses on
ext->regmap acquire ondie->child_bus->mdio_lock (with subclass
MDIO_MUTEX_NESTED) via mt7530_mdio_regmap_lock() and then invoke
mt7531_ind_c22_phy_write() or mt7531_ind_c22_phy_read(), which acquires
ondie->reg_mutex (subclass 0). That establishes the lock order:

  mdio_lock (MDIO_MUTEX_NESTED) -> priv->reg_mutex (0)

Then, when mt7530_port_disable(), mt7530_setup_vlan0(),
mt7530_port_enable(), mt7530_port_fdb_add(), or mt7530_port_vlan_add() runs
on the external switch, it acquires ext->reg_mutex (subclass 0) before
performing regmap accesses on ext->regmap, which in turn acquire
ondie->child_bus->mdio_lock (MDIO_MUTEX_NESTED) and ondie->reg_mutex
(subclass 0):

  priv->reg_mutex (0) -> mdio_lock (MDIO_MUTEX_NESTED) -> priv->reg_mutex (=
0)

Won't lockdep report both a same-class recursive lock on priv->reg_mutex
and a circular locking dependency between priv->reg_mutex and mdio_lock?

[ ... ]

> @@ -3700,6 +4005,28 @@ const struct mt753x_info mt753x_table[] =3D {
>  		.phy_write_c45 =3D mt7531_ind_c45_phy_write,
>  		.mac_port_get_caps =3D en7528_mac_port_get_caps,
>  	},
> +	[ID_EN751221] =3D {
> +		.id =3D ID_EN751221,
> +		.pcs_ops =3D &mt7530_pcs_ops,
> +		.sw_setup =3D mt7988_setup,
> +		.phy_read_c22 =3D mt7531_ind_c22_phy_read,
> +		.phy_write_c22 =3D mt7531_ind_c22_phy_write,
> +		.phy_read_c45 =3D mt7531_ind_c45_phy_read,
> +		.phy_write_c45 =3D mt7531_ind_c45_phy_write,
> +		.mac_port_get_caps =3D en751221_mac_port_get_caps,
> +		.mac_port_config =3D mt7530_mac_config,
> +	},

[Severity: High]
On MT7530 hardware, modifications to MT753X_MTRAP only take effect when
MT7530_CHG_TRAP is set. Commit 377174c5760c ("net: dsa: mt7530: move
MT753X_MTRAP operations for MT7530") removed MT7530_CHG_TRAP from
mt7530_setup_port5() and omitted it from mt7530_port_enable() and
mt7530_port_disable() because mt7530_setup() sets MT7530_CHG_TRAP during
switch initialization.

However, ID_EN751221 uses .sw_setup =3D mt7988_setup, which resets the
switch and calls mt7531_setup_common() without ever setting
MT7530_CHG_TRAP in MT753X_MTRAP.

When mt753x_cpu_port_enable(), mt7530_port_disable(),
mt7530_port_enable(), and mt7530_setup_port5() (via .mac_port_config =3D
mt7530_mac_config) later update MT753X_MTRAP on ID_EN751221 to configure
MT7530_LOOP_DET_DISABLE, MT7530_P5_DIS, MT7530_P6_DIS, or
MT7530_P5_MAC_SEL, won't those changes fail to take effect because
MT7530_CHG_TRAP was never set?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028011317.1557=
238-1-cjd@cjdns.fr?part=3D7
