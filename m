Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282B8377EC6
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 22:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781734740; cv=none; b=tWN9BKfvxcd1k7IjQAzfoX16POZcYDYMZebQufr5dYvr1XO3yiRO6HFsWsWhXFrp4mrDskX7NmJQUpdNw0G5OXiQEwG54BpT7WvVSrNzV14aj35m0ctSkQ4bpyTBWw2htYcau08K0en1JNXx8F9CQFhMTEAxXmCu3QP87ojp5GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781734740; c=relaxed/simple;
	bh=XmadC3jjanZdVIoOxf4obLCYzmNZJcjJ+JmN4lZXX2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2IbjTAU3ioc0dQ6JjqY3HuUCY9uytD9FN6+CZT8WaivAX/WzJ/XlRGfSb6092nUc81Yy6a7jK4zoV32WImcegbtH7UY6WLnnEfYaogF3Nx6lPJ0BG9UlZfKgnvV/dwHX4f588AxAW5uD96zTdfWFFxN8aClfLFh1ebFssOg430=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bAUxOWgw; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bAUxOWgw"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-69e4af5a411so232916eaf.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781734737; x=1782339537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tGSAX6SJosLEq+XA2blfrGkbQdqeFnb2GRKEkQRBDgI=;
        b=bAUxOWgw91upVyTIEAktPhs+3CG9KDH9rCtsXfq4eI2WaQ7RSacCWVcOst4F4sFg8S
         JosD5u4EXlW9YOO1kCOnuII1ybMTtwpSAIUqKcskXdbHcAuW1Bsjg8qjEmdr9OmhMYLw
         mtnwnOyPiIOaN1UHz6tPLrJcKPAPswQqvbO9GUfy5kCDUaouhK/mXUBYneFlKKnhckK5
         jTbsj0pGdgrPIFnGzkqsCeoVM76DgzatudNjMqcnPUwx16G8X5O9/yu8OP+DCCq2JBcq
         mhPT9hUUfve5KjxcOWDCKKwDQAQsJIs3Fz7ChQ8CY0ufNmvKA+W8Zz8d2yESKRzcoCZ9
         CGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781734737; x=1782339537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGSAX6SJosLEq+XA2blfrGkbQdqeFnb2GRKEkQRBDgI=;
        b=VZiDzGhJGhYTYlAHNd57Yey/HMj4wrI0ZfPo8/T6DdowN+aaMIML2H6hWL8ne/AAaP
         jvdbAQ+rpxd9OIlpGwlLmz2cgZFb2aPZpAHEDSya/d/7xaA9DswiVJMd9ArANtfPbPEc
         MSOPN1sT9KMZf6f08IrjT3xzEW5rucxtWa3CgUVVWgLJTNl8Mqw4B9t+oyZbQblmSSlr
         nc0StGyWRsJpWU+jH/8xnrdRpnlhE5/0JOCWsuMdiim5avyzGg7ynbi4rd4R4nMMY7GI
         B6ALnPwow3z8ouBkr3o+hZenT6M0ftUWzWjJSKlqpHXWbp7zAmDDiiv4+KaZdI8ikdA0
         F/8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/7Y23a0f834YIABilMIlOG/JGVZ5uKmdJHrf3D8fNkolQ57z3tLe6qb+AKmFRG/JFQjrDBsM/A8svI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+4iJZ9LxMc9/0hJAcVoCW1uL86dQeDrr1FqqqVyo0hYAWnSKc
	EMBunkk6hQKceZZwu0mF6ft7Q+3VanwpTckKaEO0Z5DrCbK+mdx/cpn9oM38x9tgVH0=
X-Gm-Gg: Acq92OF0RnEhXSfGz2H9UfiwltkQEEXZwRFUT5v016zshNr0+Ygw9UrE7/swT6o9+wc
	OI9KsLvoKnvoFHQz2F+Yl9Db9tWaQ1oFA3m/DAYqY0Kel79ErIqovoTTvBhi1Dozrgic7tNEJbu
	LDzp213Np6K4FcvuKmPDPd1IFZKQd4Aefig4zzuNdE5f2mkAjnWGoKBguPN5TEKZgevMyt2UDTj
	MCy8wXARDtQCBR+EeAr8uE3TllWsbxqqihWM8o3GtvLsV3sSx2CKab9FfWcN2VRIcita0nLHQpT
	ZQF0AXHLV3gNkxjA6Yy7O6Q6XMeJe9ASxqHeFaPwycJqPlBL6Eh6UfhHDnRWnSg9cCxV8HvrzBP
	O+avpWmUlM01iLqcmGkosF8tnQiUc4jYQcm8Iw0JPc29ADCEJ6Kle7t/cia2NO2eN8joYHFp5aq
	+T6BDo496Hmu4qMLNz8zdV1FFm1Sreux29cAh5TCh9jJC6lz44K20j7e1clGSJJAo=
X-Received: by 2002:a05:6820:80c8:b0:69e:4008:13e4 with SMTP id 006d021491bc7-6a0c75f70a9mr1066623eaf.17.1781734737030;
        Wed, 17 Jun 2026 15:18:57 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:9458:d356:778c:22ac? ([2600:8803:e7e4:500:9458:d356:778c:22ac])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69f00d609e9sm7325069eaf.7.2026.06.17.15.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 15:18:56 -0700 (PDT)
