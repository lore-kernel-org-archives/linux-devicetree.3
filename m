Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8702037DEBB
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 11:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363473; cv=none; b=LeS8U5GaX7Ck3hsom+gmlPtBSzoY2Q849EOXlG7dBIefBB4/7XOxZbDXwSgWhWV6Oa81H0C4L8DbcfMA//z6nbSzf2Qoz0TFmB/5I+Ptfe2a3sytmcvJDsRmQCilhQTX9wZPK3V1rARnoQH0fsSQan4zi/EIlxZLGyK34sUxhmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363473; c=relaxed/simple;
	bh=4hF1fxXaLOYiVNK23yMeOe3W3pKlAYlrHwf//yEFLSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlKVFqlXDoxuNMKtt2IxhJtYIM8X+BEqEVcagmKxfFB3nMwOe4xAVISULt+nHNHk2aIuCK9HNyDeFMNfoOpioTB0zgAL++hPh28FlGMSqK6dyLcqc7PX1NAtFXq3aUHjFg9CjQ9c4vAVECaP2ia1OvLUnyOxGp6WUGejUe6DZS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l3j+gC0h; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l3j+gC0h"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so70166855e9.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 04:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779363467; x=1779968267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iDgjFcUOKYKB1rIJbfksCjxidFcbcC0HjzZJ8UuOlEs=;
        b=l3j+gC0hN1R30WyW+bl+EfXzfLqAqjxduOK8CvFOQzpMu87qpG7XpWJ/qpTMclrVx2
         iTi5lDvHu80rp7Y8NECaT7qtsyg2QmTCZTbOV5KYtn+8ARk6kVIPTvPOm85Q/bZq88Al
         /WRjdIM2ILu8+dOX2ePpNEcA5oYqI7obj4eLeRWXm22ZSr1Ag10XV1jOCDZhAN37fcAp
         sjJSfeElZqS4HhtTIEVZgdIpMrp/YiEajFjVNch3AS9oHeuYnThKyWH60lN0tzVF15pH
         9NdOyhl8ZWAzy73TWLFuta3NXKu0BFjjsr14y3g27PFsabqvzshaGWerRkZtQ74GkceI
         fXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779363467; x=1779968267;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDgjFcUOKYKB1rIJbfksCjxidFcbcC0HjzZJ8UuOlEs=;
        b=SR1TlKbXanDfhh+m5h4BVY1EpoHcX+/NkSKdSCbcfQj9e7kSMrl3epmZJEopQkjfjo
         gSG06auXZsnZL0gR2S/zwihTYU3PQtVLXochnjLM5yZ6RqxF5aQF9kc3jg78ArB/V8cA
         2ca4ei4XnadgeQTD/P6iARAmfWAhEzpI1V688SPAvn0SgZmo1K5MFd7D2Pe7jmyefBve
         IzGDYuM6tGpWZx4t3SiMNyzy0+QfvtHAhMpKvc458oROeLLsh3ir6hk9sdsIqfvr6+Xq
         fsdRyDHfpB0/r3SUyrqP0sbI6Rt35u+6J5MwLldh8sanJs1ovamrfcxLUYHyn3EYCfbZ
         kgZg==
X-Forwarded-Encrypted: i=1; AFNElJ8hbW5xcziu1wZKEDn+AUNJIJyN3CqeIIW71YxD4CGiyqQGyYU3akb4n0TRk9NXdekr73e4/YGeWmF0@vger.kernel.org
X-Gm-Message-State: AOJu0YxjaPHfR/O4ewRVmii3Sy6ofbOLli8STVGJHm04qKwBMSRAjIjS
	Kifb79EqZtnz7tpijFtdYgRDcaV2DQhJ5tOnxwGCPc7DH+vRo0z0xiGXh8GiI/fZ9Sw=
X-Gm-Gg: Acq92OGa/MdfpHQCLXfcLUl18ykvuMgjpiIb3WHynS3m92y3aArijFa8eIqPPZBpZ9H
	0S+crKCJe/++1/ff28+/qaI/ftJmglAoVUwQ8ooaYArBSKmgYveLCfhJM4GsZpNXIkEOrbJNncM
	s9eRpEYdtUGl9OCX6y2CQu8qff8+CPv698W+4jLA3F1lH0Ve6Ihx9+N9v5jkxiwoQDvuYAzNgrX
	SZD73gtQX2U7xlefjDHBcP3n5ggeijnZGIs+yNeweKuBIaFp8rl9F2m90a2sZoWj7XF0ynqPouX
	ENftjcpFs8IViCnywYCc2C+t3mVuRmsZ+D9HWeuH463oqAGdswrsiEr28QTYrC/8jQorzBp3Og2
	D+Mi9XqPsMO4EhJs6OU4DUgEb6jD4YhnnZiaWLiRb+03BzzcNEazhSLK4I3HIw/DK/Wd096IvTU
	/JJXGLxep0JutFMspqEDczO32NLD8Uk0HH3rM3fq0XNuEcn0SBcjDjYKzWDp/uZhHzNqiBm6yIm
	oU+wlL1qFV/R0TlwEhOpVv7UA==
