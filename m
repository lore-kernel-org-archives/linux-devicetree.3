Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388142;
	b=1pRZkOPOHgoBIDtvCZN7j2rlTF2HcRRcYMYPHsGLE4RY+kNRkVTHtbKfnQGs6sWNFdGW
	 o8a3Ji02fRW6ILWxIUtR/3GzDUxY5k+K8MBzZP09RdyVSbBzYPCbP27wIH3Sqn7EEzOkv
	 qB5slYgWG0OP7QtB37tnUKbC4dsAZZOiAJH5Oyo6CWe/ueipIEyTY9A3hcTnB8FBheRNZ
	 NpfJtJPCVlqMlPKGhld7OdgYERDcK/6LT2CP/U6+tBu/qpjFGY8R+DMfvyNeEo04XOFuA
	 i/MGffY0GeyGTWgnXyEoX/k/whb1jI10iuJtgwRZzpp+aRVpEv0obnbpXnoHYubLrtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388142;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pVMoTeY3yaEuTtLscNWTTt2s27CXh257Byl2CiXyLXQ=;
	b=ap9AZwlomFEUwVpv9fDQYVwWJi3yAqByDhbRkESYp1n9vTElNGyHng9rP70ATSCq/JoP
	 cAiUdvy95DgM3nSQOT/DVFu16lOf8N0/OnZkGk1QBhIY8wMHJPzAzM+0hiAMAA3RDdZq8
	 OHE9F4NtcZrqtqNFoJleR0CL5+DOunfe9e7C+oB2nXGeLymoEQCpJUZmheeC7QnZNGRNd
	 FL4PSMggzbcspQEskYPSurKzxmCWz4uemdYg4s38Stu22FwDZ1FuYgB/JFV9I0LUgCzIp
	 AgRFMMBbjR3tMOXHosQ4AlVD23Zcdt7TMV4okYKZQ+VE5O9LRq80XLf4FQc1iKiFu6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gv6ULj37;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838DA606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 19:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gv6ULj37
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004711F00A16;
	Fri, 30 Oct 2026 19:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793388142;
	bh=pVMoTeY3yaEuTtLscNWTTt2s27CXh257Byl2CiXyLXQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gv6ULj37AunCnS4KwZYPN9lCi/f4ZEbh9abm+/8ZSnZHqP+5moSdZkL7uuzm3awDh
	 q5RhTIbh2tLNkWn48MJLOmh5+ilgW/nSrtMpN7U9zJnkOciNLLWC1+JubGPcFkykTx
	 6N6yxQ3qk7zORTEJAvD3276+WgrH/pSqCRGcD2Xr2/CTfeHecBsFiFrx2C9H6WdtJY
	 1p3yIdikNCsko86YE2rrHiy1SFBvrD4JsXryDEoamP7xrHC1wbMarWPiGXlZJi9/aU
	 E43+Q1jPTofnwEjdQemrb56k2gAWwisFLoaifLGi3/dDxRCiENzfhGiIcXgfXSPlaP
	 0YXKVJ3NgtNYA==
Message-ID: <sashiko-outbox-191440@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] net: dsa: mediatek: support MDIO switch
 downstream of MMIO switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029184202.1859843-6-cjd@cjdns.fr>
References: <20261029184202.1859843-1-cjd@cjdns.fr>
 <20261029184202.1859843-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 19:22:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] net: dsa: mt7530: broken PHY IRQs due to late mt7530_setup_mdio_ir=
q()
- [High] net: dsa: mt7530: premature and re-entrant mt7530_setup_mdio() in =
probe
- [High] net: dsa: mt7530: unchecked mt7530_setup_mdio() error in mt7988_pr=
obe()
- [High] net: dsa: mt7530: reg_mutex lockdep recursion with downstream swit=
ch
--

commit 51caf2efd42e68935e207fbaf1614c12f27f5efa
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: support MDIO switch downstream of MMIO switch

This commit exports mt7530_setup_mdio(), makes it idempotent via a check on
priv->child_bus, moves mt7530_setup_mdio_irq() to mt753x_setup(), and calls
mt7530_setup_mdio() from mt7988_probe() after dsa_register_switch() to allo=
w a
downstream MDIO switch to probe and complete the DSA switch tree.

> diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
> index cf3bdb23a2d54..746a0a4622497 100644
> --- a/drivers/net/dsa/mt7530-mmio.c
> +++ b/drivers/net/dsa/mt7530-mmio.c
> @@ -61,7 +61,21 @@ mt7988_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->regmap))
>  		return PTR_ERR(priv->regmap);
> =20
> -	return dsa_register_switch(priv->ds);
> +	ret =3D dsa_register_switch(priv->ds);
> +
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * If not all switches in the hierarchy have been probed,
> +	 * dsa_register_switch() returns 0 without calling mt753x_setup().
> +	 * Call mt7530_setup_mdio() because there's a chance that the missing
> +	 * switch is on the MDIO bus. Do not call this before
> +	 * dsa_register_switch() as it  may exit with an error.
> +	 */
> +	mt7530_setup_mdio(priv);
> +
> +	return 0;

