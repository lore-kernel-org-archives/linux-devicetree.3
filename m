Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C4C39023D
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 17:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580886; cv=none; b=rgDbUEN1zQ8qQxFAySMEh4n/VKaKgJc4xHoGGdZMDIxYahJloCRUi38mTrmow3vUFMcXt5Lf79mlPu8vNQrPlETOIfxSOku+12WKnAOZCLYXV2XpU3ONUq0kKaNHAKFtZWXfSsHMndJVELLV3dXQRG1GR5vwItSKBZ1k3UdpodQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580886; c=relaxed/simple;
	bh=GsNMbzdxchKt718uSbxYU2CKO8/9F/5P9f70uux1Qc8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YkpZE3fkTBqL1puiGGg1XTUfA0Db7Dww6C27T3la8mQSkMVxRCWhnATOEOkJzZKJ4awYFhBLLNCT+h9ecXY26exrWQaZHHYqG0EAcq/tYWCpk3DkiB3CyA/4mBSuvqS/4dfMAPQfHmAPGeEHl7eNfjn5WjvLsNdmQOknbYfES7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rn1LgACm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rn1LgACm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9081F00899;
	Wed, 16 Sep 2026 17:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789580869;
	bh=SfPo86n5h8xNgXa22f49ZHS0D43MG7TrsTJs3Ms/ORg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rn1LgACmQMRMJe2+k7Xpaq985OQ3Kme7l+lDsUETI8qUqqg1JPK58YKhVo41gToet
	 CFNfkTUm0hg+RLYR8zZ2D3mTD8eBaUxKteK9pzKO9KlBL5kX3Aorp+3WpmejTsGNmH
	 m/ZzCcVu/h4j/UGvW+nEADijGOWDEqPmD4jMLFCqHGfTRQdXu0P0K74YLhp21PHNh0
	 v7p2zl5LCpfklHw4HLCqQ3XA4Y6P2xXWx5K0hrCPrdzE8AGhuUUBCgP9WiJK8fXI8/
	 oF87wgqPOB9NEbGxgVGicU04KaT1pU2f1iMdT8wJOEJdJxfdmcTaAi6wPKChzwJUOw
	 c3UWmVmEJPl4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 7/7] net: dsa: mediatek: support EN751221
 switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260915174643.253660-8-cjd@cjdns.fr>
References: <20260915174643.253660-1-cjd@cjdns.fr>
 <20260915174643.253660-8-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 17:47:48 +0000
Message-Id: <20260916174749.2F9081F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] net: dsa: mt7530: race condition in TRGMII inter-switch calibration
- [High] net: dsa: mt7530: TRGMII execution lacks switch initialization ord=
ering
- [High] net: dsa: mt7530: Port 6 forced to TRGMII instead of Port 5 on SoC=
 switch
- [High] net: dsa: mt7530: fallback TAP arrays swapped during TRGMII calibr=
ation
- [Medium] net: dsa: mt7530: TRGMII calibration clobbers dynamic PMCR setti=
ngs
- [Medium] net: dsa: mt7530: immediate PMSR read may cause spurious calibra=
tion failure
--

commit 62f84243d1eeb88473bd327053e455c0cb300d5e
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: support EN751221 switch

The EcoNet EN751221 has either one, or two, onboard MT7530 switches.
Every implementation of this SoC has one switch on die with the CPU,
but some chips - notably those with a "G" in the name, have a second
MT7530 as an MCM module.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index fe93be1ece7d7..4f43454083b95 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
[ ... ]
> @@ -466,6 +476,251 @@ mt7531_pll_setup(struct mt7530_priv *priv)
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
> +	usleep_range(5000, 6000);

[Severity: High]
Does this sleep window introduce a race condition with the asynchronous phy=
link
worker?

The EXT switch asserts control over the ONDIE switch's MAC state during
calibration, but the 5000us sleep window allows the ONDIE switch's asynchro=
nous
phylink worker to overwrite the PMCR register (via mt753x_phylink_mac_link_=
up())
and prematurely enable the MAC.

This could lead to MAC state corruption and calibration failure since the S=
oC
switch's mac_link_up() can run during this delay, activating TX/RX while the
TRGMII link is supposed to be in a downed calibration state.

> +
> +	/* BOTH: Reset TX */
> +	regmap_set_bits(ext->regmap, MT7530_TRGMII_TXCTRL, TX_RST);
> +	regmap_set_bits(ondie->regmap, MT7530_TRGMII_TXCTRL, TX_RST);

[Severity: High]
Does this execution lack switch initialization ordering?

Writes to the SoC switch's TRGMII hardware blocks happen here. If the SoC
switch hasn't yet initialized its TRGMII clocks via mac_config, these writes
could be dropped or hang the memory bus.

The EXT switch initiates calibration on the SoC switch (peer) via
mt753x_phylink_mac_link_up() when its own link comes up, which can happen b=
efore
the SoC switch has run mac_config() to enable its TRGMII clocks.

> +	usleep_range(5000, 6000);
> +	regmap_clear_bits(ext->regmap, MT7530_TRGMII_TXCTRL, TX_RST);
> +	regmap_clear_bits(ondie->regmap, MT7530_TRGMII_TXCTRL, TX_RST);
[ ... ]
> +	/* BOTH: Ports up */
> +	mcr_up =3D mcr_down | PMCR_MAC_TX_EN | PMCR_FORCE_LNK;
> +	regmap_write(ondie->regmap, MT753X_PMCR_P(ondie_port), mcr_up);
> +	regmap_write(ext->regmap, MT753X_PMCR_P(ext_port), mcr_up);

