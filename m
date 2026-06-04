Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59664387362
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 21:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780608888; cv=none; b=BzD30C1HZ/L90hlk7YQ3RrgDPFxPtaaXsgb89mkKxso6bnhNF+oDp0cAWTq2ND46EoAi7NC7jtIsLshKdxPw7usK/grP/zEuVJh1vpWvxG9evUdQo7oPIYjbzJZfFRIx8OjdhxHOQy8DlHRW5oMj2DbenJGraUbj385TJMFRBpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780608888; c=relaxed/simple;
	bh=0Fto05Cf0/BXboxIN9pDkPRW8UR7lLbsAl6lI7wlDT4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PSqj88TVnGXeHpamNXYjtk5gX7qF0GOELfw2UWSgXaahOKt20eB22HsNm/nJU9/PkD3kwkpR45Xp4k3hIUR1DKZcV8/IYqGUpunlQZEKJUeLEX+NP6p3CcwHSzZpcRcR/aJrYX+sKLB2CxJRJeWzOuVCWDg47thWtMFLyPjWn0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osfGv7WP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osfGv7WP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F37B1F00893;
	Thu,  4 Jun 2026 21:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780608886;
	bh=1BZhRmmR6yweprM8LzY/KgGrlnc5oA6txM6EXPHPizM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=osfGv7WPbb9hfGO9v3LBXbNjYT/bADowZfjRCPeNyLgfuMgJRxW4e4ukAZ5W9QZxS
	 DC8jBaA/EHaQQEKqgI3/Euh+Nf2x5bL+XHHTiQO0tpkXOHG0ThkYA0vNTX2mG+eHxm
	 CrgROzhjSF4qRk+KwSc1GwhDAtvBjfij5ZqIehwXO0neK0wucdLzU+neemwFPDgMjJ
	 mbIfv+4utS3/649L2VlyrEwLyrriaY+SVqtRd3sXjcKfd9O4M18H8Wl8DxBOJz9rzq
	 KZBZPrxOfjXFEZBkxL6XNRQjfUU2n5Ozflm1TmE187j5b5AfIYQIOzJwdst6advsKX
	 iq/EUl34yjPZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V10 6/9] iio: imu: inv_icm42607: Add Temp Support in
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260604201832.60656-7-macroalpha82@gmail.com>
References: <20260604201832.60656-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 21:34:46 +0000
Message-Id: <20260604213446.9F37B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The temperature sensor is explicitly enabled for a one-shot sysfs =
read but is never disabled, resulting in a permanent 77ms latency penalty o=
n all subsequent runtime resumes, the disabling of the low-power RC oscilla=
tor clock, and increased power consumption during active states.
--

commit 4c6f897d3d27fc0ab2a068b2b3d0736751dc6150
Author: Chris Morgan <macromorgan@hotmail.com>

    iio: imu: inv_icm42607: Add Temp Support in icm42607

This commit adds support for reading temperature sensor data to the
inv_icm42607 driver. It introduces functions to configure the temperature
sensor and read its raw data values.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_temp.c
> new file mode 100644
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
> +	if (ret)
> +		return ret;
> +
> +	raw =3D &st->buffer[0];
> +	ret =3D regmap_bulk_read(st->map, INV_ICM42607_REG_TEMP_DATA1,
> +			       raw, sizeof(*raw));

[Severity: High]
Does this leave the temperature sensor permanently enabled?

Calling inv_icm42607_set_temp_conf() with true sets the sensor to active,
but it doesn't appear to be disabled after the read completes or fails.

If the temperature sensor is left enabled, st->conf.temp_en remains true.
On subsequent runtime resumes, inv_icm42607_set_pwr_mgmt0() would be
called with temp =3D true. This appears to force a 77ms sleep
(INV_ICM42607_TEMP_STARTUP_TIME_MS) on every resume, rather than the
standard 10ms for accelerometer wakeups.

Additionally, since temp is permanently true, the low-power RC oscillator
clock (INV_ICM42607_PWR_MGMT0_ACCEL_LP_CLK_SEL) might be prevented from
being selected, leading to continuously increased power consumption during
all active states.

Should there be a call to inv_icm42607_set_temp_conf(st, false, NULL) before
returning to restore the previous power state?

> +	if (ret)
> +		return ret;
> +
> +	*temp =3D be16_to_cpup(raw);
> +	if (*temp =3D=3D INV_ICM42607_DATA_INVALID)
> +		return -EINVAL;
> +
> +	return 0;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604201832.6065=
6-1-macroalpha82@gmail.com?part=3D6
