Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559175;
	b=yzojXbGsfpm6uSxrxHnZIL7sI977z9bASuoX/JiY1HpZP+NTJlEFmxMA4Db0Hx4EJXB5
	 VESkakTvz01YbpAcvasy8BXOzvBKG8+is7DqvALotAVEqx/0jj0oZikFkqYcKx7bwk0BF
	 DZCV1W4oFX0+DNm3KSU69Z374pAGABEstOGzSHaRDIKTdy93hiiFPSssiI8dl+gKzGHEC
	 ABo4Ih3NRTe7gCxZwFBGlJOFjWHr908M0aCGW90W08P7FFiuE7kP8KgS0s93LpHTjn4sd
	 jn64qKM5UX93b9af0Ucw7v9jlrwQO666rLtOiOwbHZG5wT7Xp+VbXVsEyGlap9ON6yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559175;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=07ye0GjTRLpErwMhc19pwdT7dpqBM2/6GZ7TYLZA1hE=;
	b=UmeZD5ZicYBzC2AMCoHt0iCUe4D4pOXjRp44c3PUnNmS/GA/amzHm6gu1lpnz2Sx+Wts
	 ONLRZl9D5a4QWwaid3UytutXG60G6n5XlCv5kpU736iEzHKcWzxO4sZEvKBNedsjtmiv/
	 VCt8fQg8WEilEydY31JZxqnfSD/ArMK+4Oq9qGzZrisfpD6168poZY17A1h+A/HkvTRH+
	 BIizOwedeSOg7QfQoeKzpvLAGP4D9rTd7z6gZTfKNrMuuhUfzT0zt0hh5L/ZC7vAGuR58
	 00z98GljoDWofKgk6Kl/38Wue90B9P3CYaXex9OXxIkZpTZTHaAMiPtc2Dea0w2Or7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MEOrLbpQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEB5606B1DC
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MEOrLbpQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FEF1F000C4;
	Fri, 13 Nov 2026 08:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559175;
	bh=07ye0GjTRLpErwMhc19pwdT7dpqBM2/6GZ7TYLZA1hE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MEOrLbpQAuZeK3Mw6R4JnM3or3ff8fzGbR4/X7uSb0sRQxfmP2fpc3vb2LEhA7YZk
	 Phz0f9C2MiVfMFwy5D+3VUp5flaWjkgf8uoSQwyfYSf9ZCTPhwHXE3xYccbtvJhvl+
	 8jqmK0/q/Nlt6XF1fgO/vwtozDEzaKT+gZtj0+KQBKHRTXEbkEhHaY6hD3n1ex4lUL
	 QNtUC3VpqvXQbA1PEbDG/Kd6pjOrjYue4LVc6PyRUaD8GIurv4e/bgKsH7XcOzKBU8
	 TlGSr2Q05axtOMiO8LkhgwrU5X1gcc7hBiwAauzIHTtL4pqyw1GikQwRPpj6IEnRGv
	 oGQBmDQB3nSoA==
Message-ID: <sashiko-outbox-212430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 3/7] net: ftgmac100: Add AST2700 compatible
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-support_ast2700-v6-3-238020bf46cf@aspeedtech.com>
References: <20261112-support_ast2700-v6-0-238020bf46cf@aspeedtech.com>
 <20261112-support_ast2700-v6-3-238020bf46cf@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:39:34 +0000
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

commit a3986ee942e4f49e58a12de29523571685a498c7
Author: Jacky Chou <jacky_chou@aspeedtech.com>

net: ftgmac100: Add AST2700 compatible support

This commit adds match data and an OF match table entry for the Aspeed
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
Does ftgmac100_probe() leave the MAC held in reset on AST2700, and read MAC
registers before the clock and reset are enabled?

On AST2400, AST2500 and AST2600, enabling the MAC clock gate in the clock
driver automatically deasserts the SCU MAC reset.  On AST2700,
SCU1_CLK_GATE_MAC0CLK..2 only clear SCU1_CLK_STOP, while SCU1_RESET_MAC0..2
are separate reset controls.

ftgmac100_probe() never calls reset_control_deassert(priv->rst), and
ftgmac100_reset_and_config_mac() only deasserts priv->rst when
phydev->interface is PHY_INTERFACE_MODE_RMII:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_reset_and_config_mac() {
	...
	/* Aspeed RMII needs SCU reset to clear status */
	if (priv->is_aspeed && priv->netdev->phydev->interface =3D=3D PHY_INTERFAC=
E_MODE_RMII) {
		...
		err =3D reset_control_deassert(priv->rst);
	...
}

When the bootloader has not released the MAC reset or enabled the clock,
RGMII interfaces remain in hardware reset and ftgmac100_reset_mac() fails
with -EIO.  In addition, ftgmac100_initial_mac() runs just above this hunk
and reads FTGMAC100_OFFSET_MAC_MADR and FTGMAC100_OFFSET_MAC_LADR before
ftgmac100_setup_clk() enables priv->clk and before priv->rst is acquired
and deasserted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-support_as=
t2700-v6-0-238020bf46cf@aspeedtech.com?part=3D3
