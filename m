Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6566E3C3F73
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899934; cv=none; b=Df/Wuv/dx85byfT66F+oh2MhX76yNgxIDNhUf6N3NfpsLxO+0Nnj9/k2t3SvNDFN5nEggCUQ0NqPWcBIxgcNOp27pnlqHUKKrZ2ozynq3Pj8eGMWs7aV3fClcFO2AdqbU6cglUGigE8rM+QMc3/B/7LzVXHktseyHUl1QG7c6wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899934; c=relaxed/simple;
	bh=1fGHVxHfar5c1RoQtk+SABuC9qUUa+9uH/FCid7McAg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VHgh+28n2J0R/iiYwk1CZAQjeEXORvhW3mOQEp4SyEEGSZiDlnUJwIqpHAV8Sajlm09Y3zgnf+2HUXsTDjxT4k1jlg7DHFVTP7hzSLrpSosVXMt/uOoKMgm/F5LrAmx5uiY3CpgGuHjdexANkqMINjx5nUBEif1P5lxmC0iCBxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSlJbP+7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CSlJbP+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05B11F00A3F;
	Fri, 28 Aug 2026 06:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787899932;
	bh=Ax7xGqUtVBzsbyHIDZXYzQYWViUlWcsy1Mhg0hteugY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CSlJbP+7Zwz73O15AeGbgLl/R9Fx6GJKEJsaHCvIVWadciNpBfAsdOy+urPQcDE6O
	 TaNacIHDr8g6y8WC+x9fb2Ps7p2iKbak+KLTxqP/dV4o955YgR3gYQcUTd7rSLRWqo
	 O4A/iwRBfV18j5YhNaTXVH8HcEZgS/EMQOj05ExlWqxGnWRMVeD150lqSkZ636G00m
	 LpCqAuClKVxd9P+MgguR6csw1ZaaH6gWnW3tl9FUUXxBHmnForlMOvmkCNdtrd/j2u
	 AinIg3I5O6/3ZXdEzXQLWw0W62trNupJF/zV+94YQd09blEPH/r6FxnmwRdTrGDW9l
	 5zX5eqbFpIz1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/10] iio: adc: add the ti-ads1262 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828-ads126x-v4-3-1dc27e9c0260@gmail.com>
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-3-1dc27e9c0260@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 06:52:11 +0000
Message-Id: <20260828065211.C05B11F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Regmap debugfs accesses bypass the driver's custom xfer_lock, tr=
iggering lockdep splats and risking SPI message corruption.
- [Medium] Missing device stop on interrupted conversion causes a race cond=
ition and data desynchronization.
- [Low] Incompatible pointer type passed to `regmap_read`.
--

commit 6093db1ff45e9e897720bc6b278550ffbef67e85
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: add the ti-ads1262 driver

Add the ti-ads1262 driver with initial support for the primary ADC (ADC1).
Various features such as accurate timeout delays, per-channel reference
sources, scale, offset, and diagnostics are intentionally left out for
future support.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> new file mode 100644
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
Does this error path leave the hardware running if the wait is interrupted?

If ads1262_wait_for_conversion() returns an error (like -ERESTARTSYS from
a signal), the driver exits immediately without stopping the hardware. If a
subsequent read calls reinit_completion(&st->drdy), but the abandoned
hardware conversion finishes and asserts the DRDY interrupt right after,
could the new read prematurely fetch stale data from the old conversion?

Should this path ensure the hardware is stopped and synchronized with the
interrupt handler on timeout or interrupt?

[ ... ]

> +static int ads1262_dev_configure(struct ads1262 *st)
> +{
> +	struct device *dev =3D &st->spi->dev;
> +	int id, ret;
> +
> +	ret =3D ads1262_dev_reset(st);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to reset device\n");
> +
> +	guard(mutex)(&st->xfer_lock);
> +
> +	ret =3D regmap_read(st->regmap, ADS1262_ID_REG, &id);

[Severity: Low]
Is the type of id correct here?

The regmap_read() API expects an unsigned int * for its third argument, but
id is declared as an int. Could this trigger a -Wpointer-sign compiler
warning?

[ ... ]

> +static const struct regmap_config ads1262_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.writeable_reg =3D ads1262_writeable_reg,
> +	.readable_reg =3D ads1262_readable_reg,
> +	.volatile_reg =3D ads1262_volatile_reg,
> +	.reg_defaults =3D ads1262_reg_defaults,
> +	.num_reg_defaults =3D ARRAY_SIZE(ads1262_reg_defaults),
> +	.max_register =3D ADS1262_ADC2FSC1_REG,
> +	.can_sleep =3D true,
> +	.cache_type =3D REGCACHE_MAPLE,
> +};

[ ... ]

> +static int ads1262_regmap_read(void *context, const void *reg_buf,
> +			       size_t reg_size, void *val_buf, size_t val_size)
> +{
> +	struct ads1262 *st =3D context;
> +	u8 tx[2];
> +
> +	lockdep_assert_held(&st->xfer_lock);

[Severity: Medium]
Will this lockdep assertion fail if the register is read via debugfs?

Because ads1262_regmap_config does not set disable_locking =3D true and does
not provide custom lock/unlock callbacks, regmap uses its own internal
mutex. When regmap's debugfs interface is read, the regmap core acquires
its internal mutex and calls the driver's ads1262_regmap_read() callback
without holding st->xfer_lock.

Could this bypass the xfer_lock, triggering the lockdep splat and allowing
debugfs SPI operations to interleave with driver-initiated SPI transactions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-ads126x-v4=
-0-1dc27e9c0260@gmail.com?part=3D3
