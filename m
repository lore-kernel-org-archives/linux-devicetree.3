Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5707327C09
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 16:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782233880; cv=none; b=j4n8LuaXvdHyXQXnHNzGymNXUzMKkd8p99D7+bQHsGBUxKvxWb4HLCxEmVhahZc0TuuEFuQ6x4VXgiyQTA1TJbHpI7Ca4/UCo1VLPYMGOgz4j9geWO1NYtXPMHRXK/nVmRkp50y3VpR50CRkWtT0bi/JrRoUMBKHLRu5agUPLUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782233880; c=relaxed/simple;
	bh=9EfJkuQoOllkpySvdKEB8mDxFbd3DflqP/P4x17+ktQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HERxBPa2kSOAKSctE/z3ykluxVQv1ctWmfweqL4G/KqExg64bOS2sb6UvIPc6zCC6YyRIxuU2tSYJRIRPerI0mxtxcd8x/dk0HB4OFXEGp2a81v5zFpGxvSxKNGZQdCrLgZEBQtVPV/26CxSyrZfS2MVL9DAIfWphGsVGjvaF4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTumqo+B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTumqo+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177241F000E9;
	Tue, 23 Jun 2026 16:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782233879;
	bh=sdrLEzEtRVqoBdKSXzqghFxXbk+mPbpR6TAKb25Hulw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GTumqo+BEuY0ibxAtXBEN1pdoP0eW+laq5M1yMOf9JoVAMcKruFmdSZJcexhIoMau
	 TzcuSYIzKl9nG0ITRmZaWjpzvt4Z32GJspN+EWM183VpqeaUm20IwKjt8DpTCXfWBm
	 3uWc7Qp9rDkTgajlEoV3637tTZU87jxm6JTBaPaHtxe+QrAT62u3TyISPnEPnkvykZ
	 LA41HoSWMf03hb30cVT4MLgP/dVufVK4YSsbhyuVvtdGJEHgJHfVNBKyXeMXUqkMYV
	 xrkgNhx/3L7XX1K2bdKaFtXkwc3F1msXIwrfMx19zPb4NH/05dsvcdxvEuAM4CkMsa
	 RB/jSwfZXzLeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] iio: health: add MAX86150 ECG and PPG biosensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260623164309.16452-3-shofiqtest@gmail.com>
References: <20260623140113.12574-1-shofiqtest@gmail.com>
 <20260623164309.16452-1-shofiqtest@gmail.com>
 <20260623164309.16452-3-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 16:57:58 +0000
Message-Id: <20260623165759.177241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Probe fails unconditionally when optional regulators are absent.
- [High] The `fifo_raw` buffer is not cacheline aligned, violating DMA API =
rules and risking memory corruption.
- [High] FIFO pointer math cannot distinguish an empty FIFO from an exactly=
 full FIFO, permanently stalling capture.
- [High] Trigger reference leak on error path if triggered buffer setup fai=
ls.
- [High] The biosensor is fully powered on and pulsing its LEDs continuousl=
y while the driver is bound, causing excessive power drain.
- [Medium] The driver hardcodes `IRQF_TRIGGER_FALLING`, overriding the devi=
ce tree interrupt configuration.
- [Medium] The driver lacks a `validate_trigger` callback, allowing incompa=
tible external software triggers to corrupt FIFO reads.
- [Medium] Per-sample timestamps are incorrectly reconstructed backwards fr=
om the most recent sample, introducing load-dependent jitter.
--

commit b7b1aa92d36a3970970aa6f40becae60ad1ec8c5
Author: Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: iio: health: add MAX86150 ECG and PPG biosensor driver

This commit adds an I2C driver for the MAX86150 ECG and PPG biosensor,
exposing three IIO channels. It includes a hardware FIFO triggered buffer
path and devm regulator support.

> diff --git a/drivers/iio/health/max86150.c b/drivers/iio/health/max86150.c
> --- /dev/null
> +++ b/drivers/iio/health/max86150.c
> @@ -113,8 +113,8 @@ struct max86150_data {
>  	struct regmap		*regmap;
>  	struct device		*dev;
>  	struct iio_trigger	*trig;
>  	u32			 sample_period_ns;
>  	u8			 fifo_raw[MAX86150_SAMPLE_BYTES];
>  	s32 buf[6] __aligned(8);
>  };

[Severity: High]
Does this struct layout risk memory corruption during DMA burst reads?

Since data->fifo_raw is passed to regmap_noinc_read(), which may perform DMA
burst transfers on certain I2C host controllers, it lacks cacheline alignme=
nt.

If the CPU flushes dirty cache lines encompassing the adjacent buf during t=
he
DMA transfer, wouldn't the flush clobber the incoming DMA data? Could we add
__aligned(IIO_DMA_MINALIGN) to fifo_raw?

[ ... ]

