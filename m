Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548EE4A7C8B
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051429; cv=none; b=Rc3QFWQzO8hJM3S1Hi6msZQEMFUbzKqSg7pdTX6Dv9/zDuiJXrSCDIOHIscLDCNpuvCf+DRungSQXFnMCGVPX9KuXAcyQN/xFvL8lp65tuKKb+oLlc0p/jtpqsaaBTcmZdDODta7KomxTChxVTRzF5Kb9RDiTor5ua0yS18or3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051429; c=relaxed/simple;
	bh=UMXCWjml4lPQz/hKvhaP/9TPT70rJ9KOvp7sSO7l7SY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SMgXPUKTXwjt37MnmClbfKF3/ITkriOQtdwAGcB3/wYI73tHOcbaWsXUmpplud9i2QlOut74d9Vjv2Vw7e070lxWzY9qWkzr76hDZoX5jgu5w77GhNWCiwt3DlBAhMuhkdYoacWswEvExWxZ53mim1RtejKpSnaHVc7Isichw/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmYSF+t4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmYSF+t4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so34825305e9.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792051425; x=1792656225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3AC1hlfYXxk5mA7dVc5//s/RTKPoQs4C0p246/c7vZI=;
        b=GmYSF+t4AVdNsnIjlbP+9xXJN1LQvrCeBJlib5aCWjK88hAlOsrOrEMMx7+AMANDbw
         nB3MpVmtPoumenxyXOkJezYAcmZqIN8fHWQXk9eHx5lz4AkqKHSzQZattMtxr927hwJo
         mDgKC8TbtZXeyxUU2Bscc1LRASvxHoqeyhyvNTfKsZwqLErARZIH6Xy2Ek8mLOvq5LAe
         zEdzautP51gHZ7V3ZXS7ckduf3adI3k7Qd9t+Hwww2hXrQYVnk2IifCqlGdo6QLlKDnZ
         8HGkP8g5c/zYdhe5JZIbfA0f4dseUtAP/5dZ63bIBrbU8ufszg49ruCwKv3mQyc5hVvu
         pvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051425; x=1792656225;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3AC1hlfYXxk5mA7dVc5//s/RTKPoQs4C0p246/c7vZI=;
        b=HUir6BrWEraGZ/rEH0UkDG/OLOUWRcGvwMi4s4MQqVjXozLLY9XgE4RMuz3/hAMRE1
         HcbFf645ZfpOQnRlS+iyomX8wD/j+Xtm1YVErXmztAniUzciVvQvnCRMGKDbwZQN89eT
         XvuA3eMnj8Akz3NK8V2ZFa7YALGe5HHnPJIqxx4d2dC+pxwGnjGAf5GDJxVwvfWPPkVc
         UU2IR6ZfXd6Nk054saePjKzcztfh7279FRZUD1CjbPr8x8yIdpF0Bxsucv0WhHzJM9Ce
         7TcA9isJ5OvbwpvrxPNIlPlAHBjpovTzUAGIKAxQHSG7ul5g7PzC3CoJzJSTXnrN7a/D
         s+CQ==
X-Forwarded-Encrypted: i=1; AKwUvBybKERuqdjsC/L4jNeQsj9c+9etBjhJaSPbnHw37a6aISI12l41yyxAXLKKIs/BipOOKbU/TwrT6i+g@vger.kernel.org
X-Gm-Message-State: AFq9FYLzHu2F44foyucWOrV0a5TLyri53gEqMtwDchpoWw/lbRD6zObu
	abkMiEB2pAoDNIQJTpOaJ/MulN99w7nC+x8A2fUuhZEa9cJrwP7XoXUB
