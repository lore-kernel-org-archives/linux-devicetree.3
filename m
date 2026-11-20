Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167180;
	b=uIv5RE2T7JtmtCV67mYkZqWyl3OlC5VIFZHkTwyqU/OnqVOL5cFVZvYL5hodhfjxsYHe
	 rBVRPBg74DYDzW5rJ03aQE5kbTSlZuFudmSuFomGYa3npReLsXDRzPVEQvnMNPD72BV31
	 aYQcPPY+4GRniJCM+JkjJUBIdOCD+rrGwzey4Pf5X58SZ2EvUUYsZRXXieQpHjmGALrGs
	 qS14UJdeFbab7Af3H1mXUfJ1nbydkjNrrO2+iJ8Gnchwk7L2+Y/+2RARpHDZVTyxbKzzM
	 IC5aAQ3YD5zhTAtB1kWcLHlgzTE42HskY7/NREJF8WsL4EX25/RQfFpa6ps/AUu/iAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167180;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xY1SbqVLyjf++5081IO9YBltccOHmnSNJiigamj+tYA=;
	b=jRz97vckXPI9E+t6IpDLdTYmRkAtERAgcE296Oq7en/a9JSbJAbsOhBK1is0oxrzS0Kl
	 YzLtzjk0TyO9Yhmr08XgeA8pVZ+Tj0PRMsIm9Kxog1mZy3aQYNqNtxy8kt91dUbIlr6pb
	 mwboGeUYWx4C3KJOeNwqLKf5HzOjVr6XDMVK/Ku+pmZDrim1wes4HE1+uDwioxs/+DNbN
	 E/TM/BmXSxN+aDVoMC4vAqSl1iRVnSyt7N4YWWVfqIWSFeNwCZ8R3CdhyZcJHg7F+RuGJ
	 jFcHPeRfLKyUzrLAC0JlFDoTR9rFMfKaT9WP8+YaeMTyhquTph/UgEmbwuDsYZy2SSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=faFTpv4l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A831B606A32C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=faFTpv4l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45C81F000CA;
	Fri, 20 Nov 2026 09:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795167180;
	bh=xY1SbqVLyjf++5081IO9YBltccOHmnSNJiigamj+tYA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=faFTpv4lUMMEZhqwR7J1PT16UyWWOpJ0Na+7z9SldQw/2KQyz6TNezvJam65WEueB
	 XJSQjYn2qc+BJ5yAiUl1FZ9Xc680ltkUiXbQopSm1bi8OzhgikE+QHSlD4KfKdPBjj
	 HSEaHe6TR08+eZS4eTW+FbgzoXXpL6fjk4rPmaQr1RKUoE7iIgxalc0c1RQngMMAlP
	 paXNWmJyphACtPNNQZoLCum24Qan08QfKpRv6INEFqWcx+yrjKH2bPuoRxjX/yq5xZ
	 9gh/NB4jq3H1QoXDnWStn2yyox4BVQgYm+JDbBm7nE7bkgddiFXAl7lPxgouvHi+6B
	 vQs2WGb3H3sug==
Message-ID: <sashiko-outbox-224856@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 3/7] net: ftgmac100: Add AST2700 compatible
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-support_ast2700-v7-3-33c8ca2d0dd7@aspeedtech.com>
References: <20261119-support_ast2700-v7-0-33c8ca2d0dd7@aspeedtech.com>
 <20261119-support_ast2700-v7-3-33c8ca2d0dd7@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 09:32:59 +0000
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
- [High] net: ftgmac100: missing MAC reset deassertion for AST2700 in
  ftgmac100_probe()
--

commit bc0b615a5df5edb854a72ea5c88c72e247810b61
Author: Jacky Chou <jacky_chou@aspeedtech.com>

net: ftgmac100: Add AST2700 compatible support

This commit adds match data and the "aspeed,ast2700-mac" compatible
string so AST2700 FTGMAC100 device tree nodes can bind to the driver.

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
Does ftgmac100_probe() leave the AST2700 MAC held in hardware reset?

On AST2400, AST2500, and AST2600, the MAC clock gates define a coupled
reset_idx, so enabling the clock in ftgmac100_setup_clk() automatically
deasserts the MAC reset.  On AST2700, ast2700_clk_enable() only clears
the clock stop bit in SCU1_CLK_STOP and does not release the separate
SCU1_RESET_MAC0..2 resets:

drivers/clk/aspeed/clk-ast2700.c:ast2700_clk_enable() {
	struct clk_gate *gate =3D to_clk_gate(hw);
	u32 clk =3D BIT(gate->bit_idx);

	if (readl(gate->reg) & clk)
		writel(clk, gate->reg + 0x04);

	return 0;
}

Unless the bootloader has already enabled the clock and released the
reset, ftgmac100_initial_mac() reads FTGMAC100_OFFSET_MAC_MADR and
FTGMAC100_OFFSET_MAC_LADR before priv->clk is enabled and before
priv->rst is acquired.  Moreover, ftgmac100_probe() never calls
reset_control_deassert(priv->rst), and ftgmac100_reset_and_config_mac()
only toggles priv->rst for PHY_INTERFACE_MODE_RMII, leaving RGMII
interfaces in reset so ftgmac100_reset_mac() fails with -EIO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-support_as=
t2700-v7-0-33c8ca2d0dd7@aspeedtech.com?part=3D3
