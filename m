Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDF739AD33
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 07:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615922; cv=none; b=D53h7P0zLA+pHIanL3J5SK7ObgF7WUPcL4GUBLCLS2PRIwLDOUyRbQAG63LAqnXyw6QG7jR2baXsa71sx9yCcbi6gCmWsmQs3wPdButMkwZ3QTuvzkUvOvkdssyXrp1XnWUf7OnIM5PAhI03qakAkNSoQMMq4ltMoXRFhc42W04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615922; c=relaxed/simple;
	bh=UaT0GkAd6KXGAlM5Gje2/4iRNCy15654k0mzZG8/7nY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=H9EPr/CQjHJypz3wVRXE4kmpC8fWAa7mfwF/1lWYvuOqlRSnIGUI3aL4Kvtg3gc271uFrMrLFG7GTBtEbD4IJkAdM7iedRKEVABZNhM5c460uVrDBnjPF6jULck9qXNwDnW5vM05HOWQaXxxs2m/TQ1FIp6/DmmTBh+Bq77ikpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfcIxYVC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfcIxYVC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A851F000FF;
	Sat, 10 Oct 2026 07:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791615921;
	bh=X7EbW7/Z+EHzfMSz/XHwbvrdNsffttKFTsUfodaKQMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nfcIxYVCTTQdoHlS0aHuVJqw+QZIA7e7+u0TKdX4rLUsPUmD2l/DPGshFNOYzabkV
	 SlQg/OZuwCK/X2a86zdS622OiNg45Y7UpGZO86uLnxXbrim7apYcm7F6vEUvxwNBDX
	 /K0ygEMg1h61RDbsw1c919ykZmyFKauegpEcYCthyvbm2/vhoY7p8SNswOqFlQvFBu
	 ApqNLCce16xtpiH0LrXtqwKutphvoQwiKr6IvlxD76QIjV89o5cZZuygLtt2M00dK+
	 GMT8Lvll5fwlSiaSpFbroEjNLr9u+E7uGFJPdtm1LspLnnB6QkGDdpmduw3HdR0ST9
	 UqVxciDptgVcA==
Message-ID: <sashiko-outbox-166289@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/10] iio: adc: add the ti-ads1262 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261010-ads126x-v5-3-49e331cb2fed@gmail.com>
References: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
 <20261010-ads126x-v5-3-49e331cb2fed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 07:05:20 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] iio: adc: ti-ads1262: lockdep splat on regmap debugfs access
- [Medium] iio: adc: ti-ads1262: stale DRDY on interrupted channel read cau=
ses corrupted data
--

commit 5387f009404bbcc26fabb71c5f2ad0b5ba669607
Author: Kurt Borja <kuurtb@gmail.com>

    iio: adc: add the ti-ads1262 driver
   =20
    Add the ti-ads1262 driver with initial support for the primary ADC
    (ADC1). The ADS1263 auxiliary ADC (ADC2) is handled by a separate driver
    and interoperability considerations were taken into account.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index 0000000000000..a54f78e88012c
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads1262.c
[ ... ]
> +static int ads1262_channel_read(struct iio_dev *indio_dev,
> +				const struct iio_chan_spec *spec, __be32 *val)
> +{
> +	struct ads1262 *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> +	if (IIO_DEV_ACQUIRE_FAILED(claim))
> +		return -EBUSY;
> +
> +	ret =3D ads1262_set_runmode(st, ADS1262_RUNMODE_PULSE);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ads1262_channel_enable(st, spec);
> +	if (ret)
> +		return ret;
> +
> +	reinit_completion(&st->drdy);
> +
> +	ret =3D ads1262_dev_start_one(st);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ads1262_wait_for_conversion(st);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If ads1262_wait_for_conversion() is interrupted by a signal and returns
-ERESTARTSYS, does this leave the conversion running in the background?

If so, a stale DRDY interrupt from that background conversion might fire on
the next read exactly in the window between reinit_completion() and the
hardware processing the new START1 command. This would cause the wait to
complete prematurely and return corrupted or stale data to user space.

Is there a way to drain the hardware state or cancel the conversion when
the wait is interrupted?

[ ... ]
> +static int ads1262_regmap_read(void *context, const void *reg_buf,
> +			       size_t reg_size, void *val_buf, size_t val_size)
> +{
> +	struct ads1262 *st =3D context;
> +	u8 tx[2];
> +
> +	lockdep_assert_held(&st->xfer_lock);

[Severity: Medium]
Will this lockdep assertion fail when the regmap is accessed via debugfs?

Although the driver manually acquires st->xfer_lock before invoking regmap
updates, it does not wire this lock into the regmap core's configuration
(via custom lock/unlock callbacks, or by setting disable_locking =3D true).

As a result, the regmap core manages its own internal mutex and debugfs
accesses will bypass st->xfer_lock, calling into the bus callbacks directly
and triggering this assertion.

> +
> +	/*
> +	 * The register read operation uses a two byte command header followed
> +	 * by the register data:
> +	 *
> +	 *	byte 0:   RREG opcode | register address
> +	 *	byte 1:   number of registers to transfer, minus one
> +	 *	byte 2..: register data
> +	 */
> +	tx[0] =3D *(u8 *)reg_buf | ADS1262_OPCODE_RREG;
> +	tx[1] =3D val_size - 1;
> +
> +	return spi_write_then_read(st->spi, tx, sizeof(tx), val_buf, val_size);
> +}
> +
> +static int ads1262_regmap_gather_write(void *context, const void *reg_bu=
f,
> +				       size_t reg_size, const void *val_buf,
> +				       size_t val_size)
> +{
> +	struct ads1262 *st =3D context;
> +	u8 tx[ADS1262_REGMAP_WRITE_SZ + 2];
> +
> +	lockdep_assert_held(&st->xfer_lock);

[Severity: Medium]
Similarly, will this assertion fail on regmap debugfs writes for the same
reasons?

> +
> +	/*
> +	 * The register write operation uses a two byte command header followed
> +	 * by the register data:
> +	 *
> +	 *	byte 0:   WREG opcode | register address
> +	 *	byte 1:   number of registers to transfer, minus one
> +	 *	byte 2..: register data
> +	 */
> +	tx[0] =3D *(u8 *)reg_buf | ADS1262_OPCODE_WREG;
> +	tx[1] =3D val_size - 1;
> +	memcpy(&tx[2], val_buf, val_size);
> +
> +	return spi_write_then_read(st->spi, tx, 2 + val_size, NULL, 0);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ads126x-v5=
-0-49e331cb2fed@gmail.com?part=3D3
