Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245613BA220
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133255; cv=none; b=DolhS1BhWJFG/KNH8qRaAVx/xkrnSpzhrdrumtAWcfDyGMjOtTwcJmDB32SYTCr9UgYOr0KS+IFrWQke/J8o5z9f8hk4N/Ysl0mKWazUap2NJuGe1V0sPLkPoIbozxJKgk7uuPw41+BttLjIDy5BhEjgRiYtuanCsFQFfuEhGgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133255; c=relaxed/simple;
	bh=ITEkCKYbGar95rbf0v+Fv9jf9p/byrOn1nUbM7GYtGo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kztrc+rhcFKk1bXZ9uF/bXK/Y14NzvM7sd2TZB57XMVLmuw/hF/JRv+LxHGrx1N1Gl8Rqa1rKZyEQjHvvqBdPWsRGj2uU46dx7++eOipTuep7/sGL8nGCFGx/KpFsp9qwtBBxFnUXfWEd/vvBFFD0MzHTI+o5Kor4ExP+QshpDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHfN75sm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHfN75sm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188111F000C4;
	Fri, 16 Oct 2026 06:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792133247;
	bh=rylLQBxOAFy5w76DfZB85yu3AEEzVwQIfX6QBR5pCWk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FHfN75smQkSA5il3yKx6XxTgdDuUnVDjQ/PaiK9sQtBd6NK4F8hFeerqFdUs54fMC
	 kMfsVIONzp/cIGJTv44NrVghHFEtkPofbd6NE50odEf0QICH8g33HW4xSnMA0iy8zq
	 Tvvf76N4iWc/INGmtXX+SqaBdyhlXfddxNmwdegb4RfMe7IJPfmqjRSSBrUQPyxIyn
	 mB660d7avNC8Os3NYkgDzB1nCOwRoWD5QHpLgtgKROtuoPmJOwNl8Xk/W1dKRNHz4j
	 QTs2jpP8zpNLyRa16CzDh8i4SagGeSgBE+Ya2eZZJc/sFGeR+s6Pvc+lOxnvgNUaV4
	 KYOLABvnlm1nQ==
Message-ID: <sashiko-outbox-173879@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 4/6] net: ftgmac100: Require phy-mode for
 AST2700
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-support_ast2700-v3-4-8d7999171ac4@aspeedtech.com>
References: <20261015-support_ast2700-v3-0-8d7999171ac4@aspeedtech.com>
 <20261015-support_ast2700-v3-4-8d7999171ac4@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 06:47:26 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ftgmac100: unreachable phy-mode validation logic for AST2700
--

commit bffefbc3de357d0f18231965a919fd90ba100814
Author: Jacky Chou <jacky_chou@aspeedtech.com>

net: ftgmac100: Require phy-mode for AST2700

The driver currently defaults to RGMII when the "phy-mode" property is
missing from the device tree. This patch makes "phy-mode" a required
property for AST2700 and fails probe with an error message instead of
defaulting to RGMII.

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

[Severity: Low]
Is this new validation logic for AST2700 reachable?

Looking at ftgmac100_probe(), priv->mii_bus is only initialized for
specific SoCs:

	if (priv->mac_id =3D=3D FTGMAC100_FARADAY ||
	    priv->mac_id =3D=3D FTGMAC100_AST2400 ||
	    priv->mac_id =3D=3D FTGMAC100_AST2500) {
		err =3D ftgmac100_setup_mdio(netdev);
		if (err)
			return err;
	}

For FTGMAC100_AST2700, priv->mii_bus appears to remain NULL.

If priv->mii_bus is NULL, when ftgmac100_mii_probe() is called, would it
always hit the early exit condition at the start of the function:

	if (!priv->mii_bus) {
		dev_err(priv->dev, "No MDIO bus available\n");
		return -ENODEV;
	}

and return -ENODEV before it can ever reach the new phy-mode validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-support_as=
t2700-v3-0-8d7999171ac4@aspeedtech.com?part=3D4
