Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ECC39B4AD
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 22:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778280692; cv=none; b=Av3V3NESwBsLc1SLr0Dt59yiSBVdF7iW+/flfJ2IJD7a3U4F20t+6E2Jcvz/oaugX8Gbj75ycztEeWB5TtdRW6Z7VyRbo6qmAIYlWlRfBOMqxdD4QuL8ycod/fsu1uHIX/hDHJV2gbx8mxO5Rs/6sTKhS1S0Mg5f1IX8xbWYFmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778280692; c=relaxed/simple;
	bh=Lqh9bnVj0MkrALaSv+P58iS4ehhufCa6AE59Zim3E9w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WWeg+Qvg1K4afl88OMQgh5zPX1QTj0Vo0Ozen3e/CLr5rlU8rAPFBNdZbM59fJ4OjQYzirfU0I300zzvhFx72lptMG+NvwEqGhj3ozkUY1YpzpgrhihvC2qXR57nKNe92UURyj2lCENDmLMEakOrXomlrSdjwnee2LXCoKr9dpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sR3vtwnV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sR3vtwnV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA5FC2BCF4;
	Fri,  8 May 2026 22:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778280691;
	bh=Lqh9bnVj0MkrALaSv+P58iS4ehhufCa6AE59Zim3E9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sR3vtwnV+I1nv03UCcL7k3tMOIhBEf4BuPKYLYyAEHDdEKI0+x4a3TIuXltBHu0KF
	 eT7aEApg2DpACVRbgi68tJCy3mUMmQU2aqr4Dv7p6oWmGL4xvO3yjmF1tM3KA7mE1B
	 nPdjpfdaEhcDvgTuDAOmKy4Du7VnrtFcYQchti8LDBt+R/7XfQfIyC2NNEm0hni5FF
	 4PEISKxwYSn0EUPDCQwFCVEQCTcUn4KKMQJkzftHfYVdeHkfZwhyUliQBl9MEtY34M
	 Z4O3tj10KxCPW6DLrUAiRSduiW+Se/lNOyt9wPG3qXnF22jw0w9nVND6DuMuAw2Cxa
	 Bf5WjU5lzow9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 03/10] iio: frequency: ad9910: initial driver
 implementation
Reply-To: sashiko@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260508-ad9910-iio-driver-v4-3-d26bfd20ee3d@analog.com>
References: <20260508-ad9910-iio-driver-v4-3-d26bfd20ee3d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 22:51:31 +0000
Message-Id: <20260508225131.8EA5FC2BCF4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Writing 0 to the `samp_freq` attribute causes a kernel panic due t=
o division by zero.
- [High] Setting the profile frequency implicitly mutes the DAC output due =
to a 0-initialized register cache.
- [High] Negative fractional inputs for frequency and scale cause unsigned =
integer underflow, applying maximum settings.
- [High] Probe fails for standard reference clocks due to `DIV_ROUND_CLOSES=
T` overshooting the maximum PLL frequency.
- [High] The initialization of the CFR3 hardware register is silently skipp=
ed if the PLL is disabled and the divider is even.
- [Medium] The driver unconditionally hardcodes the AD9910 into 4-wire SPI =
mode, breaking 3-wire SPI configurations.
--

commit ca91efe2fa4d4b296d7ac7c8f6d66ef193e1a2a0
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: initial driver implementation

