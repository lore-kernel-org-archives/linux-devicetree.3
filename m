Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8DA7260F
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 23:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781305294; cv=none; b=mnz9lnWWcGqycuO8tFS8WJXSQ1SIqJo4H89jWXknX0SI/t5NtPkHwo0KUDNs23Rl7LOQyU6Y+fdvvKvxVd4PdYXPd9udHqZAdi/D0RfLCltB5EpQaHjTOjE/0TUwdz6Tz1aKUe1oTc2YTHdMJGfQB+1t69uIcmaOH7XbGDPjfls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781305294; c=relaxed/simple;
	bh=PE7bhwVJF7dCx/Z/GhwYHVT8XnLWc7GDWjO48SnphLA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qF9mLQMa2nsXnU1ninSwaoIp3nlRUXFHqEiRsUwaVLQLQqOHvQcDKsytfhJCX5KaFcB+/VPiT10R8OZkhF/prflR2sIc9QUCqZrewRp3sSGz8t5mSJkymN+iWh+rHwf1/6jNtJqoCL46HcHV23yvM/+5DSjuyOVnHH+y74nyhWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEOTxD1w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEOTxD1w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04DB1F000E9;
	Fri, 12 Jun 2026 23:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781305293;
	bh=5IKhgoJtwu+8BcJzr5PMegP6OIPcVOkxCzCKBlqF5qI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UEOTxD1wFhZ/HwDICwpi8lXJG5CeFpRqxUosBpEimgt90F9iEuRzcF0TFuJ5ykRae
	 4dr9qeJv+A4WCAXMNy90n4M3Cm1yrNAd/XnnZUtAv7e3IHCrOjKMvRTNiQImf4kEAw
	 WUDN3ZFwXm8/rkqRklLZ3Sg6DekoACB+pqL36ujcOD40mixaBId9VMO0unDb4JPhjD
	 nszmyBQlQDoAHS/vA3GPHYUKDuKXEyI7fufb8QVsJeZ+svEXLwId2eY5iCs0Pn6Vya
	 kYvYOzQx/2YoHKNA1QglWnCJRWDehXsuwmwYjdKdeSFiEXvCMJuPMkEuEpeDy/TWb5
	 UHsVbc6TYZJ2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] iio: adc: Add ti-ads1262 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260612-ads126x-v1-2-894c788d03ed@gmail.com>
References: <20260612-ads126x-v1-2-894c788d03ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 23:01:32 +0000
Message-Id: <20260612230132.E04DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 15 potential issue=
(s) to consider:
- [High] Architecture Compatibility / Undefined Behavior due to direct bitf=
ield mapping.
- [High] Out-of-Bounds Memory Access / Hardware Misconfiguration during act=
ive channel iteration.
- [High] Infinite Loop / Denial of Service in IDAC microamp parsing.
- [High] Logic Error: Inverted bounds check rejects valid pin numbers.
- [High] Race Condition / Lost Wakeup due to reinitializing completion afte=
r hardware trigger.
- [High] Missing Error Handling / Type Mismatch: Unsigned check of negative=
 error code.
- [High] DMA Memory Corruption: Unaligned DMA buffer in union.
- [High] Uninitialized Memory Read (KMSAN) on stack variable.
- [High] Illegal DMA from Stack in regmap bus implementation.
- [High] Logic Error: GPIO get_multiple returns pin states incorrectly.
- [High] Hardware State / Timing violation during device reset.
- [High] Logic Error / Performance: Unconditional stall without IRQ.
- [Medium] Memory Leak of fwnode_handle reference on the error path.
- [Medium] Resource Leak of runtime PM usage counter on the error path.
- [Medium] API Contract Violation: Buffer mode lock released with direct mo=
de API.
--

commit bf3bd63a7b09cf7986792e14a3a80853f12e425d
Author: Kurt Borja <kuurtb@gmail.com>

    iio: adc: Add ti-ads1262 driver
   =20
    Add ti-ads1262 driver for TI ADS1262 and ADS1263 ADCs with initial
    support for various features including IIO modes and channel configurat=
