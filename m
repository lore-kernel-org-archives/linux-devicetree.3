Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16F435200F
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 17:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568428; cv=none; b=TBbnlrqHRTnsc3efN+8j316haDE/hiq3CN4s2Dkl0Xy0/aAlj1Em0+RVLQqo4oMSQqYtRuMWtK9GvsI0bXTLt3rFECRjYz38f84+34NacSbBd+3JOyQdyyOdgdFTfrWMSLZEXi4yN1vcYevyy1MmTsOVpCKJVLlalrpjm8rZsac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568428; c=relaxed/simple;
	bh=iowyLZgNAongVrqMEDK2sfiwEOsPQVLYKXqHZwU6fnM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kiISqzWZu3k8V+cMrn946HOIr83IjBZcLbiOx83nMYF+yEJx/ESUDyX8ZcQ0DujX12V5V5nhQuSj2JK+WEYXPzylYD6IC3kYQTGPKP5PYE/lEGznBV5rpMIOdrhlW+SBJ2tBbBveoaWfU9fgYrnqoYS9An2bHUb8mwHG7FBYMYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X3+baSHM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X3+baSHM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609221F00893;
	Fri,  9 Oct 2026 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791568427;
	bh=NlmxAezlbbDavXiUF5iKxTYkqWQlhBKyMuc3lLrdJcU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X3+baSHMNhfXtiZXHX+XcZ/+O16dO2YzFGY0W9QMZ2bpWP3Trt2T70XxWVWIDDW2f
	 7CkPm2CrAddFeCXpyJzt69lCCsKP6+ISx2Ala4dvIq6oemaE2lGYWHaHSAFygfSwDK
	 UwLM/VtmURZsLtO5KE0pryXRqYnMkUOenioIIvFKxdvhO5kINxrCuamzi6O0X54S1W
	 UgSAoYkz7TzMQKW7I9o3l5SbNkk3m+rKbg8NglXDpB47HFdbqO6Hxrv821CvIfIBav
	 3u1ESv6ROo8cWlnsvY38EppcZ9FokBsWCPi+SOS9v42Ato7zDHfRaCraJDVgutoRtt
	 X5nNVCErfMW4Q==
Message-ID: <sashiko-outbox-165904@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 5/6] net: stmmac: dwmac-rk: add SGMII
 support for RK3568
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261008175225.3375274-6-coiaprant@gmail.com>
References: <20261008175225.3375274-1-coiaprant@gmail.com>
 <20261008175225.3375274-6-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 17:53:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: stmmac: dw_xpcs memory leak and overwrite in stmmac_pcs_setup
--

commit de93d801ba1c997500b23cca54a77392e6107f28
Author: Coia Prant <coiaprant@gmail.com>

net: stmmac: dwmac-rk: add SGMII support for RK3568

The RK3568 SoC integrates a Synopsys DesignWare XPCS that can be connected
to GMAC0 or GMAC1 in SGMII mode. This commit adds the necessary glue logic
to support this configuration in the dwmac-rk driver.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part1%20V1.1-20210301.pdf (Page 386)

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac-rk.c
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
[ ... ]
> @@ -1211,6 +1239,44 @@ static void rk_phy_powerdown(struct rk_priv_data *=
bsp_priv)
[ ... ]
> +static int rk_pcs_init(struct stmmac_priv *priv)
> +{
> +	struct rk_priv_data *bsp_priv =3D priv->plat->bsp_priv;
> +	struct device_node *node =3D priv->device->of_node;
> +	struct device_node *pcs_node;
> +	struct dw_xpcs *xpcs;
> +
> +	pcs_node =3D of_parse_phandle(node, "pcs-handle", 0);
> +	if (!pcs_node)
> +		return -ENODEV;
> +
> +	xpcs =3D xpcs_rk_create(priv->device, pcs_node, bsp_priv->id);
> +	of_node_put(pcs_node);
> +	if (IS_ERR(xpcs))
> +		return PTR_ERR(xpcs);
> +
> +	priv->hw->xpcs =3D xpcs;
> +	return 0;
> +}

[Severity: High]
Does this code leak the newly allocated XPCS instance when interacting with
stmmac_pcs_setup() in the core driver?

Looking at stmmac_pcs_setup() in drivers/net/ethernet/stmicro/stmmac/stmmac=
_mdio.c,
it declares a local xpcs variable initialized to NULL:

int stmmac_pcs_setup(struct net_device *ndev)
{
	struct dw_xpcs *xpcs =3D NULL;
	...
	if (priv->plat->pcs_init) {
		ret =3D priv->plat->pcs_init(priv);
	...
	priv->hw->xpcs =3D xpcs;

	return 0;
}

Because rk_pcs_init() successfully allocates the XPCS and assigns it direct=
ly
to priv->hw->xpcs, it returns 0.

The local variable xpcs in stmmac_pcs_setup() remains NULL. At the end of
stmmac_pcs_setup(), it unconditionally overwrites the newly allocated point=
er
in priv->hw->xpcs with NULL.

Will this cause the MAC to lose its PCS reference and break SGMII link
negotiation?

Additionally, does this leak the dw_xpcs object memory, since teardown
functions like rk_pcs_exit() will see a NULL pointer and exit early?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008175225.3375=
274-1-coiaprant@gmail.com?part=3D5
