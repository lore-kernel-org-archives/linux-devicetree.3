Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE3D9463
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782399178; cv=none; b=MQTrBsIx48E9q4SMS863QVAPSozU3f9HhkACoIeW5qnLjzlakRLPGTYOvGdJkUlg0Qgd6zF+MWhrURD2TBTUbDGlb6fiGH0WLxxVowLf/oni6w5bVjLPsIsGJ7Rzo9OTH8P/TdGMqkcI5nPZ3+5VYWgRtodteGDxQXc7KD8pzQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782399178; c=relaxed/simple;
	bh=91gf0lOco5Oc9MvuC6djEtYHDVplmY10tJO9qLqVjyk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W9P27bUE9gALThz1jEdG+KWXOkV2cH0Rt5t5vfVC9/h6QgTIT56MIQO4gN6XRsgbQGVpLgmoUyNV9zM0rbWE3GBwYULvYXRLWWOPanTleT/vioLaOQIJdikbn2Me4BZXa8EqH5Xfw8ty9EdbF3vGoGVEdID7oF8L5/NCMYKKa9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyOgdIef; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyOgdIef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187161F00A3F;
	Thu, 25 Jun 2026 14:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782399176;
	bh=qTLDmtXD18ue3qwSmH6NLjffQsbGbbZDFC1fMrMY5dU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CyOgdIeffKzvdLz0+zq5RDGxJjKYqch/9p2aUIySxruH/iUlwtt/KysfMMn9elTUb
	 M8rdApzpCGXVw7l/mnspMUmWvva2Lz/T5hL7EsQdZ9McjCXtCbfwflG40CHXOXLsSi
	 5cXYmJa8Xxv4nSOzTTDsP0QiHoSA5gscHld1TzIrz7+SpyEUKTkuGUNkj0ZJ9FOPqE
	 wdkQ9A+oS4uvsax0GHd53YbXQ5+9H+JQ+6IqFEbBLd7M4B3g8TqNf1rl01XGLvDSJA
	 5YzQp28oY0ITwZd++0V4ckQPLs3q0iwEs4I6fuZnlkMEeSuza0zN6q1uM9tvpx7Vtt
	 Bm/+8hFNWi28w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] iio: adc: ltc2378: Enable high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <7d91f48bb03a16e6876e7aeb05fe259e33ae625f.1782397418.git.marcelo.schmitt@analog.com>
References: <cover.1782397418.git.marcelo.schmitt@analog.com>
 <7d91f48bb03a16e6876e7aeb05fe259e33ae625f.1782397418.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 14:52:55 +0000
Message-Id: <20260625145256.187161F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing verification of SPI offload trigger offset after validatio=
n loop in `ltc2378_update_conversion_rate()` allows silent data corruption.
- [Medium] In-out parameters accumulate drift across iterative rounding loo=
ps in `ltc2378_update_conversion_rate()`.
- [Medium] Torn state on error path in `ltc2378_update_conversion_rate()` d=
ue to partially updated `st->offload_trigger_config`.
- [Low] Data race on `st->cnv_Hz` between sysfs readers and writers.
--

commit 57c4b9b3af36aafb3888623014ea397ad6cf0cd6
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Enable high-speed data capture
   =20
Make use of SPI transfer offloading to speed up data capture, enabling data
acquisition at faster sample rates (up to 2 MSPS).

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> --- a/drivers/iio/adc/ltc2378.c
> +++ b/drivers/iio/adc/ltc2378.c
[ ... ]
> @@ -254,7 +345,126 @@ static int ltc2378_read_raw(struct iio_dev *indio_d=
ev,
>  			*val2 =3D chan->scan_type.realbits;
> =20
>  		return IIO_VAL_FRACTIONAL_LOG2;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*val =3D st->cnv_Hz;

[Severity: Low]
When reading the frequency via ltc2378_read_raw(), st->cnv_Hz is read witho=
ut
acquiring the direct mode lock. Since it can be concurrently modified by
ltc2378_update_conversion_rate() during a write, does this cause a data rac=
e?
Should this be protected or accessed via READ_ONCE()?

> +		return IIO_VAL_INT;
> +	default:
> +		return -EINVAL;
> +	}
> +}
[ ... ]
> +static int ltc2378_update_conversion_rate(struct ltc2378_state *st, int =
freq_Hz)
> +{
[ ... ]
> +	/* Configure CNV PWM waveform */
> +	cnv_wf.period_length_ns =3D DIV_ROUND_CLOSEST(NSEC_PER_SEC, freq_Hz);
> =20
> +	/*
> +	 * Ensure CNV high time meets minimum requirement (20ns). The PWM
> +	 * hardware may round the duty cycle, so iterate until we get at least
> +	 * the minimum required high time.
> +	 */
> +	do {
> +		cnv_wf.duty_length_ns =3D target;
> +		ret =3D pwm_round_waveform_might_sleep(st->cnv_trigger, &cnv_wf);

[Severity: Medium]
The pwm_round_waveform_might_sleep() function can modify the passed cnv_wf
structure in place. Since the base period (cnv_wf.period_length_ns) is set
before the loop and not reset inside, does this cause the period to drift
across the iterations if the hardware constraints cause it to be repeatedly
rounded?

> +		if (ret)
> +			return ret;
> +		target +=3D 10;  /* Increment by PWM duty cycle period */
> +	} while (count++ < 100 && cnv_wf.duty_length_ns < LTC2378_TCNV_HIGH_NS);
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

[Severity: Medium]
The config pointer aliases st->offload_trigger_config. If this validation
fails, the function returns the error directly below without rolling back
the st->offload_trigger_config state. Could this leave the device in an
inconsistent state where the old st->cnv_wf configuration is paired with
a newly modified but rejected SPI trigger configuration upon the next
postenable?

Additionally, similar to the PWM loop above, spi_offload_trigger_validate()
modifies config in place. Does config->periodic.frequency_hz drift across
iterations since it is not reset inside the loop?

> +		if (ret)
> +			return ret;
> +		offload_offset_ns +=3D 10;
> +	} while (count++ < 100 && config->periodic.offset_ns < min_read_offset);

[Severity: High]
If the loop exhausts its 100 retries without meeting the minimum offset
requirement, won't it silently proceed here without returning an error?

Unlike the preceding PWM loop which explicitly checks the bounds afterward,
could this missing check cause silent data corruption if the SPI controller
ends up reading while the ADC is still converting?

> +
> +	st->cnv_wf =3D cnv_wf;
> +	st->cnv_Hz =3D DIV_ROUND_CLOSEST_ULL(HZ_PER_GHZ, cnv_wf.period_length_n=
s);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782397418.gi=
t.marcelo.schmitt@analog.com?part=3D3
