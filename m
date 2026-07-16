Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA8C35E922
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784204912; cv=none; b=N3XOnVHDo8Rw88999LvJgbfWPeYQwrRZyOylIDrHS5ex5bQJJFAqKtAFt1DeuQ8n8RJlqxQueCnnGS249wH3yYj+WpEig/U4XXDR3I/dHd9zwd/FGB2hl+WVMl2VESSpufgajlADOmzQjwD4fjRLdghg6m925SN0XL0fP0vFPoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784204912; c=relaxed/simple;
	bh=HB/y8dE3FDCQH79f5dob/110E+J9vmb7OMO/AFphlb8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=prLYYyMhym5nVDnTd9+UAdfy9+NHnTeWd+ylyNualWQnV4sWLC5e9opiq5/pFSP9cJS+FuT2YlQJFRKHn0q0n0+TR87Re/mYBG+ByhoVu6Ulk1ysKTm6tCf8dNsrDWSQ+2wxLEnPSMsdzF41EMv9fwGeTUmJMWH1GIj4xpOfiKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWPTyHfZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWPTyHfZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C026A1F000E9;
	Thu, 16 Jul 2026 12:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784204911;
	bh=JrOUkEuEwUGAJ030EwLKV2aUy0GyT5m64f+pLbVWNuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JWPTyHfZMILuacy+NEnbVHEmSHDNpCkbUUnbvlPuLvmdiY6e5VkaebGaeqe3BuZcI
	 Z0i38Z2xCnYoALdiygzfkzd3md2vFcM1ofsrE1lujIYhMWeIQjIFeIWfdx5xF11yZE
	 mZ2jovAgeYPRWSwAsfG/7SW7qrb3tl2MLFxCtMZZVImSgONBnWvpIQMg0VbTG0XOca
	 A+OM2RsIidMdJgdaFAp4YDXaKDnvQPwt1X+TvclIsPbdbrf4HM0p8pPxNjkuIIWomZ
	 lqkJc9NeFYxSgR8BHtfWgSEBZ6hgOnTx+ykhgaGcsAYpL06+QYLJegQ78Kt8wJd6n2
	 wWAmvvnAXn2tQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/8] iio: dac: ad5696: properly check i2c_transfer()
 return value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716-ad5686-new-features-v8-1-ebb0051af5e5@analog.com>
References: <20260716-ad5686-new-features-v8-0-ebb0051af5e5@analog.com>
 <20260716-ad5686-new-features-v8-1-ebb0051af5e5@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 12:28:30 +0000
Message-Id: <20260716122830.C026A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The I2C message array in `ad5686_i2c_read()` uses overlapping memo=
ry buffers for the TX and RX messages in a single I2C transaction, violatin=
g DMA API rules.
--

--- Patch [1]: [PATCH v8 1/8] iio: dac: ad5696: properly check i2c_transfer=
() return value ---
commit 07e6524ea7c055d37c8056da74c0ca49030fd8cc
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5696: properly check i2c_transfer() return value

Verify that the expected number of i2c messages were transferred when
ad5686_i2c_read() is called. This issue exists since the support for I2C
devices was first introduced.

Closes: https://lore.kernel.org/all/20260705114746.1485F1F000E9@smtp.kernel=
.org/

> diff --git a/drivers/iio/dac/ad5696-i2c.c b/drivers/iio/dac/ad5696-i2c.c
> index 279309329b64b..551b200bfe140 100644
> --- a/drivers/iio/dac/ad5696-i2c.c
> +++ b/drivers/iio/dac/ad5696-i2c.c

[ ... ]

> @@ -39,9 +40,11 @@ static int ad5686_i2c_read(struct ad5686_state *st, u8=
 addr)
>  				      AD5686_ADDR(addr) |
>  				      0x00);
> =20
> -	ret =3D i2c_transfer(i2c->adapter, msg, 2);

[Severity: High]
This is a pre-existing issue, but does passing this msg array to
i2c_transfer() violate the DMA API rules?

Looking at the setup of the msg array earlier in ad5686_i2c_read():

	struct i2c_msg msg[2] =3D {
		{
			.len =3D 3,
			.buf =3D &st->data[0].d8[1],
		},
		{
			.flags =3D i2c->flags | I2C_M_RD,
			.len =3D 2,
			.buf =3D (char *)&st->data[0].d16,
		},
	};

Both the TX and RX buffers are using overlapping offsets from the same
union member st->data[0].

Since they have conflicting directions (DMA_TO_DEVICE and DMA_FROM_DEVICE),
could an I2C adapter with DMA map both simultaneously and cause memory
corruption via cache maintenance collisions, or trigger SWIOTLB bounce
buffer issues?

It appears the driver provisions st->data as an array to prevent this
(as is done in the SPI driver), but the I2C driver reused data[0] for
both messages here.

> +	ret =3D i2c_transfer(i2c->adapter, msg, ARRAY_SIZE(msg));
>  	if (ret < 0)
>  		return ret;
> +	if (ret !=3D ARRAY_SIZE(msg))
> +		return -EIO;
> =20
>  	return be16_to_cpu(st->data[0].d16);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-ad5686-new=
-features-v8-0-ebb0051af5e5@analog.com?part=3D1
