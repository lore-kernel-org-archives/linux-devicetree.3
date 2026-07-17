Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6619A398902
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320221; cv=none; b=kleXLDv0m28GxqGc+Jd+jTPAkfOR7KLEX29DaQbmQzlypqM10J5Dp8t416wsWDDxxtU7gItOgYj0JZqVG9xEDPYFFRDLOrpNXLz85F9mOpnvvnoLrt/bUy0DH2YD5jiP+l3gckHF+/VvqLspPJ0gLZrJqbVfc0oVb3kYN8XaTH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320221; c=relaxed/simple;
	bh=sJtJD0LLEsLZ7L5OJQqYw9qKGV27mzCo8uWntMyp7EI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nMWX7mlIGES7rxJ+yBZyylMYtO9y0qjMvkeDxWuS5sK2cgGfinAJxox3+zQsjwnxwA68ugsdQQgIPwE9COLdUUhSMIKaseVLVKwDesUk7DHQL32ij3NvIBDoL5Rpt4zW1zzdLb4xBd/hZ5lyCvieaVcH/96K+LROx681pKkJXv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHXIyKyz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHXIyKyz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E54B1F000E9;
	Fri, 17 Jul 2026 20:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784320220;
	bh=6iNtPA2tZq7QaMNtFzj7F/HM9HnW3W1t17ezjeXGyvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hHXIyKyzc+HT+BvzG9W/05DEofvGRTbPYlegQxSwgn92rgzFYkbrzvpaJOD3Y9LW1
	 8uOM3VVRwwaso9HSyHLmmqjXDg2Xe5fcnHljIBMy0dJEDsjCJ0E77srYr87vDoaKLO
	 8ATNnmftvMWS1zTpimSQf9IblFZePysGxmYF0iEHUV1SzKdwkHYwY02Bobst9tPssw
	 wJoSH3fO/u1TQ+Sk5/ZV0ESj06yOVLYvHz5/ryDsTktJCeNAFnbd1/FvIoMUPGb6LV
	 EbVf1i7p0GyitdsYtooVzMIue1MY//zYHpPii5Rz41o2D0NMustN+oz6mehCIcjxBB
	 tqeAy4TBTZlEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] iio: health: add MAX86150 ECG and PPG biosensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260717201138.1078019-3-shofiqtest@gmail.com>
References: <20260717201138.1078019-1-shofiqtest@gmail.com>
 <20260717201138.1078019-3-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 20:30:19 +0000
Message-Id: <20260717203020.0E54B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The driver uses hallucinated locking macros causing a build failur=
e, and omits the mandatory lock release.
- [High] The I2C read buffer `fifo_raw` is not cacheline aligned, violating=
 DMA API requirements.
- [High] The threaded IRQ handler incorrectly calls a hardirq-only IIO trig=
ger poll function.
- [Low] The i2c_device_id array is missing named initializers.
--

--- Patch [2]: [PATCH v10 2/2] iio: health: add MAX86150 ECG and PPG biosen=
sor driver ---
commit b6c51e5d5e6b5f625bd2546556d36647cd05b62e
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

iio: health: add MAX86150 ECG and PPG biosensor driver

This commit adds a new IIO driver for the Analog Devices MAX86150
combined ECG and PPG biosensor. It supports hardware FIFO captures via
a threaded trigger handler.

> diff --git a/drivers/iio/health/max86150.c b/drivers/iio/health/max86150.c
> new file mode 100644
> index 0000000000000..47d96570a95fc
> --- /dev/null
> +++ b/drivers/iio/health/max86150.c
[ ... ]
> +struct max86150_data {
> +	struct regmap		*regmap;
> +	struct iio_trigger	*trig;
> +	u32			 sample_period_ns;
> +	u8			 fifo_raw[MAX86150_SAMPLE_BYTES];

[Severity: High]
Since this array is the target of regmap_noinc_read() and some I2C host
controllers use DMA for bulk reads, should this buffer be cacheline aligned?
Sharing a cacheline with sample_period_ns and trig can lead to silent
corruption if the CPU accesses them concurrently during a DMA transfer.

> +	IIO_DECLARE_DMA_BUFFER_WITH_TS(s32, scan, MAX86150_NUM_SLOTS);
> +};
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

[Severity: High]
Do the IIO_DEV_ACQUIRE_DIRECT_MODE and IIO_DEV_ACQUIRE_FAILED macros
exist in the IIO framework? If these are replaced with the standard
iio_device_claim_direct() function, does this function also need
corresponding iio_device_release_direct() calls on its return paths to
prevent deadlocking the IIO device state?

> +
> +		ret =3D max86150_do_read_raw(data, &ppg_red, &ppg_ir, &ecg);
[ ... ]
> +static irqreturn_t max86150_irq_handler(int irq, void *private)
> +{
> +	struct iio_trigger *trig =3D private;
> +	struct iio_dev *indio_dev =3D iio_trigger_get_drvdata(trig);
> +	struct max86150_data *data =3D iio_priv(indio_dev);
> +	unsigned int status;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, MAX86150_REG_INT_STATUS1, &status);
> +	if (ret || !(status & MAX86150_INT_A_FULL))
> +		return IRQ_NONE;
> +
> +	iio_trigger_poll(trig);

[Severity: High]
Since this handler is registered as the thread_fn in devm_request_threaded_=
irq
with a NULL hardirq handler, does calling iio_trigger_poll() here violate
locking rules? iio_trigger_poll() expects to run in hardirq context. Should
this use iio_trigger_poll_nested() instead?

> +	return IRQ_HANDLED;
> +}
[ ... ]
> +static const struct i2c_device_id max86150_id[] =3D {
> +	{ "max86150" },

[Severity: Low]
Does the I2C subsystem API require initialized arrays of type
struct i2c_device_id to use named initializers? Using named initializers
such as { .name =3D "max86150" } ensures compliance with subsystem guidelin=
es.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max86150_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717201138.1078=
019-1-shofiqtest@gmail.com?part=3D2
