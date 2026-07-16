Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4039933F58E
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237093; cv=none; b=GCmnqqtseL2YFwttB9xsgZyLwnKCA+TNPF1yIgZbulZRc8R45zak0eyt4/SzzNd1hltou0JNWZIZd3gYyFgRa/Oeu7iox8aT8x48IgUqvlAFb0bLqeTwRx6osQOvfLAlV0rZfrW9WgLLqVv0itR4+AJgUkNRBTXXY3K0rOp363o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237093; c=relaxed/simple;
	bh=KctlqJ2ow1FwqXKpQMtlJ8onQNYETa5+9MgBfTCTxoI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ULZ4MPkiH70YUy5790lAmZR3brrUxC2oXbdyaEIbpV0NZCTZPFaEzwUQU10RVL5NSdX95gcL1/dEk/EMvyC4ML9GLa+dlltlWbSbt6SmT0wqbYwIZJsYQMImCq6MNG5FUkNSSlCVtQvjA3O3KVImJUbYFCHfK5RzVYYIMP6vybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EV8mqn7k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EV8mqn7k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923951F000E9;
	Thu, 16 Jul 2026 21:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784237091;
	bh=uKh1gTIRAuT1MzAOysMWDX46jNBdHFXKk1QOR6QiI+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EV8mqn7k2NHPTIihHO6FehHGu+xbc9mslyubIjmigkGjfef8/PSMgLlkswCnbnSDD
	 sgXYdbV6/5GySfijMuMBzrPsz3ho/WEO3rdX+hP8tyQj8W7igpqz73vFvaptd4GiEL
	 aivG32QN2/qNdPqUtFBxN4yovDposAJD1FlkVrwlP4BSAmiNSX0b/00UVv+f30LhQ+
	 QcOb0j4J2N7TALeIPEHR1ZPeDFJGwx6ZmNlPON/jYc4W+XZhiCXlprfF/lf4NmIlb4
	 WxYjEKuY3SQOFU4WFJ40x1qsn5t0WzlMcC+eHDuiEFi6uAv8t7brUPkGFHSzyDz8bV
	 175gEIl0AZpbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/4] iio: adc: ltc2378: Enable high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <564b975c2c62d28ee6733f86bd5632c41a7c80e4.1784235595.git.marcelo.schmitt@analog.com>
References: <cover.1784235595.git.marcelo.schmitt@analog.com>
 <564b975c2c62d28ee6733f86bd5632c41a7c80e4.1784235595.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 21:24:51 +0000
Message-Id: <20260716212451.923951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Integer divide-by-zero leading to kernel panic in `ltc2378_update_=
conversion_rate` when a sampling frequency of 1 Hz is requested and the PWM=
 driver rounds the period length above 1 second.
--

--- Patch [3]: [PATCH v7 3/4] iio: adc: ltc2378: Enable high-speed data cap=
ture ---
commit ef54f2c79f2cac1649922032814adc7fcc5f9684
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
Subject: iio: adc: ltc2378: Enable high-speed data capture

This commit enables high-speed data capture for the ltc2378 ADC driver by
utilizing SPI transfer offloading. It allows data acquisition at faster sam=
ple
rates up to 2 MSPS.

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> index 5600c820c7f45..7d29f021cb7b4 100644
> --- a/drivers/iio/adc/ltc2378.c
> +++ b/drivers/iio/adc/ltc2378.c

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
> +	config.periodic.frequency_hz =3D div_u64(HZ_PER_GHZ, offload_period_ns);
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
Could this result in a kernel panic due to an integer division by zero?

If a user writes 1 to the IIO in_voltage_sampling_frequency sysfs attribute,
ltc2378_update_conversion_rate() is called with freq_Hz =3D 1, and the init=
ial
requested PWM period is calculated as 1,000,000,000 ns.

If the underlying hardware PWM driver rounds the period slightly upwards
(e.g., to 1,000,000,001 ns) during pwm_round_waveform_might_sleep() due to
clock granularity, offload_period_ns will exceed HZ_PER_GHZ.

This causes config.periodic.frequency_hz =3D div_u64(HZ_PER_GHZ, offload_pe=
riod_ns)
to evaluate to 0.

When div64_u64(HZ_PER_GHZ, config.periodic.frequency_hz) is subsequently ca=
lled,
it divides by zero.

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784235595.gi=
t.marcelo.schmitt@analog.com?part=3D3
