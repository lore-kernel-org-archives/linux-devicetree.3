Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917AE377EAF
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125399; cv=none; b=Y08gQLgc/wfO4sN2X5jvRsz1x7oE6BhBAKz9AJI72oPWnPEmhXqQb4XSpyBVsArlnJetDZBYswFdio5WwWzjrDEh5WT9c1vrcmyOQ8LALbXoEA+rfShjz/KVUxOhpFyDRF5eSyvk9OJbTKZm9sGj5mTr+qpJrb58MwfERVRvLzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125399; c=relaxed/simple;
	bh=wy+44zk0VebC9liwP0ADDC4UaI6nEi5ixliUR9jtwdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptKPq31e31Au39dptPbfP+9RHxfl2sPfmYnm550SBDbS092+G11/unq4suUiP9IjnEhI+492lou/3JeXin4HsxdTcXtA9xCA0WTKH23f3sdAaKwsePgPlJcZ//Llg0BqbPVFrt3GLDREIShY5HKJX6VllFDbQ7CizgplQZn28vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0zlaj6s; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0zlaj6s"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1614804757so570613266b.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784125395; x=1784730195; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UByyiWo4FmgJmVhmTFReM0qGRNBTRRz7YX9ql4MTB2U=;
        b=F0zlaj6s/4AvN/itr/xcrUzoOUPup4GCPyWX81c4y1MMlNW52kGukt1eu4ULy5xJDP
         xDngUoCw2USWMne/7aaC86iEs48C3ZBN9zG8WYLDTVtfY1Cnj3FcdqMq8hTwr31I7y8/
         cKA1NM+YnHzGJExyQnDpe47gWxahqDO/DwL8IEfQgpIlDL+QT9WZZhuknxzNQPhyPGU9
         dAa19JPF0KwufSDaoGg79w49TFQ07jambKrbuchoS+9FlFgWVniY+gA0/pJhf0qubLap
         ybFnwpPUmnTNCHXQNYcqKmiPnQIARy17tJKoA/BhfUnJJX0KWGuOhaI2AmoqdCgxsINc
         xdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784125395; x=1784730195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UByyiWo4FmgJmVhmTFReM0qGRNBTRRz7YX9ql4MTB2U=;
        b=OpEyNYYh3LkV0wP+JJHIdsLzIDXauLuavK9ibFT6+7MOEiwMwXIBFUZjkO3i7YvD/b
         tNlyNRBFQge4LPwAZimLbIw0LL70/D79i6HQ4N0r1xjAMMbf/XH/A9hXGXWTdm5CVUq8
         eudjzysdFMT65bgeYi6d5J9EOAqr9K4HSr3s1wrrjlbOXw7FWF8i1sx3u+OVYKnFANpI
         BwzSJOLuGvr6Vb8Hsppswsj0rU+wwzQ4AVvPZ9mxbgoq1OT0AhULmIJEM7GKrFMWAqhX
         rsjOfKVrLylMirtH+GAwulI+xq5Evn8B2mO4EPQ//dFCJR7sqAtpk9HLRoLYpsvyou9v
         MYHg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4HP9a+BF27Hffu31TBkVswAyx/q/RcyaLllRJ7Thv8ZaAwUNoskmKsJ4VDb/GX+M2USTf0GJvS4WY@vger.kernel.org
X-Gm-Message-State: AOJu0YzqnItdctVFdpRgKI1Ue71ckymVNTMzbgnDCWCUTiJQqww5Jn3N
	+z1lmsy/nystLslI/VuJywG/PcnICB4B6ZdbFq89jnc6wJ2mpfMwVpjj
X-Gm-Gg: AfdE7ckD9tHWRs+kZlrN3rUnpVb8wbtNx8TpA1prTtGPWc/ncSOkVYfmF5PZ/2b4ed/
	Vd2qVjr0t46dUHqr4wbviboWJqMKrdwFOuf1twE6DMLc5b66D4ieWH4i7n1oRkQ751u6BOrJ6bJ
	7DlBi8A64+kH5Nfo151JUrpIrMS7po7HMKrAv/jMexd8pwacLcyhB/Sc+k2NJAWu4Q/oCfCdTcm
	EndnEKtVH8blyI4/Jxj9Y2sQFtIc+OrWB2NZm4ZJT/DbGWMPn5LiwVeqTCPbb3rnYWUV7CTTwTq
	RAZF+7jHo61EZu2VAuANI+wX81NvQ0UVNzpeiZI9Ke/v15c5/gPZ7VJ2BvDXc84rBCbzXuM/h23
	yFy/NtVt5l6UkISVuUUfzCK3T6ROBMutHhK6mg6LxdjgDUs2TIGP7/Ll5Gr8VGmKBioGX8VoUQn
	JG26x7fRLBM7FJM6LFigysfDLQV0c=
