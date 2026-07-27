Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFDF3CB54B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 21:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785188963; cv=none; b=qHJLmJKO3FkciDmGwR+b5PnLbwdsDJ8qR8fyDppEodCfsUTnL5+unqT7bKSgBovAkgHGa4HYfZVs4Ix8QbxSbflF8oN9kSFJ/H9txAxDLry6UqJ0yJM30YY5v9nE31WCARHVB7rEywDaVxwlDuZ5GmJt1xyCG1/w+UufI1nlGLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785188963; c=relaxed/simple;
	bh=vjdtDLzEknZ4L9/IWOvL21izKW5l66LuaJ/zXHXcwNI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j+uNxFDy0pS0QbR5DywjFCgYPQqTbepZQjcSJPpj8IPgsGX/BvfGrzrfDaNK1cEvYcrlVL4T+vJnwKpHx93dnLBRZWHla46LqcLqUNh9D1N3uvyNwK/QmkpVzEgNYXE1tmBGSfHScWWN5awvvaw0qXNNwDyzkB9tN19LVY2TL9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e04nvmnz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e04nvmnz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD671F000E9;
	Mon, 27 Jul 2026 21:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785188961;
	bh=JdCyfdgc0mp4OnhpTviW7WwK5zmhzEF5CZ4U//zq0bk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e04nvmnze3Zc8vTmm7syHDiq8xe81ao7PBsC9zf/rQ8sQh7cNKekhrsGU5PFresrN
	 cnCaCpr9yu3u4+1FYmvVBKCefveFZiBHS0oG6fEEtOQdUiUN4OIBE95QCgD5NchVVv
	 188acWAeGV0694VfrUoeYnsFAgmY0ok0NWV3oBjgxaD4tlfijb7IGBZxnS2SSCbmYa
	 9wxONmrpQykAunG97/o05StlQ+VRUhKpXySeMFjr//7arbmvmDILEQdECIFhh321nH
	 hsJHCYGSKXklUcx9yAslDXVkDJCV4vtR0jxq+UX0k3ckQN+D+UpipogVUTgN5xA6mY
	 A7qjrTP2ow5eQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/6] iio: adc: ltc2378: Enable high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <e4eabdd9833e377c3fa1afd1ac089c5b37bb7928.1785186980.git.marcelo.schmitt@analog.com>
References: <cover.1785186980.git.marcelo.schmitt@analog.com>
 <e4eabdd9833e377c3fa1afd1ac089c5b37bb7928.1785186980.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:49:21 +0000
Message-Id: <20260727214921.8AD671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing bounds check on rounded PWM period leads to divide-by-zero=
 panic and ADC overclocking.
--

--- Patch [3]: [PATCH v9 3/6] iio: adc: ltc2378: Enable high-speed data cap=
ture ---
commit ebabc81c7c955467e478de14bdd64baea8b0e439
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Enable high-speed data capture

Make use of SPI transfer offloading to speed up data capture, enabling data
acquisition at faster sample rates (up to 2 MSPS).

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> index d161435fc3a31..48380a2d7dc66 100644
> --- a/drivers/iio/adc/ltc2378.c
> +++ b/drivers/iio/adc/ltc2378.c

[ ... ]

> +static int ltc2378_update_conversion_rate(struct ltc2378_state *st, int =
freq_Hz)
> +{
> +	struct spi_offload_trigger_config config =3D st->offload_trigger_config;
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
> +	/*
> +	 * Ensure CNV high time meets minimum requirement (20ns). The PWM
> +	 * hardware may round the duty cycle, so iterate until we get at least
> +	 * the minimum required high time (or reach a try count limit).
> +	 */
> +	count =3D 100;
> +	do {
> +		cnv_wf.duty_length_ns =3D target;
> +		ret =3D pwm_round_waveform_might_sleep(st->cnv_trigger, &cnv_wf);
> +		if (ret)
> +			return ret;
> +		target +=3D 10;  /* Increment by PWM duty cycle period */
> +	} while (count-- && cnv_wf.duty_length_ns < LTC2378_TCNV_HIGH_NS);
> +
> +	/* Check the minimum CNV high time is met */
> +	if (cnv_wf.duty_length_ns < LTC2378_TCNV_HIGH_NS)
> +		return -EDOM;
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
> +	config.periodic.frequency_hz =3D div_u64(HZ_PER_GHZ, offload_period_ns);

[Severity: High]
If the hardware PWM driver rounds the requested period up beyond 1e9 ns
(for example, if a 1 Hz frequency request yields 1,000,000,001 ns), does
this division evaluate to 0?

> +	min_read_offset =3D LTC2378_TBUSYLH_NS + st->info->tconv_ns + LTC2378_T=
DSDOBUSYL_NS;
> +	offload_offset_ns =3D min_read_offset;
> +	count =3D 100;
> +	do {
> +		config.periodic.offset_ns =3D offload_offset_ns;
> +		ret =3D spi_offload_trigger_validate(st->offload_trigger, &config);
> +		if (ret)
> +			return ret;
> +		offload_offset_ns +=3D 10;
> +	} while (count-- && config.periodic.offset_ns < min_read_offset);
> +
> +	/* Check the minimum CNV to SCLK delay is met */
> +	if (config.periodic.offset_ns < min_read_offset)
> +		return -EDOM;
> +
> +	/* Check the PWM periods remain the same */
> +	offload_period_ns =3D div64_u64(HZ_PER_GHZ, config.periodic.frequency_h=
z);

[Severity: High]
If frequency_hz evaluates to 0 above, does this cause a divide-by-zero
panic here?

Additionally, if the PWM driver rounds the period down when the user
requests max_sample_rate_Hz, could the actual frequency silently exceed
the ADC's hardware limits? Does the period need to be re-validated against
bounds after pwm_round_waveform_might_sleep() is called?

> +	if (cnv_wf.period_length_ns !=3D offload_period_ns)
> +		return -EDOM;
> +
> +	st->offload_trigger_config =3D config;
> +	st->cnv_wf =3D cnv_wf;
> +	st->cnv_Hz =3D DIV_ROUND_CLOSEST_ULL(HZ_PER_GHZ, cnv_wf.period_length_n=
s);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785186980.gi=
t.marcelo.schmitt@analog.com?part=3D3
