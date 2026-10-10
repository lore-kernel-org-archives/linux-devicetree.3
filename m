Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFCA4AA02B
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637923; cv=none; b=Ua5/VSJB7rBBsBsoT4TBAP0F0QD19xvrJmqFK01ogoCRghSxyDma4E9qIkoohtgs7EwPYpMuOU5Yyg1iltBuhH3i1bryWEO5ASTl0m4oxvxoQSeZJYQXvZ3R2niP5jAHQIOlwACuEinR+50Y1uOdP6Z0cC+jw4OoYx6cN5LRyNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637923; c=relaxed/simple;
	bh=1iXXP/WQaM5OFEikpq0IqX0SyLKGsxfucjHby6MeeJI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=i2XhGXMxLvf8C/a3Kbr1UmtwnyXSBv/bJkZPt6dsfqKTc1NLEzKn3PEUFND6kL47cV2L3gybonAzX6PsTKCbniZ3czOgy+k51q2Or7DkaRTesctFbyIXFp+TjZ19KjMnYmNgXjZWp6qz4TQduulKubUx0e31G9CB9o1q6b5dzb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpc0TgDB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpc0TgDB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A60E1F000FF;
	Sat, 10 Oct 2026 13:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791637920;
	bh=iDUrYjH4fqVF+FKPmUccA+Cgrd7FR/iFbJETZkQ7bsI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cpc0TgDBAMaQ9/yhHhlne3iZNYZK4GLMA4fPg3ggOpgB1hyzIAPN2DH8VTUdelqrM
	 XyhH/Fe7KIQbsGBOBVz8O6OHeFK07b8uuy1XWVTUioBQqgvYQ55HAikG5vF+nc1SsN
	 35aERUySHhw9MOq+Oul51FLuPG9dnivszuszjULefs1B5QAnBwwRTbVALyBfR/6JjZ
	 8hRQGNrldkcDOFPvl774kEA1aCDCJ5im2C0jUMTVEMZwsuykg/ryhrUj+cZ0PtClfa
	 zvVV29mGeRLh3KU6U1inJ4c6ptOcf4/bwzTdmgI05iUvABU5DRG0OBqK5SqwF08rQj
	 p9bVY5U5D+PTA==
Message-ID: <sashiko-outbox-166573@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/24] net: mdio: Add ZTE ZX279128S MDIO controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261010130024.177503-16-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-16-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:11:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hw: Ineffective MDIO status clear using writel(0)
--

commit 45a7d41335201ba838e0dc1def510a6cce8f6d73
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

net: mdio: Add ZTE ZX279128S MDIO controller

This commit adds a new MDIO controller driver for the ZTE zx279128s SoC. It
provides bounded Clause 22 transactions and managed clock and MDIO-bus
registration.

> diff --git a/drivers/net/mdio/mdio-zx279128s.c b/drivers/net/mdio/mdio-zx=
279128s.c
> new file mode 100644
> index 0000000000000..4c4a9ada68f98
> --- /dev/null
> +++ b/drivers/net/mdio/mdio-zx279128s.c
[ ... ]
> +static int zx279128s_mdio_xfer(struct mii_bus *bus, u32 op, int addr,
> +			       int regnum, u16 data)
> +{
> +	struct zx279128s_mdio *priv =3D bus->priv;
> +	void __iomem *base =3D priv->base;
> +	u32 cmd, val;
> +	int ret;
> +
> +	/* Clear the previous command and its status */
> +	writel(readl(base + ZX_MDIO_CMD) & ~ZX_MDIO_CMD_START,
> +	       base + ZX_MDIO_CMD);
> +	writel(0, base + ZX_MDIO_STATUS);

[Severity: Medium]
If the ZX_MDIO_STATUS register uses Write-1-to-Clear (W1C) semantics for its
status bits, will writing 0 have any effect?

If the DONE bit remains set, would the subsequent polling loop below
immediately succeed and return without actually waiting for the hardware,
potentially leading to corrupt reads or dropped writes?

> +
> +	cmd =3D readl(base + ZX_MDIO_CMD);
> +	cmd &=3D ~(ZX_MDIO_CMD_WR | ZX_MDIO_CMD_RD | ZX_MDIO_CMD_ADDR |
> +		 ZX_MDIO_CMD_REG);
> +	cmd |=3D op | FIELD_PREP(ZX_MDIO_CMD_ADDR, addr) |
> +	       FIELD_PREP(ZX_MDIO_CMD_REG, regnum);
> +
> +	if (op =3D=3D ZX_MDIO_CMD_WR)
> +		writel(data, base + ZX_MDIO_DATA_WR);
> +	writel(cmd | ZX_MDIO_CMD_START, base + ZX_MDIO_CMD);
> +
> +	ret =3D readl_poll_timeout(base + ZX_MDIO_STATUS, val,
> +				 val & ZX_MDIO_STATUS_DONE, ZX_MDIO_POLL_US,
> +				 ZX_MDIO_TIMEOUT_US);
> +	if (ret) {
> +		dev_err_ratelimited(&bus->dev, "timeout (addr %d, reg %d)\n",
> +				    addr, regnum);
> +		return ret;
> +	}
> +
> +	writel(0, base + ZX_MDIO_STATUS);

[Severity: Medium]
Similar to the above, does writing 0 properly clear the ZX_MDIO_STATUS_DONE
bit here?

While we don't have access to the ZTE ZX279128S datasheet to confirm, other
IPs on the same SoC (such as the SPI controller via zx_spifc_ack) use an
explicit writel(val | SPIFC_ACK_DONE, ...) pattern rather than writing 0 to
clear status bits.

> +	writel(readl(base + ZX_MDIO_CMD) & ~ZX_MDIO_CMD_START,
> +	       base + ZX_MDIO_CMD);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D15
