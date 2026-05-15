Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF67379EF9
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852720; cv=none; b=eHpuRBf9ctpdvfh7gCwsneBpXk1FD45rqwtfVwjisd1i4mNC/kgDKS0xT1ynLW7BFW4PMxVQufz2NouZsOpa9Zwy7BL/tA5gBReEUP10P9lrOdA5kRSulbVI/grhMDUkB4QIg6QQR6cgY8vrhvpMl06gBWDyU4TUa/dDQONLgOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852720; c=relaxed/simple;
	bh=eRVBxC5TrU2k+CIn+44EZEmy/Q/wQx51WPpKlVs5QBk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LCV7OSrIHluJnzsWp7pJTJaFFFXY23t09X0suD92aJeiFGuTckzEYk3wx7VHV5aqTlJnQ2lN+SdX68AHSZxoy8ExJayMj0Ib4/BTR6Vy+soNlF2MiExyD4lQ4hwQHwgwT2EG4hD5aNVWPBi5crL4V9LUSGJdPTpgA18kLGetMQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rngbUPJr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rngbUPJr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC04EC2BCB0;
	Fri, 15 May 2026 13:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778852720;
	bh=eRVBxC5TrU2k+CIn+44EZEmy/Q/wQx51WPpKlVs5QBk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rngbUPJrO8CRH2J+G70jI8VCVMlyrDWi/RYRxOBeRSPGUdwUFVqzxgBFFmxTCcEEt
	 Ay3lpaIkA1y9JaXneK/7o3hct77kBK6csnm3hXhP6BcKG/zp/GJB6ohMZgjcgvx6rC
	 HeJ38LlAt4JMF2+JSVfbsq5yDRHnrSvzYb0Nb3Whenc4H5kG5JODvSQUwTcwiLymWt
	 vjoF5p+eTrCgYSWX50lEZqnFA+CMEFhbS7zvi01/kk6ssfO+l4XsaKfLTmerdthThl
	 IWHvsQNTtt0qW6ooUvFPWBeSywG4jiAaz3BWOMgsnWMPLAyhs8LQ7NrrUk9nYbNGY5
	 76gG/0VeNK3Vw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V7 04/11] iio: imu: inv_icm42607: Add I2C and SPI For
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515130018.237378-5-macroalpha82@gmail.com>
References: <20260515130018.237378-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 13:45:19 +0000
Message-Id: <20260515134519.CC04EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Masking `-EPROBE_DEFER` and strict IRQ naming breaks device probe =
lifecycle and standard devicetrees.
- [High] `regcache_mark_dirty()` usage causes the hardware state to desync,=
 skipping required bus configuration after soft reset.
- [High] SPI 3-wire mode configuration uses a read-modify-write cycle, read=
ing garbage data and corrupting device registers.
- [Medium] Valid error codes from regmap operations are discarded and repla=
ced with -EIO.
--

commit 7dbec8ad22b33274f815169a6c802cbf63590cea
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add I2C and SPI For icm42607

This commit adds I2C and SPI driver support for the InvenSense
ICM-42607 motion tracking device.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c b/drivers/ii=
o/imu/inv_icm42607/inv_icm42607_spi.c
> new file mode 100644
> index 0000000000000..49438fa6f8673
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c

[ ... ]

