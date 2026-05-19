Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACFFE54B
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207777; cv=none; b=Yi5izR1cYo7gn0yr3gcZe4bL6zsN0HmikruIqrOJ0266zIpjnNeigJUGfchpg/1h2gmQvcA2IGzvfp3sy8SafIcHbkXsorNkKES0OyVFT+u4v+Mx96GxzHoFxodrNRuiz3KFCdZVMt7n0Jum1i3h9IP8unXG3Nk0PDIKgByXXXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207777; c=relaxed/simple;
	bh=LMyDmmkrMgNOf2F3debjRZzx3Nm/K/IxVx7tNXZ0+DE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uehR7fLk9jx3JQxh1ZyzTawzgtHdOUUNTdG6v6uMuGTW+Hr7H++deEvoWtKSpFoxQ8Tb1zAnsmLKKN4wH/jXcYAtK4LC6HFKUlocz7JWtR2+AYXvrW+2AB104huY/xh1GIRu0X5QY5YBC2+XBXOuCT5U/I6v5KKdTczutJrj1eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cR73ryAV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cR73ryAV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E92C2BCB8;
	Tue, 19 May 2026 16:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779207776;
	bh=LMyDmmkrMgNOf2F3debjRZzx3Nm/K/IxVx7tNXZ0+DE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cR73ryAVdC+WDu4DuwW7fwNp7g8JA4FEx/ftkRozaFSiY+DVreWsDwdYf3aka6QI/
	 kiNBQon+RVaI4NVc6/HFa9SFVHYVMbAJhs+u1PiYtks9HWTtgequvTocCiX/AgLtRr
	 JZvKOO7lzfm50r1cePvdRb9E+FTL1H+nWOmKlgdttMqxgyEa80nc8FuEN1GExrz8mM
	 giq5BeIP6fOqiX6Qz/uvHXXK2mz1xSxdlTracQmSf2PZnrXMQythgEQv1TxgVaSuO5
	 Gzd1PcYURYVxqEoDYjM1idFd0FH7Q0NkxFl1aw+Y5TJsrtTH/JPPsxBGmv52FFVj9z
	 +clte+q4GGNpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] iio: dac: Add AD5529R DAC driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260519-ad5529r-driver-v3-2-267c0731aa68@analog.com>
References: <20260519-ad5529r-driver-v3-2-267c0731aa68@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 16:22:55 +0000
Message-Id: <20260519162256.35E92C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Incorrect error handling for the optional 'hvss' regulator causes =
probe failure when it is absent.
- [High] A signedness error during the parsing of the 'reg' property allows=
 an out-of-bounds array write using a negative channel index.
- [High] Incomplete hardware reset sequence fails to guarantee a known devi=
ce state.
- [Medium] The driver allows an external voltage reference to be provided b=
ut fails to read its voltage to dynamically scale the output ranges.
- [Medium] Reading raw DAC values from the write-only input register instea=
d of the dedicated readback registers.
- [Low] Passing incompatible pointer types to `fwnode_property_read_u32` fu=
nctions causes compiler warnings/errors.
- [Low] The `scan_type` struct inside `struct iio_chan_spec` is initialized=
 with a non-existent member `.format`, causing a build failure.
--

commit c4b761222e21c0ab2352b5405104edc721f22ee1
Author: Janani Sunil <janani.sunil@analog.com>
Subject: iio: dac: Add AD5529R DAC driver support

Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter

