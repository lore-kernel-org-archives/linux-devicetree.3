Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9D249BD73
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049495; cv=none; b=CTYtK/69Vcd2m5Kz3HLj52r3Z1pgFD/F7OuVphl0R845iBGF+/U8r85oUhgE2nsSqnv2UaFObEDSxZiV9UobRRquCKOweXsFuDmix7eyWzPS2UUFZBzmJ7cak9zf/7niKcqsyUnmwGqrzgdUM64RUg0ObyPCFJMQxA0UCfpber4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049495; c=relaxed/simple;
	bh=Hv3vW/LEWUkV+XtytW9GWZbXSGcMkJtqxF/UQhk9LQ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YGRiAsjRb09gQQtN1HaEkANAec079wOFbdaVDuSmhPBEVEwYVywwGTXtYTcl8rGwxTJdqGvrd8kKqXCAHh6upX2OirnftYr8svT3klXC1BP8MknvbjPnpUfWLeIS6osh/SH9Nohg7Xb6vgINCBc7UQHcODeZtL49vf2Mkzvm668=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bcxedpik; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bcxedpik"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22A51F00893;
	Thu, 10 Sep 2026 14:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049493;
	bh=+Bfd4YcjXARryfwXtBEVgeES9jDcCdBPfceBU1ADTDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bcxedpikbz+UUd23aOQdfdLBytCCrLSV94Pk3PF8CAgwOGeoRjTcFY5W4h7SaMmkV
	 LLOzq5nLLhDQr9Zt3fX/Wi7QD41Up9p6zIw2USsvgzDNYIaAVGGzVE0y5ZnleGodnF
	 5x8YQfqLYWM8qpDqxFk83mR7jGCAv56BrClhuQfWPivmqgcQPnjKR5hcA8Nzfu2UK1
	 PM1RoeIeiF8GtWOKIyruNmb4mp6v7sLOnqT1YfT0R/COlESHZBj/G/nHOMM/erX8HJ
	 EWcEFalfTYgEvVbEg78hHqG7eHuX+08OwOy8FsEMKoUIwoc1dVQ/WGrIFEoe0UOrOb
	 5o0+dINDrIYsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 5/7] net: dsa: mediatek: support MDIO switch
 downstream of MMIO switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909140346.2861572-6-cjd@cjdns.fr>
References: <20260909140346.2861572-1-cjd@cjdns.fr>
 <20260909140346.2861572-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:11:32 +0000
Message-Id: <20260910141132.B22A51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing dsa_unregister_switch() on the error path in mt7988_probe(=
) leads to a Use-After-Free in the DSA core.
- [High] Race condition between mt7988_probe() and mt753x_setup() leading t=
o double initialization of the MDIO bus.
- [High] PHY IRQ setup is skipped when mt7530_setup_mdio() is called from m=
t7988_probe() and the DSA tree is initially incomplete.
- [Medium] Data race on the static variable idx when allocating MDIO bus ID=
s in mt7530_setup_mdio().
--

commit ff8217ffff0d9218375ba11bf6c77febbfa2ceba
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: support MDIO switch downstream of MMIO switch
   =20
This commit updates mt7530_setup_mdio() so it can be called multiple
times and exports it. It then calls mt7530_setup_mdio() at the end
of mt7988_probe() to allow a downstream MDIO switch to register
when the upstream switch connects via MMIO.

> diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
> index cf3bdb23a2d54..29fbd0fc50d1a 100644
> --- a/drivers/net/dsa/mt7530-mmio.c
> +++ b/drivers/net/dsa/mt7530-mmio.c
> @@ -61,7 +61,12 @@ mt7988_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->regmap))
>  		return PTR_ERR(priv->regmap);
> =20
> -	return dsa_register_switch(priv->ds);
> +	ret =3D dsa_register_switch(priv->ds);
> +
> +	if (ret)
> +		return ret;
> +
> +	return mt7530_setup_mdio(priv);

[Severity: High]
Does this code leak the registered DSA switch on the error path?

If mt7530_setup_mdio() fails, the probe function returns the error directly
without calling dsa_unregister_switch(priv->ds).=20

This can cause devres cleanup to free the priv->ds structure while the DSA
subsystem still holds pointers to it, potentially leading to a use-after-fr=
ee
if the DSA core attempts to access the partially registered switch later.

>  }
> =20
>  static void mt7988_remove(struct platform_device *pdev)

[ ... ]

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index a165b4c8ed8d7..0c0c5358b8b80 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2414,6 +2414,10 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  	static int idx;

[Severity: Medium]
Does this code have a data race on idx when allocating MDIO bus IDs?

mt7988_probe() now calls mt7530_setup_mdio() directly without holding the
dsa2_mutex.=20

If multiple MMIO MT7530-compatible switches are probed concurrently, they
could execute the unlocked idx++ at the same time, potentially generating
duplicate MDIO bus IDs and causing sysfs registration to fail.

>  	int ret =3D 0;
> =20
> +	/* Already done */
> +	if (priv->child_bus)
> +		return 0;

[Severity: High]
Can concurrent callers bypass this check and execute the MDIO setup logic
twice?

mt7988_probe() now calls mt7530_setup_mdio() outside of any lock. If a
sibling switch completes the DSA tree concurrently, dsa_tree_setup() can
call mt753x_setup() under the dsa2_mutex, which also calls
mt7530_setup_mdio().=20

Both threads could simultaneously observe priv->child_bus =3D=3D NULL, lead=
ing
to corrupted pointer states and duplicate MDIO bus registrations.


[Severity: High]
Will this early return permanently skip PHY IRQ setup if the DSA tree is
initially incomplete?

If mt7988_probe() calls mt7530_setup_mdio() while the DSA tree is incomplet=
e,
mt753x_setup() will not have run yet, so priv->irq_domain will be NULL and
IRQ setup is skipped.

Later, when the tree completes and mt753x_setup() is executed, it will set =
up
the irq_domain and call mt7530_setup_mdio() again.=20

However, since priv->child_bus is already set from the earlier probe call,
this check will return 0 immediately, and mt7530_setup_mdio_irq(priv) will
never be executed for those ports.

> +
>  	mnp =3D of_get_child_by_name(np, "mdio");
> =20
>  	if (mnp && !of_device_is_available(mnp))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909140346.2861=
572-1-cjd@cjdns.fr?part=3D5
