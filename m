Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91BA3B71CC
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 22:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781561470; cv=none; b=markqDdiAu2AQQmP6Asz3f1Y2UGnQXiMlWuGLBBvb7Kt3i8iSywj/56HlG9oXPh0y5sHMz+kuCuZpRG++ndCXop/99l4FV/MSlYjTN9aKb8PPBUOf8vonqpgP1XRA/DZAjw2DdDBTLchMYyYnSPmq6eW3MX2/GiIJxb19/qsU7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781561470; c=relaxed/simple;
	bh=6cbcLUuijttbqVSAyYFDNAbK6N5Fzra0MFkiL2a88jM=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P8KF4bqDIUFThjL1g3jo4j8vdJ3tvlsqMwYo7XPAJOjulfvsl8LbgJA6CG6wduRCuQl8oA2SgmA8pI8z8KvtsjDXZeyLpHAMApczKaCZ6SlJLLUyzuZCJz7CJOKLpw4ZoOnrxnjWLWAax8YmfH8W1i7xp0FMvhtKk8GxyFcrK50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVrgTP2E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVrgTP2E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8271F00A3A;
	Mon, 15 Jun 2026 22:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781561468;
	bh=5nr70t5MRStu4X+VR7IDEBuNpzcQz+UOhBvXJQBrllI=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=ZVrgTP2EEmeGm7AEbxCsalU3v9Uoi+7Io8PyMsb24l//QsieLmscU8BSQL9eHTt8o
	 nV5BwlhV0EE+CqwIxfCeWzyrZUStZWg+11juudWJPkFGvJyKP/jZo3dTkI9GG1XeGo
	 hjsYCofJiJFQxXPr0RrNxY0H2M7EtiRKtdtokOdYawsy9+TIzzMr/UlFnvRc4FpjV9
	 mSXewSgHpITxHxxaQd9PAvCYfCjfKvXi07SBYe0sfX2FaUyZhvVqgA2XgDywBHtGdy
	 jH44xMzxT7TeoJ0IrwSFVILHutPrKAIWpGw55G9JsulbRSAp7tInU0tTLTWE4haHd/
	 Ll1xQswMDp/yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] iio: adc: add ti-ads112c14 driver
Reply-To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-iio-adc-ti-ads122c14-v1-2-e6bdadf7cb2b@baylibre.com>
References: <20260615-iio-adc-ti-ads122c14-v1-2-e6bdadf7cb2b@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 22:11:08 +0000
Message-Id: <20260615221108.6E8271F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Incorrect error checking and status validation in `ads112c14_probe=
` causes the driver to always fail probing or exit early.
- [High] The polling timeout for data readiness is significantly shorter th=
an the minimum conversion time, causing all reads to fail.
- [High] Short reads from the I2C block transfer cause uninitialized kernel=
 stack memory to be exposed to userspace.
- [Medium] Setting the `CONV_MODE` bit places the device in continuous mode=
 instead of the intended single-shot mode.
- [Low] The driver uses floating-point literals, which is prohibited in the=
 kernel.
--

commit cac55fa736d39d53faf1e07aa41f7aa5d0909c7f
Author: David Lechner (TI) <dlechner@baylibre.com>
Subject: iio: adc: add ti-ads112c14 driver

Adds a basic driver for TI ADS112C14/ADS122C14 ADC chips supporting
power on/reset and system monitor channels.

diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
new file mode 100644
index 0000000000000..97097ae2a4872
--- /dev/null
+++ b/drivers/iio/adc/ti-ads112c14.c
[ ... ]
> +struct ads112c14_data {
> +	const struct ads112c14_chip_info *chip_info;
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +};
> +
> +/* Maps REF_VAL to microvolts. */
> +static const u32 ads112c14_internal_ref_uV[] =3D {
> +	[ADS112C14_REFERENCE_CFG_REF_VAL_1_25V] =3D 1.25 * MICRO,
> +	[ADS112C14_REFERENCE_CFG_REF_VAL_2_5V] =3D 2.5 * MICRO,
> +};

[Severity: Low]
Does this use floating-point literals which are prohibited in the kernel?

The kernel environment does not support floating-point arithmetic, so
using 1.25 and 2.5 could cause compilation errors or link failures on
architectures without a hardware FPU. Could integer arithmetic be used
instead, such as 1250000?

