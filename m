Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DA238E8B7
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 18:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780944745; cv=none; b=uWf2RETgtibh0Jx0nU+EZ+XRkhtRjkupao7sxd7dz50Oucc73TvSHmKRsLJd0H2e9752na69rr+f1t7WP0WKo+IZ2gLVGys9OSIvSDucZpf4ilDKO1wI8EEv6xhvPEU6qA0FJQ1ug+b7QWM/v5GXDNGi9EL+kfG1WrTRnWYIbrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780944745; c=relaxed/simple;
	bh=qxhb0zuH//40cIHcG/820caQiv2W35L6k+u964tQukA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WJ5XqLSPySu84lXKV7xxZfi9OuaqoQffI0SkWdFvtVyX6NiBK6C/Vh+TmL69KwZcP4wWTePNIQQC1/GheXN6tp+V4xD8U2V3LHA5t54vSgTIbvd+qEOOGS8z6snGRgMsdNYtSvhuXu567CYFDw57bx4AfRXESWRNv8aTk1JxJrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hH9bNo/R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hH9bNo/R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315A51F00893;
	Mon,  8 Jun 2026 18:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780944744;
	bh=PVUIMCDPZWjbf5Qc9sTCcdy9K8VtQ6qXoBA+jRLrlro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hH9bNo/R2U7wv0KRsFF6stntuIUL4WbhGx4XqyoaC0UQOeUewF/qU7fjpzf1512mP
	 yFsSX/9Vdlx4Nl52irOK2KR0+sa2T6zK/zKArzkZZ9I/v1BKXuXknJmGQYkZMxBo/s
	 iZyCuWcr6xZ94OO2gVkvE1zhr6c7lT5ky5+7qOj3tXhEOHjbXX+zoSHJkNpjeIxfV1
	 g9bZ6qLccRI3euE/nkr3P9SiHbvpMfifqjbsV2x5iIJ7EzoYeyNYhmuMSYjah2bJA7
	 Amt/GB2aQjpPKR9OVakOyLlM9xg+AWrH8Ty+4juGSr5Bczel2xD7yXpB2/KsM1H/tW
	 m99XvtgRm9zeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] iio: adc: versal-sysmon: add threshold event
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608183801.1257051-5-salih.erim@amd.com>
References: <20260608183801.1257051-5-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 18:52:23 +0000
Message-Id: <20260608185224.315A51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] The probe function unconditionally fails for devices without an IR=
Q, breaking I2C deployments.
- [High] `sysmon_write_event_value` overwrites the entire threshold registe=
r, incorrectly clearing upper bits.
- [High] The delayed worker blindly clears all pending hardware interrupts =
in the ISR register, causing unmasked hardware events to be permanently los=
t.
- [High] Missing 16-bit mask for negative temperature thresholds writes cor=
rupted data (1s) to upper hardware register bits.
- [Medium] `sysmon_read_event_config` exposes transient internal polling ma=
sk state to userspace instead of the administrative state.
- [Medium] Unbounded user input from sysfs causes signed integer overflow i=
n arithmetic conversions for temperature and voltage thresholds.
- [Medium] A race condition between `sysmon_write_event_config` and `sysmon=
_unmask_worker` can leave a disabled temperature interrupt enabled in hardw=
are.
- [Medium] The driver will cause a 'scheduling while atomic' BUG on the I2C=
 path if an interrupt is erroneously provided in the device tree.
--

commit 2275827bc141241d722cd6abd38d36f5e908731f
Author: Salih Erim <salih.erim@amd.com>
Subject: iio: adc: versal-sysmon: add threshold event support

This patch adds threshold event support for temperature and supply voltage
channels. The driver uses hysteresis mode for temperature and schedules a
delayed worker to poll for condition clear before unmasking.

> The interrupt handler masks active threshold interrupts (which are
> level-sensitive) and schedules a delayed worker to poll for condition
> clear before unmasking. When no hardware IRQ is available, event
> channels are not created and interrupt init is skipped, since the
> I2C regmap backend cannot be called from atomic context.

Does the unconditional check in sysmon_core_probe cause the probe to fail
on I2C devices instead of falling back to polled mode? The code aborts if
fwnode_irq_get returns a negative error code, which contradicts this part
of the commit message.

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> index c7b5eecc93cfb..5fbd509089bbd 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
[ ... ]
> +static void sysmon_millicelsius_to_q8p7(u32 *raw_data, int val)
> +{
> +	*raw_data =3D (val << SYSMON_FRACTIONAL_SHIFT) / (int)MILLI;
> +}

