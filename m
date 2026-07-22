Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C49361972
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736465; cv=none; b=HWUTx7pG9RYVd1OC0LgVXZ34+nnwQ0FJKT40diQhCyZuo1h0fhXPS2Pb/QNOSypxscsStlmaAB6AeBcFkpPj81DclVU+kKOZWpRBbNb5VB1PUsIiXpMkto4JzH8vvO9+pfTFw7dVOvCzl+VH2QiqIPMr0VmdGVqIC1J1lI0TI3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736465; c=relaxed/simple;
	bh=Y0Vhp+1itZQ55ODF0sg5ZrzMBjcDcpogvB0txMWRwkM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cs1CDISu6zcJfVBFijaJwQxAazfIxUAclk9Lycac1l4MJ1PVfR9X90uX3sdSIU+zyvH3+wftV5mGuuHJQkXL2Ovy69O1X5ImlHXZYojF31OLp8Y7Q20O7rrJOthwggvdAOBj97i7iqZ/q5molc4BQU6H6vuDanxI4hJ8lO3pFLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuRF6f4D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuRF6f4D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156C31F000E9;
	Wed, 22 Jul 2026 16:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784736463;
	bh=fB85K2zzPZ+1ZnrqH2HUkpWJEEdJFonvhDb0KEuf5uE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JuRF6f4D+2GTuExGjh2pBd6RbqIPZWmrbaGUON1JjfhCG4b3nA8OtxeIHd3AoaHtI
	 jN+yPSjTM//VDc2uwvYlt5MRKhc4X/Uv3Zni8kS4RG+cy5JpkLYWUCYHr6M0inRjTs
	 vDpRtorPmg7zYXqedGlw54YOjpZKlRMd64MubfwD5S5WMmNkkfIA44+QytkNN/mymQ
	 3e7Xk1YKA/BdAGO7si9LFNwW3YlhN3E20cCQspkNt6qQZ+hTt6V/cUS+BXEPH6nco5
	 bqwj05H4MJ5qVycH5XeD6cz8h87++Ugww9RaUUN0elV0YDLd0+opJe/F3qx5N92ec+
	 yAXVSi7PbwdGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V19 5/9] iio: imu: inv_icm42607: Add PM support for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722153942.144387-6-macroalpha82@gmail.com>
References: <20260722153942.144387-1-macroalpha82@gmail.com>
 <20260722153942.144387-6-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 16:07:42 +0000
Message-Id: <20260722160743.156C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Manual sensor shutdown in `remove` races with devm-managed IIO dev=
ice unregistration, allowing hardware constraints to be violated.
--

--- Patch [5]: [PATCH V19 5/9] iio: imu: inv_icm42607: Add PM support for i=
cm42607 ---
commit b056ec561cd9320015e132187a3e7a3626b06b64
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add PM support for icm42607

Add power management support for the ICM42607 device driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c b/drivers/ii=
o/imu/inv_icm42607/inv_icm42607_i2c.c
> index f2b9067815b0e..4a8e4f7168038 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
[ ... ]
> @@ -56,6 +57,13 @@ static int inv_icm42607_probe(struct i2c_client *clien=
t)
>  	return inv_icm42607_core_probe(regmap, hw, inv_icm42607_i2c_bus_setup);
>  }
> =20
> +static void inv_icm42607_i2c_remove(struct i2c_client *client)
> +{
> +	struct inv_icm42607_state *st =3D dev_get_drvdata(&client->dev);
> +
> +	inv_icm42607_sensors_off(st);

[Severity: High]
Can this manual shutdown race with devm-managed IIO device unregistration?

Since the IIO devices are registered with devm-managed functions during pro=
be,
the devres release phase will execute after this remove callback returns. T=
his
means the IIO devices remain fully accessible to userspace during this peri=
od.

If a concurrent userspace read occurs just after inv_icm42607_sensors_off
finishes but before the devres release phase begins, could it re-acquire the
runtime PM reference via PM_RUNTIME_ACQUIRE_AUTOSUSPEND and turn the sensors
back on?

When the read completes and drops the PM reference, an autosuspend would be
queued. Then, devres runs, unregistering the IIO device and executing
pm_runtime_disable(), which would cancel the pending autosuspend and leave
the hardware permanently on.

Finally, the devm action for inv_icm42607_disable_vddio_reg() would cut pow=
er
to the chip while the sensors are still active, bypassing the mandatory 45ms
gyro power-down delay.

> +}
> +
>  static const struct i2c_device_id inv_icm42607_id[] =3D {
[ ... ]
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c b/drivers/ii=
o/imu/inv_icm42607/inv_icm42607_spi.c
> index eb04036a6712f..99e112c958a00 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
[ ... ]
> @@ -65,6 +66,13 @@ static int inv_icm42607_probe(struct spi_device *spi)
>  	return inv_icm42607_core_probe(regmap, hw, inv_icm42607_spi_bus_setup);
>  }
> =20
> +static void inv_icm42607_spi_remove(struct spi_device *spi)
> +{
> +	struct inv_icm42607_state *st =3D dev_get_drvdata(&spi->dev);
> +
> +	inv_icm42607_sensors_off(st);

[Severity: High]
Does this have the same race condition with devm-managed IIO device
unregistration as the I2C remove function?

> +}
> +
>  static const struct spi_device_id inv_icm42607_spi_id_table[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722153942.1443=
87-1-macroalpha82@gmail.com?part=3D5
