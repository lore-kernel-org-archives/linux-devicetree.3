Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84958632
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 00:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779668032; cv=none; b=nWNEABXDl4QOz3xorbf+3WE9re3xLF4r3JIvPrCNyQlhEwv2h41iRFdKEV3Zg5KkUKqJL0bz8Jv/Lkp3VgCCMNskEJr71QvtW+LqZWjbl6hkfAFr37Ew7Bv6JsY9GccGJEi+E8MWJJ8Y1C2s0hJln+fVhleG12rsxUpyMGWd+6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779668032; c=relaxed/simple;
	bh=ekVuOU05YAsiGWkmpwCIzKcEVQiCLoQw9FPXCoaLYgw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FZha0wco46yrs1OdeUlnq+ccqZRC7LN2ecnEEE8GZ47KJvA61JmV5gnh9MUWel3Dahw5ks8xvPcc3AKgITbyJ6hvVGn1nMHwq8G8MR/Es24H8Cif9xMRPXdG7MOIJ201HuFk1dTFWzHkqH7h4H/M3SmTcUFwVDYjIRvX1/Qsu7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2lzzbCV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2lzzbCV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987641F000E9;
	Mon, 25 May 2026 00:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779668030;
	bh=uDyYD3xQB1/xl3yuMuNAwPUZ4dFTkRojhXwSEHAPBRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J2lzzbCVSFFnx+xaZvy3R5MDf/GhbnEqa72+ysEcAloxULxAJ/7xpEPdpL4pWUoGD
	 GcjAtELItSXi+3WoBWu8nqFTvT0g8j9tZgZUZyJBYsK3c0gtjBr6fR5hZLKEBupBbK
	 m+vAIKilVBXKeD/eYnDvYtu3LJVs+/IPkgj/IuNlG08O0SQkIXNWldbdgNN0MmVwim
	 WSXRobAjZ8OU1RR46q4a3061BXvZQdwQdzSWNLSRT1FODDoiqrcgC/QlZ0D1sxlaOF
	 jsy+JGvB6bZDHSGkxX3KmpDriHUwcg1C3ET1XOpCtPN/p7J1QPYMu9Mmnc0bMRLU8l
	 gpwKStqJUulEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] iio: light: veml6031x00: add support for events
 and trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260524-veml6031x00-v3-4-29165609b2b5@gmail.com>
References: <20260524-veml6031x00-v3-4-29165609b2b5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 00:13:50 +0000
Message-Id: <20260525001350.987641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [High] Cache pollution of AF_TRIG causes unintended conversions and unnec=
essary I2C reads.
- [High] The trigger reference acquired via iio_trigger_get() is leaked on =
probe error paths and driver unbind.
- [High] PM runtime usage counter leaks if the driver unbinds while an even=
t is enabled.
- [High] Sysfs read/write functions and trigger operations access hardware =
without acquiring a PM runtime reference.
- [High] Out-of-bounds array write in veml6031x00_trig_handler when the tim=
estamp channel is enabled.
- [Medium] Dead event sysfs attributes are exposed when no IRQ is present.

Pre-existing issues:
- [High] Unbalanced double-put of the runtime PM usage counter on driver un=
bind.
- [High] The shutdown action accesses I2C registers after PM runtime has be=
en disabled.
--

commit cbdd69d1454af4788d5d18a23d3fb6854c9981e9
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: veml6031x00: add support for events and trigger

The device provides a shared interrupt line for to notify events and
data ready, which can be used as a trigger. The interrupt line is not a
requirement for the device to work. Implement variants for the cases
whether the interrupt line is provided or not.

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index 9968d4414dc96..c57aaa29abf30 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c

[ ... ]

> @@ -136,6 +189,8 @@ static const struct iio_chan_spec veml6031x00_channel=
s[] =3D {
>  		.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_INT_TIME),
>  		.info_mask_shared_by_all_available =3D BIT(IIO_CHAN_INFO_INT_TIME),
>  		.info_mask_separate_available =3D BIT(IIO_CHAN_INFO_SCALE),
> +		.event_spec =3D veml6031x00_event_spec,
> +		.num_event_specs =3D ARRAY_SIZE(veml6031x00_event_spec),

[Severity: Medium]
Will this expose dead event sysfs attributes when no IRQ is present?

When i2c->irq is 0, the driver registers veml6031x00_info_no_irq which lacks
event callbacks. However, this channel array unconditionally defines
event_spec and num_event_specs. The IIO core will parse these and expose
event sysfs files. Reading or writing these files will fail with -EINVAL
because the callbacks are NULL, which violates the sysfs API contract.

[ ... ]

