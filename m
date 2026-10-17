Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9004CF483
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 02:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792203565; cv=none; b=Wo6MqhIcpr4o55f8++BApJU2xcIGI1doH74Sa4wM79S2SUpHhjlP4a5wNuej3eamE4No1axjAN/AGC5H0U+ZFjn/USgrvyE6hoOsKys5zZz3iASOkj+cvTBpHlrmsBXzPlvtiduBVkNs7DXCFJIO2T9bNPHs+nB4OETYU9zMW/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792203565; c=relaxed/simple;
	bh=lCKoBZitBpgs+dwJJ1bo3DpDoPqqc1JA4xoBchx1+yA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=uTSnH/ayUIdR2XMrvCyz52LvOkJyhzrjcPSx+q3bbDVw3Y5BOl9ESpA66TzNSMD7E7Qk/2NSiu0CQzbNMx9pB/JHzE3sZ34/i98vjO0+NYPRPhdhhEY/Bi2kKF9NNjX8lx1qROomm7C/W3y/xpPvj/nM8LWDjUeKrBj7HhUodPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsnvMydM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsnvMydM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22DFE1F000C4;
	Sat, 17 Oct 2026 02:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792203563;
	bh=35076ZgYylC5hIoV5I88AY66jxrChh0U/z1SrGHio3M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CsnvMydMyhHwDQOmApZvvSGFbbzPdp+3N8YXy6GLCxMCHHtV75eEWd5Ft6UzY6Ftb
	 CInmm8ATgsC34W3FGQMKTtSD6EjmYCNdSS81uCerTCGa7UnHZgyy0qi+nwjF2plkE0
	 NhgefiyJ4MzUJOqaum+oCpL176aOHF3ICYk+r/eLRMgLMAFiCF9nqx6JsEuFPhTPOv
	 63ZF2HOnIA7D1WG0EiXFI5gYS7/sWQ0uiyb8SJw0VOpP0G721uy7oZG3A0IQml6GCk
	 W7J3fYyJEAFDrau011DRvV7MQC9wdUpT0Jk12ceYVUdTXnaz8besIY1pEBC8ZnCRzY
	 jb9tttnNc9sig==
Message-ID: <sashiko-outbox-175201@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/15] iio: adc: ad4134: Support SPI 4-wire mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <fabe47973d8de0bc2f5177a99ef032a26b42d926.1792200021.git.marcelo.schmitt@analog.com>
References: <cover.1792200021.git.marcelo.schmitt@analog.com>
 <fabe47973d8de0bc2f5177a99ef032a26b42d926.1792200021.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 02:19:22 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] iio: adc: ad4134: race with trigger handler in ad4134_buffer_set=
up_ops
- [Medium] iio: adc: ad4134: missing DOUT0 format config and cs_off in 4-wi=
re mode
- [Medium] iio: adc: ad4134: spi_setup() ordering and mode desync in claim =
helpers
--

commit 8eb548670148a37e8ad1ee608a1ea7bc67bedb0c
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Support SPI 4-wire mode

This commit extends the AD4134 ADC driver to support SPI 4-wire mode in
addition to minimum I/O mode by switching SPI clock phase and controlling
an external SDO/DOUT0 multiplexer between register and sample accesses.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index eaf5bb55f25ba..6b05e40f7aeb7 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c

[ ... ]

> @@ -219,6 +237,85 @@ static const struct regmap_access_table ad4134_regma=
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
> +	}
> +
> +	if (st->spi_mode !=3D AD4134_SPI_MODE_NO_CS && st->mux_st[AD4134_SDO_IN=
PUT])
> +		return mux_state_select(st->mux_st[AD4134_SDO_INPUT]);
> +
> +	return 0;
> +}

[Severity: Medium]
In ad4134_claim_reg_access() and ad4134_claim_sample_access(), can
mutating st->spi->mode and calling spi_setup() before mux_state_select()
leave the SPI mode out of sync or reconfigure the controller during an
active capture?

If spi_setup(st->spi) fails, st->spi->mode is not restored to cur_mode. On
the next call to the same claim helper, cur_mode already matches the
target mode, so spi_setup() is skipped while the SPI controller remains
configured in the previous mode.

