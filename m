Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B54390239
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782237464; cv=none; b=vEkKxcJOtcy87CGBtuNSiAp9SK+5QwNYsttz37OqFVEmanBe97PhIrUB/pi1mEL82qVvElY3sIdM5G40Z3/0jx4yY3KmT4wnHO1cEHWi+gBWy5nxeXFn8tSInmVF1QcxIlHzC38QnrBJYj4SYp+YsqKmo/gTXmKh9i71NN/SPjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782237464; c=relaxed/simple;
	bh=+9OrYrc94FZnVYEZEsi2VH/Sa100J6YC+lUFEtbzrcA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ugaGMqZMjzGUsmAcofe8ucQKhTqAoyN7/wWFSCRFiWCTJzFX43fKQmRpHJySD/189BkYcOevAF4kMcsj32jyVy8JADt27uKHRsNSqq+xtRFRa6B1CNikSxDzj3EnhWwuIFCTgZ0dCR+iDt9bE1gwDBdTrXy5AcMFTJDhLq7IWi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L98VODq7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L98VODq7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB3D1F000E9;
	Tue, 23 Jun 2026 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782237463;
	bh=DCGNXoWc1cU2aUxpehFul0PqZuuu16bDmyR1GC0VxMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L98VODq7F+ySDb6nD30vfTag79P4LZz5kSnoGUJwRLEtS3evdXH8mipvw1Khw5iGO
	 WJvORwRy7et1Byj+MI3h8ke/+CFqUkEalOWq90zfoLi9EP4TvfWsLC2fyiP0o07qOp
	 hB6z6h8SVbPB0P6e7dqQXSXR+lRT5KbHarUBzFkxs7Mau7+BS2qBupNfkIDO+mexps
	 OOtTd7vcO9zE7uOgBUUGGBdVw7Ik/PeCjQE7sgGYxtSdO4tuZz90+X6eyGtMvvaxPW
	 RnHp/CwiCY6Coy5uHzVM3pFtdJflTYIbs4rVTCuyMk9PMPlbxmIy8jZboSyWuKCfLc
	 G6nMikMdq2/ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] iio: health: add MAX86150 ECG and PPG biosensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260623174600.17100-3-shofiqtest@gmail.com>
References: <20260623155556.13701-1-shofiqtest@gmail.com>
 <20260623174600.17100-1-shofiqtest@gmail.com>
 <20260623174600.17100-3-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 17:57:42 +0000
Message-Id: <20260623175743.3FB3D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The driver fails to assign `indio_dev->trig`, causing `iio_trigger=
_validate_own_device` to unconditionally reject the trigger.
- [High] Using a hard IRQ handler for the IIO trigger without interrupt mas=
king causes a system-locking interrupt storm for level-triggered interrupts.
- [Medium] Timestamp reconstruction assigns inaccurate timestamps into the =
past when the hardware FIFO overflows because it ignores the `OVF_COUNTER` =
dropped sample count.
- [Medium] The I2C DMA buffer `fifo_raw` shares a cacheline with the pushed=
 CPU buffer `buf`, violating DMA API constraints.
- [Medium] A blind sleep in `read_raw` risks reading an empty FIFO if the i=
nternal oscillator or device wake-up is slower than nominal.
--

commit 44deffd1bb30e8d4384d605ba5d156fb29678ad5
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

iio: health: add MAX86150 ECG and PPG biosensor driver

The MAX86150 (Maxim/Analog Devices) combines two PPG optical channels
(Red/IR LED) and one ECG biopotential channel in a single I2C device with
a 32-entry hardware FIFO.

> diff --git a/drivers/iio/health/max86150.c b/drivers/iio/health/max86150.c
> new file mode 100644
> index 0000000000000..0140c93bd4ec9
> --- /dev/null
> +++ b/drivers/iio/health/max86150.c

[ ... ]

> +struct max86150_data {
> +	struct regmap		*regmap;
> +	struct device		*dev;
> +	struct iio_trigger	*trig;
> +	u32			 sample_period_ns;
> +	u8			 fifo_raw[MAX86150_SAMPLE_BYTES] __aligned(ARCH_DMA_MINALIGN);
> +	s32 buf[6] __aligned(8);
> +};

