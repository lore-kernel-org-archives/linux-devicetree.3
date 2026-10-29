Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793236460;
	b=0TxJPMoc5emoEtGyOU0YVlH35Ezdo5D6wzOh/1cnl/UVyP1qwEL4wKAQ7dHntlpK7ChV
	 HvIvV09ii2bPVthKkq/DjtjDBNTZ+tJHdbghPJa+A5X0hjtOc035Ao6DOOELDG4/5QdN3
	 XLfp+e1V68mPCPrT9PktRwGmRkwyA2/RxMp10ruYJZ7/8N4MJ2wA2svMMtSyEdasQ6jhF
	 LTldnzjv3KWivYfjnIOJGfZobmhlufLW/wgIFUYiW4dkVWWxqOcI1cvNHNMJTcgOUt94a
	 hHqFP1/N17yxj2g33jrxxIf4cjCqb15M0pwWfU8npgtpT+KPM3A1XYnirX8y7qGsDmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793236460;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aqk2Ym2rxy1aggTZkLHuKeExsF2X7+glor78qsyx2do=;
	b=TRpmLcZqrIksePq3oNaSfDdqhR136sq48O5gYHJ3EmyEede3AvYLDuFE/kt9qn0R+dky
	 UsgRpMg9YAb/AVju+dngFMinQFHGKUuo/HQeRLrVX271Z6tq7//uPwnI4scEMlYB6apBQ
	 ra9o2UNxP4FHmHL0zC5ZQHdr+FQ93y1Er9wtuto8Wd54AbiqK++aRKEPt9QkuLi/7c5pN
	 r3My0QEkCvbDLYgIa6rVLupAkY8TZpgrmSDfyeq+QUdesZ5Yb/9z/CyUeIG0hNj0ARPHy
	 SrRZdmIsAlQDyw8769vhM5n+o0jyWcAumTj5x2mseLfBRnfhKxeT2MCCKCzXN40AtUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="E9VD/OGd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33F1606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E9VD/OGd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8451B1F031E0;
	Thu, 29 Oct 2026 01:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793236459;
	bh=aqk2Ym2rxy1aggTZkLHuKeExsF2X7+glor78qsyx2do=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E9VD/OGdRHvFi7qE95VB/2BRBPjVfm/1LpCjwH7vYK58YCZyPktw5+ksoz/vrbLXg
	 qOYj23EtWPlqpfboi6D0hMOdIZ3brT9ALFdgGUIy9HF9qQfBOXe+TacXJA5d+wXqDn
	 lcKm5sYP9FMdPUpRiL/L7yAIlVYbXnKkxzL+mFhF0LMavn/FzJ2RHd8rGN5+pcxMxI
	 15cYE+jYTQmhtkoISL00oLsn+uoZ0H55c3piHw/SwybBAxZEn7gHw5lDgsENk2N3+I
	 DLIXGKJDUbqPf96hDGCnN09rsDkg3K1cS/GJybYewS6/xbFxseKxR0JFwWjqliC1RT
	 UfSEIrFYLy2lw==
Message-ID: <sashiko-outbox-188587@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] net: dsa: mediatek: support MDIO switch
 downstream of MMIO switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028011317.1557238-6-cjd@cjdns.fr>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
 <20261028011317.1557238-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 01:14:19 +0000
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
- [High] net: dsa: mt7530: premature mt7530_setup_mdio() call in mt7988_pro=
be()
- [High] net: dsa: mt7530: recursive reg_mutex lockdep class on downstream =
switch
- [Medium] net: dsa: mt7530: unchecked mt7530_setup_mdio() error in mt7988_=
probe()
--

commit de67c05d4c4ff0b35afeb33f82dfa1935e610f13
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: support MDIO switch downstream of MMIO switch

This commit exports mt7530_setup_mdio(), makes it idempotent across repeated
calls, and invokes it from mt7988_probe() after dsa_register_switch() so th=
at
a downstream switch attached to the MMIO switch's MDIO bus can probe and
complete the DSA switch tree.

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

[Severity: High]
When the DSA switch tree is not yet complete during mt7988_probe(),
dsa_register_switch() returns 0 before dsa_switch_setup() and mt753x_setup()
have run on the upstream MMIO switch. Can calling mt7530_setup_mdio(priv) at
this point register and scan the MDIO bus before the hardware and DSA switch
state are initialized?

First, in mt7988_setup() (called later from mt753x_setup() once the tree is
complete), the driver pulses priv->rstc, configures AN7583 clocks/AFE if
applicable, and resets the internal PHYs:

    reset_control_assert(priv->rstc);
    usleep_range(20, 50);
    reset_control_deassert(priv->rstc);
    usleep_range(20, 50);
    ...
    regmap_write(priv->regmap, MT7530_SYS_CTRL, SYS_CTRL_PHY_RST);

If mt7530_setup_mdio(priv) runs before mt7988_setup(), MDIO bus accesses ov=
er
MT7531_PHY_IAC occur before reset deassertion, and when the downstream swit=
ch
finishes probing and triggers dsa_tree_setup_switches(), mt7988_setup() will
reset the upstream switch and any PHYs that were already probed on its MDIO
bus.

