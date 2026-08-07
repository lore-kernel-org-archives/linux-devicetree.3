Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E038E121
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786114164; cv=none; b=USKpyXYXdNoctHGBL5Lh8XhxgA/216USTzT5PM1upIF2c4Z6FjHseMyK/OC+pack+rW7uX8zFUTb9056jJx9xVI7wcpBqI8BKJ9a2Zpz1Ao7h5Wv6bR6BWcZ4PIcl0vpob8UWmionUQcfyjw5seAptTtfERrkQl0GMqgVnP6Oe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786114164; c=relaxed/simple;
	bh=aOFGpao+oMlsUcvG70piCQc71d0Pb0UdcMZtq4GvTVw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HsyIoooWYshv9whmvCy8b8WJ9NqPVS0WjZALnTRkYclZCITA2JXFimV+lET197A+phBb80qzsmLtHXIJhemEkJxf5uU3kS3y3WxcIXRZhJYPVYPjo9BbFjgLJCwJrX6a4CJD1RWdX3GJC8rWcV0QA/cPVfoh1vDEGzIns3VEn8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0q2lYUP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0q2lYUP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11A81F00A3A;
	Fri,  7 Aug 2026 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786114163;
	bh=U4FxX4GSHxtCB5vZbM4mLbyOZEF4VEBqGGj9qzq4vh0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e0q2lYUP6n35TKnTXyZggv2//sHGcQ/Ix8wJ8PyguXz7UTPserbW8pH68+IuQQKMh
	 kC05APlV8Mj/P3Z3ntvypwkeoKBEqjSo+1hg6aO9EKhuwWO7QxdTv/G8G20pwFIukQ
	 2sjrlf9BAfSFbgkNH0gpX4G7eXG4CzjcsRnNio1kNQn9qgPlA0rHjSFu4H6EVr5rvA
	 GiSG+ovUqMo4MOHWptPhYgnxCKla2fK60cYauw5faZaGCvCclahxSOXdJkvHHVyNBt
	 t1Xtb1OCN2Ubgh6fVP1sHBIxYsMj7Uc7zgnCgNgXJQPm/Mq09KPa97nQxRZo94wmyA
	 ltPHgt7poX6gA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] iio: light: veml6031x00: add support for
 triggered buffers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807-veml6031x00-v5-3-e60876fb3640@gmail.com>
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
 <20260807-veml6031x00-v5-3-e60876fb3640@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 14:49:21 +0000
Message-Id: <20260807144922.D11A81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] AB-BA deadlock between scale_lock and IIO direct mode lock
- [High] Missing IIO buffer channel configuration causes probe failure
- [High] Uninitialized kernel stack data leaked to userspace in IIO trigger=
ed buffer
- [High] Unbalanced pm_runtime put leads to negative usage count
--

--- Patch [3]: [PATCH v5 3/4] iio: light: veml6031x00: add support for trig=
gered buffers ---
commit a5266734ac0d8d96ec4ee20e5c8d6088863dee05
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: veml6031x00: add support for triggered buffers

Add triggered buffer functionality for the two channels the device
provides (ambient light sensor and IR).

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index 30cccda51ca08..0cccd40d729eb 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c
[ ... ]
> @@ -392,6 +401,10 @@ static int veml6031x00_single_read(struct iio_dev *i=
io, enum iio_chan_type type,
> =20
>  	guard(mutex)(&data->scale_lock);
> =20
> +	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
> +	if (IIO_DEV_ACQUIRE_FAILED(claim))
> +		return -EBUSY;
> +

[Severity: High]
Does this establish a lock order of scale_lock followed by the IIO direct
mode lock?

[ ... ]
> @@ -453,6 +466,10 @@ static int veml6031x00_write_raw(struct iio_dev *iio,
>  				 struct iio_chan_spec const *chan,
>  				 int val, int val2, long mask)
>  {
> +	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
> +	if (IIO_DEV_ACQUIRE_FAILED(claim))
> +		return -EBUSY;
> +

[Severity: High]
Can this cause a deadlock?

In veml6031x00_single_read(), data->scale_lock is acquired before the IIO
direct mode lock.

However, here the IIO direct mode lock is acquired first. If this then calls
veml6031x00_set_it(), which acquires data->scale_lock:

veml6031x00_write_raw()
    IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim)
    veml6031x00_set_it()
        guard(mutex)(&data->scale_lock)

Could concurrent sysfs access to raw data read and integration time write
lead to a deadlock?

>  	switch (mask) {
>  	case IIO_CHAN_INFO_INT_TIME:
>  		return veml6031x00_set_it(iio, val, val2);
[ ... ]
> @@ -484,6 +501,81 @@ static const struct iio_info veml6031x00_info =3D {
[ ... ]
> +static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *iio =3D pf->indio_dev;
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	IIO_DECLARE_BUFFER_WITH_TS(__le16, scan, 2);

[Severity: High]
Does this leak uninitialized stack memory to userspace?

The scan buffer is declared without zero-initialization.

When reading only a single active channel (e.g., just the ambient light
sensor), the driver only writes 2 bytes into the array, leaving the
unpopulated channel slots and structure padding uninitialized.

Will iio_push_to_buffers_with_ts() push this uninitialized kernel stack
memory to the ring buffer? Should the scan structure be zero-initialized?

> +	unsigned int i =3D 0;
> +	int ch, ret;
[ ... ]
> @@ -588,6 +680,14 @@ static int veml6031x00_probe(struct i2c_client *i2c)
[ ... ]
> +	ret =3D devm_iio_triggered_buffer_setup(regmap_get_device(data->regmap)=
, iio,
> +					      iio_pollfunc_store_time,
> +					      veml6031x00_trig_handler,
> +					      &veml6031x00_buffer_setup_ops);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret,
> +				     "Failed to register triggered buffer\n");
> +

[Severity: High]
Will this probe fail with -EINVAL?

The triggered buffer is registered here, but it appears the driver's
channels array (veml6031x00_channels) was not updated with .scan_index,
.scan_type, or a timestamp channel.

Without .scan_index, the IIO core defaults both channels to index 0.

Does iio_device_register() abort with -EINVAL during probe when
iio_check_unique_scan_index() detects the duplicate scan index 0?

>  	pm_runtime_put_autosuspend(&i2c->dev);

[Severity: High]
Is this pm_runtime_put_autosuspend() call unbalanced?

The probe function appears to use devm_pm_runtime_get_noresume() which
automatically queues a put on unbind.

If we explicitly decrement the usage counter here, will the devres action
firing on unbind drop the counter below zero and trigger a warning?

Should this use the non-devm pm_runtime_get_noresume() instead if the
driver intends to manually drop the reference later?

> =20
>  	ret =3D devm_iio_device_register(&i2c->dev, iio);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-veml6031x0=
0-v5-0-e60876fb3640@gmail.com?part=3D3
