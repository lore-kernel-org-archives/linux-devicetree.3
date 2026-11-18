Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008436;
	b=MrcybxIJm0XOWjD0lHGX+c0yEHA/Otgmn+VShp06XlBjdylrEC30g9GoYGbA5tqyVX9l
	 4d1lKAc60s1eKoUAixrpILfo6M4KLGRH/lWHFgTXinC9nCnUBpU/saZ9WT49AkSziaEEt
	 Zo9VvCfVK7NLEs4ueT044Wa/D45tJ9JuBrk9w/XSvn6ttvcNRtOPlf1t8FoSzQCoe2h5Y
	 xEguUM18dK6bxuWeULHsQ38qkFYI6HQ12tS0viGD0yhwKjFhsxjAGomU3urJWOqyZW0kg
	 Vy6uh/iChuBn7nl8tqAwV8LYkPzU5ABa0h1411eI1Bnyk7WgdaNTRl1xHFf6eLZrfUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008436;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bZYs97AX4VCrgBDWkEzza1DLKnl0W3+YlTZqKILg3TY=;
	b=od8EorItvU7N3kDwpOID5QekxA6/dnEmNR2/Ged1tfepT3yErFG535dxn49jO15/nVIv
	 M9SpaEEPeTB1HNM+lg+m+eUO3+8994xT3ygpaiNGqw7CizqfRLO50nGfdX1+mhCUUX9N4
	 WUe0fTjwnYD/e0cPuPhS4d4akhmt3j7fbx5/eFbz6JqUy9kcwGJOCF3L+FdgpGdXkkPUO
	 xZRSnhA91eB8r63SXNOGZ4I4vG4LvgMTu+fqb/Jub7p1ncoXXT6WvYgt8vutx9bLrKwxN
	 9vvXNMD6p0CH5MiOxgF1zLE8nvFRmqFLwnkaw78t8r4JfIsh3J0ktcZXMqXhRhrnUEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YjIaZ/C3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAAF606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjIaZ/C3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB811F000C4;
	Wed, 18 Nov 2026 13:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795008435;
	bh=bZYs97AX4VCrgBDWkEzza1DLKnl0W3+YlTZqKILg3TY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YjIaZ/C3qO3d1pZijcDIZWKVvOXXicMfsR/LVlG3GMlUZSp30S/rROERURJ9HIryY
	 0WhvwIJorcDqaDaqytkcjPTZ9hXlYe7LtlrTYu59FxGvfc7Y9AQ7ok9SMRY/1/Npam
	 a/dKam7Mag/8iz71c6EZMnXdhMA3i1T1QwqGg54mGUMupqhY8v0XShH8rLzKdclREF
	 Teaw/dZ2UL7bVGRUz/ZyrW9jE4wZQKmPXSkCDnPh0xQo0PDvFn/mPpiRM+D3ZFdp86
	 UKB07eQSmqfjuF2GStMPdwYNkuj6OgMFSQ7aE8d9zQvTOBJYoMev+pXf326lxgdFc/
	 +5tMHCpbJdeZw==
Message-ID: <sashiko-outbox-221011@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 5/5] iio: adc: Add support for ADA4355 and similar
 ADCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <2f5e83aa17aea08bbff69ca6ef7d32b11368f518.1795003864.git.marcelo.schmitt@analog.com>
References: <cover.1795003864.git.marcelo.schmitt@analog.com>
 <2f5e83aa17aea08bbff69ca6ef7d32b11368f518.1795003864.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 13:27:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] iio: adc: ada4355: backend channel 0 left disabled after
  calibration
- [High] iio: adc: ada4355: 1000x scale error in ada4355_fill_scale_tb()
- [Medium] iio: adc: ada4355: negative sampling freq wraps in
  ada4355_write_raw()
- [Medium] iio: adc: ada4355: missing cleanup on error in
  ada4355_calibrate()
- [Medium] iio: adc: ada4355: power supply regulators not enabled in
  ada4355_probe()
- [Low] iio: adc: ada4355: inconsistent st->lock usage in read and
  debugfs paths
--

commit 3d8753d370ebe3f8cd0cc6198719fc1f9fb5fb1d
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: Add support for ADA4355 and similar ADCs

This commit adds an IIO ADC driver for the Analog Devices ADA4355 and
ADA4356 current-input ADCs, using SPI for configuration and an IIO backend
for LVDS data capture.

