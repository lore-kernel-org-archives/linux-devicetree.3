Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795740972;
	b=B+oxItxfnuljQEvrwPLLgStoPpjfLSnr7zmIwSli/96odQrB2e6JmtRsvoF9SBNd9hac
	 ZeHk5CNmg8swk/LS6kX7v6+EejPXGekyREiriJg05uXM0DRxKzPRiTsl0BDKrwg76oeI9
	 Hz+a7ghvoqznNwJldhM0lBz2dI3nmnXvyY1q5BV4hjEdTfOu7zUIxCqSibUxD6yYNn5yg
	 leG/7dm+EhEtKT4DR1H8tvuHk9+qh3/UAdpwU4VjFvZjpodj44zHj1+ICWD91qjFo+dkv
	 wMfImNyuVRG+tikZ2VVWa4o6x0kC6vbj8iQFYIIdoh0Bc4GFNG8jJsZnxmCqwKG1nzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795740972;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A/otKmlnjlopKzmwaRv1642yRf2Bph3BIO8QzAG+qA4=;
	b=GYG9s44XCAtJ3l7MmYQc/DSuELqx/NI1ZZF1Oegj0OH5J1ODGfQlt0crdYBlyNFK2sUj
	 kGTe9pp1nkvYlKBVX+kUHZ4ldxtJe/1367C3oQJpjXfua+JNNEPFpbcaAoB98pYDBhm3l
	 ZwUi7Vg2EvAeljbbFI3Okse3Gf46TCiaUoE2r/RvvtmLZ8sTLj5+qBv0oL9C0iZaC0uzQ
	 V2ZF3hUYiLNcgZHZY+GdcgurTD9S4FPL8gFeo0hI+ZjXVJWWwUimGVpNCMwZnVdx+wqT9
	 SxRC22TXsd7lcij1cO0X7CN1zrTJ7vmzrOYFa4xm0+eB+SBPz2Wh18KwklQrM2uyvCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EXgGi0zf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C37606A324
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EXgGi0zf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DE71F00897;
	Fri, 27 Nov 2026 00:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795740971;
	bh=A/otKmlnjlopKzmwaRv1642yRf2Bph3BIO8QzAG+qA4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EXgGi0zfwjp/NpMzeUvPi92h+qECCTaoOr7VS1z+YCfWArSkUi+vGavA1NZQZlNLn
	 TXBMJX42PHvIkAVDQ6op0FVoifTqqb6TQ/gyi1qvOy64ncFuYvLXHh0PYNFqfy7Et8
	 65LoguPQf1roZy3uLzbjt+9+mi7cK1kMewvs9BtZRbIE6709MooAqAMYRTryBMskR0
	 Dcvdxe3m5DIsu65UhcrSfOg6A/37qciqfo02soMgRni6GUmmVkzEl/106zQdK9ao0H
	 KLraBM3iLlW+KJCatCMGoz4gpR4EDzwP9qs8hm5OGJw3nNjNS8p28c32m908EFOWff
	 S+Nk89UoAN/rQ==
Message-ID: <sashiko-outbox-236380@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 5/5] net: hix5hd2_gmac: Support fixed-link
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Yang" <mmyangfl@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126005524.4156940-6-mmyangfl@gmail.com>
References: <20261126005524.4156940-1-mmyangfl@gmail.com>
 <20261126005524.4156940-6-mmyangfl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 00:56:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] net: hix5hd2_gmac: NULL dereference in hix5hd2_dev_remove() on
  fixed-link
- [Medium] net: hix5hd2_gmac: broken phy-handle precedence in
  hix5hd2_dev_probe()
--

commit 557f552e688f91f0f04fafd2daf29129d331e0f6
Author: David Yang <mmyangfl@gmail.com>

net: hix5hd2_gmac: Support fixed-link

This commit adds fixed-link support to hix5hd2_gmac by registering a fixed
PHY when no phy-handle is present and skipping MDIO bus registration unless
an mdio child node is defined.

> diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/=
ethernet/hisilicon/hix5hd2_gmac.c
> index b3b2aa1b76988..eeb7221c0cde8 100644
> --- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> +++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> @@ -1176,37 +1176,55 @@ static int hix5hd2_dev_probe(struct platform_devi=
ce *pdev)
>  		hix5hd2_phy_reset(priv);
>  	}
> =20
> -	bus =3D devm_mdiobus_alloc(dev);
> -	if (bus =3D=3D NULL) {
> -		ret =3D -ENOMEM;
> +	priv->phy_node =3D of_parse_phandle(node, "phy-handle", 0);
> +
> +	/* In the case of a fixed PHY, the DT node associated
> +	 * to the PHY is the Ethernet MAC DT node.
> +	 */
> +	if (!priv->phy_node && of_phy_is_fixed_link(node)) {
> +		ret =3D of_phy_register_fixed_link(node);
> +		if (ret < 0)
> +			goto out_disable_clk;
> +		priv->phy_node =3D of_node_get(node);
> +	} else if (!priv->phy_node) {
> +		netdev_err(ndev, "not find phy-handle\n");
> +		ret =3D -EINVAL;
>  		goto out_disable_clk;
>  	}
> =20
> -	bus->priv =3D priv;
> -	bus->name =3D "hix5hd2_mii_bus";
> -	bus->read =3D hix5hd2_mdio_read;
> -	bus->write =3D hix5hd2_mdio_write;
> -	bus->parent =3D &pdev->dev;
> -	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
> -	priv->bus =3D bus;
> -
> +	bus =3D NULL;
>  	mdio_np =3D of_get_available_child_by_name(node, "mdio");
> -	ret =3D of_mdiobus_register(bus, mdio_np ?: node);
> +	if (mdio_np || (priv->phy_node !=3D node &&
> +			!of_phy_is_fixed_link(node))) {

[Severity: Medium]
Does checking !of_phy_is_fixed_link(node) here break phy-handle precedence
when the MAC node has both phy-handle and managed =3D "in-band-status"
without an mdio child node?

In that configuration of_phy_is_fixed_link(node) is true even though
priv->phy_node !=3D node, so hix5hd2_dev_probe() skips registering the MDIO
bus and of_phy_connect() in hix5hd2_net_open() fails to find the PHY.
Since priv->phy_node =3D=3D node already tracks whether a fixed link was
registered, checking if (mdio_np || priv->phy_node !=3D node) would avoid
this.

[ ... ]

> @@ -1271,9 +1289,11 @@ static int hix5hd2_dev_probe(struct platform_devic=
e *pdev)
>  	netif_napi_del(&priv->napi);
>  	hix5hd2_destroy_hw_desc_queue(priv);
>  out_phy_node:
> +	if (priv->phy_node =3D=3D node)
> +		of_phy_deregister_fixed_link(node);
>  	of_node_put(priv->phy_node);
> -err_mdiobus:
> -	mdiobus_unregister(bus);
> +	if (bus)
> +		mdiobus_unregister(bus);
>  out_disable_clk:
>  	clk_disable_unprepare(priv->mac_ifc_clk);
>  out_disable_mac_core_clk:
> @@ -1294,6 +1314,8 @@ static void hix5hd2_dev_remove(struct platform_devi=
ce *pdev)
>  	if (HAS_CAP_TSO(priv->hw_cap))
>  		hix5hd2_destroy_sg_desc_queue(priv);
>  	hix5hd2_destroy_hw_desc_queue(priv);
> +	if (priv->phy_node =3D=3D pdev->dev.of_node)
> +		of_phy_deregister_fixed_link(pdev->dev.of_node);
>  	of_node_put(priv->phy_node);
>  }

[Severity: High]
Does hix5hd2_dev_remove() trigger a NULL pointer dereference in
mdiobus_unregister(priv->bus) when a fixed-link device has no mdio child
node?

When MDIO bus registration is skipped in hix5hd2_dev_probe(), priv->bus
remains NULL.  The probe error path guards mdiobus_unregister() with
if (bus), but hix5hd2_dev_remove() still calls
mdiobus_unregister(priv->bus) unconditionally, and mdiobus_unregister()
immediately dereferences bus->state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126005524.4156=
940-1-mmyangfl@gmail.com?part=3D5
