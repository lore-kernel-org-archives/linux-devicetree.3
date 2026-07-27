Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA6837BE95
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173287; cv=none; b=BOHe/oC+xEV3YuvnKq/eGyg3nSSXVMG92oUHVnN60eS0Zze2zchYNpekqZrKy0NCVavirZN/XwUXOKsETjPepSiKXw5X7wwheeoQO2qP+EpXJfBaaKLzRIQGXb54AAhwanpcxjvaZdJHbJZ5kTkta0R2Gm0UPtfF9T6Dy93/SUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173287; c=relaxed/simple;
	bh=B2ApPdUg5WwjktK0aPR9KsVw0LsHZSzKw6PnMKOiiRo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tVD0Ta0YbEF0wO7498aow+iaNOXxD79NBAilhSmoZXlMuXW0F4+qFvUwuizAAzLOY0v1FcJ0EgNqAEMx/la9ch76XvBOCkQ6C5kZFLLI7j9+coi4bQnfGVLhVrwnq60bpeq7Yg1RRlTDOVqZqyCf/M89UmSGGl3KwBzDijGNCdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgK1pNv9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgK1pNv9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0251F000E9;
	Mon, 27 Jul 2026 17:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785173279;
	bh=uKYPzAASzcBA7w+tXoquWs/yZpwzyTJrYVoZKGC3RKY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NgK1pNv9sh5o2mFLThrpD8V6gdBtgW2DatYPnxCo17WXDIo3PDhfGyK9OOUldjilT
	 4QgiNeZJigqzo9Xd0+OuMUlVggrVSf21X7Zb1+R/eugPMh7bopEGYxt0bp40e+i7b0
	 cAac8qa41J46nLIjgFovskVSag1miH2OLs1eOf2wZ30JrUxWq6gldOQTNi8CJFchuZ
	 JmK/V8FE1JfN4QvyFxFEDYjWXxQJgWwK7chQ3BCjdliVsMUuEHCtnvEQQHKip84uq3
	 hPd1WIkHWqygd1bFmDS8RlRfmW/kTtHzKazvQNYKvI1omt+yyZja0zn8o472ZEUwsA
	 IOd0jKb03m7Fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V20 5/9] iio: imu: inv_icm42607: Add PM support for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727164815.65190-6-macroalpha82@gmail.com>
References: <20260727164815.65190-1-macroalpha82@gmail.com>
 <20260727164815.65190-6-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:27:58 +0000
Message-Id: <20260727172758.DF0251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Comment references non-existent 'sleep_ms' parameter and 'temp sens=
or' logic.
--

--- Patch [5]: [PATCH V20 5/9] iio: imu: inv_icm42607: Add PM support for i=
cm42607 ---
commit 51a71bae3d352abb116b3df6698478255e0fe9f7
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add PM support for icm42607
   =20
This commit adds power management support for the ICM42607 device driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 6ec1d730017e2..e6d2fc7c0a344 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -100,6 +104,93 @@ const struct inv_icm42607_hw inv_icm42607p_hw_data =
=3D {
[ ... ]
> +static int inv_icm42607_set_pwr_mgmt0(struct inv_icm42607_state *st,
> +				      enum inv_icm42607_sensor_mode gyro,
> +				      enum inv_icm42607_sensor_mode accel)
> +{
[ ... ]
> +	/*
> +	 * If a state change occurs from off to on, sleep for the startup
> +	 * time of the sensor, unless a sleep_ms is specified. Since more
> +	 * than one sensor can be transitioned from off to on, select the
> +	 * maximum time from each of the sensors changing from off to on.
> +	 * The startup time for the temp sensor is considerably smaller
> +	 * than the startup time for the other sensors and one or more are
> +	 * required to be on for the temp sensor to function, so any start
> +	 * delay should be enough.
> +	 */

[Severity: Low]
This isn't a bug, but this comment refers to a sleep_ms parameter and
temperature sensor logic that do not appear to exist in this function.
Is this an outdated comment copied from another driver?

> +	sleepval_us =3D 0;
> +	if (accel && !oldaccel)
> +		sleepval_us =3D max(sleepval_us, INV_ICM42607_ACCEL_STARTUP_TIME_US);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727164815.6519=
0-1-macroalpha82@gmail.com?part=3D5
