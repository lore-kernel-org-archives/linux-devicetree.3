Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7D82F25F5
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 00:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778720279; cv=none; b=CE7dkSXXQLE8wGnhvT7csEM+0mcq+/Npnl1WHSmr+BJUIHLwP5bE3ThRIt3G1l7ilzN4FcUsiaUzBhr6f8n1lGgwkNTMjg76GDW1CYASH7mAIim3A4yx/Ejm9leOTajr/1N57QgtCjob+u5L116uzoDpEaUxBhiB6v7NCEAzRhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778720279; c=relaxed/simple;
	bh=Dea0Un7uo0dm8RfCjwCuiEnpYiE4HpAQe0yBtVzo8ts=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pogWvHaf7NVW3rjAQKOX29FA3RW/i+FrhCv1JcPA8JMYtoWVFXL60+YD5RkEM+ZlFZSpztpkt78prDbUYCaOjPHKXDZS5aUjoKsDfJtrWDwu5sNy3tvfUIWryA+hKPX5DPLCpC2thAqreA+d8VUQjh194XNK6sh2lQdOOFXS7Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijy5X6dq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijy5X6dq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9F0C19425;
	Thu, 14 May 2026 00:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778720279;
	bh=Dea0Un7uo0dm8RfCjwCuiEnpYiE4HpAQe0yBtVzo8ts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ijy5X6dqoYKLY9SCgVdKHu+G6YYxCYNe8HtH7vPKiIBu7nxBTMD3cDfPmYtDQDWmJ
	 eukQANo8PjMy+2s9wUQCpOXo85ABhez54A67QLkhYZzCSYTuFCa0k9jXG8deB/6b8q
	 sHRmYh1CLFEOF9dO3sBXkE4hBdghW1SB5Z2g9Z+8MmUZkUGyxVLAX+08SaQCzEDUcF
	 SjAQTUOFImHEKo873Gu003BGvf/wCjyzuy/KSgsoctwusMFX8F+a6Ya7djljLXkJ44
	 2Og9SdPMHLuAF2ekQxnl501FGAfJlbzIcKXWRh2sawA108xQZIQKWId6kLq1BjS4VX
	 32nqNx7RQJivg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 04/11] iio: imu: inv_icm42607: Add I2C and SPI For
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260512221634.256747-5-macroalpha82@gmail.com>
References: <20260512221634.256747-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:57:58 +0000
Message-Id: <20260514005759.0E9F0C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Probe incorrectly returns 0 (success) when the IRQ mapping fails, =
leading to an uninitialized but successfully bound driver.
- [High] SPI 3-wire mode initialization will fail to probe or corrupt the d=
evice configuration register due to a read-modify-write on a mismatched bus=
 state.
--

commit cfb2b10debf46b662831cd805722f6c7939bea7c
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add I2C and SPI For icm42607

Add I2C and SPI driver support for InvenSense ICM-42607 devices.
Add necessary Kconfig and Makefile to allow building of (incomplete)
driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 0baf4763b0a7d..6119379ca6a8b 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -154,7 +211,7 @@ int inv_icm42607_core_probe(struct regmap *regmap, co=
nst struct inv_icm42607_hw
>  	int ret;
> =20
>  	irq =3D fwnode_irq_get_byname(fwnode, "INT1");
> -	if (irq < 0)
> +	if (irq <=3D 0)
>  		return dev_err_probe(dev, irq, "error missing INT1 interrupt\n");

If fwnode_irq_get_byname() returns 0, could this lead to an uninitialized b=
ut
successfully bound driver?

Since dev_err_probe() returns the error code it is passed, passing 0
will cause inv_icm42607_core_probe() to immediately return 0. This bypasses
the driver data setup and hardware initialization, which might cause a NULL
pointer dereference later during suspend when dev_get_drvdata() is called.

Would it be better to pass an explicit negative error code like -EINVAL when
irq is 0?

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

Does this read-modify-write correctly handle a device that powers up in
4-wire mode when the host expects 3-wire mode?

It appears inv_icm42607_setup() performs reads (like a WHOAMI check and
reset poll) before calling bus_setup(). If the chip is in 4-wire mode and
outputs on SDO while the host listens on MOSI/SISO, wouldn't these reads
return garbage?

If the reads fail or return garbage, wouldn't regmap_clear_bits() read
that garbage and write it back, corrupting other bits in the register
like SPI_MODE?

Should 3-wire mode be enabled using a direct regmap_write() prior to
any reads?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512221634.2567=
47-1-macroalpha82@gmail.com?part=3D4
