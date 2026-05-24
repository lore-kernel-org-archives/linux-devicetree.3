Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18073ADB98
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 22:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779663218; cv=none; b=IpT2AfEI7rikWVA9zmHSidK64FWdmCA/bxrWmGX8azDB1V+U2yeg96gKKCkEZ0TjexfTY/9JzT8Gewltc7XAboe1lZ3PsaeWQxN0Lsj6a2D1H8A45c08RxJSR7byuy6AyPMkQDhhJVgOku7JAPf0ymMDuHoEnJUmlJTc/fizge0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779663218; c=relaxed/simple;
	bh=U8HorvtucUjeIm6YK8sb9dGMrq/aT+YjNFlOu/NBFSc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BoC3d1H7JO4+Wp62M4wjaG4KmzrjQ6UCRzqD4zrhs362BSMuW+GcbCs35X3ImadyfhCHCpcZ6QW/7CR71bVn33ZTF+wPiTR3nHaOaws61AYNFFE3NfcCmnLU2Iww5veLTmLRBshA1jWeagw8q4WJ5f3QFkCfwi4evz29/0JHo9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4nx6rQO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4nx6rQO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450AF1F000E9;
	Sun, 24 May 2026 22:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779663216;
	bh=j0J+VJ0n9DDhpJnBSwjagYE/KKRbv5oVKazJBvzrvCY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E4nx6rQOSHSizAVgeK0E0fHTSwVa+dvczN8n8r8UcyhZObIwy/N/r7w6u3vxQ4Rzj
	 xo2zHNjbpBvSoEMLTp10KRnpvriJ2QB33u1Tc5xy1TMBSCBMWc94vIpUSK8I38m18r
	 /UMQXkETKQYs8b4EiVzKdchHrNJmACDiBB6ejVS/V7G/NP3U8GGn85xMe4KiQ9d02Q
	 oBh/sbioigQbMHrdKH/K2ZAgBCcca5SqVL0xO3K48Cj45rYfeBYt5xw9YCmgeQwwC1
	 o4UYWl9I9rqTkiMzSfsz7yxJfGd+LiwhCtBcVz7f1gzt+8RIDnzQe8CW3Qx6qrgsfg
	 leWbhPqmvYmrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] iio: light: add support for veml6031x00 ALS
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260524-veml6031x00-v3-2-29165609b2b5@gmail.com>
References: <20260524-veml6031x00-v3-2-29165609b2b5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 22:53:35 +0000
Message-Id: <20260524225336.450AF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Mixing `devm_pm_runtime_get_noresume()` with manual `pm_runtime_pu=
t_autosuspend()` causes a PM usage counter underflow.
- [High] `veml6031x00_write_raw()` modifies hardware registers over I2C wit=
hout acquiring a runtime PM reference.
- [High] The shutdown devres action performs I2C writes without ensuring th=
e device and its parent are resumed.
- [Medium] Missing locks in `veml6031x00_read_raw()` for `IIO_CHAN_INFO_SCA=
LE` and `IIO_CHAN_INFO_INT_TIME` allow torn reads of configuration fields.
- [Medium] Incorrect scale attribute exposure for the IR channel and failur=
e to mark shared hardware attributes.
- [Medium] The driver unconditionally sleeps for the integration time on ev=
ery raw read, introducing unnecessary latency.
--

commit 02aa1fda2e77e393230904b3d122bdbb99445c9f
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: add support for veml6031x00 ALS series

These sensors provide two light channels (ALS and IR), I2C communication
and a multiplexed interrupt line to signal data ready and configurable
threshold alarms.

This first implementation provides basic functionality (measurement
configuration, raw reads and ID validation) and defines the different
register regions in preparation for extended features in the subsequent
patches of the series.

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> new file mode 100644
> index 0000000000000..50979d2392301
> --- /dev/null
> +++ b/drivers/iio/light/veml6031x00.c
> @@ -0,0 +1,657 @@

[ ... ]

> +static const struct iio_chan_spec veml6031x00_channels[] =3D {
> +	{
> +		.type =3D IIO_LIGHT,
> +		.address =3D VEML6031X00_REG_ALS_L,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),
> +		.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_INT_TIME),
> +		.info_mask_shared_by_all_available =3D BIT(IIO_CHAN_INFO_INT_TIME),
> +		.info_mask_separate_available =3D BIT(IIO_CHAN_INFO_SCALE),
> +	},
> +	{
> +		.type =3D IIO_INTENSITY,
> +		.address =3D VEML6031X00_REG_IR_L,
> +		.modified =3D 1,
> +		.channel2 =3D IIO_MOD_LIGHT_IR,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),

[Severity: Medium]
Does this code expose hardware gain globally or independently per channel?

