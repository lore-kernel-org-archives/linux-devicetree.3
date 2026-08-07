Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91AE3264D6
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786115305; cv=none; b=Mnl7rnFjUsYVzK17et5Q3bxdG7VqIZfBrS4WvVYm0mojtEZa9rcbH4xYi/GC9gTc3kGFh4IWweRjb6aDp2zx2E4FAfUay/Un9YO16ggn9a1OS00/dFosFjhWB424crj4D8AwQKh2oDtMrchCLQMNSoH6AB9JP7BBa3k/mRup1e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786115305; c=relaxed/simple;
	bh=08pXFGsaEZbOrAvcXtkbMX7nQZSZOnBU8xi8/f5L2U8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gpqKj8epU6MaIbL0r3q/vAr4f6ExKrByWNIq+Wenl4O8EZjrLWUt115YkO9zALZO+9vGB5gaG74ITFEFahRc6cb6rvXNIJG5z6q7CL46r84Wvxu3Um4E5SCdzFRawCQmMVVZmgVaoNDnR4ouANdS0bLqcS0XpKw2yxQ3k1Rg3aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ln6KmbB4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ln6KmbB4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A101F000E9;
	Fri,  7 Aug 2026 15:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786115303;
	bh=ykzsfHd/RZKLrgpFAAUjLE5awoUYFxcK0eN05e7oxPk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ln6KmbB4t9vHZA+IOwrxeS/jDLZG/rqs8fZGagUOp+NBJCEZyj27MFqm6xGRN7mmK
	 wPifxRzFfW9wFL05hMLUYDeS/ggMI3dpvkk7hDTqMSisvwKTuAYiM9Q6MzyD9G0fxZ
	 Cjx1Djhv6ERk1YMme5EqTJntGCyo+YAkMLqPlBxyeKHzNMyaH7CU7z4oUvSLv3wym4
	 XppyyfXcpuei7y/W95tayT0pyM/MggznsJ7/AyVBcX+1mBDBCx7pNKTCcZ2HuKIry0
	 mXEhlH3EZ5WJb4cncTS5GqwaitMMVTDT+HpMt4VMDy31SpwpmIAht578sPbGkbcCsa
	 /JLJ03wUpJRQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] iio: light: veml6031x00: add support for events
 and trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807-veml6031x00-v5-4-e60876fb3640@gmail.com>
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
 <20260807-veml6031x00-v5-4-e60876fb3640@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 15:08:22 +0000
Message-Id: <20260807150823.49A101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Unbalanced PM runtime usage counter causes an underflow on device =
unbind or probe error.
- [High] Uninitialized padding in the local `scan` buffer leaks kernel stac=
k memory to userspace.
- [High] Spurious interrupts cause I2C reads while the device is runtime su=
spended.
- [High] Initialization order and use-after-destroy race due to early IRQ/t=
rigger registration.
- [High] Triggered buffer is unconditionally registered on the no-IRQ path =
with a malformed channels array.
- [Medium] Missing timestamp acquisition for nested trigger handler.
- [Medium] Trigger disable sequence violates hardware constraints by cleari=
ng AF before AF_TRIG.
--

--- Patch [4]: [PATCH v5 4/4] iio: light: veml6031x00: add support for even=
ts and trigger ---
commit aeccd415dcc79cfa9463cf8b5eec2292ee46dfab
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: veml6031x00: add support for events and trigger

