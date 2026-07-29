Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C213D2DF142
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314824; cv=none; b=D94hiw9IrO12g0OADRzFbFB2/PhZLlmILcabEHmpEZ42E3a4+ltNdBIpVeWINdF4wb//sFlRriScaGeOUUVZWKkjNHtxGAa3jzsm60F0TezszF88SG6kazk0PlGWXOhAIrvA1fPUTz5DTXd5lnc1WITFbzJgy+V8UefuG2i3yAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314824; c=relaxed/simple;
	bh=sE7XTT+OopcVzjZEhWBnp0EuLxG+2JglacJelvWdgpA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=El6KeS+KL9H+oFGowZR8Sn1nMaWIIPnbGgFR4pd7gdEh1MYwS/k8CmmgwMTtkhcSmK0aup/AHiM1HI2Dl4wcsKm8tBK4qCLp1A70yKgOB6TxR/utmd/rylCjRHjdBbSQnCvn+lVEWRdtY0g3R7mXZvfHBTW6U/ABGFj14vxDCK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLNZ9x23; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLNZ9x23"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF6C1F000E9;
	Wed, 29 Jul 2026 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785314822;
	bh=CxLUQusjfJ3y/b1s5NsKXxouDn+ShjJhii17b6EjWkk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JLNZ9x23nUVFMtHteBAFyQZ7RzEQfk0tI7YzRB43ReOQPCzHFGJHavJd3FTQNQIrB
	 TP2iSysP+O3ZLyrASgRilMldGmn+G2WUiMpzA4Kf49dtZxqprGTZaWSuvGYw4UjtUV
	 e1ew3mBVITNrCvbq+jMcWgPtaOPOn8xX7JZ6xE1HC0ND4qxGPSvDvDtytHLSzZbNJz
	 S976D16IPXU0ch32nK/vh5x34gxE00S56O7bm5/yPfh6j0fmYdY6DGFl5fzjp9UiOw
	 yKXAm7iXvRCuBxJCtzGAJKP9luPvNVwxhNjUn47AgeszT5/OTXXuzPS+2LcXKGRQEP
	 UP8NSO55lNa2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 10/17] iio: frequency: ad9910: initial driver
 implementation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729-ad9910-iio-driver-v10-10-aa1f6167729e@analog.com>
References: <20260729-ad9910-iio-driver-v10-0-aa1f6167729e@analog.com>
 <20260729-ad9910-iio-driver-v10-10-aa1f6167729e@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 08:47:01 +0000
Message-Id: <20260729084701.CEF6C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The `adi,refclk-out-drive-strength` property is ignored if the P=
LL is disabled.
- [Medium] Hardware and software cache mismatch for PROFILE registers when =
device reset is absent, leading to accidental zeroing of amplitude and phas=
e.
- [Low] Using `kstrtou32` instead of `kstrtobool` for boolean sysfs attribu=
te.
--

--- Patch [10]: [PATCH v10 10/17] iio: frequency: ad9910: initial driver im=
plementation ---
commit ca73a84a1a8f926aea1ac7c0a916c43aaab49400
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

    iio: frequency: ad9910: initial driver implementation

This commit adds the core AD9910 DDS driver infrastructure with single tone
mode support. This includes SPI register access, profile management via GPIO
pins, PLL/DAC configuration from firmware properties, and single tone
frequency/phase/amplitude control through IIO attributes.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index 0000000000000..b41b011af2812 100644
> --- /dev/null
> +++ b/drivers/iio/frequency/ad9910.c
[ ... ]
> +static ssize_t ad9910_ext_info_write(struct iio_dev *indio_dev,
> +				     uintptr_t private,
> +				     const struct iio_chan_spec *chan,
> +				     const char *buf, size_t len)
> +{
> +	struct ad9910_state *st =3D iio_priv(indio_dev);
> +	u32 val32;
> +	int ret;
> +
> +	ret =3D kstrtou32(buf, 10, &val32);

[Severity: Low]
Could this use kstrtobool() instead of kstrtou32() to parse the boolean
powerdown attribute?

Using kstrtobool() allows userspace tools to use standard boolean character
inputs (like 'Y' or 'N') in addition to numeric inputs, which is standard f=
or
sysfs boolean attributes.

> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	switch (private) {
> +	case AD9910_POWERDOWN:
> +		ret =3D ad9910_sw_powerdown_set(st, val32 ? true : false);
> +		if (ret)
> +			return ret;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return len;
> +}
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

[Severity: Medium]
Will this silently overwrite the amplitude and phase configurations if the
device doesn't have a hardware reset line?

If the reset control is optional and absent, the hardware's PROFILE registe=
rs
may hold non-zero values (e.g., initialized by a bootloader). However, the
software cache (st->reg) remains zero-initialized.=20

When ad9910_reg64_update() performs a read-modify-write against this zeroed
software cache, it will overwrite the hardware's amplitude (ASF) and phase
(POW) fields with 0. Should the driver read the initial hardware values into
the cache or write known default values during setup to avoid this
desynchronization?

> +		default:
> +			return -EINVAL;
> +		}
[ ... ]
> +static int ad9910_parse_fw(struct ad9910_state *st)
> +{
> +	static const char * const refclk_out_drv0[] =3D {
> +		"disabled", "low", "medium", "high",
> +	};
> +	struct device *dev =3D &st->spi->dev;
> +	const char *prop;
> +	u32 tmp;
> +	int ret;
> +
> +	st->data.pll_enabled =3D device_property_read_bool(dev, "adi,pll-enable=
");
> +	if (st->data.pll_enabled) {
> +		prop =3D "adi,charge-pump-current-microamp";
> +		if (device_property_present(dev, prop)) {
> +			ret =3D device_property_read_u32(dev, prop, &tmp);
> +			if (ret)
> +				return dev_err_probe(dev, ret, "property read: %s\n", prop);
> +
> +			if (tmp < AD9910_ICP_MIN_uA || tmp > AD9910_ICP_MAX_uA)
> +				return dev_err_probe(dev, -ERANGE,
> +						     "invalid charge pump current %u\n", tmp);
> +		} else {
> +			tmp =3D AD9910_ICP_MIN_uA;
> +		}
> +		st->data.pll_charge_pump_current =3D tmp;
> +
> +		prop =3D "adi,refclk-out-drive-strength";
> +		if (device_property_present(dev, prop)) {
> +			ret =3D device_property_match_property_string(dev, prop,
> +								    refclk_out_drv0,
> +								    ARRAY_SIZE(refclk_out_drv0));
> +			if (ret < 0)
> +				return dev_err_probe(dev, ret, "property read: %s\n", prop);
> +
> +			st->data.refclk_out_drv =3D ret;
> +		}

[Severity: Medium]
Will this ignore the "adi,refclk-out-drive-strength" property when the PLL =
is
disabled?

Since the AD9910 allows the REFCLK_OUT pin to buffer the reference clock ev=
en
when the PLL is bypassed, it seems this property should be parsed independe=
ntly
of the "adi,pll-enable" property. Otherwise, ad9910_cfg_sysclk() will
unconditionally write 0 to the DRV0 bits in CFR3, disabling the drive stren=
gth
when the PLL is bypassed.

> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-ad9910-iio=
-driver-v10-0-aa1f6167729e@analog.com?part=3D10
