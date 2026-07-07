Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2553F7AA6
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 11:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424477; cv=none; b=pEr2IG4wkE7KM0QaT4jThGFHuMvp/eJRLbIz4G4Bt4Wk+LSoAUIo65W0y0GUyH7obSxCP8tqLQ/XE3dQwVMZNdizbfSxXzxenzOODypohNB2Jy3P+UYGM8gb4fh4fBtEbtiLVBj/2nIv+xMT4sLF301VQ5SQEPJHqUMjoIJIOxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424477; c=relaxed/simple;
	bh=rtxym75QV+u6kbNgfZsXksBi0SJvB1xBUTU0NpZZPO0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gMwtIMI+LBrIVnqABPUxtLAXrCzY56MLeuOMHOcYvUqxFXPh2zgATRR4eCQnKfHgzFOHq/UTTGGjGU5gl0ik9MV2V1peb+t7eazLLd8O+DjY/MsftgOh9Dlglwz28W600/CbH3t+f/JgZ3O1Ca0wY2BCVEhgWMQGS8YJi0xGRuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzXmSVl/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzXmSVl/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2551F000E9;
	Tue,  7 Jul 2026 11:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783424475;
	bh=zaJ75XKW35QttmivUGfk+S3wEAcNLbWQMYMTzTzE4lI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GzXmSVl/7VLwB0WfivvmC8Rk8vNfkdBntBW8ZOpSM0+07UvyhSUUKjAfCz2BJWuPp
	 d1awUB701cVydTCj13VAwC1/pPeu0vjdmYS3WuGcEAZlod+UgS+V40QIQw4llnDfKP
	 uTQpTjAHNkzXBWb2g705kKGyrZhWA5wINmlFMbItcwB1VgNiLkECdyZdIfJU8Zw9rZ
	 /WsPwJX4aQy557pUgiDs2hvoyXnXJM/jBQXiJ+Ryf9GmnjBDwNok/keHKFN+UtO7ce
	 2YMQr05Fa/54UwXTDSFt3qv+5/Irgf1z/P/sKAo8KsGuHBjNY08SCWsMXV96uZFsmr
	 hbAZSB86GnY9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] iio: health: add MAX86150 ECG and PPG biosensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707112714.2261727-3-shofiqtest@gmail.com>
References: <20260707112714.2261727-3-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 11:41:15 +0000
Message-Id: <20260707114115.7F2551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Stale A_FULL interrupt status bit is not cleared in buffer_postena=
ble, leading to immediate spurious interrupts and data corruption.
- [High] The threaded interrupt handler can execute while the IIO buffer is=
 disabled, leading to a fatal NULL pointer dereference on active_scan_mask.
- [Medium] The driver bypasses the IIO core's clock selection mechanism by =
using ktime_get_ns() instead of iio_get_time_ns() for soft timestamps.
- [Low] Stale sensor data is leaked to user-space via untouched padding ele=
ments in the local data->buf array.
--

--- Patch [2]: [PATCH v9 2/2] iio: health: add MAX86150 ECG and PPG biosens=
or driver ---
commit 9f8edea36d720ecd87ad044648a96413f3156ea3
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

iio: health: add MAX86150 ECG and PPG biosensor driver

Add a new IIO driver for the Analog Devices MAX86150 integrated
biosensor, which combines two PPG optical channels (Red/IR LED) and
one ECG biopotential channel in a single I2C device.

> diff --git a/drivers/iio/health/max86150.c b/drivers/iio/health/max86150.c
> new file mode 100644
> index 0000000000000..e8394031f3acb
> --- /dev/null
> +++ b/drivers/iio/health/max86150.c

[ ... ]

