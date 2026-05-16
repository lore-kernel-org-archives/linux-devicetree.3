Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79663405C30
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 22:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778969922; cv=none; b=UhPSoXnVGWAUuMnivdVFklFu4eD3JM9D3VePooQudFYVbaghngklynGjn2WlqsatmxQT/l4nwpyjVFaEPszs9lYWbc7VT37QsU4OdqpWa4Ip8RqynIKY4+WG2delIWaEgCeRPVthH+Qpo/aWR4m/gRoPadrQU4LvWhG4bhaiu5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778969922; c=relaxed/simple;
	bh=Y6lbJjGkbjq1ewylMLdRewpqX3C+DiEoODRPSw7IsxI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PmWCHHifUqZJZtjB2qJDqk/OnHcolb9Ou6k+72WP+eZ8+cYC6tu+2QGbJxoPq43lwc0Kq5Wrnhp2fGsWNhMho5hg0xRPM4iYwz9rK2eyLTKorLouaqcRrpszvmwsEEhR75NyivfSyEP00fHkMbV/M0Hqo+bvK3895sh2j41zABA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dy7yxyOu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dy7yxyOu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D830AC19425;
	Sat, 16 May 2026 22:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778969922;
	bh=Y6lbJjGkbjq1ewylMLdRewpqX3C+DiEoODRPSw7IsxI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Dy7yxyOuhea7KBIq0DHojh8WCGEUmzNg0pXUcngyB5FaJZi4Yypue6oXFY+NM0TUn
	 Ys6WsWILHD8ub8q+UnHnu6MQlJEUZaxg6k38Tkifg3bTuDxk9KbRXCq9XDY4l0qJ8f
	 qXVb0InCj6IrQqdCYAcM6Fn28d5MvGqV+NyNiwQQIwhuhCtdMjxfh481hmWulrXJ0A
	 F1/hSq1FelaQEL2p3x/qqzWCAErqzaSs97BdR1WPfRPXDGg4paItnWdfnsiQMgcYEa
	 s44MfPVddBTCZkdWK4MpCVcbneGoDt2drCGpsig/dutwG8uqwKlyEtq9kFLK2C40Mp
	 DZy2Htqi9Sb6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: light: veml3328: add support for new device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260516-veml3328-v1-2-1d4b663e2fe3@gmail.com>
References: <20260516-veml3328-v1-2-1d4b663e2fe3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 22:18:41 +0000
Message-Id: <20260516221841.D830AC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The device will not enter runtime suspend until it is accessed a=
t least once by userspace, wasting power indefinitely.
- [Medium] Mixing `goto` with `guard()` cleanup in the same function.
- [Medium] Unconditional 400ms blocking sleep on runtime resume.
--

commit feb7c398a0fbd0837142edbdc6bd02aa226154e0
Author: Joshua Crofts <joshua.crofts1@gmail.com>

    iio: light: veml3328: add support for new device

This commit introduces a new driver for the Vishay VEML3328 RGB/IR light se=
nsor
communicating via I2C. It includes runtime PM support and basic IIO channel
configurations.

> diff --git a/drivers/iio/light/veml3328.c b/drivers/iio/light/veml3328.c
> new file mode 100644
> index 0000000000000..9eb5429c813d9
> --- /dev/null
> +++ b/drivers/iio/light/veml3328.c

[ ... ]

> +static int veml3328_power_up(struct veml3328_data *data)
> +{
> +	int ret;
> +
> +	ret =3D regmap_update_bits(data->regmap, VEML3328_REG_CONF,
> +				 VEML3328_SHUTDOWN, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	fsleep(veml3328_it_times[3][1]);

Does this unconditional 400ms sleep cause a latency regression when the dev=
ice
is resuming?

Because this function is called from the runtime resume callback, this adds=
 a
400ms latency to every operation that wakes the device from suspend, includ=
ing
simple configuration reads or writes via sysfs.

It also unconditionally sleeps for the maximum possible integration time
instead of the currently configured one.

Should the measurement delay be handled in veml3328_read_raw() when actually
acquiring data, rather than in the general resume callback?

> +
> +	return 0;
> +}

[ ... ]

> +static int veml3328_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct veml3328_data *data =3D iio_priv(indio_dev);
> +	struct regmap *regmap =3D data->regmap;
> +	unsigned int reg_val;
> +	int ret;
> +	int reg;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret =3D pm_runtime_resume_and_get(data->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret =3D regmap_read(regmap, chan->address, &reg_val);
> +		if (ret < 0)
> +			goto exit;

Is it intended to mix goto-based error handling with guard() in the same
function?

The kernel cleanup guidelines explicitly state that mixing goto-based clean=
up
labels with guard() declarations in the same function creates confusing
ownership semantics.

Could the goto statements inside the switch blocks be trivially replaced wi=
th
break to eliminate the exit label and comply with the guidelines?

> +
> +		*val =3D reg_val;
> +		ret =3D IIO_VAL_INT;
> +		break;

[ ... ]

> +	default:
> +		ret =3D -EINVAL;
> +	}
> +
> +exit:
> +	pm_runtime_put_autosuspend(data->dev);
> +
> +	return ret;
> +}

[ ... ]

> +static int veml3328_write_raw(struct iio_dev *indio_dev,
> +			      struct iio_chan_spec const *chan,
> +			      int val, int val2, long mask)
> +{
> +	struct veml3328_data *data =3D iio_priv(indio_dev);
> +	struct regmap *regmap =3D data->regmap;
> +	int ret;
> +	int i;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret =3D pm_runtime_resume_and_get(data->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_INT_TIME:
> +		if (val !=3D 0) {
> +			ret =3D -EINVAL;
> +			goto exit;

This has the same issue with mixing goto and guard() as veml3328_read_raw().

> +		}
> +
> +		for (i =3D 0; i < ARRAY_SIZE(veml3328_it_times); i++) {
> +			if (veml3328_it_times[i][1] =3D=3D val2)
> +				break;
> +		}

[ ... ]

> +static int veml3328_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct veml3328_data *data;

[ ... ]

> +	pm_runtime_set_active(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 2000);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

Will this device fail to enter runtime suspend until it is accessed at least
once by userspace?

Because the usage count starts at 0 and no idle request is explicitly queue=
d,
the PM core does not automatically start the autosuspend timer. The device
might remain fully powered on indefinitely until the first userspace access
triggers a get/put cycle.

Should the driver queue an idle check by calling pm_request_idle(dev) or
perform a pm_runtime_get_noresume() and pm_runtime_put_autosuspend() sequen=
ce
at the end of probe to initiate autosuspend?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-veml3328-v=
1-0-1d4b663e2fe3@gmail.com?part=3D2
