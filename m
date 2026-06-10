Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78CD372042
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781069413; cv=none; b=hFDh19wX320EBFoDi1M0wIq5KeR3XWtBvIWZZpyKemQrxiHFhluDjQu9Wfdr06nAO9NnWoJmXR1XqJv6ysw0RC9VYrjHK/GhrduinsEhUE/Qf6hf3nEa2RcjM600esOFBB3vlyrrCA/ldqBbjw42e7GbErk5FlUV7GkOI4Y9RPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781069413; c=relaxed/simple;
	bh=FUSxPFF3Gg0bvVgjySnsEz20/XF4OgPx1rLf6QwcUlc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zv/gaVOxMhDXy9bWGHHOm3FQsqk7ekjqvaBLCcLqxxUqyASKz5TRDXwaB16G0jiKq4jNpZDwIvwc/nBAwshj/J/fHZnljK94/teAs7SqsuotnCX2PKtLmU6NhzPdL+sXhvY82jF7OXqdpGdQzGeusXsMHrPi3M5fHgmfnD9cqGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTFhRM/i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTFhRM/i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDE81F00893;
	Wed, 10 Jun 2026 05:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781069401;
	bh=TTiHQVm93Mea7OdH8cuN9IY0OiZENZvsbmRotNCRN/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LTFhRM/iZ1s3/ek7Wx085Y16MG+LorSbk+gJy2ORjwoXtXw29OFh1QhqO9MxFOi3W
	 v5wULYP8XTR0XuFB06u75uV8dUOgHFM59c35rOmUvC27K/Rr8F0xWMdKzGse1HbYDF
	 ahZXUht0YxdR4pYuMU1ffzMhTIlYcqnaJE8RbBsdVgkGdmddAgzFWpnluSB8wmtQHd
	 ZuNgYN3iWW/+fBQ2UBnwmS3F21CZXe8Q8e4qcQ2sZzeRPVasNWYtUTniPSquJxFD+O
	 Twfe4pjsbDUT0q6PrUwbaEsRH5gy0zfYA7H9DdshuzOAifSq6/klKIQ8hA2QIRacYT
	 PMfoj091sc0Nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 5/5] net: mdio: realtek-rtl9300: Add support
 for RTL931x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609052856.3142922-6-markus.stockhausen@gmx.de>
References: <20260609052856.3142922-6-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 05:30:00 +0000
Message-Id: <20260610053000.DFDE81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver returns non-standard error codes (-ENOENT and -ENXIO), =
causing the MDIO core to incorrectly abort bus registration
--

commit 75cd5960a2d7e0f2a11ca0ab524bcf1b9773e72c
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Add support for RTL931x

This commit prepares the MDIO driver for multiple device support and adds
all required bits for the RTL931x series, including expanding port limits
and supporting different controller layouts.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 33c00b6ba8f88..dbd52f9219099 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c

[ ... ]

> @@ -294,6 +319,60 @@ static int otto_emdio_9300_write_c45(struct mii_bus =
*bus, int port,
>  	return otto_emdio_write_cmd(bus, RTL9300_PHY_CTRL_TYPE_C45, &cmd_data);
>  }

[ ... ]

> +static int otto_emdio_9310_write_c45(struct mii_bus *bus, int port,
> +				     int dev_addr, int regnum, u16 value)
> +{
> +	struct otto_emdio_cmd_regs cmd_data =3D {
> +		.c45_data	=3D FIELD_PREP(PHY_CTRL_MMD_DEVAD, dev_addr) |
> +				  FIELD_PREP(PHY_CTRL_MMD_REG, regnum),
> +		.io_data	=3D FIELD_PREP(RTL9310_PHY_CTRL_INDATA, value),
> +		.port_mask_high	=3D (u32)(BIT_ULL(port) >> 32),
> +		.port_mask_low	=3D (u32)(BIT_ULL(port)),
> +	};
> +
> +	return otto_emdio_write_cmd(bus, RTL9310_PHY_CTRL_TYPE_C45, &cmd_data);
> +}
> +
>  static int otto_emdio_read_c22(struct mii_bus *bus, int phy_id, int regn=
um)
>  {
>  	struct otto_emdio_priv *priv =3D otto_emdio_bus_to_priv(bus);

[Severity: High]
This is a pre-existing issue, but I noticed the driver returns non-standard
error codes that might break MDIO bus registration.

Looking at otto_emdio_phy_to_port(), it returns -ENOENT when a PHY ID isn't
found in the valid ports bitmap. Similarly, otto_emdio_run_cmd() returns
-ENXIO when the hardware indicates a command failure. Both of these
functions are called during MDIO read/write operations like
otto_emdio_read_c22().

When these non-standard errors bubble up, the MDIO core in get_phy_c22_id()
treats any error code that is not -EIO or -ENODEV as a fatal -EIO error:

get_phy_c22_id() {
        ...
        phy_reg =3D mdiobus_read(bus, addr, MII_PHYSID1);
        if (phy_reg < 0) {
                return (phy_reg =3D=3D -EIO || phy_reg =3D=3D -ENODEV) ? -E=
NODEV : -EIO;
        }
        ...
}

When get_phy_device() returns -EIO, of_mdiobus_register() treats it as a
fatal bus error and aborts the entire MDIO bus registration.

Could this cause the entire switch's network capabilities to fail if just a
single PHY is unpopulated or unresponsive? Would it be safer to return
standard codes like -ENODEV or 0xffff from the driver's read/write handlers
so the MDIO core can safely skip missing devices and continue scanning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609052856.3142=
922-1-markus.stockhausen@gmx.de?part=3D5