X-Gm-Gg: AYBFou2Ed0dlTKM5x4bLPBT9S4tPo63iyecbKBHtRo5FghuKHasAFEGwXfpYpkznMAB
	9+3Xk1f5SRx9rA+0IDLMdkdDKv4U0F2iBV/G8Yc2ClwhZy/Wahrg87rYW/Ado1pktUPaTmpaWBX
	wJ/ajXfA7/A0zh+amBHdQNM6H2mXiDlUR/wfjYcbTTo8aOiUn4tn2DUqBI5tLplg5X+vgCpilN1
	DW/EbnvD/JQk1JlRi/0mhQjn2TxpjTFTRfPhXn02TCz9bV5qy+gcgO7QKaY2OV4fQPenxGp6Zui
	nNs8N1ETE7IyZTFJJ06cRu4U5eWND17M/1/q8NmJMaHPWkWihI5e1ssDG4u6bEX1GRakMtbj1Tt
	Lnno3Xvb0SWS7xQunZc6F92PoWXAuUyyz9nBhHVU9MKDcadQKbiy2MrMIUZx8JwN/xd03SyY8so
	En8N1EaB8wJAMnvCpZhQMryRd2lFz1NpqeUnLYEP+Mwet2BjjhebC4YiEK10KXXMUHdG3eIk62b
	HT+STYfAe1VHsTTBF0NZI9TIv7du45xaDmZ4rT5LF+xzhab110BzW+46xtdUthTtbCUwziBl/uF
	4KnxQ7VCF8cnIXjpKGu6yO58sn09d4xK1Ke4vjV2FO2HJv3quC4A6Tp+OY4oMy1aqAkOgsogxbJ
	i21fwCb4VQdSo/hwhqwUzSC0K1UDKKj0KGFiq7OnbF/Cm/pkE7lNVuiQN9jQ4d5mtgNXkrgUUmc
	1UfcyA
X-Received: by 2002:a05:600c:6388:b0:4a1:ac66:5ffe with SMTP id 5b1f17b1804b1-4a1ac666396mr154042545e9.15.1792051425202;
        Thu, 15 Oct 2026 01:03:45 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdbb4a30sm49969265e9.15.2026.10.15.01.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:03:45 -0700 (PDT)
Date: Thu, 15 Oct 2026 10:03:39 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <krzk+dt@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
 <nuno.sa@analog.com>, <Michael.Hennerich@analog.com>, <andy@kernel.org>,
 <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH v4 2/2] iio: temperature: add support for Analog Devices
 MAX30210
Message-ID: <20261015100339.00005360@gmail.com>
In-Reply-To: <20261015012159.44-3-johnerasmusmari.geronimo@analog.com>
References: <20261015012159.44-1-johnerasmusmari.geronimo@analog.com>
	<20261015012159.44-3-johnerasmusmari.geronimo@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 09:21:59 +0800
John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com> wrote:

> Add support for the Analog Devices MAX30210 I2C temperature
> sensor.
> 
> The driver uses regmap for register access and integrates with
> the IIO framework. It supports:
> 
> - Direct mode temperature conversion
> - Configurable sampling frequency
> - Threshold events
> - FIFO operation with IIO kfifo buffer support
> - Optional interrupt-driven data ready signaling
> 
> The device provides 16-bit signed temperature data and a
> 64-sample FIFO.
> 
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
> ---

Hi, quick review from me. Please also check out Sashiko's remarks:

https://sashiko.dev/#/patchset/20261015012159.44-1-johnerasmusmari.geronimo%40analog.com

Josh

> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Analog Devices MAX30210 I2C Temperature Sensor driver
> + *
> + * Copyright 2026 Analog Devices Inc.

Adding a link to the datasheet here would be good.

> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/iio/buffer.h>
> +#include <linux/iio/events.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iio/kfifo_buf.h>
> +#include <linux/iio/sysfs.h>

