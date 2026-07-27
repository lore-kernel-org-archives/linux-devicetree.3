Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8132E72F
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136726; cv=none; b=qGcykRAnUrQIfP77+RVWnaoL+BoE/RtSaw2zftFEX1k/9743GyoTh5R6gBty2BMLfsgunTJRiN3kU0GsBoyRvqtiH2rF6F0mMxXPqTMk5HB/2ZGRDdI9QoLEykjgymr1K1bb/bbswUWmpHv5cVfj7omD8D3+7+WhW7anQwPFUmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136726; c=relaxed/simple;
	bh=7KJ1Jlmk683DyXjZf47LLPbzoxNsSKpbgcyc2RZBADA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d8C621rIpveDrU7vSMy15sItiTRX5OCr2+Ag4Di0F7Jy80dHBJqTqIYjhdZACeAk7lIQfeE35J/ER9c/fwJlf0pdttuXZNln6APhewfwyxaqt90lBByRYAviqXfaX5RxhLAfEELKnpbV8JozS/UaxqxTqU09CTAaLgm6YL2KMsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lc4FWtdx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lc4FWtdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB181F000E9;
	Mon, 27 Jul 2026 07:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785136724;
	bh=kaB2rmRs8nQCDOjmOzUEviJBqRwudvoMZEbvMy3RfIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lc4FWtdxaEyPqDW8H1ppQ2G82uBALk5U7jiQJsJw7xdphzSoZzmHHKtGV5bWMri8b
	 hGm+y08ipBn3iA58M8E0+N4NBFs7ZUN2Fg0815U/QiDnT1o6kNCX7u+kV7eyCqDrIj
	 z5NT0jPb0hhISIr/OjdZ0arxEkQLRI0wR1bQ87QC/HleKlMJ1PwQxykQH4Q6CBRAVI
	 u2vwjMBfdNVzLWlDD1paEC/rG66xlXmU5LO5G/G4qJVgjDSZTh9Yx1IuP9TDRL9qxL
	 G+UoTlAHu9PPkZA4k5GF0ffHtCl49mV2qHuIcxvGKyijd2OC4nnmiUrH6r1DyXGo04
	 7m0k+3UkU9kEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 4/8] net: mdio: realtek-rtl9300: Configure
 hardware polling during probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260726071751.1359156-5-markus.stockhausen@gmx.de>
References: <20260726071751.1359156-1-markus.stockhausen@gmx.de>
 <20260726071751.1359156-5-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:18:44 +0000
Message-Id: <20260727071844.9DB181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Use-After-Free in `otto_emdio_notify_phy_detach` due to devm lifet=
ime mismatch.
--

--- Patch [4]: [PATCH net-next v7 4/8] net: mdio: realtek-rtl9300: Configur=
e hardware polling during probing ---
commit 66c265d23ecd919426f5681d91b6f6d07bc6bd53
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Configure hardware polling during probing

This patch configures hardware polling for Realtek Otto switches to prevent
interference during PHY probing and firmware loading. It disables polling
when the MDIO driver starts, reenables it after a PHY is attached, and
disables it before a PHY is detached.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 3dee5bff41349..c607dad9f0a31 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c

[ ... ]

> @@ -582,6 +591,32 @@ static int otto_emdio_9310_setup_controller(struct o=
tto_emdio_priv *priv)
>  	return 0;
>  }
> =20
> +static int otto_emdio_notify_phy_attach(struct phy_device *phydev)
> +{

[ ... ]

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
> +	ret =3D otto_emdio_set_port_polling(priv, port, false);

[Severity: High]
Could this lead to a use-after-free if the MDIO driver is unbound?

The priv structure is allocated with devm_kzalloc() during probe, which
ties its lifetime to the platform device. However, the MDIO bus is allocated
with devm_mdiobus_alloc_size(), which is reference counted.

If the MDIO driver is unbound via sysfs, devres will free priv immediately.
If a MAC driver still holds a reference to a PHY device on the bus, the
mii_bus will remain alive.

When the MAC driver later detaches the PHY, for example when the network
interface is brought down, phy_detach() will call bus->notify_phy_detach().
This executes otto_emdio_notify_phy_detach(), which will dereference the
freed priv pointer inside otto_emdio_set_port_polling().

> +	if (ret)
> +		dev_err(bus->parent, "failed to disable polling for port %d\n", port);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726071751.1359=
156-1-markus.stockhausen@gmx.de?part=3D4
