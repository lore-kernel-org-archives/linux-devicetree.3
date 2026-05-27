Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5653030C35E
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888697; cv=none; b=WqnWaNyKsC8iK7OytlC6EULcPHHZ8yzqh5/vStWPcPhNen6tcllS30bRHeEdtXDAqXZ6/soS63NBZKTMa8mnKCk/KiQ/3at8bmBXYgNIq6TxpPH9nwmXi70+qe+WmSSJXLcoIdD1IKrsMnich4M599m9tNRVKPjnC2P8sIuYFW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888697; c=relaxed/simple;
	bh=73RxMeluhC5s1PUdhGdqFD5szO23/BYUIf/ApsGO/qQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=exFxjAXq0cq9OnHZ3QV4YrnxTsbVpiqveBhGJ6mZIVmVMBCYYs7qTyWpvXMzygiYW85ZssSU1NW1XEj5/bFS+JmaPS0k55mnLiRc6euxBmZFkHuBmJBPLHAPiTzGe1nCkGwC4cCKom+pYSGpYqqXmGBSq+XS+h/V7dJTB7o3nvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBSULxQQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBSULxQQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1ED11F000E9;
	Wed, 27 May 2026 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779888695;
	bh=OeaK8ue/MczXN2iogTAAV6/+fHbTcK+sWo/H69YvGiA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jBSULxQQEQ0maEmJEVYsvaejbnHVHKkCmcjEalHNfDZgbvFBGhnjG6uuEpa41ug4h
	 bL1FTds6SwKyQbSWpZoRufDqNNKuANLYNd0bOYdYvUCgrPQmv+FyukIfJm5TTKRabB
	 bckzgldUF9oxjI5sUpGEQgwnJVhFx5/JGAg67QEGFew9tMXg/HBCfAvB8ZxXrDbMby
	 wibvNzwWAbc4BfOBTcjKjHj6kazOgYiM+LSniecLD79kKAfrF6EiK8rq0B8QrxrWRF
	 ayUFt1thpBgCSGhrxjs8xADv//C745C2HjWeyZ6RVPeR2blaFw4TC0ZNRRAxm+8RRB
	 p2tEKWfOHRUAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] iio: adc: versal-sysmon: add threshold event
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527114211.174288-5-salih.erim@amd.com>
References: <20260527114211.174288-5-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 13:31:35 +0000
Message-Id: <20260527133135.C1ED11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] Data race and missing synchronization when updating `sysmon->temp_=
mask` and hardware interrupt mask registers.
- [High] Voltage threshold alarms act as one-shot events and become permane=
ntly disabled upon triggering.
- [High] Signed integer overflow in `sysmon_supply_processedtoraw` when sca=
ling unconstrained user-supplied thresholds.
- [High] Unhandled regmap error during voltage alarm processing leads to an=
 IRQ storm.
- [High] `sysmon_millicelsius_to_q8p7()` triggers undefined behavior and wr=
ites sign-extended garbage to reserved upper bits.
- [High] Requesting a hardirq handler for I2C devices will trigger a 'sched=
uling while atomic' kernel panic.
- [High] Lockless read of `sysmon->masked_temp` causes a TOCTOU race, and u=
ndocumented write to `SYSMON_STATUS_RESET` destroys telemetry data.
- [High] Voltage threshold writes clobber the format and mode bits in the h=
ardware register.
- [High] `sysmon_update_temp_lower` is vulnerable to a signed integer under=
flow when calculating the lower threshold.
- [Medium] Reading the event configuration of a temperature channel during =
an active alarm incorrectly returns 0 (disabled).
- [Medium] Device interrupts are not disabled in the hardware during driver=
 teardown.
--

commit bf3f4a0490a50d3240978d97650f909908cd4a27
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add threshold event support

Add threshold event support for temperature and supply voltage channels.

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> index ebe052f69820f..04977c9c8871f 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
[ ... ]
> +static void sysmon_millicelsius_to_q8p7(u32 *raw_data, int val)
> +{
> +	*raw_data =3D (val << SYSMON_FRACTIONAL_SHIFT) / (int)MILLI;
> +}

[Severity: High]
Will left-shifting a negative val cause undefined behavior in C?=20

Additionally, when the division produces a negative integer, does the
implicit cast to u32 sign-extend and set the upper 16 bits to 1? Could
this clobber reserved upper bits when written to the threshold registers?