> +static int inv_icm42607_spi_bus_setup(struct inv_icm42607_state *st)
> +{
> +	const struct device *dev =3D regmap_get_device(st->map);
> +	const struct spi_device *spi =3D to_spi_device(dev);
> +	unsigned int val;
> +	int ret;
> +
> +	if (spi->mode & SPI_3WIRE)
> +		ret =3D regmap_clear_bits(st->map, INV_ICM42607_REG_DEVICE_CONFIG,
> +					INV_ICM42607_DEVICE_CONFIG_SPI_AP_4WIRE);

Since the device powers on in 4-wire mode, won't this initial
read-modify-write fail for a 3-wire configured host?

The host expects data on MOSI but the device drives MISO, which would result
in reading garbage data and permanently corrupting the rest of the
configuration bits in DEVICE_CONFIG when written back.

Should a blind regmap_write() be used here instead to safely establish
3-wire mode?

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 9784709319b92..1088c5c7076f8 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> +static int inv_icm42607_setup(struct inv_icm42607_state *st,
> +			      inv_icm42607_bus_setup bus_setup)
> +{
> +	const struct device *dev =3D regmap_get_device(st->map);
> +	unsigned int val;
> +	int ret;
> +
> +	/*
> +	 * Setup the bus first in case we need to set the SPI mode or
> +	 * change the slew rate in order.
> +	 */
> +	ret =3D bus_setup(st);
> +	if (ret)
> +		return ret;

[ ... ]

> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_SIGNAL_PATH_RESET,
> +			   INV_ICM42607_SIGNAL_PATH_RESET_SOFT_RESET);
> +	if (ret)
> +		return ret;
> =20
> -	fsleep(1000);
> +	/*
> +	 * In order to confirm a reset is complete, we need to read the reset
> +	 * bit, but in certain circumstances we need to set the bus up before
> +	 * we can do a read. So we should wait the required amount of time
> +	 * per the datasheet first, then set the bus up again, then read to
> +	 * ensure the reset status is done. Invalidate the regmap cache since
> +	 * we're doing a hardware reset.
> +	 */
> +	regcache_mark_dirty(st->map);
> =20
> -	ret =3D regmap_read_poll_timeout(st->map, INV_ICM42607_REG_INT_STATUS,
> -				       val, val & INV_ICM42607_INT_STATUS_RESET_DONE,
> -				       INV_ICM42607_RESET_TIME_MS * 100,
> -				       INV_ICM42607_RESET_TIME_MS * 1000);
> -	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "reset error, reset done bit not set\n");
> +	fsleep(INV_ICM42607_RESET_TIME_MS * 1000);
> =20
>  	ret =3D bus_setup(st);

Because regcache_mark_dirty() only flags the cache as needing a sync but do=
es
not clear the cached values, will regmap_update_bits() in this second
bus_setup() call silently skip the hardware writes?

The cache would still show the bits as set from the first bus_setup(), leav=
ing
the hardware in its default reset state.

Would regcache_sync() or regcache_drop_region() be more appropriate here to
force the actual hardware writes?

>  	if (ret)
>  		return ret;
> =20
> +	ret =3D regmap_read(st->map, INV_ICM42607_REG_INT_STATUS, &val);
> +	if (ret || (!(val & INV_ICM42607_INT_STATUS_RESET_DONE)))
> +		return dev_err_probe(dev, -EIO,
> +				     "reset error, reset done bit not set\n");

If the underlying bus read fails (e.g., returning -ENXIO or -ETIMEDOUT), do=
es
it make sense to mask the actual error code with a hardcoded -EIO?

Could the original error code be propagated to help debug underlying bus
subsystem issues?

[ ... ]

> +int inv_icm42607_core_probe(struct regmap *regmap, const struct inv_icm4=
2607_hw *hw,
> +			    inv_icm42607_bus_setup bus_setup)
> +{
> +	struct device *dev =3D regmap_get_device(regmap);
> +	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> +	struct inv_icm42607_state *st;
> +	int irq;
> +	int ret;
> +
> +	irq =3D fwnode_irq_get_byname(fwnode, "INT1");
> +	if (!(irq > 0))
> +		return dev_err_probe(dev, -EINVAL, "Unable to get INT1 interrupt\n");

Does this prevent probe deferral if the interrupt controller isn't ready ye=
t?

Since fwnode_irq_get_byname() would return -EPROBE_DEFER, converting it to
-EINVAL causes a permanent probe failure instead of retrying.

Additionally, if the device tree binding specifies interrupt-names as optio=
nal,
will this strict name enforcement cause a hard failure for valid devicetrees
that omit it?

Should the driver fall back to an index-based lookup or use the
framework-provided client->irq / spi->irq if the name is missing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515130018.2373=
78-1-macroalpha82@gmail.com?part=3D4
