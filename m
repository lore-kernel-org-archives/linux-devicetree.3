Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF2131716A
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 18:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780858221; cv=none; b=e72d2SKXYZa+sVACfjClTEUsnA3Mh33DFrq46ieCmCgcOM9htm6Y4UBaH5dzvzDxv0sGIYy6OH/iEl9hyPj278E9AEyoXrQuBp5kvpuzRqDIn3IWW9gy1uxQNys7i5RrYvoWksITSpZOAm3K1+gREEi3xz1njf8hrFUWCIOTdHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780858221; c=relaxed/simple;
	bh=w56U2KRYU6/JajFvR7HpejqFQ856NhchuFl5H0N9wTo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kB1DEh0Ltn3tZ0AwXaCjjFIVZYQ5w/V7Y2k6k54Kh8Gb2UCvzuOvNUWyLpstNoCXsJIGH4VwmST5G4oZSujVHTwkMjwIguyZmsvh3nnzpc4pTtOkeUztABiYSbKz7a9/Q2xm05FEjeg3t08vwt+syZ6nbLsTA04ujl5X7S/lhRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwXe09UT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwXe09UT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289181F00893;
	Sun,  7 Jun 2026 18:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780858217;
	bh=ljWPCHe+Nf52NkfMc8cMOUyo/tItFqwLrwd4V1epOzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VwXe09UT4TVNGHR28D+HG1S3trPQRUX0hf23TwAaBk7+01JMNt0b/ZMnqVbZAjVnm
	 n3i1OYUWTlYBCmVlfCVOIjH4nORzvwzgQauiWrPgIdqBMvh8tkioFmixTkuXdX9oVe
	 ecEFdXr1Z3qrwNM4NMmPZ/UveDNBfzgFejfHbf81dYy5Hh2rjI8venFr5YhXYFq7Qp
	 iJxIPFMeZsfztB0X4NpWHNtRYSzDAfQTEcorvxG2xLgN9AU+vL25zB8ab58PdIYiKw
	 zYo7gTfAaLXxtWIWdx6E3Eo51Wemjjt641W0TOkpsAphHFg7diSiU1K4E3/o4InLcS
	 uim8Lnjx/+zBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] iio: adc: Add ti-ads1110 support to ti-ads1100
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260607183542.368184-4-jakubszczudlo40@gmail.com>
References: <20260607183542.368184-4-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 18:50:16 +0000
Message-Id: <20260607185017.289181F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] I2C read errors are silently ignored due to implicit type conversi=
on (signed `int` compared to `size_t`), causing the driver to process unini=
tialized stack data.
- [High] Partial I2C reads cause a positive return value to bypass caller e=
rror checks, leaking uninitialized kernel stack memory to userspace.
- [High] The `vdd` regulator is leaked during device unbind due to reversed=
 devres execution order.
- [High] The data polling logic instantly terminates in continuous mode, fa=
iling to wait for readings and silently swallowing I2C communication failur=
es.
- [High] Probe returns success (0) instead of an error code when device mat=
ch data is missing, leading to an uninitialized device state and a subseque=
nt NULL pointer dereference.
- [Medium] I2C write errors are ignored when changing the data rate or scal=
e, silently leaving the software state out of sync with hardware.
--

commit 08fffdde41976a365855c8545a761a652c4906e0
Author: jszczudlo <jakubszczudlo40@gmail.com>

iio: adc: Add ti-ads1110 support to ti-ads1100 driver
   =20
add ADS1100 support
make changing gain and datarate wait for new reading
fix unbalanced regulator disable when removing in singleshot mode

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index aa8946063c7d6..11d6fe1e8abc2 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
[ ... ]
> @@ -85,6 +98,50 @@ static int ads1100_set_config_bits(struct ads1100_data=
 *data, u8 mask, u8 value)
[ ... ]
> +static bool ads11x0_new_data_ready(struct ads1100_data *data)
> +{
> +	int ret;
> +	u8 buffer[3];
> +
> +	ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
> +	if (ret < sizeof(buffer)) {

[Severity: High]
Does this implicit type conversion mask negative error codes?

`sizeof(buffer)` evaluates to a `size_t`. When `ret` is compared to=20
`sizeof(buffer)`, it gets promoted to an unsigned value.=20

If `i2c_master_recv()` returns a negative error code like `-EIO`, it becomes
a massive positive number, bypassing the error check and allowing the driver
to process uninitialized stack data.

This same signedness comparison issue appears in `ads1100_get_adc_result()`=
=20
and `ads1100_setup()`.

> +		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> +		return 0;
> +	}
> +
> +	int return_val =3D FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);
> +
> +	return return_val;

