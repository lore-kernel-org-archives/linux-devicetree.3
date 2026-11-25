Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795576081;
	b=PMG3O/SWmoB5gKx2LXi+vZgxpxdAb12G5tetwFeGXchjmFNIVnp/aEf3RnN60bqJyINM
	 BMmChlBbfXkVAlaZKaFSuOhdLsOfviQvoDMlCxY8o+aasXbQV3ykJcRM0aXQIb2Xgot4o
	 39eJ1bo+rwVywEiuOq1fUxSYjzaD3IY4E+nu4WKC4oWAaKF6OxjLckA6aT+K0RknBaCTm
	 P+XSaO2jJBvjUG02Kd15jji6ljl6XoZvaPdpZT2GZwM4dQR42rjOrR3bXQbmkjUo6vF74
	 looU4FvKnowPeyd/cy2mlKtx5sfuTMwMwNXh56WcBzxk+fZkXMJ6d3p2nnTk2bryFNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795576081;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Mk0fMlJS+B0Ma4jvmztU916YwEOp7p+vuBj2RdHrdUA=;
	b=SeRs1BXYHRcfjYvn6U1Z2qtbN73BSeJEcN5bWDkgekGEyLDOPZwkfA2yPcD5QOxcaZ/O
	 ks2iWZ8ONUn6o2k0E2+HBP+V6tdiwVSZRmyqMh1zqFghSDEXdXe2tK3AwWUlP86JKyFds
	 0ftNqFw0kbXpuCvUnc+VKgTBqYilu6D31Vjon7iCss/BZUAWWDqB7tFWolO6wm9Y9n+pt
	 sqfXtYfbnfMFLXgAeDDmwqPWrqOCtepwbEQ5Z60KIPcIu++Wte3JIoygEVp3ZUjpLkhfT
	 ayNS3JsLPeecOPIdmLjEb+OsrnTPexQSnmJYYE8M3827D6uWJJHiMz/qgLG0zhaQfdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KOaxwLp2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48552606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KOaxwLp2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2BE1F000D1;
	Wed, 25 Nov 2026 03:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795576081;
	bh=Mk0fMlJS+B0Ma4jvmztU916YwEOp7p+vuBj2RdHrdUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KOaxwLp2M4Q+HoJ1a5E8RiC11FNF4SkQoMVYAFTk80/VFBjxsnESw7gZ2RaGDFi9F
	 R+UCodV29q+JaJAbbLaaX5sXU/bSmjk0f02SFYCdIos+Liy6JL18Oy7iOH79nc4bRK
	 6PFV1RHBoeNTojl95PgEmW4Mt7ApQzRr3oRWz3ndDjdBnXSnJUdG+gdvX4p53fSOtg
	 1Yli3LRjThi9U1mutgAG3MDQEFiovwwIr2uyd/7TtoBiaQJv6mRpLuCy2n+BakJTBw
	 c295hgVxq51h0hJhmSvLyoVMrGDxPYDWTz4PhoZoLf0tzQErV1v6raj+qIEOLcX+od
	 m8u8z4FK0Hpdg==
Message-ID: <sashiko-outbox-232450@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] iio: temperature: add support for Analog Devices
 MAX30210
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125025425.1176-3-johnerasmusmari.geronimo@analog.com>
References: <20261125025425.1176-1-johnerasmusmari.geronimo@analog.com>
 <20261125025425.1176-3-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 03:08:00 +0000
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
- [Medium] iio: temperature: max30210: stale status bits trigger
  spurious IRQs
--

commit 2a3214dc2717ef12f1999e87ec7c0d52ca73b003
Author: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

iio: temperature: add support for Analog Devices MAX30210

This commit adds an IIO driver for the Analog Devices MAX30210 I2C
temperature sensor with support for direct reads, threshold events, and
a 64-sample hardware FIFO buffer.

> diff --git a/drivers/iio/temperature/max30210.c b/drivers/iio/temperature=
/max30210.c
> new file mode 100644
> index 0000000000000..5f704bf9a8480
> --- /dev/null
> +++ b/drivers/iio/temperature/max30210.c
[ ... ]
> +/* The core calls this after hwfifo_set_watermark(), so the watermark is=
 stable here. */
> +static int max30210_buffer_postenable(struct iio_dev *indio_dev)
> +{
> +	struct max30210_state *st =3D iio_priv(indio_dev);
> +	unsigned int status;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	/*
> +	 * Clear a stale A_FULL so it cannot fire on the flushed FIFO. With
> +	 * no autoconv user no threshold event is armed, so STATUS holds
> +	 * nothing worth keeping; otherwise leave it for the IRQ handler.
> +	 */
> +	if (!st->autoconv_users) {
> +		ret =3D regmap_read(st->regmap, MAX30210_STATUS_REG, &status);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D max30210_autoconv_get(st);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_set_bits(st->regmap, MAX30210_INT_EN_REG,
> +			      MAX30210_STATUS_A_FULL_MASK);

[Severity: Medium]
Does skipping the MAX30210_STATUS_REG read when st->autoconv_users is
non-zero leave a stale MAX30210_STATUS_A_FULL_MASK bit latched?

When a threshold event is enabled first, autonomous conversions run with
MAX30210_STATUS_A_FULL_MASK masked in MAX30210_INT_EN_REG, filling the
unmonitored FIFO until A_FULL latches in MAX30210_STATUS_REG.  When the
buffer is then enabled, max30210_buffer_preenable() flushes the FIFO
without clearing MAX30210_STATUS_REG, and unmasking
MAX30210_STATUS_A_FULL_MASK here immediately fires an interrupt that
calls max30210_fifo_read() on the empty FIFO.

Similarly, max30210_write_event_config() enables
MAX30210_STATUS_TEMP_HI_MASK or MAX30210_STATUS_TEMP_LO_MASK in
MAX30210_INT_EN_REG without clearing stale threshold bits latched in
MAX30210_STATUS_REG during earlier conversions, which immediately pushes
a spurious threshold event.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125025425.1176=
-1-johnerasmusmari.geronimo@analog.com?part=3D2
