Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06BD37AA99
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 23:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781305869; cv=none; b=Fho3f4DpMG57jtTtRbOM5GweoTw1XEiObobkH6QsOmqpiEilgSW7ClSOAGhl3Z7ypb8D9HG8O00Dq2PhXqMZpY+uLDSbRnvZoQY9SgDxYvDsW4zjg+4kITQ7zwUcpC+s6UMt7O+97x3NJtCyNZIZpYjuAvg0ZUd0jLKmqvUs1Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781305869; c=relaxed/simple;
	bh=TmxanlmAhQ2wak4/ggYe7hWH31WEYAUPCannq5yYL5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gSdzMK/0b/lu7RGXO9utxy7Ja9z0bFmyI+J0ih7U/YAzAYhyPMZfmNSDgD6PsOjYgVkuaXirWHuUVYgUTMbieyD8lX7kMR6NeypPu/MvsT1z4z51BLlAjsbSs4EWYgbXP+4m8IoL1F5sZImxS5CuH8YNCGFBO0P5gK4A/M6/QH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hv0Gdsku; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hv0Gdsku"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9BF1F000E9;
	Fri, 12 Jun 2026 23:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781305867;
	bh=1sRBxVu/0FAZzpMkFsaNdSZls6BbSOsEMXpfvyrKNyc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hv0Gdskur9EwDpXUEXT3AZqMBnm0obDgXTQKtuPOOFBF55bO3rhxSBUaZHAVU2HdT
	 gG1+778acj/cbVbLADml46dtBx1yzm8X9Q3KtvfFjU8AxA7M4hj9IR93XIPHODZm22
	 3+qEhZc1LGZ4i5+UwRAeR4MJaOdzIsZXjtyHNfOb/lHUlPpdAuxdid1s+ZqSoD5Lu8
	 naVwNaDJSg2vZjabwj8aqfBF4JCQ4YjF40wURk488BQA0i+J4mOuPikcq7p4yb3q1O
	 yAy8FcrRlWJ+Ha6dtn6ENfGPEcMl3vYaZZNpx0nDxhtEMfbDIw01jU4zIdA87ZyZXe
	 r1LeAoUVlETeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] iio: adc: Add ti-ads1263-adc2 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260612-ads126x-v1-5-894c788d03ed@gmail.com>
References: <20260612-ads126x-v1-5-894c788d03ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 23:11:06 +0000
Message-Id: <20260612231107.3F9BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Probe silently succeeds with corrupted state when `ti,refmux` prop=
erty is out of bounds.
- [High] Unportable C bitfields used for hardware registers break big-endia=
n architectures.
- [High] Missing `select AUXILIARY_BUS` in Kconfig causes a build failure.
- [High] Heap out-of-bounds access if only the timestamp channel is enabled=
 in buffer mode.
- [Medium] Dead code in `ads1263_adc2_write_raw()` silently prevents hardwa=
re updates on the fly (hot reload).
- [Medium] Permanent `fwnode_handle` resource leak on the error path of `ad=
s1262_aux_device_setup()`.
- [Low] Semantic API misuse: releasing direct mode lock instead of buffer m=
ode lock.
--

commit 6e165e44885d4dd5616f87d79875344d0f1cd3cb
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: Add ti-ads1263-adc2 driver

The TI ADS1263 includes an auxiliary, 24-bit, delta-sigma ADC (ADC2) which
operates independently of ADC1. This patch adds support for ADC2 as an
independent IIO device using the auxiliary bus API.

> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1809,6 +1809,19 @@ config TI_ADS1262
>  	  This driver can also be built as a module. If so, the module will be
>  	  called ti-ads1262.
> =20
> +config TI_ADS1263_ADC2
> +	tristate "Texas Instruments ADS1263 auxiliary ADC (ADC2) driver"
> +	depends on TI_ADS1262
> +	select AUXILIARY_BUS