[Severity: Medium]
Since fifo_raw is 9 bytes long, does the __aligned macro only align the
start of the array, leaving the buf array packed into the same DMA cachelin=
e?

Mapping an unpadded buffer that shares a cacheline with CPU-accessed data
might violate kernel DMA mapping constraints and trigger
CONFIG_DMA_API_DEBUG warnings.

[ ... ]

> +static int max86150_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{

[ ... ]

> +		/* Wait for one complete sample period at 100 Hz (<=3D 10 ms) */
> +		usleep_range(11000, 13000);
> +
> +		ret =3D max86150_read_one_sample(data, &ppg_red, &ppg_ir, &ecg);

[Severity: Medium]
Is it possible for the hardware read to execute while the FIFO is still
empty if the internal oscillator or device wake-up is slower than nominal?

Would it be safer to use regmap_read_poll_timeout on the PPG_RDY status
bit to ensure a sample is actually ready?

[ ... ]

> +static irqreturn_t max86150_trigger_handler(int irq, void *p)
> +{

[ ... ]

> +	/*
> +	 * Anchor timestamps to the A_FULL IRQ capture time: sample index
> +	 * (MAX86150_A_FULL_SAMPLES - 1) corresponds to pf->timestamp.
> +	 * Samples that accumulated between the IRQ and handler execution
> +	 * receive timestamps in the future relative to the IRQ, eliminating
> +	 * load-dependent jitter in multi-sample drains.
> +	 */
> +	for (i =3D 0; i < n_avail; i++) {
> +		s64 ts =3D pf->timestamp +
> +			 (s64)(i - (MAX86150_A_FULL_SAMPLES - 1)) *
> +			 data->sample_period_ns;

[Severity: Medium]
When the FIFO overflows (ovf > 0), the hardware overwrites the oldest
samples. Does this calculation assign inaccurate timestamps into the past
because it ignores the OVF_COUNTER dropped sample count?

The remaining 32 samples are chronologically shifted forward by ovf relative
to the original A_FULL IRQ event.

[ ... ]

> +static int max86150_probe(struct i2c_client *client)
> +{

[ ... ]

> +	/*
> +	 * If the device tree provides an interrupt, set up a hardware
> +	 * trigger so userspace can use the FIFO almost-full signal to
> +	 * drive capture without polling.
> +	 */
> +	if (client->irq > 0) {
> +		unsigned long irq_trig;
> +
> +		data->trig =3D devm_iio_trigger_alloc(&client->dev,
> +						    "%s-dev%d",
> +						    indio_dev->name,
> +						    iio_device_id(indio_dev));
> +		if (!data->trig)
> +			return -ENOMEM;
> +
> +		data->trig->ops =3D &max86150_trigger_ops;
> +		iio_trigger_set_drvdata(data->trig, indio_dev);

[Severity: High]
Does the driver fail to assign indio_dev->trig =3D data->trig after
allocating the trigger?

Since validate_trigger is set to iio_trigger_validate_own_device, it looks
like missing this assignment will cause any attempt to write to the
current_trigger sysfs node to unconditionally fail with -EINVAL.

> +
> +		/*
> +		 * Honour the interrupt trigger type from the device tree.
> +		 * Fall back to falling-edge if the DT does not specify one.
> +		 */
> +		irq_trig =3D irq_get_trigger_type(client->irq);
> +		if (!irq_trig)
> +			irq_trig =3D IRQF_TRIGGER_FALLING;
> +
> +		ret =3D devm_request_irq(&client->dev, client->irq,
> +				       iio_trigger_generic_data_rdy_poll,
> +				       irq_trig,
> +				       "max86150", data->trig);

[Severity: High]
Will using a hard IRQ handler for the IIO trigger without interrupt masking
cause an interrupt storm for level-triggered interrupts?

For level-triggered interrupts, the hard handler wakes the consumer thread
and returns IRQ_HANDLED without clearing the physical interrupt via I2C.
The IRQ core then unmasks the still-asserted interrupt line, causing it to
immediately fire again and preventing the threaded consumer from ever
running to clear the source.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623174600.1710=
0-1-shofiqtest@gmail.com?part=3D2
