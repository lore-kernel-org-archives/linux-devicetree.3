Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5767E2E975E
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 19:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779045656; cv=none; b=uMZXQKCbc/B0uTpFvZEk/9oEzbDpq3OsnPupLTzNrFgtw2shUGno000ZB4GerQUp+BKNqcnulEO2GWbsV0bPzEp6Ay1gs3bGNX5x7G61ZJ+CTdS/L7n/vK8AkfYqJ5ruLw3tBRAAh7SXYggI3n84A7uqI2B7Vx5MeO/UtpDKn5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779045656; c=relaxed/simple;
	bh=+icR24HAzvWhlNNWFUDT5qNsPqME/w3ynrhZBMl+PtU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I8kj/kjp9rEUF0ZMRNlMH5pmQMOGZJ1ybfv+bkGFYfdXVmpCqGfrJ0qUkv/4Tzlc42lUslxrlJoF1znoGsUoTU98A/z9n8L13Zr1Ku2jwLkh86QsdHLtFBQS1aA7ykjaM1m8m1sZEyMRxl8uHZAxMXXJ3EiAkcrDfaLnrBLkObo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/kHhlFi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/kHhlFi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7F6C2BCB0;
	Sun, 17 May 2026 19:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779045656;
	bh=+icR24HAzvWhlNNWFUDT5qNsPqME/w3ynrhZBMl+PtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=i/kHhlFiF0ni87Glinjb7I7ZHswRpFANrTf7h5N/Wq7+wZgGnrHYVcl4+Y2CM9Y2I
	 54g8En/p4jmD+Vzt/BH+Uz3I/2eQk62NWGKKVXxcWLpDYxinTnPdgsc3BykF7zwlGY
	 +3sPoCg/o4ELbmZNGMKKezpoQgmAOwrlrsLbingu/Ix1vD0RR03JIqme/kA4ioPnko
	 apWDFlibDfYXORCwRClZbuFQ/RtVzNyQyGtJslN201HQQ26MAg3JYHaFf5MIpmc0bv
	 BUpIWsoWI1aKtipHgMTBEMiDsN3e1u1iMq6G0Vfiyc1wWlKvlluqf14lnTMaqGMJcA
	 /pi2RebHc8GFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/13] iio: frequency: ad9910: initial driver
 implementation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260517-ad9910-iio-driver-v5-6-31599c88314a@analog.com>
References: <20260517-ad9910-iio-driver-v5-6-31599c88314a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 19:20:55 +0000
Message-Id: <20260517192055.CC7F6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Incorrect usage of `device_property_read_u32_array` causes single-=
value property `output-range-microamp` to be ignored.
- [High] VCO_SEL field is incorrectly set to an out-of-bounds value (7) whe=
n the PLL is bypassed.
- [High] Stack out-of-bounds read in `ad9910_profile_set()` triggered by un=
validated GPIO descriptor count.
- [High] Missing resource teardown: device reset line is never asserted on =
driver removal.
- [Medium] PLL multiplier clamping logic violates the hardware's minimum VC=
O operating frequency.
- [Medium] Missing hardware initialization delay after reset deassertion ca=
n cause SPI communications to fail.
--

commit fb6e130c7d866653f35ab965acf927500a84756c
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: initial driver implementation

Add the core AD9910 DDS driver infrastructure with single tone mode
support. This includes SPI register access, profile management via GPIO
pins, PLL/DAC configuration from firmware properties, and single tone
frequency/phase/amplitude control through IIO attributes.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> new file mode 100644
> index 0000000000000..c7b1e474c92df
> --- /dev/null
> +++ b/drivers/iio/frequency/ad9910.c
[ ... ]
> +static int ad9910_set_sysclk_freq(struct ad9910_state *st, u32 freq_hz,
> +				  bool update)
> +{
[ ... ]
> +		tmp32 =3D clamp(tmp32, DIV_ROUND_UP(AD9910_PLL_OUT_MIN_FREQ_HZ, refclk=
_freq_hz),
> +			      AD9910_PLL_OUT_MAX_FREQ_HZ / refclk_freq_hz);
> +		tmp32 =3D clamp(tmp32, AD9910_PLL_MIN_N, AD9910_PLL_MAX_N);
> +		sysclk_freq_hz =3D refclk_freq_hz * tmp32;

Is it possible for this second clamp to drop the multiplier below the
minimum frequency constraint? If the input reference clock is 3.2 MHz,
the first clamp would raise the multiplier to 132 to reach 420 MHz, but
the second clamp limits it to 127. This results in a VCO frequency of
406.4 MHz, violating the hardware minimum. Should the driver return
-ERANGE instead if the bounds cannot be satisfied?

[ ... ]
> +	} else {
> +		tmp32 =3D DIV_ROUND_CLOSEST(refclk_freq_hz, freq_hz);
> +		tmp32 =3D clamp(tmp32, 1U, 2U);
> +		sysclk_freq_hz =3D refclk_freq_hz / tmp32;
> +		tmp32 =3D AD9910_CFR3_VCO_SEL_MSK |
> +			FIELD_PREP(AD9910_CFR3_REFCLK_DIV_BYPASS_MSK, tmp32 % 2);
> +		ret =3D ad9910_reg32_update(st, AD9910_REG_CFR3,
> +					  AD9910_CFR3_VCO_SEL_MSK |
> +					  AD9910_CFR3_REFCLK_DIV_BYPASS_MSK,
> +					  tmp32, update);

Does setting tmp32 with AD9910_CFR3_VCO_SEL_MSK cause the update function
to write an out-of-bounds value here? Because tmp32 contains the entire
mask, the underlying field will be set to 7, but the valid range for the
vco sel field is 0 to 5.

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

Could this cause an out-of-bounds read on the stack? The values bitmap is
sized using BITS_PER_TYPE(profile), which allocates space for 1 unsigned
long. If the device tree provides more profile gpios than fit in an unsigned
long, gpiod_multi_set_value_cansleep() might read past the end of the bitmap
when iterating over the descriptors.

[ ... ]
> +static int ad9910_parse_fw(struct ad9910_state *st)
> +{
[ ... ]
> +	tmp[1] =3D AD9910_DAC_IOUT_DEFAULT_uA;
> +	device_property_read_u32_array(dev, "output-range-microamp", tmp,
> +				       ARRAY_SIZE(tmp));

Will this properly read a single-value property? Because ARRAY_SIZE(tmp)
is passed as the expected element count, device_property_read_u32_array()
might return -EOVERFLOW and leave the tmp array unmodified if only one
value is present in the device tree, causing the property to be silently
ignored.

[ ... ]
> +static int ad9910_setup(struct device *dev, struct ad9910_state *st,
> +			struct reset_control *dev_rst)
> +{
> +	int ret;
> +
> +	ret =3D reset_control_deassert(dev_rst);
> +	if (ret)
> +		return ret;
> +

Is a teardown action missing for the device reset here? Without adding a
managed action to assert the reset line, the hardware might remain active
after the driver is unloaded or if a subsequent setup step fails.

Might this also require a hardware delay before the first spi write? The
datasheet specifies waiting for the internal state machine to become ready
after a low-to-high transition on the reset line. On fast hosts, the
immediate spi access might be ignored.

> +	ret =3D ad9910_reg32_write(st, AD9910_REG_CFR1,
> +				 (st->spi->mode & SPI_3WIRE ? 0 :
> +				 AD9910_CFR1_SDIO_INPUT_ONLY_MSK), false);
> +	if (ret)
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-ad9910-iio=
-driver-v5-0-31599c88314a@analog.com?part=3D6
