Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1A53A48ED
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665770; cv=none; b=a/+/Wmc/19xCoNT2UOQRvFtXYw14eNz8637AfBaguPU3B+UZyGNJVMx6X4wnLA4w1c20rJrdzF8YjMMctGZs6xfgGExxKoIrSwuAh06COiGSOhJZgS4B3WDz1GTOGfAm4747FuWGAezSsjWJF+Caf2W5Kdv0bjHFjUUbNW1gOUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665770; c=relaxed/simple;
	bh=B8CIc9IIjmwSAUTMlj4E2gYzVAuJsqIe9Vwkh5ILfZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tIo+aoMZwF/JVLKxuG2PlCyvwTcb3eZ3Za0YB8BHCmwhdFkZPtGPCwFvr6M/hI+bWjbxwwY2hks4rcALaLEjXaFScCp0vqYzX9rvZK84p4APErDN3bBLl19+PXIYov/GMaOzColSXR8UW30EMzM3+Hj4mWiLRG5j3DePetlmJJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdoON+KV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdoON+KV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CC71F00A3A;
	Fri, 10 Jul 2026 06:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783665769;
	bh=LrQtp1UthSnQzI4eCCBcQmdiU3dPqGhn5J1BsdTUkN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZdoON+KV9Bj/813uPxvDXYstAD/ro5Z826+vN3m9C6P8h4/MXQX/r2RLM/n9EGk59
	 yKu5/dAlv5321P2ZNovlm95osFjzgHxC/YYvradLR5YMkHk8g1ZJNJAP5j/No/vwx3
	 4effJ5Qh20tP1tEFfL4TRZMZ3CY4817mFZbZKqOwPbvCmV3PSLxoFk0uL6zKrA8Q4V
	 XhOVZEt3e2nALrmLEFyMxpkfZcX71rlGeBXyc00fC6Zfq6Z1J4M4hxvPOz3ESsgkaB
	 vyM//BArEx+mcfUSsz3/p3zIkQYez/iD8AagMeRHLSF5oKmBCAGCHO9ao6rOUYU9DC
	 hAXsbQRUvXssg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 3/8] net: phy: add
 (*notify_phy_attach/detach)() hooks to struct mii_bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709064157.2865063-4-markus.stockhausen@gmx.de>
References: <20260709064157.2865063-1-markus.stockhausen@gmx.de>
 <20260709064157.2865063-4-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 06:42:48 +0000
Message-Id: <20260710064248.E5CC71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The notify_phy_detach hook is called unconditionally in phy_detach=
(), even if notify_phy_attach() was never called or previously failed.

Pre-existing issues:
- [High] phy_attach_direct() incorrectly tears down existing legitimate PHY=
 attachments when returning -EBUSY.
--

--- Patch [3]: [PATCH net-next v4 3/8] net: phy: add (*notify_phy_attach/de=
tach)() hooks to struct mii_bus ---
commit 18f2ffc9e99b8190c4b5f1090de719a18f114275
Author: Daniel Golle <daniel@makrotopia.org>

net: phy: add (*notify_phy_attach/detach)() hooks to struct mii_bus

This commit introduces notify_phy_attach and notify_phy_detach hooks to
struct mii_bus. These hooks allow the MDIO bus driver to perform
initialization and teardown steps when a PHY is attached or detached.

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
This is a pre-existing issue, but I noticed something about the error
handling here and earlier in the function.

If phy_attach_direct() detects the PHY is already attached:

	if (phydev->attached_dev) {
		dev_err(&dev->dev, "PHY already attached\n");
		err =3D -EBUSY;
		goto error;
	}

The error label unconditionally calls phy_detach().

Will this tear down the active, legitimate attachment state of the original
owner instead of just aborting the current failed attach attempt?

> +	}
> +
>  	phy_resume(phydev);
> =20
>  	/**
> @@ -1919,6 +1925,9 @@ void phy_detach(struct phy_device *phydev)
>  	struct module *ndev_owner =3D NULL;
>  	struct mii_bus *bus;
> =20
> +	if (phydev->mdio.bus->notify_phy_detach)
> +		phydev->mdio.bus->notify_phy_detach(phydev);
> +

[Severity: High]
If phy_attach_direct() fails early and jumps to the error label, it calls
phy_detach(), which completely bypasses notify_phy_attach() but
unconditionally invokes notify_phy_detach().

It also appears that if notify_phy_attach() itself returns an error,
phy_detach() will be called immediately.

Could this cause MDIO bus drivers to receive unbalanced detach events for a
PHY that was never successfully attached? Might this lead to NULL pointer
dereferences or double frees if the bus driver relies on the attach hook
to initialize state?

>  	if (phydev->devlink) {
>  		device_link_del(phydev->devlink);
>  		phydev->devlink =3D NULL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709064157.2865=
063-1-markus.stockhausen@gmx.de?part=3D3
