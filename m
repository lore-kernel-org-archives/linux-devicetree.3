Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55634C8EB
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 21:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782250228; cv=none; b=Iwb6D/pSHcTytCLxVpmoW+RQiEDbXzxNuUG/GK1eZ6wGxs9FbD2Hr9NfkbsLvnwP0YfYGEycWFWRkssdTsnevbTPIWMi0lkTYK/mOIi1HbGPhurH+Zni0VOcMnQQlU7jCsngP9nRsTwjMFOMEkZ6ca3x0Mg3xUe5z3Bwb92BPQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782250228; c=relaxed/simple;
	bh=XYVUyrR0lvmGd2Vu57VVYnlPZNHHYPwgMrFlvAmK+Hg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tC/lFcyxSfBFShv5gDfP5GneOr5M1DaY1rxEGDU/NcqGzqJ1QiO6DKnlS3izJ0hTor+yYJKLZATOkzbfzq1BeAGYX6hUEHfnbMg7CaytoD0mYtlDu/ca0X31TVS6BcGITASMnpkHszl5LnUAyahmF6aIM9fp0UXVOOL8l/IeurE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXDnij9y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXDnij9y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA351F000E9;
	Tue, 23 Jun 2026 21:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782250226;
	bh=oVmd13mXtzwFRwUdvQHdllV7c3qVkVIPrCRa6Hf1Gk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HXDnij9yL6xECyYtmD/BqIjTGHtqWGFNtqyOpHCQzUSoGECZ69dKf7bXoM07E2Kkw
	 UvO/+zcdFAIW4ON7VtktapQzm/ln9RmRPNcLiVMY47slHMXZTzNBHI86vm04WgtAxQ
	 BWlDLHIY8ARId2L5+O1UyxlAXgvyYhpWj7/6AVB1iV3AQqACnKod/1CGycH7L+Gg9K
	 rWrfpkh3fYi+ydTZhbxnqNty7fw/Py6TuUa5mQ0CLSZiCUL07GDqRoQ88pOBmlZWpI
	 0VZleXu6YZ3kkrsguAVJ4yeqpKoQ2+Msz7T4GIb8qMgeYWCt0SxAUmL9NpVeJevBfy
	 ZIekkCT0AsKmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] iio: health: add MAX86150 ECG and PPG biosensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260623201124.18271-3-shofiqtest@gmail.com>
References: <20260623174600.17100-1-shofiqtest@gmail.com>
 <20260623201124.18271-1-shofiqtest@gmail.com>
 <20260623201124.18271-3-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 21:30:26 +0000
Message-Id: <20260623213026.9BA351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware FIFO overrun and data corruption due to incorrect burst r=
ead length.
- [High] Infinite IRQ storm on level-triggered interrupts due to improper I=
RQF_ONESHOT handling, and potential DoS via missing .validate_device.
- [Medium] IIO trigger reference leak on probe error path.
--

commit 9590a122a97de73064d5ca132b0611828fac557d
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

iio: health: add MAX86150 ECG and PPG biosensor driver

Add a new IIO driver for the Analog Devices MAX86150 integrated
biosensor, which combines two PPG optical channels (Red/IR LED) and
one ECG biopotential channel in a single I2C device.

> diff --git a/drivers/iio/health/max86150.c b/drivers/iio/health/max86150.c
> new file mode 100644
> index 0000000000000..92bf31f0a7615
> --- /dev/null
> +++ b/drivers/iio/health/max86150.c

[ ... ]

> +static int max86150_read_one_sample(struct max86150_data *data,
> +				    u32 *ppg_red, u32 *ppg_ir, s32 *ecg)
> +{
> +	int ret;
> +
> +	/*
> +	 * Use data->fifo_raw (heap memory) not a local array so the buffer is
> +	 * DMA-mappable for I2C host controllers that use DMA for burst reads.
> +	 */
> +	ret =3D regmap_noinc_read(data->regmap, MAX86150_REG_FIFO_DATA,
> +				data->fifo_raw, sizeof(data->fifo_raw));

[Severity: High]
Since data->fifo_raw is padded to ARCH_DMA_MINALIGN (e.g., 64 or 128 bytes)
for DMA safety, will sizeof(data->fifo_raw) cause the I2C burst read to pop
64 or 128 bytes from the hardware FIFO instead of the intended 9 bytes?

Could this destroy the 3-byte slot alignment and permanently drop data?

> +	if (ret)
> +		return ret;

[ ... ]

> +static const struct iio_trigger_ops max86150_trigger_ops =3D {
> +	.set_trigger_state =3D max86150_set_trigger_state,
> +};

[Severity: High]
Does the absence of .validate_device here allow external IIO devices to att=
ach
to this trigger?=20

If they do attach, could that prevent the consumer thread from clearing thi=
s=20
device's interrupt, leading to a permanent IRQ storm?

[ ... ]

> +		irq_trig =3D irq_get_trigger_type(client->irq);
> +		if (!irq_trig)
> +			irq_trig =3D IRQF_TRIGGER_FALLING;
> +
> +		ret =3D devm_request_threaded_irq(&client->dev, client->irq,
> +						NULL,
> +						iio_trigger_generic_data_rdy_poll,
> +						irq_trig | IRQF_ONESHOT,
> +						"max86150", data->trig);

[Severity: High]
For level-triggered interrupts, will IRQF_ONESHOT correctly mask the line
until the hardware is cleared?

Looking at iio_trigger_generic_data_rdy_poll(), it acts as the primary
threaded handler and returns IRQ_HANDLED immediately after scheduling the
consumer thread.=20

Doesn't returning IRQ_HANDLED unmask the interrupt line before
max86150_trigger_handler() has a chance to read the hardware registers and
clear the source, causing an immediate IRQ storm?

> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					     "Cannot request IRQ %d\n",
> +					     client->irq);
> +
> +		ret =3D devm_iio_trigger_register(&client->dev, data->trig);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					     "Cannot register trigger\n");
> +
> +		/*
> +		 * Set the default trigger so userspace can enable the buffer
> +		 * without a manual current_trigger write.  iio_device_unregister()
> +		 * calls iio_trigger_put() to release this reference.
> +		 */
> +		indio_dev->trig =3D iio_trigger_get(data->trig);
> +	}
> +
> +	ret =3D devm_iio_triggered_buffer_setup(&client->dev, indio_dev,
> +					      iio_pollfunc_store_time,
> +					      max86150_trigger_handler,
> +					      NULL);

[Severity: Medium]
If devm_iio_triggered_buffer_setup() fails here, is the trigger reference
acquired by iio_trigger_get() leaked?

Since INDIO_BUFFER_TRIGGERED is not set when buffer setup fails,
iio_dev_release() will skip calling iio_device_unregister_trigger_consumer(=
).
Does this mean iio_trigger_put() is never called to clean up this reference?

> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Cannot setup triggered buffer\n");
> +
> +	return devm_iio_device_register(&client->dev, indio_dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623201124.1827=
1-1-shofiqtest@gmail.com?part=3D2
