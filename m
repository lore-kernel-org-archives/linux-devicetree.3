Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82DC246783
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 00:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792369892; cv=none; b=UOVjaDq2oAzYwnv+DvC7/DI8zzxclewiQ+1uUvw0s0iUPvRUNApur69OfjXOXJVwmCWQKGYkJL/0YSbpJB26j9Npjd+utF4XunvK3JzSrhepE/rMZMsmM5JXtF8ztxICai996uFeZx+M2fQu7ekzVNfU4Nkmjlm4K3LMfXdVeL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792369892; c=relaxed/simple;
	bh=/lMJa8hN2d+4mqArWCUXA7j8D2c/FsA+nukWrbbdyi8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ac/L/W3dyh0PXdY8UTHMjqRp2TKb9lWWps0J4aNJ8MIHUmzNsBx8Wh7/XdPdEHGSR+W3PA/12KqY0cqtQgQdyvuC5/SEA/K4azdDmVBy23vUJQxMAxez8rxTG1x/otjI2hrXdr6NxJoQusCKkM5d7jowcO6rqF2tMJ/NHbIecSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyNesnEZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyNesnEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234851F000C4;
	Mon, 19 Oct 2026 00:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792369890;
	bh=3pJ88Ru86l2bE6EkdwwyPKD57bijh5fTmVovAOjOG7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MyNesnEZ3wkMyRqMKYpWrOc2OKSGnvzYEiXr2wKKY4T1TQpRsCwyrZ/WTv7YM+vtc
	 IP2VI5oHFlwZxKTpgUnfMKtTr7cTCd/IYvhPqWm2SJ11/DqWHRh11Rt5EgQD5rsp3j
	 3zoixRUglm2LZiXwSmdZYzOGfJB96XRPQBsEhw9qZLCYpsNYRyrWRvQsU/3GF1yz2u
	 9t47mxAEFpRntH7EPpC3uMLtagGJC8GdtM6E1KjC3ObV4XX6/1uSa3sM4MwLVzvme4
	 eqnSXaNJv8PlGrWEauEgoflwWV8W1BO/B2xkjnOPCmthNjECDG+M6Yi4SSzFnST78Q
	 oELI397gCbchQ==
Message-ID: <sashiko-outbox-176464@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: adc: ti-ads1299: add driver for TI ADS1299
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stephan Costa Barros" <stephanbrrs8@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019001247.483005-3-stephanbrrs8@gmail.com>
References: <20261019001247.483005-1-stephanbrrs8@gmail.com>
 <20261019001247.483005-3-stephanbrrs8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 00:31:29 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] iio: adc: ti-ads1299: unsynchronized async rdata_msg on stop and t=
imeout
- [High] iio: adc: ti-ads1299: concurrent cmd_buffer access and shared DMA =
cacheline
- [Medium] iio: adc: ti-ads1299: incorrect power-up and reference start-up =
sequence in ads1299_probe()
- [Medium] iio: adc: ti-ads1299: unchecked spi_async() and rdata_msg.status=
 errors
--

commit 3f1066cf1b7c3e1e9933416e0c037a37dcbe64ed
Author: Stephan Costa Barros <stephanbrrs8@gmail.com>

iio: adc: ti-ads1299: add driver for TI ADS1299

This patch adds an IIO ADC driver for the Texas Instruments ADS1299,
ADS1299-6, and ADS1299-4 24-bit biopotential analog front-ends over SPI.
It supports on-demand single-shot channel reads and buffered capture driven
by the DRDY interrupt.

> diff --git a/drivers/iio/adc/ti-ads1299.c b/drivers/iio/adc/ti-ads1299.c
> new file mode 100644
> index 0000000000000..f817a86cca5c9
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads1299.c
> @@ -0,0 +1,897 @@

[ ... ]

> +struct ads1299_private {
> +	struct spi_device *spi;
> +	struct regmap *regmap;
> +	struct completion completion;
> +	struct spi_transfer rdata_xfer;
> +	struct spi_message rdata_msg;
> +	spinlock_t irq_busy_lock; /* Handshake between SPI and DRDY irqs */
> +	/*
> +	 * 0 =3D idle, 1 =3D transfer in progress, 2 =3D a sample became due du=
ring
> +	 * it; any more were lost.
> +	 */
> +	unsigned int rdata_xfer_busy;
> +	unsigned int num_adc_channels;
> +	int samp_freq_avail[ADS1299_NUM_DR];
> +	int scale_avail[ARRAY_SIZE(ads1299_pga_gain)][2];
> +
> +	struct {
> +		u32 chan[ADS1299_MAX_CHANNELS];
> +		aligned_s64 timestamp;
> +	} scan;
> +
> +	/* For synchronous SPI exchanges (read/write registers) */
> +	u8 cmd_buffer[ADS1299_SPI_CMD_BUFFER_SIZE] __aligned(IIO_DMA_MINALIGN);
> +
> +	u8 rx_buffer[ADS1299_SPI_RDATA_BUFFER_SIZE_MAX];
> +	/* Contains the RDATA command and zeroes to clock out */
> +	u8 tx_buffer[ADS1299_SPI_RDATA_BUFFER_SIZE_MAX];
> +};

