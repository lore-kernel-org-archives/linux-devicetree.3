Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940508;
	b=oksJa6L4pjskOljCP0ni7jeCkD7iC9hHR++aaNIqMeCDnG08kn5t0FVhPFus0cBXJOEj
	 JOvjY8/wkJtnjHNn5D10P6IsYOxYHJLsyfvHZqO3txD3p1kibnMiK1R/xocgtAHda9LMx
	 2qVCCySrp9MsNFEI78wQg7EO70nKaLb9g5NhGEPymSARSYOpc7NaFqYW3VN+6c1Nb1wx3
	 VdKzhQ4rBS1aHJpSoMxM2KpbNd7H4VdYT28vhcS34JZNWRnlAv8a2u+2Bsjb0117CKKUF
	 ndnaVJJx4CrS3EqJD6yp/YL54jQkwWXXpYpdqRMGKy+46KH1f8OrjHZ2z2SlKOq/IwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940508;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HIWl/3CEgDKo1ZcFypGBvso+SVnsJTwBSSQhWev/Yeo=;
	b=GqTu6p3mGiPHBaiITvKCuZOd8xBXAObxUjoFEx3rwDWZjXkpYzVeOAZ1ATc8HYT2X5Qn
	 Ar0JxNRLJqmTCKY6KELD66yxjaeuFcExksw02E52n2EbkKGeY8/HunTS+dGhzQA+TV5cH
	 SsrjrjmVDrIMLxRPC2gh9iL42kZf6k8O6urqeacPeLebO1Nh2F+ncn7wbQ69+ARJuLqXq
	 tSp+WxW7ogXERIRDSqGUozd0cHK2WWSenSDWnQ4fe6gR9xngmoJ8eU9sqHZ+wpcTdRh1i
	 0YRjUCLdKD6+KP51ZJoWYQgjwlID2nvZkDROIwtuE3WhFlNOaQg77dWipnaXphrZ34A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MUubCCVx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFC4606A886
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MUubCCVx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8D11F000C7;
	Tue, 17 Nov 2026 18:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940508;
	bh=HIWl/3CEgDKo1ZcFypGBvso+SVnsJTwBSSQhWev/Yeo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MUubCCVx/eiXFt6Whx3Yx5taZkwbM+8tA7e8js2uDQ+kG/GG10LzT59AQ87nYzpoR
	 nj97FqylwyWGOk4qARF//BHSp2mIZAoNmSr7Cs4VxUoe0dligdSChHlAi3ALsuVRA2
	 oY9S1H1PP3yrD1hPGbJ65476rKODoecwVq4x4uikJtOs83U9fU5weOoIfq52Mw6IVK
	 cxTn/Os2ALAZ31uiEyFDDtlMr3zcFMbYuMcB2iSdpw2EQhDWt/2JimNJnI0sB8nH6X
	 7r5JXFErFrzng7CG39b4v5k9tQTSqzTIx3l3j+px7VlrrWek+MOaox+SZxFX0Gq14Q
	 9baZXc3KevDKw==
Message-ID: <sashiko-outbox-219354@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [net-next v5 5/7] net: dsa: mediatek: support MDIO switch
 downstream of MMIO switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116183332.168858-6-cjd@cjdns.fr>
References: <20261116183332.168858-1-cjd@cjdns.fr>
 <20261116183332.168858-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:35:07 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] net: dsa: mt7530: missing dsa_unregister_switch() on probe MDIO
  setup error
- [High] net: dsa: mt7530: duplicate mt7530_setup_irq() call in
  mt7530_setup_mdio()
- [High] net: dsa: mt7530: premature and re-entrant mt7530_setup_mdio()
  in mt7988_probe()
--

commit ef65040817a2e220996466f22eb74590c98e4476
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: support MDIO switch downstream of MMIO switch

This commit enables probing an MDIO switch connected to the MDIO bus of
an upstream MMIO switch by calling mt7530_setup_mdio() from
mt7988_probe() and assigning separate lockdep classes to MMIO and MDIO
reg_mutex instances.

> diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
> index 5d467be2a32c8..ab6d92ab3ec0b 100644
> --- a/drivers/net/dsa/mt7530-mmio.c
> +++ b/drivers/net/dsa/mt7530-mmio.c
> @@ -61,7 +62,27 @@ mt7988_probe(struct platform_device *pdev)
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
> +	 * switch is on the MDIO bus. If "mdio" node is not present then there
> +	 * is definitely no MDIO switch in the DT, and also if "mdio" is not
> +	 * present then phys_mii_mask is relevant and that is not set until
> +	 * dsa_switch_setup.
> +	 */
> +	mnp =3D of_get_child_by_name(pdev->dev.of_node, "mdio");
> +	if (mnp) {
> +		of_node_put(mnp);
> +		ret =3D mt7530_setup_mdio(priv);
> +	}

