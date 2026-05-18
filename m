Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA8D171BB
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779137132; cv=none; b=cpdn75n0dXWev406vjxu/3pN96uR2JALR5dabxeyRaE9fEbSoV84xVYE/YrF+Z9Bix2yDUOvU0soa+T3a+4LdCkIz6sl+E2VWKK45SNUG46TI8HIsj8gqgSkhvJqV2cn44HdFMO7fq0bcKi1eoyii51Y2BlTC+09qy82477rLLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779137132; c=relaxed/simple;
	bh=WiX5EuX3Tq91b1WaAFnDj+qoFtSk58gTxdukq8kDcvU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fcxdXQImOuhPL/PD8GYSy4BiZ0KaUZcof+xKU9YLne7kO0fSlKjap/dgFwibTKq7eWdQQIpfxK7m9+uzeiQIq+PG3It3IKKb8yX4mNSZ3C9z2ks7UOWl6R5zz966N6rDac2vbfqvJvFSRbhOJXjwHPL2HB0fw5qsksE/EukFeng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnEZcsPh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnEZcsPh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB704C2BCB7;
	Mon, 18 May 2026 20:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779137132;
	bh=WiX5EuX3Tq91b1WaAFnDj+qoFtSk58gTxdukq8kDcvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QnEZcsPh9ZVnkN5/mlqeymjOwV6sEemprac7KMMKIS+e+0HsgpaXdDGiYSs2C8ZS6
	 u7zrWg9rlgEYDfhvzOl59Ipg3e8liHX1tKVUPCrPPXR3o9/54PUdcD3kkrmbK3TsOf
	 NlD582sLIVuJ1MMRXJtjD7o85uxALEcG9c/ZjpUf3DQsoXwXXcZ6IF2XWUuVxOTGFm
	 85vSQ8fwguU+CHYTMSPnYx24HEMYrLNHI5VkMdKDi8b3sWVMDnrdJO+T8YHPC2qM+y
	 xclR368lF2byduCpGIJS2Pqo2PUzbRrGyh4A4vYraj57HmAqMGFX9RquOswhNFdwD2
	 bCHXjgGKoaPkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V8 07/10] iio: imu: inv_icm42607: Add Temp Support in
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518200526.458421-8-macroalpha82@gmail.com>
References: <20260518200526.458421-8-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 20:45:31 +0000
Message-Id: <20260518204531.BB704C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The temperature sensor is left enabled indefinitely after a sing=
le read, causing a power leak and preventing low-power modes.
- [Medium] The true Runtime PM error code is incorrectly masked and replace=
d with a hardcoded -ENXIO.
--

commit 454b81f6136c888691f5c12d16c333a82da009f2
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Temp Support in icm42607

This commit adds functions for reading temperature sensor data in the
inv_icm42607 driver.

[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_temp.c
> new file mode 100644
> index 0000000000000..7e9cb072a0110
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
> @@ -0,0 +1,80 @@
[ ... ]
> +static int inv_icm42607_temp_read(struct inv_icm42607_state *st, s16 *te=
mp)
> +{
> +	struct device *dev =3D regmap_get_device(st->map);
> +	__be16 *raw;
> +	int ret;
> +
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
> +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> +		return -ENXIO;

Since PM_RUNTIME_ACQUIRE_ERR() evaluates to the actual integer error code
returned by the underlying runtime PM call, does returning a hardcoded
-ENXIO here mask the true cause of the PM failure from userspace?

Could this propagate the actual error code instead?

> +
> +	guard(mutex)(&st->lock);
> +
> +	ret =3D inv_icm42607_set_temp_conf(st, true, NULL);
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

Is the temperature sensor left enabled indefinitely after a single read?

The sensor is explicitly powered on by calling inv_icm42607_set_temp_conf()
with enable set to true, but it doesn't appear to be turned off before
returning.

If another channel like the accelerometer is actively streaming, the device
will not power down due to runtime PM autosuspend. Because st->conf.temp_en
remains true, it appears this would actively prevent the accelerometer from
entering its low-power RC oscillator clock mode, which requires the
temperature sensor to be disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518200526.4584=
21-1-macroalpha82@gmail.com?part=3D7
