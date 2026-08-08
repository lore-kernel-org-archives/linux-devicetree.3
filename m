Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D516382374
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 17:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786209149; cv=none; b=dez9xWrnWOQKKHcwzm0Gfu86Mb1+u2ZQBra1YHcV6aufEl6tB3eI103BC4YM0kSLdvf1km8p7hxeDYiarAL3fDlgDlBXUFrJPKi4gXFqD0AToxRmEhJTPIY/MEx9d7ekjeCDssrhg12rIsAjJK/CTbwtm9XgQ4ZsLmYuJj94dkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786209149; c=relaxed/simple;
	bh=q+FflfP0vfOh912D4DhXMQKvvnjgrBzVmKHYyy/aIOY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TJSmNLjLe0TMVAC0Tq0p5T4HLonRCaiH9+KBQrjEP4mtaI6BtSKqc0Og/6KOK1ZZQeBn4rH8kQSc1Bavmo8YxToiRwTAGJKk852UJkj57drhnVxKxdH3J/dvZ3dkrgXI1EKaa3YI4JkqyU0ie6qx8uXyGpTEKq0X2ja4UWgqzBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TP9Kco29; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TP9Kco29"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C43B1F00A3A;
	Sat,  8 Aug 2026 17:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786209148;
	bh=eXHtXxevkKtzfSnLAJy6Lv1Iz5wZJqEI0p8KbPKLy4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TP9Kco29FUjgEcNbrD3PlU7P4sZT1GTdrVI5/rUnKvyG08V532GQvqJFcpbskGpT+
	 E1upJOlrzlwgZaPbYq4d9eEuirG0Dxf1vjGjDYY3dh1InTQYQtLKwYR3FKqXvVqODg
	 hqMkywxkfmeqXI/ZcqOhM75RNr9o/G52FI+L1AFVUVcTOB5JJApF18Iz7y81riYSdP
	 LAfWgp6DXIDX8xX2IDeyPpmAK9Kyn/qyz1aB4+3ILzsw0njZbDvRSQgxXFDv5JOA5o
	 flzoF862D7NQGC1WoYsUjKVz3lYQBHxQt49gH7sW87D2JlwxHlZ0c1dJmH1n46m9OH
	 cKRpXzTNyGdGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 03/11] net: phy: add
 (*notify_phy_attach/detach)() hooks to struct mii_bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807171058.522833-4-markus.stockhausen@gmx.de>
References: <20260807171058.522833-1-markus.stockhausen@gmx.de>
 <20260807171058.522833-4-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 17:12:26 +0000
Message-Id: <20260808171227.7C43B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling `phy_attach_direct` on an already-attached PHY destructive=
ly tears down the existing attachment, leading to kernel panics and leaks.
--

--- Patch [3]: [PATCH net-next v13 03/11] net: phy: add (*notify_phy_attach=
/detach)() hooks to struct mii_bus ---
commit 379fa8ff9ef6381f09ee11a0d7f1d071da53e6f0
Author: Daniel Golle <daniel@makrotopia.org>

net: phy: add (*notify_phy_attach/detach)() hooks to struct mii_bus

This commit adds notify_phy_attach and notify_phy_detach hooks to the MDIO
bus to inform the driver when a PHY is being attached or detached. This avo=
ids
reinventing bus scanning to determine PHYs and anticipates the right point =
in
time for operations like programming PHY polling registers.

Link: https://github.com/openwrt/openwrt/pull/21515#discussion_r2714069716
Link: https://lore.kernel.org/netdev/cover.1769053496.git.daniel@makrotopia=
.org/
Link: https://lore.kernel.org/netdev/9e40f50b-357a-4a93-9f59-94847850835d@l=
unn.ch/#t

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 94b2e85e00a37..1a43fec022aa8 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c

[ ... ]

> @@ -1890,8 +1986,8 @@ int phy_attach_direct(struct net_device *dev, struc=
t phy_device *phydev,
>  	return err;
> =20
>  error:
> -	/* phy_detach() does all of the cleanup below */
> -	phy_detach(phydev);
> +	/* cleanup without bus notification */
> +	phy_detach_internal(phydev, false);
>  	return err;

[Severity: High]
This is a pre-existing issue, but does calling phy_detach_internal() here
destructively tear down the existing, valid attachment if the PHY is already
attached?

If a second caller attempts to attach an already-attached PHY, the check
earlier in phy_attach_direct() jumps to this error label:

    if (phydev->attached_dev) {
            dev_err(&dev->dev, "PHY already attached\n");
            err =3D -EBUSY;
            goto error;
    }

The error path then calls phy_detach_internal(phydev, false). Looking at
phy_detach_internal(), it clears the original owner's state unconditionally:

    if (dev) {
            ...
            phydev->attached_dev->phydev =3D NULL;
            phydev->attached_dev =3D NULL;
            phy_link_topo_del_phy(dev, phydev);
    }

If the first MAC later dereferences its PHY pointer, could this lead to a
kernel panic? Because the first MAC's attachment state is broken, its own
teardown might also be skipped, potentially leaking device and module
references.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807171058.5228=
33-1-markus.stockhausen@gmx.de?part=3D3