Similarly, because spi_setup() runs before mux_state_select() acquires the
mux lock, if mux_state_select() fails (for example with -EINTR while
waiting in down_killable()), st->spi->mode and the SPI controller remain in
the new mode on an error return. In addition, if a register read occurs via
regmap debugfs while buffered capture holds the mux lock in SPI_MODE_1,
ad4134_claim_reg_access() will call spi_setup() to switch the controller to
SPI_MODE_0 before blocking on mux_state_select().

Should mux_state_select() be called before changing st->spi->mode and
calling spi_setup(), with st->spi->mode restored and the mux deselected if
spi_setup() fails?

[ ... ]

> @@ -261,7 +367,11 @@ static int ad4134_data_read(struct ad4134_state *st,=
 unsigned int reg,
>  {
>  	unsigned int i;
>  	u32 sample =3D 0;
> -	int ret;
> +	int access_ret, ret;
> +
> +	ret =3D ad4134_claim_sample_access(st);
> +	if (ret)
> +		return ret;
> =20
>  	/*
>  	 * To be able to read data from all 4 channels through a single line, we
> @@ -277,7 +387,7 @@ static int ad4134_data_read(struct ad4134_state *st, =
unsigned int reg,
>  		ret =3D spi_write_then_read(st->spi, NULL, 0, st->rx_buf,
>  					  BITS_TO_BYTES(AD4134_CHAN_PRECISION_BITS));
>  		if (ret)
> -			return ret;
> +			goto out_data_read_release;

[ ... ]

> @@ -372,6 +496,21 @@ static irqreturn_t ad4134_trigger_handler(int irq, v=
oid *p)
>  	return IRQ_HANDLED;
>  }
> =20
> +static int ad4134_buffer_postenable(struct iio_dev *indio_dev)
> +{
> +	return ad4134_claim_sample_access(iio_priv(indio_dev));
> +}
> +
> +static int ad4134_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	return ad4134_release_sample_access(iio_priv(indio_dev));
> +}
> +
> +static const struct iio_buffer_setup_ops ad4134_buffer_setup_ops =3D {
> +	.postenable =3D &ad4134_buffer_postenable,
> +	.predisable =3D &ad4134_buffer_predisable,
> +};

[Severity: Medium]
Can using .postenable and .predisable in ad4134_buffer_setup_ops race with
ad4134_trigger_handler() in 4-wire mode?

In drivers/iio/industrialio-buffer.c, iio_enable_buffers() attaches the
trigger pollfunc before running .postenable:

	if (iio_dev_opaque->currentmode =3D=3D INDIO_BUFFER_TRIGGERED) {
		ret =3D iio_trigger_attach_poll_func(indio_dev->trig,
						   indio_dev->pollfunc);
		if (ret)
			goto err_disable_buffers;
	}

	if (indio_dev->setup_ops->postenable) {
		ret =3D indio_dev->setup_ops->postenable(indio_dev);

Because iio_trigger_attach_poll_func() requests the threaded IRQ and enables
the external trigger, ad4134_trigger_handler() can start running
spi_sync_transfer() before or concurrently with ad4134_buffer_postenable()
calling ad4134_claim_sample_access() to update st->spi->mode, call
spi_setup(), and select st->mux_st[AD4134_DOUT0_INPUT].

Symmetrically, iio_disable_buffers() runs .predisable before detaching the
trigger pollfunc:

	if (indio_dev->setup_ops->predisable) {
		ret2 =3D indio_dev->setup_ops->predisable(indio_dev);
		if (ret2 && !ret)
			ret =3D ret2;
	}

	if (iio_dev_opaque->currentmode =3D=3D INDIO_BUFFER_TRIGGERED) {
		iio_trigger_detach_poll_func(indio_dev->trig,
					     indio_dev->pollfunc);
	}

This allows ad4134_buffer_predisable() to deselect the DOUT0 mux state
before iio_trigger_detach_poll_func() disables the trigger and frees the
pollfunc IRQ.

(Note also that in this commit, indio_dev->setup_ops is overwritten with
NULL by the subsequent devm_iio_triggered_buffer_setup(..., NULL) call in
ad4134_probe() until a later commit in the series passes
&ad4134_buffer_setup_ops to devm_iio_triggered_buffer_setup().)

Should ad4134_buffer_setup_ops use .preenable and .postdisable instead of
.postenable and .predisable?

[ ... ]

> @@ -591,10 +725,61 @@ static int ad4134_probe(struct spi_device *spi)
>  		return dev_err_probe(dev, PTR_ERR(st->regmap),
>  				     "failed to initialize regmap");
> =20
> -	ret =3D ad4134_min_io_mode_setup(st);
> -	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "failed to setup minimum I/O mode\n");
> +	if (device_property_present(dev, "adi,spi-mode")) {
> +		ret =3D device_property_match_property_string(dev, "adi,spi-mode",
> +							    ad4134_spi_modes,
> +							    ARRAY_SIZE(ad4134_spi_modes));
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret,
> +					     "getting adi,spi-mode property failed\n");
> +
> +		st->spi_mode =3D ret;
> +	} else {
> +		/* Default to no-cs mode if adi,spi-mode is not specified */
> +		st->spi_mode =3D AD4134_SPI_MODE_NO_CS;
> +	}
> +
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
> +		 * This controls a multiplexer OUTSIDE OF AD4134 SILICON.
> +		 * See AD4134 IIO documentation for details.
> +		 */
> +		st->mux_st[AD4134_SDO_INPUT] =3D devm_mux_state_get(dev, "reg_access");
> +		if (IS_ERR(st->mux_st[AD4134_SDO_INPUT]))
> +			return dev_err_probe(dev, PTR_ERR(st->mux_st[AD4134_SDO_INPUT]),
> +					     "failed to get reg_access mux-state\n");
> +
> +		st->mux_st[AD4134_DOUT0_INPUT] =3D devm_mux_state_get(dev, "data_read"=
);
> +		if (IS_ERR(st->mux_st[AD4134_DOUT0_INPUT]))
> +			return dev_err_probe(dev, PTR_ERR(st->mux_st[AD4134_DOUT0_INPUT]),
> +					     "failed to get data_read mux-state\n");
> +
> +		indio_dev->setup_ops =3D &ad4134_buffer_setup_ops;
> +	}

