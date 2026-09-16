Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ECC3C09ED
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580872; cv=none; b=IkM8Kuzssk0H2EqIGGy2qJYeOINlRKJYMZ1Kv7xEUTYtP09kc1IYJJoSlvk+Fs/ytrNnlrj26qF9YOX+no19NhaztjpCE2dR1FDwf1c2Nk3CRrJsSZFPbqmE87Ob3Gzmq11q7ipdZW0tHqh75x2rHUrG6vTbtV42wwMOsGTL5gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580872; c=relaxed/simple;
	bh=QGA3lYmdm7Bab4muCyjYdJhQlOfLnweXjdgg8Vzle8Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kf4qfhlooRx2P0QUiQw+sga+HXJVvk8iER+UmJdrOixSoXKNu6x52nibGpNK289ETIsf51D+JckZe7rE+YO9ti0PhoOggYc4HTKbG5ijmDuFcD85xHtaf1FOHBARSj37dYq+jesiePTadtmUekjx5aMEkdp0vVuMwiVUyMGPWLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnJoeBrp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnJoeBrp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD7E1F000FF;
	Wed, 16 Sep 2026 17:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789580867;
	bh=MQVKflcMGYsWPmk+EQh6G18uu6xp/LNwijLHX8j08Fc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FnJoeBrpzwdEOGseASF5pjND2YSZeF2XZ4smy0SVjTf1s26JOykCBmDdR1q/hOEXI
	 VJmJjX3xjtmtM9XmOxoz15FUToZ3xYRY2qrvJldBirf4K2/+NMMLysZfMD/koAYWt6
	 VlBO5fwsXqQ1jDeKjiD8jyAYCyDUK6HPVFFGit1bmQZZ2SnlM7TdBD4/p9D7/kP13o
	 2G+kSUZss1ovit6FuWOkcCI8GY2CoTBcD435rFdaLz3ugQg1uTQkWWnw3nLwZ+9LUe
	 zrrKgENfnGgSASvdzvQLNMaK44RXQlmfyeNOigfCNiPQury4L9mwdNWi8MZaWNfeNr
	 SRlL1log5Q00A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 5/7] net: dsa: mediatek: support MDIO switch
 downstream of MMIO switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915174643.253660-6-cjd@cjdns.fr>
References: <20260915174643.253660-1-cjd@cjdns.fr>
 <20260915174643.253660-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 17:47:46 +0000
Message-Id: <20260916174746.BBD7E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] dsa: mt7530: hardware access while in reset causes bus hangs
- [High] dsa: mt7530: PHYs are permanently masked out due to early MDIO set=
up
- [High] dsa: mt7530: PHY interrupts are broken due to late IRQ assignment
- [Medium] dsa: mt7530: resource leak and silent failure in mt7988_probe()
- [Medium] dsa: mt7530: data race on static idx in unlocked mt7988_probe()
--

commit b6de045bf619c20c22824d1e2470474ed02da7d7
Author: Caleb James DeLisle <cjd@cjdns.fr>
Subject: net: dsa: mediatek: support MDIO switch downstream of MMIO switch

The MT7530 / MT7531 can connect via either MDIO or MMIO. In MMIO mode the
switch provides its own MDIO bus which connects to its integrated PHYs. This
commit updates mt7530_setup_mdio() to be called from mt7988_probe() to allow
downstream switches to register.

> diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
> index cf3bdb23a2d54..f387190a95391 100644
> --- a/drivers/net/dsa/mt7530-mmio.c
> +++ b/drivers/net/dsa/mt7530-mmio.c
> @@ -61,7 +61,14 @@ mt7988_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->regmap))
>  		return PTR_ERR(priv->regmap);
> =20
> -	return dsa_register_switch(priv->ds);
> +	ret =3D dsa_register_switch(priv->ds);
> +
> +	if (ret)
> +		return ret;
> +
> +	mt7530_setup_mdio(priv);

[Severity: Critical]
Does calling mt7530_setup_mdio() here access the hardware while the chip is
still held in reset?

