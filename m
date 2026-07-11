Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F902E11C7
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 18:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783796237; cv=none; b=S0UT+s9d1RpKJL2RTtHZMPcAN68MckUDe0uDxATa8p/fJgnhfoBTgDrV6WT9D9NTr9Qi1cpGAVSeNVwxl3bcBax1GajGYa0sztYUPoDGfeEj0Bj0PwAjDVoQJXXWbmpRgC2XpdYt5hXIrUAGTKFQjv/pzbIZqEzv4gyuLMgd2L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783796237; c=relaxed/simple;
	bh=O+fJLmfDil9zG4Pq3EDtMyIu+sxNWskfJN6iq2Hf4Bk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AzQk4Ugy7EEMtVDS3ekoWpuKx0DzmmEzVNCFpT8NZAEFJWanmtmqavGy1bRiceu9pF6RPL4JRWdZxvWT10H9N1Lcm5s6SNcyT/jXJnakL8FfBM9ki4PAU3EqB6HWQuC0Xgt7CfuICz84miZo+6qZoBxx+ZjIA1Jr7DVB6r4zg+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLZdHNlm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLZdHNlm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DA01F000E9;
	Sat, 11 Jul 2026 18:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783796235;
	bh=CylZtgliIRqf//vPoFL+gSSkv4wJNXi6Hf3n44DsExc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HLZdHNlm/qo24Hy+8KgYfC8iq0FC+41V76/QfFx5zsjLOvtkxit4jNORSKCmrw0jW
	 zNGUb2kQVVYyGiWyqM3Fi5kMB5wY/M537QN5NI5dAWYiZlXGoheRsDePshfXfe7Osj
	 aaNGyPtbgLRe4g5NLYvpV1mkXarQAMekzf2cETPwwH2B5Es+MQxvJyMXlvuIN3jNHd
	 5DyVhny+0TTWcXpRW7L/hSsok3ynarDJ1LvXCY9THqhTBRSK+2cpahAp6S5Amn4u9/
	 CWdS9maLDGPOca4RzJp40POcGSMfuZxbgFA31n5QK5/Wd7me6iAHGp92fUvhCKdoWi
	 ghxFsWye+h/UA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] iio: adc: Add ti-ads1110 support to ti-ads1100
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260711184414.1013686-4-jakubszczudlo40@gmail.com>
References: <20260711184414.1013686-1-jakubszczudlo40@gmail.com>
 <20260711184414.1013686-4-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 18:57:14 +0000
Message-Id: <20260711185715.76DA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Incorrect polling condition in `readx_poll_timeout` causes prematu=
re loop termination and timeouts.
- [Medium] Negative error codes from `regulator_get_voltage` are propagated=
 without checks, leaking to userspace as valid scale values.
- [Medium] The IIO device name is hardcoded to "ads1100", ignoring the newl=
y introduced `name` field in `ads1100_config`.
- [Low] The Kconfig help text erroneously claims the device speeds are in '=
MSPS' rather than 'SPS'.
- [Low] Typo in function name: `ads1100_get_vref_milivolts` instead of `mil=
livolts`.
--

--- Patch [3]: [PATCH v6 3/3] iio: adc: Add ti-ads1110 support to ti-ads110=
0 driver ---
commit 28295190b9a9db57f2e01d15ded56ba73c22d69b
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>

iio: adc: Add ti-ads1110 support to ti-ads1100 driver

Add ADS1110 support that have faster datarate than ADS1100, it also uses
internal voltage reference of 2.048V for measurement.

> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 1c663c98c6c96..2459ff2af1050 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1765,11 +1765,14 @@ config TI_ADS1018
>           called ti-ads1018.
> =20
>  config TI_ADS1100
> -	tristate "Texas Instruments ADS1100 and ADS1000 ADC"
> +	tristate "Texas Instruments ADS1100 and similar single channel I2C ADC"
>  	depends on I2C
>  	help
> -	  If you say yes here you get support for Texas Instruments ADS1100 and
> -	  ADS1000 ADC chips.
> +	  If you say yes here you get support for TI single channel I2C Analog
> +	  Devices.
> +	  * ADS1000 12-Bit, 128 MSPS Analog-to-Digital Converter
> +	  * ADS1100 16-Bit, 128 MSPS Analog-to-Digital Converter
> +	  * ADS1110 16-Bit, 240 MSPS Analog-to-Digital Converter