[Severity: High]
What happens if mt7530_setup_mdio(priv) fails here in mt7988_probe(), for
example with -ENOMEM from devm_mdiobus_alloc() or -EPROBE_DEFER from
devm_of_mdiobus_register()?

Because the return value of mt7530_setup_mdio(priv) is ignored and
mt7988_probe() returns 0, the driver core will treat probe as successful and
never retry deferred probing, leaving the downstream switch unprobed, the D=
SA
tree permanently incomplete, and priv->ds registered in the switch tree
holding allocated dsa_port instances and conduit net_device references with=
out
unwinding via mt7530_remove_common(priv) / dsa_unregister_switch(priv->ds).
Should mt7988_probe() check the return value of mt7530_setup_mdio(priv) and
unregister the switch on error?

[Severity: High]
Also, when a downstream MDIO switch is registered on the MMIO switch's MDIO
bus (upstream_priv->child_bus), won't register accesses on the downstream
switch trigger a lockdep recursive locking warning on priv->reg_mutex?

Both the upstream MMIO switch and the downstream MDIO switch initialize
priv->reg_mutex at the same callsite in mt7530_probe_common():

drivers/net/dsa/mt7530.c:mt7530_probe_common() {
	...
	mutex_init(&priv->reg_mutex);
	...
}

This assigns both mutexes to the same static lockdep class. When any operat=
ion
on the downstream switch holds mutex_lock(&downstream_priv->reg_mutex) at
subclass 0 and performs a regmap access, such as in mt7530_port_disable():

drivers/net/dsa/mt7530.c:mt7530_port_disable() {
	mutex_lock(&priv->reg_mutex);
	priv->ports[port].enable =3D false;
	regmap_update_bits(priv->regmap, MT7530_PCR_P(port), PCR_MATRIX_MASK,
			   PCR_MATRIX_CLR);
	mutex_unlock(&priv->reg_mutex);
}

the underlying MDIO transfer goes through mt7530_regmap_read() /
mt7530_regmap_write() on downstream_priv->bus (which is
upstream_priv->child_bus) and calls mt7531_ind_c22_phy_read() /
mt7531_ind_c22_phy_write(), which acquires mutex_lock(&upstream_priv->reg_m=
utex)
at subclass 0 of the same lockdep class:

drivers/net/dsa/mt7530.c:mt7531_ind_c22_phy_write() {
	mutex_lock(&priv->reg_mutex);
	...
}

