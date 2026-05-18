Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CA3302CD5
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779144072; cv=none; b=bJrRBMujhPHmLYp4MVp+W38C6qAl6b7/5I4mA5FWUbTGzFnAI7mQz48OyHEWD/hsOMsV5GFtjqBd0iB9cP8mif9vjFZsMYfgDlgBgjVi6HTRTwzs7CEBnBMqR33m9KFJj1tz68jOWtdWS/9WCXP9e2p8deT2b9euXM5+bGIBOKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779144072; c=relaxed/simple;
	bh=pjZOpE/h3pt3f5IsEyUGVZu+dzNOCCyqVw1JpG9DnFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W/seWqyvmKSTzd1Wj5kN+X9ux1HGx/Ekpjb0dk4Lt8J5csItycjoibkkUz2xbaDnfXxVDhr7XcwTQO5UL81xtLJTpLQRLYqrtLIkU8Eo1ltbcofs8W6NXLUgC5dV29DLimxbozEthMkipFqGWlK6vDLbpLANIjFT6BBKKlTQwTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SL5HGJeb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SL5HGJeb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C635CC2BCB7;
	Mon, 18 May 2026 22:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779144072;
	bh=pjZOpE/h3pt3f5IsEyUGVZu+dzNOCCyqVw1JpG9DnFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SL5HGJebJygdwQtXVUFo6CfvDWlVWa2BtxFG2dUYTVqgMiCry3p5/86DaQWPHyVPU
	 0WXkJ4TRScYJgGFKd4fE6kOFmQHC1FgktkAEwoVgyJhnq5dwKZGfd6dOstrfYG7ypH
	 jCJd6O0dE9f1vvH8U0/CZ+tI8xYkWRKUFpUsrN3xI0X4/y1LciMhzf8xvDGJgeD4Kj
	 ap1tiU6XB6uiQm/PYIKdebn/2KYaYNVBY8uhyYXANd1ViyRHSHVghaxcxHBCysfNLl
	 lujKLoKrAI1+/C5hXKilWl0g7RwE6qaFJKrq1FQeES0DH/JSt11IDOgQZwmGGYkP+N
	 5f8Mz2WFXBfvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/11] iio: adc: hx711: pass iio_chan_spec to
 hx711_reset_read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260518220228.63322-11-piyushpatle228@gmail.com>
References: <20260518220228.63322-11-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 22:41:11 +0000
Message-Id: <20260518224111.C635CC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Triggering the buffer with the soft timestamp channel enabled caus=
es a bogus physical hardware read, leading to severe latency spikes and sam=
ple rate degradation.
--

commit ca51c74e19ecc54987d0605c8007f8dcdc337783
Author: Piyush Patle <piyushpatle228@gmail.com>

iio: adc: hx711: pass iio_chan_spec to hx711_reset_read

Change hx711_reset_read() to accept the channel descriptor directly and
update its callers accordingly.

> diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> index d7987c70beec2..8ec4dee1f451e 100644
> --- a/drivers/iio/adc/hx711.c
> +++ b/drivers/iio/adc/hx711.c
[ ... ]
> @@ -391,8 +406,8 @@ static irqreturn_t hx711_trigger(int irq, void *p)
>  	memset(&hx711_data->buffer, 0, sizeof(hx711_data->buffer));
> =20
>  	iio_for_each_active_channel(indio_dev, i) {
> -		hx711_data->buffer.channel[j] =3D hx711_reset_read(hx711_data,
> -					indio_dev->channels[i].channel);
> +		hx711_data->buffer.channel[j] =3D
> +			hx711_reset_read(hx711_data, &indio_dev->channels[i]);
>  		j++;
>  	}

Does this loop cause a bogus physical hardware read when the soft timestamp
channel is enabled?

Because iio_for_each_active_channel() iterates over all bits set in the
active_scan_mask, it includes the soft timestamp channel, passing it
directly into hx711_reset_read().

For the timestamp channel, chan->channel is -1. When passed down to
hx711_set_gain_for_channel(), any non-zero channel is treated as the
secondary physical channel (Channel B), forcing a hardware channel switch.

Since switching channels on the HX711 requires a dummy read and up to a 400=
ms
settling time handled in hx711_wait_for_ready(), toggling between Channel A
and the Timestamp channel on every trigger could introduce an ~800ms
blocking delay per sample.

Is it necessary to explicitly skip the timestamp channel during the hardware
read loop here, perhaps by checking chan->type !=3D IIO_TIMESTAMP?

A related concern originally flagged an out-of-bounds array write to
buffer.channel[2] here, leading to a UBSAN panic. While that specific memory
safety issue is fixed later in the series by commit "iio: adc: hx711: add
support for HX710B" which safely bounds the buffer using
IIO_DECLARE_BUFFER_WITH_TS(), the underlying logic error of triggering a bo=
gus
hardware read for the timestamp channel appears to remain unfixed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518220228.6332=
2-1-piyushpatle228@gmail.com?part=3D10
