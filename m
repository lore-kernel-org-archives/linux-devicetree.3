Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CABD3A5E64
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 16:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070450; cv=none; b=incW7PaJ5aeZDHYAR16FvT4+VpgTCbeLvgCof2zXLEarU2erTjzxQ2GfXlyfE2Rflm2SvSMB6p+kGhiY+0shoHtZQodsx7islsJrpKEBggu16KHIk8kJDh7wC3nc3Xr90AJzmGND3qPd8/GR+jV24eT7jKNT0eM+BEW44aR9Lq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070450; c=relaxed/simple;
	bh=j8e6yveNP3Qe6tfmjVDeh5pAHGNHL2OlEBtV6+9uJCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WUEnsTpctx6Bs6N5A7VEB1GISNIRo+8bw2CnZj2gO8JOQxdFX6xw8RvN+GaS5iMHHtzXxDSREPn5/5Jvsm70uEAcaK30wawJ8WUWFTfk1+tHjJM+9DoMx5W1OLTSgsaTzaUKEuuFFZPj8V+aAoIDkyPGQIJDdwDJgR4+3rVr7Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZwwec0i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZwwec0i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC631F00A3D;
	Tue, 18 Aug 2026 16:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787070448;
	bh=Ak2PsUfKvD8+Ckffirni4pSlDPwHoEHxUguI0A1Ff6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aZwwec0ilmvho8g5hn9srgQ+oVND90lsw1vzn5KLpSSfa0d7Eb/9cycumbRfZJ4Xp
	 zj3Bk5VTetZv9meYYX4rnTNLPa1YMhljKZH7FKmJMqeoA33nTOzU0cy91kvpMbzDOz
	 JttgTN/MpUqW0NypPEZRal2JfAIhIsBiLsEUQpiZf8BRbfci6D63aEv6vnkJUrHYsJ
	 mn4dpUOsuYKcnGC1LQKqV4EFEJniBx7ZqtzJHmLIg5LpdTC1n7JDRBbkrxEGl21ZGa
	 BK7uUUbHgWZEYZIaKU8aQqJ1s8FYT8xkL0ir9ee46f1/pAo6fc1BHzrove3/IvXbRl
	 Kjp4z1P9LyQhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v14 04/13] net: phy: add phy_detach_internal()
 helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817162632.1208891-5-markus.stockhausen@gmx.de>
References: <20260817162632.1208891-1-markus.stockhausen@gmx.de>
 <20260817162632.1208891-5-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 16:27:28 +0000
Message-Id: <20260818162728.4DC631F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-after-free of MDIO bus when detaching a PHY.
- [High] Error path in `phy_attach_direct` catastrophically destroys existi=
ng PHY attachment and leaks references.
--

--- Patch [4]: [PATCH net-next v14 04/13] net: phy: add phy_detach_internal=
() helper ---
commit cd30833ec89f19b0a5658d942adf201f6894916e
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: phy: add phy_detach_internal() helper

For the upcoming MDIO bus notification enhancements the PHY detach path
needs to inform the bus about these actions. Until now phy_detach() is
called normally but also in the phy_direct_attch() cleanup parts. So in
the future there must be a clear indication if a notification is needed
(normal path) or not (cleanup path).

Carve out the phy_detach() code into a new helper phy_detach_internal()
and make phy_detach() a short stub that calls the new helper.

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 94b2e85e00a37..835d71306b4d0 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -1734,6 +1734,91 @@ static bool phy_drv_supports_irq(const struct phy_=
driver *phydrv)
>  	return phydrv->config_intr && phydrv->handle_interrupt;
>  }
> =20
> +static void phy_detach_internal(struct phy_device *phydev)
> +{
> +	struct net_device *dev =3D phydev->attached_dev;
> +	struct module *ndev_owner =3D NULL;
> +	struct mii_bus *bus;
> +

[ ... ]

> +	phy_suspend(phydev);
> +	if (dev) {
> +		struct hwtstamp_provider *hwprov;
> +
> +		/* hwprov may technically be protected by ops lock but
> +		 * not for devices with a phydev, see phy_link_topo_add_phy()
> +		 */
> +		hwprov =3D rtnl_dereference(dev->hwprov);
> +		/* Disable timestamp if it is the one selected */
> +		if (hwprov && hwprov->phydev =3D=3D phydev) {
> +			rcu_assign_pointer(dev->hwprov, NULL);
> +			kfree_rcu(hwprov, rcu_head);
> +		}
> +
> +		phydev->attached_dev->phydev =3D NULL;
> +		phydev->attached_dev =3D NULL;

[Severity: High]
This is a pre-existing issue, but does this catastrophically destroy
existing PHY attachments when called from the phy_attach_direct() error
path?

If phy_attach_direct() is called for a PHY that is already attached (e.g.,
due to a device tree misconfiguration), it correctly detects this with
"if (phydev->attached_dev)", but then jumps to the error label which calls
into this detachment path.

This unconditionally destroys the existing valid attachment (clearing
attached_dev->phydev and resetting PHY state) instead of gracefully
aborting the new attachment attempt. Additionally, balancing the old
attachment's references here permanently leaks the new module and device
references acquired earlier in phy_attach_direct().

> +		phy_link_topo_del_phy(dev, phydev);
> +	}
> +
> +	phydev->phy_link_change =3D NULL;

[ ... ]

> +	/* Assert the reset signal */
> +	phy_device_reset(phydev, 1);
> +
> +	/*
> +	 * The phydev might go away on the put_device() below, so avoid
> +	 * a use-after-free bug by reading the underlying bus first.
> +	 */
> +	bus =3D phydev->mdio.bus;
> +
> +	put_device(&phydev->mdio.dev);
> +	if (dev)
> +		ndev_owner =3D dev->dev.parent->driver->owner;
> +	if (ndev_owner !=3D bus->owner)
> +		module_put(bus->owner);

[Severity: High]
This isn't a bug introduced by this patch, but can this dereference a
freed bus pointer?

If the MDIO bus has been unregistered and its primary references dropped,
the PHY device may hold the final reference to the bus via its parent
pointer. When phy_detach_internal() calls put_device(&phydev->mdio.dev),
it can drop the last reference to the bus, causing the struct mii_bus to
be freed.

The subsequent check "if (ndev_owner !=3D bus->owner)" and
module_put(bus->owner) will then dereference the freed bus pointer.

> +}
> +
> +/**
> + * phy_detach - detach a PHY device from its network device

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817162632.1208=
891-1-markus.stockhausen@gmx.de?part=3D4
