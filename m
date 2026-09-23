Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310323B14BB
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191188; cv=none; b=g7yCKSYvgbk73DVakhoOS/bt8Lt6+nDoeXzfiKR0H/Ta+501fi/37ZD9nqqF89yR4cBfNdOWPre3ctE1wIpwoTeXT+pkA2l4MRt1wr9iyGmfq4JDZ8v/vsRxbCOXnKdL6zMR2jwDQO13f3qziVXvrDlrnUvCabjDXNJ22iWhlM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191188; c=relaxed/simple;
	bh=DjwwL8xrEYpKvw/MOc8zeX/i1NIveR47sKgUSIrb4ZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XOrBOiNDvaiTA/UudEFAPXWUmYStwddzQHhSbx8kzCQ0ryZ2Syb2+JnkzMuTuiYxD+hwOThkTUt7t0Xn6LW1xQAkzJVjoSa/ph7KGb3Y9IArc05XeNYTBNnXPWnTvt/1ugXFSfgbnYpfc7nhkV9PWmq/5gKbA5ZsjaZLz+j+GsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gS6YLI4K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gS6YLI4K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857761F000FF;
	Wed, 23 Sep 2026 19:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790191186;
	bh=6TINReRKgzHGfE+WJZiJvGKfTQEYLWnOT8uBrJFwH94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gS6YLI4K2PBJrF5yHTJJ+Gi7Z5LVfJkD5RADEoxMH7BSMwz1DdUHhb8fnPOurQUVj
	 22sekZ/S6JPq0vlKkEhcyys4kc4Bdf+XMLwKf5X/cbiIc3/b6B9V4GO7Lfz8mP13gQ
	 FtikTO9bZeK6LskLISbuYByV7eOHnNVSaTnjQu5p7oxj062zJ4dHo5DOx0v7hxcd4i
	 cP8DiyNeWnholdaZaEc0zOf2fowjAAmuVEnFH6lO7JaUvR7xBldBxfTPwMnl+oDIvh
	 suFNuaMQJREsLfeAIEX7cLoX3QwO1XURJhzM47zkU+Sl5DksF06HZ1SP9Fn2bKoN/0
	 8pqhQfH24HEPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-topic-sm8x50-iio-max34417-adc-v1-2-41d4ba1bfc41@linaro.org>
References: <20260923-topic-sm8x50-iio-max34417-adc-v1-0-41d4ba1bfc41@linaro.org>
 <20260923-topic-sm8x50-iio-max34417-adc-v1-2-41d4ba1bfc41@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 19:19:46 +0000
Message-Id: <20260923191946.857761F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] iio: max34417: division by zero in max34417_read_power() when acc_=
count is 0
- [High] iio: max34417: division by zero in max34417_probe() if rsense is 0
- [High] iio: max34417: build failure on 32-bit architectures due to GENMAS=
K(55, 32)
- [Medium] iio: max34417: fwnode handle leak on error paths in max34417_pro=
be()
- [Medium] iio: max34417: undeclared channels have uninitialized scale of 0
--

commit 281cd76d0d1a3f010bbf1f4241c438deb9b82192
Author: Neil Armstrong <neil.armstrong@linaro.org>

    iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range P=
ower Accumulator
   =20
    The MAX34417 is a specialized current and voltage monitor used to
    determine power consumption of portable systems. The driver support
    getting the channels voltage and accumulated average power over an
    I2C/SMBUS serial interface.

> diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
> new file mode 100644
> index 0000000000000..004401de6ce7d
> --- /dev/null
> +++ b/drivers/iio/adc/max34417.c

[ ... ]

