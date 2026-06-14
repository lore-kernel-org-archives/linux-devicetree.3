Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFFF39D6D6
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781436635; cv=none; b=aiHG+IL41ea5inO8YZAMpu0Iz/hGoME65Ywj9VG1ZGi0wC6npHdj7t8iERscLKluiGA0sVwp/qMdmRIzCq4gP7/vapgPlpTc570pvV3iavYse52L3I1JJOTxGL/UXz2F7nDyJ9Xf9HIOh1KN/bCHTnf6QIRH956cL8exN2cT3EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781436635; c=relaxed/simple;
	bh=gsD24QvCneb3rEyzj6l8g1TEVMHmOf0cX5n7+c3+MAQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LfPduv37QnuetXec+LzZeBTWzeyk9RV3Gf5yhigo5obQZlbWcwHejpOLM8Eh+u+ijORWS6/EVjmQzRdMC/KBMVM3Pct266lnz1RiEBTplMJ1UTFI3t9B4WzYX5323qxImJq0ZjjcqfVX8/MCSi0tBrqQEequpLaX5M3yQbAl3M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEhBxhu1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEhBxhu1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52901F00A3A;
	Sun, 14 Jun 2026 11:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781436634;
	bh=XupfEPqaEao4+eJACcneAChO6lLRnBmzYdNnyUlYo1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LEhBxhu1VuJWGu+D9m/t23qLsq3p+KF1KKafNCfswDxenCJ9YJuLkSou2HfAvgNOJ
	 Zo+jAemlK4Nyk2nVyJK8B8YmGWKaw9Xrr2NY+A+N8ub78m8x71peKFpVmbh3ARcPVh
	 8uJk1Mtg+rl/vObJYWYu34qF6x1tekPmiPcN5+O+hFnkNPhAOYUFbFrM0mh0QMVD2r
	 lEvFY/vWQnGuyLa9WJv6wH6Wh8Z9RpwkyXlP3YUYtW7D5/7viTdzhLhleg3vpNw+xs
	 FjQxKDWCze/eumcQHjHeQNifBz1f8YmcHFlk/mj26hYi+Jc0g+AQANSeqjMGcxf2lQ
	 dFyE1GoU80j7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 4/8] net: mdio: realtek-rtl9300: Configure
 hardware polling during probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260613112946.1071411-5-markus.stockhausen@gmx.de>
References: <20260613112946.1071411-5-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Jun 2026 11:30:33 +0000
Message-Id: <20260614113033.D52901F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardware polling mitigation is bypassed by deferred, asynchronou=
s, or late PHY driver probing.
--

commit f401bbac0c9ccd3010cafd736b0916dccaad8dca
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Configure hardware polling during probing

This patch provides helpers to enable or disable hardware polling for a
specific port. It uses these to temporarily disable hardware polling during
MDIO bus probing to prevent interference with complex PHY initialization
sequences, re-enabling it afterwards.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index c3a9eeca31540..a7fd075947b67 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c

[ ... ]

> @@ -750,6 +759,13 @@ static int otto_emdio_probe(struct platform_device *=
pdev)
>  	if (IS_ERR(priv->regmap))
>  		return PTR_ERR(priv->regmap);
> =20
> +	/* Avoid issues with complex firmware loads. */
> +	for (port =3D 0; port < priv->info->num_ports; port++) {
> +		err =3D otto_emdio_set_port_polling(priv, port, false);
> +		if (err)
> +			return err;
> +	}
> +
>  	platform_set_drvdata(pdev, priv);
> =20
>  	err =3D otto_emdio_map_ports(dev);

[ ... ]

> @@ -772,6 +788,12 @@ static int otto_emdio_probe(struct platform_device *=
pdev)
>  			return err;
>  	}
> =20
> +	for_each_set_bit(port, priv->valid_ports, priv->info->num_ports) {
> +		err =3D otto_emdio_set_port_polling(priv, port, true);
> +		if (err)
> +			return err;
> +	}
> +

[Severity: Medium]
Could this hardware polling mitigation be bypassed if a PHY driver defers
probing or loads asynchronously?

The mitigation temporarily disables polling across the MDIO bus registration
and re-enables it here unconditionally. Since PHY devices are registered as
children of the MDIO bus, they might bind to their drivers asynchronously,
return -EPROBE_DEFER, or be bound later via sysfs.

If that happens, wouldn't the PHY initialize while the hardware polling is
already re-enabled, potentially causing the interference this patch is tryi=
ng
to avoid?

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613112946.1071=
411-1-markus.stockhausen@gmx.de?part=3D4
