Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794646793;
	b=knH7oZhKKjnjJQtJljQ1ry6D1piZf98V9C2ygN8NYhAubMUn/tgt+HxfggT82J+yxnhx
	 VBOh5Xz/TMx5mQSqoiC0U4fMdxc0aDCZmMTVp9gczrpje7qdhd6OjctRflbzE/w9rDQ2c
	 FmuB1zip1V4OdALL/3t+tb5PymSbnEiP/vT4k0Ye6ylv4nj07HWUfg+2JnDP5X6uQuQsO
	 mKD2j7mjvRfL5rGU4TRAPhGLGJGzNtvUGC51JPAoLsyxF/GFnk7JxnWbVuYt9M53bqyb9
	 rDBz2oy/F0Ff4U23oZUd2tLmLuOQlYf19/vxTT9toikxzq8gkK2mhyBw1SDLUd6l5hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794646793;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uaCZIhQXTyW3ymivGzavLCC6TcwqqQluwAxiF0aFALg=;
	b=ZPuzOK6IJZjNH7ZEHGWPGaIj8RsgOgN5Z3QdeezY0/AViIO8YiRMJ0SR3J7BDm+LJAN0
	 yYwQxhx9fqUMCJWY9iaZE0Al7FcpsSTdxWQDJkoceuwSTn0AaOBsIdblhHd1mLT9dejAY
	 rVxu5ZOi5LkHe6Fexj/1lmOgOwEDy0rvbZO2xzrAk/bYJZGBZ9ODfszoySoILm9mHveDB
	 /oz+ZF+jwSThNHHvWuNEnpuf1dvCzyw12n7IUl/FwEOiSSk0lAZNAP2QkE73LxTsSZo15
	 /w+IGBWl7Pgu8ASFqzVcK/2vjtujUf5UOu6NT4B/Z0SgdIrPfRLudDi1x7nY1WyXDKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RLi+xX4f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0AB606A32E
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 08:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RLi+xX4f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BBC1F000C4;
	Sat, 14 Nov 2026 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794646793;
	bh=uaCZIhQXTyW3ymivGzavLCC6TcwqqQluwAxiF0aFALg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RLi+xX4fb8w5pYV8jjzcVEei0hQfwiaw4bmF6WIa7AN58yPxPcck1YB5QMCEPwj1Q
	 jnEVqLE7bhW3P+Cr48UVSddt2PAYotQb+vO7PoceeP58heKyiudTRXSIBPRHvtb4df
	 IOqWfDZ3YMt6AcVDu7QvErAXfeBHNh6y+rNWMhn0hVmwxPeI5CrVxFvyPIFimJyGpg
	 nE/x4baTUv3ZLhr8i7J5MSl14u5Qy1VMsdekPsPPaTn38RQle/mVkrpTbF+snqayKg
	 14I/VxWN0iEXWVGvhnupBy1xMtrAUczXjoA95D9vBIdKQDrf52AVmsIHSxuj2QY77K
	 USvTGVQ4GYNBw==
Message-ID: <sashiko-outbox-214316@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: pressure: dps310: add a data-ready trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rupesh Majhi" <zoone.rupert@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114083828.18059-3-zoone.rupert@gmail.com>
References: <20261114083828.18059-1-zoone.rupert@gmail.com>
 <20261114083828.18059-3-zoone.rupert@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 08:59:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] iio: pressure: dps310: blocking temp wait in
  dps310_fill_channels() on IRQ
--

commit fcac9adbf4cd29f69b8e01eb7d00e6810af90fad
Author: Rupesh Majhi <zoone.rupert@gmail.com>

iio: pressure: dps310: add a data-ready trigger

This commit adds an IIO data-ready trigger driven by the DPS310 interrupt
to capture pressure or temperature results with interrupt timestamps.

> diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
> index 5cee23986f307..4bff9e93ea92c 100644
> --- a/drivers/iio/pressure/dps310.c
> +++ b/drivers/iio/pressure/dps310.c

[ ... ]