X-Received: by 2002:a05:600d:4441:20b0:490:3d49:a0ca with SMTP id 5b1f17b1804b1-4903d49a144mr8102365e9.29.1779363466466;
        Thu, 21 May 2026 04:37:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:fdc3:41fb:621:f792? ([2a01:e0a:106d:1080:fdc3:41fb:621:f792])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903c9b004csm12525195e9.6.2026.05.21.04.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 04:37:46 -0700 (PDT)
Message-ID: <84df7ffe-067b-4840-a99c-6d8a1172e0ef@linaro.org>
Date: Thu, 21 May 2026 13:37:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: sgm3804: add SGMicro SGM3804 charge-pump
 regulator driver
To: azkali.limited@gmail.com, Philippe Simons <simons.philippe@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260510-sgm3804-v1-0-e5e8799e0aa0@gmail.com>
 <20260510-sgm3804-v1-2-e5e8799e0aa0@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
Autocrypt: addr=narmstrong@baylibre.com; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwE0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAcLAXwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8g
In-Reply-To: <20260510-sgm3804-v1-2-e5e8799e0aa0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alexandre,

Le 10/05/2026 à 18:45, Alexandre Hamamdjian via B4 Relay a écrit :
> From: Alexandre Hamamdjian <azkali.limited@gmail.com>
> 
> Add a driver for the SGMicro SGM3804, an I2C-controlled positive and
> negative output charge-pump regulator. The chip is typically used to
> generate the AVDD/AVEE rails of display panels, and is for example
> present on the Ayaneo Pocket DS handheld where it powers the panel.
> 
> The driver exposes a single 5V regulator and uses two reset GPIOs to
> sequence the positive and negative outputs. Initialisation values for
> the charge-pump configuration registers are written on enable, and the
> GPIOs are dropped on disable.
> 
> Co-developed-by: Philippe Simons <simons.philippe@gmail.com>
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
>   drivers/regulator/Kconfig             |  11 +++
>   drivers/regulator/Makefile            |   1 +
>   drivers/regulator/sgm3804-regulator.c | 164 ++++++++++++++++++++++++++++++++++
>   3 files changed, 176 insertions(+)
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index d71dac9436e3..e1adb0bda75d 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1490,6 +1490,17 @@ config REGULATOR_SC2731
>   	  This driver provides support for the voltage regulators on the
>   	  SC2731 PMIC.
>   
> +config REGULATOR_SGM3804
> +	tristate "SGMicro sgm3804 voltage regulator"
> +	depends on I2C && OF
> +	help
> +	  This driver supports the SGMicro SGM3804 I2C-controlled positive
> +	  and negative output charge-pump regulator, commonly used to supply
> +	  AVDD/AVEE rails to display panels. Two reset GPIOs are used to
> +	  sequence the positive and negative outputs.
> +
> +	  Say M here to build the driver as a module called sgm3804-regulator.
> +
>   config REGULATOR_SKY81452
>   	tristate "Skyworks Solutions SKY81452 voltage regulator"
>   	depends on MFD_SKY81452
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 35639f3115fd..98ecbbc3c6b7 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -172,6 +172,7 @@ obj-$(CONFIG_REGULATOR_S2MPA01) += s2mpa01.o
>   obj-$(CONFIG_REGULATOR_S2MPS11) += s2mps11.o
>   obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
>   obj-$(CONFIG_REGULATOR_SC2731) += sc2731-regulator.o
> +obj-$(CONFIG_REGULATOR_SGM3804) += sgm3804-regulator.o
>   obj-$(CONFIG_REGULATOR_SKY81452) += sky81452-regulator.o
>   obj-$(CONFIG_REGULATOR_SLG51000) += slg51000-regulator.o
>   obj-$(CONFIG_REGULATOR_SPACEMIT_P1) += spacemit-p1.o
> diff --git a/drivers/regulator/sgm3804-regulator.c b/drivers/regulator/sgm3804-regulator.c
> new file mode 100644
> index 000000000000..c52f0596acf3
> --- /dev/null
> +++ b/drivers/regulator/sgm3804-regulator.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/of_regulator.h>
> +#include <linux/gpio/consumer.h>
> +
> +struct sgm3804_data {
> +	struct regmap *regmap;
> +	struct gpio_desc *reset_gpio[2];
> +	bool enabled;
> +};
> +
> +static const struct regmap_config sgm3804_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0x03,

The registers are only writable

