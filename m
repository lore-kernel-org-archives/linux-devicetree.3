Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB621A9FA0
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 20:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780260226; cv=none; b=N2lQSWE2Q0zJ9YfHPvnEb4ZW/ZjxbvkRGRjlisGHIPvunRJPjqpIHy4efFj7iMGuXgLpdVQ9qlmZwTmv5k5N95VEq++m1f4DkU14clYEnwn3ky3v7FXYAcr9XcjDUY6jJ9ntJIameJiq5Wjsnn+ffV9LXij8Dsdh6TDEPbviSaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780260226; c=relaxed/simple;
	bh=segUJ5aRuEnazookirOHEqA2b8M5w40ZClQxm8iXCzc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pQJwyBbDaHtjSFLuqiIkXjiKJhQ+ZDF9NYBp/+wCsb61GXRYZKFQ+s5XUgDVIu/3+tRLQSl3UQkQq+QcGAz7kgO2mlCMDol3AJyrtPaYvcaJvfErQwh2BwvcQsGsNH8NhduksuKc1RT1eNSGhIxxdeayfnfReFrrQ2M54Ce06dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2tz2wJl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2tz2wJl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2A41F00893;
	Sun, 31 May 2026 20:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780260225;
	bh=rWBiNZmx3T/jBqmhwi6McdT+K+J0Jvs7lipz9oXX9wc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l2tz2wJlWRSKjOXKv5cCc4i7OdxSRyclo7wxM7rbIsMZ7l83HxMj1aa+rKN80Ua1j
	 OByLg9hZeTnuERsEj+lSkhU85oXrhssVoHb2psRIDZqWrt4HcIFBiHZrUUsLtEq1+B
	 dkXYLSUP3gYERqACHuRj2b/lxsxypIc4V8mmIf+pU6DascAtVzfz4RTAhABm4rJtmo
	 0oQxO8MLWXbsoOCYYgykasSVDK8iZ0FLFBG0LGTKDkYydtPC30xuT/pJ/FjJAju63M
	 K7S/5YrRJkWfkPlOhPQjijsyLQ5wuSH+JBmMXAREkf/5PdoR3wSYPWL4fPn8FLuQu5
	 62UzTXpJRiOug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] iio: light: veml6031x00: add support for events
 and trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260531-veml6031x00-v4-4-e64f7fdce38d@gmail.com>
References: <20260531-veml6031x00-v4-4-e64f7fdce38d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 20:43:44 +0000
Message-Id: <20260531204345.1C2A41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Missing `.validate_device` in trigger operations allows other devi=
ces to attach to a sensor-specific trigger.
- [High] The trigger handler performs an unintended I2C read from address 0=
 for the software timestamp channel.
- [High] PM runtime usage count is leaked if the device is unbound while ev=
ents are enabled.
- [High] Stale values in the regmap cache for the hardware-cleared `AF_TRIG=
` bit cause unintended triggers.
- [Medium] Mixing `goto` error handling with `guard()` scope-based cleanup =
in the same function.
- [Medium] Non-functional event sysfs attributes are exposed to userspace w=
hen the device lacks an IRQ.

Pre-existing issues:
- [High] Unbalanced PM runtime usage counter due to mixing devm action with=
 manual put.
--

commit c0654b1fbfc516c85d27a7c169844b649c2a1077
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: veml6031x00: add support for events and trigger
   =20
The device provides a shared interrupt line for to notify events and
data ready, which can be used as a trigger. The interrupt line is not a
requirement for the device to work. Implement variants for the cases
whether the interrupt line is provided or not.

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index facb1b8e42418..5e79eb942f09c 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c

[ ... ]

> @@ -144,6 +197,8 @@ static const struct iio_chan_spec veml6031x00_channel=
s[] =3D {
>  		.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_INT_TIME),
>  		.info_mask_shared_by_all_available =3D BIT(IIO_CHAN_INFO_INT_TIME),
>  		.info_mask_separate_available =3D BIT(IIO_CHAN_INFO_SCALE),
> +		.event_spec =3D veml6031x00_event_spec,
> +		.num_event_specs =3D ARRAY_SIZE(veml6031x00_event_spec),

[Severity: Medium]
Will this unconditionally expose event sysfs attributes even when the device
lacks an IRQ?=20

If i2c->irq is 0, the driver uses veml6031x00_info_no_irq to omit event
callbacks. However, the IIO core checks num_event_specs during
iio_check_for_dynamic_events() and creates sysfs attributes anyway. If these
attributes are accessed from userspace without the callbacks, will they
return -EINVAL?

[ ... ]

> +static int veml6031x00_set_af_trig(struct veml6031x00_data *data, bool s=
tate)
> +{
> +	regcache_drop_region(data->regmap, VEML6031X00_REG_CONF0,
> +			     VEML6031X00_REG_CONF0);
> +
> +	return regmap_update_bits(data->regmap, VEML6031X00_REG_CONF0,
> +				  VEML6031X00_CONF0_AF_TRIG,
> +				  FIELD_PREP(VEML6031X00_CONF0_AF_TRIG, state));
> +}

[Severity: High]
Does this leave a stale AF_TRIG value in the non-volatile regmap cache?

The AF_TRIG bit is cleared automatically by hardware. While this function
drops the cache region before setting the bit, VEML6031X00_REG_CONF0 is not
marked as volatile in veml6031x00_volatile_ranges. Because of this,
regmap_update_bits() writes the new value to hardware and also caches it.=20

Would any subsequent updates to CONF0 (such as changing AF or SD bits) read
the cached AF_TRIG=3D1 and write it back, causing an unintended measurement
trigger?

