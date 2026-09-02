Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC2D373C12
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 17:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371190; cv=none; b=NaaGOnt0Jf6FioQALOfp3NULZ27Dagqczce8qYFC19VUdFjZEUJqm+cgL/5MUl6sPWqpWiC4ABndTJr2V5UTtz49ZcyS0CTnWS6i9bGlEN/xGH2XHHBbLFkvDkRWC9vyaqAxEMiHPrFEiCpA4y4bqG7ziaUKYKSDeigC73icg10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371190; c=relaxed/simple;
	bh=BJoKOf5pT7gj3KA7q7jwcUN72ETUucUmSUJMErumLBQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wpq2qpSzJneoJT2AsLzX6Ctkig5LnWCABqtqUexVzJN4N1g3YQ+3TMeF/c+iqdthWz1BhZDIo4Q0e+T0Jmy5PHL+2MlRjX4vWvCr9JPxingbJktZYMzS7WMUTHqlBH6kbyDrJ9UqT35A0d3wyxnbqcncLZTEsmAY4XbF01UzvW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+Nzpckh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+Nzpckh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9175C1F000E9;
	Wed,  2 Sep 2026 17:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788371187;
	bh=BmrUtvUF/H5p+wrHvf+eKBl/X5Fi2UH3Hyu4UX8vsVQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a+NzpckhUjdf/ajimK2zBruu85jKYDq4fYiJ4WVcth85OpYMbXis4EbpFIlZMBfYF
	 fT3kaxfQBfveQXXSo2bxjFvCuZ+uMQ45G55k0fTSeTc4qdJ5SWjpKoWZRbe5UUKCKc
	 /CmCVnEqOilXCiDbBI8H3Ogb3gop6yC+MLA/xNPdiedGi4WGYrSjTTjHDI84+amNXL
	 LweP9mpfZPqD29RWyzlO2tA4S/b/oLCAiYBs4N87XeCg2TTZ/AyaFY9wc41yhpH2Sq
	 ltWMKlXoB6MjLuFFMY7N5qF1qZiaFylH8gVO0rd/ZpGyGeVxWBFrYa08fZJPRqpj8e
	 q1RgboQi7PdXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 09/13] iio: adc: ad4134: Support SPI 4-wire mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <b7639db1c5f9b13f74d0c4f04edc8d9c11ac4727.1788368334.git.marcelo.schmitt@analog.com>
References: <cover.1788368334.git.marcelo.schmitt@analog.com>
 <b7639db1c5f9b13f74d0c4f04edc8d9c11ac4727.1788368334.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 17:46:26 +0000
Message-Id: <20260902174627.9175C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] The `access_mode_lock` mutex is declared but never initialized bef=
ore use.
- [High] Manual deselection of a devres-managed mux state corrupts the mux =
controller lock.
- [High] The IIO buffer setup callbacks are silently overwritten with NULL,=
 breaking the 4-wire mode data acquisition.
- [High] Error handling flaws in MUX state transitions lead to hardware des=
ync and lock corruption.
- [High] Missing direct mode protection in debugfs register access corrupts=
 the active IIO buffer hardware state.

Pre-existing issues:
- [Critical] Incorrect loop bounds using IIO mask length and array sizes ca=
use buffer overflows and ADC hardware desync.
- [High] DMA buffers `rx_buf` and `tx_buf` are not cache-line aligned, shar=
ing a cache line with `scan` and each other.
--

commit 9456cb761dce0c0b24bcfb813fd2681f50469691
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

    iio: adc: ad4134: Support SPI 4-wire mode
   =20
    AD4134 devices can be wired in a few different ways. So far, only minim=
um
    I/O mode was supported. While minimum I/O mode allows interfacing with
    AD4134 with a reduced number of wires, that wiring configuration is not
    optimal for high-throughput data acquisition.
   =20
    Extend AD4134 support to enable interfacing in SPI 4-wire configuration.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 0751b89dec8f3..8453b44ef368f 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c

[ ... ]