If hardware gain (gain and pd_div4) is globally applied to the entire chip,
writing to a separate attribute must not silently alter another channel's
state. Should shared hardware settings be exposed via info_mask_shared_by_a=
ll
instead?

Additionally, the scale value returned for the IR channel is computed using=
 a
lux-to-count base which might be physically meaningless for raw IR intensit=
y.

[ ... ]

> +static int veml6031x00_single_read(struct iio_dev *iio, enum iio_chan_ty=
pe type,
> +				   int *val)
> +{

[ ... ]

> +	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
> +	if (IIO_DEV_ACQUIRE_FAILED(claim))
> +		return -EBUSY;
> +
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(data->dev, pm);
> +	ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D veml6031x00_get_it(data, &it_usec);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* integration time + 10 % to ensure completion */
> +	fsleep(it_usec + (it_usec / 10));

[Severity: Medium]
Does this unconditionally sleep for the integration time on every raw read?

Since the device measures continuously when active, this delay is likely on=
ly
needed if the device was just resumed from sleep. Forcing this delay on eve=
ry
read unnecessarily throttles the maximum polling read rate.

Could this be optimized by manually calling pm_runtime_get_sync() and check=
ing
its return value (which returns 1 if already active) to apply the sleep only
when strictly necessary?

[ ... ]

> +static int veml6031x00_read_raw(struct iio_dev *iio,
> +				struct iio_chan_spec const *chan, int *val,
> +				int *val2, long mask)
> +{
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		return veml6031x00_single_read(iio, chan->type, val);
> +	case IIO_CHAN_INFO_INT_TIME:
> +		*val =3D 0;
> +		return veml6031x00_get_it(data, val2);
> +	case IIO_CHAN_INFO_SCALE:
> +		return veml6031x00_get_scale(data, val, val2);

[Severity: Medium]
Could concurrent reads and writes cause torn reads of configuration fields
here?

When handling IIO_CHAN_INFO_SCALE or IIO_CHAN_INFO_INT_TIME, this function
does not acquire the IIO direct mode lock or any other mutex. It performs
multiple non-atomic regmap_field_read() operations (e.g., reading both
gain and pd_div4 in veml6031x00_get_scale()).

If a sysfs read interleaves with a write, the read might fetch a transient,
inconsistent mix of old and new register bits.

[ ... ]

> +static int veml6031x00_write_raw(struct iio_dev *iio,
> +				 struct iio_chan_spec const *chan,
> +				 int val, int val2, long mask)
> +{
> +	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
> +	if (IIO_DEV_ACQUIRE_FAILED(claim))
> +		return -EBUSY;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_INT_TIME:
> +		return veml6031x00_set_it(iio, val, val2);
> +	case IIO_CHAN_INFO_SCALE:
> +		return veml6031x00_set_scale(iio, val, val2);

[Severity: High]
Does this code modify hardware registers over I2C without acquiring a runti=
me
PM reference?

Unlike veml6031x00_single_read(), this function directly writes to the
sensor's configuration registers without a PM reference. Because the regmap=
 is
not configured with .pm_runtime =3D true, I2C transactions may be attempted
while the client device (or its parent controller) is runtime suspended, wh=
ich
can trigger bus transfer errors.

[ ... ]

> +static int veml6031x00_probe(struct i2c_client *i2c)
> +{

[ ... ]

> +	ret =3D devm_add_action_or_reset(dev, veml6031x00_als_shutdown_action, =
data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add shutdown action\n");

[Severity: High]
Can this shutdown devres action perform I2C writes while the device is
suspended?

Because this devres action is registered before
devm_pm_runtime_set_active_enabled(), on driver unbind, PM is disabled and =
the
device state is forced to suspended before the shutdown action executes due=
 to
devres LIFO execution order.

The shutdown action then attempts to perform I2C writes to the shutdown
register. Accessing the I2C bus while the device state is suspended can cau=
se
bus errors or hangs.

[ ... ]

> +	ret =3D devm_pm_runtime_set_active_enabled(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +
> +	ret =3D devm_pm_runtime_get_noresume(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get runtime PM\n");

[ ... ]

> +	ret =3D veml6031x00_hw_init(iio);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_put_autosuspend(dev);

[Severity: High]
Does mixing devm_pm_runtime_get_noresume() with manual
pm_runtime_put_autosuspend() cause a PM usage counter underflow?

The devm_pm_runtime_get_noresume(dev) call increments the PM usage counter
and registers a devres action to decrement it on driver unbind.

However, the explicit pm_runtime_put_autosuspend(dev) decrements the usage
counter to its pre-get state. When the driver is subsequently removed (or if
probe fails after the put), the devres action will blindly decrement the
counter a second time, resulting in an underflow.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-veml6031x0=
0-v3-0-29165609b2b5@gmail.com?part=3D2