[ ... ]

> +static int ads1299_write_cmd(struct ads1299_private *priv, u8 command)
> +{
> +	struct spi_transfer xfer =3D {
> +		.tx_buf =3D priv->cmd_buffer,
> +		.rx_buf =3D priv->cmd_buffer,
> +		.len =3D 1,
> +		.speed_hz =3D ADS1299_SPI_BUS_SPEED_SLOW,
> +		.delay =3D {
> +			.value =3D 2,
> +			.unit =3D SPI_DELAY_UNIT_USECS,
> +		},
> +	};
> +
> +	priv->cmd_buffer[0] =3D command;
> +
> +	return spi_sync_transfer(priv->spi, &xfer, 1);
> +}

[Severity: High]
Can priv->cmd_buffer be corrupted by concurrent accesses, or share a DMA
cacheline with priv->rx_buffer and priv->tx_buffer?

In ads1299_reg_read() and ads1299_reg_write(), priv->cmd_buffer is used as
both tx_buf and rx_buf under priv->regmap's internal lock. However,
ads1299_write_cmd() mutates and transfers priv->cmd_buffer under the IIO
device mode lock (via ads1299_read_one(), ads1299_buffer_postenable(), and
ads1299_buffer_predisable()) without acquiring the regmap lock.

Because ads1299_read_raw() (for IIO_CHAN_INFO_SCALE and
IIO_CHAN_INFO_SAMP_FREQ, where ADS1299_REG_CONFIG1 is uncached on first
read) and ads1299_reg_access() invoke regmap_read() and regmap_write()
without iio_device_claim_direct(), those paths can run concurrently with
ads1299_write_cmd() under disjoint locks and overwrite priv->cmd_buffer
during an active SPI transfer.

In addition, in struct ads1299_private, only cmd_buffer has
__aligned(IIO_DMA_MINALIGN), while rx_buffer and tx_buffer immediately
follow it in the same cacheline. On non-coherent platforms, can CPU or DMA
access to cmd_buffer (for example, during ads1299_buffer_predisable() or
sysfs/debugfs register reads) corrupt an in-flight rdata_msg DMA transfer
using rx_buffer and tx_buffer?

