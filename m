Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCDF2248BE
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102013; cv=none; b=VmvldOC/y0prQEpPLwAY9wZy/B9Tafb2mElPN1NZN29qLTqvFwk16dPcGtEb8sHFnlq72srRGr/cSMjKmllywYSpK7hZGt5ce5MMk9EyqvxUy67c/x6ennhgMP3m4gnu9c8itxvs8jHaDyzgixxlb4EFAQoOjjo+azrGsNsR6mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102013; c=relaxed/simple;
	bh=Z4igbdNi88vyl/Y3UdH2icHqM1izJYm2mNLpW4aaTRE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ai2Pu9PU0Tmadv0J3vlxTYN0zZo1252jCROCoNAor0KwDWSA78dKnMeU2ywbQqaifcE5hb/nOPI7V2BkrgvIQAAjnqb0QIDsazvBd3gZkO6NL58Fq/M2NGAP4a0Xz0VHGfWiF8L2F3eMzYjeZFF5KciCZ7NedK22ujaPYiVf4BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpTHq5vW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpTHq5vW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919381F00899;
	Sat, 30 May 2026 00:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102011;
	bh=u0zKdWBTugeD7+CQc53QpjAvGLEu8AbzD0HcUB/Jkf4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hpTHq5vWzlFjgbYrda5d582BofaDY3ZZ85RsT2U5uvkqfgqaPqbHvh2a+Ar6UwdWw
	 PR0NM6YaCXfhFe5eWRmZ+z7gCa5CRgUwH2R1Z9WTsUn1Y0k79a8z9IwlyNf1FOyoOo
	 GyInfZdykDhuC3YVgktUp/YVpecQBYNsy2/vUHVUl7M2/MqtgGQoFKT3fk+afDjYu7
	 /IdWb4d+7n2jceYpWKRY3GL3Jbx80tiajuTeL+o4lefYWSWCF8eHbbDiScCTefwXrq
	 rshOeXq/2jERE+8XTL4OdZX4C52aj4DvRhHgt+ZHZIi4wJg913p+BoVJG6vJs4Z6HB
	 Ds4phRTDfLr3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 4/5] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522-ks8995-to-ksz8-v2-4-5712c0dc9e75@kernel.org>
References: <20260522-ks8995-to-ksz8-v2-4-5712c0dc9e75@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:51 +0000
Message-Id: <20260530004651.919381F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The KSZ8995XA driver incorrectly uses the KSZ879x-specific PHY l=
oopback functions, resulting in reads and writes to a reserved port registe=
r.
- [Medium] Unconditional PHY reset writes to a reserved register for the CP=
U port.
- [Medium] Incorrect MTU register polarity disables hardware MTU enforcemen=
t on KSZ8995XA.

Pre-existing issues:
- [High] Race condition in driver teardown between `ksz_switch_remove` and =
`ksz_phylink_mac_link_down` leading to a Use-After-Free.
--

commit 3134f79144b9d51d69cd09df98e69bd4282145df
Author: Linus Walleij <linusw@kernel.org>

net: dsa: microchip: Support Microchip KSZ8995XA / KS8995XA

This commit adds support for the Microchip KSZ8995XA (also known as the
Micrel KS8995XA) switch to the KSZ driver.

