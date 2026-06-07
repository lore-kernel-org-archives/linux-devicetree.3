Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B2F2C3259
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 05:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780810982; cv=none; b=NRm/68vD/ZN5xwe56C5Cepo2YU4pws7ASbdKgMIeLtSzBEOQRvymFSHFGavNsXXoPma980eVM4Qc5/3aC7Fc/V3ifRBQ4NrXFS8GxW7S3vBoWuaCReuXXgfx01a6FXmwnZhKa3Wh8df5mOe138qFWS8z2ATJ2cjea8jMfULxCWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780810982; c=relaxed/simple;
	bh=Bnf/JZzKucF8GHnbG6wU1JfZhTbAySUOX8EvovpLZIs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vDzdbm+M3pkyqC8AZ7ldkmpxRg2Sau8PzrGAlka+vSdKw6jRvJr2epT6T/wo1EK09RjR2VWVOzw/4PdYY5P9i6S0hiecfUZciGDTJrESFh0qMePUpPWibdhIboje2MEItgRXZ/yNjV/jPk0AxHcONoyJTYKmyIl+CbJjk+tH8kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFnYhQN9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFnYhQN9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD151F00893;
	Sun,  7 Jun 2026 05:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780810981;
	bh=P5NgJAsbUvs0APenmEVqXhj94s+mbSP6l5lYC3cjfSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lFnYhQN9iEhxf9c2kU2wACMwSvJy/uXmgbBfl5KSA42UKVjgm4J8elnSaeGLAvKqw
	 ULegCta+uF5BDtrneLe1bMj1nYG5C/ZTxSg0C9qh2XPQ6O01SxHCzFh2Gm5uIb71Iw
	 B4saQkbQP5LVFOvRCzL4AIua6OHpn19rwPvx2v1JBzwFR1G5BPY8cta5r16lO4AqlY
	 zUVaAnf+O/k8k5Yyd2frw4rz/6qSUj4BkDH+NUKGzLW8sO071DP96XT9tkfnSMoehE
	 rZ782TRNxE4xF8UG70GlhuB54AKGDwybD3bYgyAuNcnEFHKi29ZuuRlVknizTEjK/8
	 iei/Zq4uW7aKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 12/16] net: phy: ncn26000: Support for
 loopback support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605-s2500-mac-phy-support-v4-12-de0fbc13c6d8@onsemi.com>
References: <20260605-s2500-mac-phy-support-v4-12-de0fbc13c6d8@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 05:43:00 +0000
Message-Id: <20260607054301.1DD151F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ncn26000_config_aneg overwrites MII_BMCR, clearing loopback state
--

commit 94cf320a690a5a9087c661b90073d1379cc73d25
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: phy: ncn26000: Support for loopback support

Adding loopback support for S2500 internal PHY to help running
loopback test through ethtool.

> diff --git a/drivers/net/phy/ncn26000.c b/drivers/net/phy/ncn26000.c
> index c3a34b2c524d5..afafa81dc22b8 100644
> --- a/drivers/net/phy/ncn26000.c
> +++ b/drivers/net/phy/ncn26000.c
> @@ -178,6 +178,7 @@ static struct phy_driver ncn26000_driver[] =3D {
>  		.config_aneg           =3D ncn26000_config_aneg,
>  		.read_status           =3D ncn26000_read_status,
>  		.handle_interrupt      =3D ncn26000_handle_interrupt,
> +		.set_loopback          =3D genphy_loopback_fixed_speed,

[Severity: Medium]
Will this newly added loopback state get silently cleared when the link is
configured?

Looking at ncn26000_config_aneg() which sets up the link, it uses phy_write=
()
rather than phy_modify() on MII_BMCR:

drivers/net/phy/ncn26000.c:ncn26000_config_aneg() {
	...
	// bring up the link
	return phy_write(phydev, MII_BMCR, NCN26000_BCMR_LINK_CTRL_BIT);
}

Since genphy_loopback_fixed_speed() manages the loopback state by toggling =
the
BMCR_LOOPBACK bit in MII_BMCR, won't this unconditional write clear the
loopback bit and cause loopback tests to fail if phy_config_aneg() is called
while loopback is active?

>  		.set_plca_cfg          =3D ncn26000_c45_plca_set_cfg,
>  		.get_plca_cfg          =3D genphy_c45_plca_get_cfg,
>  		.get_plca_status       =3D genphy_c45_plca_get_status,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-s2500-mac-=
phy-support-v4-0-de0fbc13c6d8@onsemi.com?part=3D12
