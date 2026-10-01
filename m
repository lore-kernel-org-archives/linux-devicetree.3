Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3F04AA1EC
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 09:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846789; cv=none; b=cG+bLyWQlVgtvcO7GnKoLIPWjKptFuvfslEoex0Xa2KUJHf24D+zFLPLHTM9n7uSLn50Uko3TpRZObB+MGWL9bCRAfHNuNmDekfCKR0nHA07oWqDEFZscJfdwvWWESqtNHR8C6m1SVKUi+LeyEl/wm0EwmtT4yD29POGZLoK6dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846789; c=relaxed/simple;
	bh=gxkd5ADGco8WORCJ9ZROJotuNItN2kQi077MODuDBoE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O43irBD87zT2l5YYysSOu5ZFAsyMuFaldUwoM+IqxD29xSxD9gnPiNi+Sx79geFyaMyUGU41/phcbM4+zh7FGwN2WOQ6eed5HvKARBMRydE3Tbl5DDHbHYRcr5gXbtZTbKYNMqEoVcgrUCecqY9gfHZlpFkn+Bl0luQyjN6QGy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRXqkcH3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRXqkcH3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0ED1F000FF;
	Thu,  1 Oct 2026 09:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790846786;
	bh=RYva8VTghF+NlXh2CGEylJZ4g9s9RngXCDzi8X4Gt8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HRXqkcH3C36MeFDQnt75V1kgTe/WX4Zbaq0YbBiwzntbiXCbRss4wVi7yVLEBiIs3
	 f37pIKtwWQNvvbb5ukhKH7Rpo4Gm8RV/zIvSeUhhjh+nLgjMA2rrPD3eb8PSWEQBQz
	 a91vLn1VsGU2OvLuXv8hGpIaYtzZHWaiKCxoedNty0fRgUQBuI6CQuqX/eKh5Pcrmf
	 +pkRd4apOy1cFB6KFSUImZ/cDqkdYIxFLBxU03K+UCYpTu9c/CY0vEgvAi10O/dGCn
	 qEyXQsIWSm8tmlf799svgr8HES46ZQAGdRaCkHinao2sgk4dF54p/CYqBBaFpCWoDV
	 Y8+e9YO6Tq95g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: imu: Add driver for the ADI ADIS16607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001-adis16607-v1-2-9c89cee35d56@analog.com>
References: <20261001-adis16607-v1-0-9c89cee35d56@analog.com>
 <20261001-adis16607-v1-2-9c89cee35d56@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 09:26:26 +0000
Message-Id: <20261001092626.9F0ED1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] iio: imu: adis16607: out-of-bounds read when timestamp channel is =
enabled
- [Medium] iio: imu: adis16607: missing implementation for ADIS16607-1 vari=
ant
- [Medium] iio: imu: adis16607: incorrect sign for temperature channel
- [Medium] iio: imu: adis16607: interrupt storm in FIFO mode due to DR_GPIO=
 configuration
--

commit 3e574b431c0ea32c1a98ab8b0aa4b4a2110aea1a
Author: Radu Sabau <radu.sabau@analog.com>

iio: imu: Add driver for the ADI ADIS16607

The ADIS16607 is a Precision MEMS IMU from Analog Devices featuring
triaxial gyroscope, triaxial accelerometer, delta angle, delta velocity,
and temperature channels. The device communicates over SPI Half-Duplex,
requiring custom read and write ops that differ from the standard ADIS
library protocol.

> diff --git a/drivers/iio/imu/adis16607.c b/drivers/iio/imu/adis16607.c
> new file mode 100644
> index 0000000000000..da9665aff8188
> --- /dev/null
> +++ b/drivers/iio/imu/adis16607.c
> @@ -0,0 +1,1513 @@
[ ... ]
> +static const u8 adis16607_burst_offsets[] =3D {
> +	[ADIS16607_SCAN_ACCEL_X] =3D 0,
> +	[ADIS16607_SCAN_ACCEL_Y] =3D 4,
> +	[ADIS16607_SCAN_ACCEL_Z] =3D 8,
> +	[ADIS16607_SCAN_GYRO_X] =3D 12,
> +	[ADIS16607_SCAN_GYRO_Y] =3D 16,
> +	[ADIS16607_SCAN_GYRO_Z] =3D 20,
> +	[ADIS16607_SCAN_DELTVEL_X] =3D 24,
> +	[ADIS16607_SCAN_DELTVEL_Y] =3D 28,
> +	[ADIS16607_SCAN_DELTVEL_Z] =3D 32,
> +	[ADIS16607_SCAN_DELTANG_X] =3D 36,
> +	[ADIS16607_SCAN_DELTANG_Y] =3D 40,
> +	[ADIS16607_SCAN_DELTANG_Z] =3D 44,
> +	[ADIS16607_SCAN_TEMP] =3D 48,
> +};

[ ... ]

