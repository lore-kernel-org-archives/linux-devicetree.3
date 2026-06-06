Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5069463
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 05:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780723884; cv=none; b=npz/wox7PkxiH/SF/T7CaQ8J6xxSPP3wCD7pKEfIdHZuIs/i/qXnh1RJxmyLgsWFcntkb4GC4P/UdcHmcwh4QdgwqEBOuUWepJJlGuHO0oFeA8IGpas48LWjBMnR2ZSUBEMQaIdBhQ3+OhIcTiZNgXb8JLngWri4sTYQjaTJZ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780723884; c=relaxed/simple;
	bh=/GguIEa65SQglCesMVFDBt+gNp8cLmDYjUfCUd2AVU0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TLg7w7Jd9ms1q/MzpVa6Ey3GuJJD7b9S0GuvjUJ9zydYrdG9oylcCxzZsgKV7ffth8SOap/NyfQbduj6issy6j3lNqG2U0nelwAM1VtTxqjvoroQtsSBSMe0l58Xdjql2WxvxZgsVCXry9lazgRa2E/1zfPbhls4Oig5MvjV7BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExxVN2+z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExxVN2+z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335E01F00893;
	Sat,  6 Jun 2026 05:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780723882;
	bh=KeJoIn1WYtblB8I9YmnTtM10jDBCArWKJVyAsLJTfek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ExxVN2+zax/LaoDcdULk/LOs2dRnb24BJt5pyHyyYtvaiDs0xagh730SSr6tLEGaP
	 8WJDDicLvPx9YSqeBd0PtoSukY2wDE8n5yX1QzQtW0GHUhH2XBZfcDlgc1TWMGREHO
	 1Ix8l9+K9c0p7EN4IcN7THNi57694qKHqrz0xj7MznwAtYL2DvI4w3KZ6dH1MbGGzX
	 KvcZ791pO7nRH9VyRr6IlaZUQbYr2/0VRmVihklvsl/Wf3SFaIDs+0Td1BYul4rorz
	 Lxf1MaxiEQObtNaZP3DsIjhh9c6QNXhWk59elcfqM6E2f6F2zfXMvuA5zcxXncM0DR
	 sVh9eIAj/jPGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] iio: adc: versal-sysmon: add threshold event
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260606051707.535281-5-salih.erim@amd.com>
References: <20260606051707.535281-5-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 05:31:21 +0000
Message-Id: <20260606053122.335E01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] `sysmon_unmask_worker` incorrectly clears all pending hardware=
 interrupts, permanently dropping supply voltage alarms.
- [High] Race condition in `sysmon_write_event_config` leaves temperature i=
nterrupts erroneously unmasked.
- [High] Missing bounds checks and incorrect type conversions in threshold =
handlers cause integer overflows and hardware register corruption.
- [High] `sysmon_write_event_value` drops format and mode bits when configu=
ring supply voltage thresholds.
- [High] The hardirq handler and spinlock-protected worker perform regmap o=
perations, causing a kernel panic if an IRQ is provided for an I2C device.
- [High] Early return on `regmap_update_bits` failure leaves the voltage al=
arm flag unacknowledged, risking an interrupt storm.
- [Medium] Temperature threshold and hysteresis events use processed units =
(millicelsius) instead of raw units, breaking the IIO ABI.
- [Medium] The driver ignores `-EPROBE_DEFER` from `fwnode_irq_get()`, sile=
ntly disabling event support instead of deferring probe.
- [Medium] `sysmon_read_event_config` exposes transient hardware state, rep=
orting active temperature events as disabled.
- [Medium] Unconditional scheduling of `sysmon_unmask_work` causes spurious=
 resets of hardware status registers on voltage alarms.
- [Medium] Unprotected read of `sysmon->masked_temp` outside of `irq_lock` =
in `sysmon_unmask_worker` causes a data race.
--

commit f07d82464e4d3d99b4563caeba1d642e1d255768
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add threshold event support

