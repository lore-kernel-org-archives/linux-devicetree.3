Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F60291C10
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789297399; cv=none; b=S4XFPLhC8YbkhIEaAAWB9H8zoK/iLDeOsTnoQHupulDrJ8EygdNIMeifAf4rHQ54luxjEjLKPOmVpg37kkyNE6BOjnm1A02RTtXMTkDDGzF4V+vumF39ukT8jIci+bjuYEdp0ZZ7tK/gJJULVYGUb40y3XU8rBBFMPKCPCKrAEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789297399; c=relaxed/simple;
	bh=ePNBWQN9n6Zs4myIN8Uq9pIxgeIC/UK39Yd3KndGolM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KjryZ/F80Ec7tLlTs2fLx3Y886yiK/KxvP6L5Q/MNtHW7YMKAp3rINZusezqe+k4f0SdW5UMwptlETvnISsQ8jG/RmLoBjHFJlUSfIob9ItXep8WRo+JAAsjuydZB6cYF8AVt7mkDKnAqPtoMqrh53XffyYNqovw37E8rawZkWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAR7J+3g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAR7J+3g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0168B1F000FF;
	Sun, 13 Sep 2026 11:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789297398;
	bh=8NBDE1pPt3I2zp7vTFdUurNnGnYTCKXI+ncyFRP1Y/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TAR7J+3guHVaoS2v6TKyxWhsBBE0iAm0rlMQT3rtMD0pGnv8LsAsezdKY4cvo7XjF
	 xQ3t9rZ2CKng9YByB+fAMiFOyeyX2HRH8JjI4AodxhDgD4U2Jyai1jQOX9tiFPG8R4
	 UFga8Wmo65LUSYN7f6fT2r/zwn0x3L7mNISMle9jakW97FYgWjsBksQRsNOesaW6ka
	 rk31IvNapSnL//Uu8EguwHGOpGHLVHhQGt/qDwr/DL3ePq+/OvxreKMVdVxMVtigST
	 uAvN4meg5n+6anHo3zO7+REIqS1OEYQ8/NGVmJoZui1Sqz5l2JItx8EGAui0n96EFb
	 Btc+GyEUAbddg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/2] iio: health: add MAX86150 ECG and PPG biosensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260913104658.230422-3-shofiqtest@gmail.com>
References: <20260913104658.230422-1-shofiqtest@gmail.com>
 <20260913104658.230422-3-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 11:03:17 +0000
Message-Id: <20260913110318.0168B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Silent buffer failure and userspace hang when probed without a val=
id IRQ.
- [High] The driver disables the hardware interrupt but fails to synchroniz=
e with the threaded IRQ handler, leading to a NULL pointer dereference and =
data races with sysfs reads.
- [Medium] The driver performs I2C reads immediately after enabling regulat=
ors, violating power-up timing requirements.
- [Medium] The timestamp calculation for the non-overflow case uses an inco=
rrect formula that generates future timestamps when the IRQ handler is dela=
yed.
- [Low] The driver uses nonexistent macros `IIO_DEV_ACQUIRE_DIRECT_MODE` an=
d `IIO_DEV_ACQUIRE_FAILED` to claim direct mode, which will cause a build f=
ailure. Additionally, the acquired lock is never released.
--

commit 2dc175e42137c8414df10b568a4d8af128ab280d
Author: Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: iio: health: add MAX86150 ECG and PPG biosensor driver

This commit adds a new IIO driver for the MAX86150 combined ECG and PPG=20
biosensor. It registers a direct kfifo buffer and uses a threaded IRQ handl=
er=20
to drain the hardware FIFO for sensor monitoring.