[ ... ]

> +static int veml6031x00_write_event_config(struct iio_dev *iio,
> +					  const struct iio_chan_spec *chan,
> +					  enum iio_event_type type,
> +					  enum iio_event_direction dir,
> +					  bool state)
> +{
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	int ret;
> +
> +	guard(mutex)(&data->irq_lock);
> +
> +	/* avoid multiple increments/decrements from one source */
> +	if (state =3D=3D data->ev_en)
> +		return 0;
> +
> +	if (state) {
> +		ret =3D pm_runtime_resume_and_get(data->dev);
> +		if (ret)
> +			return ret;
> +	}

[Severity: High]
Is the PM runtime usage count leaked if the device is unbound while events
are enabled?=20

The pm_runtime_resume_and_get() call keeps the device powered on, but there
does not appear to be a custom devres action or remove callback to disable
the event and drop this reference if the driver is unbound. Could this
prevent the parent I2C controller from ever entering runtime suspend?

[ ... ]

> +static int veml6031x00_set_trigger_state(struct iio_trigger *trig, bool =
state)
> +{
> +	struct iio_dev *iio =3D iio_trigger_get_drvdata(trig);
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	int ret;
> +
> +	guard(mutex)(&data->irq_lock);
> +
> +	if (state =3D=3D data->trig_en)
> +		return 0;
> +
> +	ret =3D veml6031x00_set_interrupt(data, state);
> +	if (ret)
> +		return ret;
> +
> +	/* The AF bit must be set before setting AF_TRIG */
> +	ret =3D regmap_update_bits(data->regmap, VEML6031X00_REG_CONF0,
> +				 VEML6031X00_CONF0_AF,
> +				 FIELD_PREP(VEML6031X00_CONF0_AF, state));
> +	if (ret)
> +		goto err_disable_interrupt;
> +
> +	ret =3D veml6031x00_set_af_trig(data, state);
> +	if (ret)
> +		goto err_clear_af;

[Severity: Medium]
Is it safe to mix goto-based error handling with guard() scope-based cleanup
in this function?=20

According to the cleanup subsystem guidelines, mixing goto with guard() or
__free() in the same function can create confusing ownership semantics.
Should this function either use goto entirely or be fully converted to
scoped cleanups?

[ ... ]

> +static const struct iio_trigger_ops veml6031x00_trigger_ops =3D {
> +	.set_trigger_state =3D veml6031x00_set_trigger_state,
> +};

[Severity: High]
Is a .validate_device callback needed here to prevent other devices from
attaching to this sensor-specific trigger?=20

Without setting .validate_device to iio_trigger_validate_own_device, another
IIO device could attach to it. If that happens, veml6031x00_set_trigger_sta=
te()
would enable the DRDY interrupt while the sensor is PM runtime suspended
(since its own buffer_preenable isn't called). Would this cause the depende=
nt
device's buffer captures to hang?

[ ... ]

> +static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *iio =3D pf->indio_dev;
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	int ch, ret, i =3D 0;
> +	struct {
> +		__le16 chans[2];
> +		aligned_s64 timestamp;
> +	} scan =3D { };
> +
> +	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
> +	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
> +		ret =3D regmap_bulk_read(data->regmap,
> +				       VEML6031X00_REG_ALS_L,
> +				       &scan.chans, sizeof(scan.chans));
> +		if (ret)
> +			goto done;
> +	} else {
> +		iio_for_each_active_channel(iio, ch) {
> +			ret =3D regmap_bulk_read(data->regmap,
> +					       iio->channels[ch].address,
> +					       &scan.chans[i++],
> +					       sizeof(*scan.chans));

[Severity: High]
Does this loop inadvertently perform an I2C read from address 0 for the
software timestamp channel?=20

When IIO_CHAN_SOFT_TIMESTAMP is active and the fast-path isn't taken, it
iterates over all active channels. Since the timestamp channel does not def=
ine
a hardware address, its .address is 0.=20

Would regmap_bulk_read() read VEML6031X00_REG_CONF0 instead of data,
wasting I2C bandwidth and writing the configuration register's value into
the scan buffer just before the timestamp?

[ ... ]

> @@ -677,12 +1102,21 @@ static int veml6031x00_probe(struct i2c_client *i2=
c)
>  	iio->channels =3D veml6031x00_channels;
>  	iio->num_channels =3D ARRAY_SIZE(veml6031x00_channels);
>  	iio->modes =3D INDIO_DIRECT_MODE;
> =20
>  	ret =3D veml6031x00_hw_init(iio);
>  	if (ret)
>  		return ret;
> =20
> +	if (i2c->irq) {
> +		ret =3D veml6031x00_setup_irq(i2c, iio);
> +		if (ret)
> +			return ret;
> +
> +		iio->info =3D &veml6031x00_info;
> +	} else {
> +		iio->info =3D &veml6031x00_info_no_irq;
> +	}
> +
>  	ret =3D devm_iio_triggered_buffer_setup(dev, iio, NULL,
>  					      veml6031x00_trig_handler,
>  					      &veml6031x00_buffer_setup_ops);

[Severity: High]
This isn't a bug introduced by this patch, but is the PM runtime usage
counter unbalanced at the end of veml6031x00_probe()?

The driver acquires a reference using devm_pm_runtime_get_noresume() which
associates a devres cleanup action. If pm_runtime_put_autosuspend() is
called manually at the end of probe (immediately after this buffer setup),
the devres cleanup will still fire when the device is unbound, performing a
second put. Could this cause the PM runtime usage counter to underflow
to -1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531-veml6031x0=
0-v4-0-e64f7fdce38d@gmail.com?part=3D4
