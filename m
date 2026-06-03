Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9867930148A
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 19:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780513606; cv=none; b=qcV66Ah4OHI5q93QoJOX11y/ODpORQa1OBDK08DSN8yvZdpV3N6QUWwHTLjxbhK16U+nZpPQNk5d0F+pttYqbjY68RggInhSLeONEOu6oM78Mr0IXwHv0ykEoYTlT7n4oLct6PdRKQOFqwDC7psDjZQfBJj+W1Sn5qhSDQMQ5jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780513606; c=relaxed/simple;
	bh=DISXBdAFKl4RJPct2X5KGmbShED/G7puj+Jvox3Nl1w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oill4tEeO8D1EgRQJZGOUsD0y+rZ94MKRzr/ggluVgtkyTNo6geMxgG6gM5BB/QKcqySC9j2hKgvW8t1Q0kxTR0IPyxBRiptDUJniOScVJLHU96PMnQiSJZoTEg/T7cE0/AuTCHbRWRjpKhkM/PMHNazNk0bEATTSnKM8nZMzIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNHwFCVV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNHwFCVV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0B31F00893;
	Wed,  3 Jun 2026 19:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780513605;
	bh=vYGtiaxUU2O9SeRCaFvnHMK28cpIQmx7FnFS8wYa8JY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fNHwFCVVmxf6ZfAhpLhj3Lfzx6M0xTYFyvn6HUi2gSdNNGQVl6FbDlq/UkQloOGu/
	 Hfelvfeo8aoiFqgJJDJURncsa/E3h7OzPH2vI9YU2JWs8WnFRLZn6HNjF37MWdLMbw
	 QfE5lQCwNkljssGfCHLVJj09Jl+D5JYT9EozCjQPt19l/TEJOToAW4Fv/ywo5mxQeA
	 zuCq57Ltrg+rNkiJza5lK0dqFKwlySU507CR3W7Otf9SoHyBCTybJipMpSqvUgvUBz
	 pyDnOi6xuNr82+xLHhlw2O+KISSmqUA8m7h8FTx+wjzfWzvLHp6u+XTESM+J5TIrKP
	 En80S+nHbOElA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 11/11] iio: adc: hx711: add support for HX710B
Reply-To: sashiko-reviews@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603184859.89693-12-piyushpatle228@gmail.com>
References: <20260603184859.89693-12-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 19:06:44 +0000
Message-Id: <20260603190644.9C0B31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The triggered buffer loop unconditionally performs physical hardwa=
re reads for all active channels, including the IIO soft timestamp channel.=
 For the HX711, `hx711_reset_read()` returns `-EINVAL` for the timestamp ch=
annel; this patch introduces a new `if (ret < 0)` check that catches this e=
rror, prints a failure, and aborts the trigger entirely, completely breakin=
g buffer capture when the timestamp is enabled. For the newly added HX710B,=
 the driver incorrectly interprets the timestamp channel as having `differe=
ntial =3D 0`, performing a ~100ms blocking dummy hardware read and then wri=
ting the result to `hx711_data->buffer.channel[j++]` at index 2, which viol=
ates the `u32 channel[2]` array bounds and risks UBSAN kernel panics.

Pre-existing issues:
- [High] The driver allows `IIO_CHAN_INFO_RAW` sysfs reads to proceed concu=
rrently with triggered buffer captures due to a missing `iio_device_claim_d=
irect()` call, which causes hardware state machine corruption and data loss.
--

commit 4a57ad17002849c3ffed8137401cf0ed7fd81778
Author: Piyush Patle <piyushpatle228@gmail.com>

iio: adc: hx711: add support for HX710B

Add support for the AVIA HX710B ADC, which shares the HX711 GPIO
interface but uses trailing PD_SCK pulses to select the active mode.
Model the HX710B with variant-specific channel tables and IIO info,
track the active channel across conversions, and use the fixed gain
value when computing scale.

> diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> index 5c326f01c5543..e90780dfd34e5 100644
> --- a/drivers/iio/adc/hx711.c
> +++ b/drivers/iio/adc/hx711.c

[ ... ]

> @@ -322,6 +379,9 @@ static int hx711_read_raw(struct iio_dev *indio_dev,
>  		if (*val < 0)
>  			return *val;
>  		return IIO_VAL_INT;

[Severity: High]
This is a pre-existing issue, but does hx711_read_raw() allow
IIO_CHAN_INFO_RAW sysfs reads to proceed concurrently with triggered
buffer captures?

Since there is no iio_device_claim_direct() call to serialize against
the active IIO buffer, a concurrent sysfs read might acquire the lock
between trigger samples.

Because the hardware relies on the trailing pulses of the previous read
to set the channel and gain for the next conversion, could an interleaved
sysfs read clock out data intended for the buffer and reset the hardware,
corrupting the data stream for userspace?

> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*val =3D hx711_data->samp_freq;
> +		return IIO_VAL_INT;
>  	case IIO_CHAN_INFO_SCALE:
>  		*val =3D 0;
>  		mutex_lock(&hx711_data->lock);

[ ... ]

> @@ -399,20 +459,26 @@ static irqreturn_t hx711_trigger(int irq, void *p)
>  	struct iio_dev *indio_dev =3D pf->indio_dev;
>  	struct hx711_data *hx711_data =3D iio_priv(indio_dev);
>  	int i, j =3D 0;
> +	int ret;
> =20
>  	mutex_lock(&hx711_data->lock);
> =20
>  	memset(&hx711_data->buffer, 0, sizeof(hx711_data->buffer));
> =20
>  	iio_for_each_active_channel(indio_dev, i) {
> -		hx711_data->buffer.channel[j] =3D
> -			hx711_reset_read(hx711_data, &indio_dev->channels[i]);
> -		j++;
> +		ret =3D hx711_reset_read(hx711_data, &indio_dev->channels[i]);
> +		if (ret < 0) {
> +			dev_err_ratelimited(hx711_data->dev,
> +					    "read failed: %d\n", ret);
> +			goto out_unlock;
> +		}
> +		hx711_data->buffer.channel[j++] =3D ret;

[Severity: High]
Does this new error check accidentally cause a regression by aborting the
trigger entirely when the IIO soft timestamp channel is enabled?

iio_for_each_active_channel() iterates over the active_scan_mask, which
includes the timestamp channel.

For the HX711, it appears hx711_reset_read() will return -EINVAL for the
timestamp channel. Would this new check catch that and completely abort
the capture without pushing data?

Furthermore, for the newly added HX710B, hx710b_trailing_pulses() seems
to evaluate !chan->differential as true for the timestamp channel. Would
this result in a hardware read that writes to hx711_data->buffer.channel[2],
overflowing the bounds of the u32 channel[2] array?

>  	}
> =20
>  	iio_push_to_buffers_with_timestamp(indio_dev, &hx711_data->buffer,
>  							pf->timestamp);
> =20
> +out_unlock:
>  	mutex_unlock(&hx711_data->lock);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603184859.8969=
3-1-piyushpatle228@gmail.com?part=3D11