ion.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> new file mode 100644
> index 0000000000000..fd1911cf65ace
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads1262.c
> @@ -0,0 +1,1816 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
[ ... ]
> +struct ads1262_channel {
> +	/* MODE0 */
> +	u8 conv_delay:4;
> +	u8 chop_mode:1;
> +	u8 idac_rot_mode:1;
> +	u8 runmode:1;
> +	u8 rev_vref_pol:1;
[ ... ]
> +static int ads1262_channel_enable_and_read(struct ads1262 *st,
> +					   struct ads1262_channel *chan,
> +					   __be32 *val)
> +{
[ ... ]
> +	mutex_lock(&st->chan_lock);
> +	memcpy(&st->tx[2], chan, sizeof(*chan));
> +	mutex_unlock(&st->chan_lock);

[Severity: High]
Does this code map a C bitfield directly to the SPI TX buffer?=20

C bitfield layout is implementation-defined, so this can send garbage
configuration bits to the hardware on big-endian architectures.

> +struct ads1262 {
[ ... ]
> +	u8 tx[6] __aligned(IIO_DMA_MINALIGN);
> +	union {
> +		u8 rx[6];
> +		struct {
> +			__be32 data;
> +		} __packed shift_reg;
> +		struct {
> +			u8 dummy;
> +			__be32 data;
> +		} __packed holding_reg;
> +	};
> +};

[Severity: High]
Can this union cause DMA memory corruption?

Since the anonymous union lacks an __aligned(IIO_DMA_MINALIGN) attribute,
the RX buffers can share a cache line with surrounding struct members,
leading to memory corruption during DMA on non-cache-coherent architectures.

> +static int ads1262_dev_reset(struct ads1262 *st)
> +{
> +	int ret;
> +
> +	if (st->reset_gpiod)
> +		ret =3D gpiod_set_value_cansleep(st->reset_gpiod, 1);
> +	else
> +		ret =3D ads1262_dev_cmd(st, ADS1262_OPCODE_RESET);
> +	if (ret)
> +		return ret;
> +
> +	fsleep(1);

[Severity: High]
Is the 1 microsecond delay sufficient here?=20

This short delay might violate hardware timing constraints for the device
reset, causing subsequent register writes to be ignored.

> +static int ads1262_read_calib(struct ads1262 *st, unsigned int reg, u32 =
*val)
> +{
> +	__le32 lval;
> +	int ret;
> +
> +	/*
> +	 * The calibration word is a signed 24 bit LSB-first value.
> +	 */
> +	ret =3D regmap_bulk_read(st->regmap, reg, &lval, 3);
> +	if (ret)
> +		return ret;
> +	*val =3D sign_extend32(le32_to_cpu(lval), 23);

[Severity: High]
Does this code evaluate an uninitialized byte?

The lval variable is 4 bytes long, but regmap_bulk_read only writes
3 bytes to it. The subsequent call to le32_to_cpu reads the
uninitialized 4th byte from the stack, which can trigger KMSAN warnings
and result in an incorrect sign extension.

> +static int ads1262_write_calib(struct ads1262 *st, unsigned int reg, u32=
 val)
> +{
> +	__le32 lval =3D cpu_to_le32(val);
> +
> +	/*
> +	 * The calibration word is a signed 24 bit LSB-first value.
> +	 */
> +	return regmap_bulk_write(st->regmap, reg, &lval, 3);
> +}

[Severity: High]
Can this result in an illegal DMA from the stack?

Calling regmap_bulk_write passes the lval stack variable to the
underlying SPI controller. This violates VMAP_STACK constraints and can
corrupt memory if the SPI controller uses DMA.

> +static void ads1262_wait_for_conversion(struct ads1262 *st)
> +{
> +	reinit_completion(&st->drdy);
> +
> +	/*
> +	 * The first conversion latency is affected by the channel's data rate,
[ ... ]
> +	wait_for_completion_timeout(&st->drdy, msecs_to_jiffies(6436));
> +}

[Severity: High]
Can wait_for_completion_timeout stall unconditionally if no IRQ is present?

Without a polling fallback, raw reads might block for the entire 6.4 second
timeout if the device isn't wired to an interrupt.

> +static int ads1262_channel_hot_reload(struct ads1262 *st,
> +				      const struct iio_chan_spec *chan)
> +{
[ ... ]
> +	weight =3D bitmap_weight(st->indio_dev->active_scan_mask,
> +			       iio_get_masklength(st->indio_dev));
> +	if (weight !=3D 1) {
> +		iio_device_release_direct(st->indio_dev);
> +		return 0;
> +	}

[Severity: Medium]
Does this code release the wrong type of lock?

The iio_device_try_claim_buffer_mode API was used earlier to acquire
the buffer mode lock, but this path releases it using
iio_device_release_direct, violating the IIO locking contract.

> +static int ads1262_channel_read(struct ads1262 *st,
> +				struct ads1262_channel *chan_data,
> +				__be32 *val)
> +{
[ ... ]
> +	ret =3D ads1262_dev_start_one(st, runmode);
> +	if (ret)
> +		return ret;
> +
> +	ads1262_wait_for_conversion(st);

[Severity: High]
Is there a race condition with the completion here?

By calling ads1262_dev_start_one before ads1262_wait_for_conversion
(which re-initializes the completion), the hardware might fire the DRDY
interrupt before the completion is re-initialized, leading to a lost
wakeup.

> +static int ads1262_parse_idac_pins(struct ads1262 *st, u32 *pins,
> +				   unsigned int num_pins)
> +{
[ ... ]
> +		ret =3D device_property_read_u32(dev, propname, &val);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to read property %s\n",
> +					     propname);
> +		if (val < ADS1262_IDACMUX_COUNT)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "%s: Pin number out of range %d\n",
> +					     propname, val);

[Severity: High]
Is the bounds check logic inverted here?

Checking if val < ADS1262_IDACMUX_COUNT causes valid pin numbers to be
rejected with an error instead of catching out-of-range ones.

> +static int ads1262_parse_idac_mags(struct ads1262 *st, u32 *mags,
> +				   unsigned int num_mags)
> +{
[ ... ]
> +		for (mode =3D 0; mode < ARRAY_SIZE(idac_microamps); i++) {
> +			if (val =3D=3D idac_microamps[mode])
> +				break;
> +		}

[Severity: High]
Can this create an infinite loop?

The loop iterates the mode variable but increments i (the outer loop's
induction variable), resulting in a lockup during probe.

> +static int ads1262_regulator_setup(struct ads1262 *st)
> +{
[ ... ]
> +	reg_id =3D "vref";
> +	st->vref_uV =3D devm_regulator_get_enable_read_voltage(dev, reg_id);
> +	if (st->vref_uV < 0)
> +		goto err_regulator_get;

[Severity: High]
Will this error check ever succeed?

The return value of devm_regulator_get_enable_read_voltage is stored
in st->vref_uV, which is an unsigned 32-bit integer. The negative
error code becomes a large positive number, making st->vref_uV < 0
statically false.

> +static int ads1262_regmap_read(void *context, const void *reg_buf,
> +			       size_t reg_size, void *val_buf, size_t val_size)
> +{
> +	struct ads1262 *st =3D context;
> +	struct spi_transfer xfer[3] =3D {
[ ... ]
> +		{
> +			.rx_buf =3D val_buf,
> +			.len =3D val_size,
> +		},
> +	};
[ ... ]
> +	return spi_sync_transfer(st->spi, xfer, ARRAY_SIZE(xfer));
> +}

[Severity: High]
Does this custom regmap bus allow SPI DMA transfers directly to user-provid=
ed
buffers?

Passing val_buf directly into rx_buf might result in DMA to stack
memory if the caller passes a stack variable, violating VMAP_STACK constrai=
nts
and causing memory corruption.

> +static int ads1262_gpiochip_get_multiple(struct gpio_chip *gc,
> +					 unsigned long *mask,
> +					 unsigned long *bits)
> +{
> +	struct ads1262 *st =3D gpiochip_get_data(gc);
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_read(st->regmap, ADS1262_GPIODAT_REG, &val);
> +	if (ret)
> +		return ret;
> +
> +	return val & *mask;
> +}

[Severity: High]
Does this code return the pin states incorrectly?

The GPIO get_multiple callback is expected to write the state to the
bits bitmap pointer, but instead it returns the state via the integer
return code.

> +static int ads1262_buffer_preenable(struct iio_dev *indio_dev)
> +{
[ ... ]
> +	iio_for_each_active_channel(indio_dev, i)
> +		ads1262_channel_set_runmode(st, &st->channels[i],
> +					    ADS1262_RUNMODE_CONTINUOUS);

[ ... ]
> +static int ads1262_fill_buffer_mult(struct ads1262 *st)
> +{
[ ... ]
> +	iio_for_each_active_channel(st->indio_dev, chan) {
> +		ret =3D ads1262_channel_enable_and_read(st, &st->channels[chan],
> +						      &val);

[Severity: High]
Can these loops access memory out of bounds?

iio_for_each_active_channel iterates over all active channels, including
the software timestamp channel if it is enabled. This can result in an
out-of-bounds array access on st->channels[chan] and misconfiguring the
hardware.

> +static int ads1262_aux_device_setup(struct ads1262 *st)
> +{
[ ... ]
> +out_node_put:
> +	fwnode_handle_put(node);
> +
> +	return ret;
> +}

[Severity: Medium]
Does this code leak the fwnode reference on the error path?

Because node is consumed and set to NULL by no_free_ptr(node) during
device_set_node, any subsequent failures jumping to out_node_put will
call fwnode_handle_put(NULL), leaving the reference leaked.

> +static int ads1262_gpiochip_request(struct gpio_chip *gc, unsigned int o=
ffset)
> +{
> +	struct ads1262 *st =3D gpiochip_get_data(gc);
> +	struct device *dev =3D &st->spi->dev;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(st->regmap, ADS1262_GPIOCON_REG,
> +				  BIT(offset), BIT(offset));
> +}

[Severity: Medium]
Does this leak the runtime PM usage counter on failure?

If regmap_update_bits fails, the function returns the error directly
without calling pm_runtime_put_autosuspend(dev) to balance the resume.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-ads126x-v1=
-0-894c788d03ed@gmail.com?part=3D2