> diff --git a/drivers/iio/dac/ad5529r.c b/drivers/iio/dac/ad5529r.c
> new file mode 100644
> index 0000000000000..9bb63030db952
> --- /dev/null
> +++ b/drivers/iio/dac/ad5529r.c
> @@ -0,0 +1,527 @@
[ ... ]
> +#define AD5529R_DAC_CHANNEL(chan, bits) {			\
> +	.type =3D IIO_VOLTAGE,					\
> +	.indexed =3D 1,						\
> +	.output =3D 1,						\
> +	.channel =3D (chan),					\
> +	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |		\
> +			      BIT(IIO_CHAN_INFO_SCALE) |	\
> +			      BIT(IIO_CHAN_INFO_OFFSET),	\
> +	.scan_type =3D {						\
> +		.format =3D 'u',					\

[Severity: Low]
Is this member name correct? struct iio_scan_type (defined in=20
include/linux/iio/types.h) does not have a member named format. It appears
the correct member name is sign.

Will attempting to compile this code result in a compiler error about
the struct having no member named format?

> +		.realbits =3D (bits),				\
> +		.storagebits =3D 16,				\
> +	},							\
> +}
[ ... ]
> +static int ad5529r_reset(struct ad5529r_state *st)
> +{
> +	struct reset_control *rst;
> +	int ret;
> +
> +	rst =3D devm_reset_control_get_optional_exclusive(&st->spi->dev, NULL);
> +	if (IS_ERR(rst))
> +		return PTR_ERR(rst);
> +
> +	if (rst) {
> +		ret =3D reset_control_deassert(rst);

[Severity: High]
Does this sequence guarantee a hardware reset?

Since the driver calls reset_control_deassert(rst) without first asserting
the reset line, if the device was already out of reset (e.g., left running
by the bootloader or after a warm reboot), deasserting an already deasserted
line might do nothing.

Would using reset_control_reset(rst) ensure the device receives a reset edg=
e?

> +		if (ret)
> +			return ret;
> +	} else {
[ ... ]
> +static int ad5529r_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct ad5529r_state *st =3D iio_priv(indio_dev);
> +	unsigned int reg_addr, reg_val_h;
> +	int ret, range_idx, span_mv;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		reg_addr =3D AD5529R_REG_DAC_INPUT_A(chan->channel);

[Severity: Medium]
Is it intentional to read back from the input register AD5529R_REG_DAC_INPU=
T_A?

The driver explicitly defines a dedicated range of registers for reading ba=
ck
DAC data starting at AD5529R_REG_DAC_DATA_READBACK_BASE, which are marked as
read-only in the regmap configuration.

Could reading from the input register instead of the readback register retu=
rn
zeroes or stale data depending on the hardware latching mechanism?

> +		ret =3D regmap_read(st->regmap_16bit, reg_addr, &reg_val_h);
> +		if (ret)
> +			return ret;
[ ... ]
> +static int ad5529r_parse_channel_ranges(struct device *dev,
> +					struct ad5529r_state *st)
> +{
> +	int ret, ch, range_idx;
> +	s32 vals[2];
> +
> +	device_for_each_child_node_scoped(dev, child) {
> +		range_idx =3D AD5529R_RANGE_0V_5V;
> +
> +		ret =3D fwnode_property_read_u32(child, "reg", &ch);

[Severity: Low]
Will passing the address of an int to fwnode_property_read_u32() cause
incompatible pointer type warnings? fwnode_property_read_u32() expects
a u32 *.

[Severity: High]
Could passing the address of the signed int ch to fwnode_property_read_u32()
allow an out-of-bounds array write?

If the device tree provides a reg value with the most significant bit set
(e.g., 0x80000000), it would be written as an unsigned 32-bit integer but
interpreted as a negative value by the signed integer ch.

The subsequent bounds check:

    if (ch >=3D 16)

would evaluate to false for negative values, allowing the check to be bypas=
sed.
The driver would then write to st->output_range_idx[ch] using a negative in=
dex.

> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Missing reg property in channel node\n");
> +
> +		if (ch >=3D 16)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid channel number: %d\n", ch);
> +
> +		if (!fwnode_property_read_u32_array(child,
> +						    "adi,output-range-microvolt",
> +						    vals, 2)) {

[Severity: Low]
Will passing an array of s32 vals to fwnode_property_read_u32_array() cause
incompatible pointer type warnings? It expects a u32 *.

> +			range_idx =3D ad5529r_find_output_range(vals);
> +			if (range_idx < 0)
> +				return dev_err_probe(dev, range_idx,
> +						     "Invalid range [%d %d] for ch %d\n",
> +						     vals[0], vals[1], ch);
> +		}
> +
> +		st->output_range_idx[ch] =3D range_idx;
[ ... ]
> +static int ad5529r_probe(struct spi_device *spi)
> +{
[ ... ]
> +	ret =3D devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(ad5529r_supply_n=
ames),
> +					     ad5529r_supply_names);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get and enable regulators\n");
> +
> +	ret =3D devm_regulator_get_enable_optional(dev, "hvss");
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get and enable hvss regulator\n");

[Severity: High]
Does this error handling prevent the driver from probing when the optional
hvss regulator is absent?

devm_regulator_get_enable_optional() returns -ENODEV if the optional regula=
tor
is not provided in the device tree. Because the code checks if (ret) without
ignoring -ENODEV, this causes dev_err_probe() to return -ENODEV and fail
the probe entirely, effectively making the optional regulator mandatory.

> +
> +	st->vref_regulator =3D devm_regulator_get_optional(dev, "vref");
> +	if (IS_ERR(st->vref_regulator)) {
> +		if (PTR_ERR(st->vref_regulator) !=3D -ENODEV)
> +			return dev_err_probe(dev, PTR_ERR(st->vref_regulator),
> +					     "Failed to get vref regulator\n");
> +		st->vref_regulator =3D NULL;
> +	}
> +
> +	if (st->vref_regulator) {
> +		ret =3D regulator_enable(st->vref_regulator);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to enable vref regulator\n");
> +
> +		ret =3D devm_add_action_or_reset(dev, ad5529r_disable_regulator,
> +					       st->vref_regulator);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to add vref regulator cleanup\n");
> +	}

[Severity: Medium]
If an external voltage reference is provided, should the driver query its
voltage to dynamically scale the output ranges?

The driver requests the optional vref regulator and configures the hardware
to use it instead of the internal 4.096V reference, but it doesn't seem to
read the actual voltage of the external reference.

The IIO output scale calculations in ad5529r_read_raw() appear to hardcode
the spans based on standard ranges that assume the nominal internal 4.096V
reference. If an external reference has a different voltage, will the repor=
ted
IIO scale be mathematically incorrect?

> +
> +	st->regmap_8bit =3D devm_regmap_init_spi(spi, &ad5529r_regmap_8bit_conf=
ig);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-ad5529r-dr=
iver-v3-0-267c0731aa68@analog.com?part=3D2
