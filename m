Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7860E4A0F01
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 18:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311716; cv=none; b=LP2kvmPHOJve7ocegsnrcbZgKVhzgs3QLnrsi3Ivr0izyU6Y12n9p42SfLWdotnyYRVFrPUM09dPkeO6th1mir3BhXdD8Lt61hEBmLJkd1AlFubBGVJ2EsSjid26kPSg4aj38rOuxFckXM6swK9Z4mp0D30eKuUsOCxx2q1ptlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311716; c=relaxed/simple;
	bh=M51MuxUB9NrtB0iFcQoDBRtWTr/sF+PiYvxP1CtDZRo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UuCz8MPnQbuIhGZCWq0ltmI9/Gm5qVZSkR4GhVNFLhOOZMeSwg/NMR2Avmryi0UVuA39IO+gL6+1lxFtGAUOAPl5QaVDaBQspjGksIeYpytO764zczVw4BglDJoWX+WsW8itH/37TSNTeGJHNsLc5kT7LSwFd2av3NL2htKeJwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mefS3YZt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mefS3YZt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC821F00906;
	Tue,  6 Oct 2026 18:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791311715;
	bh=N+4+O9GO5jGyL1IU0C8jpVvxr+4rMsWnbE5/RIDbhs8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mefS3YZt3xsOCwDxLYSEjC1JxxtHLhvLMKIgq533UxFNqmNLDj7edwC7c843/xpoM
	 yzvit5KWvyMpCj25lzH07fi1v2QNq67mgJQwzKC+65uP4KQt103mS8nq/PAjMGy8Yu
	 arYqMDwo1/kHacUwHpySWz2NqUtpb4qF/r8AALvfrQ4Mcop0zT9/ZqFxtXo/3fSK4H
	 quRoFXMo96or8QumWmh/SHtRHk5VhE76I7GSAqRInDIbwxzOBKXhu31uxVbkdxX5Mu
	 +WuYzugDZNKndkFxQM2HcVguRoZ9usUqbVJJBXsMm4eiw0+ucy6O9CtMwhixVGl0be
	 RP0dzd7DuqkOg==
Message-ID: <sashiko-outbox-162354@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/13] iio: adc: ad4134: Support SPI 4-wire mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <ec26e0e1cbb6572c8eee391951c084a7c264887c.1791309733.git.marcelo.schmitt@analog.com>
References: <cover.1791309733.git.marcelo.schmitt@analog.com>
 <ec26e0e1cbb6572c8eee391951c084a7c264887c.1791309733.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 18:35:14 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] iio: ad4134: deadlock during probe due to recursive multiplexer lo=
cking in NO_CS mode
- [High] iio: adc: ad4134: debugfs reg access corrupts SPI mode during acti=
ve capture
- [Medium] iio: ad4134: SPI mode state becomes permanently desynchronized o=
n spi_setup() failure
--

commit f0535fb17ce60953154f2703e6049afff8114c19
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Support SPI 4-wire mode

AD4134 devices can be wired in a few different ways. So far, only minimum
I/O mode was supported. While minimum I/O mode allows interfacing with
AD4134 with a reduced number of wires, that wiring configuration is not
suitable for high-throughput data acquisition.