[ ... ]
> +static void sysmon_supply_processedtoraw(int val, u32 reg_val, u32 *raw_=
data)
> +{
> +	int exponent =3D FIELD_GET(SYSMON_MODE_MASK, reg_val);
> +	int format =3D FIELD_GET(SYSMON_FMT_MASK, reg_val);
> +	int scale, tmp;
> +
> +	scale =3D BIT(SYSMON_SUPPLY_MANTISSA_BITS - exponent);
> +	tmp =3D (val * scale) / (int)MILLI;

[Severity: High]
Can val * scale silently overflow a 32-bit signed integer if userspace
provides a large threshold value (e.g., > 32767)?=20

Would it be safer to use a 64-bit cast here to avoid undefined behavior
before clamping?

[ ... ]
> +static int sysmon_read_event_config(struct iio_dev *indio_dev,
> +				    const struct iio_chan_spec *chan,
> +				    enum iio_event_type type,
> +				    enum iio_event_direction dir)
> +{
> +	u32 alarm_event_mask =3D sysmon_get_event_mask(chan->address);
> +	struct sysmon *sysmon =3D iio_priv(indio_dev);
> +	unsigned int imr;
> +	int config_value;
> +	int ret;
> +
> +	ret =3D regmap_read(sysmon->regmap, SYSMON_IMR, &imr);
> +	if (ret)
> +		return ret;

[Severity: Medium]
When a temperature alarm triggers, the interrupt handler temporarily masks
the interrupt in hardware to prevent an IRQ storm.

If userspace reads the sysfs _en attribute during this period, will it
incorrectly read 0 (disabled) instead of the logical administrative state
of the event?

[ ... ]
> +static int sysmon_write_event_config(struct iio_dev *indio_dev,
> +				     const struct iio_chan_spec *chan,
> +				     enum iio_event_type type,
> +				     enum iio_event_direction dir,
> +				     bool state)
> +{
> +	u32 offset =3D SYSMON_ALARM_OFFSET(chan->address);
> +	u32 ier =3D sysmon_get_event_mask(chan->address);
> +	struct sysmon *sysmon =3D iio_priv(indio_dev);
> +	unsigned int alarm_config;
> +	int ret;
> +
> +	guard(mutex)(&sysmon->lock);
[ ... ]
> +	if (chan->type =3D=3D IIO_TEMP) {
> +		if (state) {
> +			ret =3D regmap_write(sysmon->regmap, SYSMON_IER, ier);
> +			if (ret)
> +				return ret;
> +			sysmon->temp_mask &=3D ~ier;

[Severity: High]
sysmon_write_event_config() updates sysmon->temp_mask and modifies the
hardware interrupt registers while holding sysmon->lock (a mutex).

However, sysmon_unmask_worker() reads sysmon->temp_mask and modifies the
hardware interrupt registers while holding sysmon->irq_lock (a spinlock).

Since these paths use completely different locks, can they execute
concurrently and create a data race that leaves the hardware interrupt
mask permanently out of sync with the software state?

> +		} else {
> +			ret =3D regmap_write(sysmon->regmap, SYSMON_IDR, ier);
> +			if (ret)
> +				return ret;
> +			sysmon->temp_mask |=3D ier;
> +		}
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int sysmon_update_temp_lower(struct sysmon *sysmon, int address)
> +{
> +	unsigned int upper_reg;
> +	int upper_mc, lower_mc, hysteresis;
> +	u32 raw_val;
> +	int upper_off, lower_off, ret;
[ ... ]
> +	ret =3D regmap_read(sysmon->regmap, upper_off, &upper_reg);
> +	if (ret)
> +		return ret;
> +	sysmon_q8p7_to_millicelsius(upper_reg, &upper_mc);
> +
> +	lower_mc =3D upper_mc - hysteresis;

[Severity: High]
If userspace configures an exceptionally large hysteresis value while upper=
_mc
is negative, can this subtraction underflow a 32-bit signed integer?

This might produce a large positive value, making the lower threshold higher
than the upper threshold and breaking the alarm logic.

> +	sysmon_millicelsius_to_q8p7(&raw_val, lower_mc);
> +
> +	return regmap_write(sysmon->regmap, lower_off, raw_val);
> +}
[ ... ]
> +static int sysmon_write_event_value(struct iio_dev *indio_dev,
> +				    const struct iio_chan_spec *chan,
> +				    enum iio_event_type type,
> +				    enum iio_event_direction dir,
> +				    enum iio_event_info info,
> +				    int val, int val2)
> +{
[ ... ]
> +	if (chan->type =3D=3D IIO_VOLTAGE) {
> +		offset =3D sysmon_supply_thresh_offset(chan->address, dir);
> +		if (offset < 0)
> +			return offset;
> +		ret =3D regmap_read(sysmon->regmap, offset, &reg_val);
> +		if (ret)
> +			return ret;
> +		sysmon_supply_processedtoraw(val, reg_val, &raw_val);
> +		return regmap_write(sysmon->regmap, offset, raw_val);

[Severity: High]
sysmon_supply_processedtoraw() zero-extends the 16-bit threshold.

Does calling regmap_write() here overwrite the format and mode bits
(bits 16-18) with 0s? Should this be a regmap_update_bits() call instead
to preserve those configuration bits?

> +	}
> +
> +	return -EINVAL;
> +}
[ ... ]
> +static int sysmon_handle_event(struct iio_dev *indio_dev, u32 event)
> +{
[ ... ]
> +	case SYSMON_BIT_ALARM0:
> +	case SYSMON_BIT_ALARM1:
> +	case SYSMON_BIT_ALARM2:
> +	case SYSMON_BIT_ALARM3:
> +	case SYSMON_BIT_ALARM4:
> +		ret =3D regmap_read(sysmon->regmap, alarm_flag_offset, &reg_val);
> +		if (ret)
> +			return ret;
> +		alarm_flag_reg =3D reg_val;
> +
> +		for_each_set_bit(bit, &alarm_flag_reg,
> +				 SYSMON_ALARM_BITS_PER_REG) {
> +			address =3D bit + (SYSMON_ALARM_BITS_PER_REG * event);
> +			sysmon_push_event(indio_dev, address);
> +			ret =3D regmap_update_bits(sysmon->regmap,
> +						 alarm_reg_offset,
> +						 BIT(bit), 0);

[Severity: High]
When a voltage threshold triggers, the driver clears the corresponding bit
in SYSMON_ALARM_REG to prevent an interrupt storm.

Is there a mechanism to ever re-enable this alarm later? If not, does this
make the voltage threshold alarms act as one-shot events, violating the
continuous nature of IIO events?

> +			if (ret)
> +				return ret;

[Severity: High]
If regmap_update_bits() fails here, the function returns early and skips the
mandatory regmap_write() to alarm_flag_offset that clears the hardware
interrupt status.

Since sysmon_handle_events() ignores the return value and sysmon_iio_irq()
returns IRQ_HANDLED, will this cause the interrupt controller to immediately
re-trigger the handler, resulting in an infinite IRQ storm?

> +		}
> +		ret =3D regmap_write(sysmon->regmap, alarm_flag_offset,
> +				   alarm_flag_reg);
> +		if (ret)
> +			return ret;
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static void sysmon_unmask_worker(struct work_struct *work)
> +{
> +	struct sysmon *sysmon =3D container_of(work, struct sysmon,
> +					     sysmon_unmask_work.work);
> +	unsigned int isr;
> +
> +	spin_lock_irq(&sysmon->irq_lock);
> +	regmap_read(sysmon->regmap, SYSMON_ISR, &isr);
> +	regmap_write(sysmon->regmap, SYSMON_ISR, isr);
> +	sysmon_unmask_temp(sysmon, isr);
> +	spin_unlock_irq(&sysmon->irq_lock);
> +
> +	if (sysmon->masked_temp)
> +		schedule_delayed_work(&sysmon->sysmon_unmask_work,
> +				      msecs_to_jiffies(SYSMON_UNMASK_WORK_DELAY_MS));
> +	else
> +		regmap_write(sysmon->regmap, SYSMON_STATUS_RESET, 1);

[Severity: High]
Is it safe to read sysmon->masked_temp after dropping sysmon->irq_lock?
Could the hardware interrupt handler concurrently update it, leading to a
TOCTOU race?

Additionally, if it evaluates to false, the worker writes to
SYSMON_STATUS_RESET. Doesn't this register clear the hardware Min/Max
status registers (e.g., SYSMON_TEMP_MAX)? Could this permanently destroy
historical telemetry data simply because an alarm cleared?

> +}
[ ... ]
> +static int sysmon_init_interrupt(struct sysmon *sysmon,
> +				 struct device *dev,
> +				 struct iio_dev *indio_dev,
> +				 int irq)
> +{
[ ... ]
> +	return devm_request_irq(dev, irq, sysmon_iio_irq, 0,
> +				"sysmon-irq", indio_dev);

[Severity: High]
The driver unconditionally uses devm_request_irq() to register a hardirq
handler if an interrupt is present in the Device Tree.

If the device is connected via I2C, the hardirq handler will execute
regmap_read() on the I2C regmap, which requires sleeping locks. Will
sleeping inside the hardirq context trigger a scheduling while atomic
kernel panic?

Would it be better to check !regmap_might_sleep() or use
devm_request_threaded_irq() here?

> +}
[ ... ]
>  int sysmon_core_probe(struct device *dev, struct regmap *regmap)
>  {
[ ... ]
> +		ret =3D sysmon_init_interrupt(sysmon, dev, indio_dev, irq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return devm_iio_device_register(dev, indio_dev);

[Severity: Medium]
Does the driver need a teardown hook to physically disable the device's
interrupt generation on module unload?

While devm_request_irq deregisters the kernel handler, the hardware may
continue asserting the physical IRQ line to the interrupt controller,
potentially causing issues if the IRQ is shared.

>  }
>  EXPORT_SYMBOL_GPL(sysmon_core_probe);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527114211.1742=
88-1-salih.erim@amd.com?part=3D4