X-Received: by 2002:a17:907:a708:b0:c12:1c2a:16e6 with SMTP id a640c23a62f3a-c16791943d2mr166056066b.23.1784125394611;
        Wed, 15 Jul 2026 07:23:14 -0700 (PDT)
Received: from NSA-L02.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871b3dfasm42168766b.28.2026.07.15.07.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:23:14 -0700 (PDT)
Date: Wed, 15 Jul 2026 16:23:11 +0200
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Stefan Popa <stefan.popa@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Lechner <dlechner@baylibre.com>, 
	Nuno Sa <nuno.sa@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Siratul Islam <siratul.islam@linux.dev>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Ciprian Hegbeli <ciprian.hegbeli@analog.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Message-ID: <gnkthebcxlpbwvbo774hap4mphqro4gxho4zemj6p3ixa2qp7g@ncb5o7tw5wf3>
References: <20260715063652.368501-1-stefan.popa@analog.com>
 <20260715063652.368501-3-stefan.popa@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715063652.368501-3-stefan.popa@analog.com>

Hi Stefan,

Some comments from me

On Wed, Jul 15, 2026 at 09:36:17AM +0300, Stefan Popa wrote:
> The MAX40080 is a bidirectional current-sense amplifier with an
> integrated 12-bit ADC and an I2C/SMBus interface. It measures the
> voltage across an external shunt resistor and the input bus voltage,
> storing the results in an internal FIFO.
> 
> No existing IIO driver covers this device or a register-compatible part.
> The closest relatives target different silicon with incompatible register
> maps and feature sets: max9611 is a unidirectional high-side sensor with a
> die-temperature channel and MUX-selected gain and no FIFO/PEC, while
> max34408 is an 8-bit multi-channel current monitor. The MAX40080 has a
> device-specific register map with bidirectional 13-bit current, a 64-entry
> FIFO, PEC, a single-measurement mode triggered by an SMBus Quick Command,
> and two selectable input ranges, so it warrants its own driver.
> 
> Add a direct-mode IIO driver exposing the current and voltage channels
> with raw and scale attributes, a configurable oversampling (digital
> averaging) ratio, and PEC-protected register access. The two selectable
> current-sense ranges are exposed through scale/scale_available; the
> current scale is derived from the shunt-resistor-micro-ohms device-tree
> property.
> 
> Link: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX40080.pdf
> 
> Co-developed-by: Ciprian Hegbeli <ciprian.hegbeli@analog.com>
> Signed-off-by: Ciprian Hegbeli <ciprian.hegbeli@analog.com>
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> ---
>  MAINTAINERS                |   9 +
>  drivers/iio/adc/Kconfig    |  11 +
>  drivers/iio/adc/Makefile   |   1 +
>  drivers/iio/adc/max40080.c | 630 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 651 insertions(+)
>  create mode 100644 drivers/iio/adc/max40080.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e087673237636..f50c1e00e12bb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15513,6 +15513,15 @@ L:	linux-iio@vger.kernel.org
>  S:	Supported
>  F:	drivers/iio/temperature/max30208.c
>  
> +MAXIM MAX40080 CURRENT SENSE AMPLIFIER DRIVER
> +M:	Ciprian Hegbeli <ciprian.hegbeli@analog.com>
> +M:	Stefan Popa <stefan.popa@analog.com>
> +L:	linux-iio@vger.kernel.org
> +S:	Supported
> +W:	https://ez.analog.com/linux-software-drivers
> +F:	Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml
> +F:	drivers/iio/adc/max40080.c
> +
>  MAXIM MAX7360 KEYPAD LED MFD DRIVER
>  M:	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>  S:	Maintained
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 58da8255525e4..b651c57bbc3f5 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1041,6 +1041,17 @@ config MAX34408
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called max34408.
>  
> +config MAX40080
> +	tristate "Analog Devices MAX40080 Current Sense Amplifier"
> +	depends on I2C
> +	help
> +	  Say yes here to build support for the Analog Devices MAX40080
> +	  bidirectional current-sense amplifier with a 12-bit ADC and an I2C
> +	  interface.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called max40080.
> +
>  config MAX77541_ADC
>  	tristate "Analog Devices MAX77541 ADC driver"
>  	depends on MFD_MAX77541
> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index 7cc8f9a12f763..e1953353c68a4 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -91,6 +91,7 @@ obj-$(CONFIG_MAX1241) += max1241.o
>  obj-$(CONFIG_MAX1363) += max1363.o
>  obj-$(CONFIG_MAX14001) += max14001.o
>  obj-$(CONFIG_MAX34408) += max34408.o
> +obj-$(CONFIG_MAX40080) += max40080.o
>  obj-$(CONFIG_MAX77541_ADC) += max77541-adc.o
>  obj-$(CONFIG_MAX9611) += max9611.o
>  obj-$(CONFIG_MCP320X) += mcp320x.o
> diff --git a/drivers/iio/adc/max40080.c b/drivers/iio/adc/max40080.c
> new file mode 100644
> index 0000000000000..a0c1144cfda7c
> --- /dev/null
> +++ b/drivers/iio/adc/max40080.c
> @@ -0,0 +1,630 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * MAX40080 Digital Current-Sense Amplifier driver
> + *
> + * Copyright 2026 Analog Devices, Inc.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/cleanup.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>

