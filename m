Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FCB370ADD
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833070; cv=none; b=lAbzBYhVHbpBPVlemySOPAR6j1wxybRH29vMhwrk6IFo8G5eChm1zrjkrtcsiwwA24Hrc2R6NdkRunoSfuXuzyoflrwJ6MKCoOP7rH41ZD39NRJp9Thait76FXkZnLvrUtV/eeC9Q+EP7bH6l/X5ry7loLGzWQz2PFm2Tp9Eh7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833070; c=relaxed/simple;
	bh=hAa4aheuZ4m3d1pqKSRmR0+0VfUdeAQzBD4vTHrRuMc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bItyphUjz4sLdw89t6tzGf5/Utezgd75XQlk4dSeSkE3w4uXjIPGH2rbny9MbCMosxCzz0UesTmaCT1pzNVTJLOqrXqPv3OE9c8zSg6sG3uVdqiCmx7zwzeSRwAAasga0P5RUpO9EZZP62SDWnD6ITo1jAnorfNSPuQ1fkCPxpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gl3HVf7s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gl3HVf7s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBD01F00A3A;
	Tue, 30 Jun 2026 15:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782833069;
	bh=dFm3ZELVmbdc9+wyTXkIsZEKn25JxBRf2DY9Cdx6pQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gl3HVf7siPkjm/yghX041jwJIfsmN9JN4H0xyhQLpkyGNxsGcEqQJJmmS4Wn+q7nO
	 RphB6dUstzUwCh7G1xaBwoFXf9EeMti0cJsBY0TmX3jdH3NOhnH+dsHSQ4xOh6TItB
	 j2uROx4wqHVCS7+UxwQSyjd3UV16W9SC1TwTBBYj1+7NrPWOKq8VzhkX+0BeGgDjKs
	 DWfcknUawXqjMO9JGTennwXtE7DVT5+BFXROeIBBM/FwZURIdVqIOGX58fdMlu406L
	 zs9GZnf0O+FSi065y69DBj4op6HIkotdljkMvp9ZsSiHavk4cgeTIFbUDEFfVdd+z6
	 OTvQEl5O+/a1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 3/8] net: phy: add
 (*notify_phy_attach/detach)() hooks to struct mii_bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260629152336.2239826-4-markus.stockhausen@gmx.de>
References: <20260629152336.2239826-1-markus.stockhausen@gmx.de>
 <20260629152336.2239826-4-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 15:24:28 +0000
Message-Id: <20260630152428.7DBD01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The `notify_phy_detach` hook can be invoked on an MDIO bus even =
if `notify_phy_attach` was never called or failed, leading to unbalanced se=
tup/teardown symmetry.

Pre-existing issues:
- [High] Calling `phy_attach_direct` on an already attached PHY returns `-E=
BUSY` but incorrectly executes the `phy_detach` error path, destroying the =
existing valid attachment.
--

commit c461faab1a569fa9ec7dc7cc9fc30615fc89408c
Author: Daniel Golle <daniel@makrotopia.org>

net: phy: add (*notify_phy_attach/detach)() hooks to struct mii_bus

Some MDIO buses require to program PHY polling registers depending on
the PHY type. Provide two simple hooks in struct mii_bus which are called
right after a PHY has been attached and just before the PHY is going to be
detached.

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
This is a pre-existing issue, but calling phy_attach_direct() on an already
attached PHY seems to tear down the existing valid attachment. Earlier in
this function:

	if (phydev->attached_dev) {
		dev_err(&dev->dev, "PHY already attached\n");
		err =3D -EBUSY;
		goto error;
	}

Jumping to the error label unconditionally executes phy_detach(), which
clears phydev->attached_dev (the original owner) and severs the
dev->phydev link.

Should this path return an error directly without calling phy_detach()?

> +	}
> +
>  	phy_resume(phydev);

[ ... ]

> @@ -1919,6 +1925,9 @@ void phy_detach(struct phy_device *phydev)
>  	struct module *ndev_owner =3D NULL;
>  	struct mii_bus *bus;
> =20
> +	if (phydev->mdio.bus->notify_phy_detach)
> +		phydev->mdio.bus->notify_phy_detach(phydev);
> +

[Severity: Medium]
Will notify_phy_detach() be invoked even if notify_phy_attach() was never
called or failed?

If phy_init_hw() or any other initialization step prior to
notify_phy_attach() fails in phy_attach_direct(), the code jumps to the
error label and calls phy_detach(), which now unconditionally executes
notify_phy_detach().

Could this lead to unbalanced setup/teardown symmetry if a bus driver
assumes notify_phy_detach() is only called after a successful
notify_phy_attach()?

>  	if (phydev->devlink) {
>  		device_link_del(phydev->devlink);
>  		phydev->devlink =3D NULL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629152336.2239=
826-1-markus.stockhausen@gmx.de?part=3D3
