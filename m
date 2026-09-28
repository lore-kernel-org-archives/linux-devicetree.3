Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156A4298CC4
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580097; cv=none; b=V8uBmNkv89yOX6WO/9iHOGDP1noF7woUzKeX52IhOaB3cq1QyrbV0aQ+7I8M5J43ZEt4KPuVl3AU6wvF7aFFJPyEh+ZA4keVX70pQ9TZycTbU1iRK4VKpcl8tR9bmo+0DGP+VUGx37WashlpjZR+QJxis2QBzu+JgGhC5Ftcmhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580097; c=relaxed/simple;
	bh=XSpmcLmAi/kxH3wy8DCW9+TENNrsrniescjfK8p8t7M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FUbxnnttJU/0yr/cULYf8Ov9ytumWVEsxZ5HYW9HcIvNgVV5ZKFKIvE2buDeK082zQuF/Iw1dMAb1r76GHUBwHo5RGf5EbdeImAJYgWb6apIa66S8hqvsaKL42jJpHTCz/lOFqu9Kb8snVv+ATW3yweRLrHLxma/3qJilygzd0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4RfSzlR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4RfSzlR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6283E1F00898;
	Mon, 28 Sep 2026 07:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790580095;
	bh=L3BU/tTM8277SAzDbRH2UdfTK/Bb0gFgSaueRDOGoL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E4RfSzlRzZ6n6iHIq5VYXIxxR+CDzBunDP5B8J1PvWExXcAs2ZSMH+wJDU0BcVqWH
	 iPMkBvM1h7U6X3uwdrSRNPaNtdxFm2lqH8Xw0zey1696vlZ5ZpzlUuNPJdvRYYrQ3u
	 sZ5HCLP5pV7iUtgoT3bQ7Kw2Hzy1gXNeYgfeqyoL8+oZb4Oi1dsUArDUTzHcXsyHYZ
	 h9nw+rs6uF2KHCVFX4cNZtT3lxi8QIx5FtuPGhuR41+5FmiHtiz7b/GNsfIQKtyRkG
	 K11kWOOFvQ4itkrB0DS6DN1Pz/MhSGxO1HXYyxlQxGGvZatR1INjn1fhHwhvukRaFx
	 NdcLTpUdQY4Rg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] net: ftgmac100: Enable AST2700 RMII support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260927-support_ast2700-v1-3-9f03f29d2c82@aspeedtech.com>
References: <20260927-support_ast2700-v1-0-9f03f29d2c82@aspeedtech.com>
 <20260927-support_ast2700-v1-3-9f03f29d2c82@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 07:21:34 +0000
Message-Id: <20260928072135.6283E1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: ftgmac100: NULL pointer dereference in ftgmac100_start_hw()
--

commit ca665d10143bb849d0d5767a33bf55e0a57c8c94
Author: Jacky Chou <jacky_chou@aspeedtech.com>
net: ftgmac100: Enable AST2700 RMII support

This commit enables RMII support for the AST2700 MAC by adding a match-data
quirk. It programs the MAC for the selected interface mode by setting the R=
MII
enable bit when the port uses RMII.

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ether=
net/faraday/ftgmac100.c
> index 67b1fa464a421..b835472da3604 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
[ ... ]
> @@ -355,6 +359,7 @@ static void ftgmac100_init_hw(struct ftgmac100 *priv)
>  static void ftgmac100_start_hw(struct ftgmac100 *priv)
>  {
>  	u32 maccr =3D ioread32(priv->base + FTGMAC100_OFFSET_MACCR);
> +	struct phy_device *phydev =3D priv->netdev->phydev;
> =20
>  	/* Keep the original GMAC and FAST bits */
>  	maccr &=3D (FTGMAC100_MACCR_FAST_MODE | FTGMAC100_MACCR_GIGA_MODE);
> @@ -383,6 +388,11 @@ static void ftgmac100_start_hw(struct ftgmac100 *pri=
v)
>  	if (priv->netdev->features & NETIF_F_HW_VLAN_CTAG_RX)
>  		maccr |=3D FTGMAC100_MACCR_RM_VLAN;
> =20
> +	if ((priv->quirks & FTGMAC100_QUIRK_RMII_ENABLE) &&
> +	    phydev->interface =3D=3D PHY_INTERFACE_MODE_RMII) {

[Severity: High]
Does this code risk a NULL pointer dereference? If the device tree contains
an mdio child node but lacks a phy-handle property, ftgmac100_probe_dt()
returns successfully without configuring a PHY, leaving priv->netdev->phydev
as NULL.

When the network interface is brought up, could evaluating phydev->interface
cause a kernel panic?

[Severity: High]
This is a pre-existing issue, but I noticed the same pattern exists in
ftgmac100_reset_and_config_mac():

ftgmac100_reset_and_config_mac() {
    ...
    if (priv->is_aspeed &&
        priv->netdev->phydev->interface =3D=3D PHY_INTERFACE_MODE_RMII) {
        ...
    }
    ...
}

Could this also result in a panic under the same malformed device tree
conditions?

> +		maccr |=3D FTGMAC100_MACCR_RMII_ENABLE;
> +	}
> +
>  	/* Hit the HW */
>  	iowrite32(maccr, priv->base + FTGMAC100_OFFSET_MACCR);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-support_as=
t2700-v1-0-9f03f29d2c82@aspeedtech.com?part=3D3
