Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91FD322A1C
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618260; cv=none; b=CPfbZFq+FEtxWYtkVLJoSwz9E1pmT6oIW0fegaWJK8mydfJVe7Hh1Vjb4kq6wYqDvCcZscUUYsxBj3H13J8lBag9cC1eIqM+6IitGq8w8P7JEjhS8ITIWrl6/X8koNyDU9gZbHpU22bt66ocbwywvLK/tEeWrZVbKKGwi8HwMFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618260; c=relaxed/simple;
	bh=xsMasPG/e37zLs53OtZ9zGEh2Ln3XMShjwgvlSjNy88=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fBYNIBUQ9dIla6Uq8XA3FuvBdrz0wsF2Xbc1kESmMdDnmUH3CR8Mp68EglU9JOKbCqz6X+OJBW4c2z4/PAEQgRtiDP1q0SYwRoeDmKj6a024RtbHTlBLcteqspJozsu47A7O2ACX6x8l7OnHfAtlMZwpE5SyloGsWHfbNRHtuH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nX8QTErA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nX8QTErA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8941F00A3A;
	Tue, 16 Jun 2026 13:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781618257;
	bh=BmoLvwS9imWrZqBL46jSKXlcLBNh5TIQWPqpzDuGhrg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nX8QTErAKWZfZcfPoYP5Za+G4orN8jGlxV9d80N6G5UTzqEJiOQA7ckln8ADzZIAI
	 7NYCct1Su8ZwDUs+ObSOrMX903JChZFvmQGNPK1uZ2PNvSGM0kcap8VijWOn31xXUH
	 MyfHaocBVxfCNzyIpnUYqbI2WbLDoxrktsuvo/nXo0A39CjFtg8n9UrqmV5iFoap0s
	 7pH6na15kuT32pNbzS6RgMlfnQ8u9nw/YPkonw1iyZx0ob2H9ninqieUcZ8r8bYUeb
	 8KKTpdJwIWbOKDn24zYhxsdcUfiIhJ7dFEWpKDREFmHVzWRSPQXTAegEDlEzDwBrsu
	 ySV/WF00X/MPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/5] iio: adc: versal-sysmon: add threshold event
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616131559.3029543-5-salih.erim@amd.com>
References: <20260616131559.3029543-5-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 13:57:36 +0000
Message-Id: <20260616135736.EB8941F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] sysmon_write_event_value overwrites and destroys configuration=
 bits in the supply voltage threshold registers.
- [High] sysmon_unmask_worker silently drops pending supply voltage alarms =
by clearing the entire SYSMON_ISR register.
- [High] Data races in sysmon_write_event_config can permanently disable or=
 unintentionally re-enable temperature interrupts.
- [High] Requesting a hardirq without verifying if the regmap can sleep ris=
ks a kernel panic on I2C topologies.
- [High] Returning early in sysmon_handle_event on regmap failure bypasses =
clearing the hardware interrupt flag, causing an IRQ storm.
- [Medium] Supply voltage threshold alarms permanently self-disable after t=
riggering, violating IIO threshold semantics.
--

commit 7bd7012fa9bf8b5241dc89218a9954a7531d4460
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add threshold event support

Add threshold event support for temperature and supply voltage
channels.

[ ... ]

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> index a1d4a13b72479..8d567f9fa05d7 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
[ ... ]
> @@ -69,6 +127,34 @@ static void sysmon_supply_rawtoprocessed(int raw_data=
, int *val)
>  	*val =3D (mantissa * (int)MILLI) >> exponent;
>  }
> =20
> +static void sysmon_supply_processedtoraw(int val, u32 reg_val, u32 *raw_=
data)
> +{
> +	int exponent =3D FIELD_GET(SYSMON_MODE_MASK, reg_val);
> +	int format =3D FIELD_GET(SYSMON_FMT_MASK, reg_val);
> +	int scale, tmp;
> +
> +	scale =3D BIT(SYSMON_SUPPLY_MANTISSA_BITS - exponent);
> +	tmp =3D (val * scale) / (int)MILLI;
> +
> +	if (format)
> +		tmp =3D clamp(tmp, S16_MIN, S16_MAX);
> +	else
> +		tmp =3D clamp(tmp, 0, U16_MAX);
> +
> +	*raw_data =3D (u16)tmp;

[Severity: Critical]
Is it intended to cast tmp to (u16) here? By assigning this to a u32 pointe=
r,
doesn't it clear the upper 16 bits of the target value?

Since SYSMON_FMT_MASK (bit 16) and SYSMON_MODE_MASK (bits 17-18) are stored
in the upper bits, will writing this back in sysmon_write_event_value() wipe
out the hardware configuration for the threshold?

> +}
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
> +			ret =3D regmap_write(sysmon->regmap, SYSMON_IER, ier);
> +			if (ret)
> +				return ret;
> +
> +			scoped_guard(spinlock_irq, &sysmon->irq_lock)
> +				sysmon->temp_mask &=3D ~ier;

