Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B41D43C05E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839589; cv=none; b=r0oV5jyQLS7D7vrNGRdnhWM28pdc4DiV0IAeYn5wFYIPhCxofAgihVOF8vBkKGFgSGdtkF/hWxJMBgoVV6b+6zEEhi7Dy3M6Eu9asom6YB93kVnZBTBE1TKPKftpOLF41ciFjNEUd+wPpRr2DyOvn9mU//EnsCN3xQOwUiNsxaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839589; c=relaxed/simple;
	bh=y1ZPuop+1B62rdlawvTAPZcWGa3CVURVrIR4ZOf++Fg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=thwFDAGI78mA0g5lvnJCs/TS2ccCUB43gH3bBoddGiqFe6FK6S2wqS1/4xkzP1Dqa5X8N8fTKe5/OVVnFpx1phEk38LuKIF83mGPJZm9TlPADDCt/ebZ9tmgnSZhXriocr4T374I4t7dwZW/3uTUymJnnTwuDcAmfgvjIE4Quio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQvHOHeq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQvHOHeq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4213C2BCB0;
	Fri, 15 May 2026 10:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778839589;
	bh=y1ZPuop+1B62rdlawvTAPZcWGa3CVURVrIR4ZOf++Fg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SQvHOHeqIt/sLIOnr28V+wmEMw+ZGCleqJ37PR5fD4ZeGRLTg/xKYnVnSmgc02JtL
	 JUWu+UiZcMFkqIH5QMGYJWWSypd8rFWZ97syFIdp/X+7RZC+Z2qXZM+/CXiZFbwmmM
	 tr+SUUdAtCm/JQQV2CpeamG5et+cto1G1h/d08pe3l9yKu88VY9MoVw3v0khjrjCxw
	 zlRoqxPdJ6ioJfoSOX7qinAW/Mgftm5lp4JEANPLWMWg63GuFN+6HCX/Bl4RCqsysD
	 Hp+6JiAJZV/cO/v5TCTsi0CMcFMCszApXp943fw8Xh5SC5YeiqFdtcfB0EIKehCn9M
	 KrrV7YXKLnUbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: add support for PAC194X
Reply-To: sashiko-reviews@lists.linux.dev
To: marius.cristea@microchip.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260515092946.10791-3-marius.cristea@microchip.com>
References: <20260515092946.10791-3-marius.cristea@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 10:06:22 +0000
Message-Id: <20260515100628.A4213C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [High] Makefile typo prevents driver compilation.
- [High] Unvalidated shunt resistor allows divide-by-zero kernel panic.
- [High] Missing type check on ACPI object returned by `acpi_evaluate_dsm`.
- [High] Incomplete check of `i2c_transfer` return value leads to uninitial=
ized memory use.
- [High] Register parsing misalignment when channels are disabled.
- [High] TOCTOU race in `pac1944_retrieve_data()` causes data loss.
- [High] Unprotected lockless reads of shared state cause data corruption a=
nd torn reads.
- [High] Unconditional re-arming of delayed work causes Use-After-Free.
- [High] Passing stack memory to `i2c_transfer()` violates DMA mapping rule=
s.
- [High] Accumulator saturation applies in the wrong direction upon overflo=
w.
- [Medium] Power scale calculation overflows 32-bit signed integers.
- [Medium] ACPI package object leaked on error paths during probe.
--

commit f9f3f02e24d9b1eec599682a12c6ee4c2e8e0b5f
Author: Marius Cristea <marius.cristea@microchip.com>
Subject: iio: adc: add support for PAC194X

This commit adds the IIO driver for the Microchip PAC194X and PAC195X series
of Power Monitors. It supports multiple voltage and current channels.

> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index 097357d146baf..0e1cc47b68a13 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -113,6 +113,7 @@ obj-$(CONFIG_NPCM_ADC) +=3D npcm_adc.o
>  obj-$(CONFIG_NXP_SAR_ADC) +=3D nxp-sar-adc.o
>  obj-$(CONFIG_PAC1921) +=3D pac1921.o
>  obj-$(CONFIG_PAC1934) +=3D pac1934.o
> +obj-$(CONFIG_PAC1934) +=3D pac1944.o

