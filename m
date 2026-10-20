Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792465319;
	b=cgzXmLIZKpi8wN59s47kBiGf9vrA/i+yuq1e++NGhDug5xWZhghWpoYb1OLARqqTCvGi
	 UitqE7ae635dfI3UiPT29eh3xZ3Z8Ie+R7PQ6KDqWdKEFV6Vy497U95XrtyL+zaO4Fln0
	 aO9ADZ/pQ1n91BXSHTjFt8yQ/l+0PJaHMzBZYhQrj2FVx2yMxfDmVHQu0ziYOQXlUhsH9
	 kEb6gfMMNHD/CpbDAwDuS7WvSxhtV7ZLWbeNdaarWEaRRc0ZwxGMJ2ZE7Lxa8fXd57T2d
	 owJvXmBZvo7JdF002W/U8JwjicKGz9krvD9Nz6cJGNF7q81rzYzT68BssTM7/CPvneQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465319;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=s86V4lyVzxuh22a3JwSPvLI18pfbUJtOmFMZOFIG+vM=;
	b=eePS0gf3g32Zicf6EU/DseJ7JxwyMmPpHzE0n0UkPNmNSoh0ybYlkDnSPx8BFITk6yj7
	 aqBG32t+IxNADX1yq0vxQi8ApegmBxgs1McLxVG2vQR/2xaihtRspbkQQdVoFqZZwzErO
	 cCCo3IC9BTDVzqmzcFAqB7EkWHO4nw9jgX2h4uHxJ0YGLF9k8Tn95kGmT8rQRzDFnf/R/
	 gk15l/MTCc3bOYWfBnZ4DiV8v0xJ2S911Ce/srn6mXTtU5e5IcTDw6GrfhDywJ/fv3m3V
	 tf5Fak3+dRxGVo6RSB1Lgv7uWR1ClF68ROOqedMxk7WNPh+t4Hg+heN6gLUrjNoWGqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DreKmRlR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3173606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DreKmRlR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BF11F000C5;
	Tue, 20 Oct 2026 03:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792465318;
	bh=s86V4lyVzxuh22a3JwSPvLI18pfbUJtOmFMZOFIG+vM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DreKmRlRk7+2qoHnRQJHg23/NMlMT9cw/ZbZNsTDjxCAIadNR+5U5jiZ97Ha0LpJU
	 ghhaWfSIhHA5VHNnGmCg3wrh8l3XdxuaFCMDmrmo2CEBMKNkYuvsB87Yftd+coIoJH
	 C2mslGPujgDWE+qPtu2wH58kMYMwW9haA21J2GTL7LHbM6qhci1vxZMTGLDzIaMSB1
	 p+GAvU6qClWFhQaG9gpIT/1CBM8JdNHvERBtl0QqcxwkGH5f29cAoqRrjjgGk4LIIf
	 yhk5Sbflj8oX/Rgt5obJrXqc7t+ogxYG+Kz5jttM0upL9nqqpfx+WsdpHVX6lJa2cP
	 bb2MsHJwPHimA==
Message-ID: <sashiko-outbox-178427@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/5] net: pcs: pcs-xpcs-regmap: support XPCS
 memory-mapped MDIO bus via regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019030129.1470307-3-elder@riscstar.com>
References: <20261019030129.1470307-1-elder@riscstar.com>
 <20261019030129.1470307-3-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 03:01:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: pcs: MDIO bus ID collision in devm_xpcs_regmap_register()
--

commit f4103deca1c1d0d48e4d0e095369247a1ba3779b
Author: Daniel Thompson <daniel@riscstar.com>

net: pcs: pcs-xpcs-regmap: support XPCS memory-mapped MDIO bus via regmap

This commit introduces devm_xpcs_regmap_register() and indirect MDIO CSR
access helpers so drivers can register a DesignWare XPCS instance backed by=
 a
regmap.

> diff --git a/drivers/net/pcs/pcs-xpcs-regmap.c b/drivers/net/pcs/pcs-xpcs=
-regmap.c
> new file mode 100644
> index 0000000000000..f3f3aaaf0b75a
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-regmap.c
> @@ -0,0 +1,169 @@

[ ... ]

> +struct dw_xpcs *devm_xpcs_regmap_register(struct device *dev,
> +					  struct regmap *regmap)
> +{
> +	static atomic_t id =3D ATOMIC_INIT(-1);
> +	struct dw_xpcs *xpcs;
> +	struct mii_bus *bus;
> +	int ret;
> +
> +	bus =3D devm_mdiobus_alloc_size(dev, 0);
> +	if (!bus)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bus->name =3D "DW XPCS MCI/APB3";
> +	bus->read =3D xpcs_regmap_read_c22;
> +	bus->write =3D xpcs_regmap_write_c22;
> +	bus->read_c45 =3D xpcs_regmap_read_c45;
> +	bus->write_c45 =3D xpcs_regmap_write_c45;
> +	bus->phy_mask =3D ~0;
> +	bus->parent =3D dev;
> +	bus->priv =3D regmap;
> +
> +	snprintf(bus->id, sizeof(bus->id), "dwxpcs-%x", atomic_inc_return(&id));

[Severity: Medium]
Can bus->id collide with an existing platform DW XPCS bus here?

In drivers/net/pcs/pcs-xpcs-plat.c, xpcs_plat_init_bus() defines its own
separate static atomic counter and uses the identical "dwxpcs-%x" format
string:

drivers/net/pcs/pcs-xpcs-plat.c:xpcs_plat_init_bus() {
	static atomic_t id =3D ATOMIC_INIT(-1);
	...
	snprintf(pxpcs->bus->id, MII_BUS_ID_SIZE,
		 "dwxpcs-%x", atomic_inc_return(&id));
}

If a system probes both a platform DW XPCS via xpcs_plat_probe() ->
xpcs_plat_init_bus() and a regmap DW XPCS via devm_xpcs_regmap_register()
(for example, an SoC with a platform XPCS and a PCIe Toshiba TC9564 card),
both counters start at -1 and format their first bus->id as "dwxpcs-0".

When devm_mdiobus_register() calls __mdiobus_register() -> device_register(=
),
device_add_class_symlinks() tries to create the class symlink under
/sys/class/mdio_bus/dwxpcs-0, which fails with -EEXIST and causes
__mdiobus_register() to fail with -EINVAL.

Should devm_xpcs_regmap_register() use a distinct prefix (such as
"dwxpcs-regmap-%x") or share a common counter or IDA with
xpcs_plat_init_bus()?

> +
> +	/* MDIO-bus here serves as just a back-end engine abstracting out
> +	 * the MDIO and MCI/APB3 IO interfaces utilized for the DW XPCS CSRs
> +	 * access.
> +	 */
> +	ret =3D devm_mdiobus_register(dev, bus);

[ ... ]

> +}
> +EXPORT_SYMBOL_GPL(devm_xpcs_regmap_register);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019030129.1470=
307-1-elder@riscstar.com?part=3D2
