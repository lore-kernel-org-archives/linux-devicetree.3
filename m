Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBA72165EA
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108182; cv=none; b=Z1hnmqeV93Om37Wog0pDZlXXAi3aX7zEG5mznM2Eg5Dc90d6dM344yx/u8QXvufJzYr7odOr0WKl8m46Q5ergd63eJysFg7ysHRoxnXWTQbDf7ZfpUzgFFTq25PaFECZG0miNT4GsLIX/PYrubY6C70r7ts1VFi9N77sBrWvde8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108182; c=relaxed/simple;
	bh=9WRyeQesOGcizJICaSywR/9nsoiFKE8S2F+FkZ8ooRQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nmjuNZXUvXTFaIoxzGxGQFzkCQNZMxdDrJf6aY5HoKKg30ag7IH3YAXOt2cvlPgdV3Ig4mNOBGrZ83ZPFVuVse7lP4RGOfZur6xOc4JZnqi9w9eKm8Y13K5bAvsW6dNrz1CA+vsuje/mU5SKR5X/c+8gREgbGQWQfFZ0xToCVt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ol7whxlH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ol7whxlH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C121F00893;
	Wed, 10 Jun 2026 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781108180;
	bh=R24sfsz1PW42l0tjBkS0ws+SAVnOvTDAv7FwyrbJDJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ol7whxlHJyjJICCOKW/YN5s/FAGHPuDPe/AyTVEIB8B8shgaZ44jEJEBH3bu73ySt
	 RZy1KGHXfbW/HcWUKp1SmdqPOvYvv05JdLDH/f2cU3WZXFfNi7kI2EZAThOz3b6OcM
	 dQAVg9avugjC3uquhNcYGpd7XkjA5e28ag+yE0Cr3ufddfsrL5BKrQwhB+Q2ncZDlE
	 H3dPsykuBRovBr6+s2S8+/IRN1FFjVxQ+qOyFhX0mFpUuoaD7lzeIb+uAddLMgXyZf
	 sy2S/1N3ztconOGHuYTJoXjUaHv4V1F/lU5z9qlPFgkMij6eZkV1rNUZPGoakvAqbN
	 dl1NPxMPlm7VQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 01/12] net: phylink: keep and use MAC
 supported_interfaces in phylink struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260609151212.29469-2-ansuelsmth@gmail.com>
References: <20260609151212.29469-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:16:20 +0000
Message-Id: <20260610161620.99C121F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Late modification to `config->supported_interfaces` by drivers is =
silently ignored due to by-value copying in `phylink_create()`, breaking su=
pport for devices like MTK GMAC2.
--

commit eaea53b185dbdc4c75406c542c97543c4c451c9d
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: keep and use MAC supported_interfaces in phylink struct

This patch copies supported_interfaces from phylink_config into the phylink
structure to prepare for internal PCS handling. The internal copy is then
used in place of the config structure's bitmap.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 087ac63f9193d..4d59c0dd78dbf 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -1868,6 +1873,9 @@ struct phylink *phylink_create(struct phylink_confi=
g *config,
>  	mutex_init(&pl->state_mutex);
>  	INIT_WORK(&pl->resolve, phylink_resolve);
> =20
> +	phy_interface_copy(pl->supported_interfaces,
> +			   config->supported_interfaces);
> +

[Severity: High]
Will this by-value copy break drivers that modify supported_interfaces after
calling phylink_create()?

For example, looking at the mtk_eth_soc driver in mtk_add_mac(), the
supported_interfaces bitmap is modified after phylink_create() returns:

drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_add_mac() {
        ...
        mac->phylink =3D phylink_create(&mac->phylink_config, ...);
        ...
        if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_2P5GPHY) &&
            id =3D=3D MTK_GMAC2_ID)
                __set_bit(PHY_INTERFACE_MODE_INTERNAL,
                          mac->phylink_config.supported_interfaces);
        ...
}

Since phylink_create() has already taken a snapshot of the interfaces,
this late addition of PHY_INTERFACE_MODE_INTERNAL will be dropped.=20
Could this cause phylink_validate() to incorrectly reject the internal PHY
capability for the MTK GMAC2?

>  	pl->config =3D config;
>  	if (config->type =3D=3D PHYLINK_NETDEV) {
>  		pl->netdev =3D to_net_dev(config->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609151212.2946=
9-1-ansuelsmth@gmail.com?part=3D1