> +static int veml6031x00_read_event_val(struct iio_dev *iio,
> +				      const struct iio_chan_spec *chan,
> +				      enum iio_event_type type,
> +				      enum iio_event_direction dir,
> +				      enum iio_event_info info,
> +				      int *val, int *val2)
> +{

[Severity: High]
Are PM runtime references needed here before accessing hardware?

This function, as well as veml6031x00_write_event_val() and
veml6031x00_set_trigger_state(), performs I2C accesses via regmap without
first calling pm_runtime_resume_and_get(). If the device is
runtime-suspended and its PM domain has powered it off, will these I2C
accesses fail or time out?

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
> +	guard(mutex)(&data->lock);
> +
> +	/* avoid multiple increments/decrements from one source */
> +	if (state =3D=3D data->ev_en)
> +		return 0;
> +
> +	if (state) {
> +		ret =3D pm_runtime_resume_and_get(data->dev);

[Severity: High]
Could this leak the PM runtime usage counter if the driver unbinds?

Enabling an event increments the PM runtime usage counter here. If the
driver is unbound via sysfs while an event is enabled, the IIO core does
not automatically disable the event. Since there is no unbind cleanup
mechanism to release the pending PM reference when data->ev_en is true,
does this keep the device powered on indefinitely?

[ ... ]

> +/* AF_TRIG is reset by hardware, but the rest of the fields are persiste=
nt */
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
Can this cause unintentional active force conversions due to cache pollutio=
n?

This sets the self-clearing AF_TRIG bit using regmap_update_bits().
Because CONF0 is not marked as a volatile register, regmap_update_bits()
writes AF_TRIG=3D1 and caches it. Any subsequent read-modify-write on CONF0
(e.g., toggling the interrupt or changing integration time) will read the
cached AF_TRIG=3D1 and write it back to hardware, unintentionally triggering
an active force conversion and causing hardware state corruption.

[ ... ]

>  static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
>  {
>  	struct iio_poll_func *pf =3D p;
>  	struct iio_dev *iio =3D pf->indio_dev;
>  	struct veml6031x00_data *data =3D iio_priv(iio);
>  	int ch, ret, i =3D 0;
>  	struct {
>  		__le16 chans[2];
>  		aligned_s64 timestamp;
>  	} scan =3D { };
> =20
>  	if (*iio->active_scan_mask =3D=3D (BIT(VEML6031X00_SCAN_ALS) |
>  				       BIT(VEML6031X00_SCAN_IR))) {
>  		ret =3D regmap_bulk_read(data->regmap,
>  				       VEML6031X00_REG_ALS_L,
>  				       &scan.chans, sizeof(scan.chans));
>  		if (ret)
>  			goto done;
>  	} else {
>  		iio_for_each_active_channel(iio, ch) {
>  			ret =3D regmap_bulk_read(data->regmap,
>  					       iio->channels[ch].address,
>  					       &scan.chans[i++],

[Severity: High]
Does this loop cause an out-of-bounds array write if the timestamp
channel is enabled?

The iio_for_each_active_channel() loop does not exclude the soft timestamp
channel. If the user enables ALS, IR, and TIMESTAMP channels, the loop
iterates 3 times. However, the scan.chans array is declared as=20
__le16 chans[2]. Processing the timestamp channel increments the index i
to 2 and writes to scan.chans[2], causing an out-of-bounds memory write.

Furthermore, because the timestamp channel's address is 0, this incorrectly
attempts a bogus I2C read from VEML6031X00_REG_CONF0.

[ ... ]

> +static int veml6031x00_setup_irq(struct i2c_client *i2c, struct iio_dev =
*iio)
> +{
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	struct device *dev =3D data->dev;
> +	int ret;
> +
> +	data->trig =3D devm_iio_trigger_alloc(dev, "%s-drdy%d", iio->name,
> +					    iio_device_id(iio));
> +	if (!data->trig)
> +		return -ENOMEM;
> +
> +	data->trig->ops =3D &veml6031x00_trigger_ops;
> +	iio_trigger_set_drvdata(data->trig, iio);
> +
> +	ret =3D devm_iio_trigger_register(dev, data->trig);
> +	if (ret)
> +		return ret;
> +
> +	iio->trig =3D iio_trigger_get(data->trig);

[Severity: High]
Is the trigger reference acquired here leaked on driver unbind?

Calling iio_trigger_get() increments the trigger device's refcount and the
driver module's refcount. If the driver fails probe afterwards or is unbound
later, iio_trigger_put() is never called because there is no devres action
registered for it and no custom remove callback. Does this permanently leak
the trigger device reference and prevent the module from being unloaded?

[ ... ]

> @@ -618,6 +1039,10 @@ static int veml6031x00_probe(struct i2c_client *i2c)

[ ... ]

>  	ret =3D devm_add_action_or_reset(dev, veml6031x00_als_shutdown_action, =
data);

[Severity: High]
This is a pre-existing issue, but does this shutdown action access I2C
registers after PM runtime has been disabled?

This action is registered via devm_add_action_or_reset() before PM runtime
is enabled. On teardown, devm actions run in reverse, meaning PM runtime is
disabled before the shutdown action runs. The shutdown action then attempts
I2C writes while PM runtime is disabled. If the device was suspended, it
cannot be resumed, potentially causing I2C transfer failures.

[ ... ]

>  	pm_runtime_put_autosuspend(dev);

[Severity: High]
This is a pre-existing issue, but is there an unbalanced double-put of the
runtime PM usage counter on driver unbind?

The probe function registers a cleanup action to drop the PM reference via
devm_pm_runtime_get_noresume(dev). However, this explicit put at the end
of probe means the devm action will drop the reference a second time on
unbind, causing a PM usage counter underflow that breaks the PM runtime
state machine.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-veml6031x0=
0-v3-0-29165609b2b5@gmail.com?part=3D4