[Severity: Low]
Does this code use the correct units for the datarate?

The ADS1100 and similar hardware typically operate at 8 to 240 SPS
(Samples Per Second). MSPS implies millions of samples per second,
which seems too high.

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index 6ad80d42d390a..06892ebc593d0 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
> @@ -90,6 +114,20 @@ static int ads1100_set_config_bits(struct ads1100_dat=
a *data, u8 mask, u8 value)
>  	return 0;
>  };
> =20
> +static int ads1100_get_vref_milivolts(struct ads1100_data *data)

[Severity: Low]
This isn't a bug, but there is a typo in the function name
ads1100_get_vref_milivolts (milivolts instead of millivolts).

> +{
> +	int voltage_uV;
> +
> +	if (data->ads_config->has_internal_vref_only)
> +		return ADS1110_INTERNAL_REF_mV;
> +
> +	voltage_uV =3D regulator_get_voltage(data->reg_vdd);
> +	if (voltage_uV < 0)
> +		return voltage_uV;

[Severity: Medium]
Does this leak negative error codes to callers?

If regulator_get_voltage() fails, it returns a negative error code
like -EINVAL. Callers like ads1100_read_raw() and ads1100_calc_scale_avail()
appear to use the return value from ads1100_get_vref_milivolts() without
checking for errors. This could expose negative scale values to userspace.

> +
> +	return voltage_uV / (MICRO / MILLI);
> +}
> =20

> @@ -144,7 +182,8 @@ static bool ads1100_new_data_not_ready(struct ads1100=
_data *data)
> =20
>  static int ads1100_poll_data_ready(struct ads1100_data *data)
>  {
> -	int data_rate_Hz =3D ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK, data-=
>config)];
> +	int data_rate_index =3D FIELD_GET(ADS1100_DR_MASK, data->config);
> +	int data_rate_Hz =3D data->ads_config->available_data_rate_hz[data_rate=
_index];
>  	/* To be sure we wait 5 times more than data rate */
>  	unsigned long wait_time_us =3D DIV_ROUND_CLOSEST(USEC_PER_SEC, 5 * data=
_rate_Hz);
>  	bool data_ready;

[Severity: High]
Does this function terminate polling prematurely?

When readx_poll_timeout() is called later in ads1100_poll_data_ready()
to wait for the conversion:

    return readx_poll_timeout(ads1100_new_data_not_ready, data,
                 data_ready, data_ready !=3D 0,
                 wait_time_us, ADS1100_MAX_DRDY_TIMEOUT_US);

The termination condition used is data_ready !=3D 0. However, the polled
function ads1100_new_data_not_ready() reads the busy bit and returns true
(non-zero) when the device is still busy, and false (zero) when the data
is ready.

Does this cause readx_poll_timeout() to immediately return success when
the device is busy, or loop until a timeout occurs if the device is ready?

> > @@ -397,6 +432,11 @@ static int ads1100_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
> =20
> +	data->ads_config =3D i2c_get_match_data(client);
> +	if (!data->ads_config)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Can't get device data from firmware\n");
> +

[Severity: Medium]
Is the IIO device name hardcoded to ads1100 instead of using the
name from ads1100_config?

Earlier in ads1100_probe(), the code sets:

    indio_dev->name =3D "ads1100";

Since the newly introduced ads1100_config struct adds a name field
(e.g. ads1110), does hardcoding the name ignore the config and
potentially break userspace device matching for the ADS1110?

>  	ret =3D ads1100_setup(data);
>  	if (ret)
>  		return dev_err_probe(dev, ret,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711184414.1013=
686-1-jakubszczudlo40@gmail.com?part=3D3
