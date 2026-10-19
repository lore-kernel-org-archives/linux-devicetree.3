Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D58355819
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376535; cv=none; b=Id5EJPQ5FWyv5ieaz6ulFdHYd/QO3csV+IeIZRY5RZHcXXd36SG/iUPbqn9EhP8K0ZM+echlUcdP3a5tLPTIvCdVVKF07Kdw5mHDX1z2I3FSyGyMyf8Gr7V+YOYZv61A+J0G7csmhT6n9SA+ZmiCsSaazs285jRUWL+D3YHtUgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376535; c=relaxed/simple;
	bh=BgBmdAdm1SC0RFOooL1iJoDA7n/BbQNwrLWjy+BMaL8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lm2u4WpU4x9WFLGwVAQWLi5O6jQBarNGF92xjVPSZb8sMDDJPSdOby3v5PY8KTA4sccpiVt1ap8jxmPjOfXYyt8ft2tz1OYrkp4ooXjgmoz17csZAVuLITUrsB4A35MKqTaRj57sYluw6FIK0JwDWqTpKZYa1oF1mYYhWDbAxJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fcbhoUkj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fcbhoUkj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFAC1F000C4;
	Mon, 19 Oct 2026 02:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792376533;
	bh=8eLKo+TFTDi3hlrD9tP9Fr0sBiZgZQ52QPyaXa1ak5A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fcbhoUkjBUf2YJLnqddipzzAm2P16Ahuuw/AN9TM/fhGew39EdUcfKMIX/wFB3sPq
	 SxhKbtyE+nW/N4U7CxvYxhnMWI7v30BejNnONHBem+6kjQSMQ4jtXuCa+soi0sICPV
	 eUXxh8aQWJ+uP9zOsRlSjFstHZKFaWVjY5Km0GXm1vartdLtbnXytoo3Iaq4D30w7+
	 ibvEmuMhScH87n4EUbe5GPbmHU3OT/gAAL/LWxOehfqEFQQbkzRKODu6rLXBJkW/zs
	 qSvYIyVLjbf8mQWmX1sKlDyvAddvB/tC1PZrahCj8DnbV5jn8z/sNHsIe48igH10/U
	 H+Dem+zFGWt8w==
Message-ID: <sashiko-outbox-176532@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v26 3/3] net: phy: Add driver for Motorcomm
 Quad 2.5GbE phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018022151.2677056-4-kyle.switch@motor-comm.com>
References: <20261018022151.2677056-1-kyle.switch@motor-comm.com>
 <20261018022151.2677056-4-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 02:22:12 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: phy: motorcomm: BMCR_PDOWN left set in yt8824_config_utp_init=
_paged()
--

commit d67c9c1b5b54d6dd6ed50449a68cdea77bc4e19b
Author: Kyle Switch <kyle.switch@motor-comm.com>

net: phy: Add driver for Motorcomm Quad 2.5GbE phy

This commit adds support for the Motorcomm YT8824 quad-port 2.5G PHY to the
motorcomm driver using phy_package helpers for the shared top extended
register space.

> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> index 463e1ea3efc93..6628ebcca0819 100644
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
[ ... ]
> @@ -638,15 +949,1165 @@ static int ytphy_set_wol(struct phy_device *phyde=
v, struct ethtool_wolinfo *wol)
[ ... ]
> +static int yt8824_config_utp_init_paged(struct phy_device *phydev)
> +{
> +	int ctrl =3D 0;
> +	int mask =3D 0;
> +	int ret =3D 0;
> +	int val =3D 0;
> +	int r;
> +
> +	ret =3D phy8824_page_write_with_lock(phydev, YT8824_RSSR_UTP_SPACE);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D phy_modify(phydev, MII_BMCR, BMCR_PDOWN, BMCR_PDOWN);
> +	if (ret < 0)
> +		goto err_restore;

[ ... ]

> +	/* reset */
> +	ret =3D genphy_c45_template_testmode(phydev, MDIO_PMA_10GBT_TESTMODE_1);
> +	if (ret < 0)
> +		goto err_restore_normal;
> +
> +	ret =3D phy_modify(phydev, MII_BMCR, BMCR_RESET | BMCR_ANENABLE,
> +			 BMCR_RESET | BMCR_ANENABLE);
> +	if (ret < 0)
> +		goto err_restore_normal;
> +	ret =3D phy_read_poll_timeout(phydev, MII_BMCR, val, !(val & BMCR_RESET=
),
> +				    50000, 600000, true);
> +	if (ret < 0)
> +		goto err_restore_normal;
> +
> +	ret =3D genphy_c45_template_testmode(phydev,
> +					   MDIO_PMA_10GBT_TESTMODE_NORMAL);
> +	if (ret < 0)
> +		goto err_restore_normal;
> +	return 0;
> +
> +err_restore:
> +	r =3D phy_modify(phydev, MII_BMCR, BMCR_PDOWN, 0);
> +	if (ret >=3D 0 && r < 0)
> +		ret =3D r;
> +	return ret;
> +
> +err_restore_normal:
> +	r =3D genphy_c45_template_testmode(phydev,
> +					 MDIO_PMA_10GBT_TESTMODE_NORMAL);
> +	if (ret >=3D 0 && r < 0)
> +		ret =3D r;
> +	r =3D phy_modify(phydev, MII_BMCR, BMCR_PDOWN, 0);
> +	if (ret >=3D 0 && r < 0)
> +		ret =3D r;
> +	return ret;
> +}

[Severity: High]
Does yt8824_config_utp_init_paged() leave BMCR_PDOWN set in MII_BMCR on the
normal success path?

At the start of yt8824_config_utp_init_paged(), BMCR_PDOWN is set:

	ret =3D phy_modify(phydev, MII_BMCR, BMCR_PDOWN, BMCR_PDOWN);

At the end of the function, the soft reset uses phy_modify() with a mask of
BMCR_RESET | BMCR_ANENABLE, which preserves BMCR_PDOWN in MII_BMCR. The
subsequent yt8824_soft_reset() -> yt8824_utp_softreset_paged() call in
yt8824_config_init() also uses phy_modify(phydev, MII_BMCR, BMCR_RESET,
BMCR_RESET), preserving BMCR_PDOWN as well.

Under err_restore, the code checks for ret >=3D 0 before clearing BMCR_PDOW=
N:

err_restore:
	r =3D phy_modify(phydev, MII_BMCR, BMCR_PDOWN, 0);
	if (ret >=3D 0 && r < 0)
		ret =3D r;
	return ret;

However, the return 0 statement right above err_restore prevents the success
path from falling through to clear BMCR_PDOWN, and makes the ret >=3D 0 che=
ck
unreachable since all goto err_restore paths only trigger when ret < 0.

When phy_init_hw() -> yt8824_config_init() -> yt8824_config_utp_init_paged()
runs without a subsequent phy_resume() (for example via phy_mii_ioctl() on
BMCR_RESET or phy_abort_cable_test()), will the UTP port remain powered dow=
n?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018022151.2677=
056-1-kyle.switch@motor-comm.com?part=3D3
