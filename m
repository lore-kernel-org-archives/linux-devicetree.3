Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039B43BE14A
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 19:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501751; cv=none; b=RTykTcVrZzVugyzm9jZZ4vfjHChlh+nHORLqDgLZLnCuvOeN6JB6+f0u5OJRAvTQmwC+Ufx7vXal57kDiKS7l0rs+9bw0kXtGX5yTM15E9jQrLoOTp9ELFjh+fAyAphuqf3SLTcn+e/TgKENZWTKvtLbrJjX+cFASDwJA8wKVM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501751; c=relaxed/simple;
	bh=Qw6JwciWEEnJo9lVHzWWt+SqgnV82j+RyiTt/WbP5ZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dz4fuResgAe/OBk421kKHO7HxBUWfpSAH2VxzUAZ50cRANGQK0IpIhr1rNQ1JBbNyB/PBbr6t/iUhuGDBSlNu1yKnUMqfpshUbkimHckzXSAOAzqo/BOjuNVLtc7tY4PhqFzqK4PYFT8YTAw9fn7gM5NhmwMDxfjQZeWhXG+guE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfmzHZmP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfmzHZmP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616321F00893;
	Tue, 15 Sep 2026 19:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789501749;
	bh=QaKoa5e4cEJ0eu+ooLAWLViOTTM2k/kNEkYNy2Sl0jE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dfmzHZmP0fySHvfxb2QBROHYiTjiKFlFtEyVWHcridioYtKflkF/b95t+Fm8SlWvo
	 N1nFuO3XxuW9kARofTAuhDf+6p+BVx8HPWRmz80NOlBHwm+dCmFYHx0nYc8s+X4Nq0
	 bXZWG11nmXWN01zRhw/53x/BNPDJvMECTPvMrOiXKefjslxo2xDYl8McSAa8Orx6Cq
	 RtffESbHXSWB7Qoj52ab2V4JZytiaYlEGl9t9er5b5IiNSCq1vGUlXug/nzVcDgocf
	 d99+8NZGA2o7LRobKI8WieJZ+RAxxwCUskjPOJl4brxl7BxVqu7hKsYbGCF4wEKLXO
	 pRV9tkD60HpYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/15] iio: adc: ad4134: Support SPI 4-wire mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <db5578ed11d5ad9f5abb9569d893065dbf79fb13.1789494473.git.marcelo.schmitt@analog.com>
References: <cover.1789494473.git.marcelo.schmitt@analog.com>
 <db5578ed11d5ad9f5abb9569d893065dbf79fb13.1789494473.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 19:49:08 +0000
Message-Id: <20260915194909.616321F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] ad4134: ignored mux_state_try_select() errors mask failures and ca=
use bus contention
- [High] ad4134: unconditional mux state deselection corrupts multiplexer s=
emaphores
- [Medium] ad4134: concurrent regmap accesses corrupt IIO buffer hardware s=
tate
- [Medium] ad4134: direct assignment to spi->mode clobbers devicetree SPI f=
lags
--

commit 9b8961eadc30a7239344b617959f3ffedd9a5a63
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Support SPI 4-wire mode
   =20
AD4134 devices can be wired in a few different ways. So far, only minimum
I/O mode was supported. While minimum I/O mode allows interfacing with
AD4134 with a reduced number of wires, that wiring configuration is not
optimal for high-throughput data acquisition.

Extend AD4134 support to enable interfacing in SPI 4-wire configuration.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 0b6843bf8a9e3..cc6bc325f6ee6 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c

[ ... ]

