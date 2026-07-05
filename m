Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24FE25B0BC
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 10:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783249103; cv=none; b=YH1nh81jgGq1GlD4HyTrdEE+Kou54zpcHycp8uOO1AAlYTOJt0V70FaKEh4SvoksgGQ5PKsw1CSOBKpWrHGuC6vNwmp4e+ZXYoyTMSMSyVWhjetDj+Ib/MDsbKbaXAfM8Ne5h3cwQ8CnKkYX8PaH11pdKaJzC4Ngq/HEM3JImDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783249103; c=relaxed/simple;
	bh=xdK2SFghiV6cycxmwMWDJBdA9eIMFKelh9AtkZGke3w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=laTQeIxKyiIL1b94j5lUfYs3vnbIlaKyX6IysyD81wik0GFfvbpee3sfsRtr1kO1zqJrb11QgiiH31W0UaEL3owtdeayqO4ADYzXGqMkQr6SzWzjGElc/vR1Aw7zh3y3/K9EEjuFQJHYrhPE7opEceRMglt6YNP6P42ujgtXqtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OW8eVUZi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OW8eVUZi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9911F000E9;
	Sun,  5 Jul 2026 10:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783249101;
	bh=mvuaQt2XM/K6D1wxv42bK0JXwewGZ1CKS94DJTQo8YQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OW8eVUZihgJLLixpo2zef2DW7ymABzaH/yH7mNH6ruwWA/L/2bGqOk8OrZVvkwk+A
	 rQOIH1nOMzzAPvL5iSyTvQXKc1fBMrLiIr+ok2C+IbBsOkEwPop4Opn6X8HuD+t3PP
	 LfZApZCR/QOmFzu8cD2vsXN56RHEyKufZ/k0Hp70X9RmAGUk7SUynohbTOlpzgApfw
	 nUiYItJtYLbM/79Q588rGNyu5r18TYLwtbzN9W/OKRQhuPPvg3eeMpNeQf/BUTpz3F
	 5ym2D86p+aZ4yX4fy6svBInDj2xUvDpTTFmNwXjT56IaCm8c7PArYf6a5eBaFk+xmI
	 UKN32LZNVcFew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 4/4] net: dsa: initial support for MT7628
 embedded switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joris Vaisvila" <joey@tinyisr.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260704105659.140970-5-joey@tinyisr.com>
References: <20260704105659.140970-1-joey@tinyisr.com>
 <20260704105659.140970-5-joey@tinyisr.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 10:58:20 +0000
Message-Id: <20260705105821.1D9911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] MDIO bus is allocated and registered using devm_* in the setup cal=
lback, leading to resource leaks and name collisions.
- [High] The switch hardware is not explicitly isolated immediately after r=
eset, creating a persistent window where traffic can leak across all physic=
al ports.
- [Low] NET_DSA_MT7628 fails to select REGMAP_MMIO and lacks architectural/=
IOMEM dependencies, leading to build and link failures on randconfig.
--

commit 1fc6f79da05a91b1b381be13133c0c6902366d8f
Author: Joris Vaisvila <joey@tinyisr.com>

net: dsa: initial support for MT7628 embedded switch

Add support for the MT7628 embedded switch. The switch has 5 built-in
100Mbps user ports and one 1Gbps CPU port.

> diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
> index 4ab567c5bbafc..daa1d3d4ba609 100644
> --- a/drivers/net/dsa/Kconfig
> +++ b/drivers/net/dsa/Kconfig
> @@ -63,6 +63,14 @@ config NET_DSA_MT7530_MMIO
>  	  are directly mapped into the SoCs register space rather than being
>  	  accessible via MDIO.
> =20
> +config NET_DSA_MT7628
> +	tristate "MediaTek MT7628 Embedded Ethernet switch support"
> +	select NET_DSA_TAG_MT7628
> +	select MEDIATEK_FE_SOC_PHY
> +	help

[Severity: Low]
Can this lead to a build or link failure on randconfig? It looks like this
is missing a select REGMAP_MMIO and depends on HAS_IOMEM, which might cause
devm_regmap_init_mmio() to be unresolved when CONFIG_REGMAP_MMIO is not set.

> diff --git a/drivers/net/dsa/mt7628.c b/drivers/net/dsa/mt7628.c
> new file mode 100644
> index 0000000000000..eccdb05fce9b7
> --- /dev/null
> +++ b/drivers/net/dsa/mt7628.c
> @@ -0,0 +1,649 @@
> [ ... ]
> +static int mt7628_setup_internal_mdio(struct dsa_switch *ds)
> +{
> +	struct mt7628_esw *esw =3D ds->priv;
> +	struct device *dev =3D ds->dev;
> +	struct mii_bus *bus;
> +
> +	bus =3D devm_mdiobus_alloc(dev);
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	bus->name =3D "MT7628 internal MDIO bus";
> +	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(dev));
> +	bus->priv =3D esw;
> +	bus->read =3D mt7628_mii_read;
> +	bus->write =3D mt7628_mii_write;
> +	bus->parent =3D dev;
> +
> +	ds->user_mii_bus =3D bus;
> +	bus->phy_mask =3D ~ds->phys_mii_mask;
> +
> +	return devm_mdiobus_register(dev, bus);
> +}

[Severity: High]
Does this cause a resource leak and sysfs name collision if the switch setup
callback runs multiple times?

If the DSA master device unbinds and rebinds, dsa_tree_teardown() and
dsa_tree_setup() can be triggered again. Because devm_mdiobus_alloc() and
devm_mdiobus_register() tie the resource to the platform device's lifetime
rather than the DSA tree setup/teardown cycle, the first registration will
leak, and the second might fail with -EEXIST.

> [ ... ]
> +static void mt7628_switch_init(struct dsa_switch *ds)
> +{
> +	struct mt7628_esw *esw =3D ds->priv;
> +
> +	regmap_write(esw->regmap, MT7628_ESW_REG_FCT0,
> +		     FIELD_PREP(MT7628_ESW_FCT0_DROP_SET_TH, 0x50) |
> +		     FIELD_PREP(MT7628_ESW_FCT0_DROP_RLS_TH, 0x78) |
> +		     FIELD_PREP(MT7628_ESW_FCT0_FC_SET_TH, 0xa0) |
> +		     FIELD_PREP(MT7628_ESW_FCT0_FC_RLS_TH, 0xc8));

[Severity: High]
Can traffic leak across isolated ports (like WAN and LAN) during boot?

It looks like mt7628_switch_init() resets the switch but fails to explicitly
set the MT7628_ESW_POC0_PORT_DISABLE bits for the user ports. Since the
DSA core relies on port_disable during ndo_close and doesn't automatically
disable ports upon initialization, does the hardware default to acting as
an unmanaged switch, bridging all networks until the interfaces are brought
up administratively?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704105659.1409=
70-1-joey@tinyisr.com?part=3D4
