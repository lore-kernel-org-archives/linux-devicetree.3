Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7F7241C8C
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 04:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780114425; cv=none; b=NM1G8Qa1Sn/B9NuoTNVC2/4isYzejpAN843v5Dstk2g6Wji3K0a1/aJJLl3Yk5buNdoKV+1WWkzCkNqBiAsKL4wC4Wj0HnLfSfFPQLN/1AM6ELKV2VARq+aTUcU4skNWeq63p3gJPzPDTLlVyzeqW5XgGFb7GEXvQm52KjJwn7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780114425; c=relaxed/simple;
	bh=eW7NYmxgzfV+iMS6GRg0s5DzjXijfyWcI3aNUV5bVsE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u1aUc3j3uxVnbN5x+p0KVDvMoKbvY9hTkwnDeoA4AfZDKn5VLG3IasA0oVZKkl1KcEvrZsOgsgvj7S0c48CmSXOECHzrd4DdAcj2fUiwPwi7FMtyjMF8qD7oKrQegDparjGQU6C0XhNiNtl9XKb3DJ9hLl0f49RgfJo73QK7tLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTtVqIjY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTtVqIjY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8B61F00893;
	Sat, 30 May 2026 04:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780114424;
	bh=xNLvl+YcSXorUpYBhwiLJYGGYgCAw44CWzzs1AYElsg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bTtVqIjYxk9zWwKpcCfv1DljjWYc460kZZncVZqkkkPs3PAa4E9xUvMCNPLynQCtJ
	 4FXHXdR4XkwW2HaCsMO2bsbaerKPGIa4/JG+EfBg504fROa4IwM+WqkvoyUDgfBal9
	 x7pPOcP51dWNIohVaLKJAFujrqdrKAlfpjfhCuNxCLp2qNAlllYyI8msObU74otYBf
	 +75vi2Vz7vC4bDDBVGoSm4eePy5i9v7LkmYM1+BK0vMd0gdaeRAVjHASQz8I4rOjuP
	 v59/o9sLmVzYcO8KT8XvJz9JqMpU1kxIZjOnzbeC2ckbzAFXx82F7E4eB4FfCcMmlc
	 Hw09tQNuMpm6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V9 07/11] iio: imu: inv_icm42607: Add Temp Support in
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260530031739.109063-8-macroalpha82@gmail.com>
References: <20260530031739.109063-8-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 04:13:43 +0000
Message-Id: <20260530041344.0E8B61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] State leak: the temperature sensor is explicitly enabled during =
a raw read but never disabled, leaking power if another sensor prevents PM =
autosuspend.
--

commit 4a85771a51be0771ebdaf1ebc5a28b4564534883
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Temp Support in icm42607

This commit adds functions for reading temperature sensor data to the
inv_icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_temp.c
> new file mode 100644
> index 0000000000000..4180984505926
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c

[ ... ]

> +static int inv_icm42607_temp_read(struct inv_icm42607_state *st, s16 *te=
mp)
> +{
> +	struct device *dev =3D regmap_get_device(st->map);
> +	__be16 *raw;
> +	int ret;
> +
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
> +	ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret =3D inv_icm42607_set_temp_conf(st, true, NULL);

[Severity: Medium]
Will this leak the temperature sensor power state?

The temperature sensor is explicitly enabled here for a raw read, but it do=
esn't
appear to be disabled or restored to its previous state before returning.

If another sensor on the same chip (like the accelerometer or gyroscope) is
actively streaming and holding a runtime PM reference, autosuspend will be
blocked. Does this mean st->conf.temp_en will remain true indefinitely,
preventing the accelerometer from using its low-power RC oscillator clock?

> +	if (ret)
> +		return ret;
> +
> +	raw =3D &st->buffer[0];
> +	ret =3D regmap_bulk_read(st->map, INV_ICM42607_REG_TEMP_DATA1, raw, siz=
eof(*raw));
> +	if (ret)
> +		return ret;
> +
> +	*temp =3D be16_to_cpup(raw);
> +	if (*temp =3D=3D INV_ICM42607_DATA_INVALID)
> +		return -EINVAL;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530031739.1090=
63-1-macroalpha82@gmail.com?part=3D7
