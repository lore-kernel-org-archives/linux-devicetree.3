Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE1D392838
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784580010; cv=none; b=r/nU8XqLJA8h9Y0hjiwOxx0dYV6EMNCP76d0HoqRF5q9ITC4BxQ4O2tYkCSs82ePzonLmsdqzhS/k3CIBHez8QcnYEBzR3W22cLvO8E65J6zfW0cYtf/KkcpJfCJTv+/m6DDwym3JJzBnu8GGEiKNcSG4eA1V7SEatVpBUGMKYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784580010; c=relaxed/simple;
	bh=39ne8Plk7UoVgaN9iVwCW9pkV2WpTSJO7YJZX56YtIE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YKYr5ZdQWGTseTfyw+imkB6GEzGMKtWhIjRJ0rrqIldJq/U25+1uxuaP2IhYr4lh2QMs6pijQrF4JFFSYBHoKPWZoFRnh77gI4mC7MnrKJDS0mhTEW3haAR/XSwLBmuj6V0zN+mxtX3uXJHzatHQzodNgaO7oF8nMe1ppEuPZsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WneeTbiu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WneeTbiu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3197C1F00A3A;
	Mon, 20 Jul 2026 20:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784580008;
	bh=4Uuo6IdIh3JfZClIkA1elsTg14OklVqBQ5GPBXH99qs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WneeTbiuEA7Bvv6sLcNeJuLKa/BMQMHQ9e0kt/ZhaVvLFcIZYU/dRmh6Wfn8NFha/
	 tuo5fTQUzmYUDVxJXhNVG+3D6oDT4zTLt+2zptADxrYwXfqXbMk3yuQTAER1EFgCzA
	 wsSvEpnOJgQ9IjvovLAfoUShR2zqFN/asEQyOSQvgg/ThO0sXwuLzSqZzqrRCOX2rZ
	 AtLywHUb6vwFzli/XqpOljEXTbjq8+/SR0tbcT7tJbwSjCVVF1uTCJue+altShcnU/
	 PRzOCttX0tjOMopb9KkvLGkq7IPbWQZtpBBiOpc3rkA3Gvg3UL6iEFiWRPjoXBXb8t
	 eWxMZVAmA3cSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V18 5/9] iio: imu: inv_icm42607: Add PM support for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720202343.70138-6-macroalpha82@gmail.com>
References: <20260720202343.70138-1-macroalpha82@gmail.com>
 <20260720202343.70138-6-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 20:40:07 +0000
Message-Id: <20260720204008.3197C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Calling `pm_runtime_force_suspend()` in the `.remove()` callback=
s causes an unbalanced runtime PM `disable_depth` due to conflict with `dev=
m_pm_runtime_set_active_enabled()`, breaking power management on driver reb=
ind.
--

--- Patch [5]: [PATCH V18 5/9] iio: imu: inv_icm42607: Add PM support for i=
cm42607 ---
commit ab55ef85474a1fe3f2d09669c982ebc220a804ca
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add PM support for icm42607

Add power management support for the ICM42607 device driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 6ec1d730017e2..c127ea0a94c4c 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> @@ -275,10 +378,75 @@ int inv_icm42607_core_probe(struct regmap *regmap,
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D devm_pm_runtime_set_active_enabled(dev);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(dev, INV_ICM42607_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +
>  	return 0;
>  }

[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c b/drivers/ii=
o/imu/inv_icm42607/inv_icm42607_i2c.c
> index f2b9067815b0e..04ad372917832 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c

[ ... ]

> @@ -56,6 +57,11 @@ static int inv_icm42607_probe(struct i2c_client *clien=
t)
>  	return inv_icm42607_core_probe(regmap, hw, inv_icm42607_i2c_bus_setup);
>  }
> =20
> +static void inv_icm42607_i2c_remove(struct i2c_client *client)
> +{
> +	pm_runtime_force_suspend(&client->dev);
> +}

[Severity: Medium]
Does calling pm_runtime_force_suspend() here cause an unbalanced
disable_depth counter?

Because devm_pm_runtime_set_active_enabled() is called during probe in
inv_icm42607_core_probe(), devres will automatically call
pm_runtime_disable() on device removal.

Since pm_runtime_force_suspend() also disables runtime PM internally,
it seems this results in the disable_depth counter being incremented twice.
If the driver is unbound and rebound later, will it fail to ever re-enable
runtime PM because the disable depth remains strictly greater than zero?

[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c b/drivers/ii=
o/imu/inv_icm42607/inv_icm42607_spi.c
> index eb04036a6712f..995393dce9429 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c

[ ... ]

> @@ -65,6 +66,11 @@ static int inv_icm42607_probe(struct spi_device *spi)
>  	return inv_icm42607_core_probe(regmap, hw, inv_icm42607_spi_bus_setup);
>  }
> =20
> +static void inv_icm42607_spi_remove(struct spi_device *spi)
> +{
> +	pm_runtime_force_suspend(&spi->dev);
> +}

[Severity: Medium]
Could this run into the same double-disable issue as the I2C remove function
due to the devres pm_runtime_disable() action?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720202343.7013=
8-1-macroalpha82@gmail.com?part=3D5
