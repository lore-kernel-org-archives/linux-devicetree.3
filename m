Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388143;
	b=Kt26X/eXXpwLQhUeM1pMaOZp7wW/y30IcZy01TulOR2UfG5S09qq5rfC7J80qXg3k9a/
	 u4svCCIAOhUffRSPbIlSkWJTg0pA4/V7411WQJT84D3vLrnYVF38URveKwXX1UMFKUapp
	 BVPFiBJnxYMMeSETrsfZkDLA/osBkgogcJmSq1c7s8GVa6rtggLEn20mwzgmKAjQpJJtQ
	 gJY3Nak/gzkLxUDvvWeHzI7fBmhnDFhI3pKPMmPIRNO2OnzzNeDDhUfuWGa1ROFbIeiWy
	 GdCHZK9lRI3ejdsWpwVRHPNOQ5um2AmnCANUMrbBnbT4FkyF5564J8hDHQS034O8VkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388143;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R1c+Llvald0jXHumd+DCgFHGTB2qeUb47ynYvU/CVtg=;
	b=PdkspVC0urBhf7Uqe37ZBcUciEcgAgP8NF7/+4bfkF5ZBUn0B2CvvKzJgPbjeDqotQcc
	 PJMezOv6cd/RynIBcaX5V3jq+s3UGmCdaDoFEl/eVaHJ2vgPtyz76mngKRzXXEd0IG6Pw
	 kTbi4EN1HYYoZ9MgpXkgPOroL8wVtinIgA+aApj6kd2vocJwGJDOIY26qvbjaYo5gDBAL
	 MQCbqjvraNYboE4dyWlU+KjKL6z7mMSkbmXu78r05J85Vh15x9WInwxGV3uPSsTJeqfLf
	 O76bs+DsoA5ecOVgAaAQqP4aaejp3mdDSFbXamLfkwa+twDC8iqkFj0bctckFdNdCEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FyV8Mn0g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48951606A322
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 19:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FyV8Mn0g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62F01F000C1;
	Fri, 30 Oct 2026 19:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793388142;
	bh=R1c+Llvald0jXHumd+DCgFHGTB2qeUb47ynYvU/CVtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FyV8Mn0gQBg4jvaFAOGyqmZeaWNUyIqzjMSJtb89lTSp6O1dgOPSvch9S5Tv7RaqQ
	 iMGDVeLHySCfy+o8wjQrQcBMCs9AW7zWprFMiiGvFWmASLh/gcsmratAE7+wRaO7+D
	 RMUQy4VBnb94Ouk7ce85bRwH9nSv2V0lhTp4o+IqiXQDUuyHItRJN5NtXxc2x76AlE
	 zfFTNWiytLgCDn9gKP/tn/4RqS3FG5Pykcu0Vdj+xo1tg5kKYPNc/F1bdW+uYb9s5x
	 lzhf5L/yKBj8n5gSZWeubM5H1FFyUfmwFCwB9YbFEct7nmxa0i4Z/P7kW818peFWbt
	 mJd1hZp9Ezo8w==
Message-ID: <sashiko-outbox-191442@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] net: dsa: mediatek: support EN751221 switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029184202.1859843-8-cjd@cjdns.fr>
References: <20261029184202.1859843-1-cjd@cjdns.fr>
 <20261029184202.1859843-8-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 19:22:22 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] net: dsa: mt7530: missing MT7530_CHG_TRAP setup for ID_EN751221
- [High] net: dsa: mt7530: recursive reg_mutex lockdep class in MMIO-MDIO h=
ierarchy
- [Medium] net: dsa: mt7530: swapped default_taps in en751221_trgmii_pair_s=
etup()
- [Medium] net: dsa: mt7530: missing child_bus mdio_lock in core_write() an=
d core_rmw()
- [Medium] net: dsa: mt7530: race with peer phylink in mt7530_cal_interswit=
ch_trgmii()
--

commit fcbb4fdaccb60b7ebd8ef125ae65f04744031511
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: support EN751221 switch

This patch adds support for the EcoNet EN751221 on-die MT7530 switch and the
optional external MCM MT7530 switch, along with startup calibration for the
TRGMII link connecting them.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 24e4485624d39..447c80455460e 100644
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
When mt7530_mac_config() calls mt7530_setup_port6() on ID_EN751221, it invo=
kes
core_clear(), core_write(), and core_set() on control PHY address 12.