> @@ -230,6 +252,85 @@ static const struct regmap_access_table ad4134_regma=
p_wr_table =3D {
>  	.n_yes_ranges =3D ARRAY_SIZE(ad4134_regmap_wr_range),
>  };
> =20
> +/*
> + * This function controls a multiplexer OUTSIDE OF AD4134 SILICON.
> + * When AD4134 SDO and DOUT0 pins are multiplexed, this function changes=
 the
> + * multiplexer state to route SDO to the SPI controller. See AD4134 IIO
> + * documentation for details.
> + */
> +static int ad4134_set_register_access(struct ad4134_state *st)
> +{
> +	int ret;
> +
> +	guard(mutex)(&st->access_mode_lock);
> +
> +	st->spi->mode =3D SPI_MODE_0;

[Severity: Medium]
Do these direct assignments clear all other SPI flags populated by the SPI
core from devicetree properties, such as SPI_CS_HIGH, SPI_LSB_FIRST, or
SPI_3WIRE?

Should this instead use SPI_MODE_X_MASK to safely update only the CPOL/CPHA
bits?

> +	ret =3D spi_setup(st->spi);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D mux_state_deselect(st->mux_st[AD4134_DOUT0_INPUT]);

[Severity: High]
Does this unconditionally deselect the DOUT0 multiplexer state without
verifying it is currently selected?

This could call up() on the semaphore and cause a semaphore count imbalance.

> +	if (ret)
> +		dev_err(&st->spi->dev, "error on DOUT0 deselect: %d\n", ret);
> +
> +	/*
> +	 * Try to update the multiplexer state to route SDO to the SPI
> +	 * controller. If the SDO mux state is BUSY (i.e. locked), that means
> +	 * the desired state is already selected and we should not block here.
> +	 */
> +	ret =3D mux_state_try_select(st->mux_st[AD4134_SDO_INPUT]);
> +	if (ret && ret !=3D -EBUSY)
> +		return ret;

[Severity: High]
Is it safe to explicitly ignore the -EBUSY error here?

If the lock is actually held by another driver sharing the multiplexer,
proceeding could result in doing SPI transfers on a misrouted bus, leading
to contention and corrupted data transfers.

> +
> +	return 0;
> +}
> +
> +/*
> + * This function controls a multiplexer OUTSIDE OF AD4134 SILICON.
> + * When AD4134 SDO and DOUT0 pins are multiplexed, this function changes=
 the
> + * multiplexer state to route DOUT0 to the SPI controller. On failure, f=
all
> + * back to routing SDO to the controller and return an errno. See AD4134=
 IIO
> + * documentation for details.
> + */
> +static int ad4134_set_sample_access(struct ad4134_state *st)
> +{
> +	struct device *dev =3D &st->spi->dev;
> +	int mux_state_ret, ret;
> +
> +	guard(mutex)(&st->access_mode_lock);
> +
> +	ret =3D mux_state_deselect(st->mux_st[AD4134_SDO_INPUT]);

[Severity: High]
Is it safe to manually unlock the devres-managed mux state unconditionally
here?

The SDO mux is acquired using devm_mux_state_get_selected() during probe,
which registers a devm cleanup to deselect it on unbind. Manually unlocking
it could risk a semaphore imbalance when devm cleanup runs.

> +	if (ret)
> +		dev_err(&st->spi->dev, "error on SDO deselect: %d\n", ret);
> +
> +	ret =3D mux_state_try_select(st->mux_st[AD4134_DOUT0_INPUT]);
> +	if (ret) {
> +		dev_err(&st->spi->dev, "error on DOUT0 select: %d\n", ret);
> +		return mux_state_select(st->mux_st[AD4134_SDO_INPUT]);
> +	}

[Severity: High]
If DOUT0 selection fails, does returning the success code of the recovery
function (mux_state_select) swallow the original error code?

This might allow IIO buffer enablement to succeed while the hardware is
incorrectly routed to SDO, resulting in garbage data.

> +
> +	/*
> +	 * Data output on the DOUT lines is sampled on the falling edge
> +	 * (SPI mode 1).
> +	 */
> +	st->spi->mode =3D SPI_MODE_1;

[Severity: Medium]
Similar to register access mode, does this direct assignment clear all other
SPI flags, potentially breaking SPI communication on platforms requiring ex=
tra
SPI flags?

> +	ret =3D spi_setup(st->spi);

[ ... ]

> @@ -333,9 +434,24 @@ static int ad4134_register_read(struct ad4134_state =
*st, unsigned int reg,
>  static int ad4134_reg_read(void *context, unsigned int reg, unsigned int=
 *val)
>  {
>  	struct ad4134_state *st =3D context;
> +	int ret, access_ret;
> +
> +	if (reg >=3D AD4134_CH_VREG(0)) {
> +		if (st->spi_mode =3D=3D AD4134_SPI_MODE_NO_CS)
> +			return ad4134_data_read(st, reg, val);
> +
> +		ret =3D ad4134_set_sample_access(st);
> +		if (ret)
> +			return ret;
> =20
> -	if (reg >=3D AD4134_CH_VREG(0))
> -		return ad4134_data_read(st, reg, val);
> +		ret =3D ad4134_data_read(st, reg, val);
> +
> +		access_ret =3D ad4134_set_register_access(st);

[Severity: Medium]
If a user reads a register via debugfs while the IIO buffer is active, does
this unconditionally revert the SPI and multiplexer state to register access
mode?

This could clobber the active IIO buffer's expected hardware state
(SPI_MODE_1 and DOUT0), causing subsequent trigger handler reads to fail
or receive garbage.

Also, for standard registers, does ad4134_reg_read() fall through to
ad4134_register_read(), where SPI transfers are initiated without holding
access_mode_lock and without verifying the hardware is in register access
mode?

> +		if (access_ret)
> +			dev_err(&st->spi->dev, "access mode error: %d\n", access_ret);
> +
> +		return ret;
> +	}
> =20
>  	return ad4134_register_read(st, reg, val);
>  }

[ ... ]

> @@ -586,15 +717,68 @@ static int ad4134_probe(struct spi_device *spi)

[ ... ]

> +	} else {
> +		/*
> +		 * This controls a multiplexer OUTSIDE OF AD4134 SILICON.
> +		 * See AD4134 IIO documentation for details.
> +		 */
> +		st->mux_st[AD4134_SDO_INPUT] =3D devm_mux_state_get_selected(dev, "reg=
_access");

[Severity: High]
Does this lock the mux control and tie its unlock to driver unbind, making =
the
manual unlock seen in ad4134_set_sample_access() unsafe?

> +		if (IS_ERR(st->mux_st[AD4134_SDO_INPUT]))
> +			return dev_err_probe(dev, PTR_ERR(st->mux_st[AD4134_SDO_INPUT]),
> +					     "failed to get reg_access mux-state\n");
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789494473.gi=
t.marcelo.schmitt@analog.com?part=3D11
