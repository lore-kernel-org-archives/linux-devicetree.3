Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B913F35675F
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784787887; cv=none; b=F0ErjfE1vevWAr8cEDNc+JbjSk0c6iwp1/FDSjF3hkCwWbcmbBLtduzJRiwreJiTLZX7CVU3zMrpjHgU9Xfo0yO97fQ5PEHBToUu9yDUvXF3dOvG1nl8wO0Owrg+cT1hRJTy+JyDIDsF5GrXJv4kO4Q6pU57pVpiG+pJ6bO5XVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784787887; c=relaxed/simple;
	bh=JcoMoLE28m0l+N07HzuOuCP/2FHQ6r5ARAe6QjYHhMM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G3nlG0R5xiZFv58qxQkueTwvRMWHuRApXiRt1rBYYJgz//YX+3LTfyxSLojRgcjnioqRrjwZhAJ+voqfrW/XJg2w8rozyebIZJk3BLzh4lpu3lygE7vJeY4LygE0I2OF/qI9c/RPsnkdHlrgoTdTif1nsw6ggExR1zhdqsO8kfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWq7LF4q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWq7LF4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698D91F00A3A;
	Thu, 23 Jul 2026 06:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784787885;
	bh=QlHNrtKhg4ZNwMYMFteCxob0hNqkKbxipHSa4zp8Vk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YWq7LF4q1Ds2ZZtUgcg+k9Hn8CbQrnsuttNM9BYXCDs43x/uS5ojKZDKgVw5lSpqD
	 4acSBOS5WlVOILguSDYGD9rAZQdnYFBQgah/bHO/MBPxjMPpBq0GAW2YbmspYIVynn
	 lPPFwk/tgu0yaznSOmPmVr+Iijm/CRGSC8Y7qiQnE90iq1xdTy5cnsUcmlRMYeEF4t
	 N5j9KlQXT2ZsS/Linnp5d0nt5YLa/l6Mo1J6ZI26IhWHyjeLNw+5ABizXL//ml7myq
	 6CT+wIPHQg9as6cXL8mgfsC6DFvwz/Du3LGqcfsi/FAeLiKsK+hwYbpbC3xt11Z8Ma
	 Qt9PEI8pYUwUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 3/8] net: phy: add
 (*notify_phy_attach/detach)() hooks to struct mii_bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722062356.12291-4-markus.stockhausen@gmx.de>
References: <20260722062356.12291-1-markus.stockhausen@gmx.de>
 <20260722062356.12291-4-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 06:24:44 +0000
Message-Id: <20260723062445.698D91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Inverted resource teardown order in `phy_detach` causes LIFO viola=
tion.

Pre-existing issues:
- [High] `phy_attach_direct` destroys pre-existing attachments when returni=
ng -EBUSY.
--

--- Patch [3]: [PATCH net-next v5 3/8] net: phy: add (*notify_phy_attach/de=
tach)() hooks to struct mii_bus ---
commit 2e5a68c82441635d018ad6986569eeead2f1a154
Author: Daniel Golle <daniel@makrotopia.org>

net: phy: add (*notify_phy_attach/detach)() hooks to struct mii_bus

Some MDIO buses require to program PHY polling registers depending on
the PHY type. This adds two simple hooks in struct mii_bus which are
called right after a PHY has been attached and just before it is
going to be detached.

Link: https://github.com/openwrt/openwrt/pull/21515#discussion_r2714069716
Link: https://lore.kernel.org/netdev/cover.1769053496.git.daniel@makrotopia=
.org/

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 94b2e85e00a37..a62c2ff6c2aab 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -1876,6 +1876,13 @@ int phy_attach_direct(struct net_device *dev, stru=
ct phy_device *phydev,
>  	if (err)
>  		goto error;
> =20
> +	if (phydev->mdio.bus->notify_phy_attach) {
> +		err =3D phydev->mdio.bus->notify_phy_attach(phydev);
> +		if (err)
> +			goto error;

[Severity: High]
This is a pre-existing issue, but does jumping to the error label in this
function cause problems for already attached PHYs?

Earlier in phy_attach_direct(), if a second device attempts to attach to a
PHY that is already attached, it detects this (phydev->attached_dev is set),
sets err =3D -EBUSY, and jumps to the error label.

The error block then calls phy_detach(phydev), which tears down the fully
established attachment. This forcefully clears phydev->attached_dev and
removes the PHY from the original owner without its knowledge.

When the original owner later interacts with the PHY or tries to tear it do=
wn,
could it encounter a dangling pointer or mismatched refcounts?

> +		phydev->mdio_bus_notified =3D true;
> +	}
> +
>  	phy_resume(phydev);

[ ... ]

> @@ -1919,6 +1926,10 @@ void phy_detach(struct phy_device *phydev)
>  	struct module *ndev_owner =3D NULL;
>  	struct mii_bus *bus;
> =20
> +	if (phydev->mdio_bus_notified && phydev->mdio.bus->notify_phy_detach)
> +		phydev->mdio.bus->notify_phy_detach(phydev);
> +	phydev->mdio_bus_notified =3D false;
> +

[Severity: High]
Does this tear down sequence violate LIFO order?

In phy_attach_direct(), the setup sequence calls notify_phy_attach() before
phy_resume() and device_link_add().

To follow strict LIFO teardown, shouldn't phy_detach() call device_link_del=
()
and phy_suspend() before notify_phy_detach()?

If an MDIO bus driver disables resources (like power, clocks, or polling) in
the detach hook, the subsequent call to phy_suspend() could attempt to issue
MDIO commands to an unconfigured bus, potentially leading to bus timeouts or
hangs.

>  	if (phydev->devlink) {
>  		device_link_del(phydev->devlink);
>  		phydev->devlink =3D NULL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722062356.1229=
1-1-markus.stockhausen@gmx.de?part=3D3