This patch adds threshold event support for temperature and supply voltage
channels in the Versal SysMon driver. It configures hysteresis mode for
temperature and window alarms for voltage, handling interrupts with a delay=
ed
unmask worker.

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> index 72f7da611155e..e87974c641a16 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
[ ... ]
> @@ -57,6 +140,49 @@ static void sysmon_supply_rawtoprocessed(int raw_data=
, int *val)
>  	*val =3D (mantissa * (int)MILLI) >> exponent;
>  }
> =20
> +static void sysmon_millicelsius_to_q8p7(u32 *raw_data, int val)
> +{
> +	*raw_data =3D (val << SYSMON_FRACTIONAL_SHIFT) / (int)MILLI;

[Severity: High]
Does left-shifting a negative val cause undefined behavior here? Also, is it
safe to implicitly cast the result to u32 without a 16-bit mask? This seems
like it would write 1s into the reserved upper 16 bits of the temperature
threshold registers when written to the hardware.

> +}
> +
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
Could this overflow a 32-bit signed integer for large user inputs? For valid
voltages >32V where scale is 65536, tmp might wrap to a negative value and
subsequently be clamped to 0. Would it be better to use 64-bit arithmetic
here?

> +
> +	if (format)
> +		tmp =3D clamp_t(int, tmp, S16_MIN, S16_MAX);
> +	else
> +		tmp =3D clamp_t(int, tmp, 0, U16_MAX);
> +
> +	*raw_data =3D (u16)tmp;

[Severity: High]
Does assigning only the 16-bit mantissa to raw_data discard the upper bits
that represent the hardware formatting and mode configuration? When
sysmon_write_event_value() writes this back to the device, will the format
and mode bits (16-31) be zeroed out and corrupted?