[Severity: High]
Will this polling logic ever actually wait?

According to the datasheet, the ST/BSY bit is always read as 0 in continuou=
s=20
conversion mode. If `ads11x0_new_data_ready()` always extracts a 0,=20
`data_ready` will be 0.

When `read_poll_timeout()` checks `!data_ready`, it evaluates to true
immediately on the first iteration, causing the loop to exit without waitin=
g.

> +}
[ ... ]
> @@ -105,9 +162,10 @@ static int ads1100_get_adc_result(struct ads1100_dat=
a *data, int chan, int *val)
[ ... ]
>  	ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
> =20
> +	pm_runtime_mark_last_busy(&data->client->dev);
>  	pm_runtime_put_autosuspend(&data->client->dev);
> =20
> -	if (ret < 0) {
> +	if (ret < sizeof(buffer)) {
>  		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
>  		return ret;

[Severity: High]
If a partial read occurs, could this leak uninitialized stack memory to
userspace?

If `i2c_master_recv()` returns a positive short read length (like 1), this
error path correctly catches it and returns `ret` (which is 1).

However, the caller `ads1100_read_raw()` expects negative error codes:

drivers/iio/adc/ti-ads1100.c:ads1100_read_raw() {
    ...
    ret =3D ads1100_get_adc_result(data, chan->address, val);
    iio_device_release_direct(indio_dev);
    if (ret < 0)
        return ret;
       =20
    return IIO_VAL_INT;
}

Because `ret` is positive, `ads1100_read_raw()` will bypass its error check
and return `IIO_VAL_INT` (success) while `*val` remains uninitialized.

>  	}
[ ... ]
> @@ -127,7 +185,7 @@ static int ads1100_set_scale(struct ads1100_data *dat=
a, int val, int val2)
[ ... ]
>  	ads1100_set_config_bits(data, ADS1100_PGA_MASK, ffs(gain) - 1);
> =20
> -	return 0;
> +	ret =3D ads11x0_poll_data_ready(data);

[Severity: Medium]
Is it intentional to discard the return value of `ads1100_set_config_bits()`
here?

If the I2C write fails, the hardware and software state will be out of sync,
but the driver will proceed to poll and falsely report successful
configuration changes. The same issue appears in `ads1100_set_data_rate()`.

> +
> +	pm_runtime_mark_last_busy(&data->client->dev);
> +	pm_runtime_put_autosuspend(&data->client->dev);
> +
> +	return ret;
>  }
[ ... ]
> @@ -292,9 +364,13 @@ static int ads1100_setup(struct ads1100_data *data)
>  	return 0;
>  }
> =20
> -static void ads1100_reg_disable(void *reg)
> +static void ads1100_reg_disable(void *data)
>  {
> -	regulator_disable(reg);
> +	struct ads1100_data *ads1100_data =3D data;
> +
> +	/* Disable when not already disabled by the driver */
> +	if (!(ads1100_data->config & ADS1100_CFG_SC))
> +		regulator_disable(ads1100_data->reg_vdd);
>  }

[Severity: High]
Could this leak the `vdd` regulator during device unbind due to the devres
execution order?

Devres executes registered actions in reverse order (LIFO). During unbind,
`ads1100_disable_continuous()` executes first and unconditionally sets
`ADS1100_CFG_SC`.

When `ads1100_reg_disable()` runs immediately after, the `ADS1100_CFG_SC` b=
it
is already set, causing this condition to fail and permanently skipping the
`regulator_disable()` call.

> =20
>  static void ads1100_disable_continuous(void *data)
[ ... ]
> @@ -334,10 +411,18 @@ static int ads1100_probe(struct i2c_client *client)
[ ... ]
> +	model =3D device_get_match_data(dev);
> +	if (!model)
> +		return dev_err_probe(dev, ret,
> +				"Can't set device data\n");

[Severity: High]
Does this return a success code when `device_get_match_data()` fails?

The preceding call to `devm_add_action_or_reset()` succeeds, leaving `ret`
as exactly 0.=20

Passing a 0 `ret` to `dev_err_probe()` will cause the probe function to
return 0 (success) instead of a valid error code (like `-ENODEV`). The
device registers successfully with uninitialized device data, leading to a
NULL pointer dereference when userspace tries to read from the device.

> +
> +	data->data_rate =3D model->data_rate;
> +	data->has_reference_voltage =3D model->has_reference_voltage;
> +
>  	ret =3D ads1100_setup(data);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607183542.3681=
84-1-jakubszczudlo40@gmail.com?part=3D3
