Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748832;
	b=E7aFcERPdjLun9r9NCM2ZYUKucZWCLeyJQI0K7HkkGHY6mccUszJZomnqz03S6SD0HTY
	 LfcR2F+hvPKDg6ri50ZF6airffX1w6MEvtv3tPFc3Hxu18IV5YRrDM2N5kjxFja4cPFVK
	 28ZYajNeUa1Up25RalhQsRt5ooVvyQkzDQHW158+afOp7DCpCEktOlmLPQhDaZc5gTzVp
	 6mD60h7qgS8URKHdNJIrtt7uLLP/njxlCYRmy2fDPnbDoR7yG8EolpVw4/oDEPsLXzExM
	 NDGZJY0074Mu1AYmFAPRluEX9SvNGespAQt3n02qyxSvNnt+Ge+OrGXA8Cqg4y/DXAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748832;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Xwh6yfWoxvJ5QkKyA/2mt4aaED8CSnIdM0PpZ4sz58k=;
	b=GBVH7VWe/OeIJO1FIJJ0N+gtmDG6cbuDmG4o5Psq1tbgLmQMd7dPSLQNtn9h+Nb8lcoz
	 hgnXY6CKmc0drTcfeXVPVLal/xYtqtZC4Vy3qNB0P5ThQVc4llEXMLh2rjQu7+OTB4dHT
	 67IzEWwockKYIqgDBRfMFOYHQtfAOLNCQ+KpiEb236XouSIS5SmyuLMXwRgQeA0MrTzRT
	 C4VBCphRobT6f/V5L5JQgmLN/tBc+6IReMEroThcr70hjzrQICKJX1SHPlsg3hARh/ps+
	 5kP7EbOBqVWuhuMC89659RTfVYlmjVaaJeqGtpAwUqbwOvwz4rTlFrO4SeaRLVm9nNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mYAeQ7nF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDAB606A323
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mYAeQ7nF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775661F01828;
	Fri, 23 Oct 2026 09:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792748831;
	bh=Xwh6yfWoxvJ5QkKyA/2mt4aaED8CSnIdM0PpZ4sz58k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mYAeQ7nFHX+AYmq4WOOm1+ESfNHUDCcMG05x7oIg7IRj/G7CfEv/iDuBjM3uAhEcM
	 69Y+wyz0ezMm7Zq4AoexU7henG6Cf2wCdkhQ5x49Rd3vVdS5I1MFsELJ7FSRAc0K0D
	 4acWUAn+niOCfsM7JvrJXmmuMv0wqtb/Rs3AKLU+20Pbz6TtDM09Xk4+2ReOuMWCk6
	 11BiATwIBgvb2r7V1AbbY0Di0jtetvLzvPEkn6d6gfUZULml3krxWfZq9SeRYB9ul3
	 dyvFQJZCWkzbTpxxhRK/J9Q6Yh/k18fDIVxafWD7leDfCq8ka4MyqeyxTsDtqYTgvQ
	 FB0c8SsH1WM6w==
Message-ID: <sashiko-outbox-182632@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/8] iio: imu: Add driver for the ADI ADIS16607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023-adis16607-v4-5-a4d541ebfd13@analog.com>
References: <20261023-adis16607-v4-0-a4d541ebfd13@analog.com>
 <20261023-adis16607-v4-5-a4d541ebfd13@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 09:47:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: imu: adis16607: negative frequency wraparound in adis16607_=
write_raw()
--

commit 686b8ffae8bb8850532fb9fd2ba72d9f11184ab1
Author: Radu Sabau <radu.sabau@analog.com>

iio: imu: Add driver for the ADI ADIS16607

This commit adds the base IIO driver for the Analog Devices ADIS16607-2
and ADIS16607-3 precision MEMS IMUs over a custom SPI Half-Duplex
protocol. It provides support for raw channel reads, sampling frequency
control, startup/self-test via adislib, and debugfs identity entries.

> diff --git a/drivers/iio/imu/adis16607.c b/drivers/iio/imu/adis16607.c
> new file mode 100644
> index 0000000000000..2dda306d7b547
> --- /dev/null
> +++ b/drivers/iio/imu/adis16607.c
[ ... ]
> +static int adis16607_set_freq(struct adis16607 *st, u32 freq)
> +{
> +	u32 dec;
> +	int ret;
> +
> +	if (!freq)
> +		return -EINVAL;
> +
> +	adis_dev_auto_lock(&st->adis);
> +
> +	dec =3D DIV_ROUND_CLOSEST(st->clk_freq_mhz, freq);
> +	if (dec)
> +		dec--;
> +
> +	dec =3D min_t(u32, dec, st->info->max_dec);
> +
> +	ret =3D __adis_write_reg_16(&st->adis, ADIS16607_REG_DEC_RATE, dec);
> +	if (ret)
> +		return ret;
> +
> +	st->sample_period_ns =3D DIV_ROUND_CLOSEST_ULL((u64)NSEC_PER_SEC * 1000=
ULL * (dec + 1),
> +						     st->clk_freq_mhz);
> +
> +	return 0;
> +}
[ ... ]
> +static int adis16607_write_raw(struct iio_dev *indio_dev,
> +			       const struct iio_chan_spec *chan,
> +			       int val, int val2, long info)
> +{
> +	struct adis16607 *st =3D iio_priv(indio_dev);
> +	u32 tmp;
> +
> +	switch (info) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		tmp =3D val * 1000 + val2 / 1000;
> +		return adis16607_set_freq(st, tmp);

[Severity: Medium]
What happens in adis16607_write_raw() if userspace writes a negative
sampling frequency via sysfs?

In drivers/iio/industrialio-core.c, iio_write_channel_info() parses the
input string through __iio_str_to_fixpoint(), which accepts a leading '-'
sign and passes signed negative val or val2 values into write_raw().

Without checking if (val < 0 || val2 < 0) return -EINVAL; (like
adis16480_set_freq() does in drivers/iio/imu/adis16480.c), computing
val * 1000 + val2 / 1000 and assigning a negative result to u32 tmp wraps
around to a large unsigned value.

When that wrapped value is passed to adis16607_set_freq(), it bypasses the
if (!freq) check, DIV_ROUND_CLOSEST(st->clk_freq_mhz, freq) evaluates to 0,
and __adis_write_reg_16() programs ADIS16607_REG_DEC_RATE to 0 (the maximum
8 kHz rate) instead of rejecting the invalid input. Also, if val >
INT_MAX / 1000, val * 1000 overflows signed 32-bit arithmetic.

Should adis16607_write_raw() validate that val and val2 are non-negative
and within bounds before computing tmp?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-adis16607-=
v4-0-a4d541ebfd13@analog.com?part=3D5
