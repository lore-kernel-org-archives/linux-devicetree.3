Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD21526D4CA
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 19:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781378725; cv=none; b=CYh/wJ52jGOM30PHcMligt/UqhwMkUVPFKufdqCGn7dqQCLu9jxIt1A+YtBqlXOup2J++yRTANYo1n+UCAPxlg9g2OYrJQZxKNgwpkahf9Jbac/RF+sVJMfOSs5gByY8is6UTntXCsyOxgNqJdnhyiwGuA9Ug0c0DkNwyV98/ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781378725; c=relaxed/simple;
	bh=zHsMqyZrjgWRfl9irCZjAK7m1KDVfJKvaMeHvfsaTA4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s5s4MD4tSYQuV1aXt+0iXw25RHvxugYz/LwTiFJEEWSstBkSjc1mwWR0hKjhaKatU4Sgc2EWHkfP7vemd2Djj0M2dLTcyK1HAyGxFCEukbbZuKLgwJmHxg+P7hB2EvtisRIdy688gvn9NcL2y7F1gWig5EGeB8Naq6FZLCR0cn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oq5+xyaW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oq5+xyaW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E301F000E9;
	Sat, 13 Jun 2026 19:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781378724;
	bh=+D6pZo+9nLPhELG77se2KzHvgn/uiP4syJDsG1SW35I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oq5+xyaWvUsE8SNsIax/5BF38d/M7gQXpms7pHN1WEO0hTRU4qZ1Sh3JnRGFGBu6a
	 NBRjJE8/GMjPsOYyL3gQ7i6SCq2qNDnAUQxKPIEV1EMXep3lO+LfCTCItxbCYrRsZU
	 diReVHJlmMxBLjqa13rh/Mth3RjSmlZeMzDynR/Lhj8Tlkwh9MaB4vaTlonJ+Hl41B
	 PKCc4VQhedOVggQjKP7/iBOt8SoUQ6/uXvgHt0SfQkSrXhs9rTRBwWT9sdmA3bIQ6c
	 zIh0TOj711vZlkZejcBC2qvyPVsy2FkQJuaQInY9ljakNSGcxPl7OGWcWrOTh6TGqp
	 GDG2BgctHTINw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] iio: adc: Add ti-ads1110 support to ti-ads1100
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260613190957.654798-3-jakubszczudlo40@gmail.com>
References: <20260613190957.654798-3-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 19:25:23 +0000
Message-Id: <20260613192524.22E301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Improper casting of negative error codes to boolean causes an aggr=
essive infinite loop during I2C read failures.
- [High] Integer overflow in `ads1100_get_voltage_microvolts` on 32-bit pla=
tforms due to missing parentheses.
- [Medium] I2C negative error codes are incorrectly discarded and squashed =
into a generic -EIO.
- [Low] The driver hardcodes `ARRAY_SIZE(ads1100_data_rate)` to determine t=
he length of dynamically selected data rate arrays.
- [Low] Dropping the `const` qualifier when assigning the firmware device m=
atch data pointer.

Pre-existing issues:
- [High] Missing wait for ADC conversion completion after device power-on c=
auses reads of invalid data.
--

commit 05622ebdba67f2ec5ab414bed153865ba64b4705
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>
Subject: iio: adc: Add ti-ads1110 support to ti-ads1100 driver

Add ADS1110 support that have faster datarate than ADS1100, it also uses
internal voltage reference of 2.048V for measurement.

[ ... ]

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index aa8946063c7d6..76de2466dc53b 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
> @@ -39,17 +40,41 @@
>  #define	ADS1100_SINGLESHOT	ADS1100_CFG_SC
> =20
>  #define ADS1100_SLEEP_DELAY_MS	2000
> +#define ADS1110_REFERENCE_VOLTAGE_MILIVOLTS 2048
> +
> +/* Timeout based on the minimum sample rate of 8 SPS (7500000us) */
> +#define ADS1100_MAX_DRDY_TIMEOUT	7500000

[Severity: High]
Does an I2C read failure cause an aggressive infinite loop when polling for
data readiness?

Looking at ads1100_new_data_ready(), it casts the negative error code
returned from i2c_master_recv() to a boolean:

static bool ads1100_new_data_ready(struct ads1100_data *data)
{
    ...
    ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
    if (ret < 3) {
        dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
        return ret;
    }
    ...
}

Because a negative value evaluates to true, ads1100_poll_data_ready()
receives true, which indicates the device is still busy. This causes
read_poll_timeout() to continue looping rather than breaking.

Consequently, any I2C communication error triggers a rapid polling storm
that hammers the bus repeatedly, blocking the thread and spamming the
kernel log until the 7.5-second timeout expires.

[ ... ]