On the MMIO-based ID_EN751221 switch, priv->bus is NULL and core_write() and
core_rmw() fall back to priv->child_bus:

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

Because mt7530_mutex_lock() and mt7530_mutex_unlock() only check priv->bus,
priv->child_bus->mdio_lock is not acquired when priv->bus is NULL. While
mt7531_ind_c22_phy_read() and mt7531_ind_c22_phy_write() acquire
priv->reg_mutex for each individual Clause 22 transfer, can the multi-step
MII_MMD_CTRL / MII_MMD_DATA sequence and read-modify-write in core_write() =
and
core_rmw() interleave with concurrent MDIO transactions on priv->child_bus
(such as phylib polling or regmap accesses to the downstream ID_EN751221_EXT
switch)?

[ ... ]

> @@ -471,6 +481,251 @@ mt7531_pll_setup(struct mt7530_priv *priv)
>  	usleep_range(25, 35);
>  }
> =20
> +static bool
> +en751221_trgmii_cal_ok(struct mt7530_priv *rx, u32 reg)
> +{
> +	u32 val =3D 0;
> +
> +	regmap_read(rx->regmap, reg, &val);
> +	regmap_write(rx->regmap, reg, val | EDGE_CHK);
> +	regmap_write(rx->regmap, reg, val & ~EDGE_CHK);
> +	regmap_read(rx->regmap, reg, &val);
> +
> +	return FIELD_GET(RD_VALUE_MASK, val) =3D=3D TGMII_TD_PAT &&
> +	       !FIELD_GET(RD_ERR_MASK, val);
> +}
> +
> +static void
> +en751221_trgmii_calibrate_direction(struct mt7530_priv *tx,
> +				    struct mt7530_priv *rx,
> +				    u8 *default_taps)
> +{

[ ... ]

> +		if (best_tap > -1) {
> +			regmap_update_bits(rx->regmap, rx_reg, RD_TAP_MASK,
> +					   RD_TAP(best_tap));
> +
> +			log[best_tap] =3D 'X';
> +
> +			dev_info(rx->dev,
> +				 "TRGMII lane %d: %s tap %d old %d\n",
> +				 channel, log, best_tap, default_taps[channel]);
> +		} else {
> +			regmap_update_bits(rx->regmap, rx_reg, RD_TAP_MASK,
> +					   RD_TAP(default_taps[channel]));
> +
> +			dev_warn(rx->dev,
> +				 "TRGMII lane %d: %s calibration failed, preserving tap %u\n",
> +				 channel, log, default_taps[channel]);
> +		}

[ ... ]

> +static void
> +en751221_trgmii_pair_setup(struct mt7530_priv *ext, int ext_port,
> +			   struct mt7530_priv *ondie, int ondie_port)
> +{

[ ... ]

> +	/* BOTH: Collect and then zero every RX TAP */
> +	for (channel =3D 0; channel < NUM_TRGMII_CTRL; channel++) {
> +		reg_val =3D 0;
> +		regmap_read(ext->regmap, MT7530_TRGMII_RD(channel), &reg_val);
> +		default_taps_ext[channel] =3D FIELD_GET(RD_TAP_MASK, reg_val);
> +		regmap_clear_bits(ext->regmap, MT7530_TRGMII_RD(channel),
> +				  RD_TAP_MASK);
> +
> +		reg_val =3D 0;
> +		regmap_read(ondie->regmap, MT7530_TRGMII_RD(channel), &reg_val);
> +		default_taps_ondie[channel] =3D FIELD_GET(RD_TAP_MASK, reg_val);
> +		regmap_clear_bits(ondie->regmap, MT7530_TRGMII_RD(channel),
> +				  RD_TAP_MASK);
> +	}
> +
> +	en751221_trgmii_calibrate_direction(ondie, ext, default_taps_ondie);
> +	en751221_trgmii_calibrate_direction(ext, ondie, default_taps_ext);

[Severity: Medium]
Are default_taps_ondie and default_taps_ext swapped in these two calls to
en751221_trgmii_calibrate_direction()?

In en751221_trgmii_calibrate_direction(tx, rx, default_taps), default_taps =
is
used to log the previous RX tap value on rx->dev and to restore rx->regmap's
MT7530_TRGMII_RD(channel) register if calibration fails. Passing
default_taps_ondie when rx is ext (and default_taps_ext when rx is ondie) u=
ses
the peer switch's saved RX taps instead of rx's own saved taps.

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
Can mt7530_cal_interswitch_trgmii() race with the peer port's phylink_resol=
ve()
work item?

When dsa_tree_setup_ports() enables the DSA ports on both switches, each po=
rt
schedules its own phylink_resolve() work item holding only its own
dp->pl->state_mutex. In mt753x_phylink_mac_link_up(), priv->regmap's
MT753X_PMCR_P(dp->index) has just been written with PMCR_FORCE_LNK right
before calling mt7530_cal_interswitch_trgmii(dp), so checking PMSR_LINK on
priv->regmap checks the local port rather than peer->regmap's
MT7530_PMSR_P(peer_dp->index).

While en751221_trgmii_pair_setup() forces MT753X_PMCR_P(ondie_port) down and
sleeps in usleep_range(5000, 6000) twice during TX/RX reset, could peer_dp's
phylink_resolve() run concurrently on another worker and call
mt753x_phylink_mac_link_up() on ondie_port mid-reset? Also, when
en751221_trgmii_pair_setup() writes mcr_up to MT753X_PMCR_P on both ports,
does it overwrite PMCR_FORCE_TX_FC_EN and PMCR_FORCE_RX_FC_EN configured by
mt753x_phylink_mac_link_up()?

> @@ -1459,7 +1714,8 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
> =20
>  	mutex_unlock(&priv->reg_mutex);
> =20
> -	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621)
> +	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621 &&
> +	    priv->id !=3D ID_EN751221 && priv->id !=3D ID_EN751221_EXT)
>  		return 0;
> =20
>  	if (port =3D=3D 5)
> @@ -1486,7 +1742,8 @@ mt7530_port_disable(struct dsa_switch *ds, int port)
> =20
>  	mutex_unlock(&priv->reg_mutex);
> =20
> -	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621)
> +	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621 &&
> +	    priv->id !=3D ID_EN751221 && priv->id !=3D ID_EN751221_EXT)
>  		return;