Message-ID: <caa0e48d-ed13-4aec-96d9-9be88e6cb79a@baylibre.com>
Date: Wed, 17 Jun 2026 17:18:55 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] iio: adc: ltc2378: Add support for LTC2378-20 and
 similar ADCs
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 pop.ioan-daniel@analog.com, marcelo.schmitt1@gmail.com
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <5c18e7a370119ddfd5faefe147b294b39f78894a.1781661028.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <5c18e7a370119ddfd5faefe147b294b39f78894a.1781661028.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/26 9:03 PM, Marcelo Schmitt wrote:
> Support for LTC2378-20 and similar analog-to-digital converters.
> 

...

> +static int ltc2378_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct iio_dev *indio_dev;
> +	struct ltc2378_state *st;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	st = iio_priv(indio_dev);
> +	st->spi = spi;
> +
> +	ret = devm_regulator_get_enable_read_voltage(dev, "ref");
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to read ref regulator\n");
> +
> +	st->ref_uV = ret;

add blank line here

> +	st->info = spi_get_device_match_data(spi);
> +	if (!st->info)
> +		return -EINVAL;
> +
> +	indio_dev->name = st->info->name;
> +	indio_dev->info = &ltc2378_iio_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +
> +	st->cnv_gpio = devm_gpiod_get(dev, "cnv", GPIOD_OUT_LOW);
> +	if (IS_ERR(st->cnv_gpio))
> +		return dev_err_probe(dev, PTR_ERR(st->cnv_gpio),
> +				     "failed to get CNV GPIO");
> +
> +	st->num_iio_chans = 0;
> +	st->chans[st->num_iio_chans++] = (struct iio_chan_spec) {

Why can't we make this static const (part of chip info) like we do in most
drivers?

> +		.type = IIO_VOLTAGE,
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),
> +		.scan_index = 0,
> +		.scan_type = {
> +			.format = st->info->bipolar ? IIO_SCAN_FORMAT_SIGNED_INT :
> +						      IIO_SCAN_FORMAT_UNSIGNED_INT,
> +			.realbits = st->info->resolution,
> +			/*
> +			 * Buffer elements could be 16-bit for low precision
> +			 * parts. Though, using more storage bits allows keeping
> +			 * the same scan_type configuration for both types of
> +			 * buffer support.
> +			 */

Won't this make non-SPI offload buffered reads more complicated later?
I.e. have to shift the value or not before pushing to buffers depending
on CPU endianness.

> +			.storagebits = 32,
> +		},
> +	};
> +
> +	st->xfer.rx_buf = &st->scan.data;
> +	st->xfer.len = st->info->resolution > 16 ? 4 : 2;

Can use spi_bpw_to_bytes() here.

> +	st->xfer.bits_per_word = st->info->resolution;
> +
> +	indio_dev->channels = st->chans;
> +	indio_dev->num_channels = st->num_iio_chans;
> +
> +	return devm_iio_device_register(&spi->dev, indio_dev);
> +}
> +

...

> diff --git a/drivers/iio/adc/ltc2378.h b/drivers/iio/adc/ltc2378.h
> new file mode 100644
> index 000000000000..a3a69351de6c
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Analog Devices LTC2378 and similar ADCs common definitions and properties
> + * Copyright (C) 2026 Analog Devices, Inc.
> + * Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> + */
> +
> +#ifndef __DRIVERS_IIO_ADC_LTC2378_H__
> +#define __DRIVERS_IIO_ADC_LTC2378_H__
> +
> +#include <linux/iio/iio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/delay.h>
> +#include <linux/spi/spi.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +
> +#define LTC2378_TDSDOBUSYL_NS		5
> +#define LTC2378_TBUSYLH_NS		13
> +#define LTC2378_TCNV_HIGH_NS		20
> +
> +struct ltc2378_chip_info {
> +	const char *name;
> +	int resolution;
> +	bool bipolar;
> +};
> +
> +struct ltc2378_state {
> +	const struct ltc2378_chip_info *info;
> +	struct gpio_desc *cnv_gpio;
> +	struct spi_device *spi;
> +	struct spi_transfer xfer;
> +	unsigned int num_iio_chans;
> +	struct iio_chan_spec chans[2]; /* 1 physical chan + 1 timestamp chan */
> +	int ref_uV;
> +
> +	/*
> +	 * DMA (thus cache coherency maintenance) requires the
> +	 * transfer buffers to live in their own cache lines.
> +	 */
> +	struct {
> +		union {
> +			u16 sample_buf16;
> +			u32 sample_buf32;
> +		} data;
> +		aligned_s64 timestamp;
> +	} scan __aligned(IIO_DMA_MINALIGN);
> +};
> +
> +static inline int ltc2378_convert_and_acquire(struct ltc2378_state *st)
> +{
> +	int ret;
> +
> +	/* Cause a rising edge of CNV to initiate a new ADC conversion */
> +	gpiod_set_value_cansleep(st->cnv_gpio, 1);
> +	fsleep(4);
> +	ret = spi_sync_transfer(st->spi, &st->xfer, 1);
> +	gpiod_set_value_cansleep(st->cnv_gpio, 0);
> +
> +	return ret;
> +}
> +
> +#endif /* __DRIVERS_IIO_ADC_LTC2378_H__ */

Why do we need a header for this stuff? If there is a good reason
the commit message should explain it. Otherwise, it makes the driver
harder to read.