> diff --git a/drivers/iio/adc/ada4355.c b/drivers/iio/adc/ada4355.c
> new file mode 100644
> index 0000000000000..7f9f58a143856
> --- /dev/null
> +++ b/drivers/iio/adc/ada4355.c

[ ... ]

> +/* ADC differential input span, =C2=B11 V with the 1 V internal referenc=
e. */
> +#define ADA4355_ADC_SPAN_mV			2000
> +/* ADC differential input with no input current flowing. */
> +#define ADA4355_ADC_BIAS_mV			825
> +
> +#define ADA4355_NUM_GSEL_GPIOS			2
> +
> +enum ada4355_tz_options {
> +	ADA4355_TZ0,
> +	ADA4355_TZ1,
> +	ADA4355_TZ2,
> +};
> +
> +static const unsigned int ada4355_tz_options_ohms[] =3D {
> +	[ADA4355_TZ1] =3D 2000, /* -80 to +800 uA input range */
> +	[ADA4355_TZ2] =3D 20000, /* -8.0 to +80 uA input range */
> +	[ADA4355_TZ0] =3D 200000, /* -0.8 to +8.0 uA input range */
> +};

[ ... ]

> +static int ada4355_debugfs_reg_access(struct iio_dev *indio_dev, unsigne=
d int reg,
> +				      unsigned int writeval, unsigned int *readval)
> +{
> +	struct ada4355_state *st =3D iio_priv(indio_dev);
> +
> +	if (readval)
> +		return regmap_read(st->regmap, reg, readval);
> +
> +	return regmap_write(st->regmap, reg, writeval);
> +}
> +
> +/*
> + * The ADC output code decreases as the input current increases so the s=
cale to
> + * milliamps is sign reversed.
> + */
> +static void ada4355_fill_scale_tb(struct ada4355_state *st,
> +				  struct ada4355_chip_info const *chip_info)
> +{
> +	u64 numerator, denominator;
> +	u32 rem;
> +
> +	st->scale_tb_size =3D chip_info->gain_options_size;
> +	for (unsigned int i =3D 0; i < st->scale_tb_size; i++) {
> +		numerator =3D (u64)ADA4355_ADC_SPAN_mV * NANO * MILLI;
> +		denominator =3D BIT_ULL(st->chan->scan_type.realbits) * chip_info->gai=
n_options[i];
> +		numerator =3D div64_u64(numerator, denominator);
> +		st->scale_tb[i][0] =3D div_u64_rem(numerator, NANO, &rem);
> +		st->scale_tb[i][1] =3D -(int)rem;
> +	}
> +}

[Severity: High]
Does multiplying ADA4355_ADC_SPAN_mV by MILLI here make st->scale_tb[][]
1000 times too large?

ADA4355_ADC_SPAN_mV is already in millivolts (2000 mV) and
chip_info->gain_options[i] is in Ohms, so dividing ADA4355_ADC_SPAN_mV by
gain_options[i] directly gives the full-scale current in milliamps.  The
extra MILLI factor reports microamps per LSB instead of milliamps per LSB
(for example, -0.061035156 mA/LSB instead of -0.000061035 mA/LSB at 2000
Ohms).

> +
> +static int ada4355_get_scale(struct ada4355_state *st, int *val, int *va=
l2)
> +{
> +	*val =3D st->scale_tb[st->scale_idx][0];
> +	*val2 =3D st->scale_tb[st->scale_idx][1];
> +
> +	return IIO_VAL_INT_PLUS_NANO;
> +}
> +
> +static int ada4355_set_scale(struct ada4355_state *st, int val, int val2)
> +{
> +	unsigned long gsel;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);

[Severity: Low]
Should ada4355_get_scale() and ada4355_debugfs_reg_access() also take
st->lock?

ada4355_set_scale() and ada4355_update_clock() both run under
IIO_DEV_ACQUIRE_DIRECT_MODE() in ada4355_write_raw() and take st->lock,
whereas ada4355_get_scale() reads st->scale_idx twice without st->lock and
ada4355_debugfs_reg_access() accesses st->regmap without serializing
against the multi-register reset and calibration sequences in
ada4355_update_clock().

[ ... ]

