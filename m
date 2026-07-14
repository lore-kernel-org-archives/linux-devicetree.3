Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9F5423EAD
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059641; cv=none; b=EocdHxtcKLrjZrbGwGLhZ+ubQ0ajxwTI6vrMk/4FwuDSY+v0EqnBO7v+QHfpk0jHbDy0ML7UqQOpjVnDf03af1beSUcBn5hmMDH/j6vnt451pzjGvM9kFuWueo6JnSy5OA8mGhalRQv8yvpxmmKu98SEex9XzXwYeNHkI9pMKtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059641; c=relaxed/simple;
	bh=hu3gtGx9m9Z4XoKNl0CiHKclij4H8HJvfWF8GmnbWXw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aJm3L+ggkjW3oVXY9hv4C62A5wLm09yeoi8ECXyTJ6Iaibr5GS2hVSCiT53K2EFP19AH4fCHLhtycLdZvfwwsltbIr7G5KRGGPmIKy8VJUfYwlKz67AzpZMe9TROIe2prqPtni1TGz4KzORc7N9UCX+K4ptKD9DGz+aT6MIJvIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQgMZT7R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQgMZT7R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F219A1F000E9;
	Tue, 14 Jul 2026 20:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784059640;
	bh=xjNqXuwPPzEvD/tsaYeKTDN6oH88zdVfZyO58zSsN+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KQgMZT7R1jGMacJhOC8QvarLYci1NKWbkPfnGatKkePZsZIeFRQzPIEbpPOzBnbeX
	 bNSoNFGSlOsfOY5ZgOMlRFHiGRySmv8Fd0vLLZ17WNacD+NjdKDVt0hoMqh6e7V31w
	 QnUQqc11+fEZxBWsKS60gxVrNWtm+ME9jQ0K0wRFkl+qQQJKgZW98epYrQe36x14Xx
	 eUzgmrl39v+p06JncaYPqe8ITSiBM1v+QeGSCVS59g4ojLmqCrUeaYVn3mw/pMZy6X
	 OSZbaC+o71c4KrkE/MFcl7dgerbIk3SFeP1grXstO7VmxnLqlgN5AY56PGPUW4sSBz
	 WqONgyfY37BQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] iio: adc: ti-ads1100: Add ti-ads1110 support to
 ti-ads1100 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260714195528.597753-4-jakubszczudlo40@gmail.com>
References: <20260714195528.597753-1-jakubszczudlo40@gmail.com>
 <20260714195528.597753-4-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:07:19 +0000
Message-Id: <20260714200719.F219A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Inverted polling condition in ads1100_poll_data_ready causes 7.5s =
hangs and missed data.
- [Medium] Unhandled negative error code from ads1100_get_vref_millivolts()=
 leaks to userspace.
--

--- Patch [3]: [PATCH v7 3/3] iio: adc: ti-ads1100: Add ti-ads1110 support =
to ti-ads1100 driver ---
commit 0307e42b36df78ace85fb2bcabb35c647c1a78d3
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>

iio: adc: ti-ads1100: Add ti-ads1110 support to ti-ads1100 driver

This commit adds support for the ADS1110 ADC. It provides faster data rates
than the ADS1100 and uses an internal voltage reference of 2.048V.

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index f0a30ae139afa..5d798bfcc74e1 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
[ ... ]
> @@ -144,7 +182,8 @@ static int ads1100_new_data_is_ready(struct ads1100_d=
ata *data)
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
>  	int data_ready;

[Severity: High]
Does the inverted break condition in ads1100_poll_data_ready() cause the
polling loop to hang when data is ready?

Further down in this function, the readx_poll_timeout() call evaluates
the data_ready variable:

    ret =3D readx_poll_timeout(ads1100_new_data_is_ready, data,
                             data_ready, data_ready !=3D 0,
                             wait_time_us, ADS1100_MAX_DRDY_TIMEOUT_US);

It looks like ads1100_new_data_is_ready() returns 0 when ready, 1 when busy,
and a negative code on I2C error.

Since readx_poll_timeout() stops looping when its condition evaluates to tr=
ue,
data_ready !=3D 0 would cause it to silently exit on busy or error states, =
but
hang and loop until the 7.5s timeout when data is actually ready.

[ ... ]
> @@ -230,14 +269,9 @@ static int ads1100_set_data_rate(struct ads1100_data=
 *data, int chan, int rate)
>  	return ads1100_poll_data_ready(data);
>  }
> =20
> -static int ads1100_get_vdd_millivolts(struct ads1100_data *data)
> -{
> -	return regulator_get_voltage(data->reg_vdd) / (MICRO / MILLI);
> -}
> -
>  static void ads1100_calc_scale_avail(struct ads1100_data *data)
>  {
> -	int millivolts =3D ads1100_get_vdd_millivolts(data);
> +	int millivolts =3D ads1100_get_vref_millivolts(data);

[Severity: Medium]
If regulator_get_voltage() fails inside ads1100_get_vref_millivolts(),
will this permanently cache a bogus negative error code (like -EINVAL) in
the scale_avail array?

>  	unsigned int i;
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(data->scale_avail) / 2; i++) {
[ ... ]
> @@ -296,12 +331,12 @@ static int ads1100_read_raw(struct iio_dev *indio_d=
ev,
>  		return IIO_VAL_INT;
>  	case IIO_CHAN_INFO_SCALE:
>  		/* full-scale is the supply voltage in millivolts */
> -		*val =3D ads1100_get_vdd_millivolts(data);
> +		*val =3D ads1100_get_vref_millivolts(data);

[Severity: Medium]
Can an unhandled negative error code from ads1100_get_vref_millivolts() leak
to userspace here?

If the VDD regulator driver fails to return its voltage, *val will contain
the negative error code. Because the function returns IIO_VAL_FRACTIONAL_LO=
G2
instead of the error, this masks the failure from the IIO core.

>  		*val2 =3D 15 + FIELD_GET(ADS1100_PGA_MASK, data->config);
>  		return IIO_VAL_FRACTIONAL_LOG2;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714195528.5977=
53-1-jakubszczudlo40@gmail.com?part=3D3
