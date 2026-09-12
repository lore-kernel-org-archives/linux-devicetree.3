Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E417738736C
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 09:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789204229; cv=none; b=RdbT4jYcyBMeOGHP0DnUoV+Of/cw931mE9QbJMAYeyBc+rgsA0qjVPdeAqwB8vHnxfcA63Al6n/40Q4YVlq0rxMbers7jM6qey1gwZMrg2rgzEDfQ4f/cMjqqZRDJ9VzXPUhSd1b9o8bCnx934QAkFqrELqx/75zhhOTVJ//Wj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789204229; c=relaxed/simple;
	bh=m/HikDUC1TZk0ypoq6DD5yhqAI06x5zFxbJSOynyJaM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NNXSt8+3HCju6k2CLtTiYdF/D+aoE00132Yb+bjMQefWg6ve7Gdrn+vw+BxEGdpCVhJPo8vX4mxXGS6exZQMRJpg0Hynwt9JhA46tExHynCq0AgRY/lGD9BBH30g1HUhfSXNXNSWKF0kqwmuLmVfuAtdXrUhxncu6baREgVvFT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ja3yyzG9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ja3yyzG9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691EA1F00893;
	Sat, 12 Sep 2026 09:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789204227;
	bh=x1a1rOMGMfISdBlkbuH6/fH/eMTUnMxNj82/0hjOpr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ja3yyzG9e2y7Ej2o+BWXvWAJO7zwIms4w7H29UHXrecjWg3NMb/lMmZSdapC/+Ff2
	 Mw+cCII1A7H+NPAuqV/JVNKxI2+iVjMTAHMfTGtau3NNp0W4G7lUmC5ClGx2l+JZUy
	 HUCIx54haOM7iofzINr/OAHOIowIIeAHSeXv+/v3UxoT+DIiii1WkpBC0Eky6fs676
	 xIXM8vw6wS7+AxW9G131dxPaDOYTUYYNyI4ENc6JYx68e0Jv1rPgGAtO6bbWukJSuc
	 G1836AThfbsdqx0/zyLBwaeWmC+rIRf/B7x1IshiJXA8sQK0RX2I8UnYvnpy3OsoUw
	 7U8Te94/IcLEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 3/4] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260911-ks8995-to-ksz8-v12-3-5c3422d0d72e@kernel.org>
References: <20260911-ks8995-to-ksz8-v12-0-5c3422d0d72e@kernel.org>
 <20260911-ks8995-to-ksz8-v12-3-5c3422d0d72e@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 09:10:26 +0000
Message-Id: <20260912091027.691EA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The PHY soft reset loop in `ksz8_reset_switch` unconditionally i=
ssues a soft reset and polls for it to self-clear on all ports, including t=
he CPU port which lacks an internal PHY. This risks causing a probe timeout=
 on the KSZ8995XA if the reserved register latches the bit.
--

commit d45e85fe8d15053b235725e1e75c154fee3c35c3
Author: Linus Walleij <linusw@kernel.org>

net: dsa: microchip: Support Microchip KSZ8995XA / KS8995XA

This commit adds support for the Microchip KSZ8995XA switch to the KSZ driv=
er.
It introduces hardware detection, a dedicated PHY soft reset workaround for
this older switch, and configures the switch for its specific legacy featur=
es.

> diff --git a/drivers/net/dsa/microchip/ksz8.c b/drivers/net/dsa/microchip=
/ksz8.c
> index 941ae9f66f70b..4acce01ca0631 100644
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

[Severity: Medium]
Does this loop incorrectly include the MAC-only CPU port?=20

Since dev->info->port_cnt is 5 for the KSZ8995XA, this iterates over ports
0 through 4. Port 4 is the CPU port, which does not have an internal PHY.
Does writing PORT_PHY_SOFT_RESET to REG_PORT_STATUS_3 on the CPU port write
to a reserved register?

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

[Severity: Medium]
Will this polling loop timeout on the CPU port if the hardware latches the
written bit?

Since the CPU port lacks the PHY logic to execute the reset and self-clear
the bit, it might hang indefinitely and fail the probe with -ETIMEDOUT.
Should this loop (and the write loop above) be restricted to
dev->phy_port_cnt instead of dev->info->port_cnt?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-ks8995-to-=
ksz8-v12-0-5c3422d0d72e@kernel.org?part=3D3
