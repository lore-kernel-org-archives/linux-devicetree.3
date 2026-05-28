Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB782E7384
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 16:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779986378; cv=none; b=oertUQ3cy3qiqZrVRGifQvaoHyS9EHi9oatswwd/LcxB+X6+iX1saVWfAepX3dsrrsu6/OcR9+i0T8CdXDSzUCTGXb1gCs8S5pEB8BjjL/caX/8PEma69xWrzadg/Aes09qrKDJK6LQGWRYBeXZgYtnPRz0aJ/zchc+1l3umjTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779986378; c=relaxed/simple;
	bh=wPfgmyfnxCqzZqXVJB/ihPD6Kcs++eLR/boCZ97KaII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aD33jm9swO2CCSjeNFJz4rOoH0Erl6g8BhYrbNhx6u+d7ClD1GU7lW8G/t9nehQVpAZcPMtdQDDHhqVjVEHdJXvhUodQq+vOP/UdAuz7q2TC12+4CFhd1RRcjupG8durQtgJlaeEsVYSxP7EQaR9QDjgCDG9+HyaoQnMvmiJnuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xl2K+8zi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xl2K+8zi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BA11F000E9;
	Thu, 28 May 2026 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779986376;
	bh=2rqTkiVrGviNYMCTBlQR+gyj27fzBQGB2daSSF8JrOU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xl2K+8zitkdWEjPsZtEohAWuOpxjYaKV0sZVQKluGvG+Lc/3bEfy/LxdLwID2tInf
	 e3b9dVngfSCI3pbdWZ4dqaigShftqIXCwYZu3JJYqSGenTOhspRgFQ+0cU/BULqCKl
	 BK86v6mDirro3jLNKPkBjFK6RZ0HhAqyKOpWYaOUsjfilwoMHKR+wCXk4Cw6oFb5eu
	 xIN2EnhFXuqtxhAhNk3yCUCJsF/Kx/Wv9ywRYM+39YLbWuqPzzbzrCdSDY699yKnVr
	 230vwG1w5C6BonKEqOSneV6tKIHv4/aNsQzI7t1a6mQzqIiQUDbMCpO/ot7FRerbnF
	 OPKvb7WSigOJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] iio: adc: ltc2378: Enable high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <e04a432efb6536f93bbe7f410964aa877370de36.1779976379.git.marcelo.schmitt@analog.com>
References: <e04a432efb6536f93bbe7f410964aa877370de36.1779976379.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 16:39:36 +0000
Message-Id: <20260528163936.66BA11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] LTC2378_OFFLOAD_BUFFER incorrectly forces tristate dependencies to=
 be built-in and fails to propagate constraints, causing Kconfig warnings a=
nd linker errors.
- [High] Incorrect continuation conditions in hardware configuration loops =
cause infinite loops or unconditional failures at high sample rates.
- [High] Fallback stub functions in the header contain syntax errors and la=
ck static inline specifiers.
- [High] Direct read SPI transfers execute unintended 32-bit transactions f=
or 16-bit ADCs when offload is supported.
- [High] Uninitialized kernel stack memory is leaked to user-space via the =
IIO sysfs interface.
- [High] `ltc2378_read_avail` fails to populate the `length` parameter for =
`IIO_AVAIL_RANGE`, leading to undefined behavior.
- [Medium] dev_err_probe is used to log an error when an optional SPI offlo=
ad resource is unavailable, polluting kernel logs with false positives.
--

commit 1c9aa766f95e380ea9e11f4b2b8e9cbf0718b8f9
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
Subject: iio: adc: ltc2378: Enable high-speed data capture

Make use of SPI transfer offloading to speed up data capture, enabling data
acquisition at faster sample rates (up to 2 MSPS).

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
[ ... ]
> +
> +config LTC2378_OFFLOAD_BUFFER
> +	bool
> +	select SPI_OFFLOAD_TRIGGER_PWM
> +	select IIO_BUFFER_DMA
> +	select IIO_BUFFER_DMAENGINE
> +	help
> +	  Say yes here to build support for high speed data capture with LTC2378

[Severity: High]
Should LTC2378_OFFLOAD_BUFFER be a tristate or use depends on instead of
select? Since it is a bool, unconditionally selecting tristate options like
IIO_BUFFER_DMA can force them to be compiled as built-in even when the pare=
nt
module is built as a module. Selecting them without inheriting their
dependencies can also cause Kconfig warnings.

