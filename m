Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7312C3A640E
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750970; cv=none; b=tQH0qmUakmHzKdCKleqIQLmKHRxX/O8wi3zA2CJU+WPDGBFr9OVPZfbDEpU+nYPIBfYvVXsvwIoKnKliEurit/2MuqjdhwYqg+lsBH2wclnGTd1ctiM/ZSEPjZdRrPh4E3qIwJX6DrQ0GupYK6UxVthWZoQov42CZmtNdhh+hqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750970; c=relaxed/simple;
	bh=by5/jlKmobcS+ekszIxYCKn7L87fJ8yi/8BLFFEH9ic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PpOchUZsZKOkW9l/SkP1rKAMj4BfQf57kFZ4oAgkQAKdGNC+x4vH0DOfYECGI69bUhKNpvJ+A1kTmsG6YE3DZjugbx7avwwe/YGzRJ8cj0F3OTYFbfbycvEen9uhyYuOj2/5m102lLT3e8LbctuGutHpQLioIPjp4MOlGOeu56I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGQq7d51; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGQq7d51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37E7C2BCB7;
	Thu, 14 May 2026 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778750970;
	bh=by5/jlKmobcS+ekszIxYCKn7L87fJ8yi/8BLFFEH9ic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LGQq7d51LkK/x6nuxw+TkVRWXukG3NUpuMnQWTuzPdABFk0bJBzzl6Yh7G0+0gkE8
	 NBwmTw/pt51sRtGaIdVp9ZnbxMqMDsHY42lUAdIzOGfX9jsHoZ2KqOYEGFVdKo5viw
	 KtAqlmq1h6evB4SxmEOWeKiJD0Z+mdAAq3gN0z/G/wBippBqeW52mvlQZdzEMADnAj
	 C7oef+oBwOHYY6lmU6Z3aenVkpyzgBqOz8bsJLcmk0pS54nxHA2BGaudWkRufkzsLL
	 lYAmnNZ9c5Un1qxe/Xr/DEHo94z52v+06n4NvYHncE9NVn5iM6mqdg08g8xhaZyn3f
	 bpugRKcLxSq9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] iio: light: add support for veml6031x00 ALS
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-veml6031x00-v2-4-4703ca661a1d@gmail.com>
References: <20260513-veml6031x00-v2-4-4703ca661a1d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 09:29:29 +0000
Message-Id: <20260514092929.D37E7C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Race Condition and API Violation in `veml6031x00_write_raw`
- [High] Out-of-Bounds Array Access in Trigger Handler
- [High] PM Runtime Usage Counter Underflow and Race Condition in `veml6031=
x00_write_event_config`
- [High] TOCTOU Race and Lockless Hardware State Rollback in `veml6031x00_s=
et_trigger_state`
- [High] Sensor Left in Hardware Shutdown During Initial Active PM State
- [Medium] PM Runtime Usage Counter Leak on Probe Error Paths
- [Medium] Negative Input Values Bypass Period Validation
- [Medium] `iio_device_claim_direct` Blocks Needlessly Due to Long Sleep in=
 `veml6031x00_single_read`
--

commit a33cd1a810baeac2c7084228357077baf67cdd60
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: add support for veml6031x00 ALS series

These sensors provide two light channels (ALS and IR), I2C communication
and a multiplexed interrupt line to signal data ready and configurable
threshold alarms.

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> new file mode 100644
> index 0000000000000..c7808768f45ad
> --- /dev/null
> +++ b/drivers/iio/light/veml6031x00.c

[ ... ]

> +static int veml6031x00_write_period(struct iio_dev *iio, int val)
> +{
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +
> +	if (val > 8 || hweight8(val) !=3D 1)
> +		return -EINVAL;
> +
> +	return regmap_field_write(data->rf.pers, ffs(val) - 1);
> +}

Is it possible for negative values to bypass this validation?

If val is a negative number such as -128, val > 8 is false, and hweight8(-1=
28)
checks the bottom 8 bits, which evaluates to exactly 1 bit set. This would
bypass the check and allow malformed inputs to be written to the hardware.

[ ... ]

