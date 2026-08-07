Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7122F90E0
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112364; cv=none; b=F1tE7xNb5qgofx4enPxkNL3SyCX4YYBBQbbNIrOyR5byQh4v9dzWiO02AbQypu0qlRrVnckVfp2YQRTXyw22JiC4f9uTIYHlAN94+jv1WupMzIVgnTdDQCLAwPMRV31WBdpG12jwWx8Q+dC4MtfxEfGTCIjubxePo/vyy3rmdo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112364; c=relaxed/simple;
	bh=filvxdaJ4pV3qEwPNOkt/PyQWKEaG6ABwGHLibDgW+M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YOQ8Vou0W9LklZQYRcbeT+h3HnBW8kIk7n2/nAh7K3bVDxGal1P5uLMoIGCkVRoYfeivvtNqG0y6lt4sMxugOFiEd6yMwVLSUJowwevUT4At1iUUMZSogSqJ82tEM7xHkBG2+svnzDHCjC50GsKrTik0O2nihAdbtVUIHy4FQs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMIMZa7C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMIMZa7C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADFE1F000E9;
	Fri,  7 Aug 2026 14:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786112363;
	bh=QEFEBLEjlZa0tkdokSfJeXEysk1eOJlwLDpQcWtfU7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CMIMZa7CsdWYDIZvM+5rO8WDzwy6dzIxPa/RB/7kvrxLMoJ5cR7WK+0c0XW7MgXcP
	 eGgXlqelXfqjc42vutHaIHM91Xz+SsDgrikM5KdrXLdgIYOH3O986peF7F1PECSiLJ
	 HbUX/ItYbmFn40aAEmuPWaGhUhC+Zo5lBl9fhSldf9OdUdV4udSD7QOW0NpTy1CB/3
	 rppsGGeDip5pGi8rs/76mwv8hbKHcSDjHL8GGh7bigu3u3zpjEG96OLz9TYgyfbwvG
	 rXBZIRSuxt2Srjs1QuBjKzw859qiPG+izzj0YjTkG9CoB8EC6CxW7zPkuMKJjJqla8
	 t3kabfaxzm4YQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] iio: light: add support for veml6031x00 ALS
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807-veml6031x00-v5-2-e60876fb3640@gmail.com>
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
 <20260807-veml6031x00-v5-2-e60876fb3640@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 14:19:22 +0000
Message-Id: <20260807141922.EADFE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Mixing `devm_pm_runtime_get_noresume()` with a manual `pm_runtime_=
put_autosuspend()` in `probe` causes a PM usage counter underflow on device=
 unbind or probe failure.
- [High] An unprotected read-modify-write in `veml6031x00_set_power_state()=
` races with sysfs configuration changes, causing lost user configuration, =
and a lock inversion prevents a simple fix.
--

--- Patch [2]: [PATCH v5 2/4] iio: light: add support for veml6031x00 ALS s=
eries ---
commit 2cb7c39d884f4873be61de5deba3865dbd24f394
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: add support for veml6031x00 ALS series

These sensors provide two light channels (ALS and IR), I2C communication
and a multiplexed interrupt line to signal data ready and configurable
threshold alarms.

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> new file mode 100644
> index 0000000000000..30cccda51ca08
> --- /dev/null
> +++ b/drivers/iio/light/veml6031x00.c

[ ... ]

> +static int veml6031x00_set_power_state(struct veml6031x00_data *data, bo=
ol on)
> +{
> +	u8 conf[2];
> +	int ret;
> +
> +	ret =3D regmap_bulk_read(data->regmap, VEML6031X00_REG_CONF0,
> +			       conf, sizeof(conf));
> +	if (ret)
> +		return ret;
> +
> +	if (on) {
> +		conf[0] &=3D ~VEML6031X00_CONF0_SD;
> +		conf[1] &=3D ~VEML6031X00_CONF1_IR_SD;
> +	} else {
> +		conf[0] |=3D VEML6031X00_CONF0_SD;
> +		conf[1] |=3D VEML6031X00_CONF1_IR_SD;
> +	}
> +
> +	return regmap_bulk_write(data->regmap, VEML6031X00_REG_CONF0,
> +				 conf, sizeof(conf));
> +}

[Severity: High]
Does this unprotected read-modify-write race with concurrent sysfs configur=
ation
updates?

Because CONF0 and CONF1 are in the volatile ranges, regmap does not protect
them with its cache lock. Concurrent regmap_field_write() calls triggered by
veml6031x00_write_raw() could change the gain or integration time between t=
he
bulk_read and bulk_write here, causing the user configuration to be silently
overwritten and lost.

Additionally, could acquiring the scale_lock here to fix the race cause a
deadlock?=20

Looking at veml6031x00_single_read(), it holds the scale_lock before acquir=
ing
the PM runtime reference:

veml6031x00_single_read()
    guard(mutex)(&data->scale_lock);
    ...
    PM_RUNTIME_ACQUIRE_AUTOSUSPEND(...)

If the autosuspend acquisition triggers veml6031x00_runtime_resume() which
then calls veml6031x00_set_power_state(), attempting to take scale_lock aga=
in
would deadlock.

[ ... ]

> +static int veml6031x00_probe(struct i2c_client *i2c)
> +{

[ ... ]

> +	ret =3D devm_pm_runtime_set_active_enabled(&i2c->dev);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret, "Failed to enable runtime PM\n");
> +
> +	ret =3D devm_pm_runtime_get_noresume(&i2c->dev);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret, "Failed to get runtime PM\n");
> +
> +	ret =3D veml6031x00_validate_part_id(data);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D veml6031x00_hw_init(iio);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_put_autosuspend(&i2c->dev);

[Severity: High]
Will mixing devm_pm_runtime_get_noresume() with a manual
pm_runtime_put_autosuspend() here cause a PM usage counter underflow?

The devm_pm_runtime_get_noresume() call increments the usage counter and
registers a devres action to decrement it on unbind or probe failure.

However, the manual pm_runtime_put_autosuspend() here drops the counter back
to zero.=20

When the driver is subsequently unbound, the devres action will execute and
decrement the counter again to -1, which could corrupt the runtime PM state
machine and prevent the device or its parent from suspending.

> +
> +	ret =3D devm_iio_device_register(&i2c->dev, iio);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret, "Failed to register iio device\n"=
);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-veml6031x0=
0-v5-0-e60876fb3640@gmail.com?part=3D2
