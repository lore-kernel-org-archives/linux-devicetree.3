Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363349;
	b=YlYsN5SAQLiu28ckdBq7WJwGAYihW2t/uFJ4gb0YIh5kY0UmYUjGIavyysVMEz1RdhZm
	 gPtGhrXAB+YX0eYrak20NkEhLATp1ROxyNBGHRmpjKVAVvycVIf9U4ilEP18MT+WaBfYO
	 iesCDNFbdyRsLMgZhKQEdSWeuOLf5Jvcxes7+/UZbW9gCi2RLkxKIllLOx5bhUDyeqiJ0
	 3zpIlXu3oLsJSSTb4ItXX0SffdLNrsl0lnri/+WnlRvg98UCTdPtY/LfXO64df0G1oSn2
	 cY7FF5Mf98wNVTm7AjgHL3J/hLF6DEGzbZX9Pejsl6dAWYuaWzKDsgr6lPM/24HJ0CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363349;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7vpnYKecBheIRqGYAUltSOZHBVUrY1j9/g7IBPpgnCU=;
	b=tDRZPatXL3wDBvw1SBxrsX3A9QaCvI0TSa91YBbKZLmRCf2lQIpTroAJmvr3qAEwKYeT
	 u9t7ejhxOziBpdoaeKeCahuMDiqMURC1IUrx/SeHnPUY0+61kBiXvMwRSamWzMfV7igXM
	 Ji5MGpkr0jZjS9lKjE7oKSxUVq8gKv7dT3P+vXxsO3dyk6lAtixeVQ+Py6b5wwGktYqPt
	 9lrTfU10NC+lXa93C4Npkfd+YM1yhO84U8o106rQjO+QbhXZqfptYotGSbzS+Jk1nSDWZ
	 FXQU1Krv4uG4LO9CnhzGVvxMWJkkqgK8ou3s5oKl7qSl3NuNUYqiKvQ+In5A5ZfAz3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NNL3KtIX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A735606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 02:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NNL3KtIX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61D91F0089F;
	Wed, 11 Nov 2026 02:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794363348;
	bh=7vpnYKecBheIRqGYAUltSOZHBVUrY1j9/g7IBPpgnCU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NNL3KtIXLtooiGU7HgvybrkhHDSbmXvXEXWfAqNClicZFN2h0uhRmczqSLwOotdrf
	 SaklFBBdXxUblj3mnofg/g8KXGB5vMaEmwqyV1RLsbEQN1ictLs/uTL+dfC3NDwwAz
	 8GoyiwOUtHnA3eWeBO9sZu38JWmviGEGsLm5fKXz++i1aEFDUAiwMj20pYMSNrULyC
	 I6HuLOxaWNV1qlfs7SZgYo63KROBlpQxJGxZu+m+cMfC47IMyJ3sxIM+/DbsMUz0/w
	 mlhzhAE/zsHfa66KrvgjgVu6MnbX5j5Tq8GuFCXkrm9K/n8S3PwTF7/bOpb62m3csA
	 Mx19tg6N9tRaA==
Message-ID: <sashiko-outbox-208073@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: pressure: dps310: add a data-ready trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rupesh Majhi" <zoone.rupert@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110154254.39092-3-zoone.rupert@gmail.com>
References: <20261110154254.39092-1-zoone.rupert@gmail.com>
 <20261110154254.39092-3-zoone.rupert@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 02:15:48 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] iio: pressure: dps310: blocking temp wait in
  dps310_fill_channels() on IRQ
--

commit f0cb91c380b85ec52615026366938a6f2c5145ae
Author: Rupesh Majhi <zoone.rupert@gmail.com>

iio: pressure: dps310: add a data-ready trigger

This commit registers an IIO trigger backed by the DPS310 pressure
data-ready interrupt on SDO and uses the interrupt timestamp when
capturing scans with the device's own trigger.

> diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
> index 5cee23986f307..76738360e528e 100644
> --- a/drivers/iio/pressure/dps310.c
> +++ b/drivers/iio/pressure/dps310.c

[ ... ]

> @@ -1375,6 +1391,7 @@ static irqreturn_t dps310_trigger_handler(int irq, =
void *p)
>  		s32 channels[2];
>  		aligned_s64 timestamp;
>  	} scan =3D { };
> +	s64 timestamp;
>  	int rc;
> =20
>  	mutex_lock(&data->lock);
> @@ -1383,7 +1400,12 @@ static irqreturn_t dps310_trigger_handler(int irq,=
 void *p)
>  	if (rc)
>  		goto err;
> =20
> -	iio_push_to_buffers_with_ts(iio, &scan, sizeof(scan), iio_get_time_ns(i=
io));
> +	if (iio_trigger_using_own(iio))
> +		timestamp =3D data->irq_timestamp;
> +	else
> +		timestamp =3D iio_get_time_ns(iio);
> +
> +	iio_push_to_buffers_with_ts(iio, &scan, sizeof(scan), timestamp);
> =20
>  err:
>  	iio_trigger_notify_done(iio->trig);
> @@ -1391,6 +1413,97 @@ static irqreturn_t dps310_trigger_handler(int irq,=
 void *p)
>  	return IRQ_HANDLED;
>  }
> =20
> +static irqreturn_t dps310_irq_handler(int irq, void *private)
> +{
> +	struct dps310_data *data =3D private;
> +
> +	data->irq_timestamp =3D iio_get_time_ns(data->iio);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static irqreturn_t dps310_irq_thread(int irq, void *private)
> +{
> +	struct dps310_data *data =3D private;
> +	unsigned int status;
> +
> +	if (regmap_read(data->regmap, DPS310_INT_STS, &status))
> +		return IRQ_NONE;
> +
> +	if (!(status & DPS310_INT_STS_PRS))
> +		return IRQ_NONE;
> +
> +	iio_trigger_poll_nested(data->trig);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
When the pressure sampling rate is higher than the temperature rate (for
example, any pressure rate above the 1 Hz default temperature rate), does
dps310_trigger_handler() block waiting for the next temperature conversion
before reading the pressure sample that fired DPS310_INT_PRS?

dps310_irq_thread() clears DPS310_INT_STS and calls
iio_trigger_poll_nested() -> dps310_trigger_handler() ->
dps310_fill_channels():

drivers/iio/pressure/dps310.c:dps310_fill_channels() {
	/* Compensation needs a temperature, so it is sampled either way */
	rc =3D dps310_read_temp_raw_locked(data);
	if (rc)
		return rc;
    ...
	if (test_bit(DPS310_SCAN_PRESSURE, scan_mask)) {
		rc =3D dps310_read_pres_raw_locked(data);

Reading DPS310_TMP_BASE clears DPS310_TMP_RDY, so on the next pressure
interrupt dps310_read_temp_raw_locked() sleeps until another temperature
measurement finishes.  While it sleeps, pressure capture is throttled to
the temperature rate, new pressure conversions overwrite DPS310_PRS_B0..B2
so the newer sample is pushed with the earlier data->irq_timestamp, and
DPS310_INT_STS_PRS is re-latched without being cleared by
dps310_read_pres_raw_locked() (leaving SDO asserted, which causes an
immediate spurious interrupt on level-triggered IRQs or stalls
edge-triggered IRQs).

Should dps310_fill_channels() read pressure first and use
dps310_refresh_temp_locked() like dps310_read_pressure_value() does?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110154254.3909=
2-1-zoone.rupert@gmail.com?part=3D2