[Severity: High]
Since ti-ads1262.c unconditionally calls auxiliary bus APIs like
auxiliary_device_init(), does config TI_ADS1262 also need to
select AUXILIARY_BUS?=20

If CONFIG_TI_ADS1262=3Dy and CONFIG_TI_ADS1263_ADC2=3Dn, the auxiliary bus =
code
won't be compiled, which could result in undefined reference linker errors
when building the main driver.

[ ... ]
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads1262.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Texas Instruments ADS1262 ADC driver
> + *
> + * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
> + */
> +
> +#ifndef _ADS1262_H_
> +#define _ADS1262_H_
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/types.h>
> +
> +struct ads1263_adc2_channel {
> +	/* ADC2CFG */
> +	u8 gain:3;
> +	u8 refmux:3;
> +	u8 data_rate:2;
> +
> +	/* ADC2MUX */
> +	u8 negative_input:4;
> +	u8 positive_input:4;
> +};

[Severity: High]
Will this structure layout cause issues on big-endian architectures?=20

The memory layout of C bitfields is implementation-defined, and this
structure appears to be written directly to the SPI hardware using
regmap_bulk_write() in ads1263_adc2_enable(). On big-endian systems, the
bits could be packed in reverse order and write invalid configuration data.

[ ... ]
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c
[ ... ]
> +static int ads1262_aux_device_setup(struct ads1262 *st)
> +{
[ ... ]
> +	adev->dev.parent =3D dev;
> +	device_set_node(&adev->dev, no_free_ptr(node));
> +
> +	ret =3D auxiliary_device_init(adev);
> +	if (ret)
> +		goto out_free_channels;
> +
> +	ret =3D auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, ads1262_aux_device_destroy, adev);
> +
> +out_free_channels:
> +	kfree(chans);
> +out_free_id:
> +	ida_free(&ads1262_ida, id);
> +out_free_adc2:
> +	kfree(ctx);
> +out_node_put:
> +	fwnode_handle_put(node);

[Severity: Medium]
Does this error path leak the fwnode reference?=20

When device_set_node() is called above, no_free_ptr(node) unconditionally
sets the local node pointer to NULL. If auxiliary_device_init() later fails,
jumping to out_node_put will call fwnode_handle_put(NULL). This becomes a
no-op, leaving the reference permanently leaked.

