Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497264314AE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783355792; cv=none; b=L7S472PITsEjAHqZ92gHeRlsRLHjn5q/iK4HgLfRdpdV+kdOlx4z5HR8u7CZkuwW/TeLqmKrGEiU0pvKy45K4GD17LNnuHLQ7LeRZWT4UrVKyYAYTgaznW1doeLwUcjv2b6vNET3Dl1SdsEXXW2cxEEuG3huGqL01W7DdZTqTIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783355792; c=relaxed/simple;
	bh=0+1BymtRMtn1X/GZgOD/VKIMikSumxE45c1zFpo6LVg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TmVtWS9i1pbxhRSoWX5GHmemmKmQyJrnMjNRCgjAiTv0tzlAE0onCeVQNfgDokEiuzBcEAxv5F/yEp4zGtyRLzShX0WNfk9NHUz9JU3LFkGaskGRuo8b8lTmScAM8u67Vgohf6w9KDt2IfEtATr3E8HcnovyRmxoAdA4f+PA/WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2+u9F0r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2+u9F0r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39DD1F000E9;
	Mon,  6 Jul 2026 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783355790;
	bh=lKhlGkjgZI/IiOrEomS3s3fgwTH9htR50SGG9oIyZOU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j2+u9F0r1drdK/y/r9E7uAKF7EbdBjWyhp5Spd/WJAFWMl8zLOGXW5Jr8Xn1RNBq+
	 PAX9iG8NWzxFLNNkBvD5tf6Ln3m5Ys/jkS8opXrfPiWLf+fxXkfBuOyy7gyNXEh8JM
	 3mGyItXtC4OGTV9FLxV8o17+gF0vSs5npVwnqCt6sn2iB5u7s94ts1mL0JJuMR+HlP
	 VUBizG6bQEahi9F3IGXuk+PYVgsD0NkYB57/BO9z0shNZcudJP/ZIKKXUMkHsqJEKD
	 SmqiGGVDoewUCEytx0jUGrvFnsktOLxjH28Z9vKnDWVcwL7wHrUUWEGbFXes28cPW7
	 qjJmmRmUP1wrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 4/8] net: mdio: realtek-rtl9300: Configure
 hardware polling during probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260705163532.2853959-5-markus.stockhausen@gmx.de>
References: <20260705163532.2853959-1-markus.stockhausen@gmx.de>
 <20260705163532.2853959-5-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 16:36:28 +0000
Message-Id: <20260706163630.A39DD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Data race due to unprotected lockless read of `priv->phy_poll`.
--

commit 5dc09b6df4d4ed1cb80ef56b8de6e9aa03870333
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Configure hardware polling during probing

This commit synchronizes kernel and hardware polling for Realtek Otto switc=
hes
by disabling polling for all ports on start and managing it per-PHY during
attach and detach. This prevents hardware polling from interfering with
complex configuration sequences or firmware loading.

Link: https://github.com/openwrt/openwrt/blob/main/target/linux/realtek/fil=
es-6.18/drivers/net/mdio/mdio-realtek-otto.c#L818
Link: https://lore.kernel.org/netdev/680696024a8648535ce6dee771fe4de67802e0=
e8.1769053496.git.daniel@makrotopia.org/

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 562f9c7f2895d..c36244cd9a66e 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c

[ ... ]

> @@ -576,6 +588,47 @@ static int otto_emdio_9310_setup_controller(struct o=
tto_emdio_priv *priv)
>  	return 0;
>  }
> =20
> +static int otto_emdio_notify_phy_attach(struct phy_device *phydev)
> +{
> +	struct otto_emdio_priv *priv =3D otto_emdio_bus_to_priv(phydev->mdio.bu=
s);
> +	int port =3D otto_emdio_phy_to_port(phydev->mdio.bus, phydev->mdio.addr=
);
> +	int ret;
> +
> +	if (port < 0)
> +		return port;
> +
> +	if (test_bit(port, priv->phy_poll))
> +		return 0;

[Severity: Medium]
Could this lockless read of priv->phy_poll result in a data race?

While this test_bit() is lockless, the updates in the guarded sections below
use the non-atomic __set_bit() and __clear_bit(). If multiple PHYs on the
same MDIO bus are attached or detached concurrently, the plain
read-modify-write from __set_bit() or __clear_bit() on the same word could
race with this read, causing KCSAN warnings and undefined behavior.

Should this test_bit() check be moved inside the scoped_guard() block, which
safely supports early returns?

> +
> +	scoped_guard(mutex, &priv->lock) {
> +		ret =3D otto_emdio_set_port_polling(priv, port, true);
> +		if (!ret)
> +			__set_bit(port, priv->phy_poll);
> +	}
> +
> +	return ret;
> +}
> +
> +static void otto_emdio_notify_phy_detach(struct phy_device *phydev)
> +{
> +	struct otto_emdio_priv *priv =3D otto_emdio_bus_to_priv(phydev->mdio.bu=
s);
> +	int port =3D otto_emdio_phy_to_port(phydev->mdio.bus, phydev->mdio.addr=
);
> +	struct mii_bus *bus =3D phydev->mdio.bus;
> +	int ret;
> +
> +	if (port < 0)
> +		return;
> +
> +	scoped_guard(mutex, &priv->lock) {
> +		ret =3D otto_emdio_set_port_polling(priv, port, false);
> +		if (!ret)
> +			__clear_bit(port, priv->phy_poll);
> +	}
> +=09
> +	if (ret)
> +		dev_err(bus->parent, "failed to disable polling for port %d\n", port);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705163532.2853=
959-1-markus.stockhausen@gmx.de?part=3D4