[Severity: High]
Is there a race condition between updating the hardware register and the
software sysmon->temp_mask?

If the sysmon_unmask_worker() runs concurrently before temp_mask is updated,
could it see the event as disabled, write 0 to SYSMON_IER, and clear
masked_temp, permanently disabling the event?

> +		} else {
> +			ret =3D regmap_write(sysmon->regmap, SYSMON_IDR, ier);
> +			if (ret)
> +				return ret;
> +
> +			scoped_guard(spinlock_irq, &sysmon->irq_lock)
> +				sysmon->temp_mask |=3D ier;

[Severity: High]
Similarly, when disabling the event, if the delayed worker runs after
SYSMON_IDR is written but before temp_mask is updated, might it see the old
mask and erroneously write to SYSMON_IER, re-enabling the interrupt?

> +		}
> +		return 0;
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
> +		for_each_set_bit(bit, &alarm_flag_reg, SYSMON_ALARM_BITS_PER_REG) {
> +			address =3D bit + SYSMON_ALARM_BITS_PER_REG * event;
> +			sysmon_push_event(indio_dev, address);
> +			ret =3D regmap_clear_bits(sysmon->regmap, alarm_reg_offset, BIT(bit));

[Severity: Medium]
Does this permanently disable the supply voltage alarm?

The code clears the alarm configuration bit here, but unlike the temperature
alarm, there doesn't seem to be a mechanism to re-arm the event once the
condition clears. Won't this break the expectation that IIO threshold events
remain enabled until explicitly disabled by userspace?

> +			if (ret)
> +				return ret;

[Severity: High]
If regmap_clear_bits() fails here, the early return bypasses the final
regmap_write() to alarm_flag_offset at the end of the function.

Does this mean the hardware interrupt condition is never acknowledged or
cleared? Could this leave the IRQ line asserted and cause an interrupt stor=
m?

> +		}
> +
> +		return regmap_write(sysmon->regmap, alarm_flag_offset, alarm_flag_reg);
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
> +		regmap_write(sysmon->regmap, SYSMON_ISR, isr);
> +		sysmon_unmask_temp(sysmon, isr);
> +	}

[Severity: High]
Could this clear pending supply voltage alarms without handling them?

Since SYSMON_ISR is a write-1-to-clear register, if we read the full isr
and write it back unmodified, wouldn't it acknowledge and clear all pending
interrupts?

If a supply voltage alarm triggered concurrently, it seems its hardware flag
would be cleared but the software would ignore it, since the worker only
processes temperature alarms.

> +
> +	if (sysmon->masked_temp)
> +		schedule_delayed_work(&sysmon->sysmon_unmask_work,
> +				      msecs_to_jiffies(SYSMON_UNMASK_WORK_DELAY_MS));
> +	else
> +		regmap_write(sysmon->regmap, SYSMON_STATUS_RESET, 1);
> +}
[ ... ]
> +static int sysmon_init_interrupt(struct sysmon *sysmon,
> +				 struct device *dev,
> +				 struct iio_dev *indio_dev,
> +				 int irq)
> +{
[ ... ]
> +	ret =3D devm_request_irq(dev, irq, sysmon_iio_irq, 0, "sysmon-irq", ind=
io_dev);

[Severity: High]
Does this need to check if the underlying regmap can sleep before requesting
a hardirq?

If an I2C device node validly specifies an interrupt line, sysmon_iio_irq()
will call regmap_read() in an atomic context. Since I2C transfers require
taking a mutex, wouldn't this sleep in atomic context and trigger a panic?

Should we check regmap_might_sleep() before initializing interrupts?

> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, sysmon_disable_interrupts, sysmon);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616131559.3029=
543-1-salih.erim@amd.com?part=3D4
