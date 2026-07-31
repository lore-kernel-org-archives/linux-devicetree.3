Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99143384CC4
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 09:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785490076; cv=none; b=skxrQgSJocYzyBSZQ3sH4ztnZxBWklDDYm3zKQSaqZ1pk1PCRD7aa8cmMzxTFknoxE3t6XFIwdzydRUVCUzZTDoTQhM4T/7ckB/18nqpRx+ex7txlOb6wFfUa8EimZoTxtTvDgQaOiL0WQp8yzvxfTtNJuZtmNlU55aT0edt6g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785490076; c=relaxed/simple;
	bh=dBojC7m5k/Eu43d4+BU6RkpF01KtlM3p+/LRHXcKrj4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W21LXrEf/xpqPM2uB3acWSCYWcFnSdsco7DQsJQgxDOEw4tTfW81dNbqUtutfYk8UGzfAKb368MvbpEsaEQXs9YmE55i0/te1sUPkkzbABn1Vy2DhPdQnENK7S7vaKbpI7UMWacQZF7ew2tJlS0BzbiqPuKE0BV3CUbAcE1cJHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HG2kuDy3; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HG2kuDy3"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47640541585so543770f8f.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 02:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785490073; x=1786094873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PZORN38XTqAyT6yavuiE6bLcxUPHB4t2R8mGewp+hEc=;
        b=HG2kuDy3UzdkEycoS03KobV0ML6hz/O253BU2oDRbgo5HoiPfGFgG7e5t6LfDPfTza
         b3dHNcOojgDE6CGL8r5glvSUANW+0HXpaToCvwqFYiPMgk6C7naetMojgBV6fdS05q9A
         4ILn3CTBiMrZRMrtbO69rX4cpNp4Vl/nlyuuAFg2fbQ6TZqiZvMlXiyPXiwJasPlGsMf
         LStvc43u6tDC8GFGrFokds0f1OyXtRcbEy9yLYBmGcJx9EqwWnUbNatNmg2Tgf2Ox00Y
         G63UxBansWTst3BrAgJJNHGlXn2aS9D3qI2FUUwywVwHLw3L6hrapfT8sU4NC5WmdJmt
         gLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785490073; x=1786094873;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZORN38XTqAyT6yavuiE6bLcxUPHB4t2R8mGewp+hEc=;
        b=lDhKp6M4OhZvI3GhkCswuzsoI8uBOaO9ZqWoA+tr0q7AleSjO4WDnI9CLWzELD2s6i
         DPdEjBnKV4PUC6Mlm0Ta2QR/EuqwdaEXxIlBxSiSyDtEUUy5f3Wj6AxZPHPbJshie36Y
         LiwOL2GSoJl98Dq0yW1y9L64Eq+anrLk9HK9C0YcnfoGyWsY9PuEOC2J1rBCbiRXpBv4
         Fq8efNYqkeXAWvtXkSxAE0bDDnHwpNsu16Ei1kPCEEPTlA38sW2XmZmPnXsKbwke+m2I
         04m2k4PBc6CSAJ9zs/36KDavBdzfFSMczvrLYfjOSQnsPRk1FtAT7KX95PhGjvYXc54O
         0ZdA==
X-Forwarded-Encrypted: i=1; AHgh+RoCzJ3ZzbyZHcBqjVI0/pGI06qGILzfbNLo3k2iWae+0dFw77vmOXmzFGzrstx6JZecbEk7zDeSNHDm@vger.kernel.org
X-Gm-Message-State: AOJu0YwmVYRISkwbhBTGcImY/T5bzZyITit0nLN9NfqWOEcM+Usf7v6k
	zBiDCGj7DpQOic8ytlK2jqhxlFDBEZLSUv9VClQABwfbq/2oPLvMc0ay
X-Gm-Gg: AR+sD12YYOyyXSeGq/3UMtAfYEgMX2A818UaZlae+rCW7eMwjex0z7/WL2iQFyE1zn4
	0lzQFuxqTDMwHNRUu125ldx71nKJrO/m8/AVGSsLKLfsS6raYOmCfVOBy52PGdCnt+Qxd7IP+aU
	6KAIgy7adniFMhTJ+mbvkcsW8zD6lOB6i9dq56MaHZRbgG2mkLca5zbmypwBMUUDvsCoaPtHD6H
	oBNe5IZ8J1nDnErBmndaNJZ9bA7WTkn6mnKcwCK4CusmJaz0AJzN917sI0OBKSKA1uMVmccsdGP
	CFS6oATKCF92x+qqBEZo2L5PAaCnZwSlp6Tes0Sc4NiDwDyxsUO70ONsuHB8cwxnjEoqPUrgeCR
	FmYaK3kTWwMjAWTjqBC8sraKH0p4HCH/Im8uxEOUohuehBK9RxXjJ7YgK1bjJl+j2k+R2yPvGrF
	vY5ml0CejhHx2N06LhGbShoM+fvjOrKfLU6A+1OfpzRRgcOscIYJV36R0/biHXpbZoXFjxSWxaQ
	mcWAweHt8JtXlkCC0r8zgltYeWrQjvY4sZVkHA5yRt9/sRbtsmsh6uaoFcsthpuZnmAHkgAq89I
	rGPg0n0XmYMHLMDdjHzPqt8aoTn827iUjhrJvr1m2H1GpVUeZ4DKei6mb++dQZzX3qp2uIvKDXb
	4PZMmtw5R8Ssx6Fw78ug0W8PQWcalhUBOPzOKayIu52gaLpjUfEWnhzRVUSN1aYH4YlY0W5vm7y
	+QXm7+6Q==