Please separate the <linux/iio/*> specific headers from the
generic linux headers.

> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/time.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +#include <linux/units.h>

Missing cleanup.h, sysfs.h and asm/byteorder.h.

> +
> +#define MAX30210_STATUS_REG			0x00
> +#define   MAX30210_STATUS_A_FULL_MASK		BIT(7)
> +#define   MAX30210_STATUS_TEMP_RDY_MASK	BIT(6)
> +#define   MAX30210_STATUS_TEMP_DEC_MASK	BIT(5)
> +#define   MAX30210_STATUS_TEMP_INC_MASK	BIT(4)
> +#define   MAX30210_STATUS_TEMP_LO_MASK		BIT(3)
> +#define   MAX30210_STATUS_TEMP_HI_MASK		BIT(2)
> +#define   MAX30210_STATUS_PWR_RDY		BIT(0)
> +#define MAX30210_INT_EN_REG			0x02
> +#define MAX30210_FIFO_DATA_REG			0x08
> +#define MAX30210_FIFO_CONF_1_REG		0x09
> +#define   MAX30210_FIFOCONF1_A_FULL_MASK	GENMASK(5, 0)
> +#define MAX30210_FIFO_CONF_2_REG		0x0A
> +#define   MAX30210_FIFOCONF2_FLUSH_FIFO		BIT(4)
> +#define MAX30210_SYS_CONF_REG			0x11
> +#define   MAX30210_SYSCONF_RESET		BIT(0)
> +#define MAX30210_PIN_CONF_REG			0x12
> +#define   MAX30210_PINCONF_EXT_CNV_EN		BIT(7)
> +#define   MAX30210_PINCONF_EXT_CVT_ICFG		BIT(6)
> +#define   MAX30210_PINCONF_INT_FCFG_MASK	GENMASK(3, 2)
> +#define   MAX30210_PINCONF_INT_OCFG_MASK	GENMASK(1, 0)
> +#define MAX30210_TEMP_ALM_HI_REG		0x22
> +#define MAX30210_TEMP_ALM_LO_REG		0x24
> +#define MAX30210_TEMP_INC_THRESH_REG		0x26
> +#define MAX30210_TEMP_DEC_THRESH_REG		0x27
> +#define MAX30210_TEMP_CONF_1_REG		0x28
> +#define   MAX30210_TEMPCONF1_CHG_DET_EN		BIT(3)
> +#define   MAX30210_TEMPCONF1_RATE_CHG_FILTER_MASK	GENMASK(2, 0)
> +#define MAX30210_TEMP_CONF_2_REG		0x29
> +#define   MAX30210_TEMPCONF2_TEMP_PERIOD_MASK	GENMASK(3, 0)
> +#define   MAX30210_TEMPCONF2_ALERT_MODE		BIT(7)
> +#define MAX30210_TEMP_CONV_REG			0x2A
> +#define   MAX30210_TEMPCONV_CONV_T		BIT(0)
> +#define   MAX30210_TEMPCONV_AUTO		BIT(1)
> +#define MAX30210_TEMP_DATA_REG			0x2B
> +#define MAX30210_TEMP_SLOPE_REG			0x2D
> +#define MAX30210_UNIQUE_ID_REG			0x30
> +#define MAX30210_PART_ID_REG			0xFF
> +
> +#define MAX30210_PART_ID			0x45
> +#define MAX30210_FIFO_SIZE			64
> +#define MAX30210_FIFO_BYTES_PER_SAMPLE		3
> +#define MAX30210_FIFO_TEMP_MASK			GENMASK(15, 0)
> +#define MAX30210_FIFO_INVAL_DATA		GENMASK(23, 0)
> +#define MAX30210_WATERMARK_DEFAULT		(0x40 - 0x1F)
> +
> +#define MAX30210_UNIQUE_ID_LEN			6
> +#define MAX30210_EXT_CVT_FREQ_MIN		1
> +#define MAX30210_EXT_CVT_FREQ_MAX		20
> +
> +struct max30210_state {
> +	struct regmap *regmap;
> +	/* Raw FIFO byte buffer */
> +	u8 fifo_buf[MAX30210_FIFO_BYTES_PER_SAMPLE * MAX30210_FIFO_SIZE];
> +	/* Protects autoconv_users and the autonomous-conversion enable bit */
> +	struct mutex lock;
> +	unsigned int autoconv_users;
> +	u8 watermark;

