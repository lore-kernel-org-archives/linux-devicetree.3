Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855686;
	b=3eaibZCChSciS7vCXThZrv2NmUZxgOzTCvZ88bY5MrJhWCtnVkjbdT/fE88PXnYfbbiY
	 g5I6mk+vuk1IGc9AEGV9KUZVh1d6gX7Wjs573frQ1j8RfuYF4rsmrJgAqWVoCfhab1OB3
	 v6NdPXZS8hGPvxIELQZ5V+Ve7hJrULyCk7B3yAzAWoE01d+B/VOBsj14pmi8TXtPHBSwF
	 6qT64VDBnXuStKM3+5hQAzElt8Db5qY0pbgYjKCQlVQLFcrIw7nU/YJ1EOQDt/IYud6vI
	 7NfCMC5srP1ngE8PmlWc4E5ykbtt2W+g6lo2QOJmPkOLTtIz84uL25fQQWBR1EZEP4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855686;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4kjKQGit3UfJ+nRnsgHF5f7n666OdZdPxpSX5DEosYc=;
	b=KctB1JSLmONEjuT0c5e8WKalh5jTDd25U9GJ8zjryoU0pWymeaK8w+xThwmaRN4u6SNt
	 Dzbna+YmNwnYR2ruFgah+OLyuYfksKba0LJd/iBOW3q63TNls2TicOic93aEikeG6oELk
	 ZzfQLuPjzQZJ3nTPRCN+tiTr0TvvNROl8T4X2JY61J2MC7RtqAClJpysYkhlCai9mLKtm
	 gVenjKyVBIwpz/T2gRZEI5mE46BiLEyVycbRVJpb9CHgiCP+LCg5RJEt+7kgBixN5keuG
	 1X/PvD2JRED/g1oTGPGr3QxlaEDrqX9WlXDgtZDtNbATCYoDgGVZuuuigaKFBXwf2Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XZdfwind;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515E8606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 05:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XZdfwind
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA861F0093A;
	Thu,  5 Nov 2026 05:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793855686;
	bh=4kjKQGit3UfJ+nRnsgHF5f7n666OdZdPxpSX5DEosYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XZdfwindOg/EvfyBdf2qu5Z3c3uzm13Ua0cC4wkaAosZpEBRYsNRcpDSSDpQidcNK
	 iXep+2wgN905RxxEx8LaynfQawlfjRG3ZTWoX0QCoLydRbk4+YO5PeJAFYCQUgqE7R
	 DVjpQ5QD1YRjoE1xbdg53IrCAp+fYPZ15bfAXd7CzRQrCJPkUPEumFw/AS69bL/5oa
	 Tv8j+U8iwGziSYsQ5fqJHbjcj05TDy9f+rNX7Kn9F/BL5t/tLnVP8LUhgvgWueqv6x
	 FX1CKjfLk86N0jfFn3YCO7MNdNZi7GYfUtSFqKmSMDPZniR7TLgNHAV8j0SG3j8YYu
	 1+qPEn2eeHlSQ==
Message-ID: <sashiko-outbox-198580@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 3/7] net: ftgmac100: Add AST2700 compatible
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-support_ast2700-v5-3-44057f4dde75@aspeedtech.com>
References: <20261104-support_ast2700-v5-0-44057f4dde75@aspeedtech.com>
 <20261104-support_ast2700-v5-3-44057f4dde75@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 05:14:45 +0000
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
- [High] net: ftgmac100: missing reset deassertion for AST2700 in ftgmac100=
_probe()
--

commit 1b009bb5f71bd76cdeadd675e668f4c589bb3d51
Author: Jacky Chou <jacky_chou@aspeedtech.com>

net: ftgmac100: Add AST2700 compatible support

This commit adds match data and the OF compatible entry for the Aspeed
AST2700 FTGMAC100 Ethernet controller.

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ether=
net/faraday/ftgmac100.c
> index 6d2fe5c2f3903..67b1fa464a421 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c

[ ... ]

> @@ -2017,7 +2018,8 @@ static int ftgmac100_probe(struct platform_device *=
pdev)
> =20
>  	if (priv->mac_id =3D=3D FTGMAC100_AST2400 ||
>  	    priv->mac_id =3D=3D FTGMAC100_AST2500 ||
> -	    priv->mac_id =3D=3D FTGMAC100_AST2600) {
> +	    priv->mac_id =3D=3D FTGMAC100_AST2600 ||
> +	    priv->mac_id =3D=3D FTGMAC100_AST2700) {
>  		priv->rxdes0_edorr_mask =3D BIT(30);
>  		priv->txdes0_edotr_mask =3D BIT(30);
>  		priv->is_aspeed =3D true;

[Severity: High]
Does AST2700 need its reset control deasserted and clocks enabled during
ftgmac100_probe() before accessing registers or bringing up the interface?

On AST2400, AST2500, and AST2600, the MAC clock gates in clk-aspeed.c and
clk-ast2600.c include a coupled reset index, so enabling the clock in
ftgmac100_setup_clk() automatically deasserts the SCU MAC reset.

On AST2700, however, the MAC clock gates in drivers/clk/aspeed/clk-ast2700.c
only control SCU1_CLK_STOP via ast2700_clk_enable() and do not deassert
SCU1_RESET_MAC0..2:

drivers/clk/aspeed/clk-ast2700.c:
	GATE_CLK(SCU1_CLK_GATE_MAC0CLK, CLK_GATE_ASPEED, "mac0clk-gate", -1,
		 SCU1_CLK_STOP, 8, 0),
	GATE_CLK(SCU1_CLK_GATE_MAC1CLK, CLK_GATE_ASPEED, "mac1clk-gate", -1,
		 SCU1_CLK_STOP, 9, 0),
	GATE_CLK(SCU1_CLK_GATE_MAC2CLK, CLK_GATE_ASPEED, "mac2clk-gate", -1,
		 SCU1_CLK_STOP, 10, 0),

In ftgmac100_probe(), priv->rst is acquired via
devm_reset_control_get_optional_exclusive(), but reset_control_deassert()
is never called during probe:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_probe() {
	...
	/* MAC address from chip or random one */
	err =3D ftgmac100_initial_mac(priv);
	...
	priv->rst =3D devm_reset_control_get_optional_exclusive(priv->dev, NULL);
	if (IS_ERR(priv->rst)) {
		err =3D PTR_ERR(priv->rst);
		goto err;
	}

	if (priv->is_aspeed) {
		err =3D ftgmac100_setup_clk(priv);
		if (err)
			goto err;
	}
	...
}

Furthermore, ftgmac100_reset_and_config_mac() only asserts and deasserts
priv->rst when phydev->interface is PHY_INTERFACE_MODE_RMII:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_reset_and_config_mac() {
	...
	if (priv->is_aspeed && priv->netdev->phydev->interface =3D=3D PHY_INTERFAC=
E_MODE_RMII) {
		int err;

		err =3D reset_control_assert(priv->rst);
		...
		err =3D reset_control_deassert(priv->rst);
		...
	}
	...
}

If the bootloader leaves the MAC in reset, or when operating in RGMII mode,
won't ftgmac100_initial_mac() read FTGMAC100_OFFSET_MAC_MADR and
FTGMAC100_OFFSET_MAC_LADR while the clock is still gated and reset is
asserted, and won't ftgmac100_open() -> ftgmac100_reset_and_config_mac() ->
ftgmac100_reset_mac() fail with -EIO because priv->rst was never deasserted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-support_as=
t2700-v5-0-44057f4dde75@aspeedtech.com?part=3D3
