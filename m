Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367742472B6
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781480940; cv=none; b=ZtvwTgtD98xQdIG8p/nXUgtx+okkmEIiIJmRZkj9qgsdlNojldzfkmHAdzbcwCl4WCHBr7GU/I5AzWU3XXBrQi08L+aE1LINqQFSpj6XAOc2Fg4xCxmWNo+uW6WIMye8JtuKgmAukkPKG3CK6LPaxLXh8oLXY6jAtgROHFryn6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781480940; c=relaxed/simple;
	bh=LwWN83DS6BbbLbfB+zxhh1txoXyI5J30xLq/eeFhweE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P5qNARw8E3Oe4Wm83Ln2Ku1Ivwhh+m5Up7zIMNl1QBZNQXIcCSeMqitvFgtyRMimdkEEDeCN9OafCmw+mGCPTspVA4SS5wrrEZd3xVmPFIJnq93VlvGc/LxhQa1YSGv9lRnQISZgotpVjLXPdBqm8T/HX81PD4/LazmGAXs8wLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGGKPTEW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGGKPTEW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67261F000E9;
	Sun, 14 Jun 2026 23:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781480939;
	bh=HwahtrIYFYzKqugaWL56CI73lxnulxopgI7chTnsaho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bGGKPTEWgbk+X/FA8FfVb/A5bg4MOSIGxVb6wCRDv1oYW/KamWsTmAh7/zOC/dE5q
	 O/RmsEHtLDMX0eiNlyyVpDYTR3lsrNIgZKuBr0I0HbQZNzE6aaD0WBXW9UQbJX8hsd
	 7kh7gj/B+YAHA8B24NRhXsD5vmzREDbrHJ9+db9qnFvL2GPq4ffLQr+LBP+ejaD9Me
	 s+f9UzZYfnCMamt2dQ9ZPCMLXif/kDP9F+w7Ydm50HT7w5il/nuRPxxWuY+SPeQBa0
	 HtF8c38hCVWQHiqTK9B5qiM9qjkqL2adlJseBatlrnck0ZX1dbyMxIoRTaaCGWwa50
	 gNZ05fAwcEI5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/5] iio: adc: versal-sysmon: add threshold event
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260614233722.2603459-5-salih.erim@amd.com>
References: <20260614233722.2603459-5-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Jun 2026 23:48:58 +0000
Message-Id: <20260614234858.D67261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Incorrect devm teardown sequence allows the delayed worker to re-e=
nable hardware interrupts after the IRQ handler is freed, causing an unhand=
led interrupt storm.
- [High] Writing a supply voltage threshold replaces the entire hardware re=
gister with the 16-bit mantissa, silently clearing the channel's format and=
 mode bits.
- [High] Voltage threshold events are silently disabled in hardware after t=
hey fire, making them unexpectedly one-shot.
- [Medium] Unbounded sysfs threshold values cause signed integer overflows =
and undefined behavior during conversion.
- [Medium] Converting negative temperature thresholds writes 1s to the rese=
rved upper 16 bits of the hardware threshold registers.
--

commit 4db3b58bd3561251c48f5d1c527c846b332e37fd
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add threshold event support