> @@ -85,6 +110,19 @@ static int ads1100_set_config_bits(struct ads1100_dat=
a *data, u8 mask, u8 value)
>  	return 0;
>  };
> =20
> +static int ads1100_get_voltage_milivolts(struct ads1100_data *data)
> +{
> +	if (data->ads_config->has_reference_voltage)
> +		return ADS1110_REFERENCE_VOLTAGE_MILIVOLTS;
> +	else
> +		return regulator_get_voltage(data->reg_vdd) / MILLI;
> +}
> +
> +static int ads1100_get_voltage_microvolts(struct ads1100_data *data)
> +{
> +	return ads1100_get_voltage_milivolts(data) * MICRO / MILLI;
> +}

[Severity: High]
Can this calculation overflow on 32-bit platforms?

Because MICRO is defined as 1000000UL in linux/units.h, evaluating this
left-to-right multiplies the millivolts by 1,000,000 first. For a typical
5V supply, this evaluates to 5,000,000,000UL.

On architectures where unsigned long is 32 bits, this overflows the
maximum limit and wraps around to 705,032,704. After division by MILLI,
the function incorrectly returns 705,032 microvolts instead of 5,000,000.

This completely breaks the IIO scale and gain math calculations. Would it
be better to add parentheses to divide MICRO by MILLI first?

[ ... ]

> @@ -107,9 +145,9 @@ static int ads1100_get_adc_result(struct ads1100_data=
 *data, int chan, int *val)
> =20
>  	pm_runtime_put_autosuspend(&data->client->dev);

[Severity: High]
This isn't a bug introduced by this patch, but does the I2C read happen
immediately after waking the device, entirely missing the ADC's hardware
conversion delay?

When the device is woken from runtime suspend via
pm_runtime_resume_and_get(), the ADC powers up and begins a new continuous
conversion. However, ads1100_get_adc_result() immediately reads from the
I2C data register without waiting for the conversion to complete (which
takes up to 125ms at 8 SPS).

If userspace periodically polls the ADC at intervals longer than the
2-second autosuspend delay, the device will suspend between every read.
According to the ADS1100 datasheet, reading before the first conversion
is complete returns 0, making the device completely unusable for periodic
polling.

> =20
> -	if (ret < 0) {
> +	if (ret < 2) {
>  		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> -		return ret;
> +		return -EIO;
>  	}

[Severity: Medium]
Is it intentional to discard negative I2C error codes and replace them
with -EIO?

When i2c_master_recv() fails with a negative error code (e.g., -EAGAIN,
-ENXIO), replacing it with a generic -EIO breaks proper error propagation
up the IIO stack. This prevents upper layers from correctly handling
recoverable errors like arbitration loss or restarts.

This is a regression introduced by the patch to fix unhandled short reads.

[ ... ]

> @@ -159,22 +197,17 @@ static int ads1100_set_data_rate(struct ads1100_dat=
a *data, int chan, int rate)
> =20
>  	size =3D data->supports_data_rate ? ARRAY_SIZE(ads1100_data_rate) : 1;
>  	for (i =3D 0; i < size; i++) {
> -		if (ads1100_data_rate[i] =3D=3D rate)
> +		if (data->ads_config->data_rate[i] =3D=3D rate)
>  			return ads1100_set_config_bits(data, ADS1100_DR_MASK,
> -						       FIELD_PREP(ADS1100_DR_MASK, i));
> +					FIELD_PREP(ADS1100_DR_MASK, i));

[Severity: Low]
Is it safe to hardcode the loop iteration count to the size of the
ads1100_data_rate array?

While both ads1100_data_rate and ads1110_data_rate currently have 4
elements, bounding iteration over a pointer that can point to different
arrays using the compile-time size of a specific static array is fragile.
If a new chip variant with a different number of rates is added, this
could cause silent out-of-bounds reads or truncation.

[ ... ]

> @@ -196,7 +229,7 @@ static int ads1100_read_avail(struct iio_dev *indio_d=
ev,
>  	switch (mask) {
>  	case IIO_CHAN_INFO_SAMP_FREQ:
>  		*type =3D IIO_VAL_INT;
> -		*vals =3D ads1100_data_rate;
> +		*vals =3D data->ads_config->data_rate;
>  		if (data->supports_data_rate)
>  			*length =3D ARRAY_SIZE(ads1100_data_rate);

[Severity: Low]
Similarly, does this hardcode the array length exposed to userspace to
the size of ads1100_data_rate regardless of the active hardware
configuration?

[ ... ]

> @@ -338,6 +371,12 @@ static int ads1100_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
> =20
> +	model =3D device_get_match_data(dev);
> +	if (!model)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Can't get device data from firmware\n");
> +
> +	data->ads_config =3D (struct ads1100_config *)model;

[Severity: Low]
Does this explicit cast drop the const qualifier from the static match
data?

The firmware match data returned by device_get_match_data() is a
const void * pointing to a static read-only .rodata structure
(ads1100_config or ads1110_config). Explicitly casting this to a mutable
struct ads1100_config * violates const correctness and risks undefined
behavior if the struct is ever modified by a future patch.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613190957.6547=
98-1-jakubszczudlo40@gmail.com?part=3D2
