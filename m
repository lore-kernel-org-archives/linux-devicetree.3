Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548707;
	b=kHbJPwOQK7ppZbPu3C0URSeM+5MTtDXi5PVyPAUQK6pM0Hs0tetC56XdSs3+4VDO1zmb
	 ZqLOtZpTIZtIqe66mVICaGHdJBHNYbljuF/dCkmtUOrGmJLpMTv6ATrQmMMagwR/IoNue
	 C+aB7wmjxzTwX4WdCYsZw7fP++K1o/k4jmxKX2K8lPysTxC8pWt75Owx8IEceFUuFF6BQ
	 t0iwMtUU3wTfGlgl8u/j7n8Z8A4tCF+QBEk/mSfbAXP1/4DfcvIpVKpnZn/A33xwjq5h6
	 ygOuZcwrh4kRlJLEgar5t9CSQCD4HYyf32ovKkuE39pkk9vytXZqED8mNoyFsVngMnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548707;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ew9sfwCDjhu974kHAczCCuQpOD7C8mfyVsnsho8iBkE=;
	b=oqjTf0AClPyMiEKyh6t1K5oQzSOlqaqcnhhA2UQ537HO+VO/JVadMtHOqzOGC40XS1e1
	 DhLXKCOtE3LAN3Il/8XjRFecQ8BCnPyfApgSV3JRfV1D7m9pnujd2h95FoWhGIxhCuPqU
	 LxX54UDQ0zS6pZ6DsFcIyrYW3TD+0i7xdpNUYZpPt3TDHUDGWoFxHk6aanhSiyuCfZzD0
	 Pwh2q6Hdd53/6AibiRFEfVyuPg1qrCW3poarSQCmwLzLpUHMuHJhCSJnh+MhOIQ3RD9b2
	 Ni8Qamk+WZQ2csVno7OD/yJbhOOIufY/iWrLE2+UiIODVApNQnAXOG9nAIwA5v9nDig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O/AKwGBF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D05606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O/AKwGBF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353731F000C9;
	Wed, 21 Oct 2026 02:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792548706;
	bh=ew9sfwCDjhu974kHAczCCuQpOD7C8mfyVsnsho8iBkE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O/AKwGBFb7JzSfwUz7dP2aM+irpwJkKdI+tdubY1Y5VmEe4slFMtZedyH4RSYVAvy
	 tYis8HF5ronygmIKia+0YOFkwEaZSoEG9NimmH/DtZ4bI5C/aLXIZqKYZQkTiV8G7C
	 0F1nvvEcyPRdIgJ5DeYjBLDRGRNYn13C3qWYRKcLUrGnOR3aVxEoO96BR9H7m2GPKu
	 pgBtw8iggSEXX++5F7YWfShkq8uWuc0OZK50eKVOsXDpCQ49/iFcXYBAcff8Zo0DY3
	 aKB6PUnjnTWVfLWfGC1+wpJNaSz+ifRO3O+unprnyn4BKwrXmTDbkmHdVgKtZ0xtyl
	 K4TRCVTyoihXQ==
Message-ID: <sashiko-outbox-179690@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 9/9] iio: adc: ad7768-1: add support for multiple
 chip aggregation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonathan Santos" <Jonathan.Santos@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <7afbafd67ad52b2342af30c278b8b001413221ee.1792435248.git.Jonathan.Santos@analog.com>
References: <cover.1792435248.git.Jonathan.Santos@analog.com>
 <7afbafd67ad52b2342af30c278b8b001413221ee.1792435248.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 02:11:45 +0000
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
- [High] iio: adc: ad7768-1: incomplete multi-device read in ad7768_trigger=
_handler()
--

commit 093b4a79a74e19badb41a08df17fd753e9cf37ec
Author: Jonathan Santos <Jonathan.Santos@analog.com>

iio: adc: ad7768-1: add support for multiple chip aggregation

This commit adds support for aggregating multiple ad7768-1 devices connected
to the same spi controller using dedicated chip selects and data lanes. It
dynamically configures the channels, registers per-lane ancillary devices f=
or
direct reads, and enables striped multi-lane transfers in offload mode.

> diff --git a/drivers/iio/adc/ad7768-1.c b/drivers/iio/adc/ad7768-1.c
> index 3972821c295a1..667c09326f92f 100644
> --- a/drivers/iio/adc/ad7768-1.c
> +++ b/drivers/iio/adc/ad7768-1.c
[ ... ]
> @@ -335,7 +341,7 @@ struct ad7768_state {
>  	 */
>  	union {
>  		struct {
> -			__be32 chan;
> +			__be32 chan[AD7768_MAX_AGGR_DEVICES];
>  			aligned_s64 timestamp;
>  		} scan;
>  		__be32 d32;

[Severity: High]
While struct ad7768_state expands st->data.scan.chan[] for non-offload
triggered buffer capture, does ad7768_trigger_handler() in
drivers/iio/adc/ad7768-1.c also need to be updated when multiple devices are
aggregated?

When st->num_devices > 1 and spi offload is not present, ad7768_probe() sti=
ll
falls back to registering the triggered buffer path via
ad7768_triggered_buffer_alloc():

drivers/iio/adc/ad7768-1.c:ad7768_probe() {
	...
	st->offload =3D devm_spi_offload_get(dev, spi, &ad7768_spi_offload_config);
	ret =3D PTR_ERR_OR_ZERO(st->offload);
	if (ret =3D=3D -ENODEV) {
		/* If not using SPI offload, fall back to low speed usage */
		ret =3D ad7768_triggered_buffer_alloc(indio_dev);
	...
}

However, when buffered capture is enabled and the interrupt fires,
ad7768_trigger_handler() still performs a single-lane, single-sample read:

drivers/iio/adc/ad7768-1.c:ad7768_trigger_handler() {
	...
	ret =3D spi_read(st->spi, &st->data.scan.chan,
		       BITS_TO_BYTES(scan_type->realbits));
	if (ret < 0)
		goto out;

	iio_push_to_buffers_with_ts(indio_dev, &st->data.scan,
				    sizeof(st->data.scan),
				    iio_get_time_ns(indio_dev));
	...
}

Because spi_read() only reads a single sample of scan_type->realbits bits on
one lane into the start of st->data.scan.chan[0] while asserting all chip
selects on st->spi, the samples from devices 1 through st->num_devices - 1
are clocked out and lost on the bus, pushing unpopulated channel data to the
buffer.

Furthermore, with multiple channels enabled, a 3-byte read in 24-bit mode
(realbits =3D 24, storagebits =3D 32) or a 2-byte read in 16-bit mode
(st->oversampling_ratio =3D=3D 8, realbits =3D 16, storagebits =3D 16) does=
 not match
the 4-byte __be32 element stride of st->data.scan.chan[].

Should ad7768_trigger_handler() be updated to read and pack all
st->num_devices channels according to scan_type->storagebits, or is
non-offload buffered capture unsupported when st->num_devices > 1?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792435248.gi=
t.Jonathan.Santos@analog.com?part=3D9
