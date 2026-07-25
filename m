Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF8D2494D8
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 05:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784959017; cv=none; b=OXtBwY2qZ70ddBqvPd96bNdINrTNE+85QNEvG9ivClf8y+w8HgRg/dV8X1NHD0EFgyfxD/4CKoG/zfV25RGowsvcX9lkQr8rLQxeqFKSSFscgf99yjQHvp827qrumndgLaNcsvnvzTzQNO0Q7QceiSTU+PbAX3IwVO6dfpXyOpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784959017; c=relaxed/simple;
	bh=4//5QroRDYCSlrPDoat+ghZ0l/wKGjyB6mYhyWP6xH8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HSNLnlCWIvwh6AoVG1N5zWkdArYovIkO3dbZTB9SISnHawFkcJVGE0fsuVmSSNyQ7rKTFGFCWkP4vA2qBHjSIgQrQfjdqGc1uc3OA25nt7JYowHRkMeGJxowTFKInKioa1IOjL+m1xZ/ecEzIf1vuKsMY7iBh+fSlMNoga20Qt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ig7tNTYs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ig7tNTYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89991F000E9;
	Sat, 25 Jul 2026 05:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784959016;
	bh=tSo1PSYxq/sToYpcnkYI3jiYq0TlFxkDC3FlrZXkrPg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ig7tNTYsF3rXq56G7bkphTwoXlCTNTHPRLjcimEq8lEbjIuKqKzipSqCEP3djxqce
	 CfBuVt/Ctkk0e/OTbjw0i175Zr2SuqcongYMg8BFDqfJxIVAxlnY7uTHjJbdFzRCtO
	 HtKTfVV6iEVa4ANGYjY8YIKjBdtMHGSXdX0YQgIkELqZ5GosqbdfYVACqJLcKGJg4G
	 QObrS5JvJAxScjbbgROEF0C4ruRV6juxY9W76CPda9W8mwGCkuJjGo3ReAtoDLTbaf
	 IGDgbUfIn8PVeX5kSB827EJwpbJYhnKl6Ax4hCxyVy0igkq3cCF2zphhjD/A+hQxIK
	 0ZfkHc0Uu9dLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 4/8] net: mdio: realtek-rtl9300: Configure
 hardware polling during probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724055611.1008577-5-markus.stockhausen@gmx.de>
References: <20260724055611.1008577-1-markus.stockhausen@gmx.de>
 <20260724055611.1008577-5-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 05:56:55 +0000
Message-Id: <20260725055655.E89991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `phy_poll` bitmap is declared and updated but never read, makin=
g it dead state-tracking code.
--

--- Patch [4]: [PATCH net-next v6 4/8] net: mdio: realtek-rtl9300: Configur=
e hardware polling during probing ---
commit 36d18db7d9886e2eab892060b1cf7964f32514e4
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Configure hardware polling during probing

This commit toggles hardware polling for the Realtek Otto switches during
initialization and PHY attach/detach. This helps avoid conflicts with
probing and firmware loading sequences.

Link: https://lore.kernel.org/netdev/680696024a8648535ce6dee771fe4de67802e0=
e8.1769053496.git.daniel@makrotopia.org/

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 3dee5bff41349..4b70aaeb8c3b3 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
[ ... ]
> @@ -200,6 +202,7 @@ struct otto_emdio_priv {
>  	const struct otto_emdio_info *info;
>  	struct regmap *regmap;
>  	struct mutex lock; /* protect HW access */
> +	DECLARE_BITMAP(phy_poll, MAX_PORTS);

[Severity: Low]
Is this phy_poll bitmap actually needed?

It looks like this field is updated when ports are attached and detached,
but it doesn't appear to be read anywhere in the driver. Could we remove it
entirely to simplify the state tracking?

[ ... ]
> @@ -582,6 +592,44 @@ static int otto_emdio_9310_setup_controller(struct o=
tto_emdio_priv *priv)
>  	return 0;
>  }
> =20
> +static int otto_emdio_notify_phy_attach(struct phy_device *phydev)
> +{
[ ... ]
> +	scoped_guard(mutex, &priv->lock) {
> +		ret =3D otto_emdio_set_port_polling(priv, port, true);
> +		if (!ret)
> +			__set_bit(port, priv->phy_poll);
> +	}

[Severity: Low]
If the bitmap is unread, can this __set_bit() update be dropped?

[ ... ]
> +static void otto_emdio_notify_phy_detach(struct phy_device *phydev)
> +{
[ ... ]
> +	scoped_guard(mutex, &priv->lock) {
> +		ret =3D otto_emdio_set_port_polling(priv, port, false);
> +		if (!ret)
> +			__clear_bit(port, priv->phy_poll);
> +	}

[Severity: Low]
Similarly, this __clear_bit() update could also be removed if the bitmap
is dead state-tracking code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724055611.1008=
577-1-markus.stockhausen@gmx.de?part=3D4
