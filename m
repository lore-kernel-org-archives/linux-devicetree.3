Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559176;
	b=xQR5QQ/9UKXQSR5IkRQt+qVbrt4V1yHoCz3czMWCnaknA5jzKEw+0DfSMQGq+nWIjC5p
	 Ps9VKNxuMkJnIPoMSFriWUHgDdnZFZ+42MOqnL0xjHiXzq3Eh+snQUK6h7PyUfkiXdBfp
	 u8Z2eaMu5rbElwEC42xjW4VMQbWjdbj9zqiGfxJdBDYFtMGLiNYjuwHp38rz3weRT/JMD
	 RC8VZX5oUCvq5xWsYbI7w2Igzkh/wEyGBmEdDAxtQyVjBXVHmfgOdRo9koQjWNMIPWaP7
	 5PYHIPrRkn12pH6+piXyj3CWc4XHoKIadF2N+JSCZWIC8ZvTvrxVPN1TLzM/LhaiZHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559176;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0TmzVjzj2Z8B48tBdjiF8ApMgl5XAvZ9n57AXxBk0qI=;
	b=fMxmOeb407vZcCeuv8u8rZ+DaXTiB0AeUCseAqzBSuKzdKLxfbDEjO1LyOs318Q2lSvc
	 HZDqO1VCDR6wCn4OvPSl753o9hiz2K7rnImKOEYeRcudCJw+PichtDtbN2ub2qhCurSho
	 6aFPrVaTkQK3iZJASxgob8AmbvmqRAw+3mt/AzPDoGDbkVMWg84lxXHNo3XLPmVr6JKJp
	 dQfENlfYoIK0fYZjn/e2GBc1SuchBNGmLptUubVOIOx5ABdVykuG7b8VXCzZMWQcwwoRz
	 NdNGvz81XBbXWIhAYzxM2/L2sbtnVKCr9qB05rwvBeYdnVjXioo58dkpDgElgOHd2dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GP9PWFWz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0DA606B1DC
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GP9PWFWz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDEF1F000C6;
	Fri, 13 Nov 2026 08:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559176;
	bh=0TmzVjzj2Z8B48tBdjiF8ApMgl5XAvZ9n57AXxBk0qI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GP9PWFWzAcihvLuC51aZxYWZZUg+x05fKHWgmcxjmVSAVud4HTZMCk2BU1mBHfKWF
	 iAlMDZ1kfjPkv7F+u6PTWrZyOY7AzhSb9n4QW0bXtB37DQdUCv1A2aYYkZNEpjndkD
	 mMsMSuVVR8B+FAOtz0igegbHaHez/jRBmpJXNZDfSYyrVoCEvKG53xLB4onpWe/1uj
	 all02Z6Oa2MkkQsPy0j9flJebovYqoJg471GWv+5mz6+wwFCjc73bRh2Cazj+DmiIM
	 WFJc+dudL4kD8FHk1cNvW7kNd0BkTuGiS5jCU8QO8GloXGApS9K9dVJnZtEBhZVvgn
	 tUqoOmwJmf1lg==
Message-ID: <sashiko-outbox-212432@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 5/7] net: ftgmac100: Require phy-mode for
 AST2700
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-support_ast2700-v6-5-238020bf46cf@aspeedtech.com>
References: <20261112-support_ast2700-v6-0-238020bf46cf@aspeedtech.com>
 <20261112-support_ast2700-v6-5-238020bf46cf@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:39:35 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: ftgmac100: unreachable AST2700 phy-mode check in
  ftgmac100_mii_probe()
--

commit 76d6a3664942a09583b0bf6c204d11a490a88f77
Author: Jacky Chou <jacky_chou@aspeedtech.com>

net: ftgmac100: Require phy-mode for AST2700

This commit adds a check in ftgmac100_mii_probe() to fail probe with
-EINVAL on AST2700 when the "phy-mode" device tree property is missing,
rather than defaulting to RGMII.

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ether=
net/faraday/ftgmac100.c
> index 9b7becb017262..5a578a62df673 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1526,8 +1526,13 @@ static int ftgmac100_mii_probe(struct net_device *=
netdev)
> =20
>  	/* Default to RGMII. It's a gigabit part after all */
>  	err =3D of_get_phy_mode(np, &phy_intf);
> -	if (err)
> +	if (err) {
> +		if (priv->mac_id =3D=3D FTGMAC100_AST2700) {
> +			dev_err(priv->dev, "phy-mode is required for this SoC\n");
> +			return -EINVAL;
> +		}
>  		phy_intf =3D PHY_INTERFACE_MODE_RGMII;
> +	}

[Severity: Medium]
Can this FTGMAC100_AST2700 check in ftgmac100_mii_probe() ever be
reached?

ftgmac100_mii_probe() returns -ENODEV at the top of the function when
!priv->mii_bus, and ftgmac100_setup_mdio() is only called for Faraday,
AST2400, and AST2500:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_probe() {
    ...
	if (priv->mac_id =3D=3D FTGMAC100_FARADAY ||
	    priv->mac_id =3D=3D FTGMAC100_AST2400 ||
	    priv->mac_id =3D=3D FTGMAC100_AST2500) {
		err =3D ftgmac100_setup_mdio(netdev);
    ...
}

For FTGMAC100_AST2700, priv->mii_bus is always NULL, so reaching
ftgmac100_mii_probe() always fails with "No MDIO bus available" before
of_get_phy_mode() is called.  Meanwhile, AST2700 device tree nodes with
use-ncsi or an mdio child node return from ftgmac100_probe_dt() without
verifying that phy-mode is present.  Should this check be placed in
ftgmac100_probe_dt() instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-support_as=
t2700-v6-0-238020bf46cf@aspeedtech.com?part=3D5