diff --git a/drivers/iio/adc/ltc2378-offload-buffer.c b/drivers/iio/adc/ltc=
2378-offload-buffer.c
--- /dev/null
+++ b/drivers/iio/adc/ltc2378-offload-buffer.c
[ ... ]
> +static int ltc2378_update_conversion_rate(struct ltc2378_state *st, int =
freq_Hz)
> +{
[ ... ]
> +	do {
> +		cnv_wf.duty_length_ns =3D target;
> +		ret =3D pwm_round_waveform_might_sleep(st->cnv_trigger, &cnv_wf);
> +		if (ret)
> +			return ret;
> +		target +=3D 10;  /* Increment by PWM duty cycle period */
> +	} while (cnv_wf.duty_length_ns < LTC2378_TCNV_HIGH_NS || count++ < 100);

[Severity: High]
Does this loop condition evaluate correctly? Due to short-circuit evaluation
in C, if the left side of the || is true, count++ is never executed, which
might lead to an infinite loop if the PWM hardware caps the value. If the l=
eft
side is false, the loop will run exactly 100 more times, artificially
inflating the target.

[ ... ]
> +	do {
> +		config->periodic.offset_ns =3D offload_offset_ns;
> +		ret =3D spi_offload_trigger_validate(st->offload_trigger, config);
> +		if (ret)
> +			return ret;
> +		offload_offset_ns +=3D 10;
> +	} while (config->periodic.offset_ns < min_read_offset || count++ < 100);

[Severity: High]
This loop condition has the same short-circuit evaluation issue as above.

[ ... ]
> +int ltc2378_read_avail(struct iio_dev *indio_dev, struct iio_chan_spec c=
onst *chan,
> +		       const int **vals, int *type, int *length, long mask)
> +{
> +	struct ltc2378_state *st =3D iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*vals =3D st->sample_freq_range;
> +		*type =3D IIO_VAL_INT;
> +		return IIO_AVAIL_RANGE;

[Severity: High]
Does ltc2378_read_avail need to set the *length pointer here? The IIO core
expects the driver to populate it with the number of elements in the return=
ed
array. Leaving it unset might lead to out-of-bounds memory accesses when the
core processes the range.

[ ... ]
> +int ltc2378_offload_buffer_setup(struct iio_dev *indio_dev, struct spi_d=
evice *spi)
> +{
> +	struct ltc2378_state *st =3D iio_priv(indio_dev);
> +	struct device *dev =3D &spi->dev;
> +	int ret;
> +
> +	st->offload =3D devm_spi_offload_get(dev, spi, &ltc2378_offload_config);
> +	ret =3D PTR_ERR_OR_ZERO(st->offload);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get offload\n");

[Severity: Medium]
Since SPI offload is an optional feature, if devm_spi_offload_get() returns
-ENODEV, will dev_err_probe() log a false positive error message to the
system log?

diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
--- a/drivers/iio/adc/ltc2378.c
+++ b/drivers/iio/adc/ltc2378.c
[ ... ]
> @@ -261,10 +314,35 @@ static int ltc2378_probe(struct spi_device *spi)
>  	st->chans[0].type =3D IIO_VOLTAGE;
>  	st->chans[0].info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
>  					  BIT(IIO_CHAN_INFO_SCALE);
> -	st->chans[0].scan_type.format =3D st->info->twos_comp ? IIO_SCAN_FORMAT=
_SIGNED_INT :
> -							      IIO_SCAN_FORMAT_UNSIGNED_INT;
> -	st->chans[0].scan_type.realbits =3D st->info->resolution;
> -	st->chans[0].scan_type.storagebits =3D st->info->resolution > 16 ? 32 :=
 16;
> +
> +	struct iio_scan_type ltc2378_scan;
> +
> +	ret =3D ltc2378_offload_buffer_setup(indio_dev, spi);

[Severity: High]
Could this leak uninitialized stack memory to user-space? The ltc2378_scan
structure is allocated on the stack and only partially initialized before
being assigned to the IIO channel. Uninitialized fields and padding might
retain garbage data that gets exposed via sysfs attributes.

[ ... ]
> +	st->chans[0].scan_type =3D ltc2378_scan;
> =20
>  	st->xfer.rx_buf =3D &st->scan.data;
>  	st->xfer.len =3D BITS_TO_BYTES(st->chans[0].scan_type.storagebits);
>  	st->xfer.bits_per_word =3D st->info->resolution > 16 ? 32 : 16;

[Severity: High]
When SPI offload is available, storagebits is forced to 32, meaning
st->xfer.len is set to 4 bytes. Since xfer.bits_per_word remains 16 for a
16-bit ADC, could this cause non-offloaded direct reads to execute two
16-bit word reads per transaction, violating the SPI hardware protocol?

diff --git a/drivers/iio/adc/ltc2378.h b/drivers/iio/adc/ltc2378.h
--- a/drivers/iio/adc/ltc2378.h
+++ b/drivers/iio/adc/ltc2378.h
[ ... ]
> +#else /* CONFIG_IIO_LTC2378_LIB_OFFLOAD_BUFFER */
> +
> +#define LTC2378_WRITE_RAW_PTR (NULL)
> +
> +#define LTC2378_READ_AVAIL_PTR (NULL)
> +
> +static inline int ltc2378_offload_buffer_setup(struct iio_dev *indio_dev,
> +					       struct spi_device *spi)
> +{
> +	return -ENODEV;
> +}
> +
> +int ltc2378_get_sampling_frequency(struct ltc2378_state *st, int *val)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +int ltc2378_set_sampling_frequency(struct ltc2378_state *st, int freq_Hz=
);
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +int ltc2378_write_raw(struct iio_dev *indio_dev, struct iio_chan_spec co=
nst *chan,
> +		      int val, int val2, long mask)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +#endif

[Severity: High]
Are there build issues with these fallback functions? The function
ltc2378_set_sampling_frequency has a trailing semicolon after its parameter
list. Additionally, these functions lack the static inline qualifier, which
might cause multiple definition linker errors if the header is included in
multiple files.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779976379.gi=
t.marcelo.schmitt@analog.com?part=3D3
