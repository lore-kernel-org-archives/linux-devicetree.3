Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714863749E3
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 19:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781033468; cv=none; b=dRH1ylrsGscPh8rzd0AkzKxCNIWo9leRHVP59vwg/y6PoMvuXN+jN0hKz2SlPi0ACh5UV7M6GYyab+zHkX9H6juGuN3z9AhWFRu03ZY6RVFLXQD94g/uVEFNxqElUWR+7q99i17KgHdV9S6ALIJnr6EU9HRpmpA8XKp76bJ7P7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781033468; c=relaxed/simple;
	bh=yWpXDaYrzzFihQeJ78MyaErbHV5JcOraJiypf2XWp8E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G6ACbsS81wlBQ6tOEw9b6r1ap6xOQwXd0HzUWnFPOoR3bbEtdniix7YWmbuke0M3aAdDy1hanHw7v9LGCclEoexfQnHGlK3puD6y1SULT8BPpuvCumFKYnvc3/oN7RUzXzZf/5LylWVtQmN4fODx/JvIx7C2PDZFmd1jpImnPH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsMaZ3hn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsMaZ3hn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088241F00899;
	Tue,  9 Jun 2026 19:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781033467;
	bh=WiY4LxqZem6DSZ1ufN97RG76UT7GhFpGXyX7twFQrd0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GsMaZ3hnd9fmzpWKT81qa6Wk3TdZ8nKWWp0MJetRzLzH7yzWIbFxnBYAb7wKYKG3E
	 UWsMR98MjYAsAGZpOS4slh0iy4WWbyXO8xEopXAvf7Y+wz31fcc4F3v4LbQF93/Hg1
	 O1CfPwUKnWbDwSqtQc9Pf5BSB6qhwR7tuWisELlFXO1JCgwl+wLR7QS8jqEzK9e+th
	 wHWgZIONwX9WqNLgWzyQh49Ouo/9l8r8N5ACDk2339AIZMmVv21kIKVoBzjbT07UJt
	 TRwdNCzOjzpUOyp1HkvliZGWI39mxS7kzumP8d+02BJzUFCHGPCn/aK2uOkIJYS8NC
	 589AnmB8drBcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 4/4] net: dsa: initial support for MT7628
 embedded switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joris Vaisvila" <joey@tinyisr.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260608192948.289745-5-joey@tinyisr.com>
References: <20260608192948.289745-5-joey@tinyisr.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 19:31:06 +0000
Message-Id: <20260609193107.088241F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using devm_mdiobus_alloc() and devm_mdiobus_register() within the =
DSA .setup() callback causes memory leaks and sysfs naming collisions on de=
vice unbind/rebind.
--

commit 3622b1e586d001c3ba3f067ff8677605bcde34cc
Author: Joris Vaisvila <joey@tinyisr.com>

net: dsa: initial support for MT7628 embedded switch

This commit adds support for the MT7628 embedded switch, which includes 5 u=
ser
ports and 1 CPU port. It uses a 16-entry VLAN table for port isolation and
configures a double tag feature to simulate VLAN-unaware functionality.

> diff --git a/drivers/net/dsa/mt7628.c b/drivers/net/dsa/mt7628.c
> new file mode 100644
> index 0000000000000..a2338f02f78a0
> --- /dev/null
> +++ b/drivers/net/dsa/mt7628.c
> @@ -0,0 +1,648 @@
[ ... ]
> +static int mt7628_setup_internal_mdio(struct dsa_switch *ds)
> +{
> +	struct mt7628_esw *esw =3D ds->priv;
> +	struct mii_bus *bus;
> +
> +	bus =3D devm_mdiobus_alloc(esw->dev);
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	bus->name =3D "MT7628 internal MDIO bus";
> +	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(esw->dev));
> +	bus->priv =3D esw;
> +	bus->read =3D mt7628_mii_read;
> +	bus->write =3D mt7628_mii_write;
> +	bus->parent =3D esw->dev;
> +
> +	ds->user_mii_bus =3D bus;
> +	bus->phy_mask =3D ~ds->phys_mii_mask;
> +
> +	return devm_mdiobus_register(esw->dev, bus);

[Severity: High]
Is it safe to use devm_mdiobus_alloc() and devm_mdiobus_register() tied to
the platform device here?

Since mt7628_setup_internal_mdio() is called from the DSA .setup() callback
below, it can be executed multiple times without the platform device unbind=
ing
(for instance, when the conduit interface unbinds and rebinds).

Because the devm_ functions tie the MDIO bus allocation and registration to
the platform device, the bus is never unregistered or freed during the DSA
.teardown() phase.

When the tree is re-setup, won't it attempt to register a new MDIO bus with
the same ID, causing a sysfs name collision and resource leak?

[ ... ]
> +static int mt7628_setup(struct dsa_switch *ds)
> +{
> +	struct mt7628_esw *esw =3D ds->priv;
> +	int ret;
[ ... ]
> +	mt7628_switch_init(ds);
> +
> +	ret =3D mt7628_setup_internal_mdio(ds);
> +	if (ret)
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608192948.2897=
45-1-joey@tinyisr.com?part=3D4
