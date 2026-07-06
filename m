Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0524229C5
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783355789; cv=none; b=hbBI53l4K32loXjiftAk5IfUHTGobbX613nP3Kj/5Y5QXsUYR5m4katF9+dHgp+uPurlpWW55Lv3/yEJjEqIQIV7zP/oec5yx7n/InXAzKuQ6JzJkNo6Nrcmk5FrXsaMmvdHN2tUFH33nAJRbRQCboWSW2xfw2mduhvMYtD4ZAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783355789; c=relaxed/simple;
	bh=9m0p15zWci7VigIuKMnwvkyPPHkcD1Xqc2ff1CI5D8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pfFyiEOi7ZSr6Y6Gn7pLM5LKzFTYhYZECGFu+qEOYc83W2QKDUdUIU17QxHkFRLEmQFuhHs0TaVilGjTzDXZpuU0fEYtA5/Tku4hpYa3pmmieD3ObchrT31voEQ/afV3zcXi2Q2+lmAUTfPk79Pv71Jw/BwTSntrXjgBryFh9Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnEXEiqi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnEXEiqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22DC1F000E9;
	Mon,  6 Jul 2026 16:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783355787;
	bh=rD4OWbGHtlYw2ul6Bv/aQU2wFe++rldArluDv4+UDg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JnEXEiqiuFFrFSRn/ha0QhFU9cv3nrRWKN3cQUN84UpMvx0RgNfzTbBDDywMProiv
	 FhrfOjr2yKZFXul0lmqohncbg2Y+cIoYSB9b0jkeW1F+AxUHX4XgXnUZY3k+BSF8p1
	 m1Ik0yx4XNg/jxlguVSYgMtTMd4zqd+Zk0i3tgjyblxsPxuoXaZ5FFl8IJZAuITV4I
	 tfQY1CVEaMT5b68Vusl7sfqklBlQl4iPKOuACG9TEAWSlGltKQZ+xEOppr2XuGATzH
	 RUR8U6vgDpUulfjzCe0XgtEcI8FrdPXxBlUuisTj3nu7HA7F/Em5c4Z4Br05fkIYM0
	 BOH1xzpzD8mNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 3/8] net: phy: add
 (*notify_phy_attach/detach)() hooks to struct mii_bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260705163532.2853959-4-markus.stockhausen@gmx.de>
References: <20260705163532.2853959-1-markus.stockhausen@gmx.de>
 <20260705163532.2853959-4-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 16:36:27 +0000
Message-Id: <20260706163627.A22DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The newly added `notify_phy_detach` callback is invoked uncondit=
ionally during `phy_detach()`, violating attach/detach symmetry if attachme=
nt fails.

Pre-existing issues:
- [High] Calling `phy_attach_direct` on an already-attached PHY destructive=
ly removes its existing attachment.
--

commit 43b033c0e004225e5826f1197f795406afea2c07
Author: Daniel Golle <daniel@makrotopia.org>

net: phy: add (*notify_phy_attach/detach)() hooks to struct mii_bus

This commit adds notify_phy_attach and notify_phy_detach hooks to
struct mii_bus. This allows MDIO bus drivers to handle PHY-specific
initialization and teardown without duplicating bus scanning logic.

Link: https://github.com/openwrt/openwrt/pull/21515#discussion_r2714069716
Link: https://lore.kernel.org/netdev/cover.1769053496.git.daniel@makrotopia=
.org/

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 0615228459ef4..676cbf183350d 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -1876,6 +1876,12 @@ int phy_attach_direct(struct net_device *dev, stru=
ct phy_device *phydev,
>  	if (err)
>  		goto error;
> =20
> +	if (phydev->mdio.bus->notify_phy_attach) {
> +		err =3D phydev->mdio.bus->notify_phy_attach(phydev);
> +		if (err)
> +			goto error;

[Severity: High]
This is a pre-existing issue, but does jumping to the error label
destructively tear down valid state if the PHY was already attached?

If phy_attach_direct() is mistakenly called on a PHY that is already
attached, it correctly catches it here:

phy_attach_direct() {
    ...
    if (phydev->attached_dev) {
        dev_err(&dev->dev, "PHY already attached\n");
        err =3D -EBUSY;
        goto error;
    }
    ...
}

However, by jumping to the error label, it calls phy_detach(). Since
phy_detach() unconditionally removes sysfs links, unbinds the PHY, and
clears phydev->attached_dev, won't this tear down the pre-existing
attachment and leave the original caller with dangling references?

> +	}
> +
>  	phy_resume(phydev);
> =20

[ ... ]

> @@ -1919,6 +1925,9 @@ void phy_detach(struct phy_device *phydev)
>  	struct module *ndev_owner =3D NULL;
>  	struct mii_bus *bus;
> =20
> +	if (phydev->mdio.bus->notify_phy_detach)
> +		phydev->mdio.bus->notify_phy_detach(phydev);
> +

[Severity: Medium]
Will this result in asymmetric attach/detach notifications on error paths?

If phy_init_hw() fails earlier in phy_attach_direct(), or if this new
notify_phy_attach callback itself fails, the code jumps to the error
label and calls phy_detach().

Because phy_detach() unconditionally calls notify_phy_detach(), won't
the bus driver receive a detach notification for a PHY that was never
successfully attached?

If future bus drivers rely on these callbacks to allocate resources or
increment reference counts, could this cause double-frees or underflows?

>  	if (phydev->devlink) {
>  		device_link_del(phydev->devlink);
>  		phydev->devlink =3D NULL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705163532.2853=
959-1-markus.stockhausen@gmx.de?part=3D3
