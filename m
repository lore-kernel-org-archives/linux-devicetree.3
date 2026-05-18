Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630E52E5B21
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779143967; cv=none; b=pK/etl8pMmWMBTpY/9oVt1oIs+OxyyXxbPaSWcLDYjKML0HMC5S/gg6qcyO72CzIYxuLIYlGgPg0k+2iW9g/piqyrSy1BkuZJrmqUn6728FKRqVKEzBQs5igSFBUcxiMzgGUIPnSxw7iTZ/4zqIgXRveO7LJacR1oiJYaYcKIic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779143967; c=relaxed/simple;
	bh=sM/6zuseC/podVj750k7NNgGLa+UuRQDG8JudP55gE8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=InXckEjH+fLqJ7MY8HVRmt6ao/hjAnde6sRod3R03Lf44m6f8LZ15flM65f6q1MK3xnNgDVoNVj7vYbXq/BsbRLQJl9du5gTBpaKJhy04pxEXNqKXbacwuCcI7M6B5zp/Cf5bGIXWGwoZiL3+XUlmh9NdvNN+K1KFQ0Cp8I/eVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZw3oFfm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZw3oFfm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BEEC2BCB8;
	Mon, 18 May 2026 22:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779143967;
	bh=sM/6zuseC/podVj750k7NNgGLa+UuRQDG8JudP55gE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=XZw3oFfmW5BhgNPUxjK5nkOXxAfiDsOuuRGlRsV5jHiQLIA7kJmBMMTSXVDMdKKgc
	 mA1WxDwKRLavEA4uJQFrHdZNLKqpsTp362iMLYIWs+C/DJF7UDZ4xT+1gtCSFnCje+
	 rgrA0fWX4B2GutkOc+uELpMiMUUhKydfxUgOtwu65SbO1ULrOSe33xBfeZBYYu5yWw
	 /LW1MzAeWVzVWIIAQ+RWLnBBs0v363cknL632NPULT4pfdvmKcXi558qReY2h9N7wo
	 Nkj2OuCUOzT1Ng/9ojUKyXBq0W53naY+Z9sWTYcPT+LDAXt4dRhvjUm/CpKi0q4Md3
	 c14t5y1a7Z2GQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 11/11] iio: adc: hx711: add support for HX710B
Reply-To: sashiko-reviews@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260518220228.63322-12-piyushpatle228@gmail.com>
References: <20260518220228.63322-12-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 22:39:26 +0000
Message-Id: <20260518223926.C2BEEC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The trigger handler incorrectly performs physical ADC reads for th=
e software timestamp channel.
- [Medium] Missing `iio_device_claim_direct_mode()` protection in the newly=
 added `hx710b_write_raw()`.
- [Low] Data race on `samp_freq` when handling `IIO_CHAN_INFO_SAMP_FREQ` re=
ads.
--

commit 63c1473f6788341d410e6d9c03f632bdcaeaf6df
Author: Piyush Patle <piyushpatle228@gmail.com>

iio: adc: hx711: add support for HX710B

This commit adds support for the AVIA HX710B ADC to the existing hx711
driver. It handles the different trailing pulse requirements and fixed
gain scaling, while exposing both 10 and 40 SPS sample rates.

> diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> index 8ec4dee1f451e..20ea667af7254 100644
> --- a/drivers/iio/adc/hx711.c
> +++ b/drivers/iio/adc/hx711.c
[ ... ]
> @@ -323,6 +378,9 @@ static int hx711_read_raw(struct iio_dev *indio_dev,
>  		if (*val < 0)
>  			return *val;
>  		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*val =3D hx711_data->samp_freq;
> +		return IIO_VAL_INT;

Is there a potential data race here?=20

In hx710b_write_raw(), hx711_data->samp_freq is updated while holding
hx711_data->lock. Should this read also be protected by the same mutex to
ensure state consistency?

[ ... ]
> @@ -400,20 +458,26 @@ static irqreturn_t hx711_trigger(int irq, void *p)
>  	struct iio_dev *indio_dev =3D pf->indio_dev;
>  	struct hx711_data *hx711_data =3D iio_priv(indio_dev);
>  	int i, j =3D 0;
> +	int ret;
> =20
>  	mutex_lock(&hx711_data->lock);
> =20
> -	memset(&hx711_data->buffer, 0, sizeof(hx711_data->buffer));
> +	memset(hx711_data->buffer, 0, sizeof(hx711_data->buffer));
> =20
>  	iio_for_each_active_channel(indio_dev, i) {
> -		hx711_data->buffer.channel[j] =3D
> -			hx711_reset_read(hx711_data, &indio_dev->channels[i]);
> -		j++;
> +		ret =3D hx711_reset_read(hx711_data, &indio_dev->channels[i]);

Does this loop incorrectly perform a physical ADC read for the software
timestamp channel when userspace enables it?

When the timestamp channel is enabled, its bit is set in active_scan_mask.
The iio_for_each_active_channel() macro will iterate over it, causing
hx711_reset_read() to execute for the timestamp channel.

For the HX710B variant, chan->differential evaluates to 0 for the timestamp
channel, which causes hx710b_trailing_pulses() to return 2 trailing pulses,
performing an unintentional read over the supply monitor channel.

For the HX711 variant, the timestamp channel sets chan->channel =3D -1.=20
hx711_set_gain_for_channel() then falls into the else branch (since -1 !=3D=
 0),
changing the hardware to channel B and performing a dummy physical read.

In both cases, this forces the driver to wait for the ADC to settle on every
trigger event, which can severely impact the sampling rate. Should this loop
skip the timestamp channel (for example, by checking if the channel type is
IIO_TIMESTAMP)?

[ ... ]
> +static int hx710b_write_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int val, int val2, long mask)
> +{
> +	struct hx711_data *hx711_data =3D iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		if (val !=3D 10 && val !=3D 40)
> +			return -EINVAL;
> +		mutex_lock(&hx711_data->lock);
> +		hx711_data->samp_freq =3D val;
> +		hx711_data->channel_set =3D 0;
> +		mutex_unlock(&hx711_data->lock);
> +		return 0;

Does this implementation need to use iio_device_claim_direct_mode() to
prevent concurrent hardware changes while a buffered capture is active?

If userspace modifies the sampling frequency during an active IIO triggered
buffer capture, it resets channel_set to 0. This could alter the hardware
configuration (changing the trailing pulses) out from under the IIO capture
thread, which violates IIO concurrency semantics.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518220228.6332=
2-1-piyushpatle228@gmail.com?part=3D11