X-Received: by 2002:a05:6000:4006:b0:47f:853d:476d with SMTP id ffacd0b85a97d-47fd2ab7961mr3299769f8f.10.1785490072616;
        Fri, 31 Jul 2026 02:27:52 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458bb4esm2904074f8f.30.2026.07.31.02.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 02:27:52 -0700 (PDT)
Date: Fri, 31 Jul 2026 11:27:50 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads112c04: Add support for TI
 ADS112C04
Message-ID: <20260731112750.00002c37@gmail.com>
In-Reply-To: <20260731-ti-ads112c04-driver-v2-2-aab0168c3c01@gmail.com>
References: <20260731-ti-ads112c04-driver-v2-0-aab0168c3c01@gmail.com>
	<20260731-ti-ads112c04-driver-v2-2-aab0168c3c01@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 31 Jul 2026 10:58:25 +0800
Kyle Hsieh <kylehsieh1995@gmail.com> wrote:
> diff --git a/drivers/iio/adc/ti-ads112c04.c b/drivers/iio/adc/ti-ads112c04.c
> new file mode 100644
> index 000000000000..28d3be81934f
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads112c04.c

Hi Kyle, quick review from me, comments inline. Additionally, please
check Sashiko's review as there are some move severe issues (mostly
I2C stuff), see it here:
https://sashiko.dev/#/patchset/20260731-ti-ads112c04-driver-v2-0-aab0168c3c01%40gmail.com

> @@ -0,0 +1,378 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Texas Instruments ADS112C04 16-bit I2C ADC driver
> + * Based on TI Reference Code and standard Linux IIO framework.

Usually we'd add a Copyright (c) 2026 your_name_here your_email_here
and maybe a datasheet link for easy lookup.

> + */
> +
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/mutex.h>

Please sort your headers alphabetically.

> +#include <linux/iio/iio.h>
> +#include <linux/iio/sysfs.h>

Group <linux/iio/*> headers separately and add them after the generic
<linux/*> headers.

> +#include <linux/regulator/consumer.h>
> +#include <linux/bitfield.h>
> +#include <linux/iopoll.h>
> +#include <linux/property.h>
> +#include <linux/gpio/consumer.h>

Additionally, you're missing jiffies.h, err.h, bitops.h, types.h

> +/* ADS112C04 Commands */

Unnecessary comment IMO, it's clear that these are commands from the
*_CMD_* part (same goes for your registers comment).

