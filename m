Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771681;
	b=axK1QP4ZRJYXsAb0u4qGXFLVihSLZXqqTvIEbpczsNcl1TWGYMbAdbtYJRF/9vEby1/L
	 r7cJAEr9EWDeRxr4/MYZHG2I6sPW5H4wfpdo1A9QL27lntapk8mooKN04fc4p6/LTmC8Y
	 aJJ7S60avd3hGTZhHB96TQPN8OSGZmlAgzvq+n63xcplvjekumgZ848H0E3Pi4HWlFzKq
	 hHUGSB9TsngHFRAcnDDGMK+8s2XBoWMSO4Su1uuoJU4RnfmxINYyOxkTRI+TYPlRhVeAJ
	 dNvj6jgogbQu7W26/mj7+vm2uVF/w0fRdmvk3wXgeANbpLD0n31msj9BXVB9v9PfBkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771681;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1U+VUQgPNdFyqdogFGANZrOR29fcq+5XxMuyJyNDdRU=;
	b=o9nvo12pMTM33IYN9snAy0U722w8IM4i/tgQ9JIM6P7FOxm6jHzZHS89J7tfRw65Jmox
	 IyLEm/YeTAOew/5SFlKrNSbk744DM7HtWzzWJwHG2W/9qptVM6Wmtrfzk0FoNS0eGXujs
	 GR5qwpJeymCTHcvr2piUAGJbL2Gq5Ii0Ry/91ABzByJvEO+dwsVY2p28F8fctw8JMgamu
	 vlXp68bjBPsZl00vT+cj+cySTl9NegCN4C1m7x4NCEEbqpy2CbZhwWZ2jQxiSemkyNDPG
	 p846q0xH5iJ5IcGWqUKPIxR+pgY2H2NrWewHAukkNn9yfkBJ+jki9w3jljMXPQ378Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XHl/81gu";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BD3606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHl/81gu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB391F00898;
	Fri, 27 Nov 2026 09:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795771680;
	bh=1U+VUQgPNdFyqdogFGANZrOR29fcq+5XxMuyJyNDdRU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XHl/81guaJXPg0IADJ43LaCpk6Xtog3AUEFHySGy+ivIYZaBZD2qQHo1wVkAIxnG2
	 y5SwfiomD3cTgM1UrkIC0sWaSKY7dLzlbiyJqlY3RFh8n+hDKJouH0YPgF+j+WIyKo
	 fCFQB6yBJHOa/uxjTMBVxFfAlP59JA4Zb4uXlVF/95UvyZWixqJP0GPELzYa2aY08/
	 X/TFMWubDVEQZDuKIxFqmenq9CAEkLwxNE4pmr0uoLRNbPNYxs00gbyRlme0exvMuK
	 qByJB/58oJRulyey3JTXtknBn/S4GAd2jJjTHhzZbAcCXpMADFG0MbTCaHe3OHh1Pi
	 nyi9UyHivSf1g==
Message-ID: <sashiko-outbox-236978@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 2/3] net: mdio: Add Cortina CS7542 bus
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-b4-cs7542-mdio-v3-2-35739a0f3225@gmail.com>
References: <20261126-b4-cs7542-mdio-v3-0-35739a0f3225@gmail.com>
 <20261126-b4-cs7542-mdio-v3-2-35739a0f3225@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:27:59 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: mdio: missing APB clock enablement in
  cs75xx_mdio_probe()
--

commit 78d590aee35acd115434c7d0b0c0e975167e8993
Author: Fil Dunsky <filipp.dunsky@gmail.com>

net: mdio: Add Cortina CS7542 bus controller

This commit adds a driver for the Cortina Systems CS7542 MDIO bus
controller supporting Clause 22 PHY register access via polling.

> diff --git a/drivers/net/mdio/mdio-cs75xx.c b/drivers/net/mdio/mdio-cs75x=
x.c
> new file mode 100644
> index 0000000000000..c3d80a983404c
> --- /dev/null
> +++ b/drivers/net/mdio/mdio-cs75xx.c

[ ... ]

> +static int cs75xx_mdio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct cs75xx_mdio *priv;
> +	struct mii_bus *bus;
> +	u32 cfg;
> +
> +	bus =3D devm_mdiobus_alloc_size(dev, sizeof(*priv));
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	priv =3D bus->priv;
> +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	cfg =3D readl(priv->base + PER_MDIO_CFG);
> +	/* The firmware configures the MDC rate; retain its prescaler. */
> +	cfg |=3D MDIO_CFG_MANUAL;
> +	writel(cfg, priv->base + PER_MDIO_CFG);
> +	writel(MDIO_CTRL_DONE, priv->base + PER_MDIO_CTRL);

[Severity: Medium]
Should cs75xx_mdio_probe() acquire and enable the APB input clock with
devm_clk_get_enabled() before accessing PER_MDIO_CFG and PER_MDIO_CTRL?

The companion DT binding in Documentation/devicetree/bindings/net/cortina,c=
s7542-mdio.yaml
makes clocks a required property.  Even when retaining the firmware
prescaler, leaving the clock unclaimed means probe accesses can hit an
unclocked block, or clk_disable_unused can gate the clock later and make
cs75xx_mdio_read() and cs75xx_mdio_write() time out with -ETIMEDOUT.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-b4-cs7542-=
mdio-v3-0-35739a0f3225@gmail.com?part=3D2