> +static int max86150_buffer_postenable(struct iio_dev *indio_dev)
> +{
> +	struct max86150_data *data =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	ret =3D regmap_clear_bits(data->regmap, MAX86150_REG_SYS_CTRL,
> +				MAX86150_SYS_CTRL_SHDN);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(data->regmap, MAX86150_REG_FIFO_WR_PTR, 0);
> +	if (ret)
> +		goto err_shutdown;
> +	ret =3D regmap_write(data->regmap, MAX86150_REG_OVF_COUNTER, 0);
> +	if (ret)
> +		goto err_shutdown;
> +	ret =3D regmap_write(data->regmap, MAX86150_REG_FIFO_RD_PTR, 0);
> +	if (ret)
> +		goto err_shutdown;
> +	ret =3D regmap_write(data->regmap, MAX86150_REG_INT_ENABLE1,
> +			   MAX86150_INT_A_FULL);

[Severity: High]
Does this unmask the interrupt without first clearing the stale A_FULL
status in MAX86150_REG_INT_STATUS1?

If the FIFO was full when the buffer was previously stopped, the A_FULL
bit remains latched. When the interrupt is unmasked here with
zero-initialized FIFO pointers, couldn't the latched bit immediately
trigger the handler, causing it to read and push 32 samples of garbage?

> +	if (ret)
> +		goto err_shutdown;
> +	return 0;
> +
> +err_shutdown:
> +	regmap_set_bits(data->regmap, MAX86150_REG_SYS_CTRL,
> +			MAX86150_SYS_CTRL_SHDN);
> +	return ret;
> +}
> +
> +static int max86150_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct max86150_data *data =3D iio_priv(indio_dev);
> +
> +	regmap_write(data->regmap, MAX86150_REG_INT_ENABLE1, 0);
> +	regmap_set_bits(data->regmap, MAX86150_REG_SYS_CTRL,
> +			MAX86150_SYS_CTRL_SHDN);
> +	/*
> +	 * Mask the hardware interrupt first, then synchronize to ensure any
> +	 * threaded handler already in flight completes before the IIO core
> +	 * clears active_scan_mask; without this a delayed handler would
> +	 * dereference a NULL active_scan_mask.
> +	 */
> +	synchronize_irq(data->irq);

[Severity: High]
Is synchronize_irq() sufficient to prevent the handler from running after
the buffer is disabled?

If a spurious interrupt fires while the buffer is disabled, the OS-level
IRQ is still active since disable_irq() wasn't called. Wouldn't the
threaded handler run and unconditionally dereference
indio_dev->active_scan_mask (which the IIO core clears to NULL after
predisable), causing a fatal crash?

> +	return 0;
> +}

[ ... ]

> +static irqreturn_t max86150_interrupt_handler(int irq, void *private)
> +{
> +	struct iio_dev *indio_dev =3D private;
> +	struct max86150_data *data =3D iio_priv(indio_dev);
> +	unsigned int status, wr_ptr, rd_ptr, ovf, n_avail;

[ ... ]

> +	/*
> +	 * Anchor timestamps to the interrupt time: sample (n_avail - 1) is
> +	 * the newest and corresponds to ts; earlier samples are back-calculated
> +	 * by one sample_period_ns per step.
> +	 */
> +	ts =3D ktime_get_ns();

[Severity: Medium]
Should this use iio_get_time_ns(indio_dev) instead of ktime_get_ns()?

Using ktime_get_ns() unconditionally generates timestamps from
CLOCK_MONOTONIC, which ignores the user's selected IIO clock source
(such as REALTIME or BOOTTIME) configured via sysfs.

> +
> +	for (i =3D 0; i < n_avail; i++) {
> +		s64 sample_ts =3D ts -
> +			(s64)(n_avail - 1 - i) * data->sample_period_ns;
> +
> +		ret =3D max86150_read_one_sample(data, &ppg_red, &ppg_ir, &ecg);
> +		if (ret)
> +			break;
> +
> +		j =3D 0;
> +		if (test_bit(MAX86150_IDX_PPG_RED, indio_dev->active_scan_mask))
> +			data->buf[j++] =3D ppg_red;
> +		if (test_bit(MAX86150_IDX_PPG_IR, indio_dev->active_scan_mask))
> +			data->buf[j++] =3D ppg_ir;
> +		if (test_bit(MAX86150_IDX_ECG, indio_dev->active_scan_mask))
> +			data->buf[j++] =3D ecg;
> +
> +		iio_push_to_buffers_with_ts(indio_dev, data->buf,
> +					    sizeof(data->buf), sample_ts);

[Severity: Low]
Does pushing sizeof(data->buf) leak stale sensor data in untouched padding
elements?

If a user enables 3 channels, reads data, then disables the buffer and
restarts it with only 1 channel enabled (e.g., ECG), data->buf is reused.
The IIO core pushes the ECG sample and uses the untouched data->buf[1]
element as padding to align the timestamp, leaking the stale PPG data
from the previous 3-channel scan.

> +	}
> +
> +	return IRQ_HANDLED;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707112714.2261=
727-1-shofiqtest@gmail.com?part=3D2
