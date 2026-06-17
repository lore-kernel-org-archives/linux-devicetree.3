Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152C5285C91
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662668; cv=none; b=LNvj8E370Pge9sgfvybw9I0qx7RohHpMLJoSlsZkNa9Vb4wD6aBDOYE/iGElB7+OtSMi7X9oqadH1OhT5dS6jYJUdQggKpsxxRhRLDIsHNIhod4f9iaQ5lTeYWY1pM9tZ92OtgQRmFD+DeLZT/I6JZjWN87mEgDHTVVdpXi+KAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662668; c=relaxed/simple;
	bh=A19iqF3ZLkWUzRreS0cPKN3n07mK+mg2zR0kJt+vzag=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hxuv1Zgw5CBi8/DNZeeSQB+9pdI05vbI95dSctsSGcc4aNAQgsvieBjGQ4jKyMmUg/xea9nJO9VOEX7AW69pCzkv6nJGw8bHK/mA0Fceqv/QzMwNwgS25NS8hxpQCWvaN/3OXaeQs3GQ+l8ZWOVf8xn9fGwlnR+tKdieU6DwmXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfkz+3lY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfkz+3lY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C131F000E9;
	Wed, 17 Jun 2026 02:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781662666;
	bh=Iek0aiiHe3jxIqNi5QiPdRrOGePjH+lkR53V4W6vse8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hfkz+3lY76ziwVOFvKqrOKeHgl7X2m3/mk+f5oQSIjf8Z6H9f4KOMK2T17kmJdnX/
	 MjSOkVIY77ysFaRmc6NrgmUJPC/GI4BV24M9kOFTv3q4Kk4voaHxn4H8vo5lpTRdXO
	 4irGFFa+dvFFEQci8uiaN5E8o48EjjsJQ9HCIm67tv0cPbyjPwvvtI/G0kpEQa3rmF
	 Tgg0Jy1+pbBGuk8TtPaEF62lBovJvWs0xGt7qBPk5R12pv6YeEVcxXVtb7mySOotIL
	 645gZSM5fGqe2gt8nt2VG5UoNTSg3872RV11dJe5DekQNDILItKQkZNZOGZxHa6oRA
	 n1To1DttAonWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] iio: adc: ltc2378: Enable high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <9f173c47928446aa3e900cf0becb6130dd76846b.1781661028.git.marcelo.schmitt@analog.com>
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <9f173c47928446aa3e900cf0becb6130dd76846b.1781661028.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 02:17:46 +0000
Message-Id: <20260617021746.92C131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Unconditional propagation of -ENODEV breaks driver probe on system=
s without SPI offload
- [High] Silent failure in SPI offload trigger offset validation loop risks=
 data corruption
- [Medium] Incomplete state rollback on failed conversion rate validation c=
orrupts driver state
- [Low] Missing source file causes build failure
- [Low] Accumulative drift of PWM period due to reusing modified waveform s=
tructure
--

commit 0bb089e96af6d65eeaa13775a0321f6c17a80b75
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Enable high-speed data capture

Make use of SPI transfer offloading to speed up data capture, enabling data
acquisition at faster sample rates (up to 2 MSPS).

> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 2b82034513673..f96d9262b891d 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -944,6 +944,9 @@ config LTC2378
>  	tristate "Analog Devices LTC2378 ADC driver"
>  	depends on SPI
>  	depends on GPIOLIB
> +	select LTC2378_LIB
> +	select LTC2378_LIB_OFFLOAD_BUFFER if SPI_OFFLOAD && PWM && SPI_OFFLOAD_=
TRIGGER_PWM && IIO_BUFFER && IIO_BUFFER_DMAENGINE
> +	select LTC2378_LIB_TRIGGERED_BUFFER if IIO_BUFFER

[ ... ]

> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index 1814fb78dde30..109cd39237c9d 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -82,6 +82,12 @@ obj-$(CONFIG_LPC18XX_ADC) +=3D lpc18xx_adc.o
>  obj-$(CONFIG_LPC32XX_ADC) +=3D lpc32xx_adc.o
>  obj-$(CONFIG_LTC2309) +=3D ltc2309.o
>  obj-$(CONFIG_LTC2378) +=3D ltc2378.o
> +
> +ltc2378_lib-y +=3D ltc2378-lib-core.o
> +ltc2378_lib-$(CONFIG_LTC2378_LIB_OFFLOAD_BUFFER) +=3D ltc2378-offload-bu=
ffer.o
> +ltc2378_lib-$(CONFIG_LTC2378_LIB_TRIGGERED_BUFFER) +=3D ltc2378-triggere=
d-buffer.o

