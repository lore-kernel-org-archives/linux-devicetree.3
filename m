Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F7F4D2ED6
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 20:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504535; cv=none; b=IqMrIqdkPk+M2B2yrBpDko73wt6SjH8nrKm+mf5QQd+EWZTqVXG7DFtk8yyiOv5Nq8pyF+htpGYiPkvuX+FHocxDvzuvCAkxi4yrcrGiOeePLUMXBbYZad/T78+L4Lntg1+xsyoxKnJdLaFTHmve+zulwvN9vZbz0F5g2jVfhw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504535; c=relaxed/simple;
	bh=8FeujGZAy5NG9rvXpRQeOBroMgguG53H7o9qKQGgOE0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ut8yMl9n0JmgZujuv/UmD8+wvluEXVDceXBicj7f5NMEPpol00gpSZsGygwv/R45fM4z+3pfWM3kpesqJKqp7IM0/SBHbVn1DuoWnyE6qTxJS8rfMKvZv1bEOpqNikZLbtVQXE9Z7JabURj5awkEwJB6DXfJmcH53JIBs3v9rIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OB+C0R3G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OB+C0R3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3B31F00898;
	Tue, 15 Sep 2026 20:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789504533;
	bh=4WnBcfCBDi+0y5j3erP/lnFk3lbetujwK60SJejj1mU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OB+C0R3GFVAk64sYeHYVSJ+9FzurKzdpgcLh+xFXWaTZIlvtZno4SkmKhB6L230nb
	 SvXqCFjYq+1RmZCpnazeWBMx1/++CYmd0h0yOhVLD4p442fQKCusR9hikSfKDbA+VO
	 ciKQgTmi3nvIIXp3C62EkY3lQ8/wth4grQjHRO1uKvJMN/nfQSiRLKp//qVeDzGPGH
	 29jLgn669NLGMLFz66EtFezoIr33ykQmAGHqJoWIYqdMbTZ6f9ALFoe8EaFUsmepgh
	 JNRBjUOkuvul01wlVDQ64IFowQTEjjW3pzM53uziDMfLp3DQBezp55caEZNpt+oQVn
	 SYnmPS840OYOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v14 3/4] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914-ks8995-to-ksz8-v14-3-3d72692b3c97@kernel.org>
References: <20260914-ks8995-to-ksz8-v14-0-3d72692b3c97@kernel.org>
 <20260914-ks8995-to-ksz8-v14-3-3d72692b3c97@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 20:35:33 +0000
Message-Id: <20260915203533.7E3B31F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] PHY soft reset loop unconditionally includes the MAC-only CPU port=
, risking a 600ms polling timeout and probe failure.
- [High] Auto-negotiation enable/disable polarity is inverted for the KSZ89=
95XA switch.
--

commit 9246ba5d8ed3da59b20518974c9b8a20afa8511f
Author: Linus Walleij <linusw@kernel.org>
Subject: net: dsa: microchip: Support Microchip KSZ8995XA / KS8995XA

This commit adds support for the Microchip KSZ8995XA switch to the KSZ
driver. It updates hardware detection and initialization paths, handling
specific quirks of this older switch model.

> diff --git a/drivers/net/dsa/microchip/ksz8.c b/drivers/net/dsa/microchip=
/ksz8.c
> --- a/drivers/net/dsa/microchip/ksz8.c
> +++ b/drivers/net/dsa/microchip/ksz8.c

[ ... ]

> @@ -253,7 +255,35 @@ static int ksz8463_reset_switch(struct ksz_device *d=
ev)
> =20
>  static int ksz8_reset_switch(struct ksz_device *dev)
>  {
> -	if (ksz_is_ksz88x3(dev)) {
> +	if (ksz_is_ksz8995xa(dev)) {
> +		unsigned int port, reg, val;
> +		int ret;
> +
> +		/* The KSZ8995XA switch itself cannot be reset by software, but
> +		 * often boot loaders have fun with ports, so reset them. This
> +		 * reset bit is self-clearing.
> +		 */
> +		for (port =3D 0; port < dev->info->port_cnt; port++) {
> +			ret =3D ksz_prmw8(dev, port, REG_PORT_STATUS_3,
> +					PORT_PHY_SOFT_RESET,
> +					PORT_PHY_SOFT_RESET);
> +			if (ret)
> +				return ret;
> +		}

[Severity: High]
Does this loop unconditionally include the CPU port? In ksz8995xa, the CPU
port (port 4) does not have an internal PHY, so it lacks this PHY reset
register. Writing to it might have unintended consequences.

> +
> +		/* IEEE 802.3 allows up to 500 ms for a PHY reset. */
> +		for (port =3D 0; port < dev->info->port_cnt; port++) {
> +			reg =3D dev->dev_ops->get_port_addr(port, REG_PORT_STATUS_3);
> +			ret =3D regmap_read_poll_timeout(ksz_regmap_8(dev), reg, val,
> +						       !(val & PORT_PHY_SOFT_RESET),
> +						       1000, 600000);
> +			if (ret)
> +				return ret;
> +		}

[Severity: High]
Similarly, polling for the self-clearing bit on the MAC-only CPU port might
cause an unconditional timeout here. Since the reserved register on the CPU
port may not behave like a self-clearing PHY register, could this cause the
switch initialization to hang for 600ms and fail to probe completely?

[ ... ]

> @@ -1307,13 +1377,15 @@ static int ksz8_w_phy_bmcr(struct ksz_device *dev=
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
Are the auto-negotiation enable and disable polarities inverted for the
KSZ8995XA switch?

In ksz8_w_phy_bmcr, right after this check, the code branches based on
ksz_is_ksz88x3. The KSZ8995XA falls into the else block which sets the
PORT_AUTO_NEG_DISABLE bit when auto-negotiation is requested to be disabled.

However, for the older KSZ8995 family, bit 7 is typically an enable bit (li=
ke
the KSZ88x3), meaning 1 =3D enable, whereas for KSZ8795 it means 1 =3D disa=
ble.
If KSZ8995XA treats it as an enable bit, this logic will disable AN when
requested to enable, and enable it when requested to disable, potentially
leading to broken network links.

This same inversion would also affect ksz8_r_phy_bmcr which reads this bit =
to
report the link state. Should KSZ8995XA be grouped with the KSZ88X3 logic
here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-ks8995-to-=
ksz8-v14-0-3d72692b3c97@kernel.org?part=3D3
