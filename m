Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C5C16F288
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 07:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791357672; cv=none; b=E7/qXrai7JXgXBEjZztQb7iTKcPbaaxlh+i1NSmyZt2+2a+etsU9VBtOfDwq6k/uKd+h/t0h74TmQsaMNZQZfp1m/JhHG5P5B4xuIyb01ljA5pgURtwqSBi4sqe95PAQ3xJChgLFhHK8tLme7gw5U4MAWbee6Mp3ryr5fV/otr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791357672; c=relaxed/simple;
	bh=RYDsw3VxhBafgH1Iy5mNLhcIQXMRBOnxh+OZBtl20j4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KRZqUM3GoPu8YOc2g741x4E8IagSH662fpQ/PlC8u0B9or+QM0u5TmyNRxGce0wwH66chd1lh8wccO8xHagdh263zDPEc3KsgXVfqLyzxBLo9B7zQoRR9VBqhP/TDOQPTGG5iGsJ6TxwXzTE6/DvLg7ODrkNmKB1ZAk7elfy7xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJkENkR+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJkENkR+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDA01F0089B;
	Wed,  7 Oct 2026 07:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791357670;
	bh=hyvQ+OJ0KG1StZh2O2+TudUjc2hPvmWAuZr7b+VMa6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iJkENkR+TdZFHrbL+SzPZZ7qf/LYUvPd72hjSwITox+69G54kxSm7pmziUeUkMd3y
	 z6pRnVu+QyVIL8PT4tTR8yll0QnLmIZJTLESdrXIRXTbZL4BZ9+YtogxHfdLb1ANo7
	 puvQEPF1YJJ/um/NjvUQvzn2TxGRNBtJBf9FhxkOyLgRxiKICvD67xCZyuviLXIJGO
	 wHu5TNxt3fajyeVjFAG4i7MmeJSychFXAlIbPAwqVkZRc+fEf80LEn/6JRKWDvPlRb
	 PlOVimgFzSUbP53hHwc91QeH85PxbxZ+KhBmWijtvyzW597+AkvcharqZ4watH1P4H
	 WsEX9Vn7m4Xgw==
Message-ID: <sashiko-outbox-162704@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 4/6] net: ftgmac100: Require phy-mode for
 AST2700
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261006-support_ast2700-v2-4-36de51fb8066@aspeedtech.com>
References: <20261006-support_ast2700-v2-0-36de51fb8066@aspeedtech.com>
 <20261006-support_ast2700-v2-4-36de51fb8066@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 07:21:09 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: unreachable phy-mode validation for AST2700 due to NULL mii=
_bus
--

commit 73c3274c3dceb52c26bd7913efb395eafee8af8d
Author: Jacky Chou <jacky_chou@aspeedtech.com>

net: ftgmac100: Require phy-mode for AST2700

This commit modifies the PHY interface initialization for the AST2700 SoC.
It mandates the presence of the "phy-mode" device tree property and will
fail probing if it is missing, instead of silently defaulting to RGMII.

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ether=
net/faraday/ftgmac100.c
> index b835472da3604..2d029d1262e6f 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1521,8 +1521,13 @@ static int ftgmac100_mii_probe(struct net_device *=
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

[Severity: Medium]
Is this new AST2700 check unreachable in practice?

A few lines earlier in ftgmac100_mii_probe(), the function unconditionally
returns -ENODEV if priv->mii_bus is NULL:

	if (!priv->mii_bus) {
		dev_err(priv->dev, "No MDIO bus available\n");
		return -ENODEV;
	}

Looking at ftgmac100_probe(), the driver skips calling ftgmac100_setup_mdio=
()
for the AST2700:

	if (priv->mac_id =3D=3D FTGMAC100_FARADAY ||
	    priv->mac_id =3D=3D FTGMAC100_AST2400 ||
	    priv->mac_id =3D=3D FTGMAC100_AST2500) {
		err =3D ftgmac100_setup_mdio(netdev);
		if (err)
			return err;
	}

Because ftgmac100_setup_mdio() is skipped, does priv->mii_bus remain NULL f=
or
the AST2700, causing ftgmac100_mii_probe() to always return -ENODEV before=
=20
ever reaching the newly added phy-mode validation logic?

>  		phy_intf =3D PHY_INTERFACE_MODE_RGMII;
> +	}
> =20
>  	/* Aspeed only supports these. I don't know about other IP
>  	 * block vendors so I'm going to just let them through for

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-support_as=
t2700-v2-0-36de51fb8066@aspeedtech.com?part=3D4
