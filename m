Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A59D486BAB
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057403; cv=none; b=V2l3hbvXPl0kOGciVZRps7dhhWTXODTQZAv0B6h2DqlDX0MehGpC+c8nYX6sP2893tiplfpbtdGdxDhV7uc8amQsZI2zIMSWzQR2TQl3mxBUEgQskm8E27FnwPWMgl53SUVDN+5PhdpppN/WTN+Dd7GA0BX3sE72wf1tjcFY1wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057403; c=relaxed/simple;
	bh=ZXqWNCXxLuOMQsBTKy6ZO0ksIyVdZzEuIHKZEcHoXHU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ib+rAdX9T+3upJ7jYe++Uxyg6GHTbdGuBKUnKq29gIF7hHS6mPTAO8bCnxLLDzaE55Q/gDhi4xmvIxT0URKfRE0gb4/qgHIosJjhn6a0sg3PLzTi8LE2uhTv7hF52xSXf2ZFQ3xt2GsvckEpzMcimwqIKTvYyEjlg3tPV0nnXxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADWT9dVI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADWT9dVI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640F91F000C4;
	Thu, 15 Oct 2026 09:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057398;
	bh=RH+JeMRxD5sl8WUUwrD9duyiOnYVGsk+LyxVRChWauA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ADWT9dVI6k0eMm2SzgD3vL2GO4UGmZb1dAG4Ept2656OqZefsFtc4Uy/vz5cDF6xZ
	 UcMTFOpkyMuTt/HCz+10aYI3DTo7uFnmlexeY/W3zeVaHWbsx+RtKumBAdirr3rEp5
	 dUZyhb4yC+GT4rLH0l6HLGTxN0oHx8LeVdM9NmrAK+TRtBBfZK/ZQzHtE4nWLZUgqx
	 2xCjn1VLs8rpDUAW9Ea8RXKtQ+kduydpj9jpMfda2Xcvi0XjORw/ZvbDJhvVEccXem
	 W2+OrK/V+kNROOEvDQJRVQm/xSKZ4UfBk0gdKDXOzm/UCnfEB9pTlCm0RSJDcrT13t
	 XNva5orVnMrjQ==
Message-ID: <sashiko-outbox-172589@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] iio: imu: adis16607: Add FIFO-based
 buffered/triggered capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-adis16607-v3-4-f972d4efee85@analog.com>
References: <20261015-adis16607-v3-0-f972d4efee85@analog.com>
 <20261015-adis16607-v3-4-f972d4efee85@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:43:18 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] iio: imu: adis16607: interrupt storm livelock on SPI read failure =
in trigger handler
--

commit 37b208fdae15ca27441d6faa6832234ed11de06d
Author: Radu Sabau <radu.sabau@analog.com>

iio: imu: adis16607: Add FIFO-based buffered/triggered capture

This commit adds buffered capture via the device's hardware FIFO, which
is the only capture mode this driver supports. It handles the specific
command and payload format for FIFO data directly rather than using generic
adislib helpers.

> diff --git a/drivers/iio/imu/adis16607.c b/drivers/iio/imu/adis16607.c
> index 1d471f59f043d..dac1466454156 100644
> --- a/drivers/iio/imu/adis16607.c
> +++ b/drivers/iio/imu/adis16607.c
[ ... ]
> +static irqreturn_t adis16607_trigger_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *indio_dev =3D pf->indio_dev;
> +	struct adis16607 *st =3D iio_priv(indio_dev);
> +	u8 fifo_sample[ADIS16607_FIFO_DATA_LEN];
> +	u16 diag_stat, word_cnt, sample_cnt, threshold;
> +	s64 timestamp;
> +	int ret, i;
> +
> +	mutex_lock(&st->adis.state_lock);
> +
> +	/* Check if FIFO threshold is met */
> +	ret =3D __adis_read_reg_16(&st->adis, ADIS16607_REG_DIAG_STAT, &diag_st=
at);
> +	if (ret)
> +		goto unlock;
[ ... ]
> +unlock:
> +	mutex_unlock(&st->adis.state_lock);
> +	iio_trigger_notify_done(indio_dev->trig);
> +	return IRQ_HANDLED;
> +}

[Severity: High]
Does this code risk an infinite interrupt storm livelock if the SPI read fa=
ils?

If __adis_read_reg_16() fails to read ADIS16607_REG_DIAG_STAT, the handler
jumps to the unlock label and returns IRQ_HANDLED.

Because the register read failed, the hardware interrupt status is not clea=
red
and the DEV_NOK pin remains asserted. Returning IRQ_HANDLED informs the ker=
nel
IRQ subsystem that the interrupt was successfully serviced, which bypasses
the spurious interrupt detector.

When the threaded handler completes and unmasks the IRQ, won't it immediate=
ly
re-trigger and loop forever?

Should the handler return IRQ_NONE on unrecoverable bus errors so the kernel
can eventually disable the screaming interrupt?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-adis16607-=
v3-0-f972d4efee85@analog.com?part=3D4