Add the core AD9910 DDS driver infrastructure with single tone mode
support. This includes SPI register access, profile management via GPIO
pins, PLL/DAC configuration from firmware properties, and single tone
frequency/phase/amplitude control through IIO attributes.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> new file mode 100644
> index 0000000000000..c75f2ef178c25
> --- /dev/null
> +++ b/drivers/iio/frequency/ad9910.c
[ ... ]
> +static int ad9910_set_sysclk_freq(struct ad9910_state *st, u32 freq_hz,
> +				  bool update)
> +{
[ ... ]
> +	if (st->data.pll_enabled) {
[ ... ]
> +	} else {
> +		tmp32 =3D DIV_ROUND_CLOSEST(refclk_freq_hz, freq_hz);
> +		tmp32 =3D clamp(tmp32, 1, 2);

If a user writes 0 to the samp_freq sysfs attribute, freq_hz will be 0.
Could this cause a division by zero panic here when the PLL is disabled?

[ ... ]
> +static int ad9910_write_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int val, int val2, long info)
> +{
[ ... ]
> +	case IIO_CHAN_INFO_FREQUENCY:
> +		if (!in_range(val, 0, st->data.sysclk_freq_hz / 2))
> +			return -EINVAL;
> +
> +		tmp64 =3D ad9910_rational_scale((u64)val * MICRO + val2, BIT_ULL(32),
> +					      (u64)MICRO * st->data.sysclk_freq_hz);

The IIO core parses inputs between 0 and -1 (e.g., -0.5) as val =3D 0 and
val2 =3D -500000.=20

Does this bypass the bounds check since val is 0, and cause an unsigned
integer underflow when adding the negative val2 to (u64)val * MICRO? This
could misconfigure the device with maximum physical values.

> +		tmp64 =3D min(tmp64, U32_MAX);
> +		switch (chan->channel) {
> +		case AD9910_CHANNEL_PROFILE_0 ... AD9910_CHANNEL_PROFILE_7:
> +			tmp32 =3D chan->channel - AD9910_CHANNEL_PROFILE_0;
> +			tmp64 =3D FIELD_PREP(AD9910_PROFILE_ST_FTW_MSK, tmp64);
> +			return ad9910_reg64_update(st, AD9910_REG_PROFILE(tmp32),
> +						   AD9910_PROFILE_ST_FTW_MSK,
> +						   tmp64, true);

Since the profile registers in the st->reg cache are zero-initialized
during probe, will updating only the frequency word here merge it with an
Amplitude Scale Factor (ASF) of 0, inadvertently muting the DAC output?

[ ... ]
> +	case IIO_CHAN_INFO_SCALE:
> +		if (val < 0 || val > 1 || (val =3D=3D 1 && val2 > 0))
> +			return -EINVAL;
> +
> +		switch (chan->channel) {
> +		case AD9910_CHANNEL_PROFILE_0 ... AD9910_CHANNEL_PROFILE_7:
> +			tmp32 =3D chan->channel - AD9910_CHANNEL_PROFILE_0;
> +			tmp64 =3D ((u64)val * MICRO + val2) << 14;

Similar to the frequency attribute, could a negative fractional input like
-0.5 pass the val < 0 check here because val =3D=3D 0, leading to unsigned
wrap-around when applying the negative val2?

[ ... ]
> +static int ad9910_cfg_sysclk(struct ad9910_state *st, bool update)
> +{
> +	u32 cfr3 =3D AD9910_CFR3_OPEN_MSK;
> +	u32 tmp32;
> +
> +	cfr3 |=3D AD9910_CFR3_VCO_SEL_MSK |
> +		FIELD_PREP(AD9910_CFR3_DRV0_MSK, st->data.refclk_out_drv);
> +
> +	if (st->data.pll_enabled) {
[ ... ]
> +	} else {
> +		cfr3 |=3D AD9910_CFR3_REFCLK_DIV_RESETB_MSK |
> +			AD9910_CFR3_PFD_RESET_MSK;
> +	}
> +	st->reg[AD9910_REG_CFR3].val32 =3D cfr3;
> +
> +	return ad9910_set_sysclk_freq(st, AD9910_PLL_OUT_MAX_FREQ_HZ, update);
> +}

If the PLL is disabled, ad9910_set_sysclk_freq() is called with
update =3D false.

Inside that function, ad9910_reg32_update() checks if the new value matches
st->reg. Since cfr3 was just written to st->reg[AD9910_REG_CFR3].val32,
will this cause ad9910_reg32_update() to return 0 without executing the
SPI write, silently skipping the CFR3 hardware initialization?

Also, for standard reference clocks, is it possible that requesting
AD9910_PLL_OUT_MAX_FREQ_HZ (1000 MHz) causes a probe failure?=20

For example, with a 24 MHz clock, DIV_ROUND_CLOSEST(1000, 24) is 42,
which produces 1008 MHz. This exceeds the 1000 MHz maximum and causes
ad9910_set_sysclk_freq() to return -ERANGE.

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
> +	ret =3D ad9910_reg32_write(st, AD9910_REG_CFR1,
> +				 AD9910_CFR1_SDIO_INPUT_ONLY_MSK, false);

Does hardcoding AD9910_CFR1_SDIO_INPUT_ONLY_MSK unconditionally force the
device into 4-wire SPI mode? If the system relies on 3-wire SPI and
specifies spi-3wire in the device tree, could this break all subsequent
SPI reads?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-ad9910-iio=
-driver-v4-0-d26bfd20ee3d@analog.com?part=3D3
