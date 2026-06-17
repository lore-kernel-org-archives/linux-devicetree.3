Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B35B18C2C
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662574; cv=none; b=OIOPlcDZgG0OCwxg7UqcV7zmGaT384I3YQx6H+h7eiqAsx7fA/cqUTh0rJX5vZebgiO4U8zmRV+cBM6lXI1usbnyKYDX2qWfRNFbTJZfezKLPUHq44ubqZXv/M98ymrX61E1PGpbyEBYnD/IGKEzDzJwNlKNbZCKpkA0hnwKo7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662574; c=relaxed/simple;
	bh=+YDzA/gz9gR/NOcPtT6DP5b8MwAlNNLhDdwnnMlNewQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dS/OqKt+7eu1wZuhPOnkBc53C+/Q6KwxzpNYQwASjSXC4omlyzxXxqhxjJPAbW+WOuwUkF2OLLMtk8TR9KZQq15SoSjjlpmnZCKxzM0LAzoBdvsosyoK591phIh321dqpJ2FU9MuUOG65CJizo6/7pgsVsgf72GBV63eIQyNN2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVa0OdPM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVa0OdPM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8485A1F000E9;
	Wed, 17 Jun 2026 02:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781662572;
	bh=wpjK1E+zQ/Jwfx7VVWOJjAWwyUs3rNcFblpXiTiPH44=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gVa0OdPMLoEHJ/0Dph165eOK/GGcPY7O0FXJ/xZXxMdta4X2hLAqQfaJC3T7aDE0i
	 Nf72/4R5n8nwuWs5bZ1n/cGthp55bYZOVizsw0STQZwGD4vqWO11bPyGpXOhST3PSC
	 8zu/9oCfdkFcPOH8f5+2VWPTvd4BZDV9Cpg9ExW8ph8EnxFmmV5lp74hz5j9ICJwZc
	 fzsPZMPdKc8OhoBJgeBjhkCCOMmLqWQ3rPs4oi5xo3ghfuDqTWOjdFDJcyFeLzKhLE
	 VPAyB4wY6BKDa1/xBqQQzqlBIVWn/nw0AagDmz7b2mMHChWQU8CgUINaPm45flGgYY
	 dY+E3urYaW0Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] iio: adc: ltc2378: Add support for LTC2378-20
 and similar ADCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <5c18e7a370119ddfd5faefe147b294b39f78894a.1781661028.git.marcelo.schmitt@analog.com>
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <5c18e7a370119ddfd5faefe147b294b39f78894a.1781661028.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 02:16:12 +0000
Message-Id: <20260617021612.8485A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Unsupported SPI bits_per_word values for 18-bit and 20-bit ADCs.
- [High] Logic Error: Keeping CNV high during SPI transfer outputs BUSY fla=
gs instead of data.
- [High] Data Corruption: Buffered reads for 16-bit parts always return 0 o=
n big-endian architectures.
- [Medium] ABI Violation: Non-standard sysfs attribute name without channel=
 index.
- [Medium] Missing Kconfig dependency on REGULATOR causes unconditional pro=
be failure.
--

commit 30af41465781d1df468bbb782a984208c0789b78
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs

Support for LTC2378-20 and similar analog-to-digital converters. Co-develop=
ed
by Ioan-Daniel Pop.

> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index a3a93a47b43d9..2b82034513673 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
[ ... ]
> @@ -940,6 +940,17 @@ config LTC2309
>  	  This driver can also be built as a module. If so, the module will
>  	  be called ltc2309.
> =20
> +config LTC2378
> +	tristate "Analog Devices LTC2378 ADC driver"
> +	depends on SPI
> +	depends on GPIOLIB

[Severity: Medium]
Should this Kconfig entry also depend on REGULATOR?

The probe function unconditionally calls devm_regulator_get_enable_read_vol=
tage()
and fails if it returns an error. If the kernel is built with CONFIG_REGULA=
TOR
disabled, the regulator API is stubbed out to return -ENODEV, making it
structurally impossible for the driver to successfully probe.

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> new file mode 100644
> index 0000000000000..88582bdcd6a62
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378.c
[ ... ]
> +static int ltc2378_probe(struct spi_device *spi)
> +{
[ ... ]
> +	st->chans[st->num_iio_chans++] =3D (struct iio_chan_spec) {
> +		.type =3D IIO_VOLTAGE,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),
> +		.scan_index =3D 0,

[Severity: Medium]
Does this channel specification need .indexed =3D 1 and .channel =3D 0?

Without the index, the IIO core exposes the sysfs attribute as in_voltage_r=
aw
instead of in_voltage0_raw. The IIO ABI documentation strictly mandates that
the number must always be specified and unique to allow association with ev=
ent
codes, so this non-standard naming breaks compatibility with generic usersp=
ace
clients.

> +		.scan_type =3D {
> +			.format =3D st->info->bipolar ? IIO_SCAN_FORMAT_SIGNED_INT :
> +						      IIO_SCAN_FORMAT_UNSIGNED_INT,
> +			.realbits =3D st->info->resolution,
> +			/*
> +			 * Buffer elements could be 16-bit for low precision
> +			 * parts. Though, using more storage bits allows keeping
> +			 * the same scan_type configuration for both types of
> +			 * buffer support.
> +			 */
> +			.storagebits =3D 32,
> +		},

[Severity: High]
Will this configuration cause buffered reads for 16-bit parts to return 0 on
big-endian architectures?

For 16-bit parts, the SPI transfer writes 2 bytes to the 32-bit union. On
big-endian architectures, these 2 bytes are written to the most significant
bytes of the 32-bit space. However, setting storagebits =3D 32 with an impl=
icit
shift of 0 causes the IIO core to extract the lower 16 bits (which remain 0=
).
This causes the IIO core to persistently push 0 to the buffers.

> +	};
> +
> +	st->xfer.rx_buf =3D &st->scan.data;
> +	st->xfer.len =3D st->info->resolution > 16 ? 4 : 2;
> +	st->xfer.bits_per_word =3D st->info->resolution;

[Severity: High]
Is it safe to set bits_per_word directly to 18 or 20?

The SPI core validates bits_per_word against the controller's bits_per_word=
_mask
during transfer. Since the vast majority of SPI controllers only support 8,=
 16,
or 32 bits per word, setting this to 18 or 20 will cause spi_sync_transfer(=
) to
immediately fail with -EINVAL, breaking data capture on standard hardware.

> diff --git a/drivers/iio/adc/ltc2378.h b/drivers/iio/adc/ltc2378.h
> new file mode 100644
> index 0000000000000..a3a69351de6ce
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378.h
[ ... ]
> +static inline int ltc2378_convert_and_acquire(struct ltc2378_state *st)
> +{
> +	int ret;
> +
> +	/* Cause a rising edge of CNV to initiate a new ADC conversion */
> +	gpiod_set_value_cansleep(st->cnv_gpio, 1);
> +	fsleep(4);
> +	ret =3D spi_sync_transfer(st->spi, &st->xfer, 1);
> +	gpiod_set_value_cansleep(st->cnv_gpio, 0);
> +
> +	return ret;
> +}

[Severity: High]
Does keeping the CNV pin high during the SPI transfer cause the ADC to outp=
ut
BUSY flags instead of conversion data?

For the LTC2378 series, bringing the Chip Select low while CNV is still high
places the ADC into a BUSY indicator mode instead of shifting out the sampl=
ed
data. Should CNV be brought low before initiating the SPI transfer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781661028.gi=
t.marcelo.schmitt@analog.com?part=3D2