> +#define ADS112C04_CMD_RESET         0x06
> +#define ADS112C04_CMD_START_SYNC    0x08
> +#define ADS112C04_CMD_POWERDOWN     0x02
> +#define ADS112C04_CMD_RDATA         0x10
> +#define ADS112C04_CMD_RREG(reg)     (0x20 | ((reg) << 2))
> +#define ADS112C04_CMD_WREG(reg)     (0x40 | ((reg) << 2))
> +
> +/* Registers */
> +#define ADS112C04_REG_CONFIG0       0x00
> +#define ADS112C04_REG_CONFIG1       0x01
> +#define ADS112C04_REG_CONFIG2       0x02
> +#define ADS112C04_REG_CONFIG3       0x03
> +
> +#define ADS112C04_DRDY_MASK         BIT(7)
> +#define ADS112C04_MUX_MASK          GENMASK(7, 4)
> +
> +struct ads112c04_state {
> +	struct i2c_client *client;
> +	/* Protects concurrent ADC reads and device configuration */
> +	struct mutex lock;
> +	struct completion completion;
> +	struct regulator *vref_reg;
> +	int vref_mv;

vref_mV, this is a good exception to the no camelCase rule, as it's a SI
unit.

> +	u8 config0;
> +	u8 config1;
> +};
> +
> +static int ads112c04_write_cmd(struct i2c_client *client, u8 cmd)
> +{
> +	int ret = i2c_master_send(client, &cmd, 1);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int ads112c04_read_reg(struct i2c_client *client, u8 reg, u8 *val)
> +{
> +	u8 cmd = ADS112C04_CMD_RREG(reg);
> +	int ret;
> +
> +	ret = i2c_master_send(client, &cmd, 1);

i2c_master_send returns either the amount of bytes sent or an error
code. If the device NACKs, the function will return 0 (zero bytes sent)
but this will be interpreted as success.

> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_master_recv(client, val, 1);
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int ads112c04_write_reg(struct i2c_client *client, u8 reg, u8 val)
> +{
> +	u8 buf[2] = { ADS112C04_CMD_WREG(reg), val };
> +	int ret;
> +
> +	ret = i2c_master_send(client, buf, 2);

Use sizeof, don't hardcode the buffer sizes.

> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int ads112c04_wait_for_data(struct ads112c04_state *st)
> +{
> +	int ret;
> +	u8 val;
> +
> +	if (st->client->irq > 0) {
> +		ret = wait_for_completion_timeout(&st->completion, msecs_to_jiffies(1000));
> +		if (!ret)
> +			return -ETIMEDOUT;
> +		return 0;
> +	}
> +
> +	return read_poll_timeout(ads112c04_read_reg, ret,
> +				 (ret < 0 || (val & ADS112C04_DRDY_MASK)),
> +				 1000, 1000000, false,

Sashiko points out that read_poll_timeout discards any I2C read errors and returns
0. Remove the ret < 0 condition.

> +				 st->client, ADS112C04_REG_CONFIG2, &val);
> +}
> +
> +static int ads112c04_read_data(struct ads112c04_state *st, int *val)
> +{
> +	u8 cmd = ADS112C04_CMD_RDATA;
> +	__be16 buf;
> +	int ret;
> +
> +	ret = i2c_master_send(st->client, &cmd, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_master_recv(st->client, (u8 *)&buf, 2);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = sign_extend32(be16_to_cpu(buf), 15);
> +	return 0;
> +}
> +
> +static int ads112c04_get_adc_result(struct ads112c04_state *st,
> +				    struct iio_chan_spec const *chan,
> +				    int *val)
> +{
> +	int ret;
> +	u8 mux, new_config0;

Reverse xmas tree order please.
> +
> +	mux = FIELD_PREP(ADS112C04_MUX_MASK, chan->address);
> +	new_config0 = (st->config0 & 0x0F) | mux;
> +
> +	if (st->config0 != new_config0) {
> +		ret = ads112c04_write_reg(st->client, ADS112C04_REG_CONFIG0, new_config0);
> +		if (ret < 0)
> +			return ret;
> +		st->config0 = new_config0;
> +	}
> +
> +	reinit_completion(&st->completion);
> +
> +	ret = ads112c04_write_cmd(st->client, ADS112C04_CMD_START_SYNC);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ads112c04_wait_for_data(st);
> +	if (ret < 0)
> +		return ret;
> +
> +	return ads112c04_read_data(st, val);
> +}
> +
> +static int ads112c04_read_raw(struct iio_dev *indio_dev,
> +			      struct iio_chan_spec const *chan,
> +			      int *val, int *val2, long mask)
> +{
> +	struct ads112c04_state *st = iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		mutex_lock(&st->lock);
> +		ret = ads112c04_get_adc_result(st, chan, val);
> +		mutex_unlock(&st->lock);
> +
> +		if (ret < 0)
> +			return ret;
> +		return IIO_VAL_INT;
> +
> +	case IIO_CHAN_INFO_SCALE:
> +		*val = st->vref_mv;
> +		*val2 = 15;
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static irqreturn_t ads112c04_irq_handler(int irq, void *private)
> +{
> +	struct iio_dev *indio_dev = private;
> +	struct ads112c04_state *st = iio_priv(indio_dev);
> +
> +	complete(&st->completion);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct iio_info ads112c04_info = {
> +	.read_raw = ads112c04_read_raw,
> +};
> +
> +static void ads112c04_regulator_disable(void *data)
> +{
> +	regulator_disable(data);
> +}
> +
> +static int ads112c04_parse_channels(struct iio_dev *indio_dev)
> +{
> +	struct device *dev = indio_dev->dev.parent;
> +	struct iio_chan_spec *channels;
> +	u32 num_channels, i = 0, pair[2];
> +
> +	num_channels = device_get_named_child_node_count(dev, "channel");
> +	if (!num_channels)
> +		return -EINVAL;
> +
> +	channels = devm_kcalloc(dev, num_channels, sizeof(*channels), GFP_KERNEL);
> +	if (!channels)
> +		return -ENOMEM;
> +
> +	device_for_each_named_child_node_scoped(dev, child, "channel") {
> +		struct iio_chan_spec *spec = &channels[i];
> +
> +		spec->type = IIO_VOLTAGE;
> +		spec->indexed = 1;
> +		spec->info_mask_separate = BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE);
> +		spec->scan_index = i;
> +
> +		if (fwnode_property_present(child, "single-channel")) {
> +			fwnode_property_read_u32(child, "single-channel", &pair[0]);

The return value of fwnode_property_read_u32 isn't checked, meaning that
pair[0] will contain stack garbage.

> +			spec->channel = pair[0];
> +			spec->differential = 0;
> +			spec->address = 0x08 + pair[0];
> +		} else if (fwnode_property_present(child, "diff-channels")) {
> +			fwnode_property_read_u32_array(child, "diff-channels", pair, 2);
> +			spec->channel = pair[0];
> +			spec->channel2 = pair[1];
> +			spec->differential = 1;
> +
> +			if (pair[0] == 0 && pair[1] == 1)
> +				spec->address = 0x00;
> +			else if (pair[0] == 0 && pair[1] == 2)
> +				spec->address = 0x01;
> +			else if (pair[0] == 0 && pair[1] == 3)
> +				spec->address = 0x02;
> +			else if (pair[0] == 1 && pair[1] == 0)
> +				spec->address = 0x03;
> +			else if (pair[0] == 1 && pair[1] == 2)
> +				spec->address = 0x04;
> +			else if (pair[0] == 1 && pair[1] == 3)
> +				spec->address = 0x05;
> +			else if (pair[0] == 2 && pair[1] == 3)
> +				spec->address = 0x06;
> +			else if (pair[0] == 3 && pair[1] == 2)
> +				spec->address = 0x07;
> +			else
> +				return -EINVAL;
> +		} else {
> +			return -EINVAL;
> +		}
> +		i++;
> +	}
> +
> +	indio_dev->channels = channels;
> +	indio_dev->num_channels = num_channels;
> +
> +	return 0;
> +}
> +
> +static int ads112c04_probe(struct i2c_client *client)
> +{
> +	struct iio_dev *indio_dev;
> +	struct ads112c04_state *st;
> +	struct gpio_desc *reset_gpio;

Reverse xmas tree order here as well.

> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*st));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	st = iio_priv(indio_dev);
> +	st->client = client;
> +
> +	ret = devm_mutex_init(&client->dev, &st->lock);
> +	if (ret)
> +		return ret;
> +
> +	init_completion(&st->completion);
> +
> +	indio_dev->name = "ads112c04";
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->info = &ads112c04_info;
> +
> +	ret = ads112c04_parse_channels(indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_regulator_get_enable(&client->dev, "avdd");
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "failed to get avdd regulator\n");
> +
> +	ret = devm_regulator_get_enable(&client->dev, "dvdd");
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "failed to get dvdd regulator\n");
> +
> +	st->vref_reg = devm_regulator_get_optional(&client->dev, "refp");
> +	if (IS_ERR(st->vref_reg)) {
> +		ret = PTR_ERR(st->vref_reg);
> +		if (ret == -ENODEV) {
> +			st->vref_mv = 2048;
> +			st->config1 = 0x00;
> +		} else {
> +			return ret;
> +		}
> +	} else {
> +		ret = regulator_enable(st->vref_reg);
> +		if (ret)
> +			return ret;
> +
> +		ret = devm_add_action_or_reset(&client->dev, ads112c04_regulator_disable,
> +					       st->vref_reg);
> +		if (ret)
> +			return ret;
> +
> +		ret = regulator_get_voltage(st->vref_reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		st->vref_mv = ret / 1000;
> +		st->config1 = 0x02;
> +	}
> +
> +	reset_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(reset_gpio))
> +		return PTR_ERR(reset_gpio);
> +
> +	if (reset_gpio) {
> +		gpiod_set_value_cansleep(reset_gpio, 1);
> +		fsleep(1000);
> +		gpiod_set_value_cansleep(reset_gpio, 0);
> +	} else {
> +		ret = ads112c04_write_cmd(client, ADS112C04_CMD_RESET);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	fsleep(1000);

Why 1000? Add a comment that links to the datasheet or an explanation.

> +
> +	st->config0 = 0x01;
> +	ret = ads112c04_write_reg(client, ADS112C04_REG_CONFIG0, st->config0);
> +	if (ret)
> +		return ret;
> +
> +	ret = ads112c04_write_reg(client, ADS112C04_REG_CONFIG1, st->config1);
> +	if (ret)
> +		return ret;
> +
> +	if (client->irq > 0) {
> +		ret = devm_request_irq(&client->dev, client->irq,
> +				       ads112c04_irq_handler,
> +				       0,
> +				       indio_dev->name, indio_dev);
> +		if (ret) {
> +			dev_err(&client->dev, "Failed to request DRDY IRQ\n");
> +			return ret;

Just return ret, devm_request_irq() already prints an error message on
failure.

-- 
Kind regards,
Joshua Crofts