[Severity: High]
Do the updates to MT753X_MTRAP for ID_EN751221 in mt7530_port_enable(),
mt7530_port_disable(), mt7530_setup_port5(), and mt7531_setup_common() take
effect without MT7530_CHG_TRAP being set?

In mt753x_table, ID_EN751221 uses mt7988_setup() -> mt7531_setup_common().
Unlike mt7530_setup(), which sets MT7530_CHG_TRAP in MT753X_MTRAP after
resetting the switch so that trap bits can be modified by software,
mt7988_setup() asserts and deasserts priv->rstc and then calls
mt7531_setup_common() without setting MT7530_CHG_TRAP in MT753X_MTRAP.

[ ... ]

> @@ -3817,6 +4122,28 @@ const struct mt753x_info mt753x_table[] =3D {
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
> +	[ID_EN751221_EXT] =3D {
> +		.id =3D ID_EN751221_EXT,
> +		.pcs_ops =3D &mt7530_pcs_ops,
> +		.sw_setup =3D mt7530_setup,
> +		.phy_read_c22 =3D mt7530_phy_read_c22,
> +		.phy_write_c22 =3D mt7530_phy_write_c22,
> +		.phy_read_c45 =3D mt7530_phy_read_c45,
> +		.phy_write_c45 =3D mt7530_phy_write_c45,
> +		.mac_port_get_caps =3D mt7530_mac_port_get_caps,
> +		.mac_port_config =3D mt7530_mac_config,
> +	},

[Severity: High]
When ID_EN751221_EXT is registered as an MDIO device on ID_EN751221's inter=
nal
MDIO bus (ondie->child_bus), both switches initialize priv->reg_mutex in
mt7530_probe_common() with the same lockdep class key.

When an operation on the downstream ID_EN751221_EXT switch holds
ext->reg_mutex and accesses ext->regmap, the regmap MDIO callbacks invoke t=
he
parent switch's child_bus operations, which acquire ondie->reg_mutex:

mt7530_setup() (on ext)
  mt7530_port_disable()
    mutex_lock(&ext->reg_mutex)
    regmap_update_bits(ext->regmap, ...)
      mt7530_regmap_write()
        bus->write() (on ondie->child_bus)
          mt753x_phy_write_c22()
            mt7531_ind_c22_phy_write()
              mutex_lock(&ondie->reg_mutex)

Will this nested acquisition of ondie->reg_mutex while ext->reg_mutex is he=
ld
trigger a lockdep recursive locking warning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029184202.1859=
843-1-cjd@cjdns.fr?part=3D7