Extend AD4134 support to enable interfacing in SPI 4-wire configuration.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index b5207f16054e4..debc2ff027051 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
[ ... ]
> @@ -226,6 +244,85 @@ static const struct regmap_access_table ad4134_regma=
p_wr_table =3D {
>  	.n_yes_ranges =3D ARRAY_SIZE(ad4134_regmap_wr_range),
>  };
> =20
> +/*
> + * When operating in modes other than minimum I/O mode, AD4134 register =
data on
> + * the SDO line is sampled on SCLK rising edge (SPI mode 0). In addition=
 to
> + * that, when AD4134 SDO and DOUT0 pins are multiplexed by hardware OUTS=
IDE
> + * AD4134 SILICON, the multiplexer state must be set to route SDO to the=
 SPI
> + * controller. With both SPI mode and multiplexer state properly set, re=
gister
> + * access runs as usual. Successful calls to this function must be balan=
ced with
> + * calls to ad4134_release_reg_access() so to release the mux state lock=
. See
> + * AD4134 IIO documentation for details.
> + */
> +static int ad4134_claim_reg_access(struct ad4134_state *st)
> +{
> +	unsigned int cur_mode =3D st->spi->mode & SPI_MODE_X_MASK;
> +	int ret;
> +
> +	if (st->spi_mode !=3D AD4134_SPI_MODE_NO_CS && cur_mode !=3D SPI_MODE_0=
) {
> +		st->spi->mode &=3D ~SPI_MODE_X_MASK;
> +		st->spi->mode |=3D SPI_MODE_0;
> +		ret =3D spi_setup(st->spi);
> +		if (ret)
> +			return ret;

[Severity: Medium]
If spi_setup() fails here, we return the error but st->spi->mode remains
modified. On subsequent calls, cur_mode !=3D SPI_MODE_0 will evaluate to fa=
lse
because the cached mode reflects the requested state.

Can this cause the driver to bypass spi_setup() on subsequent calls and
attempt to communicate with the device while the SPI hardware remains
incorrectly configured?

[Severity: High]
Can ad4134_debugfs_reg_access() execute concurrently with the active
triggered buffer capture?

ad4134_debugfs_reg_access() performs register operations without acquiring
the IIO direct mode lock. If executed concurrently with an active capture, =
it
will call ad4134_claim_reg_access() which modifies st->spi->mode and calls
spi_setup() without protection.

This abruptly alters the SPI hardware configuration while
ad4134_trigger_handler() is actively executing spi_sync_transfer(),
corrupting the ADC data stream and SPI transaction state.

Furthermore, if the "reg_access" and "data_read" mux states belong to
different hardware mux-controllers, the mux_state_select() call will not
block, causing concurrent, unprotected use of st->tx_buf and st->rx_buf
across threads.

> +	}
> +
> +	if (st->mux_st[AD4134_SDO_INPUT])
> +		return mux_state_select(st->mux_st[AD4134_SDO_INPUT]);
> +
> +	return 0;
> +}
[ ... ]
> @@ -594,10 +728,64 @@ static int ad4134_probe(struct spi_device *spi)
[ ... ]
> +	if (st->spi_mode =3D=3D AD4134_SPI_MODE_NO_CS) {
> +		/*
> +		 * The support hardware for AD4134 may have a multiplexer for
> +		 * selecting between AD4134 SDO and AD4134 DOUT0. If that mux
> +		 * is set but the user still wants to run AD4134 in minimum I/O
> +		 * mode, then DOUT0 is not used and the multiplexer OUTSIDE OF
> +		 * AD4134 SILICON must be set to select AD4134 SDO. See AD4134
> +		 * IIO documentation for details.
> +		 */
> +		st->mux_st[AD4134_SDO_INPUT] =3D
> +			devm_mux_state_get_optional_selected(dev, "reg_access");

[Severity: High]
Does this cause a deadlock during device probe in NO_CS mode?

Here the driver acquires and permanently selects the SDO multiplexer via
devm_mux_state_get_optional_selected(), which acquires the multiplexer's
non-recursive semaphore.

Immediately after, probe calls ad4134_min_io_mode_setup(), which writes to
device registers via regmap_update_bits(). This triggers the following call
chain:

ad4134_min_io_mode_setup()
  regmap_update_bits()
    ad4134_reg_write()
      ad4134_claim_reg_access()

ad4134_claim_reg_access() unconditionally calls mux_state_select(), which
will attempt to acquire the exact same semaphore already held by the current
task, causing a deadlock.

Furthermore, ad4134_release_reg_access() then unconditionally calls
mux_state_deselect(), which would prematurely release the probe-acquired
lock.

> +		if (IS_ERR(st->mux_st[AD4134_SDO_INPUT]))
> +			return dev_err_probe(dev, PTR_ERR(st->mux_st[AD4134_SDO_INPUT]),
> +					     "failed to get reg_access mux-state\n");
> +
> +		ret =3D ad4134_min_io_mode_setup(st);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to setup minimum I/O mode\n");
> +	} else {
> +		/*

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791309733.gi=
t.marcelo.schmitt@analog.com?part=3D10
