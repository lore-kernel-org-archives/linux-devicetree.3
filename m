Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8199B49CF29
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049497; cv=none; b=upMyOSTivMAkGeQZhzO/zEi+EDozvGs1qhmmZhYbMGzC5X46WfgmynsYzFjE5sp2Q0BxfK0pRDfYjWHErLQDNqJ3ifYOHhKlV64cuy3eQ63J64aVjjHPQ53By7l3y921ZuVe3EtHGJQMyVPwsheIqthKW4yUOhZ2z7zt38ImSLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049497; c=relaxed/simple;
	bh=7P4Fwm9V27/vCJzqLRsCoQ113U3696cqrrG1J41lER4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=shtN9BVY9uJlyomkA+4RHsO2OmTpkCcD7Uv91oNyi77q92qW0twOAzTtgLGzql3m02Z2XJP3E7cFGJzV4pcjIUY/BpB90k0NdDG7t2/+WW1bSGW5CAaecF82BKkcsoIouwrxUcI4Yh5B26Wi55+gRoaeoij2cRbuc02pNDibzj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maPROU/S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maPROU/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AD01F000FF;
	Thu, 10 Sep 2026 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049495;
	bh=zrd355EEcEI3j8IYH6jV1gYwv0iJnFD+WHEWGPYXc2k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=maPROU/SQfHw3c1O5brXInq2TcPIeVVOpu9UI7P8vmn9Zp5Y+w79/FHlRcUC193HK
	 mHv0Na5fkOtJDFEqlhTBPfU2LCYxumRaUQJ93lZQWj4hbSHJPOuxHVN5lWBVtN8uQO
	 SeboEyb5Zn6iEEdjkvbQV9XjbxnBYMSAY79v68JYcQ9BiSWeyvwWnjuV1ZyL1Ekovr
	 rxy8hHBc2eKwLRFwi/4zi0yTUnqtyqDQNwHzSlH7M8oMoJ4r6yzJZ9N2s0mK7YU97U
	 iSVRShAWwCqICD5ZkGvR24zBQS8Z3DyBWfespRR7fTLlhkfD2P8NzpJ5Py6oJsMsE+
	 RdBsLnUHPxfuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 7/7] net: dsa: mediatek: support EN751221
 switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909140346.2861572-8-cjd@cjdns.fr>
References: <20260909140346.2861572-1-cjd@cjdns.fr>
 <20260909140346.2861572-8-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:11:34 +0000
Message-Id: <20260910141135.18AD01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing MDIO bus locking when `child_bus` is used in `core_write()=
` and `core_rmw()`.
- [High] TRGMII calibration races with the SoC switch's phylink state machi=
ne, leading to concurrent modification of the SoC switch's PMCR register.
- [Medium] Incorrect restoration array used for 'ondie' switch TRGMII calib=
ration.
- [Medium] Ignored parameters and out-of-bounds drive strength values in TR=
GMII TX drive setup.
- [Low] Unused parameters in `en751221_trgmii_cal_ok`.
--

commit f83ec08496a229bd3e0f1b5361ff644674d8d493
Author: Caleb James DeLisle <cjd@cjdns.fr>
Subject: net: dsa: mediatek: support EN751221 switch

Adds support for the on-die and MCM switches on the EcoNet EN751221, along
with TRGMII link calibration between them.

> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
[ ... ]
> @@ -466,6 +476,251 @@ mt7531_pll_setup(struct mt7530_priv *priv)
> +static bool
> +en751221_trgmii_cal_ok(struct mt7530_priv *rx, u32 reg, int chan, int i)
> +{

[Severity: Low]
Are the chan and i parameters needed here? They appear to be unused within
the function body.

> +	u32 val =3D 0;
> +
> +	regmap_read(rx->regmap, reg, &val);
[ ... ]
> +static void
> +en751221_set_tx_drive(struct mt7530_priv *priv, u8 drvp, u8 drvn, u8 clk=
_drvp,
> +		      u8 clk_drvn)
> +{
> +	int channel;
> +
> +	/* Tx driving for TRGMII path on SoC */
> +	for (channel =3D 0; channel < NUM_TRGMII_CTRL; channel++)
> +		regmap_write(priv->regmap, MT7530_TRGMII_TD_ODT(channel),
> +			     TD_DM_DRVP(drvp) | TD_DM_DRVN(drvn));
> +
> +	/* Undocumented 6th channel, probably drive strength for clock line. */
> +	regmap_write(priv->regmap, MT7530_TRGMII_TD_ODT(5), TD_DM_DRVP(drvp) |
> +		     TD_DM_DRVN(drvn));
> +}

[Severity: Medium]
Should this be using the clk_drvp and clk_drvn parameters instead of drvp
and drvn? It looks like the intended clock drive parameters are being ignor=
ed
completely here.

[ ... ]
> +static void
> +en751221_trgmii_pair_setup(struct mt7530_priv *ext, int ext_port,
> +			   struct mt7530_priv *ondie, int ondie_port)
> +{
[ ... ]
> +	/* BOTH: Put interfaces in a downed state */
> +	mcr_down =3D PMCR_IFG_XMIT(PMCR_IFG_XMIT_64) | PMCR_MAC_MODE |
> +		   MT7530_FORCE_MODE | PMCR_MAC_RX_EN | PMCR_BACKOFF_EN |
> +		   PMCR_BACKPR_EN | PMCR_FORCE_SPEED_1000 | PMCR_FORCE_FDX;
> +	regmap_write(ondie->regmap,  MT753X_PMCR_P(ondie_port), mcr_down);
> +	regmap_write(ext->regmap, MT753X_PMCR_P(ext_port), mcr_down);

[Severity: High]
Is it safe to modify the SoC switch's PMCR register directly from the MCM
switch's phylink execution context?=20

The SoC switch has its own phylink state machine. If it concurrently runs
mt753x_phylink_mac_link_up(), could it result in a data race that corrupts
the PMCR register and breaks calibration assumptions?

[ ... ]
> +	/* BOTH: Set TX drive strength, MCM uses more */
> +	en751221_set_tx_drive(ondie, 8, 8, 7, 7);
> +	en751221_set_tx_drive(ext, 11, 11, 16, 16);

[Severity: Medium]
Does the value 16 fit in this hardware field?=20

The caller is passing 16 for clk_drvp and clk_drvn, which appear to
overflow the 4-bit fields defined by TD_DM_DRVP_MASK and TD_DM_DRVN_MASK.

[ ... ]
> +	/* MCM: Spread spectrum clock*/
> +	core_clear(ext, CORE_PLL_GROUP8, RG_LCDDS_SSC_EN);

[Severity: High]
Could this call to core_clear() corrupt the MDIO bus during indirect MMD
accesses?=20

core_clear() relies on mt7530_mutex_lock(priv). If the MMIO-based switch is
using priv->child_bus instead of priv->bus, mt7530_mutex_lock() will see
priv->bus is NULL and silently return without locking:

static void mt7530_mutex_lock(struct mt7530_priv *priv)
{
        if (priv->bus)
                mutex_lock_nested(&priv->bus->mdio_lock, ...);
}

Would this leave the child_bus completely unlocked during the sequence
of bus->write calls required for indirect MMD access, leading to data
corruption on the MDIO bus?

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
> +	en751221_trgmii_calibrate_direction(ondie, ext, default_taps_ext);
> +	en751221_trgmii_calibrate_direction(ext, ondie, default_taps_ext);

[Severity: Medium]
Should this second call pass default_taps_ondie instead of default_taps_ext?

If the calibration for the ondie receiver fails, it looks like it will fall
back to the taps collected from the ext switch rather than its own, which
might lead to a broken or unstable link.

> +
> +	dev_info(ondie->dev, "TRGMII inter-switch link initialized\n");
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909140346.2861=
572-1-cjd@cjdns.fr?part=3D7
