Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992013E63B7
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783437313; cv=none; b=cqS50oPcbqvL0CXskaS5xCxgS4GvwGFg9WQSMtIE3qvUCeBv45UgaztlSqSwPWGJlo/ewaVOfD31SpLiwHXWMUuRuXo2zFb11E/whgcio7UMSyBpc9AelEq4xY2ACpknnHDG2Ct59+aWhz4CdVb2PD6NN2ialusCFiH4AE9WN7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783437313; c=relaxed/simple;
	bh=2wgy4d+l30inMSjjyi5hH6sLDCijruupbLxcm5nPl6o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W+qQZE4b5ivzFVpE+UBm5vcMwN909mI6NQHzDkiPi/4FqRjz6m3zC8jfpLEkuQsvzWFFs4D4YMc4vnBN42WuPFokRLcvcIYmnpN9KiQpoxnfxX0cj8H4B/N9H+a+3Hrt7m2FDBj/mktEKU9jd5SsnMjKUZ6JX5F5+dqJ3DpRWjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=InZUBM/m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="InZUBM/m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E391F000E9;
	Tue,  7 Jul 2026 15:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783437312;
	bh=47LqPBuFBe9fSx/UIitvWr+iHiL9du1UQE+9Mt5a7y8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=InZUBM/mUbOy7kkcAkeiAu6jBtRVtD6JAtt9oncIf6Wr5LX2+/1ALa9ixF2UOt0Aw
	 YPoYT1zZHgtQHM5yn30gaclt8IRoxIsg6Pq9cxnfoIz+67vAmHHE4+sZfuTjwvZYrj
	 pogKtgNpmZ+WRHWDLmv298b19yd/s/JyVqoGmJNHJpG58JsWFOGkfee/Gy2Eai2O+o
	 YT/PSiS/4aTZ/9eEcrNLDVGeLpe1TebLe8NesNUj0oq9VeYFAzgbUc5OLulwmNrG2i
	 LiwH+UTiZaIXLgjkz5X3oqLyIoS32IIbR1JsSgf7cAcdkd62XsJvIRJccJt0N4+xnp
	 H5jKGfKdqtCbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/17] iio: frequency: ad9910: initial driver
 implementation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-ad9910-iio-driver-v7-10-a4ec30f63700@analog.com>
References: <20260707-ad9910-iio-driver-v7-0-a4ec30f63700@analog.com>
 <20260707-ad9910-iio-driver-v7-10-a4ec30f63700@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 15:15:11 +0000
Message-Id: <20260707151511.E7E391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Uninitialized profile register caches cause valid hardware default=
s to be silently overwritten with zeros upon frequency updates.
- [High] Software power-down sets the REFCLK power-down bit, permanently di=
sabling I/O updates and bricking the device.
- [Medium] Silent failure and state mismatch when switching profiles withou=
t configured profile GPIOs.
- [Low] Format string mismatch using `%u` for an `unsigned long` variable.
--

--- Patch [10]: [PATCH v7 10/17] iio: frequency: ad9910: initial driver imp=
lementation ---
commit dabebf1bc32a608ba0826f1747d162f60c3129d1
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
Subject: iio: frequency: ad9910: initial driver implementation

Add the core AD9910 DDS driver infrastructure with single tone mode support.
This includes SPI register access, profile management via GPIO pins,
PLL/DAC configuration from firmware properties, and single tone
frequency/phase/amplitude control through IIO attributes.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index 0000000000000..900c0323a1739
> --- /dev/null
> +++ b/drivers/iio/frequency/ad9910.c
> @@ -0,0 +1,1107 @@

[ ... ]

> +/* CFR1 bit definitions */
> +#define AD9910_CFR1_RAM_ENABLE_MSK		BIT(31)

[ ... ]

> +#define AD9910_CFR1_AUX_DAC_POWER_DOWN_MSK	BIT(4)
> +#define AD9910_CFR1_SOFT_POWER_DOWN_MSK		GENMASK(7, 4)

[Severity: High]
Does this mask inadvertently include the reference clock power-down bit?

The soft power down mask encompasses bit 5, which corresponds to
AD9910_CFR1_REFCLK_INPUT_POWER_DOWN_MSK. When userspace writes to the
powerdown attribute, ad9910_sw_powerdown_set() in=20
drivers/iio/frequency/ad9910.c applies this mask to CFR1.=20

Powering down the reference clock stops the internal SYNC_CLK. Since the
I/O update mechanism requires SYNC_CLK to latch SPI register writes,
subsequent SPI writes might fail to wake up the device.

[ ... ]

