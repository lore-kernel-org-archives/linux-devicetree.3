Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EBC254B03
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 05:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784959018; cv=none; b=Ahd3pKGCNNoChiXw+mTxhfmN1sIElsjm8Ae7kgbFRqWAYs6DnODem5vyq31tpW74jx/xThTILPjWkcZ347+F9+c0JAt1O4wyhUpH3VehXIwXWt7NxaQ3c53cCZfg98AD1q079HZ0E7IIVv/JSKPZCjH/wsXk439NtpNw2gFf4YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784959018; c=relaxed/simple;
	bh=9j7XAqQVJGd+eTY3Wy1ySZiwaSe8FhnvwhUrUZv5bKw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o6Q7anxgyYVn2+G4KL7xITyni1ZinmEEj0Tr3G27p/Fa7SGSjkHiSvdQRy0U/MggE3Stk7GeNogpucFr8UDqJeKgzFN/YEFAaNfADiVYAq8guJtxKgzUH61M/cIUI0oiDXzfG+uncjQbL6FVkYhf4vWw2aQEWZ8wr8oMOp20FTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ua8U8SQy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ua8U8SQy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69161F00A3A;
	Sat, 25 Jul 2026 05:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784959017;
	bh=71OkEQgRRSb3pnZmEsbDRdyaKBcA9odKJeSUrsK0LmU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ua8U8SQyvsLgaNyTzVZeuTe5nQfGfiJcvHvPSE8Pk1V9kIQ9hkWdYcnioOnZFIocg
	 3NIhe9DObD7reLFaAQebsnaNb+AQgJngA0zXr/G/iJX3J+4xWarBwDh73/DQbasIm+
	 rmV21fLCOhXHr7rE6lVlOoB6sQ4QXjnuGMbH3V+O7kGDztQ79f51D4AeDKyUdUa76c
	 Lo+1WIbcK1CR+5CL2bUaTKi2h4X/uunpS92d53pdl5mLhFWP7aEI6nSUm6EkBMCzdI
	 fML4efMBLeC0qSBndP6I1p/FNYeGIb4+YoU02l7VP7kjaJEwh7tfMLMy+UH6/7W6JI
	 yV/CAkqTU3paA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 3/8] net: phy: add
 (*notify_phy_attach/detach)() hooks to struct mii_bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724055611.1008577-4-markus.stockhausen@gmx.de>
References: <20260724055611.1008577-1-markus.stockhausen@gmx.de>
 <20260724055611.1008577-4-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 05:56:56 +0000
Message-Id: <20260725055656.B69161F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] LIFO teardown violation in __phy_detach() clears phydev->attache=
d_dev before invoking notify_phy_detach() hook.
- [Medium] Calling phy_attach_direct() on an already attached PHY destructi=
vely tears down the existing attachment without notifying the MDIO bus, ris=
king hardware lockups.
--

--- Patch [3]: [PATCH net-next v6 3/8] net: phy: add (*notify_phy_attach/de=
tach)() hooks to struct mii_bus ---
commit d7589ba7dbd162eb0da02fc6dd0debdc3bbed116
Author: Daniel Golle <daniel@makrotopia.org>

net: phy: add (*notify_phy_attach/detach)() hooks to struct mii_bus

This patch adds notify_phy_attach() and notify_phy_detach() hooks to=20
struct mii_bus. This allows MDIO bus drivers to handle PHY specific=20
initialization without reinventing bus scanning. It implements a symmetric
LIFO teardown where the detach hook is called only if the attach notificati=
on
succeeded.

Link: https://github.com/openwrt/openwrt/pull/21515#discussion_r2714069716
Link: https://lore.kernel.org/netdev/cover.1769053496.git.daniel@makrotopia=
.org/

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 94b2e85e00a37..38b31fc272d7d 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -1734,6 +1734,95 @@ static bool phy_drv_supports_irq(const struct phy_=
driver *phydrv)
>  	return phydrv->config_intr && phydrv->handle_interrupt;
>  }
> =20
> +static void __phy_detach(struct phy_device *phydev, bool notify_bus)
> +{
> +	struct net_device *dev =3D phydev->attached_dev;
> +	struct module *ndev_owner =3D NULL;
> +	struct mii_bus *bus;

[ ... ]

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
> +		phy_link_topo_del_phy(dev, phydev);
> +	}
> +
> +	phydev->phy_link_change =3D NULL;
> +	phydev->phylink =3D NULL;
> +
> +	if (notify_bus && phydev->mdio.bus->notify_phy_detach)
> +		phydev->mdio.bus->notify_phy_detach(phydev);

[Severity: Medium]
The commit message mentions a symmetric LIFO teardown. However,
phydev->attached_dev is cleared before notify_phy_detach() is called here.

In phy_attach_direct(), phydev->attached_dev is set before
notify_phy_attach() is invoked. Does this break the LIFO symmetry,
preventing bus drivers from accessing the attached network interface during
teardown?

[ ... ]

> @@ -1890,8 +1985,8 @@ int phy_attach_direct(struct net_device *dev, struc=
t phy_device *phydev,
>  	return err;
> =20
>  error:
> -	/* phy_detach() does all of the cleanup below */
> -	phy_detach(phydev);
> +	/* cleanup without bus notification */
> +	__phy_detach(phydev, false);

[Severity: Medium]
If phy_attach_direct() is called on an already attached PHY, it hits the
-EBUSY check and jumps to this error path.

This is a pre-existing issue, but destructively tearing down an existing
attachment upon a second attach attempt still occurs. With this patch, the
error path now explicitly passes false to __phy_detach(), suppressing the b=
us
notification.

Since the existing attachment would have previously triggered a successful
notify_phy_attach(), doesn't skipping the detach notification here leave the
bus out of sync, potentially causing MDIO timeouts if the bus continues
polling a reset PHY?

>  	return err;
> =20
>  error_module_put:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724055611.1008=
577-1-markus.stockhausen@gmx.de?part=3D3
