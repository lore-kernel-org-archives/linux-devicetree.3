Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5FC25B090
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 02:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782180921; cv=none; b=VCvrgG2pu7kxmqaR+4MQSF4ZAGhbNvZUfx1npsWLkMOBHRiu6nKj52UrEwEhTFn81xUM8F7zK3rOpsHHV2WbkBf9ZZbGpU3ftvUDq4pN9ECHUHhjwSBalXFi6uS5pKNb4VY+dXEPn8EgHTFDYLxOlVd16ugUDOdAIdCTgI7fJP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782180921; c=relaxed/simple;
	bh=pf7Z2tUth52+dc+SF4+iCJ3s11QlaeNcJsCKzfJAqis=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HgLn0nhsqybmSaZbb5eKcMLiYYRiW/+kQbUjPkzFjFOdUSsYXThfg8iyMqD8df4d8kfZylaFwlTev3Xc9lNxrKaPaxsfLFcnMG21GX0pvAtv1AkQUzSI2kwqQl8lnVNmTEV3JBntPtK1kD/jXSOGvMxVAdJ8QOmsSd9nB+MDXlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6obv/ma; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6obv/ma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6210A1F000E9;
	Tue, 23 Jun 2026 02:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782180919;
	bh=xE9zrFatWtFZJ0TRYRzWgkKGHPTNg1iwb+VxGan/nW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T6obv/makV9jf71tchxUYY3vxO8QwSYJZqnwF5pAGt8629XfHOw3YbbG5uvCj8c00
	 Qaqgt9VYkbWGBGw3Bj57v0ZYkYgRYABEmGvCcizcH9+k0IQ+X9Ot0jUl9Hl3EpNOM6
	 bthEaDO53PyWQQBpQw/LaXGijZAWPQtnvNsJ9xLTLKnnwa6pCDNvnJqiKY2jO4Qzk7
	 whfsEHfjCMGiWsXLel6oQkbvkdZPVeIQY2yeONYmN42m+cHHQGLTytiNWPH460iweT
	 Q/7tm97yN7ansDwq6Hszz/WPUQ6yWz6nMiz4YHORnlGExxSaIr0kjPt3gD33ZD8wpz
	 Kwn9WLV9XithQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 4/5] iio: adc: versal-sysmon: add threshold event
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260623014036.3865402-5-salih.erim@amd.com>
References: <20260623014036.3865402-1-salih.erim@amd.com>
 <20260623014036.3865402-5-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 02:15:19 +0000
Message-Id: <20260623021519.6210A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Use-After-Free due to flawed devres initialization order for the d=
elayed worker.
- [High] Error paths in the IRQ handler skip clearing hardware flags but un=
conditionally return IRQ_HANDLED, causing a hard lockup.
- [High] The delayed worker inadvertently clears all pending interrupts fro=
m the hardware, causing unrelated events like voltage alarms to be permanen=
tly lost.
- [Medium] Atomic context violation causes a kernel panic if the device tre=
e configures an IRQ for an I2C device.
- [Medium] Negative temperatures invoke undefined left-shift behavior and a=
re not masked to 16 bits, causing 0xFFFFxxxx to be written to the threshold=
 registers.
- [Medium] Race condition between sysfs event disable and the unmask worker=
 re-enables disabled interrupts, causing spurious events.
- [Medium] Cached hysteresis value is not reverted if the hardware threshol=
d write fails.
--

commit c435c4c9fc09d3cf9f148b3e41fd576f78414383
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add threshold event support

Add threshold event support for temperature and supply voltage channels.
Temperature uses hysteresis mode while voltage uses window mode. It sets
up interrupt handlers and a delayed worker to poll for condition clear.

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
[ ... ]
> @@ -52,6 +102,16 @@ static const struct iio_chan_spec temp_channels[] =3D=
 {
>  	SYSMON_CHAN_TEMP(3, SYSMON_TEMP_MIN_MIN, "min_min"),
>  };
> =20
> +static void sysmon_q8p7_to_millicelsius(s16 raw_data, int *val)
> +{
> +	*val =3D (raw_data * MILLIDEGREE_PER_DEGREE) >> SYSMON_FRACTIONAL_SHIFT;
> +}
> +
> +static void sysmon_millicelsius_to_q8p7(u32 *raw_data, int val)
> +{
> +	*raw_data =3D (val << SYSMON_FRACTIONAL_SHIFT) / MILLIDEGREE_PER_DEGREE;
> +}

