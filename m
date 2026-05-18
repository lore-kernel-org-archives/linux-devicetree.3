Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CFD3126A9
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121167; cv=none; b=F2WbcF7a7Kk+euhprJ6DLKrnpuWRHe2De/L9qL31Z88Hua7iIMF0cRPg90AJpOO07g/opjIqCrAsNSo1fqg1SxvUvgZrEsGKDs38VDLDzQ+HBVTo4CMv4gzT7oMK4y9yIJZ3sJ47KS6M5DNH/WitaiEcdIbnL+6ImFiSOPuW8to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121167; c=relaxed/simple;
	bh=JfCPfbpzb7evlkM3ELr9knKy+l06+alSyhYy9am91Lc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gm1HKxMQ29HkHu6aegwPJqWiW0ZRcfrk0AJidyiDcJAyzQXke8UDtsCufrVy87+wLRCcwqGBBKnYrZJDZLPdoZmAZgDzpfL3KHLI6i5lhR3Iuhgt/gqmwgs7ssREElGEqTiHCO/uN93rWyepRD1npx/RDodm4VZ7uvzFeZzWrHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgEtPryf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgEtPryf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59284C2BCB7;
	Mon, 18 May 2026 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779121166;
	bh=JfCPfbpzb7evlkM3ELr9knKy+l06+alSyhYy9am91Lc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rgEtPryfkmvGzBL4hQpzYp8hgRMX4hP3kRC/AMQWvcv+gM1svDMBz7F/T99YpDlg3
	 o3L/I5bNEsBQON9KPQqkPsKzHsYnxBMNHlLZ7U5oqfXLZVWjeA04Utkxvq9bRIqOd0
	 Br5ZeJ+12XNO3AoTjZizNAtfBS9Qz6OXZZcKdSXSMvpWJ0YJ+PeizOShbXZQQw7RK6
	 +POrfEF5BFNu5uub3ABxpGifZyLS10ERAVoareoeI/xfDxt5Xg2KYKube1X5mRMMZh
	 ZpoHUchibaLfQrB9bSCNfvaPEW4BuPh9TMc/xhZtzEeERN7FUZ6qN5vlFIGLVE421W
	 GXbLCr0WGXUsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/4] iio: adc: ltc2378: Enable high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <580ce8e03cdbda8ec20fed2e26f2226872ffcef3.1779117444.git.marcelo.schmitt1@gmail.com>
References: <580ce8e03cdbda8ec20fed2e26f2226872ffcef3.1779117444.git.marcelo.schmitt1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 16:19:25 +0000
Message-Id: <20260518161926.59284C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing early return in `ltc2378_offload_buffer_setup()` causes er=
ror pointer dereference and breaks fallback mode.
- [High] Unconditional exposure of sysfs attributes causes a NULL pointer d=
ereference on devices without SPI offload.
- [High] Unbounded `do...while` loops querying hardware limits can cause an=
 infinite loop and system hang.
- [High] Hardcoded 4-byte SPI offload transfers conflict with 16-bit IIO bu=
ffer allocations, causing data corruption.
- [Medium] Kconfig dependency mismatch prevents enabling the offload featur=
e when the driver is compiled as a module.
--

commit 87ed4789078a187c9262ff17873220fb5108858f
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Enable high-speed data capture

Makes use of SPI transfer offloading to speed up data capture, enabling data
acquisition at faster sample rates (up to 2 MSPS).

> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 70fec8e3e891f..b5368ee783f7b 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
[ ... ]
> +config LTC2378_OFFLOAD_BUFFER
> +	bool "Offloaded data capture with LTC2378"
> +	depends on SPI && LTC2378

LTC2378_OFFLOAD_BUFFER is a bool that depends on LTC2378. Since LTC2378 is a
tristate, if a user compiles the driver as a module, won't Kconfig restrict
this dependent boolean to n? Does this prevent enabling the offload feature
entirely unless the driver is built-in?

> diff --git a/drivers/iio/adc/ltc2378-offload-buffer.c b/drivers/iio/adc/l=
tc2378-offload-buffer.c
> new file mode 100644
> index 0000000000000..ed09f9a55f93e
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378-offload-buffer.c
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
> +	} while (cnv_wf.duty_length_ns < LTC2378_TCNV_HIGH_NS);

If the physical PWM hardware clamps the duty cycle below LTC2378_TCNV_HIGH_=
NS
due to hardware limits or resolution, will this loop increment target
indefinitely and stall the CPU? Should there be a maximum iteration limit?

This same concern applies to the SPI trigger offset negotiation loop located
just below this one.

[ ... ]
> +static int ltc2378_prepare_offload_message(struct device *dev,
> +					   struct ltc2378_state *st)
> +{
> +	st->offload_xfer.bits_per_word =3D st->info->resolution;
> +	/*
> +	 * Ideally, we would ask the offload provider what data word sizes are
> +	 * supported so we could use smaller words for less precise ADCs.
> +	 * Though, the currently available SPI offloading hardware only supports
> +	 * pushing 32-bit sized data elements to DMA memory. Because of that,
> +	 * we hardcode set 4 byte sized transfers.
> +	 */
> +	st->offload_xfer.len =3D 4;

Since st->offload_xfer.len is hardcoded to 4 bytes here, but
ltc2378_chan->scan_type.storagebits remains at 16 for ADCs with 16-bit
or lower resolution, does this cause a mismatch? Will the IIO core allocate
DMA buffers assuming 2 bytes per sample while the DMA hardware pushes
4 bytes, potentially leading to buffer overruns and data corruption?

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
> +	if (ret && ret !=3D -ENODEV)
> +		return dev_err_probe(dev, ret, "failed to get offload\n");
> +
> +	ret =3D ltc2378_spi_offload_setup(indio_dev, st);

If devm_spi_offload_get() returns -ENODEV, this check bypasses the
dev_err_probe() call but continues to ltc2378_spi_offload_setup() without
returning.=20

Could this pass an ERR_PTR(-ENODEV) via st->offload to
devm_spi_offload_trigger_get(), causing a panic or breaking ltc2378_probe()=
's
intended fallback to non-offloaded direct mode?

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> index 7916500c470cf..fdbe919d45d55 100644
> --- a/drivers/iio/adc/ltc2378.c
> +++ b/drivers/iio/adc/ltc2378.c
[ ... ]
> @@ -226,6 +266,9 @@ static int ltc2378_read_raw(struct iio_dev *indio_dev,
>  }
> =20
>  static const struct iio_info ltc2378_iio_info =3D {
> +#ifdef CONFIG_LTC2378_OFFLOAD_BUFFER
> +	.attrs =3D &ltc2378_offload_attribute_group,
> +#endif
>  	.read_raw =3D &ltc2378_read_raw,
>  };

If a device probes successfully without SPI offload using standard direct m=
ode,
st->cnv_trigger remains uninitialized. Since these attributes are statically
assigned without an is_visible callback, they remain exposed to userspace.

Could writing to sampling_frequency in sysfs trigger a NULL pointer
dereference when ltc2378_update_conversion_rate() passes the uninitialized
st->cnv_trigger to pwm_round_waveform_might_sleep()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779117444.gi=
t.marcelo.schmitt1@gmail.com?part=3D3