> diff --git a/drivers/iio/health/max86150.c b/drivers/iio/health/max86150.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/health/max86150.c
[ ... ]
> +static int max86150_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct max86150_data *data =3D iio_priv(indio_dev);
> +	u32 ppg_red, ppg_ir;
> +	s32 ecg;
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW: {
> +		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> +
> +		if (IIO_DEV_ACQUIRE_FAILED(claim))
> +			return -EBUSY;

[Severity: Low]
Are these macros defined in the IIO headers? IIO_DEV_ACQUIRE_DIRECT_MODE=20
and IIO_DEV_ACQUIRE_FAILED appear to be missing from the IIO core headers,=
=20
which will result in a compile failure.

> +
> +		ret =3D max86150_do_read_raw(data, &ppg_red, &ppg_ir, &ecg);
> +		if (ret)
> +			return ret;
> +
> +		switch (chan->scan_index) {
> +		case MAX86150_IDX_PPG_RED:
> +			*val =3D ppg_red;
> +			return IIO_VAL_INT;
> +		case MAX86150_IDX_PPG_IR:
> +			*val =3D ppg_ir;
> +			return IIO_VAL_INT;
> +		case MAX86150_IDX_ECG:
> +			*val =3D ecg;
> +			return IIO_VAL_INT;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +	default:
> +		return -EINVAL;

[Severity: Low]
If the direct mode locking macros were valid, would this code leave the=20
acquired lock unreleased on these return paths?

> +	}
> +}
[ ... ]
> +static int max86150_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct max86150_data *data =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	ret =3D regmap_write(data->regmap, MAX86150_REG_INT_ENABLE1, 0);

[Severity: High]
Does this predisable callback properly synchronize with the threaded IRQ=20
handler? It masks hardware interrupts but does not wait for the Linux IRQ=20
thread to finish, such as by calling disable_irq().

If the user disables the IIO buffer via sysfs, the IIO core could free and=
=20
clear active_scan_mask while the concurrent IRQ thread is still running and=
=20
dereferencing it in max86150_irq_handler().

This lack of synchronization could also lead to data races on the shared=20
data->fifo_raw buffer if a concurrent read_raw sysfs access overlaps with t=
he=20
residual IRQ handler.

> +	if (ret)
> +		return ret;
> +
> +	return regmap_set_bits(data->regmap, MAX86150_REG_SYS_CTRL,
> +			       MAX86150_SYS_SHDN);
> +}
[ ... ]
> +	for (unsigned int i =3D 0; i < n_avail; i++) {
> +		unsigned int j;
> +		s64 ts;
> +
> +		if (ovf > 0)
> +			ts =3D irq_time -
> +			     (s64)(n_avail - 1 - i) * data->sample_period_ns;
> +		else
> +			ts =3D irq_time +
> +			     ((s64)i - (MAX86150_FIFO_A_FULL_SAMPLES - 1)) *
> +			     data->sample_period_ns;

[Severity: Medium]
Will this timestamp calculation generate future timestamps?=20

When there is no overflow, but the threaded IRQ handler execution is delaye=
d=20
by scheduling, more than 17 samples can accumulate in the FIFO. If n_avail=
=20
is greater than MAX86150_FIFO_A_FULL_SAMPLES, this formula projects the=20
timestamps of the newest samples into the future relative to the delayed=20
irq_time.

> +
> +		ret =3D max86150_read_one_sample(data, &ppg_red, &ppg_ir, &ecg);
> +		if (ret)
> +			break;
[ ... ]
> +static int max86150_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct iio_dev *indio_dev;
> +	struct max86150_data *data;
> +	unsigned int part_id;
> +	int ret;
[ ... ]
> +	ret =3D devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(max86150_supply_=
names),
> +					     max86150_supply_names);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
> +
> +	ret =3D regmap_read(data->regmap, MAX86150_REG_PART_ID, &part_id);

[Severity: Medium]
Is a delay required before communicating with the device?

The driver performs an I2C read to MAX86150_REG_PART_ID immediately after=20
enabling regulators via devm_regulator_bulk_get_enable(). Without an=20
intervening power-up delay, the first I2C transaction might fail against an=
=20
uninitialized chip.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot read part ID\n");
[ ... ]
> +	ret =3D devm_iio_kfifo_buffer_setup(dev, indio_dev,
> +					  &max86150_buffer_setup_ops);
> +	if (ret)
> +		return ret;
> +
> +	if (client->irq > 0) {
> +		ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +						max86150_irq_handler,

[Severity: High]
What happens to the IIO buffer if the device is probed without a valid IRQ?

The buffer setup operations will configure the hardware to generate=20
interrupts, but if this IRQ registration is skipped, no handler will ever=20
drain the FIFO. This could cause a userspace process blocking on a device=20
read to hang indefinitely.

> +						IRQF_ONESHOT,
> +						"max86150", indio_dev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913104658.2304=
22-1-shofiqtest@gmail.com?part=3D2