> +
> +static int ads1299_read_one(struct ads1299_private *priv, int chan_index)
> +{
> +	int ret;
> +
> +	/* Enable the channel */
> +	ret =3D regmap_update_bits(priv->regmap, ADS1299_REG_CHnSET(chan_index),
> +				 ADS1299_MASK_CH_PD, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable single-shot mode, so we don't need to send a STOP */
> +	ret =3D regmap_update_bits(priv->regmap, ADS1299_REG_CONFIG4,
> +				 ADS1299_MASK_CONFIG4_SINGLE_SHOT,
> +				 ADS1299_MASK_CONFIG4_SINGLE_SHOT);
> +	if (ret)
> +		return ret;
> +
> +	reinit_completion(&priv->completion);
> +
> +	ret =3D ads1299_write_cmd(priv, ADS1299_CMD_START);
> +	if (ret < 0) {
> +		dev_err(&priv->spi->dev, "CMD_START error: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* A conversion takes 4 ms at the lowest rate, plus bus latency */
> +	ret =3D wait_for_completion_timeout(&priv->completion, msecs_to_jiffies=
(100));
> +	if (!ret)
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}

[ ... ]

> +static void ads1299_rdata_release_busy_or_restart(struct ads1299_private=
 *priv)
> +{
> +	guard(spinlock_irqsave)(&priv->irq_busy_lock);
> +
> +	if (priv->rdata_xfer_busy > 1) {
> +		/* A sample became due during the transfer: fetch it now */
> +		spi_async(priv->spi, &priv->rdata_msg);
> +		priv->rdata_xfer_busy =3D 1;
> +	} else {
> +		priv->rdata_xfer_busy =3D 0;
> +	}
> +}
> +
> +/* Called from SPI completion interrupt handler */
> +static void ads1299_rdata_complete(void *context)
> +{
> +	struct iio_dev *indio_dev =3D context;
> +	struct ads1299_private *priv =3D iio_priv(indio_dev);
> +	u32 *bounce =3D priv->scan.chan;
> +	int scan_index;
> +
> +	if (!iio_buffer_enabled(indio_dev)) {
> +		/*
> +		 * For a single transfer we are kept in direct mode until
> +		 * completion, avoiding a race with buffered IO.
> +		 */
> +		ads1299_rdata_unmark_busy(priv);
> +		complete(&priv->completion);
> +		return;
> +	}
> +
> +	iio_for_each_active_channel(indio_dev, scan_index) {
> +		const struct iio_chan_spec *scan_chan =3D
> +					&indio_dev->channels[scan_index];
> +
> +		if (scan_chan->type =3D=3D IIO_TIMESTAMP)
> +			continue;
> +
> +		*bounce++ =3D get_unaligned_be24(priv->rx_buffer +
> +					       scan_chan->address);
> +	}
> +
> +	/* rx_buffer can be overwritten from this point on */
> +	ads1299_rdata_release_busy_or_restart(priv);
> +
> +	iio_push_to_buffers_with_ts(indio_dev, &priv->scan, sizeof(priv->scan),
> +				    iio_get_time_ns(indio_dev));
> +}
> +
> +static irqreturn_t ads1299_interrupt(int irq, void *dev_id)
> +{
> +	struct iio_dev *indio_dev =3D dev_id;
> +	struct ads1299_private *priv =3D iio_priv(indio_dev);
> +	unsigned int wasbusy;
> +
> +	guard(spinlock_irqsave)(&priv->irq_busy_lock);
> +
> +	wasbusy =3D priv->rdata_xfer_busy++;
> +	/* When no SPI transfer is in transit, start one now */
> +	if (!wasbusy)
> +		spi_async(priv->spi, &priv->rdata_msg);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
What happens if spi_async() fails in ads1299_interrupt() or
ads1299_rdata_release_busy_or_restart(), or if priv->rdata_msg completes
with an error?

In both functions, priv->rdata_xfer_busy is set to a non-zero value without
checking the return value of spi_async(). If spi_async() returns an error,
ads1299_rdata_complete() will never run, leaving priv->rdata_xfer_busy
non-zero so subsequent DRDY interrupts see wasbusy !=3D 0 and stop starting
transfers.

Also, in ads1299_rdata_complete(), priv->rdata_msg.status is not checked
before completing priv->completion or pushing priv->rx_buffer data via
iio_push_to_buffers_with_ts(). Would a failed async SPI transfer report
stale or partial rx_buffer contents as valid ADC samples?

> +
> +static int ads1299_buffer_postenable(struct iio_dev *indio_dev)
> +{
> +	struct ads1299_private *priv =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	/* Disable single-shot mode */
> +	ret =3D regmap_update_bits(priv->regmap, ADS1299_REG_CONFIG4,
> +				 ADS1299_MASK_CONFIG4_SINGLE_SHOT, 0);
> +	if (ret)
> +		return ret;
> +
> +	return ads1299_write_cmd(priv, ADS1299_CMD_START);
> +}
> +
> +static int ads1299_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct ads1299_private *priv =3D iio_priv(indio_dev);
> +
> +	return ads1299_write_cmd(priv, ADS1299_CMD_STOP);
> +}

[Severity: High]
Does ads1299_buffer_predisable() race with in-flight DRDY interrupts and
asynchronous priv->rdata_msg transfers?

When disabling the buffer, iio_disable_buffers() calls
ads1299_buffer_predisable(), which sends ADS1299_CMD_STOP and returns
immediately without synchronizing spi->irq, preventing
ads1299_rdata_release_busy_or_restart() from re-submitting priv->rdata_msg,
or waiting for in-flight priv->rdata_msg transfers to complete.

Right after predisable returns, iio_disable_buffers() frees
indio_dev->active_scan_mask and sets it to NULL before updating currentmode
to INDIO_DIRECT_MODE. If ads1299_rdata_complete() runs concurrently during
this window, iio_buffer_enabled(indio_dev) is still true while
iio_for_each_active_channel() dereferences indio_dev->active_scan_mask. If
it completes slightly later after currentmode becomes INDIO_DIRECT_MODE, it
will signal priv->completion and leave stale completion state for a
subsequent ads1299_read_one().

A similar issue exists if wait_for_completion_timeout() times out in
ads1299_read_one() while priv->rdata_msg is still in flight:
ads1299_read_raw() releases direct mode without waiting for priv->rdata_msg,
and a subsequent ads1299_update_scan_mode() calls
ads1299_rdata_unmark_busy() to reset priv->rdata_xfer_busy =3D 0, allowing =
the
next DRDY interrupt to pass an already-queued priv->rdata_msg to
spi_async(). Likewise, on driver unbind, devm tears down indio_dev without
quiescing the IRQ and flushing in-flight priv->rdata_msg transfers first.

[ ... ]

> +static int ads1299_init(struct iio_dev *indio_dev, bool internal_vref)
> +{

[ ... ]

> +	/* Without the reference buffer every channel reads zero */
> +	val =3D ADS1299_CONFIG3_RESERVED_VALUE;
> +	if (internal_vref)
> +		val |=3D ADS1299_MASK_CONFIG3_PWR_REFBUF;
> +	ret =3D regmap_write(priv->regmap, ADS1299_REG_CONFIG3, val);
> +	if (ret)
> +		return ret;
> +
> +	/* Out of reset the inputs are shorted: connect them */
> +	for (i =3D 0; i < priv->num_adc_channels; i++) {
> +		ret =3D regmap_update_bits(priv->regmap, ADS1299_REG_CHnSET(i),
> +					 ADS1299_MASK_CH_MUX,
> +					 FIELD_PREP(ADS1299_MASK_CH_MUX,
> +						    ADS1299_MUX_NORMAL));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int ads1299_probe(struct spi_device *spi)
> +{

[ ... ]

> +	/* Reset to be asserted before enabling clock and power */
> +	reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(reset_gpio),
> +				     "Cannot get reset GPIO\n");
> +
> +	powerdown_gpio =3D devm_gpiod_get_optional(dev, "powerdown",
> +						 GPIOD_OUT_LOW);
> +	if (IS_ERR(powerdown_gpio))
> +		return dev_err_probe(dev, PTR_ERR(powerdown_gpio),
> +				     "Cannot get powerdown GPIO\n");
> +
> +	/* VREF can be supplied externally, otherwise use the internal 4.5 V */
> +	vref_uv =3D devm_regulator_get_enable_read_voltage(dev, "vref");
> +	if (vref_uv < 0 && vref_uv !=3D -ENODEV)
> +		return dev_err_probe(dev, vref_uv, "Failed to get vref voltage\n");
> +
> +	internal_vref =3D vref_uv =3D=3D -ENODEV;
> +	if (internal_vref)
> +		vref_uv =3D ADS1299_INTERNAL_VREF_UV;
> +
> +	clk =3D devm_clk_get_optional_enabled(dev, "clk");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clk\n");

[ ... ]

> +	ret =3D devm_regulator_get_enable(dev, "avdd");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable avdd regulator\n");
> +
> +	ret =3D devm_regulator_get_enable(dev, "dvdd");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable dvdd regulator\n");

[ ... ]

> +	/* Out of power-down: wait for the oscillator and the reference */
> +	if (powerdown_gpio)
> +		msleep(ADS1299_START_UP_MS);
> +
> +	if (reset_gpio) {
> +		/* Minimum reset pulse width is 2 clock cycles */
> +		fsleep(ADS1299_CLOCKS_TO_USECS(2));
> +		gpiod_set_value_cansleep(reset_gpio, 0);
> +	} else {
> +		ret =3D ads1299_write_cmd(priv, ADS1299_CMD_RESET);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "RESET failed\n");
> +	}
> +	/* Wait 18 clock cycles for the reset to complete */
> +	fsleep(ADS1299_CLOCKS_TO_USECS(18));
> +
> +	ret =3D ads1299_init(indio_dev, internal_vref);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Init failed\n");

[Severity: Medium]
Is the power-up and reference start-up sequence in ads1299_probe() and
ads1299_init() ordered as intended?

First, powerdown_gpio is requested with GPIOD_OUT_LOW (deasserted) and vref
and clk are enabled before the avdd and dvdd regulators are enabled.

Second, msleep(ADS1299_START_UP_MS) is only executed when powerdown_gpio is
present. When the optional powerdown GPIO is omitted, the driver skips the
150 ms power-on start-up delay after enabling avdd and dvdd before releasing
reset or issuing ADS1299_CMD_RESET.

Third, out of reset, ADS1299_REG_CONFIG3 defaults to having the internal
reference buffer powered down, and ADS1299_MASK_CONFIG3_PWR_REFBUF is only
written later in ads1299_init(). Because msleep(ADS1299_START_UP_MS) runs
before reset is released (or before ADS1299_CMD_RESET) and before
ADS1299_MASK_CONFIG3_PWR_REFBUF is enabled, the internal reference buffer is
not given time to settle after being powered up.

[ ... ]

=E2=80=94
=F0=9F=A4=96 Generated by Linux Kernel Patch Reviewer (Model: gemini-3.1-pr=
o-preview)
Prompt Version: 969354535492578f3c622ebd4ebddaf43de71bd4
Tools: git-2.53.0-1.fc43.x86_64
Date: 2026-10-19 06:58:26 UTC
Duration (ms): 229238
Tokens (in/out): 167213 / 11103
Prompts Used: build.md, callstack.md, cleanup.md, gpio.md, inline-template.=
md, kconfig.md, mm-alloc.md, of.md, subsystem/locking.md, technical-pattern=
s.md

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019001247.4830=
05-1-stephanbrrs8@gmail.com?part=3D2
