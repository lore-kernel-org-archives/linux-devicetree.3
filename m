Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5704A3B42F6
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 06:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785564894; cv=none; b=lO5CCW54kZm1cSvw/CN9zRZDJiq2T8t5R15TyPpIvUKOH5rsIROuBZyM8y3t4BtwL28dLl3ar9J9oO4+bGusGX2Nkj0vveNtc2JdLeZ4TGbdrt5GQb7M0ieuiJEIRdn1j4O5U7mA9nes+8+P6JuTE0W1e+vyriNlPn6SnvEwaqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785564894; c=relaxed/simple;
	bh=AGIsE2q6hGSbAT8gBb+QwRr1zhYc4dypkb40WoD4Y/4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CxYwkhksbRhQ2ReNrN+5tIMqP+PksEhqC030kWo2nFwYJbNaNvI0xWIA9MhP1U3ithjjpMMu5vUYSkpqF15OSkLC9tpA8GKp1mQ/bSggB0w+xfqatBoZuMpCndpSfsXPi8HGg5sNVtU0byNAhdseCv7gD5VjwUwxyuH1lYbOwf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYZk8AeO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYZk8AeO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C971F00AC4;
	Sat,  1 Aug 2026 06:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785564891;
	bh=EfTDUhrtLiHeLUtGcuKiLuqzchZk+Sl4gpQqbOZfbos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hYZk8AeO9H6YH89X0EwavDCHJdom2Cgj6IUYphygsRjyNJovgIoj8A0pcmhZHYtkz
	 wZYz9QCJGN+lHJUvCE92Z/tu36vH8RoDNWOWnaOQwO67Nz0jm60tNAXdQi+zfvROjU
	 YH8s5R1MQyCFeCGCwAQ8LCjyEP36ptKRhwucEQbD/lTOedT6WAwza0/AvdjO4nmtY/
	 AEh/GLB1vowgoCvDgwOsqthngpxqE8cxVklSRj6+V5Y/7z9CQ4xiNas7nYv1fg9soq
	 x4+aUZ0N5XDDWchRJkq4AurGJZyhkWctN+ZcT+17B+32sVcIM6WLfAzXQ81djm/uIs
	 Gxc+ym5ust1cQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 05/10] net: mdio: realtek-rtl9300:
 Configure hardware polling during probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731061400.78301-6-markus.stockhausen@gmx.de>
References: <20260731061400.78301-1-markus.stockhausen@gmx.de>
 <20260731061400.78301-6-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 06:14:50 +0000
Message-Id: <20260801061451.65C971F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Module unload race / Use-After-Free due to devres action attached =
to class device
--

--- Patch [5]: [PATCH net-next v10 05/10] net: mdio: realtek-rtl9300: Confi=
gure hardware polling during probing ---
commit 46ab2c1bebbed4638cc44b5a4c270ec37988afc7
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Configure hardware polling during probing
   =20
This patch allows the polling of Realtek Otto switches to be enabled or
disabled during PHY configuration. This prevents hardware polling from
interfering with complex configuration sequences or firmware loading. Polli=
ng
is kept in a consistent state by disabling it initially and toggling it
during PHY attach and detach.
   =20
Link: https://github.com/openwrt/openwrt/blob/main/target/linux/realtek/fil=
es-6.18/drivers/net/mdio/mdio-realtek-otto.c#L818
Link: https://lore.kernel.org/netdev/680696024a8648535ce6dee771fe4de67802e0=
e8.1769053496.git.daniel@makrotopia.org/

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 7dcfb72ed8188..f1f15ad23dd3d 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c

[ ... ]

> @@ -628,6 +663,9 @@ static int otto_emdio_probe_one(struct device *dev, s=
truct otto_emdio_priv *priv
>  		bus->write =3D otto_emdio_write_c22;
>  	}
>  	bus->parent =3D dev;
> +	bus->notify_phy_attach =3D otto_emdio_notify_phy_attach;
> +	bus->notify_phy_detach =3D otto_emdio_notify_phy_detach;
> +
>  	chan =3D bus->priv;
>  	chan->mdio_bus =3D mdio_bus;
>  	chan->priv =3D priv;

[Severity: High]
While reviewing these changes to otto_emdio_probe_one(), I noticed a
potential resource management issue further down in the same function:

drivers/net/mdio/mdio-realtek-rtl9300.c:otto_emdio_probe_one() {
    ...
    kref_get(&priv->kref);
    err =3D devm_add_action_or_reset(&bus->dev, otto_emdio_cleanup_bus, pri=
v);
    ...
}

Could this sequence lead to a module text use-after-free on unload?=20

Because bus->dev is a class device, a local user can extend its lifetime=20
indefinitely by keeping its sysfs file open. If an administrator unloads=20
the module, the module unloads successfully.=20

When the user later closes the sysfs file, won't the release of bus->dev=20
trigger the devres action and attempt to execute otto_emdio_cleanup_bus()=20
after the module code has already been unmapped?

Should this cleanup action be attached to the parent platform dev instead=20
of the class device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731061400.7830=
1-1-markus.stockhausen@gmx.de?part=3D5
