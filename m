Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1173E3EEACF
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 19:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415847; cv=none; b=T1l19KefFln8LN7YQTx2vmKeTbGDcby1g6CcPkwEIINmTGNh5galomQ7IRCaNBEal1JhMCn+H+GrLLdkC939o0dCOof49XpijOzDHsN32Ut9OicHSiE8fuko3v5HW6amd37/vmAFOm7FeFYDCTEXLAfxRGRKoY4fW6CaZU9fSus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415847; c=relaxed/simple;
	bh=YuKevFO+YHl3qSCBbgV1wZsc5cF4dODe7yDVvg939c8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p80AwOLwyroEUkMDkSRZb1tDmAkcE6j8zSjzRj3Gyk0znFvWZIc1SjyrXm5LRcFGYIn6NW5uT5JFm0agNW2GmZA8huZ5oHccXrK0H/xcf1xP1kuCW+u0GX8NGbx7ojVpnb25PJkVUORLLneai1Wm73N5MCN/ua0q5ngqamdBqv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCVcqpnd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCVcqpnd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924981F00893;
	Mon, 14 Sep 2026 19:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789415845;
	bh=7NGsCDX7UAxowmcMcSm0O36oiZraomOeE4mdh9cv6As=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lCVcqpndNIZ1nJ6p5EXclQkVwKvpNuM4Po9B+Zx+HZf+jMrKM22t5anCUGeABcvDB
	 KHtiX09mZRABT01+BLc3KA9NpuImah4pHfrPGZ788qJNwZaSJKtqR3u2jR0iNIKGBn
	 /00QE8T+C46msRjUJmtL+s5U3WRKJAVSsvpU8kW5OwsKrP7n0XpBzU2hes3x+XU22a
	 9hK+NzLVDL4gakVpwbDq5SGLGkD/ChIwxXPbgbENtECse3G/VcpMMMkHYZlbcY3tG5
	 o1FJQZxl2GGeWWm2fBYMyw7Qacgp0fQBs2qqrpjKp5jOIVhgxrwWJvyvJ51j9SOlz7
	 1wGY/XoJcsOGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 3/4] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260913-ks8995-to-ksz8-v13-3-327b16d309eb@kernel.org>
References: <20260913-ks8995-to-ksz8-v13-0-327b16d309eb@kernel.org>
 <20260913-ks8995-to-ksz8-v13-3-327b16d309eb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 19:57:25 +0000
Message-Id: <20260914195725.924981F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The PHY soft reset loop incorrectly iterates over all ports includ=
ing the CPU port, writing to and polling a reserved register which can lead=
 to a 600ms timeout and probe failure.
--

commit f211090124449a019250a45d2be289b7aa2d1e62
Author: Linus Walleij <linusw@kernel.org>

net: dsa: microchip: Support Microchip KSZ8995XA / KS8995XA

This commit adds support for the Microchip KSZ8995XA switch to the KSZ driv=
er, along with handling its specific PHY reset requirements, DSCP mapping, =
and legal packet size semantics. It also transitions the legacy KS8995 driv=
er exclusives.

> diff --git a/drivers/net/dsa/microchip/ksz8.c b/drivers/net/dsa/microchip=
/ksz8.c
> index 941ae9f66f70b..d7498132064e8 100644
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

[Severity: High]
Does this code inadvertently write to a reserved register for the CPU port?

The PHY soft reset loop iterates over all ports up to dev->info->port_cnt,
which includes the CPU port (port 4). However, the CPU port lacks an intern=
al
PHY (.internal_phy =3D false). Initiating a PHY reset here means writing to
REG_PORT_STATUS_3, which maps to a reserved register (offset 0x5D) for the
CPU port.

> +			if (ret)
> +				return ret;
> +		}
> +
> +		/* IEEE 802.3 allows up to 500 ms for a PHY reset. */
> +		for (port =3D 0; port < dev->info->port_cnt; port++) {
> +			reg =3D dev->dev_ops->get_port_addr(port, REG_PORT_STATUS_3);
> +			ret =3D regmap_read_poll_timeout(ksz_regmap_8(dev), reg, val,
> +						       !(val & PORT_PHY_SOFT_RESET),
> +						       1000, 600000);

[Severity: High]
Can this polling loop cause a 600ms probe timeout?

Since this loop also polls the reserved register on the CPU port, if the
written bit does not self-clear as it would on actual PHYs, this could block
for the entire 600ms duration and cause the initialization to fail.

Should these loops iterate up to dev->phy_port_cnt or explicitly check
.internal_phy[port] before interacting with the PHY reset register?

> +			if (ret)
> +				return ret;
> +		}
> +
> +		/* Some PHYs need additional settling time after reset. */
> +		usleep_range(1000, 2000);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913-ks8995-to-=
ksz8-v13-0-327b16d309eb@kernel.org?part=3D3