> +static int max34417_read_power(struct max34417_data *max34417,
> +				 const struct iio_chan_spec *chan, int *val, int *val2)
> +{
> +	uint32_t acc_count;
> +	uint64_t power;
> +	uint8_t buf[8];
> +	int rc;
> +
> +	guard(mutex)(&max34417->lock);
> +
> +	rc =3D max34417_accumulator_update(max34417);
> +	if (rc)
> +		return rc;
> +
> +	rc =3D regmap_noinc_read(max34417->regmap, MAX34417_ACC_COUNT_REG,
> +			       &buf, 4);
> +	if (rc)
> +		return rc;
> +
> +	acc_count =3D buf[3] | ((uint64_t)buf[2] << 8) | ((uint64_t)buf[1] << 1=
6);
> +
> +	rc =3D regmap_noinc_read(max34417->regmap, chan->address, &buf, 8);
> +	if (rc)
> +		return rc;
> +
> +	power =3D buf[7];
> +	power |=3D ((uint64_t)buf[6] << 8UL);
> +	power |=3D ((uint64_t)buf[5] << 16UL);
> +	power |=3D ((uint64_t)buf[4] << 24UL);
> +	power |=3D ((uint64_t)buf[3] << 32UL);
> +	power |=3D ((uint64_t)buf[2] << 40UL);
> +	power |=3D ((uint64_t)buf[1] << 48UL);
> +
> +	power =3D div_u64(power, acc_count);

[Severity: High]
Is it possible for acc_count to be zero here? If the hardware returns 0 (for
example, due to an incomplete conversion, I2C read glitch, or uninitialized
state), wouldn't this div_u64() cause a division by zero panic?

> +
> +	*val =3D FIELD_GET(GENMASK(31, 0), power);
> +	*val2 =3D FIELD_GET(GENMASK(55, 32), power);

[Severity: High]
Will this build correctly on 32-bit architectures?

Since GENMASK() operates on unsigned long, which is 32 bits wide on those
platforms, attempting to mask bits 55..32 might result in an out-of-bounds
shift and trigger compiler errors or warnings like BUILD_BUG_ON_ZERO. Should
GENMASK_ULL(55, 32) be used instead?

> +
> +	return IIO_VAL_INT_64;
> +}
> +
> +static int max34417_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct max34417_data *max34417 =3D iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		if (chan->type =3D=3D IIO_VOLTAGE)
> +			return max34417_read_voltage(max34417, chan, val);
> +		return -EINVAL;
> +	case IIO_CHAN_INFO_AVERAGE_RAW:
> +		if (chan->type =3D=3D IIO_POWER)
> +			return max34417_read_power(max34417, chan, val, val2);
> +		return -EINVAL;
> +	case IIO_CHAN_INFO_SCALE:
> +		if (chan->type =3D=3D IIO_VOLTAGE) {
> +			/* Scale to mA */
> +			*val =3D MAX34417_VOLTAGE_CORRECTION_SCALE * MILLI;
> +			*val2 =3D MAX34417_VOLTAGE_FULL_SCALE_BITS;
> +
> +			return IIO_VAL_FRACTIONAL_LOG2;
> +		} else if (chan->type =3D=3D IIO_POWER) {
> +			/* Scale to mW */
> +			*val =3D max34417->input_correction[chan->channel] * MILLI;

[Severity: Medium]
Does this expose an uninitialized scale of 0 to userspace for omitted
channels?

Since all 4 channels are unconditionally exposed by max34417_channels, but
input_correction is only populated for channels explicitly defined in the
device tree during probe, userspace reading the scale for a missing channel
might get a value of 0.

> +			*val2 =3D MAX34417_PWR_AVG_FULL_SCALE_BITS;
> +
> +			return IIO_VAL_FRACTIONAL_LOG2;
> +		}
> +		return -EINVAL;
> +	default:
> +		return -EINVAL;
> +	}
> +}

[ ... ]

> +static int max34417_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct max34417_data *max34417;
> +	struct fwnode_handle *node;
> +	struct iio_dev *indio_dev;
> +	struct regmap *regmap;
> +	int rc;

[ ... ]

> +	device_for_each_child_node(dev, node) {
> +		unsigned int correction;
> +		u32 rsense, index;
> +
> +		if (fwnode_property_read_u32(node, "reg", &index)) {
> +			dev_err(dev, "missing reg property of %pfwP\n", node);
> +			return -EINVAL;

[Severity: Medium]
Does this code leak the fwnode reference? Since device_for_each_child_node()
takes a reference on the node during iteration, shouldn't fwnode_handle_put=
()
be called before returning early?

> +		} else if (index >=3D MAX34417_CHANNEL_COUNT) {
> +			dev_err(dev, "invalid reg %d of %pfwP\n", index, node);
> +			return -EINVAL;

[Severity: Medium]
Could this early return also leak the fwnode reference?

> +		}
> +
> +		fwnode_property_read_string(node, "label", &max34417->input_label[inde=
x]);
> +		if (fwnode_property_read_u32(node, "maxim,rsense-val-micro-ohms", &rse=
nse))
> +			rsense =3D MAX34417_DEFAULT_RSENSE;
> +
> +		/* (100 milliOhm / rsense) * MAX34417_PWR_CORRECTION_SCALE */
> +		correction =3D (100 * MILLI * MAX34417_PWR_CORRECTION_SCALE) / rsense;

[Severity: High]
Can rsense be zero here?

If the device tree explicitly sets "maxim,rsense-val-micro-ohms" to 0,
fwnode_property_read_u32() will succeed and leave rsense as 0, which would
cause a division by zero when calculating correction.

> +
> +		max34417->input_correction[index] =3D correction;
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-topic-sm8x=
50-iio-max34417-adc-v1-0-41d4ba1bfc41@linaro.org?part=3D2
