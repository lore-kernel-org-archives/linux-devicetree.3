Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D564D9902
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 23:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528285; cv=none; b=Y21zaARTdZClPuE+buCQVQfgFZpzt0Ve9+qsdUek/+qZRAjRZdLdpqHBHFbtcnWBPxAocWl7nQL+mBWFoymWlBYQLQnQ8dyZ3NYga7l9YGP9J/Z7cX5FnXsvRtaYNMbFSIiueZhMcORAeTwuHbpb9m82/izqAuC2pDRdkZrTcxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528285; c=relaxed/simple;
	bh=sAKJXvvuUq4IY3h0GuMLxsv4VYtlMXOj9dJSZwrW7UQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uk8yjVX+e+Kyka2g8IrdwFBhlvWQFAjBoxWck13mdxQE34KEdoMdi/YPcNH/qVNIxgkFaAACeSpLCI7+AIabZll8bb9Hy2pABIU0c5m6ANQDCf3izhbMLyAFNCDvYK9u1dv1CFQ724iOjQgtXIPOskAqoktaA7QWV09MxeBhsMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gvlf1WS1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gvlf1WS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184B01F00899;
	Wed,  3 Jun 2026 23:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780528284;
	bh=Wg9ghEMn0IcED+KRxx7F1bv8Q2WES4LHZe5kzQutToI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gvlf1WS19ei8YjHaX+P59mPnfNHDqLS5K9y8u2dbA0TQ+6t8vuBBgttWx7XEH2tFE
	 BXMYLDxfjXdhAl/6k0ddrnIWCsUTSyC27Hnxvuz4q1T6IMv1DuPMv6sTcKLmLDfH/F
	 iDE+eHa8P0TnxWLMwe7Y7ZgCBrobEN/FkQaidLoACaZoDcFGmqe++UtlywNmAX6bVn
	 FfyfsERylbZRbbizyFtC1B4RatKUpnwhywHigDDZTiwNkuKOsaHolo8WdymqGOIzHM
	 iOBgu/oAluURfpKv02K9dBsjSGthzlOg2xJCnkowLugxEJF/BfkPbY5nNtY/6EwK90
	 cVNRsSQKuOAZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 4/5] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603-ks8995-to-ksz8-v4-4-e15149ef21e7@kernel.org>
References: <20260603-ks8995-to-ksz8-v4-4-e15149ef21e7@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 23:11:23 +0000
Message-Id: <20260603231124.184B01F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] DCB per-port initialization is executed for KSZ8995XA despite DCB =
support being explicitly disabled and skipped globally.
- [High] Inverted Auto-Negotiation Enable bit polarity for KSZ8995XA.
- [High] Corrupted port state due to incorrect `P_NEG_RESTART_CTRL` bits us=
ed for KSZ8995XA.
--

commit 5b68577f6d273fa3da9b35eff666a2b7e6fb9c43
Author: Linus Walleij <linusw@kernel.org>

net: dsa: microchip: Support Microchip KSZ8995XA / KS8995XA
   =20
This adds support for the Microchip KSZ8995XA also known as the
Micrel KS8995XA switch to the KSZ driver.
   =20
Notice: there are also KSZ8995E and KSZ8995MA. These are BOTH
different from the KSZ8995XA.
   =20
The helper macros are named ksz_is_ksz8995xa() to make it
possible to add E and MA support in the future.

> diff --git a/drivers/net/dsa/microchip/ksz8.c b/drivers/net/dsa/microchip=
/ksz8.c
> index 0f84b2e7d25d8..18541a8efc39c 100644
> --- a/drivers/net/dsa/microchip/ksz8.c
> +++ b/drivers/net/dsa/microchip/ksz8.c
[ ... ]
> @@ -924,8 +947,10 @@ static int ksz8_r_phy_bmcr(struct ksz_device *dev, u=
16 port, u16 *val)
>  	if (ctrl & PORT_FORCE_FULL_DUPLEX)
>  		*val |=3D BMCR_FULLDPLX;
> =20
> -	if (speed & PORT_HP_MDIX)
> -		*val |=3D KSZ886X_BMCR_HP_MDIX;
> +	if (!ksz_is_ksz8995xa(dev)) {
> +		if (speed & PORT_HP_MDIX)
> +			*val |=3D KSZ886X_BMCR_HP_MDIX;
> +	}
> =20
>  	if (restart & PORT_FORCE_MDIX)
>  		*val |=3D KSZ886X_BMCR_FORCE_MDI;

