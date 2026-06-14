Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0C12D7DC6
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 11:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781436634; cv=none; b=d0uMXezKMGfoGkhWtsOqVSfgNI4IIdKHw1a2wxmTfbwNxY9mLkiZ438aYuhlH+9xrIlK2gs4HQIlzW5ttTDKRiMYLcm6fTbr4RiQo+luP5gYu1d2Ue9486Nms0w0aKfLn2iWbdWl6Ihnjfg+cl1jpQ2VlfvIACE3Iw3v178aw5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781436634; c=relaxed/simple;
	bh=57pBh363bE3D/p+6VtAcfb+x/dcyufvtrKjEubLayY4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h+sjfQk/drcYo0V1ExkiULt/WeViUvyJPeKJi/FU4AUt/YZKvfqBEYykwxHCWD0dkVyBd8f0p+EZ2yh7ax9qt2VNXo9+wrZlC+PfBB4LVucPNldj4bZYoeBW6BnRztUye1lHGBHWWpHu8tRmVwP55JulAPxzpZk6Ey6hxztx4cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YeJTEqvI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YeJTEqvI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9A61F000E9;
	Sun, 14 Jun 2026 11:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781436633;
	bh=vP14ozLFm+3C87Js+0czwr16uFw61hw5tc82h+DhPMY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YeJTEqvIV/tNG8oIoRugA/dzjfOGeCtTIjXMI23+pvdk+9Bkemx737pqo3FfU1JT1
	 /kCjzD0/+zhpxDto8IzNzPhME93xWIly+vCtlO5Wgg094Z0pZATBMmHQxBHTOgF1+b
	 rg4INOOmrKzQ+j95jPStRS8/9dU5VrwaFkSJLrO/wzmsvL/R9pfAa34Z9Z36LT5dmT
	 F+hhfiBPNjsphSbSABkY6yK/eXPMe6plpvVOP8QnqcWwrpwzRAAPFP6PATieWMbbX9
	 xieHNU2Dhp/Pgh+89wLpZSPvKwtjN8/AMGgwfYt+IFV9GAbjQMSxdaCcF95yFG1pTK
	 5gkCWWYI0Z7Ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 5/8] net: mdio: realtek-rtl9300: Add c45 over
 c22 mitigation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260613112946.1071411-6-markus.stockhausen@gmx.de>
References: <20260613112946.1071411-6-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Jun 2026 11:30:32 +0000
Message-Id: <20260614113033.2D9A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] State Machine Desynchronization and Hardware Polling Corruption on=
 MDIO Error
--

commit 6336036b9a3d5d0b25bcff57860a0355d0dabd49
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Add c45 over c22 mitigation
   =20
Enhances the RTL9300 MDIO driver to detect the 4-step c45-over-c22 MMD
sequence. Disables hardware polling during the sequence to prevent concurre=
nt
access from breaking the kernel's read/writes. Adds a state machine to track
sequence progress.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index a7fd075947b67..e206ee3e2b1cc 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
[ ... ]
> @@ -254,6 +257,43 @@ static int otto_emdio_set_port_polling(struct otto_e=
mdio_priv *priv, int port, b
>  				  BIT(port % 32), active);
>  }
> =20
> +static int otto_emdio_mmd_prefix(struct otto_emdio_priv *priv, int port,=
 int regnum)
> +{
> +	u8 newstate, *state =3D &priv->mmd_state[port];
> +	int expected, ret =3D 0;
> +
[ ... ]
> +	expected =3D (*state & 1) ? MII_MMD_DATA : MII_MMD_CTRL;
> +	newstate =3D regnum =3D=3D expected ? *state + 1 : 0;
> +
> +	if (newstate =3D=3D 1 || newstate < *state)
> +		ret =3D otto_emdio_set_port_polling(priv, port, !newstate);
> +	*state =3D newstate;
> +
> +	return ret;
> +}
> +
> +static int otto_emdio_mmd_postfix(struct otto_emdio_priv *priv, int port=
, int regnum)
> +{
> +	if (priv->mmd_state[port] !=3D 4)
> +		return 0;
> +
> +	priv->mmd_state[port] =3D 0;
> +
> +	return otto_emdio_set_port_polling(priv, port, true);
> +}
> +
[ ... ]
> @@ -463,7 +503,15 @@ static int otto_emdio_read_c22(struct mii_bus *bus, =
int phy_id, int regnum)
>  		if (regnum =3D=3D 31)
>  			return priv->page[port];
> =20
> +		ret =3D otto_emdio_mmd_prefix(priv, port, regnum);
> +		if (ret)
> +			return ret;
> +
>  		ret =3D priv->info->read_c22(bus, port, regnum, &value);
> +		if (ret)
> +			return ret;

[Severity: High]
If priv->info->read_c22() returns an error, the function returns early and
skips otto_emdio_mmd_postfix(), leaving priv->mmd_state[port] in an
intermediate state.

If an error occurs on the final step, the state is left at 4. A new MMD
sequence starting with register 13 will match the expected register logic
in otto_emdio_mmd_prefix() and increment the state to 5, then 6, etc.

Since otto_emdio_mmd_postfix() only re-enables polling when the state is
exactly 4, will hardware polling remain permanently disabled for this port
if an error occurs mid-sequence?

> +
> +		ret =3D otto_emdio_mmd_postfix(priv, port, regnum);
>  	}
> =20
>  	return ret ? ret : value;
> @@ -472,7 +520,7 @@ static int otto_emdio_read_c22(struct mii_bus *bus, i=
nt phy_id, int regnum)
>  static int otto_emdio_write_c22(struct mii_bus *bus, int phy_id, int reg=
num, u16 value)
>  {
>  	struct otto_emdio_priv *priv =3D otto_emdio_bus_to_priv(bus);
> -	int port;
> +	int port, ret;
> =20
>  	port =3D otto_emdio_phy_to_port(bus, phy_id);
>  	if (port < 0)
> @@ -487,7 +535,15 @@ static int otto_emdio_write_c22(struct mii_bus *bus,=
 int phy_id, int regnum, u16
>  			return 0;
>  		}
> =20
> -		return priv->info->write_c22(bus, port, regnum, value);
> +		ret =3D otto_emdio_mmd_prefix(priv, port, regnum);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D priv->info->write_c22(bus, port, regnum, value);
> +		if (ret)
> +			return ret;

[Severity: High]
Similarly, does returning early here on error skip otto_emdio_mmd_postfix()
and desynchronize the state machine?

> +
> +		return otto_emdio_mmd_postfix(priv, port, regnum);
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613112946.1071=
411-1-markus.stockhausen@gmx.de?part=3D5
