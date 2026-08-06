Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7900478E57
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 17:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786038574; cv=none; b=u5xqprs9OZUnV0GmVRDHH7zfHxTxWNoSXRGhyPZPGV93Iypmq0Nnq3IbNMiR2RzX5NUaSPMnHpoFgLS8gR00PJFO2jreEdH6ZBKtVsjPLko+IvXjtGTwFQrY8OSQbmNRQtG27kUyXA2Fxu6LqjijuudEjMbarWCoVXE5Wb8OkQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786038574; c=relaxed/simple;
	bh=l+QtRzirxhSKQi9JRwL927V825rq33/TqJzxR3vVw3o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NhNW+q1j7BUCn3EaAUSmYefQnfTpcctLsbu7UbaoOEbk975x0b1eKYENsdl/PFGrWuj5LL/r7J7UPpjhobv7IJ9bMnYGvArZhAqbU4EAz21vnSZ4aucSbiDm6InzxrQnW6TbWen8paFwyGJ4OCRN/fWBGAV5zoa2qVGm8OTGvwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHOt2zF7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHOt2zF7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BAB1F000E9;
	Thu,  6 Aug 2026 17:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786038571;
	bh=rZ7UpJfFPhqJdjSlA/+ctiH6K3d08YTvVOJrVkKPuUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kHOt2zF7XEobWzWiVOZcwkcFjr7kdLu7pGuu23x/M2cOnVpAvSsPuYX/WL/kxGDBk
	 IlcfEdarAIrudEIp6VZX7a26Z+6ZcCJSwrSJzjY0KD/SKqw7srj5XshrTdvFP8EkNo
	 8H+LsR1nVexfB8gxUheMDitTwz7enYoAAmVUsvDF7b6sR3pIcwPEdTY3GxrV+feNV4
	 bptwo6Hv01T/MCI8NhmhhrgbZtkHJGScDeTpZJT6QAjk36Av184N4D6AD6L+SFual1
	 Kky4f5QCdVzovKTsj2PSimhM9a4yjAjtnGomwa/Ps2eIodCwvnqdTqeJ3EYR10EiEu
	 Swdm6vcYR20lQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 3/4] net: mdio: make device map changes
 hotplug-safe
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260805-submit-mdio-of-dynamic-v2-v3-3-16f3cc893b0e@gmail.com>
References: <20260805-submit-mdio-of-dynamic-v2-v3-0-16f3cc893b0e@gmail.com>
 <20260805-submit-mdio-of-dynamic-v2-v3-3-16f3cc893b0e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 17:49:30 +0000
Message-Id: <20260806174931.51BAB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Race condition in `phy_claim()` causes concurrent MAC driver probe=
s to fail with `-ENODEV` when attaching to a PHY.
- [Medium] Unbounded memory leak of dynamically removed PHY devices due to =
intentional pinning in `mdio_map_retired_phys`.

Pre-existing issues:
- [High] Missing NULL pointer check for `mdiobus_get_phy()` in `vsc8584_bas=
e_priv()` leads to kernel panic.
--

--- Patch [3]: [PATCH net-next v3 3/4] net: mdio: make device map changes h=
otplug-safe ---
commit d8ecb0a89add88ea9e28273a5be54ac5e3624bc8
Author: James Hilliard <james.hilliard1@gmail.com>

    net: mdio: make device map changes hotplug-safe
   =20
    MDIO device registration currently publishes directly into mdio_map
    without serializing address ownership, and removal frees the object
    immediately. That is sufficient while bus population is static, but
    dynamic firmware changes can race registration, PHY attachment and bus
    teardown. It also cannot safely preserve mdiobus_get_phy()'s
    borrowed-pointer convention.

> diff --git a/drivers/net/phy/mdio_device.c b/drivers/net/phy/mdio_device.c
> --- a/drivers/net/phy/mdio_device.c
> +++ b/drivers/net/phy/mdio_device.c

[ ... ]

> +int mdiobus_begin_remove(struct mdio_device *mdiodev, bool dynamic)
> +{
> +	struct mii_bus *bus =3D mdiodev->bus;
> +	struct phy_device *phydev =3D NULL;
> +	int err =3D 0;

[ ... ]

> +	if (dynamic && mdiodev->flags & MDIO_DEVICE_FLAG_PHY) {
> +		mdio_device_get(mdiodev);
> +		list_add_tail(&phydev->retired_node,
> +			      &bus->mdio_map_retired_phys);
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&bus->mdio_map_lock);
> +	return err;
> +}