Second, ds->phys_mii_mask is only populated during dsa_switch_setup():

    ds->phys_mii_mask |=3D dsa_user_ports(ds);

When mt7530_setup_mdio(priv) runs before dsa_switch_setup(), ds->phys_mii_m=
ask
is still 0, so bus->phy_mask is set to ~0U (masking all PHY addresses when
there is no "mdio" child node) and priv->child_bus is set, causing the
subsequent mt7530_setup_mdio() call in mt753x_setup() to return early.

Third, mt7530_setup_irq(priv) has not run yet, so priv->irq_domain is still
NULL when devm_of_mdiobus_register() parses interrupt properties for child
nodes on the MDIO bus.

[Severity: Medium]
Also in mt7988_probe(), if mt7530_setup_mdio(priv) fails (for example,
with -ENOMEM from devm_mdiobus_alloc() or -EPROBE_DEFER from
devm_of_mdiobus_register()), isn't the error return value ignored here?

Since priv->child_bus is reset to NULL on failure and mt7988_probe() returns
0 without unwinding dsa_register_switch(priv->ds), deferred probing will not
be retried and the upstream switch will remain registered in an incomplete
DSA tree that can never finish setup.

[Severity: High]
Furthermore, when an MDIO-based MT7530/MT7531 switch is connected downstream
of an MMIO-based switch's MDIO bus, will lockdep report a recursive locking
violation on priv->reg_mutex?

Both the upstream MMIO switch (priv_up) and the downstream MDIO switch
(priv_down) initialize priv->reg_mutex at the same mutex_init(&priv->reg_mu=
tex)
call site in mt7530_probe_common(), giving both mutexes the same lockdep
class.

When functions on the downstream switch hold priv_down->reg_mutex across a
regmap operation, such as in mt7530_port_disable():

    mutex_lock(&priv->reg_mutex);
    priv->ports[port].enable =3D false;
    regmap_update_bits(priv->regmap, MT7530_PCR_P(port), PCR_MATRIX_MASK,
                       PCR_MATRIX_CLR);
    mutex_unlock(&priv->reg_mutex);

the regmap access on priv_down locks the parent MDIO bus via
mt7530_mdio_regmap_lock() (acquiring priv_up->child_bus->mdio_lock at
MDIO_MUTEX_NESTED) and then invokes priv_up->child_bus->write
(mt753x_phy_write_c22() -> mt7531_ind_c22_phy_write()), which calls
mutex_lock(&priv_up->reg_mutex) at subclass 0 while priv_down->reg_mutex is
already held at subclass 0.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index d09ff207e2dfc..dbe3887097dbc 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
[ ... ]
> @@ -2481,9 +2485,6 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  	bus->parent =3D dev;
>  	bus->phy_mask =3D ~ds->phys_mii_mask;
> =20
> -	if (priv->irq_domain && !mnp)
> -		mt7530_setup_mdio_irq(priv);
> -
>  	priv->child_bus =3D bus;
> =20
>  	ret =3D devm_of_mdiobus_register(dev, bus, mnp);
> @@ -2498,6 +2499,7 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  	of_node_put(mnp);
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(mt7530_setup_mdio);
> =20
>  static int
>  mt7530_setup(struct dsa_switch *ds)
> @@ -3328,6 +3330,9 @@ mt753x_setup(struct dsa_switch *ds)
>  	if (ret)
>  		return ret;
> =20
> +	if (priv->irq_domain && ds->user_mii_bus)
> +		mt7530_setup_mdio_irq(priv);

[Severity: High]
Does moving mt7530_setup_mdio_irq(priv) after mt7530_setup_mdio(priv) break
PHY interrupts when there is no "mdio" Device Tree child node (mnp =3D=3D N=
ULL)?

In mt7530_setup_mdio(), devm_mdiobus_alloc() initializes all bus->irq[i]
entries to PHY_POLL, and devm_of_mdiobus_register(dev, bus, NULL) immediate=
ly
scans the bus and instantiates each struct phy_device via:

    __mdiobus_register()
      -> mdiobus_scan_bus_c22()
        -> mdiobus_scan()
          -> get_phy_device()
            -> phy_device_create()

Inside phy_device_create(), the PHY's interrupt is copied from the bus array
at creation time:

    dev->irq =3D bus->irq[addr];

Because mt7530_setup_mdio_irq(priv) now runs only after
devm_of_mdiobus_register() has completed, bus->irq[p] is still PHY_POLL when
phy_device_create() runs, so all PHYs on ds->user_mii_bus are registered in
polling mode and the IRQ mappings later stored into ds->user_mii_bus->irq[p]
by mt7530_setup_mdio_irq() are never propagated to phydev->irq.

In addition, the error path of devm_of_mdiobus_register() in
mt7530_setup_mdio() still calls mt7530_free_mdio_irq(priv):

    ret =3D devm_of_mdiobus_register(dev, bus, mnp);
    if (ret) {
        priv->child_bus =3D NULL;
        dev_err(dev, "failed to register MDIO bus: %d\n", ret);
        if (priv->irq_domain && !mnp)
            mt7530_free_mdio_irq(priv);
    }

even though mt7530_setup_mdio_irq(priv) has not been called yet at that poi=
nt.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028011317.1557=
238-1-cjd@cjdns.fr?part=3D5