[Severity: High]
Does calling mt7530_setup_mdio() here before mt7988_setup() has run cause
the later switch setup to wipe out the IRQ and PHY state, and break PHY
attachment for ports listed after the downstream switch in DT?

When the DSA tree is incomplete, dsa_register_switch() returns 0 without
running mt753x_setup() -> mt7988_setup().  Calling mt7530_setup_mdio() at
that point registers the IRQ chip (programming MT7530_SYS_INT_EN) and the
MDIO bus before mt7988_setup() has deasserted priv->rstc or configured
PHY clocks.  When the downstream switch probes on that MDIO bus and
completes the tree, dsa_tree_setup() runs mt7988_setup() on the upstream
switch:

drivers/net/dsa/mt7530.c:mt7988_setup() {
	/* Reset the switch */
	reset_control_assert(priv->rstc);
	usleep_range(20, 50);
	reset_control_deassert(priv->rstc);
	...
	/* Reset the switch PHYs */
	regmap_write(priv->regmap, MT7530_SYS_CTRL, SYS_CTRL_PHY_RST);
}

Asserting priv->rstc and SYS_CTRL_PHY_RST resets the upstream switch and
its PHYs after the IRQ controller and MDIO devices have already been
configured, and the subsequent mt7530_setup_mdio() call in mt753x_setup()
is a no-op because priv->child_bus is already set.

In addition, devm_of_mdiobus_register() probes the downstream switch
synchronously while __of_mdiobus_parse_phys() is still iterating over the
children of the "mdio" node:

mt7988_probe()
  mt7530_setup_mdio()
    priv->child_bus =3D bus;
    devm_of_mdiobus_register()
      __of_mdiobus_parse_phys()
        of_mdiobus_register_device() [downstream switch]
          ...
            dsa_register_switch()
              dsa_tree_setup()
                dsa_tree_setup_switches()
                  mt753x_setup()
                    mt7530_setup_mdio()  <-- returns 0 (priv->child_bus set)
                dsa_tree_setup_ports()
                  phylink_of_phy_connect()  <-- -ENODEV for later PHY nodes

Any PHY child nodes appearing after the downstream switch node in the
"mdio" DT node have not been registered yet when dsa_tree_setup_ports()
runs, so phylink_of_phy_connect() fails with -ENODEV and DSA disables
those ports via dsa_port_setup_as_unused().

> +
> +	return ret;
>  }

[Severity: High]
If mt7530_setup_mdio() fails here (for instance with -EPROBE_DEFER from
of_irq_get()), does returning ret without calling dsa_unregister_switch()
leave dangling pointers to priv->ds in dst->ports?

priv->ds is allocated with devm_kzalloc_obj() on &pdev->dev, whereas
dsa_register_switch() allocates non-devm dsa_port structures linked into
dst->ports with dp->ds pointing to priv->ds.  When probe fails, devres
frees priv->ds without running mt7988_remove(), leaking the dsa_port
allocations and conduit reference and causing a use-after-free when a
subsequent probe or peer switch registration walks dst->ports in
dsa_switch_find() and dereferences dp->ds->index.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 53ac692d5ba93..4390982a5e225 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
[ ... ]
> @@ -2530,7 +2525,7 @@ mt7530_free_mdio_irq(struct mt7530_priv *priv)
>  	}
>  }
> =20
> -static int
> +int
>  mt7530_setup_mdio(struct mt7530_priv *priv)
>  {
>  	struct device_node *mnp, *np =3D priv->dev->of_node;
> @@ -2540,6 +2535,14 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  	static int idx;
>  	int ret =3D 0;
> =20
> +	/* Already done */
> +	if (priv->child_bus)
> +		return 0;
> +
> +	ret =3D mt7530_setup_irq(priv);
> +	if (ret)
> +		return ret;
> +
>  	mnp =3D of_get_child_by_name(np, "mdio");
> =20
>  	if (mnp && !of_device_is_available(mnp))

[Severity: High]
Can mt7530_setup_irq() be called twice if the "mdio" child node is
disabled in DT?

When the "mdio" node has status =3D "disabled", the first call to
mt7530_setup_mdio() from mt753x_setup() runs mt7530_setup_irq() and then
jumps to out before setting priv->child_bus.  In mt7988_probe(),
of_get_child_by_name() still returns the disabled "mdio" node and calls
mt7530_setup_mdio() a second time.  Because priv->child_bus is still NULL,
mt7530_setup_irq() runs again and devm_regmap_add_irq_chip_fwnode() fails
with -EBUSY when requesting the non-shared IRQF_ONESHOT interrupt a
second time.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116183332.1688=
58-1-cjd@cjdns.fr?part=3D5
