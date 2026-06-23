Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208023939DA
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 19:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244228; cv=none; b=UpMXqWs8IT5/6RdRJ5CyF+uILWYqO0b+DYFnjM6hxLolsfxhOjYijqhmeKudw1lDmUE2EdH1HMYUsJM6WVQXL7SwFPKaS0JzDv4AXB6kZw6kMfjjQL31bT7bGuOHXeAvYGkqHchiXcHNxrw8eFk9fsAVr7lSBAWyFg508dZTT7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244228; c=relaxed/simple;
	bh=xJlTM4geI74pJizLfp6h1T1ooMM6WXq6+7l8zgkKXYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h17BpQRWwKqm+NWtArfmLiN7w15508WJZvoQbjge+mttYQ4Z9iQGR2JNSkmNld27UKcpSDwAeq6Wj2tU3cd6L8uLh3undiLxJpXB4i0beQVzXMocRPS3pTPUMdc083reFdd8O6og4uyFPbgMqrlvJppPnO+EMemSLPmB4vVl5Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=C+4/JiLL; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="C+4/JiLL"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e94cd6f99aso258547a34.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782244224; x=1782849024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bb7BYfPSaroR0XpqRtRy3qDW3N+AMVpL8VIPHHC7cX0=;
        b=C+4/JiLL3jusrRwrejV+kf7gFhOq8kEYZL4TnmuY80eFdM81SkPt+W5fE2nFtOOA4e
         p/pZheauudpHjW+K1xrwxBksx3tyY62AQuyfMk4UCywMVu834aO09LeODQihb8QRMLPy
         46HlaFDE2PxqDKf38RhO397XIXyHMGFmNsCQAz0SxFACtX2wEZnPdJg3hcklA7wm382f
         fdQBnyNxFwx/8K7WFG57bd6vC+78DOGfmNCDSXvYKp79w6WW8DJRoo3ycBLCpmpHlYJp
         JhhEPFqpkbycY7hG7AAJzgPu5hOkph/a/6U9rga0UNojVZY4ZifXvy7f5MoJkCtpHx2I
         U+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244224; x=1782849024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bb7BYfPSaroR0XpqRtRy3qDW3N+AMVpL8VIPHHC7cX0=;
        b=olSi816wfpnBmG18Kik9z4F9fEpOLHLlApxtDKCqLVx5WAiNJAqBcWAeCu2guwpnk2
         Gi4DSzQH//sPjFdx1nmuvRqCLPd2+8Xh0/Y/sIUs9NTtiKm+EJD1VPx4mNoIJU+KQkJ+
         YPj6LX9UXxbWNpUlm/8IbJYoHWmYLNhgQW2LbrAPwomXysigsvhPMnerpAvT5czoxcR1
         oA3+29+ILnecumUTNbTjbdDsTzeu/SUhhhUacoWv57awr847wwUSvvBVvDQEp1kMLBcw
         AqQECprlHZ57u+PxtHn9a/x5aPZacOj5AcI3oNYzpJr8rSVKi8u6Rv/beQljX5lvF5Kk
         k23Q==
X-Forwarded-Encrypted: i=1; AFNElJ/KNm8P6za51UEvQj6FCHJ4OR/Lyg40JYxhotc9UnlGMpZdW76qhGtdWvYUw+klSjjD1Pi2Dx+sexEj@vger.kernel.org
X-Gm-Message-State: AOJu0YwaDVd28HjnrIpxFbs7AdKXv2J9+exAUsHSqHmhiM18anY81s+5
	M4RsmS5zQkjrkuHxbuizMxo1aS/hJBPi8vdmFVzUDMWLUdUUMg4TcSbC0aAScUli+8o=