> +}
[ ... ]
> @@ -103,6 +229,275 @@ static int sysmon_read_raw(struct iio_dev *indio_de=
v,
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

[Severity: Medium]
When a temperature threshold fires, the interrupt handler temporarily masks=
 it
via SYSMON_IDR. If userspace checks the event configuration while the alarm=
 is
actively asserting, will this read from SYSMON_IMR erroneously report that =
the
event is disabled? Should it return the administrative configuration from
sysmon->temp_mask instead?

> +	if (ret)
> +		return ret;
[ ... ]
> +static int sysmon_write_event_config(struct iio_dev *indio_dev,
> +				     const struct iio_chan_spec *chan,
> +				     enum iio_event_type type,
> +				     enum iio_event_direction dir,
> +				     bool state)
> +{
[ ... ]
> +	if (chan->type =3D=3D IIO_TEMP) {
> +		if (state) {
> +			ret =3D regmap_write(sysmon->regmap, SYSMON_IER, ier);
> +			if (ret)
> +				return ret;
> +
> +			scoped_guard(spinlock_irq, &sysmon->irq_lock)
> +				sysmon->temp_mask &=3D ~ier;
> +		} else {
> +			ret =3D regmap_write(sysmon->regmap, SYSMON_IDR, ier);

[Severity: High]
Is it possible for a race condition to occur here since the hardware regist=
er
SYSMON_IDR is updated outside the irq_lock? If sysmon_unmask_worker() execu=
tes
before the lock is taken, could it read the old sysmon->temp_mask and rewri=
te
to SYSMON_IER, re-enabling an interrupt that was just disabled?

> +			if (ret)
> +				return ret;
> +
> +			scoped_guard(spinlock_irq, &sysmon->irq_lock)
> +				sysmon->temp_mask |=3D ier;
> +		}
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int sysmon_read_event_value(struct iio_dev *indio_dev,
> +				   const struct iio_chan_spec *chan,
> +				   enum iio_event_type type,
> +				   enum iio_event_direction dir,
> +				   enum iio_event_info info,
> +				   int *val, int *val2)
> +{
[ ... ]
> +		if (info =3D=3D IIO_EV_INFO_VALUE) {
> +			/* Only rising threshold is exposed */
> +			offset =3D sysmon_temp_thresh_offset(chan->address,
> +							   IIO_EV_DIR_RISING);
> +			if (offset < 0)
> +				return offset;
> +
> +			ret =3D regmap_read(sysmon->regmap, offset, &reg_val);
> +			if (ret)
> +				return ret;
> +
> +			sysmon_q8p7_to_millicelsius(reg_val, val);

[Severity: Medium]
Since the temperature channels expose IIO_CHAN_INFO_RAW and
IIO_CHAN_INFO_SCALE, does IIO ABI convention require event values to be
exposed and expected in unscaled (raw) units? This appears to return
processed millicelsius values directly.

> +
> +			return IIO_VAL_INT;
> +		}
[ ... ]
> +static int sysmon_write_event_value(struct iio_dev *indio_dev,
> +				    const struct iio_chan_spec *chan,
> +				    enum iio_event_type type,
> +				    enum iio_event_direction dir,
> +				    enum iio_event_info info,
> +				    int val, int val2)
> +{
[ ... ]
> +		if (info =3D=3D IIO_EV_INFO_VALUE) {
> +			/* Only rising threshold is exposed */
> +			offset =3D sysmon_temp_thresh_offset(chan->address,
> +							   IIO_EV_DIR_RISING);
> +			if (offset < 0)
> +				return offset;
> +
> +			sysmon_millicelsius_to_q8p7(&raw_val, val);

[Severity: Medium]
Similarly, is it correct to expect the user-provided value to be in
millicelsius here rather than raw units?

> +
> +			ret =3D regmap_write(sysmon->regmap, offset, raw_val);
> +			if (ret)
> +				return ret;
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
> +
> +		alarm_flag_reg =3D reg_val;
> +
> +		for_each_set_bit(bit, &alarm_flag_reg,
> +				 SYSMON_ALARM_BITS_PER_REG) {
> +			address =3D bit + (SYSMON_ALARM_BITS_PER_REG * event);
> +			sysmon_push_event(indio_dev, address);
> +			ret =3D regmap_update_bits(sysmon->regmap, alarm_reg_offset, BIT(bit)=
, 0);
> +			if (ret)
> +				return ret;

[Severity: High]
If regmap_update_bits() fails, this returns early and skips the final
regmap_write() that clears the W1C alarm flag register. Because the caller
sysmon_iio_irq() ignores the error and returns IRQ_HANDLED, will the
unacknowledged flag cause an immediate interrupt storm?

> +		}
> +
> +		return regmap_write(sysmon->regmap, alarm_flag_offset, alarm_flag_reg);
> +
> +	default:
> +		return -EINVAL;
> +	}
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

[Severity: Critical]
Does this write back the entire isr value to the W1C SYSMON_ISR register,
unconditionally clearing all pending hardware interrupts? Since the worker
exclusively processes temperature alarms in sysmon_unmask_temp(), will this
permanently drop concurrently firing supply voltage alarms before they can =
be
processed?

> +	sysmon_unmask_temp(sysmon, isr);
> +	spin_unlock_irq(&sysmon->irq_lock);
> +
> +	if (sysmon->masked_temp)

[Severity: Medium]
Is it safe to evaluate sysmon->masked_temp here without holding irq_lock?
Could the interrupt handler concurrently modify this variable, causing a da=
ta
race where the worker reads an old value?

> +		schedule_delayed_work(&sysmon->sysmon_unmask_work,
> +				      msecs_to_jiffies(SYSMON_UNMASK_WORK_DELAY_MS));
> +	else
> +		regmap_write(sysmon->regmap, SYSMON_STATUS_RESET, 1);

[Severity: Medium]
In sysmon_iio_irq(), the worker is scheduled unconditionally upon any event,
including voltage alarms. If a voltage alarm fires, will the worker run 500=
ms
later, see masked_temp is 0, and inadvertently clear the historical min/max
values by writing to SYSMON_STATUS_RESET?

> +}
> +
> +static irqreturn_t sysmon_iio_irq(int irq, void *data)
> +{
> +	struct iio_dev *indio_dev =3D data;
> +	struct sysmon *sysmon =3D iio_priv(indio_dev);
> +	unsigned int isr, imr;
> +
> +	guard(spinlock)(&sysmon->irq_lock);
> +
> +	regmap_read(sysmon->regmap, SYSMON_ISR, &isr);

[Severity: High]
If a device tree legitimately provides an interrupts property for an
I2C-connected SysMon, this executes in hardirq context but calls potentially
sleeping regmap operations. Should this verify if the underlying regmap is
allowed to sleep, or use a threaded IRQ?

> +	regmap_read(sysmon->regmap, SYSMON_IMR, &imr);
[ ... ]
> @@ -249,6 +880,8 @@ int sysmon_core_probe(struct device *dev, struct regm=
ap *regmap)
>  {
[ ... ]
> +	irq =3D fwnode_irq_get(dev_fwnode(dev), 0);
> +	has_irq =3D irq > 0;

[Severity: Medium]
Does this check swallow negative error codes? If fwnode_irq_get() returns
-EPROBE_DEFER because the interrupt controller is not yet ready, this will
silently disable event support instead of deferring the probe. Should it
explicitly check for and propagate -EPROBE_DEFER?

> +
>  	indio_dev->name =3D "versal-sysmon";
>  	indio_dev->modes =3D INDIO_DIRECT_MODE;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606051707.5352=
81-1-salih.erim@amd.com?part=3D4
