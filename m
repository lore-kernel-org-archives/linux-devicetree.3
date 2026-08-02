Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6FB2C1595
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 16:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785687527; cv=none; b=tLaHZRb3aHrwfdMyfTuG4Ssu59MbWGc3BcFN3tCLwXzmU/VPZNBjs7czEtUIqOVlVxuXve3Wy8N1qZCbkzrELQQ1L/ZC8tmBWrgS5pzrneKDMJeFgEnspYJh//gH26OQ0A3aegpTZLORguwQ/aBmtQ9HXE4za7ftUuX7LQTw4Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785687527; c=relaxed/simple;
	bh=tmbPVsF+So8s6a7pvDrisi+fIavHlH62p81ZPio8PAg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s6/ZuuFYLa7AvB8dW2KXZwFIp/x77txp3NgjCeIIecwFpkNCfa1ypKUD29rJzUqV4es3rNc1ZET2MTY9cFfMEFvLmAJL52L1cp32HB3HWDOLak3I1IX3tO4H21dmOQFDnuk5M7iEru2fTN6wW9zQa0+M1MQchFQeFPesOLYKLGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKQX1Wmz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKQX1Wmz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573D51F000E9;
	Sun,  2 Aug 2026 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785687525;
	bh=N7pJq1N0NPx3zBqRdsVMkb0aTEzNrePy71Fcx50nO+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mKQX1Wmzg2uo0n+SQWztIHHWDHtnExhauqFTg4Mw1V66JrRWPkZMAktISIYz84yCL
	 6PqZ3mOoPrEftwoGW/z5N6mcYpCFT2q5O8Tr4CLuLWl+MgdlYWzO325numt/yjc31p
	 ojtC6JWHfMS9L9a9pwRCLYBWUWdCa3OzGthZR8ACjTlXn2NznsNbTmrKHtoT/CDS11
	 838g4TkyeKpgPV6O2sTN+coQCpEfdFwFJPnprAKpK5IJCLytxvpkBmHHTRSWb4rRkY
	 fGgwbkv2a20LU98S0PAAz/rzwzMbF3OjbX7muD4jce+9pllxfraDB/1Hofqw9g5bSq
	 vKCMI5xDW/KGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] iio: dac: dac8163: Add driver for DAC8163
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukas Metz" <lukas.metz@gmx.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260802-dac8163-work-v3-2-3ecc7bc66d0d@gmx.net>
References: <20260802-dac8163-work-v3-0-3ecc7bc66d0d@gmx.net>
 <20260802-dac8163-work-v3-2-3ecc7bc66d0d@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 16:18:44 +0000
Message-Id: <20260802161845.573D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect DAC scale/gain calculation due to hardcoding the output =
buffer gain based on the reference type rather than the chip variant.
- [High] The driver ignores the `clear-gpios` property defined in the DT bi=
nding, potentially leaving the DAC stuck in reset.
- [High] The LDAC GPIO is actively driven before the AVDD power supply is e=
nabled, violating power sequencing constraints.
- [Low] Passing `int *val` directly to `regmap_read()` which expects an `un=
signed int *` causes a compiler error.
--

--- Patch [2]: [PATCH v3 2/2] iio: dac: dac8163: Add driver for DAC8163 ---
commit 37b06ebefbaf9fd7f117618ad2ee0f83d7ce1b9c
Author: Lukas Metz <lukas.metz@gmx.net>

iio: dac: dac8163: Add driver for DAC8163

This patch adds a new IIO driver for the Texas Instruments DAC756x, DAC816x,
and DAC856x family of digital-to-analog converters. These devices are
low-power, voltage-output, dual-channel DACs with up to 16-bit resolution.

> diff --git a/drivers/iio/dac/ti-dac8163.c b/drivers/iio/dac/ti-dac8163.c
> new file mode 100644
> index 0000000000000..35af7828dc22e
> --- /dev/null
> +++ b/drivers/iio/dac/ti-dac8163.c
[ ... ]
> +static int dac8163_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct dac8163_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW: {
> +		ret =3D regmap_read(st->regmap,
> +				  FIELD_PREP(COMMAND_MASK, CMD_WRITE_UPDATE) |
> +				  FIELD_PREP(ADDRESS_MASK, chan->channel),
> +				  val);

[Severity: Low]
Does this cause a compiler error with modern compilers? It looks like val is
an int pointer, but regmap_read() expects an unsigned int pointer, which
might trigger an incompatible pointer types warning or error.

> +		if (ret)
> +			return ret;
> +		*val >>=3D chan->scan_type.shift;
> +		return IIO_VAL_INT;
> +	}
[ ... ]
> +static int dac8163_probe(struct spi_device *spi)
> +{
> +	const struct dac8163_chip_info *info;
> +	struct gpio_desc *ldac_gpio;
> +	struct iio_dev *indio_dev;
> +	struct dac8163_state *st;
> +	bool internal_reference;
> +	int ret;
[ ... ]
> +	// for now we keep the ldac pin asserted permanently so that the output
> +	// is updated immediately after a write to the channels raw attribute
> +	ldac_gpio =3D devm_gpiod_get_optional(&spi->dev, "ldac",
> +					    GPIOD_OUT_HIGH);

[Severity: High]
Does this driver need to handle the clear-gpios property defined in its DT
binding? If the hardware CLR pin is wired to a GPIO that defaults to the
active state, it seems the DAC might be left stuck in reset because the pin=
 is
never deasserted.

[Severity: High]
Can driving the ldac GPIO high here back-power the unpowered IC? The GPIO is
driven to an active output state before the avdd regulator is enabled below,
which might forward-bias internal ESD protection diodes.

> +	if (IS_ERR(ldac_gpio))
> +		return dev_err_probe(&spi->dev, PTR_ERR(ldac_gpio),
> +				     "failed to get ldac gpio");
> +
> +	ret =3D devm_regulator_get_enable(&spi->dev, "avdd");
> +	if (ret < 0)
> +		return dev_err_probe(&spi->dev, ret,
> +				     "failed to get avdd voltage\n");
> +
> +	if (device_property_present(&spi->dev, "vrefin-supply")) {
> +		ret =3D devm_regulator_get_enable_read_voltage(&spi->dev,
> +							     "vrefin");
> +		if (ret < 0)
> +			return dev_err_probe(&spi->dev, ret,
> +					     "failed to get vrefin voltage\n");
> +
> +		st->vref_mV =3D ret / (MICRO / MILLI);
> +		internal_reference =3D false;
> +		st->gain =3D 1;
> +	} else {
> +		st->vref_mV =3D DAC8163_INTERNAL_REF_mV;
> +		internal_reference =3D true;
> +		st->gain =3D 2;
> +	}

[Severity: High]
Is this gain calculation correct? The code hardcodes the output buffer gain
based on whether the voltage reference is internal or external. It seems the
gain should be a fixed hardware property of the specific chip variant inste=
ad,
such as 1x for variant 2 models and 2x for variant 3 models.

> +
> +	ret =3D regmap_write(st->regmap, FIELD_PREP(COMMAND_MASK, CMD_SOFT_RST),
> +			   FULL_RESET);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-dac8163-wo=
rk-v3-0-3ecc7bc66d0d@gmx.net?part=3D2