> +static int veml6031x00_single_read(struct iio_dev *iio, enum iio_chan_ty=
pe type,
> +				   int *val)
> +{
[ ... ]
> +	ret =3D veml6031x00_get_it(data, &it_sec, &it_usec);
> +	if (ret < 0)
> +		goto put_autosuspend;
> +
> +	/* integration time + 10 % to ensure completion */
> +	fsleep((it_sec * MICRO) + it_usec + (it_usec / 10));
> +
> +	if (!iio_device_claim_direct(iio)) {
> +		ret =3D -EBUSY;
> +		goto put_autosuspend;
> +	}

Could iio_device_claim_direct() be called before sleeping?

Currently, if a triggered buffer is actively capturing data, this will sleep
for the entire integration delay (which could be up to 400ms) before return=
ing
-EBUSY and rejecting the direct read.

[ ... ]

> +static int veml6031x00_write_raw(struct iio_dev *iio,
> +				 struct iio_chan_spec const *chan,
> +				 int val, int val2, long mask)
> +{
> +	switch (mask) {
> +	case IIO_CHAN_INFO_INT_TIME:
> +		return veml6031x00_set_it(iio, val, val2);
> +	case IIO_CHAN_INFO_SCALE:
> +		return veml6031x00_set_scale(iio, val, val2);
> +	default:
> +		return -EINVAL;
> +	}
> +}

Does this need to hold a lock or claim direct mode?

The helpers veml6031x00_set_it() and veml6031x00_set_scale() perform multip=
le
regmap operations.

Without holding a driver-level mutex or claiming direct mode with
iio_device_claim_direct_mode(), concurrent sysfs writes could interleave and
corrupt the configuration. This also allows userspace to alter hardware
settings while a triggered buffer is actively capturing data.

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
> +	scoped_guard(mutex, &data->lock) {
> +		/* avoid multiple increments/decrements from one source */
> +		if (state =3D=3D data->ev_en)
> +			return 0;
> +
> +		ret =3D veml6031x00_set_interrupt(data, state);
> +		if (ret)
> +			return ret;
> +
> +		data->ev_en =3D state;
> +	}
> +
> +	if (state)
> +		return pm_runtime_resume_and_get(data->dev);
> +
> +	pm_runtime_put_autosuspend(data->dev);
> +
> +	return 0;
> +}

Could this lead to a PM runtime usage counter underflow or a race condition?

If state is true and pm_runtime_resume_and_get() fails, the function returns
an error but leaves data->ev_en as true and the interrupt enabled. A
subsequent call to disable the event would unconditionally call
pm_runtime_put_autosuspend(), underflowing the usage counter.

Additionally, because the PM runtime calls are outside the mutex, concurrent
calls could execute the PM runtime updates out-of-order, leading to referen=
ce
count corruption.

[ ... ]

> +static int veml6031x00_set_trigger_state(struct iio_trigger *trig, bool =
state)
> +{
> +	struct iio_dev *iio =3D iio_trigger_get_drvdata(trig);
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	int ret;
> +
> +	scoped_guard(mutex, &data->lock) {
> +		if (state =3D=3D data->trig_en)
> +			return 0;
> +
> +		ret =3D veml6031x00_set_interrupt(data, state);
> +		if (ret)
> +			return ret;
> +	}
[ ... ]
> +	ret =3D veml6031x00_set_af_trig(data, state);
> +	if (ret)
> +		goto err_clear_af;
> +
> +	scoped_guard(mutex, &data->lock)
> +		data->trig_en =3D state;
> +
> +	return 0;
> +
> +err_clear_af:
> +	regmap_update_bits(data->regmap, VEML6031X00_REG_CONF0,
> +			   VEML6031X00_CONF0_AF,
> +			   FIELD_PREP(VEML6031X00_CONF0_AF, !state));
> +err_disable_interrupt:
> +	veml6031x00_set_interrupt(data, !state);
> +	return ret;
> +}

Does this sequence create a race condition with the lock handling?

The function checks state =3D=3D data->trig_en and increments an internal c=
ounter
in veml6031x00_set_interrupt() inside the first scoped_guard, but data->tri=
g_en
isn't updated until the second scoped_guard. Concurrent callers could bypass
the state check before data->trig_en is updated.

Also, if an error occurs, the err_disable_interrupt path calls
veml6031x00_set_interrupt() outside the lock. This could race with other ev=
ent
configurations and desynchronize the software state from the hardware state.

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
> +	} scan;
> +
> +	memset(&scan, 0, sizeof(scan));
> +
> +	if (*iio->active_scan_mask =3D=3D VEML6031X00_ALL_CH_MASK) {
[ ... ]
> +	} else {
> +		iio_for_each_active_channel(iio, ch) {
> +			ret =3D regmap_bulk_read(data->regmap,
> +					       iio->channels[ch].address,
> +					       &scan.chans[i++], 2);
> +			if (ret)
> +				goto done;
> +		}
> +	}

Can this loop overflow scan.chans[]?

If the user enables the IIO timestamp channel alongside ALS and IR, the act=
ive
scan mask includes the timestamp bit, so execution falls into the else bran=
ch.

The iio_for_each_active_channel() loop doesn't skip the timestamp channel, =
so
it would execute an I2C read into scan.chans[i++] when i reaches 2, overflo=
wing
the 2-element array.

[ ... ]

> +static int veml6031x00_probe(struct i2c_client *i2c)
> +{
[ ... ]
> +	ret =3D pm_runtime_set_active(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to activate PM runtime\n");
> +
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable PM runtime\n");
> +
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_set_autosuspend_delay(dev, VEML6031X00_AUTOSUSPEND_MS);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	ret =3D veml6031x00_validate_part_id(data);
> +	if (ret)
> +		return ret;

Should the sensor be powered on before marking it active?

The hardware powers up in a shutdown state, and veml6031x00_als_power_on() =
is
not called here before pm_runtime_set_active(). During the initial autosusp=
end
delay, reads will assume the device is awake and attempt to read from a
powered-down sensor.

Also, does this code leak the PM runtime reference on probe errors?

If an error occurs during veml6031x00_validate_part_id() or subsequent
initialization steps, the function returns without dropping the reference
acquired by pm_runtime_get_noresume(dev).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-veml6031x0=
0-v2-0-4703ca661a1d@gmail.com?part=3D4