> +static int ada4355_calibrate_prepare(struct ada4355_state *st)
> +{

[ ... ]

> +	return iio_backend_chan_enable(st->back, 0);
> +}
> +
> +static int ada4355_calibrate_stop(struct ada4355_state *st)
> +{
> +	int ret;
> +
> +	ret =3D iio_backend_calibration_source_set(st->back,
> +						 IIO_BACKEND_CALIB_SOURCE_NONE,
> +						 0);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D iio_backend_chan_disable(st->back, 0);
> +	if (ret)
> +		return ret;
> +
> +	return ada4355_testmode_set(st, ADA4355_TEST_MODE_OFF);
> +}

[Severity: High]
Does disabling backend channel 0 in ada4355_calibrate_stop() leave the
channel disabled during buffered captures?

Nothing else in the driver calls iio_backend_chan_enable(st->back, 0):
ada4355_iio_info does not implement update_scan_mode and no buffer setup
ops are registered.  Once ada4355_calibrate_stop() disables channel 0 (or
if the backend does not set IIO_BACKEND_CAP_CALIBRATION and skips
ada4355_calibrate() altogether), backend channel 0 stays disabled when
userspace starts a buffered capture.

[ ... ]

> +static int ada4355_calibrate(struct ada4355_state *st)
> +{
> +	unsigned int lane;
> +	int ret;
> +
> +	/* all points invalid */
> +	bitmap_fill(st->calib_map, st->calib_map_size);
> +
> +	ret =3D ada4355_calibrate_prepare(st);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The frame signal has to be aligned first: the pattern match block
> +	 * only reports meaningful per-lane errors once the word boundary is
> +	 * known.
> +	 */
> +	ret =3D ada4355_calibrate_lane(st, IIO_BACKEND_CALIB_SOURCE_FRAME,
> +				     ADA4355_FRAME_LANE,
> +				     ADA4355_MAX_DATA_LANES * ADA4355_MAX_TEST_POINTS);
> +	if (ret)
> +		return ret;
> +
> +	for (lane =3D 0; lane < ADA4355_MAX_DATA_LANES; lane++) {\
> +		ret =3D ada4355_calibrate_lane(st,
> +					     IIO_BACKEND_CALIB_SOURCE_DATA_LANE,
> +					     lane,
> +					     lane * ADA4355_MAX_TEST_POINTS);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return ada4355_calibrate_stop(st);
> +}

[Severity: Medium]
If ada4355_calibrate_lane() fails during a runtime clock update in
ada4355_update_clock(), does returning early here leave the ADC in
ADA4355_TEST_MODE_USER and the backend calibration source enabled?

[ ... ]

> +static int ada4355_write_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int val, int val2, long mask)
> +{
> +	struct ada4355_state *st =3D iio_priv(indio_dev);
> +	long r_clk;
> +
> +	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> +	if (IIO_DEV_ACQUIRE_FAILED(claim))
> +		return -EBUSY;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		r_clk =3D clk_round_rate(st->clk, val);
> +		if (!in_range(r_clk, 1, ADA4355_MAX_SAMP_RATE_SPS))
> +			return -ERANGE;
> +
> +		return ada4355_update_clock(st, r_clk);

[Severity: Medium]
Can a negative or zero val in ada4355_write_raw() reprogram the clock
instead of returning an error?

clk_round_rate() takes an unsigned long rate, so a negative val sign-extends
to a large unsigned value and rounds down to the clock provider's maximum
rate (and 0 rounds up to its minimum rate).  If that rounded rate falls
within [1, ADA4355_MAX_SAMP_RATE_SPS], ada4355_update_clock() applies it.

[ ... ]

> +	st->clk =3D devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(st->clk))
> +		return PTR_ERR(st->clk);
> +
> +	indio_dev->name =3D chip_info->name;
> +	indio_dev->channels =3D &ada4355_channel;
> +	indio_dev->num_channels =3D 1;
> +	indio_dev->info =3D &ada4355_iio_info;
> +	st->chan =3D &ada4355_channel;
> +
> +	ret =3D ada4355_setup(st, chip_info);

[Severity: Medium]
Should ada4355_probe() enable the vcc-supply, vea-supply, and ved-supply
regulators before accessing the device in ada4355_setup()?

The DT binding in Documentation/devicetree/bindings/iio/adc/adi,ada4355.yaml
requires vcc-supply and lists vea-supply and ved-supply as optional
supplies, but the driver never requests or enables them, leaving the chip
unpowered on boards where those regulators are not always-on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795003864.gi=
t.marcelo.schmitt@analog.com?part=3D5
