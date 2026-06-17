Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEC725A655
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 21:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781730075; cv=none; b=TIGltvu5pyxBLOaVPWr+vPAoL2NrLais/ctk5Bs6J6Qjm3FAnFHuaLKA5PoBu4T8mjvqH8KG6wWNKBvzgz+1tjioRyB1BeKBESjza2vMhjCMmtdqXBm2iE6D4SqonHHFl2McYz3bAffESsqhfP4UW1jsJ93dht0UrmN5lx76ai0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781730075; c=relaxed/simple;
	bh=yzIF1tX2gKUSPUBzQyDOcdvDStnIDA+2DBfDzt6awKQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fhuvBTv6jVw5nXiXZRLfU3tEvcKFYmoN/QdqqBH+y6t0Znd2GqiSCETQPhEbrRJvOM/EWOTV4oZaP+/7MECb/52HjpPGD739oIsl85XVTAh+k6tLsWr4kiS0aht1W73Hr2u7op33z5deCNYyu0kSYYD3hJT8d3hI05H/2Smfphc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fcy9pwSh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fcy9pwSh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF40C1F000E9;
	Wed, 17 Jun 2026 21:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781730074;
	bh=8r+s+n8g5pKO8u2BZ5wlzyuaZR+8nRnonTp9Fp26wn8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fcy9pwSh4SU4b6uyHOLSxZgPQh/dZ5xJRhC624ahGLpIz2wN2I15yFe1+NnXihwwu
	 OfoGQPnTRqHj9khk7TKtMquvXE2YBzwPV9pNOM7pdswdSWmRYQ44zWfUtmwlPUKaNk
	 EqVObsfC24hWbUDKD6smHjfiYXB064Gpy+vthGGLfC0uIEI8m9U/mXNaRoY359diOt
	 Vk0HNDjePDAhCKn2TKcs5snTaE3+9aomZeLQb22qv/Moa2r7PGgyEVX/SDrqb5H02J
	 0/CCBuzcZvWQl+ZdcnppsuQ05jZaWiUZIv2xtTTMZ4oy8oS0Z1jIu0TBSPinN7xQ6/
	 1NjI3crJtFHyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/5] iio: adc: versal-sysmon: add threshold event
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617180147.3370346-5-salih.erim@amd.com>
References: <20260617180147.3370346-1-salih.erim@amd.com>
 <20260617180147.3370346-5-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 21:01:13 +0000
Message-Id: <20260617210113.CF40C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Integer Overflow and Missing Bit Masking in Threshold Calculations
- [High] Supply Voltage Threshold Events Permanently Disabled on Trigger
- [High] Kernel Panic from Sleeping in Atomic Context on I2C Devices
- [High] Race Condition Desynchronizes Hardware Interrupt State
--

commit 0d7222f55024a692e00cced200dc17d0764c1060
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add threshold event support

Adds threshold event support for temperature and supply voltage channels.
It uses hysteresis mode for temperature and provides per-channel alarm
enable for supply voltages. The interrupt handler masks active threshold
interrupts and schedules a delayed worker to poll.

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> index e0b9b3d2b6d13..19a8edd89198c 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
[ ... ]
> @@ -52,6 +101,16 @@ static const struct iio_chan_spec temp_channels[] =3D=
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

[Severity: High]
Can this left shift overflow on negative or large sysfs values? Unlike the
voltage path, this function also seems to lack value clamping and a (u16)
bitmask. Since sysmon_write_event_value() writes this raw 32-bit value
directly to SYSMON_TEMP_TH_UP, could it overwrite reserved hardware bits
with sign-extended negative values like 0xFFFFEC00?

> +
>  static void sysmon_supply_rawtoprocessed(int raw_data, int *val)
>  {
>  	int mantissa, format, exponent;
> @@ -69,6 +128,33 @@ static void sysmon_supply_rawtoprocessed(int raw_data=
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

[Severity: High]
Can this 32-bit multiplication overflow on large sysfs inputs? If scale is =
up
to 65536, a large val could cause an integer overflow before the division.

> +
> +	if (format)
> +		tmp =3D clamp(tmp, S16_MIN, S16_MAX);
> +	else
> +		tmp =3D clamp(tmp, 0, U16_MAX);
> +
> +	*raw_data =3D (u16)tmp;
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

[Severity: High]
Is there a race condition here if sysmon_unmask_worker() runs concurrently?
By writing to SYSMON_IDR before acquiring sysmon->irq_lock to update
sysmon->temp_mask, the concurrent worker might read the old temp_mask (where
the bit is still 0/enabled). Could the worker then write to SYSMON_IER in
sysmon_unmask_temp(), effectively re-enabling the interrupt in hardware
immediately after userspace administratively disabled it?

[ ... ]
> +static int sysmon_handle_event(struct iio_dev *indio_dev, u32 event)
> +{
> +	u32 alarm_flag_offset =3D SYSMON_ALARM_FLAG + event * SYSMON_REG_STRIDE;
> +	u32 alarm_reg_offset =3D SYSMON_ALARM_REG + event * SYSMON_REG_STRIDE;
> +	struct sysmon *sysmon =3D iio_priv(indio_dev);
> +	unsigned long alarm_flag_reg;
> +	unsigned int reg_val;
> +	u32 address, bit;
> +	int ret;
> +
> +	switch (event) {
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

[Severity: High]
Does clearing this bit permanently disable the supply voltage hardware alar=
m?
The alarm_reg_offset here points to SYSMON_ALARM_REG, which
sysmon_write_alarm_config() uses as the alarm configuration/enable register.
Since there is no mechanism to re-enable voltage alarms later, does this tu=
rn
continuous threshold events into one-shot events?

> +			if (ret)
> +				return ret;
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

[Severity: High]
Can this cause a "scheduling while atomic" panic on I2C devices?
The driver takes a spinlock with interrupts disabled via spinlock_irq,
but then calls regmap_read() which uses a sleeping mutex on I2C buses.
A similar sequence occurs in the hardirq handler sysmon_iio_irq().

> +		regmap_write(sysmon->regmap, SYSMON_ISR, isr);
> +		sysmon_unmask_temp(sysmon, isr);
> +	}
[ ... ]
> +static int sysmon_init_interrupt(struct sysmon *sysmon,
> +				 struct device *dev,
> +				 struct iio_dev *indio_dev,
> +				 int irq)
> +{
> +	unsigned int imr;
> +	int ret;
> +
> +	/* Events not supported without IRQ (e.g. I2C path) */
> +	if (!irq)
> +		return 0;
> +
> +	INIT_DELAYED_WORK(&sysmon->sysmon_unmask_work, sysmon_unmask_worker);
> +
> +	ret =3D regmap_read(sysmon->regmap, SYSMON_IMR, &imr);
> +	if (ret)
> +		return ret;
> +	sysmon->temp_mask =3D imr & SYSMON_TEMP_INTR_MASK;
> +
> +	ret =3D devm_request_irq(dev, irq, sysmon_iio_irq, 0, "sysmon-irq", ind=
io_dev);

[Severity: High]
Should we verify that the regmap doesn't sleep before requesting the IRQ?
If a user provides an interrupts property for an I2C-connected device in
the Device Tree, it looks like this will register sysmon_iio_irq() as a
hardirq handler and trigger the atomic sleep violations mentioned above.

> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, sysmon_disable_interrupts, sysmon);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617180147.3370=
346-1-salih.erim@amd.com?part=3D4