Typically I would say you're missing mod_devicetable.h but now we have:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/linux/device-id

You might need to base your series on linux-next though.

> +#include <linux/mutex.h>
> +#include <linux/pm.h>
> +#include <linux/property.h>
> +#include <linux/time.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +#include <linux/units.h>
> +
> +#include <linux/iio/iio.h>
> +
> +#define MAX40080_REG_CFG		0x00
> +#define MAX40080_CFG_MODE_MSK		GENMASK(2, 0)
> +#define MAX40080_CFG_PEC_EN_MSK		BIT(5)
> +#define MAX40080_CFG_RANGE_MSK		BIT(6)
> +#define MAX40080_CFG_FILTER_MSK		GENMASK(14, 12)
> +
> +#define MAX40080_REG_FIFO_CFG		0x0A
> +#define MAX40080_FIFO_CFG_STORE_IV_MSK	GENMASK(1, 0)
> +
> +#define MAX40080_REG_IV			0x10
> +/* Current is a 13-bit two's-complement value (magnitude + sign bit). */
> +#define MAX40080_IV_I_MSK		GENMASK(12, 0)
> +#define MAX40080_IV_I_SIGN_BIT		12
> +#define MAX40080_IV_V_MAG_MSK		GENMASK(27, 16)
> +#define MAX40080_IV_VALID_MSK		BIT(31)
> +
> +/* CFG.mode field values */
> +#define MAX40080_CFG_MODE_STDBY		0x00
> +#define MAX40080_CFG_MODE_SINGLE	0x02	/* one conversion per Quick Command */
> +
> +/* CFG.range field values */
> +#define MAX40080_CFG_RANGE_50mV		0
> +#define MAX40080_CFG_RANGE_10mV		1
> +
> +/* FIFO_CFG.store_iv field values */
> +#define MAX40080_FIFO_CFG_STORE_I_V	0x02
> +
> +#define MAX40080_ADC_RES		4096
> +#define MAX40080_INTER_VREF_mV		1250
> +#define MAX40080_V_BUFF_GAIN		30
> +#define MAX40080_CSA_50mV_GAIN		25
> +#define MAX40080_CSA_10mV_GAIN		125
> +
> +/*
> + * The RANGE field (CFG bit 6) selects one of two current-sense full-scale
> + * ranges: +/-50 mV (gain 25 V/V) or +/-10 mV (gain 125 V/V).
> + */
> +static const int max40080_csa_gain[] = {
> +	[MAX40080_CFG_RANGE_50mV] = MAX40080_CSA_50mV_GAIN,
> +	[MAX40080_CFG_RANGE_10mV] = MAX40080_CSA_10mV_GAIN,
> +};
> +
> +struct max40080_state {
> +	struct i2c_client *client;
> +	/* Serializes read-modify-write access to the CFG register. */
> +	struct mutex lock;
> +	u32 shunt_resistor_uohm;
> +	/*
> +	 * Cached configuration, also used to restore the device on resume after
> +	 * a suspend that may have cut its power: the selected RANGE index and
> +	 * the oversampling ratio.
> +	 */
> +	unsigned int range;
> +	int oversampling_ratio;
> +	/*
> +	 * Precomputed current scale (mA per code) for each RANGE setting, as
> +	 * {integer, nano} pairs for IIO_VAL_INT_PLUS_NANO. The range is
> +	 * selected by writing the corresponding scale.
> +	 */
> +	int current_scale[ARRAY_SIZE(max40080_csa_gain)][2];
> +};
> +
> +static const int max40080_oversampling_avail[] = { 1, 8, 16, 32, 64, 128 };
> +
> +static int max40080_update_bits(struct max40080_state *st, u8 reg,
> +				u16 mask, u16 val)
> +{
> +	int tmp;
> +
> +	guard(mutex)(&st->lock);
> +
> +	tmp = i2c_smbus_read_word_data(st->client, reg);
> +	if (tmp < 0)
> +		return tmp;
> +
> +	tmp = (tmp & ~mask) | (val & mask);
> +
> +	return i2c_smbus_write_word_data(st->client, reg, tmp);
> +}