Does priv->reg_mutex need a separate lockdep key or nesting annotation when
switches are stacked this way?

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index d45388e2efc83..24e4485624d39 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2509,7 +2509,7 @@ mt7530_free_mdio_irq(struct mt7530_priv *priv)
>  	}
>  }
> =20
> -static int
> +int
>  mt7530_setup_mdio(struct mt7530_priv *priv)
>  {
>  	struct device_node *mnp, *np =3D priv->dev->of_node;
> @@ -2519,6 +2519,10 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  	static int idx;
>  	int ret =3D 0;
> =20
> +	/* Already done */
> +	if (priv->child_bus)
> +		return 0;
> +
>  	mnp =3D of_get_child_by_name(np, "mdio");
> =20
>  	if (mnp && !of_device_is_available(mnp))
> @@ -2543,9 +2547,6 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  	bus->parent =3D dev;
>  	bus->phy_mask =3D ~ds->phys_mii_mask;
> =20
> -	if (priv->irq_domain && !mnp)
> -		mt7530_setup_mdio_irq(priv);
> -
>  	priv->child_bus =3D bus;

[Severity: High]
When mt7988_probe() calls mt7530_setup_mdio(priv) after dsa_register_switch=
()
returns 0 on an incomplete DSA tree, neither dsa_switch_setup() nor
mt753x_setup() has executed yet. Can calling mt7530_setup_mdio() at that po=
int
cause four ordering and re-entrancy regressions?

1. Hardware reset and PHY clock setup in mt7988_setup() have not run yet wh=
en
mt7988_probe() calls mt7530_setup_mdio(priv). In mt7988_setup():

drivers/net/dsa/mt7530.c:mt7988_setup() {
	/* Reset the switch */
	reset_control_assert(priv->rstc);
	usleep_range(20, 50);
	reset_control_deassert(priv->rstc);
	usleep_range(20, 50);

	/* AN7583 require additional tweak to CONN_CFG */
	if (priv->id =3D=3D ID_AN7583)
		regmap_update_bits(priv->regmap, AN7583_GEPHY_CONN_CFG, ...);

	/* Reset the switch PHYs */
	regmap_write(priv->regmap, MT7530_SYS_CTRL, SYS_CTRL_PHY_RST);
}

MDIO accesses in mt7530_setup_mdio() happen before priv->rstc is deasserted
and before AN7583_GEPHY_CONN_CFG is configured. Then, when the downstream
switch registers and completes the DSA tree, dsa_tree_setup() invokes
mt753x_setup() -> mt7988_setup() on the upstream switch, asserting priv->rs=
tc
and writing SYS_CTRL_PHY_RST after MDIO devices and PHYs on the bus have
already been probed.

2. mt7530_setup_irq(priv) is only called from mt753x_setup(), so
priv->irq_domain is still NULL when mt7988_probe() calls
mt7530_setup_mdio(priv). Any child PHY or switch node under the mdio DT node
whose interrupt-parent is the upstream switch will fail fwnode_irq_get() wi=
th
-EPROBE_DEFER during devm_of_mdiobus_register().

3. ds->phys_mii_mask is only populated by dsa_switch_setup():

net/dsa/dsa.c:dsa_switch_setup() {
	...
	ds->phys_mii_mask |=3D dsa_user_ports(ds);
	...
}

When mt7988_probe() calls mt7530_setup_mdio(priv) on an incomplete tree,
ds->phys_mii_mask is still 0, so bus->phy_mask =3D ~ds->phys_mii_mask is
0xffffffff. If there is no mdio child DT node (mnp =3D=3D NULL),
devm_of_mdiobus_register(dev, bus, NULL) scans no PHYs and sets
priv->child_bus =3D bus. When the tree later completes and mt753x_setup() c=
alls
mt7530_setup_mdio(priv), it returns 0 immediately because priv->child_bus is
already set, leaving ds->user_mii_bus with no PHYs.

4. Because priv->child_bus =3D bus is set before devm_of_mdiobus_register(d=
ev,
bus, mnp) finishes iterating all child nodes of mnp in
__of_mdiobus_parse_phys(), probing the downstream switch child node
synchronously calls:

mt7530_probe()
  -> dsa_register_switch()
    -> dsa_tree_setup()
      -> dsa_tree_setup_switches()
        -> mt753x_setup()
          -> mt7530_setup_mdio()

That re-entrant mt7530_setup_mdio() call sees priv->child_bus !=3D NULL and
returns 0 while the outer __of_mdiobus_parse_phys() loop is still mid-itera=
tion
and has not yet registered any PHY child nodes listed after the downstream
switch node in mnp. dsa_tree_setup_ports() then runs immediately and fails
phylink_of_phy_connect() with -ENODEV for those upstream user ports.

[ ... ]

> @@ -3386,10 +3388,17 @@ mt753x_setup(struct dsa_switch *ds)
>  	if (ret)
>  		return ret;
> =20
> +	/*
> +	 * This must be called before mt753x_setup() returns because the DSA
> +	 * core synchronously sets up ports and expects PHYs to be operational.
> +	 */
>  	ret =3D mt7530_setup_mdio(priv);
>  	if (ret)
>  		return ret;
> =20
> +	if (priv->irq_domain && ds->user_mii_bus)
> +		mt7530_setup_mdio_irq(priv);

[Severity: High]
Doesn't moving mt7530_setup_mdio_irq(priv) after mt7530_setup_mdio(priv) br=
eak
PHY interrupts for all switches using ds->user_mii_bus?

In mt7530_setup_mdio(), devm_mdiobus_alloc() initializes all bus->irq[i]
entries to PHY_POLL. When mnp is NULL, devm_of_mdiobus_register(dev, bus, N=
ULL)
synchronously scans the bus and creates the phy_device instances via:

devm_of_mdiobus_register()
  -> __of_mdiobus_register()
    -> __mdiobus_register()
      -> mdiobus_scan_bus_c22()
        -> mdiobus_scan_c22()
          -> get_phy_device()
            -> phy_device_create()

During phy_device_create(), phylib copies bus->irq[addr] into each struct
phy_device:

drivers/net/phy/phy_device.c:phy_device_create() {
	...
	dev->irq =3D bus->irq[addr];
	...
}

Because mt7530_setup_mdio_irq(priv) now runs after mt7530_setup_mdio(priv) =
has
already registered the bus and created the PHY devices, bus->irq[addr] is s=
till
PHY_POLL at creation time, so every PHY is created with phydev->irq =3D=3D =
PHY_POLL
and populating ds->user_mii_bus->irq[p] afterwards has no effect on the
already-created PHY devices (while leaking the mapped IRQ descriptors).

In addition, the error path in mt7530_setup_mdio() still calls
mt7530_free_mdio_irq(priv) when devm_of_mdiobus_register() fails:

drivers/net/dsa/mt7530.c:mt7530_setup_mdio() {
	...
	ret =3D devm_of_mdiobus_register(dev, bus, mnp);
	if (ret) {
		priv->child_bus =3D NULL;
		dev_err(dev, "failed to register MDIO bus: %d\n", ret);
		if (priv->irq_domain && !mnp)
			mt7530_free_mdio_irq(priv);
	}
}

even though mt7530_setup_mdio_irq(priv) was not called before
devm_of_mdiobus_register().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029184202.1859=
843-1-cjd@cjdns.fr?part=3D5