> +};
> +
> +static int sgm3804_enable(struct regulator_dev *rdev)
> +{
> +	struct sgm3804_data *data = rdev_get_drvdata(rdev);
> +	struct regmap *regmap = data->regmap;
> +	int ret = 0;
> +
> +	/* Set reset GPIO high to enable the device if available */
> +	if (data->reset_gpio[0])
> +		gpiod_set_value_cansleep(data->reset_gpio[0], 1);
> +
> +	if (data->reset_gpio[1])
> +		gpiod_set_value_cansleep(data->reset_gpio[1], 1);
> +
> +	ret |= regmap_write(regmap, 0x00, 0x0c);
> +	ret |= regmap_write(regmap, 0x01, 0x0c);

According to the spec, writing C enables 5.2V on both outputs.

> +	ret |= regmap_write(regmap, 0x03, 0x03);

And this enables the rail discharge on both outputs

> +	if (ret) {
> +		dev_err(rdev->dev.parent,
> +			"Failed to enable SGM3804 regulator\n");
> +		return ret;
> +	}
> +
> +	data->enabled = true;
> +	return 0;
> +}
> +
> +static int sgm3804_disable(struct regulator_dev *rdev)
> +{
> +	struct sgm3804_data *data = rdev_get_drvdata(rdev);
> +
> +	if (data->reset_gpio[0])
> +		gpiod_set_value_cansleep(data->reset_gpio[0], 0);
> +
> +	if (data->reset_gpio[1])
> +		gpiod_set_value_cansleep(data->reset_gpio[1], 0);
> +
> +	data->enabled = false;
> +	return 0;
> +}
> +
> +static int sgm3804_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct sgm3804_data *data = rdev_get_drvdata(rdev);
> +
> +	return data->enabled;

This should use the gpio status instead

> +}
> +
> +static int sgm3804_get_voltage(struct regulator_dev *rdev)
> +{
> +	return 5000000;

So this is wrong

> +}
> +
> +static const struct regulator_ops sgm3804_ops = {
> +	.enable = sgm3804_enable,
> +	.disable = sgm3804_disable,
> +	.is_enabled = sgm3804_is_enabled,
> +	.get_voltage = sgm3804_get_voltage,
> +};
> +
> +static const struct regulator_desc sgm3804_reg = {
> +	.name = "SGM3804",
> +	.id = 0,
> +	.ops = &sgm3804_ops,
> +	.type = REGULATOR_VOLTAGE,
> +	.n_voltages = 1,
> +	.min_uV = 5000000,
> +	.owner = THIS_MODULE,
> +};

This IC supports programming both outputs independently from
2,4V to 5,5v and the discharge rail enable is configurable.

My implementation handles all that:
https://lore.kernel.org/all/20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-2-7495e7905693@linaro.org/

> +
> +static int sgm3804_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct device *dev = &i2c->dev;
> +	struct regulator_config config = {};
> +	struct regulator_dev *rdev;
> +	struct sgm3804_data *data;
> +	int error;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = devm_regmap_init_i2c(i2c, &sgm3804_regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return dev_err_probe(dev, PTR_ERR(data->regmap),
> +				     "failed to init regmap\n");
> +
> +	/* Get reset-gpio from device tree */
> +	data->reset_gpio[0] =
> +		devm_gpiod_get_index(dev, "reset", 0, GPIOD_OUT_HIGH);
> +	if (IS_ERR(data->reset_gpio[0]))
> +		return dev_err_probe(dev, PTR_ERR(data->reset_gpio[0]),
> +				     "failed to get first reset GPIO\n");
> +
> +	data->reset_gpio[1] =
> +		devm_gpiod_get_index(dev, "reset", 1, GPIOD_OUT_HIGH);
> +	if (IS_ERR(data->reset_gpio[1]))
> +		dev_warn(dev, "failed to get second reset GPIO\n");
> +
> +	config.dev = dev;
> +	config.regmap = data->regmap;
> +	config.driver_data = data;
> +	config.of_node = dev->of_node;
> +	config.init_data =
> +		of_get_regulator_init_data(dev, dev->of_node, &sgm3804_reg);
> +	if (!config.init_data)
> +		return -ENOMEM;
> +	data->enabled = false;
> +	rdev = devm_regulator_register(dev, &sgm3804_reg, &config);
> +	if (IS_ERR(rdev)) {
> +		error = PTR_ERR(rdev);
> +		dev_err(dev, "Failed to register SGM3804 regulator: %d\n",
> +			error);
> +		return error;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id sgm3804_i2c_id[] = { { "sgm3804" }, {} };
> +MODULE_DEVICE_TABLE(i2c, sgm3804_i2c_id);
> +
> +static const struct of_device_id sgm3804_i2c_of_match[] = {
> +	{ .compatible = "sgmicro,sgm3804" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, sgm3804_i2c_of_match);
> +
> +static struct i2c_driver sgm3804_regulator_driver = {
> +	.driver = {
> +		.name = "sgm3804",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +		.of_match_table = sgm3804_i2c_of_match,
> +	},
> +	.probe = sgm3804_i2c_probe,
> +	.id_table = sgm3804_i2c_id,
> +};
> +
> +module_i2c_driver(sgm3804_regulator_driver);
> +
> +MODULE_DESCRIPTION("SGMicro sgm3804 regulator Driver");
> +MODULE_AUTHOR("Kancy Joe <kancy2333@outlook.com>");

This driver was originally written by Kancy Joe, and I derived my implementation
from the exact same driver, and I kept his authorship & Copyright and
he agreed to me I take over his driver to upstream a complete implementation.

Neil

> +MODULE_LICENSE("GPL");
> 

