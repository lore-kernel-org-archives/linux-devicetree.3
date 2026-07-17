Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A7A296BCF
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278930; cv=none; b=j7xChqosdWTB4h84Qjgi4LQLbTS+oNoo/I0HfuT0+3Kd53f8fczADqNFh73uf6SIljw4rZ+EiZbjvZj02RbR9Y0n1qjlaPMk/82xRcu/ywzZP7uwMwT0BV2/LiR+SR+qs24tTl6PtFfLardrE21U/xIQmmrYSc7fCXttFu+Ddz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278930; c=relaxed/simple;
	bh=PxM8JFyMlGvK1jrARDEYDMkpQO5rsda9DRT6Jfu7GJw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FCVqnv+JBYKE+Eesimf0tSuo1V00gfcY9aUSnA2Kcww5Ti0SflK8lIMBP8hb3ky/Ou6iF4P9+b7t2vMj9oAo/So8bB/nGFdeST2eC4Xl2GwGJTcFFJ2NengpKG12ouI8rovJk5pwkXgO8YRfxv86scz78URrVXR2XnDq0e2Op7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRaXTU2H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRaXTU2H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A09B1F000E9;
	Fri, 17 Jul 2026 09:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784278929;
	bh=zqY7aaRp8XgOEjqywuoA5hqxPs/CZyEgnn7hRf5QbsE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SRaXTU2HyVSfX7qNO42OZK2GktNTiotquxCR6xBz2NyIPuDuTth4D+Rdnb+5v8k2c
	 YKK1Xgtd8d3PzT7P2ImT5MCbuGXp++c4PtUVl60gb5JTUYywpLIglsWBBaVhTK/W4s
	 lO6HA7JN2x8w9uDOajEhgo2ohKatZBB4jDVqQ1rYvRzcI06wBHjADPE15jMo77oG2q
	 e1cC5WCiKGMGHtRy/IfTMwrzoItUP2EcFBU4/z36ZF2EngB9/i3IaIz5GYWhf+DptR
	 jkBTYfBnUDgDnN70ndX8l3f+u7gX9BbeLtjyULyiP6nOuU0oPr6juz+SPRGcC+UFhT
	 xsDHPheluzCbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] mfd: axp20x: Add support for AXP318W PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717-axp318-regulator-v3-2-779dc1b97dd4@baylibre.com>
References: <20260717-axp318-regulator-v3-0-779dc1b97dd4@baylibre.com>
 <20260717-axp318-regulator-v3-2-779dc1b97dd4@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 09:02:08 +0000
Message-Id: <20260717090209.2A09B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The newly added I2C device ID `axp318w` fails to use named initi=
alizers and omits the `.driver_data` field, resulting in it defaulting to `=
0` (`AXP152_ID`).
- [Medium] The MFD cell and resources for the power key (`axp20x-pek`) are =
completely omitted from `axp318_cells`, despite the commit message claiming=
 to support it and IRQs being defined.
- [Low] The `axp318_cells` array uses a hard-coded ID of `1` for the regula=
tor cell, which violates MFD subsystem guidelines and risks sysfs naming co=
llisions.
--

--- Patch [2]: [PATCH v3 2/4] mfd: axp20x: Add support for AXP318W PMIC ---
commit c0a61d967fff87b52d26e4cb329e69e10684fb89
Author: Andre Przywara <andre.przywara@arm.com>

mfd: axp20x: Add support for AXP318W PMIC

This patch adds support for the AXP318W PMIC connected via I2C. It sets up
the regmap configurations, volatile ranges, interrupts, and registers the
MFD cells for the regulator devices.

> Describe the regmap and the MFD bits, along with the registers exposed
> via I2C only. This covers the regulator, interrupts and power key
> devices for now.

[Severity: Medium]
Is the power key device missing from the MFD cells array in this patch? The
commit message mentions it is covered, but there are no power key resources
or cells defined for the AXP318W.

> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
> index 5c93136f977e7..4e4ebfc78525c 100644
> --- a/drivers/mfd/axp20x-i2c.c
> +++ b/drivers/mfd/axp20x-i2c.c
> @@ -83,6 +84,7 @@ static const struct i2c_device_id axp20x_i2c_id[] =3D {
>  	{ "axp221" },
>  	{ "axp223" },
>  	{ "axp313a" },
> +	{ "axp318w" },

[Severity: Medium]
Does this need named initializers to provide the .driver_data payload?

Without setting .driver_data like the of_device_id table does, won't this
default to 0, which is AXP152_ID? If this device is instantiated via legacy
I2C methods, device_get_match_data() might return AXP152_ID instead,
causing the driver to mistakenly configure it as an AXP152 variant.

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 679364189ea58..c8aeebd01bbcd 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
[ ... ]
> @@ -1061,6 +1129,10 @@ static struct mfd_cell axp313a_cells[] =3D {
>  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>  };
> =20
> +static const struct mfd_cell axp318_cells[] =3D {
> +	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),

[Severity: Low]
Should this use PLATFORM_DEVID_AUTO instead of a hard-coded ID of 1?

Assigning a hardcoded ID can lead to device naming collisions in sysfs if
multiple instances of the device are present.

> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-axp318-reg=
ulator-v3-0-779dc1b97dd4@baylibre.com?part=3D2