This isn't a bug, but there is a typo in the config name. Should this be
CONFIG_PAC1944?

>  obj-$(CONFIG_PALMAS_GPADC) +=3D palmas_gpadc.o

[ ... ]

> diff --git a/drivers/iio/adc/pac1944.c b/drivers/iio/adc/pac1944.c
> new file mode 100644
> index 0000000000000..3938bbcd7e6bc
> --- /dev/null
> +++ b/drivers/iio/adc/pac1944.c

[ ... ]

> +static int pac1944_i2c_read(struct i2c_client *client, u8 reg_addr,
> +			    void *databuf, u8 len)
> +{
> +	struct i2c_msg msgs[2] =3D {
> +		{
> +		 .addr =3D client->addr,
> +		 .len =3D 1,
> +		 .buf =3D (u8 *)&reg_addr,

Can this cause a panic when CONFIG_VMAP_STACK is enabled?

Since reg_addr is on the stack, it might not be DMA-safe for I2C host
controllers that use DMA. Should this be placed in a bounce buffer?

> +		 .flags =3D 0
> +		},

[ ... ]

> +static ssize_t pac1944_shunt_value_store(struct device *dev,
> +					 struct device_attribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct iio_dev_attr *this_attr =3D to_iio_dev_attr(attr);
> +	struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
> +	struct pac1944_chip_info *info =3D iio_priv(indio_dev);
> +	int sh_val;
> +
> +	if (kstrtouint(buf, 10, &sh_val)) {
> +		dev_err(dev, "Shunt value is not valid\n");
> +		return -EINVAL;
> +	}
> +
> +	scoped_guard(mutex, &info->lock)
> +		info->shunts[this_attr->address] =3D sh_val;

Does this allow writing a value of 0?

If info->shunts[idx] is set to 0, will the division operations in
pac1944_in_power_acc_scale_show() and pac1944_read_raw() trigger a
divide-by-zero hardware exception?

> +
> +	return count;
> +}

[ ... ]

> +static int pac1944_reg_snapshot(struct pac1944_chip_info *info, bool do_=
refresh,
> +				u8 refresh_addr, u32 wait_time)
> +{

[ ... ]

> +	/* Read the data registers. */
> +	ret =3D pac1944_i2c_read(client, PAC1944_ACC_COUNT_REG_ADDR,
> +			       (u8 *)info->chip_reg_data.meas_regs,
> +			       PAC1944_MEAS_REG_SNAPSHOT_LEN);
> +	if (ret < 0) {

What happens if i2c_transfer() executes only the first message and returns =
1?

The condition ret < 0 will pass, but the meas_regs buffer might remain
uninitialized. Should this check that ret equals the number of messages
instead?

> +		dev_err(dev, "cannot read PAC1944 regs from 0x%02X\n", PAC1944_ACC_COU=
NT_REG_ADDR);
> +		return ret;
> +	}
> +
> +	offset_reg_data_p =3D &info->chip_reg_data.meas_regs[0];
> +
> +	info->chip_reg_data.acc_count =3D get_unaligned_be32(offset_reg_data_p);
> +
> +	offset_reg_data_p +=3D PAC1944_ACC_REG_LEN;
> +
> +	/*
> +	 * Check if the channel is active (within the data read from the chip),
> +	 * skip all fields if disabled.
> +	 */
> +	for_each_set_bit(cnt, &info->active_channels_mask, info->phys_channels)=
 {
> +		/* skip if the energy accumulation is disabled */
> +		if (!info->enable_acc[cnt]) {
> +			offset_reg_data_p +=3D PAC1944_VACC_REG_LEN;
> +			continue;
> +		}

If a channel is entirely inactive (its bit is not set in active_channels_ma=
sk),
the loop skips it completely.

Will this fail to advance offset_reg_data_p past the inactive channel's fix=
ed
slot in the buffer, causing subsequent reads to be structurally misaligned?

> +
> +		stored_value =3D info->chip_reg_data.acc_val[cnt];

[ ... ]

> +		if (smpl_mode <=3D PAC1944_SAMP_8SPS) {
> +			tmp_s64 =3D info->chip_reg_data.vacc[cnt];
> +			/*
> +			 * Find how much shift is required by the sample rate.
> +			 * The chip's sampling rate is 2^shift samples/sec.
> +			 */
> +			shift =3D shift_map_tbl[smpl_mode];
> +			inc =3D tmp_s64 >> shift;
> +		} else {
> +			dev_err(dev, "Invalid sample rate index: %d!\n", smpl_mode);
> +			return -EINVAL;
> +		}
> +
> +		if (check_add_overflow(stored_value, inc, &stored_value)) {
> +			if (stored_value < 0)
> +				info->chip_reg_data.acc_val[cnt] =3D S64_MIN;
> +			else
> +				info->chip_reg_data.acc_val[cnt] =3D S64_MAX;

Does this clamp in the wrong direction?

When two large positive values overflow, check_add_overflow() places the
wrapped negative result into stored_value.

Will the condition stored_value < 0 evaluate to true and clamp the positive
overflow to S64_MIN instead of S64_MAX?

> +
> +			dev_err(dev, "Overflow detected on channel [%d]!\n", cnt + 1);
> +		} else {

[ ... ]

> +static int pac1944_retrieve_data(struct pac1944_chip_info *info, u32 wai=
t_time)
> +{
> +	int ret;
> +
> +	/*
> +	 * Check if the minimal elapsed time has passed and if so,
> +	 * re-read the chip, otherwise the cached info is just fine.
> +	 */
> +	if (!time_after(jiffies, info->chip_reg_data.jiffies_tstamp +
> +		       msecs_to_jiffies(PAC1944_MIN_POLLING_TIME_MS)))
> +		return 0;
> +
> +	/* We need to re-read the chip values */
> +	ret =3D pac1944_reg_snapshot(info, true, PAC1944_REFRESH_REG_ADDR, wait=
_time);

Is there a race condition here if multiple threads read sysfs concurrently?

If the cache is stale, both threads could pass the time_after() check
locklessly, serialize on the lock in pac1944_reg_snapshot(), and issue
sequential REFRESH commands.

Since REFRESH resets the chip accumulators, will the second thread wipe out
the data and read near-zero values? Should the expiration check be
re-evaluated inside the mutex lock?

> +
> +	/*

[ ... ]

> +static int pac1944_read_raw(struct iio_dev *indio_dev, struct iio_chan_s=
pec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct pac1944_chip_info *info =3D iio_priv(indio_dev);
> +	int ret, idx;
> +	u64 tmp;
> +
> +	ret =3D pac1944_retrieve_data(info, PAC1944_MIN_UPDATE_WAIT_TIME_US);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * In the datasheet channels are referred to as 1 to 4. For AVG the ind=
ex
> +	 * should be between 5 to 8. To calculate PAC1944_CH_VOLTAGE_AVERAGE and
> +	 * PAC1944_CH_CURRENT_AVERAGE real index, we need to remove the added
> +	 * offset (PAC1944_MAX_CH).
> +	 */
> +	idx =3D (chan->channel - 1) % PAC1944_MAX_CH;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		switch (chan->type) {
> +		case IIO_VOLTAGE:
> +			*val =3D info->chip_reg_data.vbus[idx];

Could this result in torn reads or corrupted data?

The fields in info->chip_reg_data are read locklessly if the cache is deemed
fresh.

At the same time, pac1944_work_periodic_rfsh() can execute
pac1944_reg_snapshot() and modify these fields under info->lock. Could a
reader capture an intermediate state?

> +			return IIO_VAL_INT;

[ ... ]

> +		case PAC1944_VPOWER_1_ADDR:
> +		case PAC1944_VPOWER_2_ADDR:
> +		case PAC1944_VPOWER_3_ADDR:
> +		case PAC1944_VPOWER_4_ADDR:
> +			if (info->is_pac195x_family)
> +				tmp =3D PAC195X_PRODUCT_VOLTAGE_PV_FSR;
> +			else
> +				tmp =3D PAC194X_PRODUCT_VOLTAGE_PV_FSR;
> +
> +			do_div(tmp, info->shunts[idx]);
> +			*val =3D (int)tmp;

Can this overflow the 32-bit signed integer?

For a typical 1 mOhm shunt, PAC195X_PRODUCT_VOLTAGE_PV_FSR (3.2 trillion)
divided by 1000 is 3.2 billion, which exceeds the maximum value of a
signed 32-bit integer. Will this expose a negative scale to userspace?

> +			if ((info->chip_reg_data.vbus_mode[idx] =3D=3D PAC1944_UNIPOLAR_FSR_C=
FG &&

[ ... ]

> +static void pac1944_work_periodic_rfsh(struct work_struct *work)
> +{
> +	struct pac1944_chip_info *info =3D to_pac1944_chip_info(to_delayed_work=
(work));
> +	struct i2c_client *client =3D info->client;
> +
> +	dev_dbg(&client->dev, "Periodic refresh\n");
> +
> +	pac1944_reg_snapshot(info, true, PAC1944_REFRESH_REG_ADDR,
> +			     PAC1944_MIN_UPDATE_WAIT_TIME_US);
> +
> +	mod_delayed_work(system_percpu_wq, &info->work_chip_rfsh,
> +			 msecs_to_jiffies(PAC1944_MAX_RFSH_LIMIT_MS));
> +}

Can this re-arm the work after the device is unbound?

The driver uses devm_add_action_or_reset() to call cancel_delayed_work_sync=
(),
but if that runs concurrently with this periodic refresh, could
mod_delayed_work() schedule the work again on freed memory?

> +
> +/*
> + * Universal Unique Identifier (UUID),

[ ... ]

> +static int pac1944_acpi_parse_channel_config(struct i2c_client *client,
> +					     struct pac1944_chip_info *info)
> +{
> +	struct device *dev =3D &client->dev;
> +	const struct acpi_device_id *id;
> +	unsigned short bi_dir_mask;
> +	union acpi_object *rez;
> +	acpi_handle handle;
> +	guid_t guid;
> +	int i;
> +
> +	handle =3D ACPI_HANDLE(dev);
> +
> +	id =3D acpi_match_device(dev->driver->acpi_match_table, dev);
> +	if (!id)
> +		return -ENODEV;
> +
> +	guid_parse(PAC1944_DSM_UUID, &guid);
> +
> +	rez =3D acpi_evaluate_dsm(handle, &guid, 0, PAC1944_ACPI_GET_NAMES, NUL=
L);
> +	if (!rez)
> +		return -EINVAL;
> +
> +	if (rez->package.count > PAC1944_MAX_CH) {

What happens if a buggy firmware returns an ACPI_TYPE_INTEGER instead of
ACPI_TYPE_PACKAGE?

The code directly accesses rez->package.count without verifying
rez->type =3D=3D ACPI_TYPE_PACKAGE. Could this read overlapping union membe=
rs and
cause an out-of-bounds dereference?

> +		ACPI_FREE(rez);
> +		return -EINVAL;
> +	}

[ ... ]

> +	for_each_set_bit(i, &info->active_channels_mask, info->phys_channels) {
> +		if (rez->package.elements[i].type !=3D ACPI_TYPE_INTEGER) {
> +			ACPI_FREE(rez);
> +			return -EINVAL;
> +		}
> +
> +		bi_dir_mask =3D rez->package.elements[i].integer.value;
> +
> +		if (bi_dir_mask =3D=3D PAC1944_UNIPOLAR_FSR_CFG ||
> +		    bi_dir_mask =3D=3D PAC1944_BIPOLAR_FSR_CFG  ||
> +		    bi_dir_mask =3D=3D PAC1944_BIPOLAR_HALF_FSR_CFG) {
> +			dev_dbg(dev, "VBUS{%d} mode set to: %d\n", i, bi_dir_mask);
> +			info->chip_reg_data.vbus_mode[i] =3D bi_dir_mask;
> +		} else {
> +			return dev_err_probe(dev, -EINVAL, "invalid vbus-mode value on %i\n",=
 i);
> +		}

Does this leak the memory for the rez object?

It looks like ACPI_FREE(rez) is bypassed when returning an error here.

> +
> +		if (rez->package.elements[i + PAC1944_MAX_CH].type !=3D ACPI_TYPE_INTE=
GER) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515092946.1079=
1-1-marius.cristea@microchip.com?part=3D2
