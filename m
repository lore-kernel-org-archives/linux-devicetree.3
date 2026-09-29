Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D496C3B47F6
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 23:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790723773; cv=none; b=BCI35uJ6X3e8Y9dQ5sbCjkQhdQFNCyXJ55lOjOOtm+V/6Ou/8MimF/ZhwV4ta6MprJhIxK99aLn+Yka6gaVIUwFqvU4iwClJlUrU0HAKxAe+AKhGc07CMk2RR2inJX0ZZlNGSABc2TlD9+lRj3YmuoMtF5oxp8mgjGAt9bIRrZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790723773; c=relaxed/simple;
	bh=aKxSLxfMAmX7uQ4Fp2SkpqKk9sTONUsuTjC9UfjXsyk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=roEV/ByHjT5fWTt4P6BG79eUkxzqkS3mO9dkrx+ZUn2wG5A+Dn7BVSiMN+HmNMkGa0BCha3U8FsYLUoa+FggiHs5S9lOcGXBooy5Um1xDjyLD7T8dyEUW5bQjfT3W9fSltffVdEpkNnWHPYBhsRCGItjKA1EmL4F16KgFqFsZFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpRXe5hw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpRXe5hw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7C31F000FF;
	Tue, 29 Sep 2026 23:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790723771;
	bh=F0vKDrGvHJd5lbki69+au4OQZ5t10KPDTq2VVgjVl6M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XpRXe5hwhzO6xZBBJvouzqmk/HdGeW4JuWVGKdZkeGBfzvoBaGscnPAFTWd2hqnGi
	 RRe5+xQapSXhcqWoDYduCjKnYRqA+RTE7EAMpldd5ZZb63M1kicABDCdmKvYb3Qquf
	 RkjXO+kd0RpCBdZbnWQMXiNLTjiCvgSAEdHwdNI5/WaXKMz+C97mf6ScVp46BxL7FO
	 a23CLvt5iKhiAerrUrJZ/+7Saor0Km0sYB9s84dEsvlYyk5c1HthrHrBYp34qrOgPT
	 ypyOmIUl/a/Y0EgrP4kLWyE6rwcwHPc554dSL7L9QX9m7EwKM7ZJmJPOJ7UMOa8DVx
	 7JqGMJBuhOOJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/13] iio: adc: ad4134: Support high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <60682dd6c61806bf0d024d242c62b39a349db4f1.1790719425.git.marcelo.schmitt@analog.com>
References: <cover.1790719424.git.marcelo.schmitt@analog.com>
 <60682dd6c61806bf0d024d242c62b39a349db4f1.1790719425.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 23:16:10 +0000
Message-Id: <20260929231610.BA7C31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] iio: adc: ad4134: off-by-one error rejects maximum sample rate
- [Medium] iio: adc: ad4134: PWM left running on driver unbind
- [Low] iio: adc: ad4134: exposing unsupported IIO_CHAN_INFO_RAW in offload=
 mode
--

commit e47f312fc16187aac53abe53836e642d8e031a66
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Support high-speed data capture

This commit introduces SPI transfer offloading to speed up data capture for
the AD4134 ADC. This enhancement enables data acquisition at faster sample
rates up to 1.496 MSPS.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 50021001b3741..277f6de7c8714 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
[ ... ]
> @@ -160,6 +174,39 @@ static const struct iio_chan_spec ad4134_chan_set[] =
=3D {
>  	IIO_CHAN_SOFT_TIMESTAMP(4),
>  };
> =20
> +/*
> + * Hardcoded 32-bit storagebits and CPU endianness because the currently
> + * available HDL only supports that configuration.
> + */
> +#define AD4134_OFFLOAD_CHANNEL(_index) {					\
> +	.type =3D IIO_VOLTAGE,							\
> +	.indexed =3D 1,								\
> +	.channel =3D (_index),							\
> +	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),				\

[Severity: Low]
Is it intentional to expose the raw voltage attribute for offload channels?

The IIO_CHAN_INFO_RAW bit is set in the info_mask_separate here, exposing
the sysfs attribute. However, ad4134_read_raw() is modified later in this
patch to unconditionally return -EPROTONOSUPPORT for raw reads when offload
is enabled. Does this clutter the interface with an attribute that is
guaranteed to always fail?

> +	.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE) |			\
> +				    BIT(IIO_CHAN_INFO_SAMP_FREQ),		\
[ ... ]
> @@ -489,6 +544,92 @@ static struct regmap_config ad4134_regmap_config =3D=
 {
>  	.max_register =3D AD4134_CH_VREG(ARRAY_SIZE(ad4134_chan_set) - 1),
>  };
> =20
> +static int ad4134_update_conversion_rate(struct ad4134_state *st,
> +					 unsigned int freq_Hz)
> +{
> +	struct spi_offload_trigger_config config =3D st->offload_trigger_config;
> +	struct pwm_waveform odr_wf =3D { };
> +	u64 offload_period_ns;
> +	u64 offload_offset_ns;
> +	u64 odr_high_time_ns;
> +	unsigned int count;
> +	u64 target_ns;
> +	int ret;
> +
> +	if (!in_range(freq_Hz, AD4134_MIN_ODR_FREQ_HZ,
> +		      AD4134_MAX_ODR_FREQ_HZ - AD4134_MIN_ODR_FREQ_HZ))
> +		return -ERANGE;

[Severity: Medium]
Does this validation check inadvertently reject the maximum supported
frequency?

The in_range(val, start, len) macro strictly checks if val < start + len.
If a user requests exactly AD4134_MAX_ODR_FREQ_HZ, the condition evaluates
to MAX < MAX (which is false) and incorrectly returns -ERANGE.

> +
> +	odr_wf.period_length_ns =3D DIV_ROUND_UP_ULL(NSEC_PER_SEC, freq_Hz);
[ ... ]
> +	/* Check the PWM periods remain the same */
> +	offload_period_ns =3D DIV_ROUND_UP_ULL(HZ_PER_GHZ, config.periodic.freq=
uency_hz);
> +	if (odr_wf.period_length_ns !=3D offload_period_ns)
> +		return -EDOM;
> +
> +	ret =3D pwm_set_waveform_might_sleep(st->odr_pwm, &odr_wf, false);

[Severity: Medium]
Could this leave the PWM hardware running indefinitely after the driver
unbinds?

The ODR PWM is retrieved via devm_pwm_get() and started here, but no explic=
it
cleanup callback or devm action is registered to stop the waveform. When
the driver unloads, pwm_put() will drop the reference, but the hardware
could continue running, resulting in a resource leak.

> +	if (ret)
> +		return ret;
> +
> +	st->offload_trigger_config =3D config;
> +	st->odr_wf =3D odr_wf;
> +	st->odr_hz =3D DIV_ROUND_UP_ULL(NSEC_PER_SEC, odr_wf.period_length_ns);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790719424.gi=
t.marcelo.schmitt@analog.com?part=3D12