> @@ -1375,6 +1393,7 @@ static irqreturn_t dps310_trigger_handler(int irq, =
void *p)
>  		s32 channels[2];
>  		aligned_s64 timestamp;
>  	} scan =3D { };
> +	s64 timestamp;
>  	int rc;
> =20
>  	mutex_lock(&data->lock);
> @@ -1383,7 +1402,12 @@ static irqreturn_t dps310_trigger_handler(int irq,=
 void *p)
>  	if (rc)
>  		goto err;
> =20
> -	iio_push_to_buffers_with_ts(iio, &scan, sizeof(scan), iio_get_time_ns(i=
io));
> +	if (iio_trigger_using_own(iio))
> +		timestamp =3D data->irq_timestamp;
> +	else
> +		timestamp =3D iio_get_time_ns(iio);
> +
> +	iio_push_to_buffers_with_ts(iio, &scan, sizeof(scan), timestamp);
> =20
>  err:
>  	iio_trigger_notify_done(iio->trig);
> @@ -1391,6 +1415,105 @@ static irqreturn_t dps310_trigger_handler(int irq=
, void *p)
>  	return IRQ_HANDLED;
>  }
> =20
> +static irqreturn_t dps310_irq_handler(int irq, void *private)
> +{
> +	struct dps310_data *data =3D private;
> +
> +	data->irq_timestamp =3D iio_get_time_ns(data->iio);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static irqreturn_t dps310_irq_thread(int irq, void *private)
> +{
> +	struct dps310_data *data =3D private;
> +	unsigned int status;
> +
> +	if (regmap_read(data->regmap, DPS310_INT_STS, &status))
> +		return IRQ_NONE;
> +
> +	if (!(status & (DPS310_INT_STS_TMP | DPS310_INT_STS_PRS)))
> +		return IRQ_NONE;
> +
> +	iio_trigger_poll_nested(data->trig);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int dps310_trigger_set_state(struct iio_trigger *trig, bool state)
> +{
> +	struct dps310_data *data =3D iio_trigger_get_drvdata(trig);
> +	struct regmap *map =3D data->regmap;
> +	unsigned int status, bits =3D 0;
> +	int rc;
> +
> +	guard(mutex)(&data->lock);
> +
> +	if (state) {
> +		/* Status latched while disabled would fire a stale interrupt */
> +		rc =3D regmap_read(map, DPS310_INT_STS, &status);
> +		if (rc)
> +			return rc;
> +
> +		/* Without pressure, scans follow the temperature results */
> +		if (test_bit(DPS310_SCAN_PRESSURE, data->iio->active_scan_mask))
> +			bits =3D DPS310_INT_PRS;
> +		else
> +			bits =3D DPS310_INT_TMP;
> +	}

[Severity: High]
Does triggering on DPS310_INT_PRS block in dps310_fill_channels() waiting
for DPS310_TMP_RDY whenever the pressure rate exceeds the temperature rate?

drivers/iio/pressure/dps310.c:dps310_fill_channels() {
	/* Compensation needs a temperature, so it is sampled either way */
	rc =3D dps310_read_temp_raw_locked(data);
	if (rc)
		return rc;
    ...
	if (test_bit(DPS310_SCAN_PRESSURE, scan_mask)) {
		rc =3D dps310_read_pres_raw_locked(data);
}

Each scan reads DPS310_TMP_BASE and clears DPS310_TMP_RDY. When the next
DPS310_INT_PRS interrupt fires before a new temperature conversion has
completed (for example at any pressure rate above the 1 Hz default
temperature rate), dps310_read_temp_raw_locked() sleeps until the next
temperature conversion finishes.

While the IRQ thread sleeps with DPS310_INT_STS already cleared and the
oneshot IRQ masked, new pressure conversions overwrite DPS310_PRS_B0..B2
and re-latch DPS310_INT_STS_PRS. The scan then pairs the overwritten
pressure sample with the earlier data->irq_timestamp, throttles capture to
the temperature rate, and leaves DPS310_INT_STS_PRS latched on return,
which causes a spurious level interrupt or stalls edge-triggered
interrupts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114083828.1805=
9-1-zoone.rupert@gmail.com?part=3D2