[Severity: Medium]
Will this cause an unbounded memory leak if PHYs are dynamically added and
removed continuously?

When a PHY is dynamically removed, mdiobus_begin_remove() takes a reference
and adds the device to the mdio_map_retired_phys list. These pinned devices
are intentionally never freed until mdiobus_remove_devices() runs during the
teardown of the entire parent MDIO bus. Continuous application and removal =
of
device tree overlays could exhaust memory over time.

> diff --git a/drivers/net/phy/mscc/mscc_ptp.c b/drivers/net/phy/mscc/mscc_=
ptp.c
> --- a/drivers/net/phy/mscc/mscc_ptp.c
> +++ b/drivers/net/phy/mscc/mscc_ptp.c
> @@ -1279,10 +1279,8 @@ static struct vsc8531_private *vsc8584_base_priv(s=
truct phy_device *phydev)
>  	struct vsc8531_private *vsc8531 =3D phydev->priv;
> =20
>  	if (vsc8531->ts_base_addr !=3D phydev->mdio.addr) {
> -		struct mdio_device *dev;
> -
> -		dev =3D phydev->mdio.bus->mdio_map[vsc8531->ts_base_addr];
> -		phydev =3D container_of(dev, struct phy_device, mdio);
> +		phydev =3D mdiobus_get_phy(phydev->mdio.bus,
> +					 vsc8531->ts_base_addr);
> =20
>  		return phydev->priv;

[Severity: High]
This isn't a bug introduced by this patch, but could this result in a kernel
panic if the base PHY fails to initialize?

If the base PHY does not successfully initialize during MDIO bus scanning
(e.g., due to a hardware fault), mdiobus_get_phy() will return NULL. The
subsequent direct dereference of phydev->priv will crash.

>  	}
> =20
>  	return vsc8531;
>  }

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c

[ ... ]

> @@ -1121,25 +1124,40 @@ int phy_device_register(struct phy_device *phydev)
>  	err =3D phy_scan_fixups(phydev);
>  	if (err) {
>  		phydev_err(phydev, "failed to initialize\n");
> -		goto out;
> +		return mdiobus_registration_done(&phydev->mdio, err);
>  	}
> =20
>  	err =3D device_add(&phydev->mdio.dev);
> -	if (err) {
> +	if (err)
>  		phydev_err(phydev, "failed to add\n");
> -		goto out;
> -	}
> =20
> -	return 0;
> +	return mdiobus_registration_done(&phydev->mdio, err);
>  }

[ ... ]

> +static int phy_claim(struct phy_device *phydev)
> +{
> +	struct mdio_device *mdiodev =3D &phydev->mdio;
> +	struct mii_bus *bus =3D mdiodev->bus;
> +	int err =3D 0;
> +
> +	mutex_lock(&bus->mdio_map_lock);
> +	if (bus->state !=3D MDIOBUS_REGISTERED ||
> +	    bus->mdio_map_removing ||
> +	    bus->mdio_map[mdiodev->addr] !=3D mdiodev ||
> +	    (bus->mdio_map_pending & BIT(mdiodev->addr)))
> +		err =3D -ENODEV;

[Severity: High]
Is it possible for a MAC driver probe to race with
mdiobus_registration_done() and fail permanently with -ENODEV?

In phy_device_register(), device_add() is called before
mdiobus_registration_done() completes the publication. Once device_add() is
called, the PHY becomes visible in the driver core's bus lists.

If a MAC driver concurrently probes the bus and finds the PHY, it will
attempt to attach. However, since mdiobus_registration_done() hasn't
executed yet, mdio_map_pending is still set for this address. The phy_claim=
()
check above will reject the valid attachment attempt with -ENODEV, causing
the MAC driver probe to permanently fail rather than deferring.

> +	else if (phydev->attached)
> +		err =3D -EBUSY;
> +	else
> +		phydev->attached =3D true;
> +	mutex_unlock(&bus->mdio_map_lock);
> +
> +	return err;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-submit-mdi=
o-of-dynamic-v2-v3-0-16f3cc893b0e@gmail.com?part=3D3
