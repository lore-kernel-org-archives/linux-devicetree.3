Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582484;
	b=REiYwTYjf0yRxLt5D+iCNW2KvIJL7BFuE+Wi7sXOzYkdiU2YLFU6toWnD8QTzINVB3rp
	 Y36tDzwccXqQi5YnwkbbyJsq8QOv6m3fxGOctsCYtlDD6yo0rE804szzbuHBLLesgTb+A
	 mcWrbST4y5uCehVUmxaJ7RjLbEA9poskRrCsnFVLXo33TixKp3tdE3ghVfUlqCD5eWkDk
	 7kAuAylqPhN8RmmkE7YnWuz9DtaEzlnyFpWzWI897dtXKRolH0Ga6H4zmVfJGTl3rcydG
	 y9HlmBn5n5LR/d8yzuUm55tVfGnPJ+kBuIVmbfdAcmfyOip7fOUMKotZ83HVNXp/O+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582484;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9zWlc5AfanJxO35pJ/cR/6Q78xacvHn4M+Ah6CaDSJc=;
	b=TQ2/Rnd3KRQf/4W+6Y07AaPxUXS3P0V+KG5N4PPHSLP/4lOCpSCAoI54UhWBIM4aV2sD
	 Vq1puc6iNjSaAFJ2RDsqy+TDkF1x3NhSQbulCgAmkA0uWv2xENDCGUC07xjz5Ntkbkev+
	 tLs8NrlTs/+qC4FXu06YzUs3gmkPMQSTkOsWuAhBydWqGtZJd7Lbz1QdrYaX9pPR8xlek
	 jTC+aeQTkAVEGC4VMmNqtVwbMen6mvxUb+qsTIaVOANNrILrt8vN4XIWS3fi/qJTS2a66
	 1ptAFvnFaZ0Av4szpAQdS9OPlXlJEW4xql8dtctXdQ3Ru+jOb1ph3Kq4MupUmm7UnYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7OoVVGp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2549606A325
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7OoVVGp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5D31F000C5;
	Wed, 21 Oct 2026 11:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792582483;
	bh=9zWlc5AfanJxO35pJ/cR/6Q78xacvHn4M+Ah6CaDSJc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m7OoVVGpeflw2n7gXVhvPiyXoAcJDp/SQyUy8wVYMo6cUVlbwc5uTrB9IW8eq6Fu3
	 dlRyuuqqvc2FO3asxkdKqqTRBDL+23yDgxRWlKPaaCmrk57dnY5noZCZJ51RfW5pE/
	 NDT06StIXIHntTB57C5e97/YCoQnpz8VQhpUteKAJJY6vdok0ivNb58tbRtKj7MYS2
	 dWqlCYl64XtJ8omh1tDW27KcNVdGQJ4cwX4d7wmvuRcHc1oN1K+Kxtjt3DXbGQX1x3
	 KkSm0Y1ZrIWfy0CWYrIN3UzXX/Pnu0uma4xQiZxV/I4u6MmnHgOik54bQENwClRhAZ
	 6qmua+cQ2f7Dw==
Message-ID: <sashiko-outbox-180169@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 5/7] net: ftgmac100: Require phy-mode for
 AST2700
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020-support_ast2700-v4-5-4d36b40939b3@aspeedtech.com>
References: <20261020-support_ast2700-v4-0-4d36b40939b3@aspeedtech.com>
 <20261020-support_ast2700-v4-5-4d36b40939b3@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 11:34:42 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: ftgmac100: unreachable AST2700 phy-mode check in ftgmac100_=
mii_probe()
--

commit bef0234e231a9b711aa69253e6ec48a7d40857c2
Author: Jacky Chou <jacky_chou@aspeedtech.com>

net: ftgmac100: Require phy-mode for AST2700

This commit attempts to make the phy-mode property required for AST2700
in ftgmac100_mii_probe() by failing probe with -EINVAL instead of
defaulting to RGMII when the property is missing.

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
Can this new FTGMAC100_AST2700 check in ftgmac100_mii_probe() ever be
reached?

In ftgmac100_probe(), ftgmac100_setup_mdio() is the only function that
allocates priv->mii_bus, and it is not called for FTGMAC100_AST2700:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_probe() {
	...
	if (priv->mac_id =3D=3D FTGMAC100_FARADAY ||
	    priv->mac_id =3D=3D FTGMAC100_AST2400 ||
	    priv->mac_id =3D=3D FTGMAC100_AST2500) {
		err =3D ftgmac100_setup_mdio(netdev);
		if (err)
			return err;
	}
	...
}

When ftgmac100_probe_dt() falls back to ftgmac100_mii_probe(),
priv->mii_bus is always NULL for FTGMAC100_AST2700, so
ftgmac100_mii_probe() returns -ENODEV before reaching of_get_phy_mode():

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_mii_probe() {
	...
	if (!priv->mii_bus) {
		dev_err(priv->dev, "No MDIO bus available\n");
		return -ENODEV;
	}

	/* Default to RGMII. It's a gigabit part after all */
	err =3D of_get_phy_mode(np, &phy_intf);
	...
}

Furthermore, in ftgmac100_probe_dt(), AST2700 nodes with use-ncsi (which
calls ftgmac100_probe_ncsi() and hardcodes PHY_INTERFACE_MODE_RMII) or an
mdio child node return without calling ftgmac100_mii_probe() at all:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_probe_dt() {
	...
	if (of_get_property(np, "use-ncsi", NULL))
		return ftgmac100_probe_ncsi(netdev, priv, pdev);

	if (of_phy_is_fixed_link(np) ||
	    of_get_property(np, "phy-handle", NULL)) {
		phy =3D of_phy_get_and_connect(priv->netdev, np,
					     &ftgmac100_adjust_link);
		...
		return 0;
	}

	if (!ftgmac100_has_child_node(np, "mdio")) {
		err =3D ftgmac100_mii_probe(netdev);
	...
}

Should the phy-mode requirement for FTGMAC100_AST2700 be checked in
ftgmac100_probe_dt() instead?

> =20
>  	/* Aspeed only supports these. I don't know about other IP
>  	 * block vendors so I'm going to just let them through for

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-support_as=
t2700-v4-0-4d36b40939b3@aspeedtech.com?part=3D5
