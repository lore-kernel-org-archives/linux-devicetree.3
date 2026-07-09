Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90E73ACA43
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 23:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783639486; cv=none; b=WG4TU84OhgXgJxEUNxSez6TU9JbMCyAUvze73SUvxAPLeE22bcKz9EsTzi2EOnTNeCvdxIoLuO+SVlVVfP3lQnwM1Kyz2+qp8ezd8kOegWdzDfHa6Mbyf9sJdtJ3M+3s6R17bVEI26lkhJNVwHMlPoQLyuLRv0Bc2Pu3+OO+eGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783639486; c=relaxed/simple;
	bh=TDfow234Y24Uv9VVaS5R1w/TbIdo/8wYGSDZ7Qohh14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AqzCVFeK3gobNBnQDJWvWnbzm/noKr9TKzM+tK5ZsKlZz2bAVAkBs+roELQ2djWhxJNxCTx9cHMWq0SHpJvvauChq6QkSY64vEM0Uy7414y9xNesvzaR302T/a8aUKiwfXJWeUyiCGhux9S75W3NmOmig+bYMkft7xr7hu0ZHDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqZaCLlj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqZaCLlj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40EE11F000E9;
	Thu,  9 Jul 2026 23:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783639484;
	bh=bWAUnOxH+vE2eri1zPU9+ocxlWjlHvuUPBABOTNL/cs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SqZaCLljKLz3qJkvggIcS0cJ36XTYwP59oIl13mHultYC7YsZ1ZW+ooPsUkm+OWCo
	 WR3nqsMS53Imwc62h1ce4fd2ZMB2wt2gv+tazg5Jd2pYNu3kNKChNfk2vjZ/qMX/9L
	 Tm+odqIvx7JQuofyzsHFj/JTJXXNuCm4s/tUC/Eu2KVtaAT0AlzcK+6Kp19tPiLzEL
	 AqsaJKAkPiMTxxeM+gRDbyX9vhR0cbaEiGI/jqM/yVSFCvODioIayyC3IRUj+t32NS
	 ZmN7/uY0Lv7ldhbqLcN09bY/Y5CkvLCCFkCJ2uyMmIv8L6ZtXLX8fXvHI8805SO9n9
	 bFy+OzEmRyBKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] iio: adc: ltc2378: Enable high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <4d4b5cac52b6f4a341d97bd41562a451e8e757f7.1783629101.git.marcelo.schmitt@analog.com>
References: <cover.1783629101.git.marcelo.schmitt@analog.com>
 <4d4b5cac52b6f4a341d97bd41562a451e8e757f7.1783629101.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 23:24:43 +0000
Message-Id: <20260709232444.40EE11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `st->offload_trigger_config` structure is partially mutated on=
 the error path, leading to out-of-sync hardware configuration.
- [Medium] Spurious failure in sample frequency configuration due to asymme=
tric period-to-frequency mathematical conversions.
- [Low] Missing MODULE_IMPORT_NS for the SPI_OFFLOAD namespace.
--

--- Patch [3]: [PATCH v6 3/4] iio: adc: ltc2378: Enable high-speed data cap=
ture ---
commit 3324fe468bed00820abda81953b558c8f8c9f5e4
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Enable high-speed data capture

This commit updates the ltc2378 ADC driver to support high-speed data
capture. It utilizes SPI transfer offloading to increase data acquisition
rates up to 2 MSPS.

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> index c9f8b19e0298c..10f1a0c4534be 100644
> --- a/drivers/iio/adc/ltc2378.c
> +++ b/drivers/iio/adc/ltc2378.c
[ ... ]
> @@ -260,7 +359,136 @@ static int ltc2378_read_raw(struct iio_dev *indio_d=
ev,
[ ... ]
> +static int ltc2378_update_conversion_rate(struct ltc2378_state *st, int =
freq_Hz)
> +{
> +	struct spi_offload_trigger_config *config =3D &st->offload_trigger_conf=
ig;
> +	unsigned int min_read_offset, offload_period_ns;
> +	struct pwm_waveform cnv_wf =3D { };
> +	u64 target =3D LTC2378_TCNV_HIGH_NS;
> +	unsigned int count;
> +	u64 offload_offset_ns;
> +	int ret;
> +
> +	if (freq_Hz =3D=3D 0)
> +		return -EINVAL;
> +
> +	if (!in_range(freq_Hz, 1, st->info->max_sample_rate_Hz))
> +		return -ERANGE;
> +
> +	/* Configure CNV PWM waveform */
> +	cnv_wf.period_length_ns =3D DIV_ROUND_CLOSEST(NSEC_PER_SEC, freq_Hz);
> +
[ ... ]
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
> +	count =3D 100;
> +	do {
> +		config->periodic.offset_ns =3D offload_offset_ns;
> +		ret =3D spi_offload_trigger_validate(st->offload_trigger, config);
> +		if (ret)
> +			return ret;

[Severity: High]
Does modifying config directly leave the device state out of sync if
validation fails?

Here config aliases to &st->offload_trigger_config, and its frequency_hz and
offset_ns fields are mutated. If spi_offload_trigger_validate() returns an
error, the function returns without restoring the old configuration.

However, st->cnv_wf is only updated at the end of the function. If the
buffer is later enabled, could this result in the PWM running with the old
frequency while the SPI offload engine tries to use the new, rejected
frequency?

> +		offload_offset_ns +=3D 10;
> +	} while (count-- && config->periodic.offset_ns < min_read_offset);
> +
> +	/* Check the minimum CNV to SCLK delay is met */
> +	if (config->periodic.offset_ns < min_read_offset)
> +		return -EDOM;
> +
> +	/* Check the PWM periods remain the same */
> +	offload_period_ns =3D div64_u64(HZ_PER_GHZ, config->periodic.frequency_=
hz);
> +	if (cnv_wf.period_length_ns !=3D offload_period_ns)
> +		return -EDOM;

[Severity: Medium]
Could this strict equality check unintentionally reject valid sample
frequencies due to integer math rounding?

If a requested frequency produces a period (cnv_wf.period_length_ns) that
does not perfectly divide 1,000,000,000, DIV_ROUND_UP() might round the
frequency up. Converting that frequency back to a period via div64_u64()
would yield a slightly smaller period.

For example, 133,333 Hz yields a 7500 ns period. 10^9 / 7500 =3D 133333.33,
which rounds up to 133334. Then 10^9 / 133334 =3D 7499 ns. Since 7500 !=3D =
7499,
this check would fail and return -EDOM.

> +
> +	st->cnv_wf =3D cnv_wf;
> +	st->cnv_Hz =3D DIV_ROUND_CLOSEST_ULL(HZ_PER_GHZ, cnv_wf.period_length_n=
s);
> +
> +	return 0;
> +}
[ ... ]
> @@ -412,3 +789,4 @@ module_spi_driver(ltc2378_driver);
>  MODULE_AUTHOR("Marcelo Schmitt <marcelo.schmitt@analog.com>");
>  MODULE_DESCRIPTION("Analog Devices LTC2378 ADC series driver");
>  MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("IIO_DMAENGINE_BUFFER");

[Severity: Low]
Does this driver also need to import the SPI_OFFLOAD namespace?

Since the driver uses symbols from the SPI offload core (like
devm_spi_offload_get), it seems it should also include
MODULE_IMPORT_NS("SPI_OFFLOAD"); to avoid a modpost warning during strict
module builds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783629101.gi=
t.marcelo.schmitt@analog.com?part=3D3