X-Gm-Gg: AfdE7cklJ2ZOl1o0OX8TQU+FF/LamOJ3uHIW4gnyYXtfE3MxeiaToKFZg93Mk0b2CnV
	j212yBJOOKnCjTPbKhVp09s4M+KGgF6StrY6cPW2Ol2odh00ns/etZ9SWNpB0s/6wS+8TCgnY8f
	yBO1nyxnW+NyhvIOWR97Kx0czotsu4FHTTeWY0S182GlaulH+HuiFV3snnRm3GnUGodT2y+7dcZ
	Bi+iFVB3VJIwhXvPHbfHW1QPn04n59eYYvjdvQDP0jTSwm+/8NKjzALZrY0rtZZq80hXK8ztXm+
	/hfGBBISPGpB59Wmut8T1fpKf3t8Z9kzq0XJ2RmfnpucyOAJ8HIcr7jmx0aNAtoekfbIRdIFmFK
	fptS3Hl74ZzX0I4Wqcu4HA/uXIqGFDlRmb4xqd98wnqs9SSXhDgJtJ2bTUBJSD992J824ARdWyM
	ngpxAlRc15gU7t3hnHEpeaAsL6u6zBl4Fm04TyJb+359HwhcNkYDE+aS7ya4wciKc=
X-Received: by 2002:a05:6830:2685:b0:7e6:efb8:fe66 with SMTP id 46e09a7af769-7e986894678mr529146a34.12.1782244223919;
        Tue, 23 Jun 2026 12:50:23 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:68dc:b788:b3ac:e34e? ([2600:8803:e7e4:500:68dc:b788:b3ac:e34e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e94429778csm9782987a34.20.2026.06.23.12.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 12:50:23 -0700 (PDT)
Message-ID: <bdc0ad39-4f33-4de3-bf31-a3de534d3fea@baylibre.com>
Date: Tue, 23 Jun 2026 14:50:23 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iio: dac: dac8163: Add driver for DAC8163
To: Lukas Metz <lukas.metz@gmx.net>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260623-dac8163-work-v1-0-5b508158faa0@gmx.net>
 <20260623-dac8163-work-v1-1-5b508158faa0@gmx.net>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260623-dac8163-work-v1-1-5b508158faa0@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/23/26 11:07 AM, Lukas Metz wrote:
> The DAC756x, DAC816x, and DAC856x devices are low-power, voltage-output,
> dual-channel, 12-, 14-, and 16-bit digital-to-analog converters (DACs),
> respectively. These devices include a 2.5-V, 4-ppm/°C internal
> reference, giving a full-scale output voltage range of 2.5 V or 5 V.

Nice and simple driver. Mostly just needs better alignment with usual
IIO conventions.

> 
> Signed-off-by: Lukas Metz <lukas.metz@gmx.net>
> ---
>  MAINTAINERS                  |   6 +
>  drivers/iio/dac/Kconfig      |  10 ++
>  drivers/iio/dac/Makefile     |   1 +
>  drivers/iio/dac/ti-dac8163.c | 339 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 356 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d238590a31f2..e82cc28e1bc3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26394,6 +26394,12 @@ S:	Odd Fixes
>  F:	drivers/clk/ti/
>  F:	include/linux/clk/ti.h
>  
> +TI DAC8163 DAC DRIVER
> +M:	Lukas Metz <lukas.metz@gmx.net>
> +L:	linux-iio@vger.kernel.org
> +S:	Maintained
> +F:	drivers/iio/dac/ti-dac8163.c
> +
>  TI DATA TRANSFORM AND HASHING ENGINE (DTHE) V2 CRYPTO DRIVER
>  M:	T Pratham <t-pratham@ti.com>
>  L:	linux-crypto@vger.kernel.org
> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index db9f5c711b3d..6b6e5ee0732a 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -632,6 +632,16 @@ config TI_DAC7612
>  
>  	  If compiled as a module, it will be called ti-dac7612.
>  
> +config TI_DAC8163
> +	tristate "Texas Instruments 12/14/16-bit 2-channel DAC driver"
> +	depends on SPI_MASTER
> +	help
> +	  Driver for the Texas Instruments digital-to-analog converter
> +	  family dacxx6x compatible with the variants DAC7562,
> +	  DAC7563, DAC8162, DAC8163, DAC8562 and DAC8563.
> +
> +	  If compiled as a module, it will be called ti-dac8163.
> +
>  config VF610_DAC
>  	tristate "Vybrid vf610 DAC driver"
>  	depends on HAS_IOMEM
> diff --git a/drivers/iio/dac/Makefile b/drivers/iio/dac/Makefile
> index 2a80bbf4e80a..359cde446623 100644
> --- a/drivers/iio/dac/Makefile
> +++ b/drivers/iio/dac/Makefile
> @@ -62,4 +62,5 @@ obj-$(CONFIG_TI_DAC082S085) += ti-dac082s085.o
>  obj-$(CONFIG_TI_DAC5571) += ti-dac5571.o
>  obj-$(CONFIG_TI_DAC7311) += ti-dac7311.o
>  obj-$(CONFIG_TI_DAC7612) += ti-dac7612.o
> +obj-$(CONFIG_TI_DAC8163) += ti-dac8163.o
>  obj-$(CONFIG_VF610_DAC) += vf610_dac.o
> diff --git a/drivers/iio/dac/ti-dac8163.c b/drivers/iio/dac/ti-dac8163.c
> new file mode 100644
> index 000000000000..84a9dfb5347d
> --- /dev/null
> +++ b/drivers/iio/dac/ti-dac8163.c
> @@ -0,0 +1,339 @@
> +// SPDX-License-Identifier: GPL-2.0

Prefer GPL-2.0-only or GPL-2.0-or-later.

> +/*
> + * DACxx6x IIO driver (SPI)
> + */
> +
> +#include <linux/module.h>
> +#include <linux/spi/spi.h>
> +#include <linux/of.h>
> +#include <linux/err.h>
> +#include <linux/slab.h>
> +#include <linux/iio/iio.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/units.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/printk.h>
> +#include <linux/bitfield.h>
> +
> +#define COMMAND_MASK GENMASK(6, 3)
> +#define ADDRESS_MASK GENMASK(2, 0)
> +
> +#define COMMAND_SET(x, y) (FIELD_PREP(COMMAND_MASK, (x)) | \
> +							FIELD_PREP(ADDRESS_MASK, (y)))

Usually, we try to avoid putting FIELD_PREP() in macros. This
is only used once in the code anyway, so dropping the macro
will actually save a line or two.

> +
> +#define CMD_WRITE_INPUT_REG	0x0
> +#define CMD_UPDATE_DAC	0x1
> +#define CMD_WRITE_UPDATE_ALL	0x2
> +#define CMD_WRITE_UPDATE	0x3
> +#define CMD_SET_PWR_MODE		0x4
> +#define CMD_SOFT_RST			0x5
> +
> +#define CMD_LDAC_MODE		0x6
> +#define LDAC_MODE_CHANNEL_A_MASK BIT(0)
> +#define LDAC_MODE_CHANNEL_B_MASK BIT(1)
> +
> +#define CMD_SEL_REFERENCE	0x7
> +#define VOLTAGE_REFERENCE_MASK BIT(0)
> +
> +enum dacxx6x_ldac_modes {

In IIO, we always avoid putting xx in identifier names. Just use dac8163
everwhere instead since that is the name of the driver.

> +	LDAC_MODE_ACTIVE = 0,
> +	LDAC_MODE_INACTIVE = 1
> +};
> +
> +enum dacxx6x_voltage_reference {
> +	VOLTAGE_REFERENCE_EXTERNAL = 0,
> +	VOLTAGE_REFERENCE_INTERNAL = 1
> +};
> +
> +enum dacxx6x_supported_device_ids {
> +	ID_DAC7562,
> +	ID_DAC7563,
> +	ID_DAC8162,
> +	ID_DAC8163,
> +	ID_DAC8562,
> +	ID_DAC8563
> +};
> +
> +struct dacxx6x_state {
> +	struct spi_device *spi;
> +
> +	struct regulator *vref;

This is 

> +	struct gpio_desc *loaddacs;

LDAC is very common in DACs, so I would call this ldac_gpio. Also, it isn't
currently used outside of probe, so we don't really need it here.

> +
> +	bool internal_ref;
> +	int vref_uv;

As in a later comment, we should be able to drop these as well if we can
get rid of the remove() callback.

> +
> +	unsigned int cached[2];

Can we get a more descriptive name for this? Is it raw value?

> +
> +	/*
> +	 * Lock to protect the state of the device from potential concurrent
> +	 * write accesses from userspace.
> +	 */
> +	struct mutex lock;
> +};
> +
> +struct dacxx6x_chip_info {
> +	const char *name;
> +	const struct iio_chan_spec channels[2];
> +};
> +
> +#define DACXX6X_CHAN(id, resolution)                                        \
> +	{                                                                   \
> +		.type = IIO_VOLTAGE, .channel = (id), .output = 1,          \

Please put each field on a new line.

> +		.indexed = 1, .info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
> +		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),       \
> +		.scan_type = { .realbits = (resolution),                    \
> +			       .shift = 16 - (resolution) },                \
> +	}
> +
> +static const struct dacxx6x_chip_info dacxx6x_chip_info_table[6] = {
> +	[ID_DAC7562] = {
> +		.name = "dac7562",
> +		.channels = {
> +			DACXX6X_CHAN(0, 12),
> +			DACXX6X_CHAN(1, 12),
> +		}
> +	},
> +	[ID_DAC7563] = {
> +		.name = "dac7563",
> +		.channels = {
> +			DACXX6X_CHAN(0, 12),
> +			DACXX6X_CHAN(1, 12),
> +		}
> +	},
> +	[ID_DAC8162] = {
> +		.name = "dac8162",
> +		.channels = {
> +			DACXX6X_CHAN(0, 14),
> +			DACXX6X_CHAN(1, 14),
> +		}
> +	},
> +	[ID_DAC8163] = {
> +		.name = "dac8163",
> +		.channels = {
> +			DACXX6X_CHAN(0, 14),
> +			DACXX6X_CHAN(1, 14),
> +		}
> +	},
> +	[ID_DAC8562] = {
> +		.name = "dac8562",
> +		.channels = {
> +			DACXX6X_CHAN(0, 16),
> +			DACXX6X_CHAN(1, 16),
> +		}
> +	},
> +	[ID_DAC8563] = {
> +		.name = "dac8563",
> +		.channels = {
> +			DACXX6X_CHAN(0, 16),
> +			DACXX6X_CHAN(1, 16),
> +		}
> +	},
> +};

