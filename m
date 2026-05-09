Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BB48C1F
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 20:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778357333; cv=none; b=i82ViyihZMnEpAGiDeKFwnNjDTSnp69qSx912DzAPHn84MfNYkhR5f1Ln5BGSD1O0ZFlDvdUwxBSK4+2f1X1GObg+a7yB85mNRIy/BnLZUNqPKzPSl1iEuOahR3kNdqPRdlsTisaLQ/XgWVliGx0VMxwpdfUOAr11Fg33ZL6NY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778357333; c=relaxed/simple;
	bh=8T+7Ka6zNhlBEVLp3eXf7VEV+X+9/bSyIMF3OHNFp3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DbMxiIbXB6ZKveWpDh1a4Vl7t1S/X++kU2qL5oTpXhJU7CIMhIpSQ92Zd5hThGn2Qs/bZGAGOc8JULxp2Wb8r+syj561lkp33MUp4AY+looy4Wbu7CJkjm6hsc4hMyb3a3txSn/GaUCbVIYKZP5PAIlRA7I8QKd628e0x9QCvOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roj5YZ7G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roj5YZ7G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677A6C2BCB2;
	Sat,  9 May 2026 20:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778357332;
	bh=8T+7Ka6zNhlBEVLp3eXf7VEV+X+9/bSyIMF3OHNFp3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=roj5YZ7GHeuTT+R+xW84D9YbiwBTKYVpAQRlCPj2VsTLRp8I3SAl7aPpbhh76yjyW
	 pic5+CsuLH2QaYlANYoxv2kcvDIBnHip9VX8FBGoVXU+U66RGGCTDwwTqFlzsKBKw3
	 XzcR6lGlPfdSVpuTjRMWCWARIs+448G39kKcHgyMsrteyV97NBgkCgdaYImy2CkAR2
	 +AqqYhD9f19mU7a2VzhykSLGPSMmDS/MOYx3UM+B0qZDyXmRCB0H7p38uyissV6rP3
	 0AurgfeT7IXAAx7FHT5fOMnF1WBbkZGuQOOWuTEsIb3V4EEYKRR8dEJFZrGRZJIZ/O
	 zWYvSfHaZB+Rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 04/11] iio: imu: inv_icm42607: Add I2C and SPI For
 icm42607
Reply-To: sashiko@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260509191907.24734-5-macroalpha82@gmail.com>
References: <20260509191907.24734-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 20:08:51 +0000
Message-Id: <20260509200852.677A6C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing NULL check for match data leads to kernel panic.
- [Medium] Incorrect regmap ranges configuration forces an unnecessary dumm=
y read of register 0 before every access.
- [Medium] The driver ignores a mismatched WHOAMI value due to a missing re=
turn statement.
- [Medium] The SPI bus setup unconditionally forces 4-wire SPI mode, breaki=
ng 3-wire configurations.
- [Low] IRQ mapping failures are treated as valid interrupts.
--

commit 52263283b912417c0c4ca749220464cd92114b9c
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add I2C and SPI For icm42607

Add I2C and SPI driver support for InvenSense ICM-42607 devices.
Add necessary Kconfig and Makefile to allow building of (incomplete)
driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index e84e84416dab5..8ff51711ab1fe 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> @@ -15,6 +15,57 @@
> =20
>  #include "inv_icm42607.h"
> =20
> +static const struct regmap_range_cfg inv_icm42607_regmap_ranges[] =3D {
> +	{
> +		.name =3D "user bank",
> +		.range_min =3D 0x0000,
> +		.range_max =3D 0x00FF,
> +		.window_start =3D 0,
> +		.window_len =3D 0x0100,
> +	},
> +};

Is this regmap range configuration missing a selector register?

Because selector_reg and selector_mask default to 0, and max_register is
0xFF, paging might be unnecessary here. During regmap access to registers
other than 0, the page check could evaluate to true and trigger a dummy read
on register 0 before every transaction.

[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c b/drivers/ii=
o/imu/inv_icm42607/inv_icm42607_i2c.c
> new file mode 100644
> index 0000000000000..3859517f88c94
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
> @@ -0,0 +1,84 @@
[ ... ]
> +static int inv_icm42607_probe(struct i2c_client *client)
> +{
> +	const struct inv_icm42607_hw *hw =3D i2c_get_match_data(client);
> +	struct regmap *regmap;

If the device is bound dynamically via sysfs without a matching device ID,
can i2c_get_match_data() return NULL? If so, could this lead to a kernel
panic when hw is unconditionally dereferenced later in
inv_icm42607_core_probe()?

[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c b/drivers/ii=
o/imu/inv_icm42607/inv_icm42607_spi.c
> new file mode 100644
> index 0000000000000..4a38a11f2baef
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
> @@ -0,0 +1,91 @@
[ ... ]
> +static int inv_icm42607_spi_bus_setup(struct inv_icm42607_state *st)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_set_bits(st->map, INV_ICM42607_REG_DEVICE_CONFIG,
> +			      INV_ICM42607_DEVICE_CONFIG_SPI_AP_4WIRE);

Does this unconditionally force 4-wire SPI mode, even if the SPI controller
is configured for 3-wire mode?

If the hardware is physically connected using 3-wire SPI and configured with
spi-3wire in the device tree, will forcing the 4-wire bit break
communication? Should this check for SPI_3WIRE first?

> +	if (ret)
> +		return ret;
[ ... ]
> +static int inv_icm42607_probe(struct spi_device *spi)
> +{
> +	const struct inv_icm42607_hw *hw =3D spi_get_device_match_data(spi);
> +	struct regmap *regmap;

Similarly, can spi_get_device_match_data() return NULL here and cause a
kernel panic during probe if the device is bound dynamically?

[ ... ]

Could the WHOAMI mismatch warning be silently ignored?

drivers/iio/imu/inv_icm42607/inv_icm42607_core.c:inv_icm42607_setup() {
    ...
	if (val !=3D st->hw->whoami)
		dev_warn_probe(dev, -ENODEV,
			       "invalid whoami %#02x expected %#02x (%s)\n",
			       val, st->hw->whoami, st->hw->name);

	ret =3D regmap_write(st->map, INV_ICM42607_REG_SIGNAL_PATH_RESET,
			   INV_ICM42607_SIGNAL_PATH_RESET_SOFT_RESET);
    ...
}

It looks like the driver attempts to abort by calling dev_warn_probe(), but
fails to return the result. Does this cause the -ENODEV error to be
discarded, allowing the driver to proceed configuring an unrecognized devic=
e?

Are IRQ mapping failures handled correctly during probe?

drivers/iio/imu/inv_icm42607/inv_icm42607_core.c:inv_icm42607_core_probe() {
    ...
	irq =3D fwnode_irq_get_byname(fwnode, "INT1");
	if (irq < 0)
		return dev_err_probe(dev, irq, "error missing INT1 interrupt\n");
    ...
}

fwnode_irq_get_byname() can return 0 if the interrupt exists but fails to be
mapped by the irq domain. By only checking if irq < 0, does this allow 0 to
pass as a valid IRQ, potentially failing later when requesting the threaded
IRQ?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509191907.2473=
4-1-macroalpha82@gmail.com?part=3D4