The device provides a shared interrupt line for to notify events and
data ready, which can be used as a trigger. The interrupt line is not a
requirement for the device to work. Implement variants for the cases
whether the interrupt line is provided or not.

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index 0cccd40d729eb..e193f87e6740f 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c
[ ... ]
> @@ -494,13 +686,205 @@ static int veml6031x00_write_raw_get_fmt(struct ii=
o_dev *indio_dev,
[ ... ]
> +static irqreturn_t veml6031x00_interrupt(int irq, void *private)
> +{
> +	struct iio_dev *iio =3D private;
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	s64 timestamp;
> +	int regval, ret;
> +	bool trigger_poll;
> +
> +	scoped_guard(mutex, &data->irq_lock) {
> +		ret =3D regmap_read(data->regmap, VEML6031X00_REG_INT, &regval);

[Severity: High]
If a spurious interrupt fires while both ev_en and trig_en are false,
could this unconditionally read from the I2C bus while the device is
runtime suspended?

It looks like this might hit a powered-off device since it doesn't
use pm_runtime_get_if_active() or check software state before
the register read.

> +		if (ret) {
> +			dev_dbg(regmap_get_device(data->regmap),
> +				"Failed to read interrupt register %d\n", ret);
> +			return IRQ_NONE;
> +		}
[ ... ]
> @@ -535,11 +919,78 @@ static int veml6031x00_buffer_postdisable(struct ii=
o_dev *iio)
>  	return 0;
>  }
> =20
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

[Severity: Medium]
Since the AF bit must be set before setting AF_TRIG, does the
disable sequence need to happen in reverse order?

When state is false, this clears the AF bit first, creating a window
where AF_TRIG is still active but AF is disabled.

> +	if (ret) {
> +		veml6031x00_set_interrupt(data, !state);
> +
> +		return ret;
> +	}
> +
> +	ret =3D regmap_update_bits(data->regmap, VEML6031X00_REG_CONF0,
> +				 VEML6031X00_CONF0_AF_TRIG,
> +				 FIELD_PREP(VEML6031X00_CONF0_AF_TRIG, state));
[ ... ]
> +static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *iio =3D pf->indio_dev;
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	IIO_DECLARE_BUFFER_WITH_TS(__le16, scan, 2);

[Severity: High]
Could this leak uninitialized kernel stack memory to userspace?

The IIO_DECLARE_BUFFER_WITH_TS macro allocates the buffer on the stack
without zeroing the padding bytes between the channel data and the
timestamp.

> +	unsigned int i =3D 0;
> +	int ch, ret;
> +
> +	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
> +	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
> +		ret =3D regmap_bulk_read(data->regmap,
> +				       VEML6031X00_REG_ALS_L,
> +				       scan,
> +				       2 * sizeof(*scan));
> +		if (ret)
> +			goto done;
> +	} else {
> +		iio_for_each_active_channel(iio, ch) {
> +			ret =3D regmap_bulk_read(data->regmap,
> +					       iio->channels[ch].address,
> +					       &scan[i++],
> +					       sizeof(*scan));
> +			if (ret)
> +				goto done;
> +		}
> +	}
> +
> +	iio_push_to_buffers_with_ts(iio, scan, sizeof(scan), pf->timestamp);

[Severity: Medium]
Since this trigger handler is executed synchronously from the interrupt
handler via iio_trigger_poll_nested() bypassing the top-half
iio_pollfunc_store_time(), will pf->timestamp always be zero here?

> +
> +done:
> +	iio_trigger_notify_done(iio->trig);
> +
> +	return IRQ_HANDLED;
> +}
[ ... ]
> @@ -636,15 +1142,29 @@ static int veml6031x00_probe(struct i2c_client *i2=
c)
>  				     "Failed to set regmap\n");
> =20
>  	iio->name =3D data->chip->name;
> -	iio->channels =3D veml6031x00_channels;
> -	iio->num_channels =3D ARRAY_SIZE(veml6031x00_channels);
>  	iio->modes =3D INDIO_DIRECT_MODE;
> -	iio->info =3D &veml6031x00_info;
> +	if (i2c->irq) {
> +		iio->channels =3D veml6031x00_channels_irq;
> +		iio->num_channels =3D ARRAY_SIZE(veml6031x00_channels_irq);
> +		ret =3D veml6031x00_setup_irq(i2c, iio);

[Severity: High]
Does registering the IRQ and trigger here expose a race condition?

veml6031x00_setup_irq() requests the threaded IRQ before devm_mutex_init()
allocates data->irq_lock and veml6031x00_regfield_init() allocates
data->rf.int_en. If an interrupt fires immediately, the handler will try
to lock an uninitialized mutex.

Additionally, since devres cleans up in reverse order, won't the mutex
be destroyed before the IRQ is unregistered during unbind?

> +		if (ret)
> +			return ret;
> +
> +		iio->info =3D &veml6031x00_info;
> +	} else {
> +		iio->channels =3D veml6031x00_channels;

[Severity: High]
If the device does not provide an interrupt, it falls back to
veml6031x00_channels which lacks scan_index and scan_type definitions.

Will setting up a triggered buffer unconditionally at the end of probe
cause IIO core undefined behavior if a user attaches an external
sysfs/hrtimer trigger, since both channels would default to a
scan_index of 0 and 0 storage bits?

> +		iio->num_channels =3D ARRAY_SIZE(veml6031x00_channels);
> +		iio->info =3D &veml6031x00_info_no_irq;
> +	}
> =20
>  	ret =3D devm_mutex_init(&i2c->dev, &data->scale_lock);
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D devm_mutex_init(&i2c->dev, &data->irq_lock);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D veml6031x00_regfield_init(data);
>  	if (ret)
>  		return dev_err_probe(&i2c->dev, ret, "Failed to init regfield\n");
> @@ -672,6 +1192,12 @@ static int veml6031x00_probe(struct i2c_client *i2c)
>  	if (ret)
>  		return dev_err_probe(&i2c->dev, ret, "Failed to get runtime PM\n");
> =20

[Severity: High]
Could the devm_pm_runtime_get_noresume() call just above this hunk cause
a usage counter underflow?

The devres action will eventually call pm_runtime_put_noidle() during
driver unbind. However, the driver also manually calls
pm_runtime_put_autosuspend() at the end of veml6031x00_probe() to drop
the initial reference.

This double-put could underflow the usage counter to -1 and corrupt
device power management. If the driver manually manages the initial
reference, should it use the non-devm pm_runtime_get_noresume() variant?

> +	ret =3D devm_add_action_or_reset(&i2c->dev,
> +				       veml6031x00_disable_event_action, data);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret,
> +				     "Failed to add event cleanup action\n");
> +
>  	ret =3D veml6031x00_validate_part_id(data);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-veml6031x0=
0-v5-0-e60876fb3640@gmail.com?part=3D4
