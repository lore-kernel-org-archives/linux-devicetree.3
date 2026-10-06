Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B4B48E0C5
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 18:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311747; cv=none; b=HawLW8UmLuK1nobrNEAb4NGqoqj8f47BDjI+wCfs7jxnZd9MF6izEyvbEKePVTAG+Kjq3kzZx6FLXkeig197rEobAaGk/i7001xqqrWNriGZ5lA/ZZ2hzmOXnwsbZQJbFtMl1B07JwZjjmKuuEyFu6UfQa4+dlSL/cHkomSme6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311747; c=relaxed/simple;
	bh=HY1TkPjCGjFln6/JRqR+m9irsAQEXUGXCSsQKD0Hjak=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=L9PhorgaTwPQzU1ciJTSynsqobhGbn+THBG81CiZ/DtBKisCeXHXAY2GcURZgVzsMGYfudF2ygli6fVnFfVWHa/YOhPXhZ3N+yI1Vg3J05s3L6lGy8mLwyQiN7qygG3O8vpBt9nQliqhUT8nVJS5eKiWfSsVDexruq9FqL+71V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2nT0/i2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2nT0/i2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82FE1F00906;
	Tue,  6 Oct 2026 18:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791311746;
	bh=nNg7mbHkM70q7mP4MdVKdxmlRDg3AnucGnviHV67smU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j2nT0/i20/Mt9gLODNDdXSY7kbZnM0ndd22Py/rIAUGlW6Y0U86z56GF18rpGtfkc
	 912UD8qycjZSItKtxTfK5VOIsbGueHlRE0jYKjiUoFhlhwVRqlYvNNoby5epkCEgjS
	 cC1V2v38M4NFEz3BS3WOh5gKRAocaRfOxz+2AvXY8FaWzqVzEBGfHI4E7P5txrFx22
	 WTnBFy1D8qosQ/6qMnUj1aRheXtaSpgiHNuTKAuzvCYiYrjUfVitEELsSK9nlMd9JG
	 TABbSUeF+zPY9fIzacewF+U1sbmiBNgS5a5bYbk2BH5u6jv8W46IdWODfk7A8Wue7P
	 ha+8Qyd4oE9BA==
Message-ID: <sashiko-outbox-162356@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/13] iio: adc: ad4134: Support high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <14b9c627f24e8f2456a918d02f43a7aea382ccb5.1791309733.git.marcelo.schmitt@analog.com>
References: <cover.1791309733.git.marcelo.schmitt@analog.com>
 <14b9c627f24e8f2456a918d02f43a7aea382ccb5.1791309733.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 18:35:45 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ad4134: ODR PWM is left running on probe failure and device unbind
- [High] iio: adc: ad4134: debugfs_reg_access corrupts active SPI offload c=
apture
- [Low] ad4134: Incorrect macro HZ_PER_GHZ used for nanosecond time math
--

commit 646edf6c83770fad0c88592b752978f3561b3e9e
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
Subject: iio: adc: ad4134: Support high-speed data capture

This commit implements SPI transfer offloading for the AD4134 ADC. It
enables faster data acquisition at sample rates up to 1.496 MSPS.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index debc2ff027051..aa8abe5715c4b 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
[ ... ]
> @@ -517,6 +522,92 @@ ...
> +static int ad4134_update_conversion_rate(struct ad4134_state *st,
> +					 unsigned int freq_Hz)
> +{
[ ... ]
> +	/*
> +	 * Configure SPI offload PWM trigger.
> +	 * For gated DCLK, the minimum required time between ODR rising edge
[ ... ]
> +	 */
> +	offload_period_ns =3D odr_wf.period_length_ns;
> +	config.periodic.frequency_hz =3D DIV_ROUND_UP_ULL(HZ_PER_GHZ, offload_p=
eriod_ns);

[Severity: Low]
This isn't a bug, but should this use NSEC_PER_SEC instead of HZ_PER_GHZ?

While both macros are numerically identical, the calculation here is dividi=
ng
by a period in nanoseconds to get a frequency in Hertz, so NSEC_PER_SEC
seems to be the semantically correct unit scaling factor to use here.

[ ... ]
> @@ -606,6 +787,166 @@ ...
> +static const struct iio_info ad4134_offload_info =3D {
> +	.read_raw =3D ad4134_read_raw,
> +	.read_avail =3D ad4134_read_avail,
> +	.write_raw =3D ad4134_write_raw,
> +	.debugfs_reg_access =3D ad4134_debugfs_reg_access,

[Severity: High]
Can this corrupt an ongoing SPI offload capture?

It looks like ad4134_debugfs_reg_access() issues regmap_read() and
regmap_write() operations without calling iio_device_claim_direct_mode().
If a privileged user accesses direct_reg_access via debugfs while an
offload engine is actively streaming data, this could dynamically alter
the SPI controller mode to SPI_MODE_0 and shift the pin mux.

Since ad4134_release_reg_access() does not restore the SPI mode to
SPI_MODE_1, would this permanently corrupt the capture stream until it
is restarted?

> +};
[ ... ]
> +static int ad4134_offload_setup(struct iio_dev *indio_dev, struct ad4134=
_state *st)
> +{
> +	struct device *dev =3D &st->spi->dev;
> +	int ret;
> +
> +	ret =3D ad4134_pwm_get(st);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ad4134_offload_buffer_setup(indio_dev, st->spi);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Start with a sampling rate slower than 374 kSPS because that is the
> +	 * maximum rate supported with wideband filter (default on power up).
> +	 */
> +	st->odr_hz =3D 250 * HZ_PER_KHZ;
> +	ret =3D ad4134_update_conversion_rate(st, st->odr_hz);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to set sampling freq\n");

[Severity: High]
Will the ODR PWM be left running if probe fails later or the device is
unbound?

The call to ad4134_update_conversion_rate() actively starts the PWM
generation by calling pwm_set_waveform_might_sleep(). The PWM is acquired
via devm_pwm_get() earlier in ad4134_offload_setup(), so devres will call
pwm_put() during cleanup. However, pwm_put() only frees the software
resource and does not stop the physical PWM output.

Should there be a devm_add_action_or_reset() handler registered to
explicitly disable the PWM or set the duty cycle to zero on teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791309733.gi=
t.marcelo.schmitt@analog.com?part=3D12
