Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A60C5221C8
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059685; cv=none; b=EiCKeqvtHqeEwrYO0JLKYxsw7xgnbkLrHX/Y5B9zj3ryMMQG956GES4aNM3XjnVyCIsRKGTdmq2x8prODjnqk/pSoB4s8Ef3pOmJWcroqjtaY623KJ4guMACeKlnxdyrJc83yQ6BSwDCRvBeIMssnJmYzBRAnILjWrDuhRhM7HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059685; c=relaxed/simple;
	bh=mV482CVpK8049cBhDDzqu35+vqHQ2267Wy2AYia6JaY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YmkALO+EZ1KP+Rg5jS1uA2bGeL5EqBrofcM0QBbMkPRtrQdxpQQ6bBm/lMWHgYQ6NhWVM/ehAC0EgZYumlaZngg/pXBrAMwML+saNy/b32DtmATxr+5rJgZf5Lo8tCjUigfFxC/S/dW4Nk9nrKX8KobeucVU2laq5IFkBC/gkWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVxeMC8y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVxeMC8y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362821F00898;
	Thu, 10 Sep 2026 17:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789059677;
	bh=kY+GVroWx1JlpqpQcvefXY1PZSPw5qnhzP5wpxZYDXM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bVxeMC8yXS6zNy8S+cah18BsvQ7ps4OYTinww7o40Kf4KkeQBnTEtiaZsllSXf7i/
	 zj5vpwxzRbD3/81pURICYtkznKa3l6YOPMT0FcG8n9gHLxeEPW6FG3aqqT4sfl/5Mc
	 HeRpsR5emMPMOwvukWdjIjGsmbLe2uRpDcHqQe6dX50ts6roCgATURDhLfIEf3z5ty
	 NP6s++w60sU1sN/HPKXW50w49kGBF5yjJIjiPA2/X4bPp5FKHEP2jAXjznEYg1TCAW
	 MnSxEzaXMDO1zAXYDUZVVzSpEeSWXuduO+KSECvunsvl7B/kuKTRsgO3bqIg8CfX2A
	 KWR/miZvmaGFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 3/4] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909-ks8995-to-ksz8-v11-3-0e04411a559d@kernel.org>
References: <20260909-ks8995-to-ksz8-v11-0-0e04411a559d@kernel.org>
 <20260909-ks8995-to-ksz8-v11-3-0e04411a559d@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:01:16 +0000
Message-Id: <20260910170117.362821F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardware Reset Timeout: `ksz8_reset_switch()` erroneously applie=
s a PHY reset to all ports, including the CPU port which lacks an internal =
PHY.
--

commit 80bf0b7a0236c83f85f86b7cc57ef97388c5c06c
Author: Linus Walleij <linusw@kernel.org>

net: dsa: microchip: Support Microchip KSZ8995XA / KS8995XA

This commit adds support for the Microchip KSZ8995XA switch in the KSZ
driver. It implements hardware detection, MAC operations, and specific
PHY reset and initialization sequences required for this legacy device.

> diff --git a/drivers/net/dsa/microchip/ksz8.c b/drivers/net/dsa/microchip=
/ksz8.c
> --- a/drivers/net/dsa/microchip/ksz8.c
> +++ b/drivers/net/dsa/microchip/ksz8.c
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
Could this result in a timeout regression that fails switch initialization?

Both loops in ksz8_reset_switch() iterate over all ports up to
dev->info->port_cnt, which is 5 for the KSZ8995XA, thereby including the
CPU port. Since the CPU port lacks an internal PHY, writing to its
REG_PORT_STATUS_3 targets an undefined or reserved register.

If the hardware latches the written bit or does not return 0 when read
back, the regmap_read_poll_timeout() call will hit its 600ms timeout
and return -ETIMEDOUT, entirely aborting the setup sequence.

Should these loops iterate up to dev->phy_port_cnt instead to avoid
resetting non-existent PHYs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-ks8995-to-=
ksz8-v11-0-0e04411a559d@kernel.org?part=3D3