> diff --git a/drivers/net/dsa/microchip/ksz8.c b/drivers/net/dsa/microchip=
/ksz8.c
> index 825133e9ce6e6..82e528c7e8d07 100644
> --- a/drivers/net/dsa/microchip/ksz8.c
> +++ b/drivers/net/dsa/microchip/ksz8.c
> @@ -137,7 +138,18 @@ static int ksz8_pme_pwrite8(struct ksz_device *dev, =
int port, int offset, u8 dat
> =20
>  static int ksz8_reset_switch(struct ksz_device *dev)
>  {
> -	if (ksz_is_ksz88x3(dev)) {
> +	if (ksz_is_ksz8995xa(dev)) {
> +		unsigned int port;
> +
> +		/* KSZ8995XA is "reset" by stopping the switch and starting it */
> +		ksz_cfg(dev, REG_SW_ID_1, SW_START_SWITCH, false);
> +		usleep_range(10, 100);
> +		ksz_cfg(dev, REG_SW_ID_1, SW_START_SWITCH, true);
> +
> +		/* Often boot loaders have fun with ports, so reset them */
> +		for (port =3D 0; port < dev->info->port_cnt; port++)
> +			ksz_port_cfg(dev, port, 0x0f, BIT(4), true);

[Severity: Medium]
Since port 4 (the CPU port) lacks an internal PHY, will this loop attempt to
write to the reserved register 0x5F (0x0f + 0x10 + 4 * 0x10) for that port?
Should this check dev->info->internal_phy[port] before performing the reset
to avoid undefined hardware behavior?

[ ... ]

> @@ -161,8 +173,14 @@ static int ksz8_reset_switch(struct ksz_device *dev)
>  static int ksz8863_change_mtu(struct ksz_device *dev, int frame_size)
>  {
>  	u8 ctrl2 =3D 0;
> +	unsigned int legalsz;
> +
> +	if (ksz_is_ksz8995xa(dev))
> +		legalsz =3D KSZ8995XA_LEGAL_PACKET_SIZE;
> +	else
> +		legalsz =3D KSZ8_LEGAL_PACKET_SIZE;
> =20
> -	if (frame_size <=3D KSZ8_LEGAL_PACKET_SIZE)
> +	if (frame_size <=3D legalsz)
>  		ctrl2 |=3D KSZ8863_LEGAL_PACKET_ENABLE;

[Severity: Medium]
Is the polarity of KSZ8863_LEGAL_PACKET_ENABLE (BIT 1 of Reg 4) inverted on
the KSZ8995XA? If it functions as Legal Maximum Packet Size Check Disable,
does setting this bit to 1 actually disable the hardware MTU enforcement
instead of enabling it?

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

[Severity: Medium]
In ksz8_r_phy_bmcr() and ksz8_w_phy_bmcr(), the driver uses
if (ksz_is_ksz88x3(dev)) to separate KSZ88x3 and KSZ879x logic. For the
KSZ8995XA, this evaluates to false and falls through to the KSZ879x block.

Does this cause the KSZ8995XA to incorrectly use the KSZ879x-specific PHY
loopback functions (ksz879x_get_loopback and ksz879x_set_loopback) which
access REG_PORT_STATUS_3 (relative offset 0x0F)? I noticed the KSZ8995XA
MAC loopback control is actually located in P_NEG_RESTART_CTRL (0x0D),
matching the KSZ88x3. Could this break loopback functionality and write to
reserved hardware registers?

> diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/mic=
rochip/ksz_common.c
> index 4a7bcd1a93927..7f514064116a1 100644
> --- a/drivers/net/dsa/microchip/ksz_common.c
> +++ b/drivers/net/dsa/microchip/ksz_common.c

[ ... ]

> @@ -4948,11 +4996,13 @@ int ksz_switch_register(struct ksz_device *dev)
>  		return ret;
>  	}
> =20
> -	/* Read MIB counters every 30 seconds to avoid overflow. */
> -	dev->mib_read_interval =3D msecs_to_jiffies(5000);
> +	if (!ksz_is_ksz8995xa(dev)) {
> +		/* Read MIB counters every 30 seconds to avoid overflow. */
> +		dev->mib_read_interval =3D msecs_to_jiffies(5000);
> =20
> -	/* Start the MIB timer. */
> -	schedule_delayed_work(&dev->mib_read, 0);
> +		/* Start the MIB timer. */
> +		schedule_delayed_work(&dev->mib_read, 0);
> +	}
> =20
>  	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but I noticed a potential race condition in
the teardown path involving dev->mib_read_interval.

In ksz_switch_remove(), the driver zeroes out dev->mib_read_interval and
calls cancel_delayed_work_sync(&dev->mib_read) before unregistering the
switch with dsa_unregister_switch().

If ksz_phylink_mac_link_down() runs concurrently, could it read a non-zero
dev->mib_read_interval, get preempted while ksz_switch_remove() finishes
canceling the work, and then resume to unconditionally call
schedule_delayed_work(&dev->mib_read, 0)? This would re-arm the work item
on a structure that is about to be freed, leading to a Use-After-Free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-ks8995-to-=
ksz8-v2-0-5712c0dc9e75@kernel.org?part=3D4
