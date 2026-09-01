Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB98D3C0626
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273338; cv=none; b=e10IoN+UHYjY4lHKmlvnkUssXmPlJTyF4ut6/rkIcI7eCdKI+nOPrQUNFGP8uPwcOiJxMLV2lPyEOu8GO8335jvCtp2q1JEdr+PkUKSzDaAZTTegcWBYjLCJsRgrZ/TzG/DLUH9L+HnNJPGiBJ6lGIm1Xtl841k3+oIm3L7GubM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273338; c=relaxed/simple;
	bh=qlaDluX47OiiK37OiKAodrjuMt3SbSxxzySPOGFronw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZCxcxutWCZmHj/rR/v7SuuZopJZyiicaXmHDYwfn5cjWaicQmccxrEz/sAqEr7ULPHZN813ZnaxxJgiDQEXXS5dG8FgO6g6tAD9GQ0H38vcOPRaZPArV52A7OJrHhIWwWHRFFvMFwSgPMJRNV8fXVP6JIOpeFA/eOIWwqblTPNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iACQ29Vj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iACQ29Vj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368891F000E9;
	Tue,  1 Sep 2026 14:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788273336;
	bh=iIN+eSWNzgYT8JxmI2VbCg49M15zT/fkcrY5ChN1HQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iACQ29VjZ/so0DyTwB+clQYBivlieutUsKyQ29huFBM+kUDC7DUOUvP8d2qjum+1C
	 GpnaHsU/G4Oku0ZBU05Ds3WX5jik41uBtwdGbFD0ajlTPMo8WrUKnHc7xPDoz1QLxK
	 z19V5E8oeGoRWc9hbvEn+ZxnDhjYdOy14yb9tGVvTAe4SzH7pmLWh7n5HhE9s6cFNN
	 3mAa6/pruAtpoyI+iESInFZU/Ajx+65u7pglkPdeJnxoy39+r6tv0dj3TGBF8U4FSv
	 F2W2MrmP+y9itZwqkqiZ0O8qRplQszS5UZleaiWYU7RguwR1Gf8A1WGbJnGs2Z2vfo
	 YrcQHC4EFo5+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 04/13] net: phy: add phy_detach_internal()
 helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831143439.2404484-5-markus.stockhausen@gmx.de>
References: <20260831143439.2404484-1-markus.stockhausen@gmx.de>
 <20260831143439.2404484-5-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 14:35:35 +0000
Message-Id: <20260901143536.368891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] phy_attach_direct() error path destructively tears down pre-existi=
ng PHY attachments and corrupts module refcounts.
--

commit 9c0668542a6d1a738f40f7d8a8ebdeecb5d1257f
Author: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: net: phy: add phy_detach_internal() helper

This patch carves out the phy_detach() code into a new helper
phy_detach_internal() and makes phy_detach() a short stub that calls the
new helper. This prepares for upcoming MDIO bus notification enhancements
that need to distinguish between normal detach and cleanup paths.

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 8cb0d60fcbba9..69b04a92b7766 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -1763,6 +1763,98 @@ static bool phy_drv_supports_irq(const struct phy_=
driver *phydrv)
>  	return phydrv->config_intr && phydrv->handle_interrupt;
>  }
> =20
> +/**
> + * phy_detach_internal - detach a PHY device from its network device
> + * @phydev: target phy_device struct
> + *
> + * This detaches the phy device from its network device and the phy
> + * driver, and drops the reference count taken in phy_attach_direct().
> + */
> +static void phy_detach_internal(struct phy_device *phydev)
> +{
> +	struct net_device *dev =3D phydev->attached_dev;
> +	struct module *ndev_owner =3D NULL;
> +	struct mii_bus *bus;

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
> +		phy_link_topo_del_phy(dev, phydev);
> +	}

[Severity: High]
This isn't a bug introduced by this patch, but this logic can tear down
an existing attachment when an error occurs during phy_attach_direct().

If phy_attach_direct() is called on a PHY that is already attached to
another device, it hits this check:

drivers/net/phy/phy_device.c:phy_attach_direct() {
	if (phydev->attached_dev) {
		dev_err(&dev->dev, "PHY already attached\n");
		err =3D -EBUSY;
		goto error;
	}
...
error:
	/* phy_detach() does all of the cleanup below */
	phy_detach(phydev);
	return err;
}

This calls phy_detach_internal() on the old attached_dev, completely
destroying the pre-existing attachment (clearing its phydev pointer,
suspending the PHY, etc.) without notifying it. Can we abort harmlessly
instead of destructively modifying the pre-existing state?

> +
> +	phydev->phy_link_change =3D NULL;
> +	phydev->phylink =3D NULL;
> +
> +	if (phydev->mdio.dev.driver)
> +		module_put(phydev->mdio.dev.driver->owner);
> +
> +	/* If the device had no specific driver before (i.e. - it
> +	 * was using the generic driver), we unbind the device
> +	 * from the generic driver so that there's a chance a
> +	 * real driver could be loaded
> +	 */
> +	if (phydev->is_genphy_driven) {
> +		device_release_driver(&phydev->mdio.dev);
> +		phydev->is_genphy_driven =3D 0;
> +	}
> +
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
> +}

[Severity: High]
This is a pre-existing issue, but this balances the bus owner refcount
based on the old device's driver owner.

In the case where phy_attach_direct() fails due to the PHY already being
attached, this module_put() executes with the old caller's module owner.
Could this lead to module refcount underflows or leaks because it balances
the new caller's try_module_get() using the old caller's module?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831143439.2404=
484-1-markus.stockhausen@gmx.de?part=3D4
