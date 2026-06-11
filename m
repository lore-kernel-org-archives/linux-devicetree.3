Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1032D38D3F1
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 22:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781217621; cv=none; b=pEHDUCTFpeczSfJivQPIvxtZXdGMVPKuFQXufxegGmwZc0AJtFr5KjiZ+D75qmaLSE34tTrSTPErIlE9hVU658nkvVYslEJMu02m4L4fLiGRE3Q+c4FVKqFL+cN0qZNetfmV11srlrShBVMGCbCRthIcPdqeAwA/ryVKpiZVL/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781217621; c=relaxed/simple;
	bh=Sn0NCcLk2Eh2/7Y3lYULS+xUTcCkx82KeScPqSZbfjU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dAM8CgTl7wOw3xJ6fnSF9IRhijiyHAWSiV06mYSreVcWIVBrSLXjEZpJsJHdaJuwR0KJS+w8nZjV0RcR2Ib8O9oj5kzcl7MshxYQZOb5dxjdtHCx29TDbyBOuisQ3MQXjUHDGW/Xb6ejFMMPqWtEhGT//c16UhY9towN5efhD+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNN8OJT6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNN8OJT6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2921F000E9;
	Thu, 11 Jun 2026 22:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781217619;
	bh=4mryX8bs9yzIBQ8YtnJ6CjlUa2zH4i5AebZhM2mrBOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mNN8OJT6x7WhSUBZWkILs+XShR6+z08Tgyef+CYkYj8HtX6vbabNXeBdrZtNpkOmM
	 nX6IlvvbCZ+AyoXjIrvV7xJq7Wyt1hn+rEuco1efRCC9vBkkaHmYyzOjaRyJYSeEMw
	 6uHgmmYPFnxZbGSeHkOC5PMuSaIdK3LlTMigrHmZID+b1qCmu/DEoAo15LSfxCSjX+
	 1CM8n4rl3ofi5rv3sxiX0h5BMl59SLw/98lme3yb9Qoay6QlEbIN2nL1N1fi4hEaYN
	 d0ebzv3V46nHi5b6qIqWmpHw+SsfThO+8QM+3ZrwfiqDtQg/AHh/RRS5gUPPfilXhA
	 i+dODyvsEEMPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] iio: adc: versal-sysmon: add threshold event
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611222738.2035062-5-salih.erim@amd.com>
References: <20260611222738.2035062-5-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 22:40:19 +0000
Message-Id: <20260611224019.7C2921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Integer overflow and lack of bounds checking on user-supplied sysf=
s threshold values
- [High] Kernel panic due to sleeping in atomic context when I2C regmap bac=
kend is paired with an interrupt
- [High] Resource leak: Hardware interrupts are not quiesced on driver unbi=
nd, causing unhandled interrupt storms
- [Medium] Race condition between interrupt masking state updates and the d=
elayed worker
- [Medium] ABI Violation: `sysmon_read_event_config` exposes transient hard=
ware masking state instead of persistent software configuration
--

commit 4bd81e58f57baddd1a0af6e02ac6cb6917070ee7
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add threshold event support

This commit adds threshold event support for temperature and supply voltage
channels in the Versal Sysmon driver. It introduces hysteresis alarm mode
for temperature and configurable threshold limits.

diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versal-=
sysmon-core.c
--- a/drivers/iio/adc/versal-sysmon-core.c
+++ b/drivers/iio/adc/versal-sysmon-core.c
@@ -105,6 +232,289 @@ static int sysmon_read_raw(struct iio_dev *indio_dev,
[ ... ]
> +static void sysmon_millicelsius_to_q8p7(u32 *raw_data, int val)
> +{
> +	*raw_data =3D (val << SYSMON_FRACTIONAL_SHIFT) / (int)MILLI;
> +}

[Severity: High]
Does this bitwise shift overflow for large values of val?

If a user writes a very large threshold, val << SYSMON_FRACTIONAL_SHIFT
could overflow. Because there is no bounds checking or 16-bit masking, the
negative value might be sign-extended and write a negative number to a 32-b=
it
hardware register, potentially corrupting adjacent reserved fields.

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
Can val * scale result in an arithmetic overflow here?

If the user supplies a large valid input (e.g. 100,000), multiplying by sca=
le
(which can be up to 65,536) could overflow a 32-bit signed integer. This
would yield a negative result, which is then clamped to 0 below. This would
accidentally set the hardware threshold to 0 and trigger an immediate false
alarm.

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
> +
> +	/* IMR bits are 1=3Dmasked, invert to get 1=3Denabled */
> +	imr =3D ~imr;
> +
> +	switch (chan->type) {
> +	case IIO_VOLTAGE:
> +		config_value =3D sysmon_read_alarm_config(sysmon, chan->address);
> +		if (config_value < 0)
> +			return config_value;
> +		return config_value && (imr & alarm_event_mask);
> +
> +	case IIO_TEMP:
> +		return !!(imr & alarm_event_mask);

[Severity: Medium]
Does returning the raw hardware IMR state violate the IIO ABI?

During a temperature alarm, the interrupt handler masks the event in hardwa=
re,
and a delayed worker polls before unmasking it. If userspace reads the enab=
le
attribute during this polling window, this function returns 0 (disabled)
because the hardware IMR bit is set, even if the event is administratively
configured as enabled.

Should this return the persistent logical state stored in sysmon->temp_mask
instead?

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
> +
> +	switch (chan->type) {
[ ... ]
> +	case IIO_TEMP:
> +		if (state) {
> +			ret =3D regmap_write(sysmon->regmap, SYSMON_IER, ier);
> +			if (ret)
> +				return ret;
> +
> +			scoped_guard(spinlock_irq, &sysmon->irq_lock)
> +				sysmon->temp_mask &=3D ~ier;
> +		} else {
> +			ret =3D regmap_write(sysmon->regmap, SYSMON_IDR, ier);
> +			if (ret)
> +				return ret;
> +
> +			scoped_guard(spinlock_irq, &sysmon->irq_lock)
> +				sysmon->temp_mask |=3D ier;
> +		}

[Severity: Medium]
Is there a race condition between writing the hardware register and updating
the software tracking mask?

Because the hardware register (SYSMON_IDR) is written outside of the
sysmon->irq_lock, a window exists where the hardware is disabled but
sysmon->temp_mask has not yet been updated.

If the sysmon_unmask_worker executes during this window, it will read the
stale sysmon->temp_mask (which still indicates the event is enabled):

drivers/iio/adc/versal-sysmon-core.c:sysmon_unmask_temp() {
    ...
    unmask &=3D ~sysmon->temp_mask;
    regmap_write(sysmon->regmap, SYSMON_IER, unmask);
}

This would cause the worker to mistakenly unmask the interrupt in hardware,
while the software subsequently considers it disabled.

[ ... ]

> +static irqreturn_t sysmon_iio_irq(int irq, void *data)
> +{
> +	struct iio_dev *indio_dev =3D data;
> +	struct sysmon *sysmon =3D iio_priv(indio_dev);
> +	unsigned int isr, imr;
> +
> +	guard(spinlock)(&sysmon->irq_lock);
> +
> +	if (regmap_read(sysmon->regmap, SYSMON_ISR, &isr) ||
> +	    regmap_read(sysmon->regmap, SYSMON_IMR, &imr))
> +		return IRQ_NONE;

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
> +	ret =3D devm_delayed_work_autocancel(dev, &sysmon->sysmon_unmask_work,
> +					   sysmon_unmask_worker);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(sysmon->regmap, SYSMON_IMR, &imr);
> +	if (ret)
> +		return ret;
> +	sysmon->temp_mask =3D imr & SYSMON_TEMP_INTR_MASK;
> +
> +	return devm_request_irq(dev, irq, sysmon_iio_irq, 0, "sysmon-irq", indi=
o_dev);
> +}

[Severity: High]
Could this cause a scheduling while atomic panic if an I2C device node
specifies an interrupt?

The hardirq handler sysmon_iio_irq() acquires a spinlock and then performs a
regmap_read(). If the DT provides an interrupts property for the I2C backen=
d,
the driver registers the hardirq handler because of the check for irq > 0.

Since I2C regmap transactions can sleep, calling regmap_read() inside the
spinlock-protected hardirq handler will crash the system.

Should there be a check for !regmap_might_sleep(sysmon->regmap) before
registering the interrupt handler?

[ ... ]

> @@ -256,6 +908,7 @@ int sysmon_core_probe(struct device *dev, struct regm=
ap *regmap)
>  	ret =3D devm_mutex_init(dev, &sysmon->lock);
>  	if (ret)
>  		return ret;
> +	spin_lock_init(&sysmon->irq_lock);
> =20
>  	/* Disable all interrupts and clear pending status */
>  	ret =3D regmap_write(sysmon->regmap, SYSMON_IDR, SYSMON_INTR_ALL_MASK);
> @@ -265,13 +918,40 @@ int sysmon_core_probe(struct device *dev, struct re=
gmap *regmap)
>  	if (ret)
>  		return ret;
> =20
> +	irq =3D fwnode_irq_get(dev_fwnode(dev), 0);
> +	if (irq =3D=3D -EPROBE_DEFER)
> +		return dev_err_probe(dev, irq, "failed to get IRQ\n");
> +
>  	indio_dev->name =3D "versal-sysmon";
>  	indio_dev->modes =3D INDIO_DIRECT_MODE;
> =20
> -	ret =3D sysmon_parse_fw(indio_dev, dev);
> +	ret =3D sysmon_parse_fw(indio_dev, dev, irq);
>  	if (ret)
>  		return ret;
> =20
> +	if (irq > 0) {
> +		/* Set hysteresis mode for both temperature channels */
> +		ret =3D regmap_set_bits(sysmon->regmap, SYSMON_TEMP_EV_CFG,
> +				      SYSMON_OT_HYST_MASK |
> +				      SYSMON_TEMP_HYST_MASK);
> +		if (ret)
> +			return ret;
> +
> +		/* Initialize cached hysteresis from hardware registers */
> +		ret =3D sysmon_init_hysteresis(sysmon, SYSMON_ADDR_TEMP_EVENT,
> +					     &sysmon->temp_hysteresis);
> +		if (ret)
> +			return ret;
> +		ret =3D sysmon_init_hysteresis(sysmon, SYSMON_ADDR_OT_EVENT,
> +					     &sysmon->ot_hysteresis);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D sysmon_init_interrupt(sysmon, dev, indio_dev, irq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return devm_iio_device_register(dev, indio_dev);
>  }

[Severity: High]
Are hardware interrupts left enabled if the driver is unbound?

While interrupts are quiesced during sysmon_core_probe(), there appears to
be no cleanup callback registered (like a devm_add_action_or_reset) to mask
the interrupts on driver removal.

If userspace enables threshold alarms and the driver is then unbound, the
devm infrastructure will free the IRQ handler, but the device's hardware
interrupts will remain active. This could result in an unhandled interrupt
storm that disables the shared IRQ line.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611222738.2035=
062-1-salih.erim@amd.com?part=3D4
