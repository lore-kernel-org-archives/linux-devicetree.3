Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481C43D47A3
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580887; cv=none; b=C+5Gbp7rQ6e31vsfVYl3pDNCKI8Y6qIpUjfFlKOHxnNEkl12CZlA2A4yKXeXHWLJhLrxmgnPPZHYVRT6v3GUXxZZ4L4kjF4lJNgZfzj2aat+RXxrMMmTMgYCKbMFwY7OuWl6s8Xehfn7MwS+IM2jFnjN10jXSA9P5/WziyAKmmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580887; c=relaxed/simple;
	bh=p/TeVl4qgAn+/N0C9OQJ6Y0m/lwUi+wQZ+8xz2Bq4tQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qfBcwUpRqWEG1ZbmIpzZKRLHJM+PposNTcr39k0Y8iYYOvPPUQ32ITo9Q++bqhfHNc0JNbUP28DQtD8mPGRi1bXhwCJvkjnyWmCVry2P6k+3IZEw5d5QeUi484ILpjqDjG9UO0wqRH9HBf/fkq8NNFager6xa8C9PbLIWxEbk9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=As0VwYLS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="As0VwYLS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619281F00893;
	Wed, 16 Sep 2026 17:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789580868;
	bh=tJBzUmmr6uDdg6On7fKw3BiDTjdciO9DRWB8Be5H7DA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=As0VwYLShOCYoG9sAWUxFffsmc+27LuHLH7IW6LKsoMgPATLLEpWRl1FoXNwYuhTl
	 Y5+QcTUiLdpEvKVaeKGqAk4QJ4YxD88qYPmFTg4Gr3Dv3X/lPmE5qehMrXqW4Kh3Fh
	 tnVmeCNThyqYWzzOnpeyduaxeBAO+sUUvJIWyFz3LfFj2jpexKn0hm0SUOR4ihTk3B
	 quh/+R65c8umgntBGQ8qgB3XjkFSwOu6K4GvQM7nzqUPH/gve/14bDrDyIu9djeFeY
	 LjtH01kP6TL6GQb12EmhzjQ1+28BCwDYdVyQLfbtOjzSb6UGMqUOm+t5/FGlvjOlDu
	 JT9iBf7C5MZxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 6/7] dt-bindings: net: dsa: mediatek,mt7530:
 add econet,en751221
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915174643.253660-7-cjd@cjdns.fr>
References: <20260915174643.253660-1-cjd@cjdns.fr>
 <20260915174643.253660-7-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 17:47:47 +0000
Message-Id: <20260916174748.619281F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: dsa: lockless child_bus access causes MDIO race condition
- [High] net: dsa: late mdio irq setup forces PHYs to poll mode
--

commit ef09d813c1932657a0f0b34029eea8c2c9403e91
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: support PLL setup on MMIO MT7530

On MT7530 and MT7531, PHYs are an integral part of the switch. However,
on MT7530, certain configuration such as PLL setup is done via special
registers on one of the PHYs. In an MMIO implementation, the MDIO bus
is part of the switch itself.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index b2344808457cb..b152b73315d50 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -77,6 +77,12 @@ core_write(struct mt7530_priv *priv, u32 reg, u32 val)
>  	struct mii_bus *bus =3D priv->bus;
>  	int ret;
> =20
> +	if (!bus)
> +		bus =3D priv->child_bus;
> +
> +	if (WARN_ON_ONCE(!bus))
> +		return;
> +
>  	mt7530_mutex_lock(priv);
> =20
>  	/* Write the desired MMD Devad */

[Severity: High]
When an MMIO switch (e.g. ID_EN751221) triggers a port state change,
mt7530_setup_port6() calls core_write().

The lock helper mt7530_mutex_lock() ignores child_bus:

drivers/net/dsa/mt7530.c:mt7530_mutex_lock() {
    if (priv->bus)
        mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
}

This allows the indirect MMD bus->write() and bus->read() operations to
execute entirely without the bus->mdio_lock synchronization.

Can this lockless child_bus access cause hardware MDIO controller state
corruption and silent transaction failures due to interleaved MDIO accesses?

commit b6de045bf619c20c22824d1e2470474ed02da7d7
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: support MDIO switch downstream of MMIO switch

The MT7530 / MT7531 can connect via either MDIO or MMIO. In MMIO mode
the switch provides its own MDIO bus which connects to its integrated
PHYs, but also can be connected to other things, such as another switch.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index b152b73315d50..fe93be1ece7d7 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2438,9 +2442,6 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  	bus->parent =3D dev;
>  	bus->phy_mask =3D ~ds->phys_mii_mask;
> =20
> -	if (priv->irq_domain && !mnp)
> -		mt7530_setup_mdio_irq(priv);
> -
>  	priv->child_bus =3D bus;
> =20
>  	ret =3D devm_of_mdiobus_register(dev, bus, mnp);

[ ... ]

> @@ -3285,6 +3287,9 @@ mt753x_setup(struct dsa_switch *ds)
>  	if (ret)
>  		return ret;
> =20
> +	if (priv->irq_domain && ds->user_mii_bus)
> +		mt7530_setup_mdio_irq(priv);
> +

[Severity: High]
For MDIO switches, this executes after devm_of_mdiobus_register() in
mt7530_setup_mdio(), meaning the PHY devices are created and scanned before
bus->irq is populated.

For MMIO switches, ds->user_mii_bus is still NULL during mt753x_setup(),
so the IRQ setup is skipped entirely.

Will this late mdio irq setup force PHYs to fall back to polling mode,
degrading performance and delaying link state detection?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915174643.2536=
60-1-cjd@cjdns.fr?part=3D6
