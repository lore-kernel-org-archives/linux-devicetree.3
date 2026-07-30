Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A74449B30
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427414; cv=none; b=fjigig2NBKkjuDYVqtLZuf/6VVuO5FejEEZJ5CmH2q3lPl7hPVbkQJ7Iq4OoR6B0GOjpn78fVYLcI8FJ23HTmIMA1lp235PYwynfhWbbemVwMl7YrkBmzx1ov/FcjI3GUMTxvmF0fJGOw5Q86tvevzo+ISFvAaRa1dFj/pbmyxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427414; c=relaxed/simple;
	bh=W3ZCJ2Thyaylk4281N4/5Mw4dDyhWO09uhJDtY+Nf0I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KPjN2U3OggnNSRDzecpfLk4XMAYe4BgCqliyBSOTy9oDJOyENSeVhU1kTwPOCm3evrOmI5ZNDJVrTnTXoPEd0NJy5jlTl53vyHKuv4Y4Ow5aO8W9V7qwtjSefpoYRgQmyBM0DSp9TAqX3dxq6DjM4TheUb5PSttAsxZKEXs6pP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFqdNKN1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFqdNKN1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0BF31F000E9;
	Thu, 30 Jul 2026 16:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785427412;
	bh=SP7qprh71lB7CsgKqkfSjxrC6nOimwTVnskfl2jRJ9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oFqdNKN1Xzidw/ph690WO/dZZ6E0StcDp3Cb7l3F2CUDOXAHXkeF9U1KGcLc53ddV
	 IjlgPII2p6qPCrIJH6Qq1FXV2/qIigxrxGl0Cd4izMLr9qoCeW/NPQuimX6A4kLO6t
	 690e6zOVVU8SXPmtGBmbRokj0l3M3N49XiYnkuP56x7k5A0k8SiCpUwrViXuHGz7rs
	 pZD+NH6Nlf3RnXeIUibX9PLqlKv9v+QjnOSyWVFzaTZNeXRLxnyzaIJpTHTmBNFsU+
	 xOvc0vKPIkv1b50orsNQMQVLG5V1ub03stFakEm/03L6m+IFvzvLYwEyPXyv4jCjj1
	 CHxA5SO4g1e8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 6/9] net: mdio: realtek-rtl9300: Add page
 tracking
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729160227.155613-7-markus.stockhausen@gmx.de>
References: <20260729160227.155613-1-markus.stockhausen@gmx.de>
 <20260729160227.155613-7-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 16:03:32 +0000
Message-Id: <20260730160332.A0BF31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Data race on `priv->page[port]` due to missing `priv->lock` in `=
otto_emdio_notify_phy_detach`.
--

--- Patch [6]: [PATCH net-next v8 6/9] net: mdio: realtek-rtl9300: Add page=
 tracking ---
commit 05ca21acb226d57fd7de64847d2a32c8443b9dcd
Author: Markus Stockhausen <markus.stockhausen@gmx.de>
net: mdio: realtek-rtl9300: Add page tracking

This commit intercepts accesses to the Realtek page register (C22 reg 31)
to prevent interference with the hardware polling unit. It stores the target
page per-port and injects it into hardware commands. It also restricts C22
bus attachment to Realtek PHYs and resets the cached page upon detach.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index aca0a9448bb0c..dc3661b2cd945 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c

[ ... ]

> @@ -608,12 +632,17 @@ static void otto_emdio_notify_phy_detach(struct phy=
_device *phydev)
>  {
>  	struct otto_emdio_priv *priv =3D otto_emdio_bus_to_priv(phydev->mdio.bu=
s);
>  	int port =3D otto_emdio_phy_to_port(phydev->mdio.bus, phydev->mdio.addr=
);
> +	struct otto_emdio_chan *chan =3D phydev->mdio.bus->priv;
>  	struct mii_bus *bus =3D phydev->mdio.bus;
>  	int ret;
> =20
>  	if (port < 0)
>  		return;
> =20
> +	/* avoid wrong cached page for next attachment */
> +	if (!priv->smi_bus_is_c45[chan->mdio_bus])
> +		priv->page[port] =3D 0;

[Severity: Medium]
Does this write to priv->page[port] need to be protected by priv->lock?

Looking at otto_emdio_read_c22() and otto_emdio_write_c22() introduced
earlier in this patch, accesses to priv->page[port] are protected by taking
priv->lock. Here in otto_emdio_notify_phy_detach(), the assignment happens
without acquiring priv->lock.

Could this cause a data race if a concurrent MDIO read/write ioctl occurs
while the PHY is being detached?

> +
>  	ret =3D otto_emdio_set_port_polling(priv, port, false);
>  	if (ret)
>  		dev_err(bus->parent, "failed to disable polling for port %d\n", port);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729160227.1556=
13-1-markus.stockhausen@gmx.de?part=3D6
