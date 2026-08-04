Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8505C38E8DC
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785864008; cv=none; b=OVt5WZNTvVWgbakBFOqp8F9IsXU46AmlUTb/fiTTqLdSu6y+JrNhdWif3hz8U/51KbA8tyFYhZHnoitCLLoJyTpQfGCLqP3nwVWqM4iVs8cfxDM9X5A33Pi9lRhh4II6I/ERgDHGA/ejxCYija4HRAoXFZVUK3EdtrdOaUsHuHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785864008; c=relaxed/simple;
	bh=057EjBptM9IyUnQ+zRIp6TPYMUIjL/6I0cb59yMk0oU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nf2FrK1FC2bL5oO0KWJWOAlOx0YFJ81xhcya9IbRbgjAvffqDFo6wuerBKdpXyDh5Vj/6HngtbowCEBMIdLUU+Fa49jsZ+lDOkUT4sle25fYbfycUMpCEnrxXPlId46xlx0t5Xwe5N/sJS1vwFz31x8dBbAgevUKt0TK1VWNoDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cgqq5Av5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cgqq5Av5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F241F000E9;
	Tue,  4 Aug 2026 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785863998;
	bh=77gEe8ycNhbQpKUDBW4nmO8Bjr8jXzTE6ee0hN2jS6s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cgqq5Av5tp72pZiRlDbW2uDZoPZsZMnQtArqDqqSzWmwTZBUnOS77xFhiwNCNUiHN
	 E16tZDNkzHvGhtZtXXezDEuUkk3/Uno7HtHfHeiC/YltSiFRgslo6PshuW8QfK5kMM
	 ooXqBnELakM0tlbiUeHAdF2ZmXG716bQsm+XwTlk/mPPpueJ5nfQxLpHKPgCr4M90H
	 mPJNAYdUyqBoPfE/hSMGClA+kWGwAnSfnZFQUcFLrGhGt9Jl4s1QyXRXvsQh9C2gN3
	 6ux7uejjRMvMLIyXIPYa42OCmt/nGABp1NsZqm85IwGo9f8tDMPw2rdWk0q2vno2nP
	 LpPUc8MOflncA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 03/11] net: phy: add
 (*notify_phy_attach/detach)() hooks to struct mii_bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803171853.507506-4-markus.stockhausen@gmx.de>
References: <20260803171853.507506-1-markus.stockhausen@gmx.de>
 <20260803171853.507506-4-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 17:19:57 +0000
Message-Id: <20260804171958.36F241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling `phy_attach_direct` on an already-attached PHY destructive=
ly tears down the existing attachment and leaks refcounts.
--

--- Patch [3]: [PATCH net-next v12 03/11] net: phy: add (*notify_phy_attach=
/detach)() hooks to struct mii_bus ---
commit f476eabef52740ac2e24b92c70182265b4497974
Author: Daniel Golle <daniel@makrotopia.org>

net: phy: add (*notify_phy_attach/detach)() hooks to struct mii_bus

This commit adds notify_phy_attach() and notify_phy_detach() hooks to the
MDIO bus driver. This allows MDIO bus drivers to handle PHY polling registe=
rs
appropriately without reinventing bus scanning. It also refactors phy_detac=
h()
into phy_detach_internal() to support symmetric notification.

[1] https://github.com/openwrt/openwrt/pull/21515#discussion_r2714069716
[2] https://lore.kernel.org/netdev/cover.1769053496.git.daniel@makrotopia.o=
rg/
[3] https://lore.kernel.org/netdev/9e40f50b-357a-4a93-9f59-94847850835d@lun=
n.ch/#t

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 94b2e85e00a37..1a43fec022aa8 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -1734,6 +1734,96 @@ static bool phy_drv_supports_irq(const struct phy_=
driver *phydrv)
>  	return phydrv->config_intr && phydrv->handle_interrupt;
>  }
> =20
> +static void phy_detach_internal(struct phy_device *phydev, bool notify_b=
us)
> +{
> +	struct net_device *dev =3D phydev->attached_dev;

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
destructively tear down the original attachment?

If phy_attach_direct() is called on a PHY that is already attached, it dete=
cts
this with:

	if (phydev->attached_dev) {
		dev_err(&dev->dev, "PHY already attached\n");
		err =3D -EBUSY;
		goto error;
	}

Because this jumps to the error label and invokes phy_detach_internal() wit=
h the
existing phydev->attached_dev, does it tear down the state of the original
network device attachment while leaving its initial refcounts leaked?

This could leave the original device with a nullified PHY pointer, potentia=
lly
crashing when accessed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803171853.5075=
06-1-markus.stockhausen@gmx.de?part=3D3