[Severity: Medium]
Will this overwrite and clobber dynamically negotiated PMCR settings?

This uses regmap_write() instead of regmap_update_bits(), completely replac=
ing
the PMCR register state and erasing the settings applied earlier by
mt753x_phylink_mac_link_up().

Dynamically negotiated MAC flow control (like PMCR_FORCE_TX_FC_EN) and dupl=
ex
settings might be silently destroyed when replaced with these hardcoded val=
ues.

[ ... ]
> +	en751221_trgmii_calibrate_direction(ondie, ext, default_taps_ondie);
> +	en751221_trgmii_calibrate_direction(ext, ondie, default_taps_ext);

[Severity: High]
Are the fallback TAP arrays swapped here during TRGMII calibration?

The third argument to en751221_trgmii_calibrate_direction() is used as the
fallback TAP array for the rx switch (second argument). Passing
default_taps_ondie when ext is the rx switch incorrectly restores the ondie
TAPs to the ext switch, and vice versa.

If calibration fails on a lane, the wrong switch's default TAPs are restore=
d,
potentially leaving the interface permanently broken.

> +
> +	dev_info(ondie->dev, "TRGMII inter-switch link initialized\n");
> +}
> +
> +static void
> +mt7530_cal_interswitch_trgmii(struct dsa_port *dp)
> +{
[ ... ]
> +	regmap_read(priv->regmap, MT7530_PMSR_P(dp->index), &pmsr);
> +
> +	if (!(pmsr & PMSR_LINK))
> +		return;

[Severity: Medium]
Can this immediate PMSR read cause a spurious calibration failure?

mt753x_phylink_mac_link_up() sets PMCR_FORCE_LNK in the MAC control registe=
r,
and then immediately calls mt7530_cal_interswitch_trgmii(), which reads the
PMSR (status) register here.

If the hardware MAC requires any propagation time for the forced link to re=
flect
in PMSR, this check will incorrectly evaluate to false and silently abort
calibration.

[ ... ]
> +		en751221_trgmii_pair_setup(priv, dp->index, peer,
> +					   peer_dp->index);

[Severity: High]
Is it safe to trigger the setup sequence on the peer (SoC) switch without
verifying if the peer's hardware blocks have been clocked and taken out of =
reset?

As mentioned earlier, initiating calibration on the peer before the peer has
fully initialized its TRGMII clocks can cause bus hangs or calibration fail=
ures.

[ ... ]
> @@ -2980,6 +3243,44 @@ static void en7528_mac_port_get_caps(struct dsa_sw=
itch *ds, int port,
>  	}
>  }
> =20
> +static void en751221_mac_port_get_caps(struct dsa_switch *ds, int port,
> +				       struct phylink_config *config)
> +{
> +	switch (port) {
[ ... ]
> +	/* Port 5 is the 1 Gbit/s TRGMII cascade to the external MT7530. */
> +	case 5:
> +		__set_bit(PHY_INTERFACE_MODE_TRGMII,
> +			  config->supported_interfaces);
> +
> +		config->mac_capabilities |=3D MAC_1000FD;
> +		break;
> +
> +	/* Port 6 is the 1 Gbit/s CPU link to GDM1. */
> +	case 6:
> +		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
> +			  config->supported_interfaces);
> +
> +		config->mac_capabilities |=3D MAC_1000FD;
> +		break;
> +	}
> +}

[Severity: High]
Is Port 6 erroneously forced to TRGMII instead of Port 5 on the SoC switch?

en751221_mac_port_get_caps() defines Port 5 as TRGMII and Port 6 as INTERNA=
L.
However, mt7530_setup_port5() lacks any logic to configure TRGMII clocks,
falling back to GMAC5 mode.

Conversely, mt7530_setup_port6() applies TRGMII setup for any interface tha=
t is
not RGMII:

mt7530_setup_port6()
    if (interface =3D=3D PHY_INTERFACE_MODE_RGMII) {
        ...
        return;
    }
    regmap_update_bits(priv->regmap, MT7530_P6ECR, P6_INTF_MODE_MASK,
                       P6_INTF_MODE(1));

This means PHY_INTERFACE_MODE_INTERNAL on Port 6 is erroneously configured =
as
TRGMII. This breaks the internal CPU link (Port 6) and leaves the TRGMII
cascade link (Port 5) unconfigured.

[ ... ]
> @@ -3129,6 +3430,9 @@ static void mt753x_phylink_mac_link_up(struct phyli=
nk_config *config,
>  	}
> =20
>  	regmap_set_bits(priv->regmap, MT753X_PMCR_P(dp->index), mcr);
> +
> +	if (interface =3D=3D PHY_INTERFACE_MODE_TRGMII)
> +		mt7530_cal_interswitch_trgmii(dp);
>  }

[Severity: High]
Can the SoC switch's workqueue execution of this regmap_set_bits() silently
break the EXT switch's calibration sequence?

Since both switches have independent phylink workers and there is no locking
across switches, the SoC switch will blindly execute this regmap_set_bits()=
 in
its own workqueue. This forces PMCR_MAC_TX_EN to 1 while the EXT switch exp=
ects
the TRGMII link to be in a downed calibration state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915174643.2536=
60-1-cjd@cjdns.fr?part=3D7
