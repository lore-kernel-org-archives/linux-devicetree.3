Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B0664
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 00:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789862663; cv=none; b=UGlMXK3X6Ng/rvtLHNsgNdz6hcgulv9VV/HtxaAqtsc6UY5zPN07I8iHb+p2Pzw8kJCuPQOtqfy5AIScYUDTbxLHcuLoAbfpCp49d6RCq7UgBUAakmFHsyMkp1UsvsirJlsm90N79iLIfvr8fukuhY+Gx5VIJLz7/394pRd7Q1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789862663; c=relaxed/simple;
	bh=5DQWky5uN3Nse+kH3oJuJqrDVoXTLzBPh6RREbAdXV0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lfWCEdtuebebBIDNgQ50fZ1EVsNBw2CYLtcJh8kNaeAwTlBzx5RXi/2C3YOiva5mNUD7d0wPfyKb9RR9pkPggRHFuoWKTPPt3jFm8aWZpjvUdjRqa+u4DSXwzmBIX1HEta4xW3QTS0Ey0yvsn/u5TZ/tFlfTb5jD4YrI2vaiBkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9aVHpZ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9aVHpZ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A411F000FF;
	Sun, 20 Sep 2026 00:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789862662;
	bh=JWfhpEVy+Hbd/5VhzRaF8yVDKRdM2rhHrR9EXgh87o4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g9aVHpZ+J3SYq1vaJEu+93sG5pVvl3NHi6ypPZML2VSrLECayARdubWizrT1bj9QH
	 KmlY4luu7I6UqjQPoyOaK9CKQGHW2HP9H32/eWZHRu6QxGH4Qvxox/fDjsuhkwSLSm
	 QmdFOzdzA/TU5U0K+QX0QVRhJLwnxhGsESWLijgVEmcRGf0HrTgH9I4zZEQiWg1Q6w
	 RUhZ76VEH0ycjTKkt+7zB3vdmkRaBMFrT0hjI0upUXSJPMzOK9tczqLKiVdwh0z1qT
	 aZte6HxDSwBy9fBuaOLzIWgj35c7HNjS7ZibaBXrwVabeqpJun3REZ+dZtmOJTEtMz
	 WOEuraOlNIH6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chang Yu" <marcus.yu.56@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260919235145.48273-3-marcus.yu.56@gmail.com>
References: <20260919235145.48273-1-marcus.yu.56@gmail.com>
 <20260919235145.48273-3-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 00:04:21 +0000
Message-Id: <20260920000421.D9A411F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pm: missing PM runtime idle request prevents initial autosuspend
--

commit 87cfb69de7e4c2b750859f6540e61d6d9aef5dcd
Author: Chang Yu <marcus.yu.56@gmail.com>

iio: light: add AS7343 multi-spectral sensor driver

Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
The driver exposes 12 spectral channels via sysfs and implements runtime
PM to manage device power during measurements.

> diff --git a/drivers/iio/light/as7343.c b/drivers/iio/light/as7343.c
> new file mode 100644
> index 0000000000000..c079e0c6aa704
> --- /dev/null
> +++ b/drivers/iio/light/as7343.c
[ ... ]
> +static int as7343_probe(struct i2c_client *client)
> +{
[ ... ]
> +	pm_runtime_set_autosuspend_delay(dev, 3000);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	ret =3D devm_add_action_or_reset(dev, as7343_suspend_action, dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to add suspend action\n");
> +
> +	ret =3D devm_pm_runtime_set_active_enabled(dev);

[Severity: Medium]
Does enabling PM runtime here without a subsequent idle check (or without
calling pm_runtime_use_autosuspend afterwards) leave the device perpetually
active?

Since pm_runtime_use_autosuspend(dev) is called earlier, the device's
disable_depth is still greater than 0 at that point. This causes the intern=
al
idle check to fail with -EACCES, preventing the autosuspend timer from
being queued.

When devm_pm_runtime_set_active_enabled() later enables PM runtime, it does
not implicitly trigger an idle check. This might strand the device in the
active state until user space initiates a read to kick off a get and
put_autosuspend cycle.

> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to activate PM runtime\n");
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919235145.4827=
3-1-marcus.yu.56@gmail.com?part=3D2
