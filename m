Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268212417DE
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 06:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785564891; cv=none; b=BkE0BqcmRVFluRDRZJQbNCESJbY3N/sgyEYACRI5RBCazPgrQdCD/Dxz/fivl+jqMum3yj/LXw4MA5MbJyX/uaadacty3R4BtXzPV5VBIOGXNgA/1bmPM5Y5hD2YwKRqzY09V/E77wWrOfUp/Gffoxuzp+grO9+N0Mu4YwU6ApQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785564891; c=relaxed/simple;
	bh=QIN3Gvosuck8pgHpAH7ELPTWXsapK6xNTrnXShGjy0U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DvX4p8etDCpgg020FhS5KXjLXnAn/nSDfzvo2BkJ33sUazWbjsewFtdETWZik8Lrv/hN5GbXqn8PCQTOHZPxDeBIetpPKwjh635JN8AKdl/Il0PnmrAwcMh9OtyeJA2IYs8IOIYbttvuw+wW5hlV75c+mb1njbARB5veh66Gm5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VH9g+yDL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VH9g+yDL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A121F00AC4;
	Sat,  1 Aug 2026 06:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785564890;
	bh=y8x4O0VRzgBqlYCWxDrvXN0Yp9V5l9Kv5+7HnBLO/5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VH9g+yDLiNuyfbRrY3zJWkwpS/6rV5il88bnj0iTGTuKB6X19NV6AEy/wTjOR/7Iz
	 nbMKIwfEdRigJvgVwoortkI6X1gbPRLbO2u6/u2OB04cTRGvO9u5vboX9ZU+9wchMD
	 HSe5EoANibVVpPkgN1dw13lsSTFvWFuVuSEfoaYoutc5nzjbqCoWwPqEPFcVJ/tr28
	 6LWH+A0cwykwGESI9dJrk5PLAzd71ayDPdk1yME+ztjF8KVUz7Fs1jFbW/FMOHmGD1
	 wTStGaSBW/I6zkc4Y6w8jwn782TVrDw4WdKEu6AAibImaTdM4kgZ/WxZvirDdcssJ7
	 gU0jXK7O6oi7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 03/10] net: phy: add
 (*notify_phy_attach/detach)() hooks to struct mii_bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731061400.78301-4-markus.stockhausen@gmx.de>
References: <20260731061400.78301-1-markus.stockhausen@gmx.de>
 <20260731061400.78301-4-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 06:14:49 +0000
Message-Id: <20260801061449.C7A121F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] When `phy_attach_direct()` is called on a PHY device that is alrea=
dy attached, it returns `-EBUSY` but erroneously jumps to a destructive err=
or path that tears down the existing valid attachment.
- [High] Unsafe NULL pointer dereferences occur in `phy_attach_direct()` wh=
en resolving module owners and logging errors for a standalone PHY (where `=
dev` is NULL) or when a network device lacks a parent hierarchy.
--

--- Patch [3]: [PATCH net-next v10 03/10] net: phy: add (*notify_phy_attach=
/detach)() hooks to struct mii_bus ---
commit 22ccb291ed876048a65b9818306c88cf227879fa
Author: Daniel Golle <daniel@makrotopia.org>

net: phy: add (*notify_phy_attach/detach)() hooks to struct mii_bus

This commit adds notify_phy_attach and notify_phy_detach hooks to
struct mii_bus to allow MDIO bus drivers to handle PHY attach/detach events.
It also extracts a __phy_detach helper to support these notifications.

Link: https://github.com/openwrt/openwrt/pull/21515#discussion_r2714069716
Link: https://lore.kernel.org/netdev/cover.1769053496.git.daniel@makrotopia=
.org/

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 94b2e85e00a37..233622e9ba61f 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -1734,6 +1734,96 @@ static bool phy_drv_supports_irq(const struct phy_=
driver *phydrv)
>  	return phydrv->config_intr && phydrv->handle_interrupt;
>  }
> =20
> +static void __phy_detach(struct phy_device *phydev, bool notify_bus)
> +{
> +	struct net_device *dev =3D phydev->attached_dev;
> +	struct module *ndev_owner =3D NULL;
> +	struct mii_bus *bus;
> +

[ ... ]

> +	/*
> +	 * The phydev might go away on the put_device() below, so avoid
> +	 * a use-after-free bug by reading the underlying bus first.
> +	 */
> +	bus =3D phydev->mdio.bus;
> +
> +	put_device(&phydev->mdio.dev);
> +	if (dev)
> +		ndev_owner =3D dev->dev.parent->driver->owner;

[Severity: High]
This is a pre-existing issue, but could this code cause a NULL pointer
dereference for virtual network devices?

If dev->dev.parent is NULL (which can happen for virtual network devices)
or if dev->dev.parent->driver is NULL (such as for unbound parent devices),
dereferencing driver->owner will panic.

> +	if (ndev_owner !=3D bus->owner)
> +		module_put(bus->owner);
> +}

[ ... ]

> @@ -1890,8 +1986,8 @@ int phy_attach_direct(struct net_device *dev, struc=
t phy_device *phydev,
>  	return err;
> =20
>  error:
> -	/* phy_detach() does all of the cleanup below */
> -	phy_detach(phydev);
> +	/* cleanup without bus notification */
> +	__phy_detach(phydev, false);

[Severity: High]
This is a pre-existing issue, but does this error path inadvertently destroy
existing valid attachments?

In phy_attach_direct(), if the PHY is already attached:

	if (phydev->attached_dev) {
		dev_err(&dev->dev, "PHY already attached\n");
		err =3D -EBUSY;
		goto error;
	}

The code jumps to the error path and unconditionally dismantles the
pre-existing attachment instead of aborting the duplicate request.

Additionally, if phy_attach_direct() is called with a NULL dev (e.g. for a
standalone PHY) and the PHY is already attached, the dev_err() call above
would dereference the NULL dev pointer.

>  	return err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731061400.7830=
1-1-markus.stockhausen@gmx.de?part=3D3