Does pahole agree with this layout?

> +};
> +
> +static const int max30210_samp_freq_avail[][2] = {
> +	{ 0, 15625 },
> +	{ 0, 31250 },
> +	{ 0, 62500 },
> +	{ 0, 125000 },
> +	{ 0, 250000 },
> +	{ 0, 500000 },
> +	{ 1, 0 },
> +	{ 2, 0 },
> +	{ 4, 0 },
> +	{ 8, 0 },
> +};
> +

...

> +static int max30210_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan, int *val,

Small nit, but ideally have val, val2 and mask on the same line for
readability reasons. This goes for all instances of this in the driver.

> +			     int *val2, long mask)
> +{
> +	struct max30210_state *st = iio_priv(indio_dev);
> +	unsigned int uval;
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		*val = 5;
> +		*val2 = MILLI;
> +
> +		return IIO_VAL_FRACTIONAL;
> +	case IIO_CHAN_INFO_SAMP_FREQ: {
> +		unsigned int period;
> +
> +		ret = regmap_read(st->regmap, MAX30210_TEMP_CONF_2_REG, &uval);
> +		if (ret)
> +			return ret;
> +
> +		period = FIELD_GET(MAX30210_TEMPCONF2_TEMP_PERIOD_MASK, uval);
> +
> +		/*
> +		 * TEMP_PERIOD is an index into the sampling frequency lookup
> +		 * table. Clamp in case the register holds a reserved value.
> +		 */
> +		if (period >= ARRAY_SIZE(max30210_samp_freq_avail))
> +			period = ARRAY_SIZE(max30210_samp_freq_avail) - 1;
> +
> +		*val = max30210_samp_freq_avail[period][0];
> +		*val2 = max30210_samp_freq_avail[period][1];
> +
> +		return IIO_VAL_INT_PLUS_MICRO;
> +	}

...

> +
> +static int max30210_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct iio_dev *indio_dev;
> +	struct max30210_state *st;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	st = iio_priv(indio_dev);
> +	mutex_init(&st->lock);

devm_mutex_init() + check return value.

> +
> +	ret = devm_regulator_get_enable(dev, "vdd");
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to enable vdd regulator.\n");
> +
> +	st->regmap = devm_regmap_init_i2c(client, &max30210_regmap);
> +	if (IS_ERR(st->regmap))
> +		return dev_err_probe(dev, PTR_ERR(st->regmap),
> +				     "Failed to allocate regmap.\n");
> +
> +	st->watermark = MAX30210_WATERMARK_DEFAULT;
> +
> +	ret = max30210_setup(st, dev);
> +	if (ret)
> +		return ret;
> +
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->channels = &max30210_channel;
> +	indio_dev->num_channels = 1;
> +	indio_dev->name = "max30210";
> +	indio_dev->info = &max30210_info;
> +
> +	/* Without an interrupt there is no way to drain the FIFO into the buffer */
> +	if (client->irq) {
> +		ret = devm_iio_kfifo_buffer_setup_ext(dev, indio_dev, &max30210_buffer_ops,
> +						      max30210_fifo_attributes);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = devm_iio_device_register(dev, indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	if (!client->irq)
> +		return 0;
> +
> +	/*
> +	 * Request the IRQ after registering the IIO device so devm tears it
> +	 * down first on removal, before the event interface is freed.
> +	 */
> +	return devm_request_threaded_irq(dev, client->irq, NULL,
> +					 max30210_irq_handler, IRQF_ONESHOT,
> +					 indio_dev->name, indio_dev);
> +}
> +
> +static const struct i2c_device_id max30210_id[] = {
> +	{ "max30210" },

C99 initializers please.

-- 
Kind regards,
Joshua Crofts
