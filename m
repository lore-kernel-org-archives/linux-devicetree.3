Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E75E46AA97
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 18:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767660; cv=none; b=nZB1jcijfSi923XL0Xx6OYJ7gCQat2uNDHwSAXw6a+INSXCS/uU5U6lzmx4+NHFqFnreoMlw7PofIDbJD69nNh0ZLa4yZ+iSeEbzSy9C14D4QwjxfyuOVsSkz3g9Cj9F8HOP+fhF+VyB0BzS3hf413bDX3IeQJimHtOXhbPihWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767660; c=relaxed/simple;
	bh=hToXz3TBPEgoP3ypBlW47W+9Fa9h+4YHpQjIMK8NETQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zb9Tauom5D6S+q3dt5j8o/f59xUYvzPeeW5lWm2aNrC+krVbERfLmKrMw4/LYeAcUoUbwt7rbuxyyu7QmUcm/tpu3O2i7d4EpeZgAmDscG3x5zQGVoZIQsa5LzcULPqCcN5REKYeEB4LiIReCLEEINF6EBZEM6nlsGh02KcB3nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0I8vUTC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0I8vUTC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA9D1F000E9;
	Wed, 26 Aug 2026 18:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787767649;
	bh=Wgo8HOEqLU3HdcMI6z2gRPZAspMgtBfaDmObGSu1hb8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L0I8vUTC0Z73CQrRSqCPDAO/5QpwNxKkk9GQ0loM15dKAkfskDunP9w5ehLoUYUuo
	 0EqYsS6G9f1cuZPIMecUl08X0ykiRe0+so96+dT3G8jE56G71pZvmfuSdl7l/sbvZn
	 Pqao/njye6UScXsON+/JbzDcr0raE7DlR+SVI7mYP/ThJ4JZuzwhqz7JwHw37AtjaW
	 HgiqsNvexVQPbLp6dEqYUtEBl5NLMvqv4Y5oEYe1C1w5EvdCsGD0/MJAU/LcfpCUIb
	 J4UIGxARj4lrY9hkHRFClRcFs6wWVsb4eRPV+RWwos7wY/JiLo6D1tRltSAnEcrGfp
	 GYHJp9zriktZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] iio: light: stk3310: move the data registers
 into the channel address
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826175409.326131-4-jorijnvdgraaf@catcrafts.net>
References: <20260826175409.326131-1-jorijnvdgraaf@catcrafts.net>
 <20260826175409.326131-4-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 18:07:28 +0000
Message-Id: <20260826180728.EBA9D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Possible Use-After-Free of `event_interface` in `iio_push_event` o=
n the `iio_device_register` error path.
- [High] Missing locking in `stk3310_write_event` leading to state mismatch=
 between hardware and software.
--

commit 0d9aa45c0bb9cd3c7c737938875870bc51a8c0be
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

iio: light: stk3310: move the data registers into the channel address

The RAW read selects its data register with a per-channel-type branch.
Record each channel's data register in its .address field and read
from there, so adding a channel does not grow the branch.

> diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
> index 5b5b6812edc75..156888969366c 100644
> --- a/drivers/iio/light/stk3310.c
> +++ b/drivers/iio/light/stk3310.c

[ ... ]

> @@ -370,25 +372,20 @@ static int stk3310_read_raw(struct iio_dev *indio_d=
ev,
>  			    struct iio_chan_spec const *chan,
>  			    int *val, int *val2, long mask)
>  {
> -	u8 reg;
>  	__be16 buf;
>  	int ret;
>  	unsigned int index;
>  	struct stk3310_data *data =3D iio_priv(indio_dev);
>  	struct i2c_client *client =3D data->client;
> +	struct regmap *map =3D data->regmap;
> =20
>  	if (chan->type !=3D IIO_LIGHT && chan->type !=3D IIO_PROXIMITY)
>  		return -EINVAL;
> =20
>  	switch (mask) {
>  	case IIO_CHAN_INFO_RAW:
> -		if (chan->type =3D=3D IIO_LIGHT)
> -			reg =3D STK3310_REG_ALS_DATA_MSB;
> -		else
> -			reg =3D STK3310_REG_PS_DATA_MSB;
> -
>  		mutex_lock(&data->lock);
> -		ret =3D regmap_bulk_read(data->regmap, reg, &buf, sizeof(buf));
> +		ret =3D regmap_bulk_read(map, chan->address, &buf, sizeof(buf));
>  		if (ret < 0) {
>  			dev_err(&client->dev, "register read failed\n");
>  			mutex_unlock(&data->lock);

[Severity: High]
This is a pre-existing issue, but is there missing locking in
stk3310_write_event()?

drivers/iio/light/stk3310.c:stk3310_write_event() {
	...
	buf =3D cpu_to_be16(val);
	ret =3D regmap_bulk_write(data->regmap, reg, &buf, sizeof(buf));
	if (ret < 0) {
		dev_err(&client->dev, "failed to set PS threshold!\n");
		return ret;
	}

	if (reg =3D=3D STK3310_REG_THDH_PS)
		data->ps_thdh =3D val;
	else
		data->ps_thdl =3D val;
	...
}

Can concurrent sysfs writes to the event threshold file cause the hardware
configuration and software state to diverge?

If two threads call stk3310_write_event() concurrently without data->lock
being held, could they interleave their regmap_bulk_write() and software
state updates?=20

For example, if Thread A writes 10 and Thread B writes 20, can the hardware
be set to 20 while the software state incorrectly records 10, leading to
stk3310_resume() restoring the wrong state later?

[Severity: High]
This isn't a bug introduced by this patch, but could there be a
use-after-free in the probe error path?

drivers/iio/light/stk3310.c:stk3310_probe() {
	...
	if (client->irq > 0) {
		ret =3D devm_request_threaded_irq(&client->dev, client->irq,
						stk3310_irq_handler,
						stk3310_irq_event_handler,
						IRQF_TRIGGER_FALLING |
						IRQF_ONESHOT,
						"stk3310_event", indio_dev);
		if (ret)
			goto err_standby;
	}

	ret =3D iio_device_register(indio_dev);
	if (ret < 0) {
		dev_err(&client->dev, "device_register failed\n");
		goto err_standby;
	}
	...
}

If iio_device_register() fails, does this code leave the IRQ active?

Since devm_request_threaded_irq() is called before iio_device_register(), a
failure in iio_device_register() will clean up the event interface and
free it.=20

Because the IRQ is still active and not disabled on this error path, an
interrupt could fire concurrently.

If that happens, would stk3310_irq_event_handler() call iio_push_event()
and dereference the freed event interface pointer, resulting in memory
corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826175409.3261=
31-1-jorijnvdgraaf@catcrafts.net?part=3D3