[Severity: Medium]
When st->spi_mode is AD4134_SPI_MODE_4_WIRE (and without SPI offload in the
later high-speed data capture commit), how does sample readout work in
ad4134_data_read() and ad4134_trigger_handler()?

Both ad4134_data_read() and ad4134_trigger_handler() read all 4 channels
sequentially over DOUT0, which requires AD4134_DIG_IF_CFG_REG to be set to
AD4134_DATA_FORMAT_SINGLE_CH_MODE. However, that register update is only
performed inside ad4134_min_io_mode_setup() when st->spi_mode is
AD4134_SPI_MODE_NO_CS (and in ad4134_offload_setup() for 1-lane offload in
the later commit), leaving AD4134_DIG_IF_CFG_REG unconfigured in non-offload
4-wire mode.

In addition, while ad4134_trigger_handler() sets .cs_off =3D true on its
spi_transfer, ad4134_data_read() uses spi_write_then_read(), which asserts
CS during each 3-byte read while transmitting 0x00 on SDI. In 4-wire mode,
CS is wired to the register SPI interface and st->crc_en is false, so won't
asserting CS while clocking SCLK perform an unintended write to
AD4134_IFACE_CONFIG_A_REG (0x00)?

Should AD4134_DIG_IF_CFG_REG also be configured for single-channel DOUT0
output in 4-wire mode, and should ad4134_data_read() use a spi_transfer
with .cs_off =3D true?

> +
> +	st->odr_gpio =3D devm_gpiod_get(dev, "odr", GPIOD_OUT_LOW);
> +	if (IS_ERR(st->odr_gpio))
> +		return dev_err_probe(dev, PTR_ERR(st->odr_gpio),
> +				     "failed to get ODR GPIO\n");
> =20
>  	ret =3D devm_iio_triggered_buffer_setup(dev, indio_dev,
>  					      iio_pollfunc_store_time,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792200021.gi=
t.marcelo.schmitt@analog.com?part=3D12