[Severity: Low]
Will this break the build since ltc2378-triggered-buffer.c is not included
in this patch?

The patch adds CONFIG_LTC2378_LIB_TRIGGERED_BUFFER and references
ltc2378-triggered-buffer.o in the Makefile, which is automatically selected=
 if
IIO_BUFFER is enabled. However, the corresponding ltc2378-triggered-buffer.c
file is missing.

This regression was fixed later in the series in commit
975300646e8809a19fe7c482edd698d128476317 ("iio: adc: ltc2378: Enable trigge=
red
buffer data capture"), but shouldn't each patch in the series compile
independently to preserve bisectability?

[ ... ]

> diff --git a/drivers/iio/adc/ltc2378-lib-core.c b/drivers/iio/adc/ltc2378=
-lib-core.c
> new file mode 100644
> index 0000000000000..1160f4324d019
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378-lib-core.c
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Analog Devices LTC2378 ADC series driver
> + *
> + * Copyright (C) 2026 Analog Devices Inc.
> + * Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/iio/iio.h>
> +
> +#include "ltc2378.h"
> +
> +int ltc2378_lib_buffer_setup(struct iio_dev *indio_dev, struct ltc2378_s=
tate *st)
> +{
> +	struct device *dev =3D &st->spi->dev;
> +	int ret;
> +
> +	ret =3D __ltc2378_set_offload_ops(st);
> +	if (ret =3D=3D -EOPNOTSUPP)
> +		return 0; /* Let device setup complete without buffer support */
> +
> +	if (!ret)
> +		ret =3D st->ops->buffer_setup(indio_dev, st);
> +
> +	if (ret)
> +		return dev_err_probe(dev, ret, "error on SPI offload setup\n");
> +
> +	return 0;
> +}

[ ... ]

> diff --git a/drivers/iio/adc/ltc2378-offload-buffer.c b/drivers/iio/adc/l=
tc2378-offload-buffer.c
> new file mode 100644
> index 0000000000000..3e8c7ab64a54b
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378-offload-buffer.c
> @@ -0,0 +1,305 @@

[ ... ]

> +static int ltc2378_offload_buffer_setup(struct iio_dev *indio_dev,
> +					struct ltc2378_state *st)
> +{
> +	struct spi_device *spi =3D st->spi;
> +	struct device *dev =3D &spi->dev;
> +	int ret;
> +
> +	st->offload =3D devm_spi_offload_get(dev, spi, &ltc2378_offload_config);
> +	ret =3D PTR_ERR_OR_ZERO(st->offload);
> +	if (ret)
> +		return ret;

[Severity: High]
Does this unconditionally propagate -ENODEV and break the driver probe on
systems without SPI offload?

When CONFIG_LTC2378_LIB_OFFLOAD_BUFFER is enabled, the driver attempts to s=
et
up the SPI offload buffer. If the system hardware does not support SPI offl=
oad,
devm_spi_offload_get() returns -ENODEV.

Because ltc2378_offload_buffer_setup() returns this error,
ltc2378_lib_buffer_setup() will pass it to dev_err_probe() and fail the ent=
ire
ADC probe. Should the driver treat -ENODEV as a signal to bypass offload se=
tup
and gracefully fall back to triggered buffer or direct mode?

[ ... ]

> +static int ltc2378_update_conversion_rate(struct ltc2378_state *st, int =
freq_Hz)
> +{
> +	struct spi_offload_trigger_config *config =3D &st->offload_trigger_conf=
ig;
> +	unsigned int min_read_offset, offload_period_ns;
> +	struct pwm_waveform cnv_wf =3D { };
> +	u64 target =3D LTC2378_TCNV_HIGH_NS;
> +	unsigned int count =3D 0;
> +	u64 offload_offset_ns;
> +	int ret;
> +
> +	if (freq_Hz =3D=3D 0)
> +		return -EINVAL;
> +
> +	if (freq_Hz < 1 || freq_Hz > st->info->max_sample_rate_hz)
> +		return -ERANGE;
> +
> +	/* Configure CNV PWM waveform */
> +	cnv_wf.period_length_ns =3D DIV_ROUND_CLOSEST(NSEC_PER_SEC, freq_Hz);
> +
> +	/*
> +	 * Ensure CNV high time meets minimum requirement (20ns). The PWM
> +	 * hardware may round the duty cycle, so iterate until we get at least
> +	 * the minimum required high time.
> +	 */
> +	do {
> +		cnv_wf.duty_length_ns =3D target;
> +		ret =3D pwm_round_waveform_might_sleep(st->cnv_trigger, &cnv_wf);
> +		if (ret)
> +			return ret;
> +		target +=3D 10;  /* Increment by PWM duty cycle period */
> +	} while (count++ < 100 && cnv_wf.duty_length_ns < LTC2378_TCNV_HIGH_NS);

[Severity: Low]
Could this cause an accumulative drift of the PWM period?

In this loop, pwm_round_waveform_might_sleep(&cnv_wf) can modify fields in
cnv_wf based on hardware rounding capabilities. Because cnv_wf.period_lengt=
h_ns
is not reset to the original target period at the beginning of each iterati=
on,
any rounding applied to the period in one iteration is passed into the next,
which might drift the PWM period away from the requested frequency.

> +
> +	/* Double check the minimum CNV high time is met */
> +	if (cnv_wf.duty_length_ns < LTC2378_TCNV_HIGH_NS)
> +		return -EIO;
> +
> +	/*
> +	 * Configure SPI offload PWM trigger.
> +	 * The trigger should fire after tBUSYLH + tCONV + tDSDOBUSYL.
> +	 * Minimum time needed: TBUSYLH (13ns) + TCONV (part-specific) + TDSDOB=
USYL (5ns)
> +	 *
> +	 * Use the same period as CNV PWM to avoid timing issues.
> +	 * Convert back from period to frequency for the SPI offload API.
> +	 */
> +	offload_period_ns =3D cnv_wf.period_length_ns;
> +	config->periodic.frequency_hz =3D DIV_ROUND_UP(HZ_PER_GHZ, offload_peri=
od_ns);
> +	min_read_offset =3D LTC2378_TBUSYLH_NS + st->info->tconv_ns + LTC2378_T=
DSDOBUSYL_NS;
> +	offload_offset_ns =3D min_read_offset;
> +	count =3D 0;
> +	do {
> +		config->periodic.offset_ns =3D offload_offset_ns;
> +		ret =3D spi_offload_trigger_validate(st->offload_trigger, config);
> +		if (ret)
> +			return ret;

[Severity: Medium]
Does returning here leave the driver in an inconsistent state?

The pointer config directly points to the device state
st->offload_trigger_config. If validation fails, returning an error immedia=
tely
leaves st->offload_trigger_config containing the rejected values, while
st->cnv_wf and st->cnv_Hz retain their old values.

Subsequent buffer enable operations might try to pair the old PWM waveform
with the corrupted offload trigger config. Shouldn't the state be modified
on a local copy and only committed upon success?

> +		offload_offset_ns +=3D 10;
> +	} while (count++ < 100 && config->periodic.offset_ns < min_read_offset);
> +
> +	st->cnv_wf =3D cnv_wf;
> +	st->cnv_Hz =3D DIV_ROUND_CLOSEST_ULL(HZ_PER_GHZ, cnv_wf.period_length_n=
s);
> +
> +	return 0;

[Severity: High]
Is it possible for this to silently return 0 on a failed loop condition?

The loop iterates up to 100 times to find an SPI offload trigger offset >=3D
min_read_offset. If the underlying hardware driver continually rounds the
offset down such that it never reaches min_read_offset, the loop drops out
after 100 iterations.

The function then unconditionally returns 0 (success). This would configure
the SPI offload to trigger an SPI read before the ADC finishes its conversi=
on,
leading to corrupted data. Should this check if
config->periodic.offset_ns >=3D min_read_offset after the loop and return an
error if it fails?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781661028.gi=
t.marcelo.schmitt@analog.com?part=3D4
