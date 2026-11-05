Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855687;
	b=ZTSeHwOh4wIB9/xX6G/HMu+2txJbbVBacR0Q41LDDTrGqQS/6VaTjCFo+mU35r7RnVHP
	 Qv73G7gyuqFw8TJpRV/s8KeJSdOvO4d6A087bCn4hbf4ChPv8OKPsJV35waSZb9EdcTx2
	 U97EBfywLUqiqUOJFMgD8E1XwXpCALDxI8KQEzj8Z8hvJ6GFPiPPJ6CkXgmyPGowfENzF
	 8ODwhpZsZrQY7RjkWxKVe/CASgvWQz7H8TbUqml1tuzjbJMPEDSi3euwbsRLymZx8zUva
	 l2RD19qBqR3gHHBbhq06URX/ifx9PtiOD91vmyU0xS9PzUubMj1FdRW/cBZRlkeanNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855687;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5SwJCytbw3oD1kU2vu25G7HHo0CnnUao7hEKRnxQuwE=;
	b=1ElSMvPVYQ0UhBf6LnckH9eZ973lEWd+KmdrIQyH+DVLNFZppMusO/mh2sLtDOFVg90T
	 z3HkRicx1fEWEfldSSXYY/6s6wekBcamMgHycX4+7mzoEjyvf5eE4r1pHMcvMdnKbfVk7
	 fRsrG1ZooIVwXsA0m0e99pev0nZUuLbmv6BR+zazFVX/53Wt5vupRfcsB+uJqbK0UhGN7
	 mVxGDxcVcZwDvWzOMXDWL4VQYnOzHHiqo6AiB/ivYy8xJCbgv5w00vSlHUaoOStJiJwNm
	 36S4Yma7L9BtA4Gt6MSvwUBJUXZdHU1IXWU9YPzIiImaim7a2CsEBq0j65Ezq5IOLfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gIZQgeTH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5614606A331
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 05:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gIZQgeTH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED8F1F000C1;
	Thu,  5 Nov 2026 05:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793855686;
	bh=5SwJCytbw3oD1kU2vu25G7HHo0CnnUao7hEKRnxQuwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gIZQgeTHlr7MvYeemPD90h8t2EKVeltNQutokIsUe5gOXO/Li03IIGRQP6w12OLO6
	 HRJWWeTiJJ2XKdIpxNh1zuVFIeLickXX9b8/wTwVrkNGjGGnvMeh/bNCOonn8n9Kzh
	 G6hueNtpq02/VDWCy9z5hl9/n+DPq4TlkKpJRCr/nWBSyEx/aa5omxhV57Br/a2Wgq
	 W0rb4r+6gBKVXi9owbRCMZzb+ktz97r22vP1XUsiw1M5IuIez9ZJ0MCQKD8tEn0Rs8
	 c4R7qitEoZLgTm2/CeRPQwijfo0pGWp37hOj5yNeJ1lxRCU4ymndtieTS8MFfLMPH0
	 QWJ1VslFGzq5Q==
Message-ID: <sashiko-outbox-198582@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 5/7] net: ftgmac100: Require phy-mode for
 AST2700
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-support_ast2700-v5-5-44057f4dde75@aspeedtech.com>
References: <20261104-support_ast2700-v5-0-44057f4dde75@aspeedtech.com>
 <20261104-support_ast2700-v5-5-44057f4dde75@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 05:14:46 +0000
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

commit e655d4e27cbf2e60c068a7ea633651b5660b5493
Author: Jacky Chou <jacky_chou@aspeedtech.com>

net: ftgmac100: Require phy-mode for AST2700

This commit adds a check in ftgmac100_mii_probe() to require the phy-mode
property when probing an AST2700 MAC instead of defaulting to RGMII.

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
As reported by Sashiko on v4 [1], can this FTGMAC100_AST2700 check in
ftgmac100_mii_probe() ever be reached?

In ftgmac100_probe(), ftgmac100_setup_mdio() is the only function that
allocates priv->mii_bus, and it is skipped for FTGMAC100_AST2700:

	if (priv->mac_id =3D=3D FTGMAC100_FARADAY ||
	    priv->mac_id =3D=3D FTGMAC100_AST2400 ||
	    priv->mac_id =3D=3D FTGMAC100_AST2500) {
		err =3D ftgmac100_setup_mdio(netdev);
		if (err)
			return err;
	}

When ftgmac100_probe_dt() falls through to ftgmac100_mii_probe(), the guard=
 at
the beginning of ftgmac100_mii_probe() sees priv->mii_bus =3D=3D NULL and r=
eturns
-ENODEV before reaching of_get_phy_mode():

	if (!priv->mii_bus) {
		dev_err(priv->dev, "No MDIO bus available\n");
		return -ENODEV;
	}

Meanwhile, AST2700 device tree nodes that specify use-ncsi, fixed-link,
phy-handle, or an mdio child node in ftgmac100_probe_dt() do not call
ftgmac100_mii_probe() at all. Should the phy-mode requirement for
FTGMAC100_AST2700 be checked in ftgmac100_probe_dt() instead?

[1] https://lore.kernel.org/r/20261020-support_ast2700-v4-5-4d36b40939b3@as=
peedtech.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-support_as=
t2700-v5-0-44057f4dde75@aspeedtech.com?part=3D5