This commit adds threshold event support for temperature and supply voltage
channels in the versal-sysmon driver. It enables rising thresholds and
hysteresis for temperature channels, and rising/falling thresholds for supp=
ly
voltage channels. It also sets up interrupt handling, including a delayed
worker for polling and re-arming temperature events.

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> index 5b7439e443fca..16feb373bc704 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
[ ... ]
> @@ -51,6 +100,16 @@ static const struct iio_chan_spec temp_channels[] =3D=
 {
>  	SYSMON_CHAN_TEMP(3, SYSMON_TEMP_MIN_MIN, "min_min"),
>  };
> =20
> +static void sysmon_q8p7_to_millicelsius(s16 raw_data, int *val)
> +{
> +	*val =3D (raw_data * (int)MILLI) >> SYSMON_FRACTIONAL_SHIFT;
> +}
> +
> +static void sysmon_millicelsius_to_q8p7(u32 *raw_data, int val)
> +{
> +	*raw_data =3D (val << SYSMON_FRACTIONAL_SHIFT) / (int)MILLI;

[Severity: Medium]
Will this 32-bit left shift overflow for large sysfs input values?

Since val is a 32-bit signed integer, an overflow could lead to undefined
behavior during the conversion. Is a cast to a 64-bit integer needed before
the arithmetic operation?

[Severity: Medium]
If a negative temperature threshold is provided, does this calculation
sign-extend the negative integer and write 1s to the upper 16 bits?

The negative 32-bit integer is stored in the u32 pointer. Later in
sysmon_write_event_value(), this unmasked value is written directly to the
threshold register:

sysmon_write_event_value() {
    ...
    sysmon_millicelsius_to_q8p7(&raw_val, val);
    ret =3D regmap_write(sysmon->regmap, SYSMON_TEMP_TH_UP, raw_val);
    ...
}

Could this overwrite reserved hardware fields or adjacent configuration bits
in the upper 16 bits of the register?

> +}
> +
> +static void sysmon_supply_rawtoprocessed(int raw_data, int *val)
> +{
[ ... ]
> @@ -68,6 +127,34 @@ static void sysmon_supply_rawtoprocessed(int raw_data=
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

[Severity: Medium]
Can this 32-bit multiplication overflow when val is a large sysfs input?

Since scale can be up to 65536, multiplying it by the 32-bit signed integer
val might overflow. Should this use a 64-bit cast before the multiplication
to prevent undefined behavior?

> +
> +	if (format)
> +		tmp =3D clamp(tmp, S16_MIN, S16_MAX);
> +	else
> +		tmp =3D clamp(tmp, 0, U16_MAX);
> +
> +	*raw_data =3D (u16)tmp;

[Severity: High]
Does this discard the extracted mode and format bits by returning only the
16-bit mantissa?

When sysmon_write_event_value() writes this value back to the hardware, it =
uses
regmap_write() which overwrites the entire register:

sysmon_write_event_value() {
    ...
    sysmon_supply_processedtoraw(val, reg_val, &raw_val);
    return regmap_write(sysmon->regmap, offset, raw_val);
}

Will this overwrite the entire 32-bit threshold register and silently clear
the channel's format and mode bits?

> +}
> +
> +static int sysmon_supply_thresh_offset(int address,
[ ... ]
> @@ -127,24 +473,244 @@ static int sysmon_read_label(struct iio_dev *indio=
_dev,
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
> +	case SYSMON_BIT_TEMP:
> +		sysmon_push_event(indio_dev, SYSMON_TEMP_MAX);
> +
> +		ret =3D regmap_write(sysmon->regmap, SYSMON_IDR, BIT(SYSMON_BIT_TEMP));
> +		if (ret)
> +			return ret;
> +
> +		sysmon->masked_temp |=3D BIT(SYSMON_BIT_TEMP);
> +		return 0;
> +
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
Does clearing the alarm configuration bit here permanently disable the volt=
age
event after it fires?

Unlike the temperature alarms which use a delayed worker to poll and unmask,
there doesn't appear to be a mechanism to re-arm voltage alarms once the
condition clears. Does this make the voltage threshold events unexpectedly
one-shot, rather than remaining enabled until explicitly disabled by the us=
er?

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
> +	ret =3D devm_request_irq(dev, irq, sysmon_iio_irq, 0, "sysmon-irq", ind=
io_dev);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, sysmon_disable_interrupts, sysmon);

[Severity: High]
Does this devm teardown sequence allow the delayed worker to execute after =
the
IRQ handler has been freed?

Since devm actions execute in reverse order, the IRQ is freed before the
delayed worker is canceled. If sysmon_unmask_worker() runs during this
window, it can unmask the hardware interrupt by calling sysmon_unmask_temp(=
):

sysmon_unmask_worker() -> sysmon_unmask_temp():
    ...
    regmap_write(sysmon->regmap, SYSMON_IER, unmask);

Could this trigger an unhandled interrupt storm since the IRQ handler is no
longer registered?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614233722.2603=
459-1-salih.erim@amd.com?part=3D4
