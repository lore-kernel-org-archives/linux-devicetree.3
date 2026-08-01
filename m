Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247F732A3FE
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 06:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785564892; cv=none; b=LVdgAFnE0CZqlO/lM/og0eUANhunfF3jgWXdr/LGRDA3ehDbU7Xu79XC1TCklKFYWdUvx728V1rHomcBBu6ZH6Ijk7QKq8wMWxWmfCjAbRww6IZgd4pHqEDE+gBPiPZdmHyeIYZ1m/b8GkMLQ/KJ4zl3+eCoHAaHAgF9pB2ZUdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785564892; c=relaxed/simple;
	bh=49vV6Czrb5L9TMvN9r5wfjQsNoVVbHTTuFRmR2SyssA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qcc0trjTdCSJX7OAhQzHMErqfZi6rgrpiBTd1Yb8XjHK3d6vxZlY1U6Ig7TixtMK5GRd6lMaAuxEq18Z+pGLNwm5avY7bTALzfvk15wCHIMPKdY2k22Ewb0uvMJB5lHWou8h/AnzxPtCB5nZJi4gAUp7fgA9PTgSRHGJJ7W6MRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SiYHQT9i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiYHQT9i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9F91F00ACA;
	Sat,  1 Aug 2026 06:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785564890;
	bh=N9uOa+2K+PoStXjPQJssi2isU2LLgJSralAcNMFoEI0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SiYHQT9i2A6sJSgvRdxar9wuICMbMTpcy8H8OpjmArhv/+zzLScOtELIUTkNjbX7F
	 X6gfLo6iepNyJfaYeiUyZ3jgZbHIzFodqRlIfzdPFLYruEC9ew+YCnt2P/0/Bbk7ps
	 7AM4YW6NQWcePhbsfGd6skSqM9a2UU8ImZqWbGuEnVzy0fw4NLDSk7gAC+PBErYdk/
	 +NUqhkmrQSFY8/Q+dcCb5WUjIJrhdZRla8DbAeWm9QdSD3Xh9xuDmd3WzIrUfDxXxo
	 GxmBSY1iP7upWi+8vVHkUryHo9aarqmEzoSnxDJongefNR5oRSOMhUcZd+AgxZlMRC
	 3rSLfTgS1Ptjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 04/10] net: mdio: realtek-rtl9300: extend
 controller structure lifetime
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731061400.78301-5-markus.stockhausen@gmx.de>
References: <20260731061400.78301-1-markus.stockhausen@gmx.de>
 <20260731061400.78301-5-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 06:14:50 +0000
Message-Id: <20260801061450.8C9F91F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Use-After-Free in error path when `devm_add_action_or_reset` fails.
- [High] The patch fails its objective because devres on `bus->dev` execute=
s synchronously during unregistration, leaving the original UAF unfixed.
--

--- Patch [4]: [PATCH net-next v10 04/10] net: mdio: realtek-rtl9300: exten=
d controller structure lifetime ---
commit a4fb5c9c89a12fe9697736a00e823a9f53ad38ca
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: extend controller structure lifetime
   =20
Currently, the driver allocates the otto_emdio_priv structure using
devm_kzalloc(), tightly coupling its lifetime to the platform device.
Additionally the driver registers up to four MDIO buses. During unbind
or removal the devm teardown process might free the controller private
data before the MDIO buses are fully unregistered. This can lead to a
use-after-free if the MDIO subsystem accesses bus-specific operations
(which rely on controller->priv) during the teardown phase.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 73ac5fdcd2674..7dcfb72ed8188 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
[ ... ]
> @@ -621,6 +638,11 @@ static int otto_emdio_probe_one(struct device *dev, =
struct otto_emdio_priv *priv
>  	if (err)
>  		return dev_err_probe(dev, err, "cannot register MDIO bus\n");
> =20
> +	kref_get(&priv->kref);
> +	err =3D devm_add_action_or_reset(&bus->dev, otto_emdio_cleanup_bus, pri=
v);

[Severity: High]
Does registering this devm action on bus->dev defeat the purpose of the
kref decoupling?

The commit message states the goal is to decouple the lifetime of the priva=
te
data and free it after the final reference has been removed. However, devres
actions attached to a device are flushed synchronously inside device_del(),
not when the final reference is dropped via device_release().

Because mdiobus_unregister() calls device_del(), the devres action is flush=
ed
synchronously during unregistration, dropping the kref exactly as it was
before this patch. If an external entity holds a reference to the bus and
accesses it after unregistration, won't it still hit a use-after-free on the
freed priv?

> +	if (err)
> +		return dev_err_probe(dev, err, "cannot register cleanup action\n");
> +
>  	return 0;
>  }
[ ... ]
> @@ -731,44 +753,54 @@ static int otto_emdio_probe(struct platform_device =
*pdev)
[ ... ]
>  	device_for_each_child_node_scoped(dev, child) {
>  		err =3D otto_emdio_probe_one(dev, priv, child);
>  		if (err)
> -			return err;
> +			goto err_out;
> +		buses_registered++;
>  	}
> =20
> -	return 0;
> +	if (!buses_registered)
> +		err =3D dev_err_probe(dev, -ENODEV, "no MDIO buses registered\n");
> +err_out:
> +	kref_put(&priv->kref, otto_emdio_cleanup_controller);

[Severity: High]
If devm_add_action_or_reset() fails in otto_emdio_probe_one(), will this
cause a use-after-free during error unwinding?

When devm_add_action_or_reset() fails, it executes the callback immediately,
dropping the acquired kref. The probe function then returns an error, which
causes otto_emdio_probe() to jump here and drop the initial kref.

Since the refcount hits 0, priv is freed. However, the bus was just
registered successfully prior to the failure. The devres unwinding will
subsequently unregister the bus via mdiobus_unregister(). If any PHY teardo=
wn
logic accesses the MDIO bus during unregistration, it will invoke bus->write
(otto_emdio_write_c22), which accesses the already-freed priv->lock.

> +
> +	return err;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731061400.7830=
1-1-markus.stockhausen@gmx.de?part=3D4