Any special reason to not use regmap? If this was already replied in
other version, feel free to disregard this comment :)

> +
> +/*
> + * In single-measurement mode the device sits idle until it receives an SMBus
> + * Quick Command, then performs exactly one current and one voltage conversion
> + * and returns to idle. Triggering on demand this way (rather than running the
> + * FIFO continuously in active mode) means each read returns a fresh, coherent
> + * current/voltage pair instead of the oldest queued FIFO entry.
> + */
> +static int max40080_trigger_measurement(struct max40080_state *st)
> +{
> +	struct i2c_client *client = st->client;
> +
> +	return i2c_smbus_xfer(client->adapter, client->addr,
> +			      client->flags, I2C_SMBUS_WRITE, 0,
> +			      I2C_SMBUS_QUICK, NULL);
> +}

On top of what Andy said, it seems the above is only used in one place
so I would consider to just remove it.

> +
> +/*
> + * A single measurement holds the matched current/voltage pair in one 32-bit
> + * word (MAX40080_REG_IV). Reading all four bytes in one transaction returns
> + * both from the same conversion; reading the separate current (0x0C) and
> + * voltage (0x0E) registers would decorrelate the two channels.
> + *
> + * Unlike the word accesses used elsewhere, this is a plain I2C block read: the
> + * SMBus layer does not append or verify a PEC byte for it even when PEC is
> + * otherwise enabled for the device, so this transfer is not PEC protected.
> + */
> +static int max40080_read_iv_once(struct max40080_state *st, u32 *iv)
> +{
> +	u8 buf[4];
> +	int ret;
> +
> +	ret = i2c_smbus_read_i2c_block_data(st->client, MAX40080_REG_IV,
> +					    sizeof(buf), buf);

It's not clear to me that i2c will use safe buffer all the time (from a
quick look). So I would say to make this DMA safe the usual way we do in
IIO.

> +	if (ret < 0)
> +		return ret;
> +	if (ret != sizeof(buf))
> +		return -EIO;
> +
> +	*iv = get_unaligned_le32(buf);
> +
> +	return 0;
> +}
> +

...

> +
> +static int max40080_set_range(struct max40080_state *st, unsigned int range)
> +{
> +	int ret;
> +
> +	ret = max40080_update_bits(st, MAX40080_REG_CFG, MAX40080_CFG_RANGE_MSK,
> +				   FIELD_PREP(MAX40080_CFG_RANGE_MSK, range));
> +	if (ret)
> +		return ret;
> +
> +	st->range = range;
> +

We have a lock protecting max40080_update_bits() but that is not enough
given the above store.

> +	return 0;
> +}

...
> +
> +static int max40080_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct max40080_state *st = iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		switch (chan->type) {
> +		case IIO_CURRENT:
> +			ret = max40080_get_current(st, val);
> +			if (ret)
> +				return ret;
> +			break;
> +		case IIO_VOLTAGE:
> +			ret = max40080_get_voltage(st, val);
> +			if (ret)
> +				return ret;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		return IIO_VAL_INT;

You can return inline instead of the breaks.

...

> +
> +static int max40080_resume(struct device *dev)
> +{
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct max40080_state *st = iio_priv(indio_dev);
> +
> +	/*
> +	 * A suspend may have cut power to the device, resetting it to its
> +	 * power-on defaults. Reprogram it from the cached configuration.
> +	 */
> +	guard(mutex)(&st->lock);

AFAIK, there´s no need for the lock here. But I´m puzzled about the above
anyways. Do we have a real usecase for it? Without a .suspend()
implementation it makes me wonder.

- Nuno Sá