We are trying to get rid of arrays like this in drivers. We can just make
individual structs instead.

> +
> +static int dacxx6x_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan, int *val,
> +			    int *val2, long mask)
> +{
> +	struct dacxx6x_state *st;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		st = iio_priv(indio_dev);

This can be moved out of the case statement so we don't have to
repeat it each time.

> +		mutex_lock(&st->lock);
> +		*val = st->cached[chan->channel];
> +		mutex_unlock(&st->lock);
> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_SCALE:
> +		st = iio_priv(indio_dev);
> +		*val = st->vref_uv / MILLI; /* vref in mV */

We've been writing this like:

		*val = st->vref_uV / (MICRO/ MILLI);

Then we don't really need a comment.

> +		*val2 = chan->scan_type.realbits;
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int dacxx6x_write_reg(struct dacxx6x_state *st, int reg, int addr,
> +			     unsigned int val)
> +{
> +	u8 tx[3];
> +
> +	tx[0] = COMMAND_SET(reg, addr);
> +	tx[1] = (val >> 8) & 0xff;
> +	tx[2] = val & 0xff;
> +
> +	return spi_write(st->spi, tx, sizeof(tx));
> +}
> +
> +static int dacxx6x_write_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan, int val,
> +			     int val2, long mask)
> +{
> +	struct dacxx6x_state *st = iio_priv(indio_dev);
> +	struct device *dev = &st->spi->dev;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		dev_dbg(dev, "%s: val=%d val2=%d\n", __func__, val, val2);

Do we really need to keep this debug print?

> +		if (val2 != 0)
> +			return -EINVAL;
> +
> +		if (val < 0 || val >= BIT(chan->scan_type.realbits))
> +			return -EINVAL;
> +
> +		mutex_lock(&st->lock);
> +		int ret = dacxx6x_write_reg(st, CMD_WRITE_UPDATE, chan->channel,

Usually, we would declare `int ret;` at the top of the function.

> +					    (unsigned int)val

Using u32 type instead of unsigned int would make this probably fit
on one line too.

> +						    << chan->scan_type.shift);
> +
> +		if (!ret)
> +			st->cached[chan->channel] = val;
> +		mutex_unlock(&st->lock);
> +		return ret;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct iio_info dacxx6x_iio_info = {
> +	.write_raw = dacxx6x_write_raw,
> +	.read_raw = dacxx6x_read_raw
> +};
> +
> +static int dacxx6x_probe(struct spi_device *spi)
> +{
> +	struct iio_dev *indio_dev;
> +	struct dacxx6x_state *st;
> +	const struct dacxx6x_chip_info *info;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	st = iio_priv(indio_dev);
> +	st->spi = spi;
> +	spi_set_drvdata(spi, indio_dev);
> +
> +	st->loaddacs = devm_gpiod_get_optional(&spi->dev, "ti,loaddacs",
> +					       GPIOD_OUT_LOW);

As in the dt-bindings, we would expect the bindings to be active low
so this would be GPIOD_OUT_HIGH to assert the LDAC signal.

Could also use a comment to say that for now we are just holding this
asserted so that individual outputs are updated when we each raw attribute.

> +	if (IS_ERR(st->loaddacs))
> +		return PTR_ERR(st->loaddacs);
> +
> +	st->internal_ref =
> +		device_property_read_bool(&spi->dev, "ti,internal-ref");
> +
> +	if (!st->internal_ref) {
> +		st->vref = devm_regulator_get(&spi->dev, "vref");
> +		if (IS_ERR(st->vref))
> +			return PTR_ERR(st->vref);
> +
> +		ret = regulator_enable(st->vref);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	mutex_init(&st->lock);

devm_mutex_init(). Also should not be in the middle of regulator code.

> +
> +	if (st->internal_ref) {
> +		st->vref_uv = 2500000; /* 2.5V internal reference */
> +	} else {
> +		st->vref_uv = regulator_get_voltage(st->vref);
> +		if (st->vref_uv < 0) {
> +			ret = st->vref_uv;
> +			goto err;
> +		}
> +	}

The way we've been doing optional reference voltage lately is like this:

	if (device_property_present(dev, "refin-supply")) {
		ret = devm_regulator_get_enable_read_voltage(dev, "refin");
		if (ret < 0)
			return ret;

		st->vref_mV = ret / (MICRO / MILLI);
	} else {
		st->vref_mV = DAC8163_INTERNAL_REF_mV;
	}

This avoids the need for the ti,internal-ref DT property, avoid the need to convert
uV to mV later and the macro for the internal reference makes it self-documenting
so we don't need a comment. And it automacially cleans up after itself.

> +
> +	gpiod_set_value(st->loaddacs, 0);

devm_gpiod_get_optional() already set this, so this is redundant.

> +
> +	ret = dacxx6x_write_reg(st, CMD_LDAC_MODE, 0,
> +				FIELD_PREP(LDAC_MODE_CHANNEL_A_MASK, LDAC_MODE_INACTIVE) |
> +				FIELD_PREP(LDAC_MODE_CHANNEL_B_MASK, LDAC_MODE_INACTIVE));
> +
> +	if (ret < 0)
> +		goto err;
> +
> +	ret = dacxx6x_write_reg(st, CMD_SEL_REFERENCE, 0,
> +				FIELD_PREP(VOLTAGE_REFERENCE_MASK, st->internal_ref));
> +

Some of these lines are getting a bit long. We try to stick to close
to 80 columns in IIO when we can.

> +	if (ret < 0)
> +		goto err;
> +
> +	info = spi_get_device_match_data(spi);

	if (!info)
		return -EINVAL;

> +
> +	indio_dev->name = info->name;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->info = &dacxx6x_iio_info;
> +	indio_dev->channels = info->channels;
> +	indio_dev->num_channels = 2;
> +
> +	ret = iio_device_register(indio_dev);

	return devm_iio_device_register();

> +	if (ret)
> +		goto err;
> +
> +	return 0;
> +
> +err:
> +	if (!st->internal_ref)
> +		regulator_disable(st->vref);
> +	mutex_destroy(&st->lock);
> +	return ret;
> +}
> +
> +static void dacxx6x_remove(struct spi_device *spi)
> +{
> +	struct iio_dev *indio_dev = spi_get_drvdata(spi);
> +	struct dacxx6x_state *st = iio_priv(indio_dev);
> +
> +	iio_device_unregister(indio_dev);
> +	mutex_destroy(&st->lock);
> +	if (!st->internal_ref)
> +		regulator_disable(st->vref);

We can use devm_* functions and avoid the need for the remove callback.

> +}
> +
> +#define DACXX6X_COMPATIBLE(of_compatible, id)        \
> +	{                                            \
> +		.compatible = of_compatible,         \
> +		.data = &dacxx6x_chip_info_table[id] \
> +	}
> +
> +static const struct of_device_id dacxx6x_of_match[] = {
> +	DACXX6X_COMPATIBLE("ti,dac7562", ID_DAC7562),
> +	DACXX6X_COMPATIBLE("ti,dac7563", ID_DAC7563),
> +	DACXX6X_COMPATIBLE("ti,dac8162", ID_DAC8162),
> +	DACXX6X_COMPATIBLE("ti,dac8163", ID_DAC8163),
> +	DACXX6X_COMPATIBLE("ti,dac8562", ID_DAC8562),
> +	DACXX6X_COMPATIBLE("ti,dac8563", ID_DAC8563),
> +	{}

IIO style is `{ }` (with space inbetween braces)

> +};
> +MODULE_DEVICE_TABLE(of, dacxx6x_of_match);
> +
> +static const struct spi_device_id dacxx6x_id_table[] = {
> +	{ "dac7562", (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC7562] },
> +	{ "dac7563", (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC7563] },
> +	{ "dac8162", (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC8162] },
> +	{ "dac8163", (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC8163] },
> +	{ "dac8562", (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC8562] },
> +	{ "dac8563", (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC8563] },
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(spi, dacxx6x_id_table);
> +
> +static struct spi_driver dacxx6x_driver = {
> +	.driver = {
> +		.name = "ti-dacxx6x",
> +		.of_match_table = dacxx6x_of_match,
> +	},
> +	.probe = dacxx6x_probe,
> +	.remove = dacxx6x_remove,
> +	.id_table = dacxx6x_id_table,
> +};
> +
> +module_spi_driver(dacxx6x_driver);
> +
> +MODULE_AUTHOR("Lukas Metz <lukas.metz@gmx.net>");
> +MODULE_DESCRIPTION("Texas Instruments 12/14/16-bit 2-channel DAC driver");
> +MODULE_LICENSE("GPL");
> 