[Severity: Medium]
Does this cause undefined behavior and corrupt hardware registers for negat=
ive
temperatures?=20

If val is a negative temperature, the division yields a negative integer.
Assigning this to the u32 pointer raw_data will sign-extend it, filling the
upper 16 bits with 1s. Unlike the voltage path which explicitly casts to
(u16), this value is written directly to the SYSMON_TEMP_TH_UP and
SYSMON_TEMP_TH_LOW registers later in sysmon_write_event_value(), which
might corrupt reserved or mode configuration fields in the hardware.

[ ... ]
> +static int sysmon_write_event_config(struct iio_dev *indio_dev,
> +				     const struct iio_chan_spec *chan,
> +				     enum iio_event_type type,
> +				     enum iio_event_direction dir,
> +				     bool state)
> +{
[ ... ]
> +	case IIO_TEMP:
> +		if (state) {
> +			ret =3D regmap_write(sysmon->regmap, SYSMON_IER, mask);
> +			if (ret)
> +				return ret;
> +
> +			scoped_guard(spinlock_irq, &sysmon->irq_lock)
> +				sysmon->temp_mask &=3D ~mask;
> +		} else {
> +			ret =3D regmap_write(sysmon->regmap, SYSMON_IDR, mask);
> +			if (ret)
> +				return ret;
> +
> +			scoped_guard(spinlock_irq, &sysmon->irq_lock)
> +				sysmon->temp_mask |=3D mask;
> +		}
> +		return 0;

[Severity: Medium]
Is there a race condition here with sysmon_unmask_worker() that could lead =
to
spurious events?

If sysmon_unmask_worker() runs concurrently during the disable path, it
could acquire irq_lock right after SYSMON_IDR is written but before
sysmon->temp_mask is updated. The worker would read the old temp_mask
(indicating the event is still enabled) and write to SYSMON_IER,
re-enabling the interrupt in hardware. Once the worker releases the lock,
this sysfs thread completes the update, leaving the software state as
disabled but the hardware actively armed.

[ ... ]
> +static int sysmon_write_event_value(struct iio_dev *indio_dev,
> +				    const struct iio_chan_spec *chan,
> +				    enum iio_event_type type,
> +				    enum iio_event_direction dir,
> +				    enum iio_event_info info,
> +				    int val, int val2)
> +{
[ ... ]
> +	case IIO_TEMP:
> +		switch (info) {
[ ... ]
> +		case IIO_EV_INFO_HYSTERESIS:
> +			if (val < 0)
> +				return -EINVAL;
> +
> +			sysmon->temp_hysteresis =3D val;
> +
> +			return sysmon_update_temp_lower(sysmon);

[Severity: Medium]
Does this leave the cached hysteresis out of sync with hardware if the write
fails?

If sysmon_update_temp_lower() fails to write to the hardware register and
returns an error, sysmon->temp_hysteresis retains the new value. Future
writes to the upper threshold will use this corrupted cached value to
recompute and overwrite the lower threshold register.

[ ... ]
> +static int sysmon_handle_event(struct iio_dev *indio_dev, u32 event)
> +{
[ ... ]
> +	switch (event) {
> +	case SYSMON_BIT_TEMP:
> +		sysmon_push_event(indio_dev, SYSMON_TEMP_MAX);
> +
> +		ret =3D regmap_write(sysmon->regmap, SYSMON_IDR, BIT(SYSMON_BIT_TEMP));
> +		if (ret)
> +			return ret;

[Severity: High]
If this regmap_write() fails, does this cause an unrecoverable interrupt st=
orm?

If we return an error early, the level-sensitive hardware interrupt remains
asserted because it was not masked or cleared. The caller, sysmon_iio_irq(),
ignores this error and returns IRQ_HANDLED, bypassing the core spurious
interrupt detector. The still-asserted hardware interrupt will immediately
re-trigger the handler, creating a hard lockup.

[ ... ]
> +static void sysmon_unmask_worker(struct work_struct *work)
> +{
> +	struct sysmon *sysmon =3D
> +		container_of(work, struct sysmon, sysmon_unmask_work.work);
> +	unsigned int isr;
> +
> +	/*
> +	 * If the ISR read fails, skip processing to avoid acting
> +	 * on undefined data.
> +	 */
> +	scoped_guard(spinlock_irq, &sysmon->irq_lock) {
> +		if (regmap_read(sysmon->regmap, SYSMON_ISR, &isr))
> +			break;

[Severity: Medium]
Will this trigger a 'scheduling while atomic' panic if the regmap is backed
by I2C?

The code acquires a spinlock with IRQs disabled and then calls regmap_read(=
).
If fwnode_irq_get() succeeds for an I2C device, the regmap relies on a mutex
and will attempt to sleep, which isn't allowed while holding a spinlock. The
same issue appears in sysmon_iio_irq(), which executes in hardirq context
and blindly requests a hardirq regardless of regmap sleepability.

> +		regmap_write(sysmon->regmap, SYSMON_ISR, isr);

[Severity: High]
Does this unconditionally clear all pending interrupts from the hardware,
causing unrelated events to be permanently lost?

SYSMON_ISR is a Write-1-to-Clear register. If a voltage alarm (like
SYSMON_BIT_ALARM0) fires and is set in SYSMON_ISR right before this worker
reads the register, writing it back will clear the alarm. Since
sysmon_unmask_temp() strictly ignores all bits except the temperature mask,
the voltage alarm is permanently discarded without generating an IIO event.

> +		sysmon_unmask_temp(sysmon, isr);
> +	}
> +
> +	if (sysmon->masked_temp)
> +		schedule_delayed_work(&sysmon->sysmon_unmask_work,
> +				      msecs_to_jiffies(SYSMON_UNMASK_WORK_DELAY_MS));
> +	else
> +		regmap_write(sysmon->regmap, SYSMON_STATUS_RESET, 1);
> +}
> +
> +static irqreturn_t sysmon_iio_irq(int irq, void *data)
> +{
[ ... ]
> +	sysmon_handle_events(indio_dev, isr);
> +	schedule_delayed_work(&sysmon->sysmon_unmask_work,
> +			      msecs_to_jiffies(SYSMON_UNMASK_WORK_DELAY_MS));
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
Since the return value of sysmon_handle_events() is ignored, will we always
return IRQ_HANDLED even if we failed to clear the hardware interrupt condit=
ion?

As mentioned above, if sysmon_handle_events() encounters an error masking
the interrupt, returning IRQ_HANDLED perpetually hides the issue from the I=
RQ
subsystem, leading to an interrupt storm.

[ ... ]
> +static int sysmon_init_interrupt(struct sysmon *sysmon,
> +				 struct device *dev,
> +				 struct iio_dev *indio_dev,
> +				 int irq)
> +{
[ ... ]
> +	INIT_DELAYED_WORK(&sysmon->sysmon_unmask_work, sysmon_unmask_worker);
> +
> +	ret =3D regmap_read(sysmon->regmap, SYSMON_IMR, &imr);
> +	if (ret)
> +		return ret;
> +	sysmon->temp_mask =3D imr & SYSMON_TEMP_INTR_MASK;
> +
> +	ret =3D devm_request_irq(dev, irq, sysmon_iio_irq, 0, "sysmon-irq", ind=
io_dev);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, sysmon_disable_interrupts, sysmon);
> +}

[Severity: High]
Does this devres initialization order cause a Use-After-Free during teardow=
n?

devres cleans up resources in reverse order (LIFO). Because
devm_add_action_or_reset() is called after devm_request_irq(),
sysmon_disable_interrupts() will execute first. It calls
cancel_delayed_work_sync(), but the IRQ handler is still active.

If an interrupt fires concurrently or is already in-flight, sysmon_iio_irq()
can unconditionally call schedule_delayed_work(), placing the work back on
the queue.

When the IRQ is subsequently freed and the sysmon memory is released, the
delayed worker will execute on freed memory 500ms later.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623014036.3865=
402-1-salih.erim@amd.com?part=3D4