> +static int ad9910_set_sysclk_freq(struct ad9910_state *st, u32 freq_hz,
> +				  bool update)
> +{
> +	struct device *dev =3D &st->spi->dev;
> +	unsigned long refclk_freq_hz;
> +	u32 sysclk_freq_hz;
> +	u32 tmp32, vco_sel;
> +	int ret;
> +
> +	if (!freq_hz || freq_hz > AD9910_MAX_SYSCLK_HZ)
> +		return -EINVAL;
> +
> +	refclk_freq_hz =3D clk_get_rate(st->refclk);
> +	if (st->data.pll_enabled) {
> +		if (refclk_freq_hz < AD9910_PLL_IN_MIN_FREQ_HZ ||
> +		    refclk_freq_hz > AD9910_PLL_IN_MAX_FREQ_HZ) {
> +			dev_err(dev,
> +				"REF_CLK freq %u Hz is out of PLL input range\n",
> +				refclk_freq_hz);

[Severity: Low]
Should this use the %lu format specifier?

The variable refclk_freq_hz in drivers/iio/frequency/ad9910.c is of type
unsigned long, so using %u might cause a format string mismatch and
potential truncation on 64-bit systems.

> +			return -ERANGE;
> +		}
> +
> +		tmp32 =3D DIV_ROUND_CLOSEST(freq_hz, refclk_freq_hz);

[ ... ]

> +	} else {
> +		if (refclk_freq_hz < AD9910_REFDIV2_MIN_FREQ_HZ ||
> +		    refclk_freq_hz > AD9910_REFDIV2_MAX_FREQ_HZ) {
> +			dev_err(dev,
> +				"REF_CLK freq %u Hz is out of divider range\n",
> +				refclk_freq_hz);

[Severity: Low]
Similarly, could this also use %lu to match the unsigned long type of
refclk_freq_hz?

> +			return -ERANGE;
> +		}
> +
> +		tmp32 =3D DIV_ROUND_CLOSEST(refclk_freq_hz, freq_hz);

[ ... ]

> +static int ad9910_profile_set(struct ad9910_state *st, u8 profile)
> +{
> +	DECLARE_BITMAP(values, BITS_PER_TYPE(profile));
> +
> +	st->profile =3D profile;
> +	values[0] =3D profile;
> +	gpiod_multi_set_value_cansleep(st->gpio_profile, values);
> +
> +	return 0;
> +}

[Severity: Medium]
Will this return success even if the hardware state cannot be changed?

During ad9910_probe() in drivers/iio/frequency/ad9910.c, the profile GPIO
array is requested as optional. If these GPIOs are not present on the
system, gpiod_multi_set_value_cansleep() acts as a no-op and returns 0.
As a result, ad9910_profile_set() updates the software state and reports
success back to userspace, but the actual hardware profile remains
unchanged.

[ ... ]

> +static int ad9910_write_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int val, int val2, long info)
> +{
> +	struct ad9910_state *st =3D iio_priv(indio_dev);
> +	u64 tmp64;
> +	u32 tmp32;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	switch (info) {
> +	case IIO_CHAN_INFO_ENABLE:

[ ... ]

> +	case IIO_CHAN_INFO_FREQUENCY:
> +		if (val < 0 || val2 < 0 || val >=3D st->data.sysclk_freq_hz / 2)
> +			return -EINVAL;
> +
> +		tmp64 =3D ad9910_rational_scale((u64)val * MICRO + val2, BIT_ULL(32),
> +					      (u64)MICRO * st->data.sysclk_freq_hz);
> +		tmp64 =3D min_t(u64, tmp64, U32_MAX);
> +		switch (chan->channel) {
> +		case AD9910_CHANNEL_PROFILE_0 ... AD9910_CHANNEL_PROFILE_7:
> +			tmp32 =3D chan->channel - AD9910_CHANNEL_PROFILE_0;
> +			tmp64 =3D FIELD_PREP(AD9910_PROFILE_ST_FTW_MSK, tmp64);
> +			return ad9910_reg64_update(st, AD9910_REG_PROFILE(tmp32),
> +						   AD9910_PROFILE_ST_FTW_MSK,
> +						   tmp64, true);

[Severity: High]
Does this silently overwrite the hardware defaults with zeros when the
frequency is updated?

During initialization in ad9910_setup() in drivers/iio/frequency/ad9910.c,
the device is reset to its default state, populating the profile registers
in hardware with non-zero values for the Amplitude Scale Factor. However,
the driver's cached shadow registers in st->reg remain initialized to zero.

When ad9910_reg64_update() computes the new register value, it uses:

    (st->reg[reg].val64 & ~mask)

Since the uninitialized cache is zero, this clears the amplitude scale
factor in the hardware, dropping the output amplitude to zero.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-ad9910-iio=
-driver-v7-0-a4ec30f63700@analog.com?part=3D10
