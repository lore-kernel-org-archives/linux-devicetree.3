Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C2933BBD9
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779708317; cv=none; b=MPMfTZE33UTibQtRbl3oJH4SmBuhLlpS2eC4ZeSezvzgH+xvNrRNxaHqd9YNsDUeLXvvj/7uYcAiXPvIr7d8euBe7Czx2OrprYsMLIX6XZ8XesdjgwqwjvFEgHO6xLYh4KmYCdcVtrwsIrply49KtsDMpuMiHBku+AAQXkEGKNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779708317; c=relaxed/simple;
	bh=Tu7thrh5ii+PZRPGD1fWf6GawCNQlvXVL+oFXrx3g0E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r4k2YM7o5g9uJv3kIz3MMHdJlSxQIQjCUFPFhur7kIxsdc9EKUZla7CwtUy5/AJCirorlJtR7c5CLzTxbD7jLCxdeykW7+CvEeHiuSMkfI11/ofPmPaBci3e734fLMzRQzg2ugsZ7hQ1sKHDhH6yW14vzUXVjCeDIQUJQsRP9p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXJYJZJX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXJYJZJX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9671F000E9;
	Mon, 25 May 2026 11:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779708316;
	bh=49Vw8Qi9Y5blgbTykasJGojp+ZJc0Mj9KJPpTfcOFDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CXJYJZJXqRQcu04PB2G8U32Qydze5Fqan8FGIyYwO8CrJEPAMAox5IvQ8UJZhtDKd
	 +o4PhyGCN6z6Fit6Yey9EpyJLcReo3yoFIwneImaJ3ir/NxmuZHuW+5MljttUR2oVG
	 sLGRQ7SYRGbbFadrkzc924M9OC367UziGNv2t22zkwM+41EGwMBKprAtZrEzhseVl2
	 +MQxKPoM3ljR3zCIuJ5pfbBrnIdqKcBmdOVZ0p5JYGcgnbB5M9uxGT0N3YqtQD4CdI
	 jaYEzLr10wg/dVw5zNHo5fYqvmr0ZlUNxCkA08F17wQ5taEgz8Vv88+mLsNR8YcHIz
	 whp2MP2DyjlUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 10/11] iio: adc: hx711: pass iio_chan_spec to
 hx711_reset_read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525105127.180156-11-piyushpatle228@gmail.com>
References: <20260525105127.180156-11-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:25:15 +0000
Message-Id: <20260525112515.7E9671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `iio_device_claim_direct_mode()` allows concurrent sysfs r=
eads to disrupt triggered buffer continuous sampling.
- [High] Out-of-bounds Array Write in `hx711_trigger()` when the timestamp =
channel is enabled.
--

commit b8324538619dcb536bed461da5b5bd5e89ca409b
Author: Piyush Patle <piyushpatle228@gmail.com>

iio: adc: hx711: pass iio_chan_spec to hx711_reset_read

Change hx711_reset_read() to accept the channel descriptor directly and
update its callers accordingly. Split the existing HX711 channel-selection
work into a small helper so a later variant-specific change can add a
matching helper without growing hx711_reset_read() further.

> diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> --- a/drivers/iio/adc/hx711.c
> +++ b/drivers/iio/adc/hx711.c
[ ... ]
> @@ -300,7 +315,7 @@ static int hx711_read_raw(struct iio_dev *indio_dev,
>  	case IIO_CHAN_INFO_RAW:
>  		mutex_lock(&hx711_data->lock);
> =20
> -		*val =3D hx711_reset_read(hx711_data, chan->channel);
> +		*val =3D hx711_reset_read(hx711_data, chan);
> =20
>  		mutex_unlock(&hx711_data->lock);
> =20

[Severity: High]
This is a pre-existing issue, but does this function need to call
iio_device_claim_direct_mode() before accessing the hardware?

If a triggered buffer is active, couldn't a concurrent sysfs read to
in_voltage0_raw take the lock, wait for the device to be ready, and perform
a hardware read?

This might steal a sample from the continuous buffer stream, introduce
massive timing jitter due to gain changes, and disrupt the functional
behavior of the triggered buffer.

[ ... ]
> @@ -390,8 +405,8 @@ static irqreturn_t hx711_trigger(int irq, void *p)
>  	memset(&hx711_data->buffer, 0, sizeof(hx711_data->buffer));
> =20
>  	iio_for_each_active_channel(indio_dev, i) {
> -		hx711_data->buffer.channel[j] =3D hx711_reset_read(hx711_data,
> -					indio_dev->channels[i].channel);
> +		hx711_data->buffer.channel[j] =3D
> +			hx711_reset_read(hx711_data, &indio_dev->channels[i]);
>  		j++;
>  	}
> =20

[Severity: High]
This isn't a bug introduced by this patch, but does this loop correctly
handle the timestamp channel?

Since iio_for_each_active_channel() iterates over all bits set in the
active_scan_mask, wouldn't it include the soft timestamp channel if enabled
by userspace?

If the loop doesn't explicitly skip the timestamp channel, it appears it
would treat it as an ADC channel and call hx711_reset_read() on it, wasting
time on a hardware conversion.

Furthermore, when j reaches 2, writing to channel[j] would be an
out-of-bounds array access on the 2-element array, potentially triggering a
kernel panic when compiled with UBSAN bounds checking.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525105127.1801=
56-1-piyushpatle228@gmail.com?part=3D10
