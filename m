Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA7635AC03
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783980968; cv=none; b=E1r4596xkrF0hSV9A/BVRUTFW8xJC9romuCN5lj5VFtsHnQHC6js3CqJJDNfpTymncAnm3+SmJA8TIekg0g0Mg6xXqeZhQTfaxEU0uEwzvvyUsfhPyBa7Sxykgf1l3UoZlYGqDODp+VQ7DTYRYdJVC/XCw8m5JO7O5IubKy5JaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783980968; c=relaxed/simple;
	bh=KsyXintrISJEOngcSl0cfE4Bpv9xZEfGJcahHh7aQ+c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E5zM272kE1Z4ItceH8XS7/D9+0+/RwjDtGF6n1gAep76wB09ryK0Gc+GN0VbKyBLqEMcDqRR6Edtuw9rrvVGf6u78AYJnUrcByBELZc1DeUfo3iiw8GF12pEFSuMGAVl94YSwtvK4JU6btyqOGwkmUfsFYG9Q4KksQpclJJikA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcBYaGca; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcBYaGca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685F21F000E9;
	Mon, 13 Jul 2026 22:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783980966;
	bh=5Yv8FYcp0SyiQJCb0zpZqXobsfe+9M+2VQQo0yvWkI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YcBYaGcaXphobCzJGqr4v7x5dAslN4ODRF+YKmw0VR5l3fHUS4rxnEBmepj/a+mRm
	 stu7x1rkgU5sbRnouQyLZ05MiTzBTsqNlx8BAqqgzpxnL6RV4e2UHw6E3xoSQcS7X3
	 6ewA6XkNe53FD0bOVpPYJtnv73r/BUrfYxtmqlHKXGEF6D3svA+pvWXm+MfEj42DLe
	 1n+6D5CLFFZdQF/cxNC3L9YspRZm68GY4XypNCNYETj9aD22iPpTdYNlIX3A7Ic99i
	 laXwr4MQaZfaE2eoP6pJHpLfVa1XQPMIKrbATfYvQB7SGuooGdP3Is0lFLygreGPXa
	 xsUyN7LTs0ZUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 07/10] iio: imu: inv_icm42607: Add Accelerometer for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713215842.69097-8-macroalpha82@gmail.com>
References: <20260713215842.69097-1-macroalpha82@gmail.com>
 <20260713215842.69097-8-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 22:16:05 +0000
Message-Id: <20260713221606.685F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing update of cached sensor state `mode` causes configuratio=
n changes to inadvertently power off the sensor and breaks suspend/resume s=
tate tracking.
--

--- Patch [7]: [PATCH v16 07/10] iio: imu: inv_icm42607: Add Accelerometer =
for icm42607 ---
commit 599d6ae3a9166a30d7aae587e26cd1fe820357f4
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Accelerometer for icm42607
   =20
Add icm42607 accelerometer sensor for icm42607.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 303a6a0b1b21e..45e031cefd4ae 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> +static void inv_icm42607_update_config(struct inv_icm42607_sensor_conf *=
conf,
> +				       struct inv_icm42607_sensor_conf *oldconf,
> +				       bool *config0, bool *config1)
> +{
> +	if (conf->mode < 0)
> +		conf->mode =3D oldconf->mode;

[ ... ]

> +int inv_icm42607_set_sensor_conf(struct inv_icm42607_state *st,
> +				 struct inv_icm42607_sensor_conf *conf,
> +				 enum iio_chan_type chan_type)
> +{
[ ... ]
> +	if (config0) {
[ ... ]
> +		oldconf->fs =3D conf->fs;
> +		oldconf->odr =3D conf->odr;
> +	}
> +
> +	if (config1) {
[ ... ]
> +		oldconf->filter =3D conf->filter;
> +	}
> +
> +	switch (chan_type) {
> +	case IIO_ACCEL:
> +		return inv_icm42607_set_pwr_mgmt0(st, gyro_mode, conf->mode);
> +	case IIO_ANGL_VEL:
> +		return inv_icm42607_set_pwr_mgmt0(st, conf->mode, accel_mode);
> +	default:
> +		return -EINVAL;
> +	}
> +}

[Severity: Medium]
Does this code miss updating the cached mode (e.g., oldconf->mode =3D conf-=
>mode)?

It looks like fs, odr, and filter are properly cached, but mode is not. If =
the
cached mode is never updated, it could permanently stay OFF.

When a configuration parameter like scale or ODR is written via sysfs,
inv_icm42607_update_config() merges the requested change with the cached
mode. If the cached mode is incorrectly seen as OFF, it could inadvertently
power off the sensor despite an active runtime PM reference. This might also
break suspend/resume state tracking which relies on this cache.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713215842.6909=
7-1-macroalpha82@gmail.com?part=3D7
