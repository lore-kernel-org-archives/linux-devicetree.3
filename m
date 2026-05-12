Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A2022097
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 00:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778544108; cv=none; b=sw+6MuqNELupH/LMma7i7KTHrEjyxm5L6aT1SWBOdqsoqiioxfWCDEJuYxePws894IPawVhr5NtHFy1e63yAsOC3aDKaPZtpxp6mV9yWKq1RDyrtOkw1XyJsjf03ydmtWIes79MBlfrC3bruT3zHjoo6ouOXG7DYlVPaUxj+2OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778544108; c=relaxed/simple;
	bh=20AbAgRin2P706yRQAdr5YVMHik6slyCy6IbXVIokY8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CnQAGbA18eVkxq2K3Ak660NmVe+JcjG7BgdXOf7dwiWecBDP6nVJITkSFobozk1PH3Pix3gE8urA8puBq+KUmRmnUnf8oTwbs0jNMM8TTcSnxtisqhYXs0UH00iXtOPeIxsJWpccJdI0wuwttLrEPRd7Xl5SMVAMHKrikvUQiK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=at7wIPjP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="at7wIPjP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E74C2BCB0;
	Tue, 12 May 2026 00:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778544107;
	bh=20AbAgRin2P706yRQAdr5YVMHik6slyCy6IbXVIokY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=at7wIPjPLsx39mV5CVoSEp4t1v+nbn/HV/w9wI4zfgmx4sidrr25X8rsgJLmRhGqH
	 U2pJFO4CpCYGqQlYp9/B5G9bWxuC0P4dFPaeJc+39Pd5a7LeM9Ip20c64DEoMRsSVX
	 zBZFNiJ66kEOl/r3mPOz0PSAw4P6IyTNoWSGXeVdfM6LWXRFt8g65In9K2GnISaT2f
	 fN7fqTjkkHGRAnStPzpjZ3xR41MQmbhYOtSXA85WghKSeJRsxoLSElLzcvjiVU3XUU
	 pT7R4FYbmIYiV7Bh/1+HeTcEa1Gz9aKp2oLQ/NDI9HXISRYq3XEcjoEs4rgf1KrsHZ
	 Fr4hjPfmgs1mQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/11] iio: adc: hx711: add support for HX710B
Reply-To: sashiko@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510202657.38326-1-piyushpatle228@gmail.com>
References: <20260510202657.38326-1-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 00:01:46 +0000
Message-Id: <20260512000147.29E74C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The HX710B differential input is incorrectly exposed as two separa=
te IIO channels based on its sampling rate.
- [High] Iterating over the software timestamp channel in `hx711_trigger` c=
auses an out-of-bounds array write and executes invalid hardware reads that=
 corrupt the ADC state.
- [High] The driver fails to update `channel_set` when `hx711_wait_for_read=
y()` fails after a successful `hx711_read()`, leading to desynchronization =
between software and hardware states.
- [High] The trigger handler `hx711_trigger` pushes negative error codes to=
 the IIO buffer as valid data if `hx711_reset_read` fails.
--

commit 6e9823cf49ecd30f482dc404287cf0c66583e3dc
Author: Piyush Patle <piyushpatle228@gmail.com>
Date:   Sun May 10 20:26:55 2026 +0000

    iio: adc: hx711: add support for HX710B

Add support for the AVIA HX710B ADC to the existing hx711 driver.
The patch models the HX710B with variant-specific channel tables
and tracks the active channel across conversions.

> diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> index a0e73aa475de0..fece0dc81058a 100644
> --- a/drivers/iio/adc/hx711.c
> +++ b/drivers/iio/adc/hx711.c
[ ... ]
> @@ -99,14 +104,22 @@ struct hx711_data {
>  	int			gain_set;	/* gain set on device */
>  	int			gain_chan_a;	/* gain for channel A */
>  	int			gain_scale[HX711_GAIN_MAX];
> +	int			channel_set;	/* HX710B active channel */
>  	const struct hx711_chip_info	*chip_info;
>  	struct mutex		lock;
>  	/*
>  	 * triggered buffer
> -	 * 2x32-bit channel + 64-bit naturally aligned timestamp
> +	 * up to 3x32-bit channels + 64-bit naturally aligned timestamp
> +	 *
> +	 * aligned_s64 satisfies the 8-byte alignment requirement for the
> +	 * timestamp. For HX711 (at most 2 active channels), iio_push_to_
> +	 * buffers_with_timestamp() places the timestamp at offset 8
> +	 * (scan_bytes=3D8, already 8-byte aligned), identical to the original
> +	 * 2-channel layout. The extra channel slot for HX710B does not affect
> +	 * the HX711 ABI.
>  	 */
>  	struct {
> -		u32 channel[2];
> +		u32 channel[3];
>  		aligned_s64 timestamp;
>  	} buffer;

Does iterating over the software timestamp channel in hx711_trigger() cause
an out-of-bounds array write?

If all 3 physical channels and the timestamp are enabled, the iteration over
active channels in hx711_trigger() will execute 4 times. Since buffer.chann=
el
only has 3 elements, won't this write past the end of the array on the 4th
iteration?

Also, when hx711_reset_read() is called for the timestamp channel,
chan->address is implicitly 0. hx711_set_hx710b_channel() then calls
hx711_read() which sends exactly 24 pulses to the hardware. The HX710B
requires 25-27 pulses. Could sending 24 pulses leave the hardware in an
undefined state where DOUT never goes low, causing the subsequent
hx711_wait_for_ready() to block the interrupt thread?

[ ... ]
> @@ -283,9 +300,36 @@ static int hx711_set_hx711_channel(struct hx711_data=
 *hx711_data,
>  	return 0;
>  }
> =20
> +/*
> + * Switch the HX710B to the requested channel for the next conversion.
> + * chan->address holds the trailing pulse count (Table 3 in datasheet).
> + * channel_set is updated only after both reads succeed.
> + */
> +static int hx711_set_hx710b_channel(struct hx711_data *hx711_data,
> +				    const struct iio_chan_spec *chan)
> +{
> +	int ret;
> +
> +	if (hx711_data->channel_set =3D=3D chan->channel)
> +		return 0;
> +
> +	ret =3D hx711_read(hx711_data, chan->address);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D hx711_wait_for_ready(hx711_data);
> +	if (ret)
> +		return ret;
> +
> +	hx711_data->channel_set =3D chan->channel;
> +
> +	return 0;
> +}

Could this lead to a desynchronization between software and hardware states
if hx711_wait_for_ready() fails?

If hx711_read() succeeds, the hardware state is immediately updated for the
new channel. But if the subsequent hx711_wait_for_ready() times out, the
function returns without updating hx711_data->channel_set.

If the next trigger event is delayed enough for the device to become ready,
hx711_reset() would skip the hardware reset sequence. When attempting to re=
ad
the old channel, it seems the driver would see channel_set =3D=3D chan->cha=
nnel,
skip sending the configuration pulses, and incorrectly read data from the n=
ew
channel instead.

[ ... ]
>  static int hx711_reset_read(struct hx711_data *hx711_data,
>  			    const struct iio_chan_spec *chan)
>  {
> +	const struct hx711_chip_info *info =3D hx711_data->chip_info;
>  	int trailing_pulses;
>  	int ret;
> =20
> @@ -298,9 +342,16 @@ static int hx711_reset_read(struct hx711_data *hx711=
_data,
>  		return -EIO;
>  	}
> =20
> -	ret =3D hx711_set_hx711_channel(hx711_data, chan, &trailing_pulses);
> -	if (ret < 0)
> -		return ret;
> +	if (info->has_fixed_gain) {
> +		ret =3D hx711_set_hx710b_channel(hx711_data, chan);
> +		if (ret < 0)
> +			return ret;
> +		trailing_pulses =3D chan->address;
> +	} else {
> +		ret =3D hx711_set_hx711_channel(hx711_data, chan, &trailing_pulses);
> +		if (ret < 0)
> +			return ret;
> +	}
> =20
>  	return hx711_read(hx711_data, trailing_pulses);
>  }

This isn't a regression introduced by this patch, but does hx711_trigger()
push negative error codes to the IIO buffer as valid data if
hx711_reset_read() fails?

hx711_reset_read() can return negative error codes like -EIO. Are these
return values assigned directly to the u32 array elements in
hx711_data->buffer.channel?

It appears these error codes would be implicitly cast to large unsigned
integers and pushed to userspace via iio_push_to_buffers_with_timestamp()
without validation.

[ ... ]
> +/*
> + * HX710B channels (Table 3 in datasheet).
> + * 25 pulses (1 trailing): differential input, 10 SPS -> channel 0
> + * 26 pulses (2 trailing): DVDD-AVDD supply monitor, 40 SPS -> channel 2
> + * 27 pulses (3 trailing): differential input, 40 SPS -> channel 3
> + * .address stores the trailing pulse count for hx711_set_hx710b_channel=
().
> + * Channel 2 is used for the supply monitor to avoid aliasing the
> + * channel2 terminal of the first differential pair.
> + */
> +static const struct iio_chan_spec hx710b_chan_spec[] =3D {
> +	{
> +		.type =3D IIO_VOLTAGE,
> +		.differential =3D 1,
> +		.channel =3D 0,
> +		.channel2 =3D 1,
> +		.indexed =3D 1,
> +		.address =3D 1,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),
> +		.scan_index =3D 0,
> +		.scan_type =3D {
> +			.sign =3D 'u',
> +			.realbits =3D 24,
> +			.storagebits =3D 32,
> +			.endianness =3D IIO_CPU,
> +		},
> +	},
[ ... ]
> +	{
> +		.type =3D IIO_VOLTAGE,
> +		.differential =3D 1,
> +		.channel =3D 3,
> +		.channel2 =3D 4,
> +		.indexed =3D 1,
> +		.address =3D 3,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),
> +		.scan_index =3D 2,
> +		.scan_type =3D {
> +			.sign =3D 'u',
> +			.realbits =3D 24,
> +			.storagebits =3D 32,
> +			.endianness =3D IIO_CPU,
> +		},
> +	},

Is it correct to expose the HX710B differential input as two separate IIO
channels based on its sampling rate?

Both the 10 SPS mode (channel 0) and the 40 SPS mode (channel 3) appear to
measure the exact same differential input. Should different sampling freque=
ncies
for the same physical input be exposed via the IIO_CHAN_INFO_SAMP_FREQ
attribute on a single channel instead of duplicating the channel?

Exposing them as separate channels could allow userspace to enable both in a
single triggered buffer scan, which might force the driver to toggle the
hardware state and read the same input twice per scan.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510194947.3199=
7-1-piyushpatle228@gmail.com?part=3D11
