Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325E947ACF7
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 16:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070450; cv=none; b=liFxfe3Jf1Rm/A5luqIcDLmaH2u5UlPYRHMylMKvI0hndBRfGT+RWD6kTaK9VdAAnYJdBVDUg6dJSYvBN7/u1qQMxOd0kZFEVhrUycJNSyr9IMza3J2BpSGJCu0NN+7Fs6zurrOTD29SjqO4F1iUyQLv0jGaDuUIi/F7gDxz2Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070450; c=relaxed/simple;
	bh=Jjp+6mUGNlrMHPyFLwXFoz5nt+sYNpMEnQmpxWxEatY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gQc3yAa5hLfS6ImOiHvwb+hmsLZN6Tg9+MKhvayUZum28im6rd0ZTo5hJJud4SIS+IorwaxL1TUDHF7AsaM6XuLJlGCM33oMYLg7Vwo+A0RfIEszOHE4quynVb6rl0HuodTcRyK0oWEsd2YS5tMyv4UqhLDHnq918a/fN+FMvis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tc+vqzuV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tc+vqzuV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1141F00A3E;
	Tue, 18 Aug 2026 16:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787070449;
	bh=xeyy0Az7g5+iEOjzyawMBEN8I9CftlyVSidDG/pM6vg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tc+vqzuV6/QaNrPNuPhnZaGVQT1ZcmbJljnlqg4HcsYQia0PbL3gly+fgAT131ujl
	 1bNPp9ZsZrJXLnXxZhyoEXMXwhBFlmbAWIkGPAPqMxxTRDT71ObyKZPw6o9q3eJoNI
	 81UzzvtAquDulp9pgB8Yoqfdh1uqB2Q+i/nO9QTM95udXGKX5ItxF/TBkwnTWdWz7D
	 np0TWEoq9SPoYeP8Veb4/pQeo+qA4NGGHUo5fwouc44UW2TEhZwXod1VHSZ1dM2Inf
	 pM4pRcHW+tIJxFbZlE6DRqF8PN5njyje5H3jQX23jZgUGDJe2Scv1TQiayncb46Jof
	 b66GOxq9vrmZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v14 10/13] net: mdio: realtek-rtl9300: Open up
 C22 and C45 space in parallel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817162632.1208891-11-markus.stockhausen@gmx.de>
References: <20260817162632.1208891-1-markus.stockhausen@gmx.de>
 <20260817162632.1208891-11-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 16:27:28 +0000
Message-Id: <20260818162728.DA1141F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The MDIO read/write functions return `-ENOENT` for unmapped PHY ad=
dresses and `-ENXIO` on hardware command failure, which improperly aborts t=
he entire MDIO bus registration.
--

--- Patch [10]: [PATCH net-next v14 10/13] net: mdio: realtek-rtl9300: Open=
 up C22 and C45 space in parallel ---
commit c559542aa88ff474f3367ec89a5df414f866718f
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Open up C22 and C45 space in parallel

This commit enables parallel C22 and C45 access for the Realtek RTL9300 MDIO
driver. It does this by unconditionally assigning both the C22 and C45 read
and write bus operations during probe.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index f3777c61705aa..c417a2e3d613d 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
[ ... ]
> @@ -683,13 +683,10 @@ static int otto_emdio_probe_one(struct device *dev,=
 struct otto_emdio_priv *priv
>  		return -ENOMEM;
> =20
>  	bus->name =3D "Realtek Switch MDIO Bus";
> -	if (priv->smi_bus_is_c45[mdio_bus]) {
> -		bus->read_c45 =3D otto_emdio_read_c45;
> -		bus->write_c45 =3D otto_emdio_write_c45;
> -	} else {
> -		bus->read =3D otto_emdio_read_c22;
> -		bus->write =3D otto_emdio_write_c22;
> -	}
> +	bus->read_c45 =3D otto_emdio_read_c45;
> +	bus->write_c45 =3D otto_emdio_write_c45;
> +	bus->read =3D otto_emdio_read_c22;
> +	bus->write =3D otto_emdio_write_c22;

[Severity: High]
This is a pre-existing issue, but does the MDIO read/write implementation
improperly abort the entire MDIO bus registration when encountering unmapped
PHY addresses or hardware command failures?

Looking at otto_emdio_phy_to_port(), if a PHY address isn't mapped, it retu=
rns
-ENOENT:

drivers/net/mdio/mdio-realtek-rtl9300.c:otto_emdio_phy_to_port() {
    ...
    for_each_set_bit(i, priv->valid_ports, priv->info->num_ports)
        if (priv->smi_bus[i] =3D=3D chan->mdio_bus &&
            priv->smi_addr[i] =3D=3D phy_id)
            return i;

    return -ENOENT;
}

Similarly, if a hardware timeout occurs, otto_emdio_run_cmd() returns -ENXI=
O:

drivers/net/mdio/mdio-realtek-rtl9300.c:otto_emdio_run_cmd() {
    ...
    return cmdstate & info->cmd_fail ? -ENXIO : 0;
}

When the generic PHY subsystem (like get_phy_c22_id) encounters these
non-standard errors during mdiobus_read(), it transforms them into a fatal
-EIO. Because -EIO is not -ENODEV, __of_mdiobus_register() will immediately
unregister the bus and exit, preventing the switch and all its network ports
from initializing.

Could returning -ENODEV instead be safer so that missing PHYs are simply
skipped instead of failing the entire bus?

>  	bus->parent =3D dev;
>  	bus->notify_phy_attach =3D otto_emdio_notify_phy_attach;
>  	bus->notify_phy_detach =3D otto_emdio_notify_phy_detach;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817162632.1208=
891-1-markus.stockhausen@gmx.de?part=3D10
