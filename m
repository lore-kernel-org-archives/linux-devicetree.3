Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213AC3BCD3C
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 19:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785872569; cv=none; b=VldhGMeLI48yQdQ23iCScFtZFshzzJeDBA7foIYF9JtmqnQEfWk4G/lOs0yPYEUmkL8dPL+b0flCQ1vkYOOkaXhJS8IZyMEgw3h5m1asqQUUx3MIkln8FmRl+Zy8vw62GncjQ+TePh/XwEglwqmf5M0SefTwTXsCCbvVT2RvGCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785872569; c=relaxed/simple;
	bh=hEVOwQHLJ0n3yBfAeZVzTJMYO75zYbIet3QWMz7f+i8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qX9axqcW5LvN0TbQJ3EYxOgNgoLA+wo8o+YPXx/1WtYq83Gl6F/bGPBAEbmXCJ+JPEWmbkruEBiFuB3uQRWMFED+wd81Szp9401q8FDNGY6ErBbJLg1YajaEizVw/LGZdDLUGHpb0lOZpr7KhTbq3GHKowPo0KJML4JOisbhqKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmeQ489e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmeQ489e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F201F00A3D;
	Tue,  4 Aug 2026 19:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785872568;
	bh=k3kpVDY5AbzrikDToGJ1bOPS0Hh/hrMUX0yM8Qs/cHU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lmeQ489epP3O8Bw2oTzuBecqXe7+GHnnw2e51B5vurJ3/WGd/IFPZ6qFnhXmMqJPw
	 KFWfd6zO55XTQoPsNS+/Kbye9vdCRejCY4/YICY9Jf2rl7OcOxd5YQ1+1mEMC9CzOL
	 AVTyfP1LTQRd0GA6OBltcQrDGqiuzwAgQ2dFne04LnKx/58syAmTPOAV9EpQHOWpW/
	 hM4zFB1iHGyN/xClcGjBTVh0PCgW+Ri9pCz4OGmH8cVWN/UdhmTVov8glAoLqSqW3k
	 Fgs/KWHkOR6AWXWEsTj2Lz80yJJnKsPQSDMZWMfv3QI9AenTozKXBfnxzN6x1GUXfi
	 d6x8DYGN64jPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/3] iio: adc: ti-ads1100: Add ti-ads1110 support to
  ti-ads1100 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804192840.29121-4-jakubszczudlo40@gmail.com>
References: <20260804192840.29121-1-jakubszczudlo40@gmail.com>
 <20260804192840.29121-4-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 19:42:46 +0000
Message-Id: <20260804194247.64F201F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing error check for `ads1100_get_vref_millivolts()` return v=
alue propagates negative error codes to userspace.
- [Medium] Missing state restore on error paths in `ads1100_poll_data_ready=
` leaves the ADC permanently in single-shot mode.
--

--- Patch [3]: [PATCH v9 3/3] iio: adc: ti-ads1100: Add ti-ads1110 support =
to  ti-ads1100 driver ---
commit 1ff426338598760f136ce661b966962981800132
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>

iio: adc: ti-ads1100: Add ti-ads1110 support to ti-ads1100 driver

Add ADS1110 support that have faster datarate than ADS1100, it also uses
internal voltage reference of 2.048V for measurement.

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index 288d209ecf92d..acbf9b96c545d 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
[ ... ]
> @@ -90,6 +114,20 @@ static int ads1100_set_config_bits(struct ads1100_dat=
a *data, u8 mask, u8 value)
>  	return 0;
>  };
> =20
> +static int ads1100_get_vref_millivolts(struct ads1100_data *data)
> +{
> +	int voltage_uV;
> +
> +	if (data->chip_info->has_internal_vref_only)
> +		return ADS1110_INTERNAL_REF_mV;
> +
> +	voltage_uV =3D regulator_get_voltage(data->reg_vdd);
> +	if (voltage_uV < 0)
> +		return voltage_uV;
> +
> +	return voltage_uV / (MICRO / MILLI);
> +}
> +

[Severity: Medium]
Will this return a negative error code (like -EINVAL) to callers that don't
expect it?

If regulator_get_voltage() fails, ads1100_get_vref_millivolts() returns the
error code. However, callers like ads1100_calc_scale_avail() and
ads1100_read_raw() don't check for errors:

drivers/iio/adc/ti-ads1100.c:ads1100_calc_scale_avail() {
    int millivolts =3D ads1100_get_vref_millivolts(data);
    ...
    data->scale_avail[i * 2 + 0] =3D millivolts;
}

drivers/iio/adc/ti-ads1100.c:ads1100_read_raw() {
    case IIO_CHAN_INFO_SCALE:
        *val =3D ads1100_get_vref_millivolts(data);
        ...
}

Could this regression incorrectly expose a negative integer to userspace as=
 a
valid voltage or scale value?

[ ... ]
> @@ -145,7 +183,7 @@ static int ads1100_conversion_busy(struct ads1100_dat=
a *data)
>  static int ads1100_wait_single_conversion(struct ads1100_data *data)
>  {
>  	int data_rate_index =3D FIELD_GET(ADS1100_DR_MASK, data->config);
> -	int data_rate_Hz =3D ads1100_data_rate[data_rate_index];
> +	int data_rate_Hz =3D data->chip_info->available_data_rate_hz[data_rate_=
index];
>  	unsigned long poll_us =3D DIV_ROUND_CLOSEST(USEC_PER_SEC, data_rate_Hz)=
 / 4;
>  	int busy;
>  	int ret;

[Severity: Medium]
If ads1100_wait_single_conversion() returns an error here, does it leave the
ADC permanently stuck in single-shot mode?

Looking at the caller ads1100_poll_data_ready():

drivers/iio/adc/ti-ads1100.c:ads1100_poll_data_ready() {
    ...
    ret =3D ads1100_wait_single_conversion(data);
    if (ret)
        return ret;

    return ads1100_set_config_bits(data, ADS1100_CFG_SC, ADS1100_CONTINUOUS=
);
}

If ads1100_wait_single_conversion() fails, the function returns immediately,
bypassing the step that restores the hardware to continuous conversion mode.

Could this regression cause subsequent continuous reads to fetch stale data
because the ADC stopped converting?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804192840.2912=
1-1-jakubszczudlo40@gmail.com?part=3D3
