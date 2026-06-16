Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EE935E95E
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620338; cv=none; b=XfmnoMSOd7rg1YSVYhIjQGzjTU2bXK9HKS6P+cJPgzI0ymggjq8/tMOY18v3cw9km6DpVyjn4UdA8tUuacvu4GNvdEBVvmVkvYliDHpn6edkIEOLKeCEAEnTYUn7lu6Lu08yhw8anzALYGpLnFNIWa5ow7rOx9tA8zS3p1azeAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620338; c=relaxed/simple;
	bh=7au35EzbsUT155SIFSpjTJv5nGdz4bC+absIah/nf30=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g77h6Uzy6NHHBu99rkeuaDUSBUqoXLji5DHcLlJR2DJ2XCkWerukeDxzaLdBlhJCASIuek0pmshoo7iBpeJZBh+XE0ixCSUCQQYq+1iV0xQ9EdkizQKDUVM568zg26WCLhPlPMzj7WG3Labkf6PiJcRgMNVgE4V0xM1sosCOW9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m3t7UlV0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m3t7UlV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F091F00A3A;
	Tue, 16 Jun 2026 14:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781620337;
	bh=NlIO/H6XdaztKK7FEWDtD2cPGSXi+n1fhdOJMDXYznw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m3t7UlV0aL2ysctu+Y2U7P8Y5S4v1ztzuUxaCPZMOAL+6mEaCmRdyYUSvmvzvHpOt
	 ud3l3KN12fG4vw/FaoHczNcmqSeEVOr8J5O6h1IB0BpLj59S1tYPu1Mr/fJbfkmUPR
	 4KrSAEmUmT5Lwoov4YJVXyoJoWKBMWzNM4a9chV0Cs3But0HF6R4yU+1QOfvYniPHu
	 EMljkrhiRmmfxu8CfZ0xtkF/4/oeMICS/kFQfVPX7mcLTUTuE+oaYkmiWJTSj9bMk2
	 veMooSSlSycAjEh9gzkGtyxabeahQaI7tQ/7y4h6wQbOwl2SzaNnrUvQpbizCvmoHI
	 6CoWTRp5yw39g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 01/12] net: phylink: keep and use MAC
 supported_interfaces in phylink struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615122950.22281-2-ansuelsmth@gmail.com>
References: <20260615122950.22281-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 14:32:16 +0000
Message-Id: <20260616143217.48F091F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch makes a one-time copy of `supported_interfaces` during `=
phylink_create()`, which breaks drivers like `mtk_eth_soc` that modify `phy=
link_config.supported_interfaces` after calling `phylink_create()`.
--

commit c809e12abb9cfbf31d18f5e71f4e3d15bb4f6a01
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: keep and use MAC supported_interfaces in phylink struct

This patch introduces a cached copy of the supported_interfaces mask in the
phylink struct. It initializes this copy during phylink_create() and
transitions the phylink core to validate against this internal mask rather
than the original phylink_config.

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
Does this one-time copy in phylink_create() break drivers that modify their
supported_interfaces after initialization?

For example, in drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_add_mac(),
the driver appends PHY_INTERFACE_MODE_INTERNAL to
mac->phylink_config.supported_interfaces after phylink_create() has already
been called:

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

Since phylink now validates against the cached pl->supported_interfaces mas=
k,
will it reject PHY_INTERFACE_MODE_INTERNAL as unsupported and prevent the
internal 2.5G PHY from linking successfully on affected Mediatek platforms?

>  	pl->config =3D config;
>  	if (config->type =3D=3D PHYLINK_NETDEV) {
>  		pl->netdev =3D to_net_dev(config->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615122950.2228=
1-1-ansuelsmth@gmail.com?part=3D1
