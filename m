Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B90431A38
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784227661; cv=none; b=sSre63nfJHa3uHSLmteYtcwa2/MAKdSFvBqMzMoXAWbaAGqPDyTS2Edw/k0qrP4IxzIBOniqu/6rb/f+veDw5xCMkLEkWhBvDTs3B3XvQmALjZH7PW1UxDjC9fhgMVvtIXQ8GNrosn5pdJYTUiMoTAbCJhZFq5iDT6gsel2zX90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784227661; c=relaxed/simple;
	bh=3LO6GQyWYiKTnLLfzTdCauqorKY25xFD4t8I52h/exo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R3Jyfl0vD49aNvQEiewB8GAVueRRwugpsvMLMlLooh/lerRq7onxXImCg+pI4rPXO5FT+TTeWXxs6uk3/0wUMg9Fr7xPcI0tU9NPfiJMVoSyzHb5og0gvxLxyfiskSmGiJJgY+S69LsMMNOo56sh5iTxR1HyzRLC8qYy/o3dO7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3asUyKn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3asUyKn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EAA1F000E9;
	Thu, 16 Jul 2026 18:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784227659;
	bh=V8Yy3uubGOEhHXjAcou/YJ8UI8bfd30mwe8JKG/ZDjQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h3asUyKnnVZWYTPtn3emGq7IJXLo5n85KQGbMTCR/o7Yg4pCBq3bPjdRg3efQWidB
	 u/QNk+saEiEBFZDeAgDjnw4N3YVBWxD5vRv5yGATZLt2OkwSq1mosQ0vKF1NNZAr5H
	 JMAPYHc1sQHj4sf9bmW1y9iKsR/P6TiTA66r7OwDiGQUzh3ZjAyLoDTOVP70Dx4KEi
	 oB/WcBL06NW5CwC1yDW+rl0K18AfA1QGWN7y8cyZfMnrTZpYfTyVjCAjy/zX5eeggA
	 dzS6y6gRCXhnxv5fR7q7+477OdfQXNZyoNupcg3DVQFoMM9Rd5c0+KJ+Wk/Cutfv2N
	 pCeG3pR0Z1rQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V17 6/9] iio: imu: inv_icm42607: Add Accelerometer for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716182637.24310-7-macroalpha82@gmail.com>
References: <20260716182637.24310-1-macroalpha82@gmail.com>
 <20260716182637.24310-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 18:47:39 +0000
Message-Id: <20260716184739.A4EAA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing synchronous suspend on driver unbind leaves hardware sen=
sors active indefinitely.
--

--- Patch [6]: [PATCH V17 6/9] iio: imu: inv_icm42607: Add Accelerometer fo=
r icm42607 ---
commit 91f8a7dd90fd683ca51c985841afcdbc30687cd8
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Accelerometer for icm42607

Add icm42607 accelerometer sensor for icm42607.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 9613cba025c7b..be082316ed4ba 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -385,6 +564,11 @@ int inv_icm42607_core_probe(struct regmap *regmap,
>  	pm_runtime_set_autosuspend_delay(dev, INV_ICM42607_SUSPEND_DELAY_MS);
>  	pm_runtime_use_autosuspend(dev);
> =20
> +	/* Initialize IIO device for Accel */
> +	st->indio_accel =3D inv_icm42607_accel_init(st);
> +	if (IS_ERR(st->indio_accel))
> +		return PTR_ERR(st->indio_accel);
> +

[Severity: Medium]
Will this leave the hardware sensors active indefinitely if the driver is
unbound?

By registering the IIO device here, the hardware is exposed to userspace. T=
he
driver relies exclusively on devm_pm_runtime_set_active_enabled() for runti=
me
PM teardown, which calls pm_runtime_disable() and cancels any pending async
autosuspend requests on driver unbind.

Because there is no custom devm action or .remove callback to synchronously=
 put
the device to sleep (e.g., via pm_runtime_force_suspend()), if an autosuspe=
nd
is pending during unbind, the chip could remain physically active and conti=
nue
to draw power from its regulators.=20

Could a synchronous suspend be added on unbind?

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716182637.2431=
0-1-macroalpha82@gmail.com?part=3D6