[Severity: Medium]
Could the arithmetic left shift overflow the 32-bit integer for large
user inputs?

[Severity: High]
If the division yields a negative signed integer for sub-zero temperatures,
does this result in an implicitly sign-extended 32-bit value that writes
1s to the upper 16 bits of the hardware register?

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

[Severity: Medium]
Could this multiplication overflow a 32-bit signed integer if userspace
provides a moderately high voltage threshold?

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
> +	if (chan->type =3D=3D IIO_VOLTAGE) {
> +		config_value =3D sysmon_read_alarm_config(sysmon, chan->address);
> +		if (config_value < 0)
> +			return config_value;
> +		return config_value && (imr & alarm_event_mask);
> +	}
> +
> +	return !!(imr & alarm_event_mask);
> +}

[Severity: Medium]
Does this expose the transient internal polling mask state from the
hardware instead of the persistent administrative state? If userspace
reads this during the 500ms delayed worker polling window, could it falsely
report that the interrupt is disabled?

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

[Severity: Medium]
Is there a race condition here if sysmon_unmask_worker runs exactly
between the regmap_write to SYSMON_IDR and the spinlock acquisition?
Could the worker read the old sysmon->temp_mask and incorrectly re-enable
the interrupt in hardware?

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
> +
> +		ret =3D regmap_read(sysmon->regmap, offset, &reg_val);
> +		if (ret)
> +			return ret;
> +
> +		sysmon_supply_processedtoraw(val, reg_val, &raw_val);
> +
> +		return regmap_write(sysmon->regmap, offset, raw_val);
> +	}
> +
> +	return -EINVAL;
> +}

[Severity: High]
Does this overwrite the entire 32-bit threshold register with a
zero-extended 16-bit value? Since sysmon_supply_processedtoraw casts the
result to a u16 before assigning it to the u32 raw_val pointer, does
writing it back directly clear the upper 16 bits of the hardware register?

[ ... ]
> +static void sysmon_unmask_worker(struct work_struct *work)
> +{
> +	struct sysmon *sysmon =3D
> +		container_of(work, struct sysmon, sysmon_unmask_work.work);
> +	unsigned int isr;
> +
> +	/*
> +	 * regmap errors are not checked here because the worker and IRQ
> +	 * handler cannot propagate errors. The MMIO regmap uses fast_io
> +	 * with direct readl/writel which cannot fail.
> +	 */
> +	spin_lock_irq(&sysmon->irq_lock);
> +	regmap_read(sysmon->regmap, SYSMON_ISR, &isr);
> +	regmap_write(sysmon->regmap, SYSMON_ISR, isr);
> +	sysmon_unmask_temp(sysmon, isr);
> +	spin_unlock_irq(&sysmon->irq_lock);

[Severity: High]
Does writing the exact read value back to the write-1-to-clear SYSMON_ISR
register permanently clear all pending hardware interrupts? If a supply
voltage alarm triggers just before this runs, could it be silently dropped
since the worker only processes temperature bits?

[ ... ]
> +static irqreturn_t sysmon_iio_irq(int irq, void *data)
> +{
> +	struct iio_dev *indio_dev =3D data;
> +	struct sysmon *sysmon =3D iio_priv(indio_dev);
> +	unsigned int isr, imr;
> +
> +	guard(spinlock)(&sysmon->irq_lock);
> +
> +	regmap_read(sysmon->regmap, SYSMON_ISR, &isr);

[Severity: Medium]
Will this cause a scheduling while atomic bug on the I2C path if an
interrupt is erroneously provided in the device tree? Since sysmon_core_pro=
be
unconditionally accepts the IRQ, and this handler uses a spinlock while
performing a regmap_read, could the I2C transfer function attempt to take
a mutex in atomic context?

[ ... ]
> @@ -269,13 +904,40 @@ int sysmon_core_probe(struct device *dev, struct re=
gmap *regmap)
>  	if (ret)
>  		return ret;
> =20
> +	irq =3D fwnode_irq_get(dev_fwnode(dev), 0);
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "failed to get IRQ\n");

[Severity: High]
Does this unconditional check cause the probe to fail on I2C devices instead
of falling back to polled mode?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608183801.1257=
051-1-salih.erim@amd.com?part=3D4