> @@ -154,11 +170,17 @@ struct ad4134_state {
>  	struct gpio_desc *odr_gpio;
>  	int refin_mv;
>  	bool crc_en;
> +	enum ad4134_spi_mode spi_mode;
> +	struct mux_state *mux_st[2];
>  	/*
>  	 * Synchronize access to members the of driver state, and ensure
>  	 * atomicity of consecutive register access operations.
>  	 */
>  	struct mutex lock;
> +	/*
> +	 * Ensure atomicity of access mode switch operations.
> +	 */
> +	struct mutex access_mode_lock;

[Severity: High]
Is access_mode_lock ever initialized before use?

The lock is allocated within struct ad4134_state via devm_iio_device_alloc()
(which zero-initializes the memory), but it doesn't appear to be initialized
via mutex_init() or devm_mutex_init() in ad4134_probe() before it is used by
the new access mode functions. Does this cause a kernel crash or lockdep sp=
lat
when the guard is invoked in ad4134_set_register_access()?

[Severity: High]
This is a pre-existing issue, but does this code cause a DMA cache coherency
violation?

struct ad4134_state {
...
    u32 scan[AD4134_NUM_CHANNELS] __aligned(IIO_DMA_MINALIGN);
    u8 rx_buf[AD4134_SPI_MAX_XFER_LEN];
    u8 tx_buf[AD4134_SPI_MAX_XFER_LEN];
};

While scan is aligned to IIO_DMA_MINALIGN, it is only 16 bytes. Because rx_=
buf
and tx_buf immediately follow it without their own alignment attributes, th=
ey
occupy the same cache line. When the SPI core maps rx_buf and tx_buf for DM=
A in
ad4134_register_read(), will cache invalidation on the RX buffer silently
destroy adjacent CPU writes or DMA buffers residing in the same cache line?

[ ... ]

> +static int ad4134_set_register_access(struct ad4134_state *st)
> +{
> +	int ret;
> +
> +	guard(mutex)(&st->access_mode_lock);
> +	st->spi->mode =3D SPI_MODE_0;
> +	ret =3D spi_setup(st->spi);
> +	if (ret)
> +		return ret;

[Severity: High]
If spi_setup() fails, this returns early. Does this abandon the physical mux
in the DOUT0_INPUT state, and bypass the rest of the mux state machine upda=
tes?

> +
> +	ret =3D mux_state_deselect(st->mux_st[AD4134_DOUT0_INPUT]);
> +	if (ret)
> +		dev_err(&st->spi->dev, "error on DOUT0 deselect: %d\n", ret);
> +
> +	ret =3D mux_state_try_select(st->mux_st[AD4134_SDO_INPUT]);
> +	if (ret && ret !=3D -EBUSY)
> +		return ret;

[Severity: High]
If mux_state_try_select() returns -EBUSY, this code ignores the error and
returns success (0). Does this incorrectly pretend the lock was acquired
when it wasn't, potentially causing a later mux_state_deselect() to corrupt
the underlying semaphore?

> +
> +	return 0;
> +}
> +
> +/*
> + * When AD4134 SDO and DOUT0 pins are multiplexed, this function changes=
 the
> + * multiplexer state to route DOUT0 to the SPI controller. On failure, f=
all
> + * back to routing SDO to the controller and return an errno.
> + */
> +static int ad4134_set_sample_access(struct ad4134_state *st)
> +{
> +	int ret, ret2;
> +
> +	guard(mutex)(&st->access_mode_lock);
> +	ret =3D mux_state_deselect(st->mux_st[AD4134_SDO_INPUT]);

[Severity: High]
Does this manual deselection of a devres-managed mux state corrupt the mux
controller lock?

In ad4134_probe(), devm_mux_state_get_selected() is used to acquire
st->mux_st[AD4134_SDO_INPUT]. That automatically selects the SDO_INPUT state
and registers a devres action (devm_mux_state_release) to deselect it on
driver unbind.

By manually calling mux_state_deselect() here, will devres unconditionally
call mux_state_deselect() again on unbind, invoking up(&mux->lock) on an
already-deselected state or on a state currently held by another driver?

> +	if (ret)
> +		dev_err(&st->spi->dev, "error on SDO deselect: %d\n", ret);
> +
> +	ret =3D mux_state_try_select(st->mux_st[AD4134_DOUT0_INPUT]);
> +	if (ret) {
> +		dev_err(&st->spi->dev, "error on DOUT0 select: %d\n", ret);
> +		return mux_state_select(st->mux_st[AD4134_SDO_INPUT]);

[Severity: High]
By returning the result of mux_state_select() directly, does this overwrite
the original failure code with 0 (success)? Will this mask the failure to e=
nter
sample access mode, tricking the caller into reading data from the wrong
hardware routing?

[ ... ]

>  static int ad4134_reg_read(void *context, unsigned int reg, unsigned int=
 *val)
>  {
>  	struct ad4134_state *st =3D context;
> +	int ret, ret2;
> =20
> -	if (reg >=3D AD4134_CH_VREG(0))
> -		return ad4134_data_read(st, reg, val);
> +	if (reg >=3D AD4134_CH_VREG(0)) {
> +		if (st->spi_mode =3D=3D AD4134_SPI_MODE_4_WIRE) {
> +			ret =3D ad4134_set_sample_access(st);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		ret =3D ad4134_data_read(st, reg, val);
> +
> +		if (st->spi_mode =3D=3D AD4134_SPI_MODE_4_WIRE) {
> +			ret2 =3D ad4134_set_register_access(st);
> +			if (ret2)
> +				dev_err(&st->spi->dev, "access mode error: %d\n", ret2);
> +		}
> +
> +		return ret;
> +	}

[Severity: High]
Can this unconditionally restoring register access mode corrupt the hardware
state expected by a concurrently active IIO buffer?

The function ad4134_debugfs_reg_access() (which eventually calls this) does=
n't
claim IIO direct mode. If a user reads a virtual register via debugfs while=
 the
IIO buffer is actively streaming, this will call ad4134_set_sample_access()=
 and
then unconditionally call ad4134_set_register_access(). Does this forcefully
rip the hardware back into SPI_MODE_0 and SDO_INPUT, permanently breaking t=
he
active IIO buffer thread which requires SPI_MODE_1 and DOUT0_INPUT?

[Severity: Critical]
This is a pre-existing issue, but do incorrect loop bounds using IIO mask l=
ength
and array sizes cause buffer overflows and ADC hardware desync?

In ad4134_data_read():
    for (i =3D 0; i < ARRAY_SIZE(ad4134_chan_set); i++) {
        ret =3D spi_write_then_read(st->spi, NULL, 0, st->rx_buf, ...

Here, the loop runs ARRAY_SIZE(ad4134_chan_set) (which is 5 due to the soft
timestamp channel) times against a physical ADC that only has 4 channels. D=
oes
this send invalid extra SPI clocks that desynchronize the ADC?

Also, in ad4134_trigger_handler():
    for (unsigned int ch =3D 0; ch < iio_get_masklength(indio_dev); ch++) {
        ret =3D spi_write_then_read(st->spi, NULL, 0, &st->scan[ch], ...

When the timestamp channel is enabled, iio_get_masklength(indio_dev) evalua=
tes
to 5. Because st->scan is only sized for AD4134_NUM_CHANNELS (4 elements), =
does
this cause an out-of-bounds write to &st->scan[4], corrupting adjacent fiel=
ds?

[ ... ]

> @@ -590,10 +710,42 @@ static int ad4134_probe(struct spi_device *spi)
>  		return dev_err_probe(dev, PTR_ERR(st->regmap),
>  				     "failed to initialize regmap");
> =20
> -	ret =3D ad4134_min_io_mode_setup(st);
> -	if (ret)

[ ... ]

> +		st->mux_st[AD4134_DOUT0_INPUT] =3D devm_mux_state_get(dev, "data_read"=
);
> +		if (IS_ERR(st->mux_st[AD4134_DOUT0_INPUT]))
> +			return dev_err_probe(dev, PTR_ERR(st->mux_st[AD4134_DOUT0_INPUT]),
> +					     "failed to get data_read mux-state\n");
> +
> +		indio_dev->setup_ops =3D &ad4134_buffer_setup_ops;
> +	}
> =20
>  	ret =3D devm_iio_triggered_buffer_setup(dev, indio_dev,
>  					      iio_pollfunc_store_time,

[Severity: High]
Does devm_iio_triggered_buffer_setup() silently overwrite the IIO buffer
setup callbacks with NULL, breaking the 4-wire mode data acquisition?

The driver assigns indio_dev->setup_ops =3D &ad4134_buffer_setup_ops; and t=
hen
immediately calls devm_iio_triggered_buffer_setup(..., NULL). Because the I=
IO
core macro unconditionally executes indio_dev->setup_ops =3D setup_ops; ins=
ide,
does it replace the driver's custom hooks with NULL? If so, the postenable
and predisable hooks will never be invoked, preventing the hardware mux from
ever switching to DOUT0_INPUT for buffered reads.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788368334.gi=
t.marcelo.schmitt@analog.com?part=3D9