[ ... ]
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads1263-adc2.c
[ ... ]
> +static int ads1263_adc2_channel_hot_reload(struct ads1263_adc2 *st,
> +					   const struct iio_chan_spec *chan)
> +{
> +	struct ads1263_adc2_ctx *ctx =3D st->ctx;
> +	unsigned long i;
> +	int ret;
> +
> +	/* Hot reloading is only required on buffer mode */
> +	if (!iio_device_try_claim_buffer_mode(st->indio_dev))
> +		return 0;
> +
> +	i =3D find_first_bit(st->indio_dev->active_scan_mask,
> +			   iio_get_masklength(st->indio_dev));
> +	if (i !=3D chan->scan_index) {
> +		iio_device_release_direct(st->indio_dev);

[Severity: Low]
Should this use iio_device_release_buffer_mode() instead of
iio_device_release_direct()?=20

While both macros currently expand to the same internal unlock function,
this breaks the IIO API contract which expects symmetric lock and unlock
function pairs.

> +		return 0;
> +	}
[ ... ]
> +static int ads1263_adc2_write_raw(struct iio_dev *indio_dev,
> +				  struct iio_chan_spec const *chan,
> +				  int val, int val2, long mask)
> +{
[ ... ]
> +	switch (mask) {
> +	case IIO_CHAN_INFO_HARDWAREGAIN:
> +		for (i =3D 0; i < ARRAY_SIZE(ads1263_adc2_gain_avail); i++) {
> +			if (val =3D=3D ads1263_adc2_gain_avail[i])
> +				break;
> +		}
> +		if (i =3D=3D ARRAY_SIZE(ads1263_adc2_gain_avail))
> +			return -EINVAL;
> +
> +		mutex_lock(&ctx->chan_lock);
> +		chan_data->gain =3D i;
> +		mutex_unlock(&ctx->chan_lock);
> +
> +		return 0;

[Severity: Medium]
Will ads1263_adc2_channel_hot_reload() at the end of this function ever be
reached?=20

Both the IIO_CHAN_INFO_HARDWAREGAIN and IIO_CHAN_INFO_SAMP_FREQ cases use
a return 0 instead of break after updating the software state. This causes
the function to exit immediately, which silently prevents hardware updates
during an active buffer mode.

> +
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		for (i =3D 0; i < ARRAY_SIZE(ads1263_adc2_data_rate_avail); i++) {
> +			if (val =3D=3D ads1263_adc2_data_rate_avail[i])
> +				break;
> +		}
> +		if (i =3D=3D ARRAY_SIZE(ads1263_adc2_data_rate_avail))
> +			return -EINVAL;
> +
> +		mutex_lock(&ctx->chan_lock);
> +		chan_data->data_rate =3D i;
> +		mutex_unlock(&ctx->chan_lock);
> +
> +		return 0;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return ads1263_adc2_channel_hot_reload(st, chan);
> +}
[ ... ]
> +static int ads1263_adc2_buffer_preenable(struct iio_dev *indio_dev)
> +{
> +	struct ads1263_adc2 *st =3D iio_priv(indio_dev);
> +	struct ads1263_adc2_ctx *ctx =3D st->ctx;
> +	struct device *dev =3D &ctx->adev.dev;
> +	unsigned long i;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev->parent);
> +	if (ret)
> +		return ret;
> +
> +	i =3D find_first_bit(indio_dev->active_scan_mask,
> +			   iio_get_masklength(indio_dev));
> +	ret =3D ctx->enable(ctx, &ctx->channels[i]);

[Severity: High]
Is there a potential out-of-bounds array access here if only the timestamp
channel is enabled?

The iio_validate_scan_mask_onehot function allows a single channel to be
active. If the user only enables the timestamp channel, find_first_bit()
will return the timestamp channel's index, which is ctx->num_channels.

Since ctx->channels is allocated with exactly num_channels elements, access=
ing
ctx->channels[num_channels] reads out-of-bounds memory and passes that
data to the hardware via ctx->enable().

> +	if (ret)
> +		goto out_runtime_autosuspend;
> +
> +	ret =3D ctx->start(ctx);
> +	if (ret)
> +		goto out_runtime_autosuspend;
> +
> +	return 0;
[ ... ]
> +static int ads1263_adc2_regulator_setup(struct ads1263_adc2 *st)
> +{
> +	struct device *dev =3D &st->ctx->adev.dev;
> +	const char *reg_id, *propname;
> +	u32 refmux =3D 0;
> +	int ret;
> +
> +	propname =3D "ti,refmux";
> +	ret =3D device_property_read_u32(dev, propname, &refmux);
> +	if (refmux >=3D ADS1263_ADC2_REF2_COUNT)
> +		return dev_err_probe(dev, ret, "%s out of range\n", propname);

[Severity: High]
Does this silently succeed on failure?=20

If the ti,refmux value exceeds ADS1263_ADC2_REF2_COUNT, the preceding
device_property_read_u32() was successful, meaning ret is 0.=20

Because ret is 0, dev_err_probe() will return 0, causing the probe to
incorrectly succeed with an uninitialized vref_uV value. This could lead
to a divide-by-zero during scale calculations.

> +	st->refmux =3D refmux;
> +
> +	if (refmux =3D=3D ADS1263_ADC2_REF2_INTER) {
> +		/* The internal voltage reference is 2.5 V */
> +		st->vref_uV =3D 2500000;
> +		return 0;
> +	}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-ads126x-v1=
-0-894c788d03ed@gmail.com?part=3D5
