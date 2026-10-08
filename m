Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B547347045C
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449117; cv=none; b=tZ4ETR9tSrnB5/Wlu0/EK+ICCfFZtoGu4lQBPvLx/SxMzlKK22TOaWjATpZMb90yLZBYviLl92LbFnfP1iLnMTWXVbiepCSXafy2xRdlcD+k4Bz8WynPk5qQSin6OLL0BT8UE4TOFRugwfdqY/NZppCRWbx3pnPbokLUrKet+ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449117; c=relaxed/simple;
	bh=pUam06ILQHSEkPXcPBTTzq4YF8AtfpiCej4gm6uSjM8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dZtBMIbfM4Q0iHOAFXV2bo7mYKYdf+PPRq6VVeqPC+4gaiwnoZAPjHxDaiOOxfrtFGn5Y6nnyuSQQA2/BwZwtnoq5kRtYDXTwlUJ+zkbSnz32uenAi0jWe3hTULRpDJR2I7TbCp9LhnT9AGSiNCZjWzKlac0k44XpP6sHaOc4Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWZJS+zY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWZJS+zY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A38C1F00893;
	Thu,  8 Oct 2026 08:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791449116;
	bh=GT/PwBrDZQYI3UpUyqxTOkvelLz6Z20zBG+KgH2aZLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cWZJS+zYno7B4LRjPHXaXlneoEeAMOlsksByg83FMzBfeUQANSFzObgX4EU1uJqxG
	 Zo5mKgZ+P0r32MuOwyEohWVtfuLkh0JWkLh0NPVxceeTILoKKubs4pj0AUxAce2iyp
	 JOxba5L5DpcN6UM6PRiUOA7HQIVxV/AdFeySx3JxOncXPCPWAeljK7GDBMefahSNI9
	 j2Q+1kpwmJy/8E4E67MQQz4nYFMHZE4Hvho/0WjH3UkICjVZtyecc0XXXxbZ3tlS9Q
	 fYiVFQr85CavF6dj5WcRn9BRycbTbzkBXrGXXQ3rGGSNyFdoxEsrOyYgwhIyEo3WGR
	 LG4S0o2WwPFlQ==
Message-ID: <sashiko-outbox-163851@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] iio: imu: adis16607: Add FIFO-based
 buffered/triggered capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008-adis16607-v2-4-7c94df80878a@analog.com>
References: <20261008-adis16607-v2-0-7c94df80878a@analog.com>
 <20261008-adis16607-v2-4-7c94df80878a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 08:45:15 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] iio: imu: adis16607: Data loss due to FIFO flush in trigger hand=
ler
- [Medium] iio: imu: adis16607: Incorrect FIFO timestamps projected into th=
e future
--

commit e39eeb314e616a23019e35eaf1a136dc6bdb17f7
Author: Radu Sabau <radu.sabau@analog.com>

iio: imu: adis16607: Add FIFO-based buffered/triggered capture

This commit adds buffered capture support using the hardware FIFO on the
adis16607. It introduces a custom trigger handler that pops samples directly
and adds configuration for the FIFO watermark and sysfs attributes.

> diff --git a/drivers/iio/imu/adis16607.c b/drivers/iio/imu/adis16607.c
> index 24eaccaddfa30..90688037cbd31 100644
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
> +	s64 timestamp =3D pf->timestamp;
> +	int ret, i;
> +
> +	mutex_lock(&st->adis.state_lock);
> +
> +	/* Check if FIFO threshold is met */
> +	ret =3D __adis_read_reg_16(&st->adis, ADIS16607_REG_DIAG_STAT, &diag_st=
at);
> +	if (ret)
> +		goto unlock;
> +
> +	if (!(diag_stat & ADIS16607_FIFO_THR_MET_MASK))
> +		goto unlock;
> +
> +	/* Temporarily disable FIFO before reading */
> +	ret =3D __adis_write_reg_16(&st->adis, ADIS16607_REG_USER_FIFO_CFG, 0);

[Severity: Medium]
Will disabling the hardware FIFO here halt the enqueuing of new samples from
the sensor core? If new data is generated while the SPI read is in progress,
it seems those samples could be lost.

> +	if (ret)
> +		goto unlock;
> +
> +	/* Read FIFO word count */
> +	ret =3D __adis_read_reg_16(&st->adis, ADIS16607_REG_FIFO_WORD_CNT, &wor=
d_cnt);
> +	if (ret)
> +		goto reenable_fifo;
> +
> +	/* Calculate number of complete samples */
> +	sample_cnt =3D word_cnt / ADIS16607_FIFO_WORDS_PER_SAMPLE;
> +	if (!sample_cnt)
> +		goto reenable_fifo;
> +
> +	/* Pop and process each sample */
> +	for (i =3D 0; i < sample_cnt; i++) {
> +		ret =3D adis16607_fifo_pop(st, fifo_sample);
> +		if (ret)
> +			goto reenable_fifo;
> +
> +		adis16607_fifo_push_sample(indio_dev, fifo_sample, timestamp);
> +		timestamp +=3D st->sample_period_ns;

[Severity: Medium]
Does this logic project the timestamps of subsequent samples into the futur=
e?
Since the interrupt fires when the FIFO reaches the watermark, pf->timestamp
represents the arrival time of the newest sample in the batch. However, the
FIFO outputs the oldest sample first.

By starting at pf->timestamp and adding st->sample_period_ns for each
subsequent sample, the newest sample ends up with a timestamp in the future:
pf->timestamp + (sample_cnt - 1) * st->sample_period_ns.

Could the timestamp be backdated before the loop instead? For example:
timestamp =3D pf->timestamp - (sample_cnt - 1) * st->sample_period_ns;

> +	}
> +
> +reenable_fifo:
> +	/* Flush FIFO before re-enabling */
> +	ret =3D __adis_write_reg_16(&st->adis, ADIS16607_REG_USER_FIFO_CFG,
> +				  ADIS16607_FIFO_FLUSH_MASK);

[Severity: Medium]
Does flushing the FIFO here drop partial sample remainders or new samples t=
hat
may have accumulated? For continuous buffered capture, dropping data between
reads seems like it would break the continuous data stream.

> +	if (ret)
> +		dev_warn_ratelimited(&st->adis.spi->dev,
> +				     "failed to flush FIFO: %d\n", ret);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-adis16607-=
v2-0-7c94df80878a@analog.com?part=3D4