> @@ -286,4 +286,4 @@ static int max86150_read_raw(struct iio_dev *indio_de=
v,
>  static const struct iio_info max86150_iio_info =3D {
>  	.read_raw =3D max86150_read_raw,
>  };

[Severity: Medium]
Should max86150_iio_info implement a validate_trigger callback?

This device relies on its hardware FIFO being correctly flushed and configu=
red
only when its own hardware trigger is enabled via .set_trigger_state. Witho=
ut
a validate_trigger check like iio_validate_own_trigger, userspace could bind
arbitrary software triggers (like sysfs or hrtimer).

If an external trigger is used, .set_trigger_state is bypassed, the hardware
interrupt is never enabled, and wouldn't the driver blindly read unaligned,
duplicated, or stale samples from the continuously running FIFO?

[ ... ]

> @@ -375,6 +375,6 @@ static irqreturn_t max86150_trigger_handler(int irq, =
void *p)
>  	if (ovf > 0)
>  		n_avail =3D MAX86150_FIFO_DEPTH;
>  	else
>  		n_avail =3D (wr_ptr - rd_ptr) & (MAX86150_FIFO_DEPTH - 1);

[Severity: High]
Does this logic correctly handle an exactly full FIFO?

If the FIFO reaches exactly 32 samples (completely full) but has not yet
overflowed (ovf =3D=3D 0), wr_ptr will wrap and equal rd_ptr. This calculat=
ion
evaluates to n_avail =3D 0, causing the driver to skip reading any samples.

Because the interrupt is configured as edge-triggered, the line won't assert
again until the FIFO drops below the almost-full threshold. Will this
permanently stall the triggered buffer capture?

> @@ -387,4 +387,4 @@ static irqreturn_t max86150_trigger_handler(int irq, =
void *p)
>  	for (i =3D 0; i < n_avail; i++) {
>  		s64 ts =3D pf->timestamp -
>  			 (s64)(n_avail - 1 - i) * data->sample_period_ns;

[Severity: Medium]
Are the per-sample timestamps aligned correctly?

iio_pollfunc_store_time() records the interrupt capture time in pf->timesta=
mp
when the FIFO hits the almost-full watermark (17 samples). If the threaded
IRQ handler is delayed by system load, additional samples may accumulate.

This loop assigns pf->timestamp to the newest sample (i =3D n_avail - 1)
instead of the watermark sample, backdating the rest. Doesn't this variable
scheduling latency shift all timestamps backwards and corrupt their regular
spacing?

[ ... ]

> @@ -441,7 +441,7 @@ static int max86150_chip_init(struct max86150_data *d=
ata)
> =20
>  	/* PPG: 100 Hz sample rate, 16384 nA ADC full-scale range */
>  	ret =3D regmap_write(data->regmap, MAX86150_REG_PPG_CONFIG1,
>  			   FIELD_PREP(MAX86150_PPG_ADC_RGE,
>  				      MAX86150_PPG_ADC_RGE_16384) |
>  			   FIELD_PREP(MAX86150_PPG_SR,
>  				      MAX86150_PPG_SR_100HZ));

[Severity: High]
Is the biosensor intentionally left continuously powered on?

Because the driver doesn't implement IIO buffer setup_ops (e.g., preenable
and postdisable) or Runtime PM, the hardware remains active permanently aft=
er
initialization.

Won't the optical LEDs continuously pulse at 100 Hz (drawing ~50 mA) even
when no userspace process is capturing data?

[ ... ]

> @@ -528,10 +528,10 @@ static int max86150_probe(struct i2c_client *client)
>  	 * DT regulator node.
>  	 */
>  	ret =3D devm_regulator_get_enable_optional(&client->dev, "vdd");
>  	if (ret)
>  		return dev_err_probe(&client->dev, ret,
>  				     "Failed to get/enable vdd supply\n");
> =20
>  	ret =3D devm_regulator_get_enable_optional(&client->dev, "leds");
>  	if (ret)
>  		return dev_err_probe(&client->dev, ret,
>  				     "Failed to get/enable leds supply\n");

[Severity: High]
Does the driver fail to probe on valid configurations without regulators?

If a board supplies power via fixed rails and omits the DT regulator nodes,
devm_regulator_get_enable_optional() correctly returns -ENODEV.

By directly forwarding ret to dev_err_probe() and aborting, doesn't this
prevent the driver from binding on hardware that intentionally omits these
optional regulators?

[ ... ]

> @@ -575,6 +575,6 @@ static int max86150_probe(struct i2c_client *client)
>  		ret =3D devm_request_irq(&client->dev, client->irq,
>  				       iio_trigger_generic_data_rdy_poll,
>  				       IRQF_TRIGGER_FALLING,
>  				       "max86150", data->trig);

[Severity: Medium]
Is it safe to hardcode IRQF_TRIGGER_FALLING here?

Statically setting the IRQF_TRIGGER_FALLING flag overrides any trigger type
specified by the firmware in the device tree's interrupts property.

Will this break compatibility with board layouts that use an inverter or
level-shifter on the interrupt line? Should it pass 0 or IRQF_ONESHOT
instead to allow the core to apply the DT-defined polarity?

[ ... ]

> @@ -602,8 +602,8 @@ static int max86150_probe(struct i2c_client *client)
>  		 * the iio_dev is freed.  No additional devm action needed.
>  		 */
>  		indio_dev->trig =3D iio_trigger_get(data->trig);
>  	}
> =20
>  	ret =3D devm_iio_triggered_buffer_setup(&client->dev, indio_dev,
>  					      iio_pollfunc_store_time,
>  					      max86150_trigger_handler,
>  					      NULL);

[Severity: High]
Is there a trigger reference leak if the buffer setup fails?

iio_trigger_get() increments the default trigger's reference count. The IIO
core only balances this in iio_dev_release() if the INDIO_ALL_TRIGGERED_MOD=
ES
mask flag is set in indio_dev->modes.

Since this flag is set inside devm_iio_triggered_buffer_setup(), if the
buffer setup fails, the flag is never set. Consequently, the devm cleanup p=
ath
will skip iio_device_unregister_trigger_consumer(). Doesn't this permanently
leak the trigger device memory and its module reference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623164309.1645=
2-1-shofiqtest@gmail.com?part=3D2