[Severity: High]
Does this code invert the Auto-Negotiation Enable bit polarity for KSZ8995X=
A?

The KSZ8995XA falls into the else branch of ksz_is_ksz88x3(dev) earlier in
ksz8_r_phy_bmcr(), which treats BIT(7) of the P_FORCE_CTRL register as
PORT_AUTO_NEG_DISABLE (where 1 =3D disable, 0 =3D enable).=20

However, it appears the KSZ8995XA hardware uses BIT(7) for Auto-Negotiation
Enable (1 =3D enable, 0 =3D disable), matching the KSZ88X3. If software wri=
tes 0
to this bit when intending to enable auto-negotiation, will it disable it in
hardware and break PHY link negotiation?

[ ... ]
> @@ -1147,13 +1175,15 @@ static int ksz8_w_phy_bmcr(struct ksz_device *dev=
, u16 port, u16 val)
>  	if (val & BMCR_RESET)
>  		return 0;
> =20
> -	speed =3D 0;
> -	if (val & KSZ886X_BMCR_HP_MDIX)
> -		speed |=3D PORT_HP_MDIX;
> +	if (!ksz_is_ksz8995xa(dev)) {
> +		speed =3D 0;
> +		if (val & KSZ886X_BMCR_HP_MDIX)
> +			speed |=3D PORT_HP_MDIX;
> =20
> -	ret =3D ksz_prmw8(dev, port, regs[P_SPEED_STATUS], PORT_HP_MDIX, speed);
> -	if (ret)
> -		return ret;
> +		ret =3D ksz_prmw8(dev, port, regs[P_SPEED_STATUS], PORT_HP_MDIX, speed=
);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	ctrl =3D 0;
>  	if (ksz_is_ksz88x3(dev)) {

[Severity: High]
Does this function write incorrect bits to P_NEG_RESTART_CTRL for the
KSZ8995XA?

Later in ksz8_w_phy_bmcr(), it constructs a bitmask using KSZ8895-specific
bits:

    restart_mask =3D PORT_LED_OFF | PORT_TX_DISABLE | PORT_AUTO_NEG_RESTART=
 |
        PORT_POWER_DOWN | PORT_AUTO_MDIX_DISABLE | PORT_FORCE_MDIX;

For KSZ8995XA, are these features mapped to different bits? Writing these
might apply the wrong settings.=20

Additionally, because KSZ8995XA is not KSZ88X3, it calls
ksz879x_set_loopback() which sets BIT(7) of REG_PORT_STATUS_3 (0x0F). Does
0x0F resolve to Port Control 15 (0x1F) on the KSZ8995XA and corrupt the 802=
.1p
priority mapping register instead of enabling loopback?

[ ... ]
> @@ -2416,6 +2502,34 @@ const struct ksz_dev_ops ksz88xx_dev_ops =3D {
>  	.pme_pwrite8 =3D ksz8_pme_pwrite8,
>  };
> =20
> +/*
> + * Restricted operations for KSZ8995XA, so many things are not supported
> + * by this old switch that we need diet DSA operations.
> + */
> +const struct dsa_switch_ops ksz8995xa_switch_ops =3D {
> +	.get_tag_protocol	=3D ksz8995xa_get_tag_protocol,
> +	.get_phy_flags		=3D ksz_get_phy_flags,
> +	.setup			=3D ksz8_setup,
> +	.teardown		=3D ksz_teardown,
> +	.phy_read		=3D ksz8_phy_read16,
> +	.phy_write		=3D ksz8_phy_write16,
> +	.phylink_get_caps	=3D ksz8_phylink_get_caps,
> +	.port_setup		=3D ksz8_dsa_port_setup,

[Severity: High]
Since global DCB initialization ksz_dcb_init() is explicitly skipped for the
KSZ8995XA in ksz8_setup(), will configuring DCB at the port level cause iss=
ues
here?

ksz8_dsa_port_setup() unconditionally calls ksz_dcb_init_port(dev, port),
which enables DiffServ and 802.1p priorities on the ports while the global
DSCP mapping remains uninitialized.=20

Could this cause unpredictable traffic classification, or corrupt unrelated
port configurations by writing to bits 3:6 of offset 0x00 (REG_PORT_CTRL_0)
on the KSZ8995XA?

> +	.port_bridge_join	=3D ksz_port_bridge_join,
> +	.port_bridge_leave	=3D ksz_port_bridge_leave,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-ks8995-to-=
ksz8-v4-0-e15149ef21e7@kernel.org?part=3D4
