Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A5F1F12E0
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780247248; cv=none; b=SoFn7dIg588C7l2ZAlw1eM8gOOnDj49/UBuPlSVtVt/qvf5gtpQb6HJDS/xsV5rBxycUT3qKPX6W63Z9uLNyHTbGJuP3yjrmIY8b0mhGcPru84ELOWaKHEIVzNoN02fd8WKHc9YPO9fvOJXD2veN7bHmtA+ZiRigf4ambOSiNZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780247248; c=relaxed/simple;
	bh=0DAYCnDSTPWaqVRGOtAvtv+JoDpsFjltzw2SiSM7V/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M356UsVimVWvgt5fICCN8yk1W5ILaQbvtc513MJcFh9+ATaOwCXPdUvrRrNMCBJ3aTHzBTOLHvhhrnd8zbDdBH7Zgs1KxSZ/9gRRSy8g7B8oyfdORb/74FKZrEfuLjlGK5o680cK+RUtH2gP91qvqeB3Ej8+AGovF2YvYBsyeIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MH0gk3HH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MH0gk3HH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0DD1F00893;
	Sun, 31 May 2026 17:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780247247;
	bh=1Fly8bHytp9C6B+sbpQ3GAP7i7xcg/NR/O//JoI4SB4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MH0gk3HH2cabjgwWQrIVfDpEwxduQy0zzA5n0BQ7szmDQFqvL+KwNWjC90tUitO7b
	 9/fu67myZ4awI8FFtdkBlvXtYX6gycK8jsVID/JU6/q0dp2NBE96WfChHnAtbok8DD
	 ZnxDUr12JZdWDUQ7UaUzX/kufp7d5kvow81BciebX1E/R2Wu+gynzrlYFyNJD7spsS
	 mKlRpNFpJaA0QInAOR7EvZRKZ4XRdH9p/RboR44WGsxgSg3qCPFjqs5PYpYC3wy+UQ
	 rnd35DDtspTR081S3dHmjoeVbEoplWw727BiGMA5hbc+NmOs6LpIFlG+YHztJdZkw3
	 YD0gju9Gfhq1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] iio: light: veml3328: add support for new device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260531-veml3328-v4-2-f9b65d71d917@gmail.com>
References: <20260531-veml3328-v4-2-f9b65d71d917@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 17:07:26 +0000
Message-Id: <20260531170726.CC0DD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The runtime PM autosuspend timer is not started during probe, pr=
eventing the device from entering a low-power state until its first userspa=
ce access.
- [Medium] SCALE attributes are incorrectly exported as `shared_by_type` in=
stead of `shared_by_all` for a global hardware setting.
--

commit 3c7cc50c08671c37a310d6d5f49f51c1dd186420
Author: Joshua Crofts <joshua.crofts1@gmail.com>

    iio: light: veml3328: add support for new device
   =20
    Add support for the Vishay VEML3328 RGB/IR light sensor communicating
    via I2C (SMBus compatible). Also add a new entry for said driver into
    Kconfig and Makefile.

> diff --git a/drivers/iio/light/veml3328.c b/drivers/iio/light/veml3328.c
> new file mode 100644
> index 0000000000000..7ff1753925c47
> --- /dev/null
> +++ b/drivers/iio/light/veml3328.c
[ ... ]
> +#define VEML3328_CHAN_SPEC(_color, _addr) { \
> +	.type =3D IIO_INTENSITY, \
> +	.modified =3D 1, \
> +	.channel2 =3D IIO_MOD_LIGHT_##_color, \
> +	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW), \
> +	.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE), \
> +	.info_mask_shared_by_type_available =3D BIT(IIO_CHAN_INFO_SCALE), \
> +	.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_INT_TIME), \
> +	.info_mask_shared_by_all_available =3D BIT(IIO_CHAN_INFO_INT_TIME), \
> +	.address =3D _addr, \
> +}
> +
> +static const struct iio_chan_spec veml3328_channels[] =3D {
> +	{
> +		.type =3D IIO_LIGHT,
> +
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
> +		.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),
> +		.info_mask_shared_by_type_available =3D BIT(IIO_CHAN_INFO_SCALE),

[Severity: Medium]
Will this export two separate sysfs scale attributes that secretly control =
the
same global hardware register?

Since the sensor gain is controlled globally in VEML3328_REG_CONF, and the
driver registers both IIO_LIGHT and IIO_INTENSITY channels, using
info_mask_shared_by_type will create separate in_light_scale and
in_intensity_scale attributes. Modifying one will alter the hardware gain f=
or
the other, which might break userspace expectations.=20

Should this use info_mask_shared_by_all instead, similar to how INT_TIME is
configured?

> +		.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_INT_TIME),
> +		.info_mask_shared_by_all_available =3D BIT(IIO_CHAN_INFO_INT_TIME),
> +		.address =3D VEML3328_REG_DATA_G,
> +	},
[ ... ]
> +	indio_dev->name =3D "veml3328";
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +	indio_dev->info =3D &veml3328_info;
> +	indio_dev->channels =3D veml3328_channels;
> +	indio_dev->num_channels =3D ARRAY_SIZE(veml3328_channels);
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 2000);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

[Severity: Medium]
Will the device fail to enter autosuspend after probe?

The driver powers up the sensor earlier in veml3328_probe() and sets the PM
state to RPM_ACTIVE here, but it never increments the PM usage count or que=
ues
an idle check. As a result, the PM core won't start the autosuspend timer
when pm_runtime_enable() is called.

Could this leave the sensor fully powered indefinitely until a userspace re=
ad
finally acquires and releases a PM reference? Should there be a call to
pm_runtime_mark_last_busy() and pm_runtime_put_autosuspend() at the end of
probe, paired with an earlier pm_runtime_get_noresume()?

> +
> +static int veml3328_runtime_suspend(struct device *dev)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531-veml3328-v=
4-0-f9b65d71d917@gmail.com?part=3D2