[ ... ]
> +static int ads112c14_single_conversion(struct ads112c14_data *data,
> +				       const struct iio_chan_spec *chan,
> +				       u8 *buf)
> +{
> +	u32 reg_val;
> +	int ret;
[ ... ]
> +	ret =3D regmap_write(data->regmap, ADS112C14_REG_CONVERSION_CTRL,
> +			   ADS112C14_CONVERSION_CTRL_START);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read_poll_timeout(data->regmap,
> +				       ADS112C14_REG_STATUS_MSB, reg_val,
> +				       FIELD_GET(ADS112C14_STATUS_MSB_DRDY, reg_val),
> +				       1 * USEC_PER_MSEC, 10 * USEC_PER_MSEC);

[Severity: High]
Is the 10ms timeout duration here long enough?

The ADC's data rate is left at its default value representing 20 SPS,
which means a single conversion would take approximately 50ms. Because
the maximum timeout here is 10ms, won't every read attempt timeout and
fail with -ETIMEDOUT before the DRDY bit can be set?

> +	if (ret)
> +		return ret;
> +
> +	return i2c_smbus_read_i2c_block_data(data->client, ADS112C14_CMD_RDATA,
> +					     BITS_TO_BYTES(data->chip_info->resolution_bits),
> +					     buf);
> +}
> +
> +static int ads112c14_read_raw(struct iio_dev *indio_dev,
> +			      struct iio_chan_spec const *chan, int *val,
> +			      int *val2, long mask)
> +{
> +	struct ads112c14_data *data =3D iio_priv(indio_dev);
> +	u32 vref_uV, fsr_bits;
> +
> +	/* Selecting V_REF source is not implemented yet. */
> +	vref_uV =3D ads112c14_internal_ref_uV[ADS112C14_REFERENCE_CFG_REF_VAL_2=
_5V];
> +
> +	/* Currently, everything is using signed data. */
> +	fsr_bits =3D data->chip_info->resolution_bits - 1;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW: {
> +		u8 buf[3];
> +		int ret;
> +
> +		if (!iio_device_claim_direct(indio_dev))
> +			return -EBUSY;
> +
> +		ret =3D ads112c14_single_conversion(data, chan, buf);
> +		iio_device_release_direct(indio_dev);
> +		if (ret < 0)
> +			return ret;
> +
> +		switch (data->chip_info->resolution_bits) {
> +		case 16:
> +			*val =3D get_unaligned_be16(buf);

[Severity: High]
Can this lead to uninitialized kernel stack memory being leaked to userspac=
e?

In ads112c14_single_conversion(), i2c_smbus_read_i2c_block_data() returns
the number of bytes successfully read. If a short read occurs (e.g., it
returns 1 byte), ret will be a positive value.

Since the check here only looks for ret < 0, it treats a short read as a
success. This would cause the code to parse the partially uninitialized buf
array using get_unaligned_be16() or get_unaligned_be24(), exposing
uninitialized stack data.

Should this check verify that the expected number of bytes were actually
read?

[ ... ]
> +static int ads112c14_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	const struct ads112c14_chip_info *info;
> +	struct iio_dev *indio_dev;
> +	struct ads112c14_data *data;
> +	u32 reg_val;
> +	int ret;
[ ... ]
> +	/* Write magic reset value (0x16) to ensure known state.*/
> +	ret =3D regmap_write(data->regmap, ADS112C14_REG_CONVERSION_CTRL,
> +			   FIELD_PREP(ADS112C14_CONVERSION_CTRL_RESET, 0x16));
> +	/*
> +	 * The reset may cause an -EREMOTEIO error because of failing to get the
> +	 * I2C ACK at the end of the message. The device still gets reset.
> +	 */
> +	if (ret !=3D -EREMOTEIO)
> +		return ret;

[Severity: High]
Will this logic cause the probe to exit early with success instead of
continuing?

If the regmap_write() successfully resets the device, it returns 0. The
condition (0 !=3D -EREMOTEIO) evaluates to true, causing the driver to
immediately return 0 and incorrectly skip the rest of the device registrati=
on
entirely.

> +
> +	fsleep(ADS112C14_DELAY_RESET_us);
> +
> +	ret =3D regmap_read(data->regmap, ADS112C14_REG_STATUS_MSB, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	if (FIELD_GET(ADS112C14_STATUS_MSB_RESETN, reg_val))
> +		return dev_err_probe(dev, -EIO, "reset failed\n");

[Severity: High]
Is this reset status check inverted?

The ADS112C14_STATUS_MSB_RESETN bit is set to 1 upon a successful power-on
reset, which is corroborated by the subsequent comment mentioning clearing
the reset bit. If the reset is successful, this check will actively fail
the probe with -EIO.

> +
> +	/*
> +	 * Clear reset bit to prepare for next probe. And clear AVDD fault since
> +	 * that happens on every reset.
> +	 */
> +	ret =3D regmap_write(data->regmap, ADS112C14_REG_STATUS_MSB,
> +			   ADS112C14_STATUS_MSB_RESETN |
> +			   ADS112C14_STATUS_MSB_AVDD_UVN);
> +	if (ret)
> +		return ret;
> +
> +	/* Place in single-shot conversion mode to make ready for raw read. */
> +	ret =3D regmap_set_bits(data->regmap, ADS112C14_REG_DEVICE_CFG,
> +			      ADS112C14_DEVICE_CFG_CONV_MODE);

[Severity: Medium]
Does this configure the device for continuous conversion mode rather than
single-shot?

The comment notes the intention to place the device in single-shot
conversion mode, but setting the ADS112C14_DEVICE_CFG_CONV_MODE bit to 1
enables continuous mode instead. The default register value of 0 is
single-shot mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-iio-adc-ti=
-ads122c14-v1-0-e6bdadf7cb2b@baylibre.com?part=3D2