If the DSA tree is incomplete, dsa_register_switch() returns 0 without
executing the switch's setup callback, which is normally responsible for
deasserting the hardware reset.

When mt7530_setup_mdio() registers the MDIO bus, it immediately triggers
MDIO read/write operations to probe PHYs. Can this cause invalid data reads
or fatal AXI bus hangs if the chip is still in reset?

[Severity: Medium]
Also, if mt7530_setup_mdio() returns an error (such as -ENOMEM or -ENODEV),
this unconditionally ignores the return value.

Does this allow the driver to bind successfully even if MDIO setup fails, a=
nd
leak the successfully registered DSA switch (priv->ds) since
dsa_unregister_switch() is not called on the error path?

> +
> +	return 0;
>  }
> =20
>  static void mt7988_remove(struct platform_device *pdev)
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index b152b73315d50..fe93be1ece7d7 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
[ ... ]
> @@ -2414,6 +2414,10 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  	static int idx;
>  	int ret =3D 0;

[Severity: Medium]
Before this patch, mt7530_setup_mdio() was exclusively called from
mt753x_setup(), which is serialized by the DSA subsystem's dsa2_mutex.

With the new call path in mt7988_probe() executing concurrently outside of
dsa2_mutex, can multiple switches probing concurrently race on the lockless
idx++ increment?

Could this lead to duplicate MDIO bus IDs and sysfs registration failures
here?

mt7530.c:mt7530_setup_mdio() {
    ...
    snprintf(bus->id, MII_BUS_ID_SIZE, KBUILD_MODNAME "-%d", idx++);
    ...
}

> +	/* Already done */
> +	if (priv->child_bus)
> +		return 0;
> +
>  	mnp =3D of_get_child_by_name(np, "mdio");
> =20
>  	if (mnp && !of_device_is_available(mnp))
> @@ -2438,9 +2442,6 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  	bus->parent =3D dev;
>  	bus->phy_mask =3D ~ds->phys_mii_mask;

[Severity: High]
Since mt7988_probe() calls mt7530_setup_mdio() before the DSA tree is
completed, is ds->phys_mii_mask initialized at this point?

ds->phys_mii_mask is initialized by dsa_switch_setup() only after the tree
completes. Does this mean ds->phys_mii_mask is 0 here, causing bus->phy_mask
to be ~0?

If there are PHYs relying on auto-probing, this mask would cause the MDIO
core to skip probing them entirely. When the tree eventually completes,
mt7530_setup_mdio() will return early due to priv->child_bus already being
set, potentially leaving those PHYs permanently unprobed.

> -	if (priv->irq_domain && !mnp)
> -		mt7530_setup_mdio_irq(priv);
> -
>  	priv->child_bus =3D bus;
> =20
>  	ret =3D devm_of_mdiobus_register(dev, bus, mnp);
[ ... ]
> @@ -3285,6 +3287,9 @@ mt753x_setup(struct dsa_switch *ds)
>  	if (ret)
>  		return ret;
> =20
> +	if (priv->irq_domain && ds->user_mii_bus)
> +		mt7530_setup_mdio_irq(priv);
> +

[Severity: High]
Does moving the mt7530_setup_mdio_irq() call here populate the IRQs too lat=
e?

mt7530_setup_mdio() invokes devm_of_mdiobus_register(), which scans the MDIO
bus and creates PHY devices. During creation, the PHY framework copies
bus->irq[addr] into phydev->irq.

Since bus->irq is populated by mt7530_setup_mdio_irq() only after the PHYs
are already instantiated, won't the PHYs receive an initial value of 0
(PHY_POLL), silently breaking interrupt-driven link events?

>  	/* Initialise the PCS devices */
>  	for (i =3D 0; i < priv->ds->num_ports; i++) {
>  		priv->pcs[i].pcs.ops =3D priv->info->pcs_ops;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915174643.2536=
60-1-cjd@cjdns.fr?part=3D5