> +static irqreturn_t adis16607_trigger_handler(int irq, void *p)
> +{
[ ... ]
> +	for_each_set_bit(bit, indio_dev->active_scan_mask, indio_dev->masklengt=
h) {
> +		u8 burst_off =3D adis16607_burst_offsets[bit];

[Severity: High]
Does this code perform an out-of-bounds read when the IIO timestamp channel
(scan_index 13) is enabled?

The adis16607_burst_offsets array only has 13 elements (indices 0 through 1=
2).

[ ... ]

> +static void adis16607_fifo_push_sample(struct iio_dev *indio_dev,
> +				       u8 *fifo_data, s64 timestamp)
> +{
[ ... ]
> +	for_each_set_bit(bit, indio_dev->active_scan_mask, indio_dev->masklengt=
h) {
> +		u8 burst_off =3D adis16607_burst_offsets[bit];
> +
> +		if (bit =3D=3D ADIS16607_SCAN_TEMP) {
> +			/* TEMP is 16-bit */
> +			put_unaligned_be16(get_unaligned_be16(&fifo_data[burst_off]),
> +					   &st->data[offset]);
> +			offset +=3D 2;
> +		} else {
> +			/* All other channels are 24-bit stored as 32-bit */
> +			msw =3D get_unaligned_be16(&fifo_data[burst_off]);
> +			lsw =3D get_unaligned_be16(&fifo_data[burst_off + 2]);

[Severity: High]
Is it possible for this to leak kernel stack memory or cause a crash?

If the timestamp channel is enabled, the garbage burst_off value is used to
read out-of-bounds from the fifo_data array on the kernel stack.

[ ... ]

> +static irqreturn_t adis16607_trigger_handler_with_fifo(int irq, void *p)
> +{
[ ... ]
> +	/* Check if FIFO threshold is met */
> +	ret =3D __adis_read_reg_16(&st->adis, ADIS16607_REG_DIAG_STAT, &diag_st=
at);
> +	if (ret)
> +		goto unlock;
> +
> +	if (!(diag_stat & ADIS16607_FIFO_THR_MET_MASK))
> +		goto unlock;

[Severity: Medium]
Will the CPU be forced to process and discard an interrupt storm here?

[ ... ]

> +static int adis16607_initial_startup(struct adis16607 *st)
> +{
[ ... ]
> +	ret =3D __adis_write_reg_16(adis, ADIS16607_REG_USER_GPIO_CFG,
> +				  FIELD_PREP(ADIS16607_DR_GPIO_MASK, 1) |
> +				  (gpio ? FIELD_PREP(ADIS16607_RESET_GPIO_MASK, 1) : 0));

[Severity: Medium]
The interrupt pin appears hardcoded to fire on Data Ready (8000 times per
second), even when FIFO mode is enabled.

Does this defeat the performance benefits of the hardware FIFO?

[ ... ]

> +#define ADIS16607_TEMP_CHANNEL() { \
> +	.type =3D IIO_TEMP, \
> +	.indexed =3D 1, \
> +	.channel =3D 0, \
> +	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) | \
> +			      BIT(IIO_CHAN_INFO_SCALE) | \
> +			      BIT(IIO_CHAN_INFO_OFFSET), \
> +	.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_SAMP_FREQ), \
> +	.address =3D ADIS16607_REG_TEMP, \
> +	.scan_index =3D ADIS16607_SCAN_TEMP, \
> +	.scan_type =3D { \
> +		.sign =3D 'u', \
> +		.realbits =3D 16, \
> +		.storagebits =3D 16, \
> +		.endianness =3D IIO_BE, \
> +	}, \
> +}

[Severity: Medium]
Can this sign type corrupt temperature calculations when the temperature is
below 25=C2=B0C?

Since the sensor uses an offset of 5000 where 0 raw counts equals 25=C2=B0C,
temperatures below 25=C2=B0C will produce negative raw values. Using an uns=
igned
type will cause these negative values to underflow into large positive
numbers.

[ ... ]

> +static const struct spi_device_id adis16607_id[] =3D {
> +	{ "adis16607-2", (kernel_ulong_t)&adis16607_2_chip_info },
> +	{ "adis16607-3", (kernel_ulong_t)&adis16607_3_chip_info },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(spi, adis16607_id);
> +
> +static const struct of_device_id adis16607_of_match[] =3D {
> +	{ .compatible =3D "adi,adis16607-2", .data =3D &adis16607_2_chip_info },
> +	{ .compatible =3D "adi,adis16607-3", .data =3D &adis16607_3_chip_info },
> +	{ }
> +};

[Severity: Medium]
Is the ADIS16607-1 variant missing from the device ID tables?

The commit message indicates support for three variants including ADIS16607=
-1,
but it cannot be probed since it is missing here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-adis16607-=
v1-0-9c89cee35d56@analog.com?part=3D2
