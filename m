Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3557BA3D
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784292496; cv=none; b=XNxnPw2+2iu7tY5PHchw8qv0ECa+Jd4YngqHwTdmJ03u77GGUUkKI6fd2/WodvqSSIVQUgpOgWgnalnD+5c5PWZowtZN/ZGC6M+RV46pu4VYq6TVC8JZ8YJpCZWU/0d+2diuPf7LoDsFG0h/KX0gMIK1iVmBCQt2U86LfIFyBoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784292496; c=relaxed/simple;
	bh=no3ycw6KIP74R5jJ1YPjMV/yC3/6fNEizQL8yWKwt/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Pm58eB+s2gh0vwFWswDYV5A3H/Tx5Eqgg4Y5frHXnbkFgt4Mll3624CXtMixEqF1jgp7Hd+DDRVZoD9kBTZh/dV4LnU4IRNDH+50Mgy89tmWVxIAxzJ0zEMS+S5sETMCLQJCpS9+ZMyi2T9tjXKbLN+Gp2/gPl5zRMgULyPAtcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQnal47q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQnal47q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76D41F000E9;
	Fri, 17 Jul 2026 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784292495;
	bh=fWCKhGCJ+0IjAhMoUdoAT5KDtzHHgtMmDg/6Kd9tR7g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bQnal47qS0nOgluaYiyV4/fCVAQYgXlhoLYzoEZfNqGoDsBEODlCHCI1FHNVZ02B3
	 nWUU2J9ysvRImgTGcYi/1qvh5ofapd6vKibGMWA1S2ncd7f413Ax39gh0TtUcaoj+/
	 bHFvb0Q1N1+Zj/cZ6VXh9yU4FVRkvTEeHXtV91b7xWyPm9Mwo5/Gdi8Gs7OdjU9iwm
	 7YxyOdOMtpRCAyUHXo3YS0KFTv0BmY4wuiMIheyxq5NhuofodzRJWCKrUABkOreKDO
	 tfZ2H+GmS8vkCGSWFcoijAQdqSPQFRHtkeM6Uh8hCaAZxHsPd20/k2GneHep/IEk0Y
	 DSlFRuOmmuweA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Popa" <stefan.popa@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717123852.1140893-3-stefan.popa@analog.com>
References: <20260717123852.1140893-1-stefan.popa@analog.com>
 <20260717123852.1140893-3-stefan.popa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 12:48:14 +0000
Message-Id: <20260717124814.C76D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Uninitialized stack variable `tmp` is read and assigned to `*iv`=
 on the error path in `max40080_read_iv`.
- [Medium] Unprotected read of `st->range` in `max40080_read_raw` races wit=
h concurrent modifications.
--

--- Patch [2]: [PATCH v4 2/2] iio: adc: add MAX40080 current-sense amplifie=
r driver ---
commit b542cce161e1d593b12f173fe74a0a6612fdcb77
Author: Stefan Popa <stefan.popa@analog.com>

iio: adc: add MAX40080 current-sense amplifier driver

This commit adds a new driver for the Analog Devices MAX40080 bidirectional
current-sense amplifier. It exposes current and voltage channels via IIO and
allows configuring oversampling and input ranges through I2C.

diff --git a/drivers/iio/adc/max40080.c b/drivers/iio/adc/max40080.c
new file mode 100644
--- /dev/null
+++ b/drivers/iio/adc/max40080.c
[ ... ]
> +static int max40080_read_iv(struct max40080_state *st, u32 *iv)
> +{
> +	struct i2c_client *client =3D st->client;
> +	int ret, io_ret;
> +	u32 tmp;
[ ... ]
> +	ret =3D read_poll_timeout(max40080_read_iv_once, io_ret,
> +				io_ret || (tmp & MAX40080_IV_VALID_MSK),
> +				1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC,
> +				false, st, &tmp);
> +	/*
> +	 * Update *iv even on timeout =E2=80=94 the caller checks ret first, bu=
t the
> +	 * last-read value (with valid bit still clear) can be useful for debug.
> +	 */
> +	*iv =3D tmp;

[Severity: Medium]
If max40080_read_iv_once() fails on the first attempt and returns a negative
error code (like -EIO), read_poll_timeout() will short-circuit without
evaluating the right side of the condition.

Will this leave tmp uninitialized, resulting in uninitialized stack memory
being copied to *iv before the error is returned?

[ ... ]
> +static int max40080_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct max40080_state *st =3D iio_priv(indio_dev);
> +	unsigned int range;
> +	int ret;
> +
> +	switch (mask) {
[ ... ]
> +	case IIO_CHAN_INFO_SCALE:
> +		/*
> +		 * The selectable current-sense range is exposed through
> +		 * scale: each RANGE setting has its own precomputed
> +		 * mA-per-code value. Userspace picks the range by writing
> +		 * the matching scale.
> +		 */
> +		switch (chan->type) {
> +		case IIO_CURRENT:
> +			range =3D st->range;

[Severity: Medium]
Since max40080_set_range() updates st->range while holding st->lock,
could reading it here without taking the lock cause a data race if a user
concurrently reads and writes the scale sysfs attribute?

> +			*val =3D st->current_scale[range][0];
> +			*val2 =3D st->current_scale[range][1];
> +			return IIO_VAL_INT_PLUS_NANO;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717123852.1140=
893-1-stefan.popa@analog.com?part=3D2
