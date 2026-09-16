Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA84381B1D
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567078; cv=none; b=VQWxfAkjNoI2L5lfLRQiRhUqATDIj4izxZ1rhtF9rpAFFthVw50SHrs1MCjJPA4Mt9LRNVqoPUC0C1n9lsmu3ywnclajX3g5ReGGAS+BsfKs4yqIxX7ItkHnj3aIAxlRMaTaRAVkE6CakxT+sH5js3ij2EGtjg4psNT0Cd83BzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567078; c=relaxed/simple;
	bh=RkjeHSdw7gboKv3TlXd5x7VQ4B/VUIfakNRO8/2kPEY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XSYILKPLt7zoGnrMrh8q3NInccmtZmdnjcjHao5R7U0wvrazwV7hp5Uf4H6HWKt4vLED9oIiM7cdhS9/lPiCiU6v83LU+r7jnpU8y545iOiICHqfY57AnBaiXgdlAtRdNPG1wV2suN1+Q/9sIwfELbOk8wniq+ybT2F+XGinJus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OIhDjWpU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OIhDjWpU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so5852765e9.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789567069; x=1790171869; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6NIqxABqSzbjUObGDoPenZLidHkyNOOkWfBJVH3qX0=;
        b=OIhDjWpUfggO2j59LNvH7ZYL448/O3nyWbtJem84h59UsMLO11KNGK5E4U3m+uL1SS
         8ac0PeHf8UvWoPuhRKbhJbF62EMyXr8tOrDlRlv0XVMDkhD5PzMtX6rkp9Cvpm5leJ1e
         uWYWPzDoZuPNwp2OtepztyJW33X/QfGmufkCSUOs/yFDYJViJ610K3NEyk4LvRs9PzDf
         USnVSedhZP+yX5hkfHqRLU4hCi937750901gdzSJEbgdWk6kuZ4Y5qy8408KIl4Ip3L+
         nrxWfimda3rWv5ayPa68chCrXurozU0jSRzcXn6WphFMy+5kX3pZfxyAC9UVKiRSmV4P
         VfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567069; x=1790171869;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6NIqxABqSzbjUObGDoPenZLidHkyNOOkWfBJVH3qX0=;
        b=PNENwRHSjlYwzpPMUEIfJ7HCX8p6R93+7w/UyEvOYA35DOHEsCyAcEG4/Ai8JlAVbt
         qsKurXJelb2OBdRdPturi3nZAj06U/sW+cvEomikQC5vPZN/oI5Gfl0OplbUqqZgwHeF
         nsZqkS2cvyM+qOmHcEqenkT898k9y/y69R+6tosEopiPGjC8y2NWKe7m8O05EDxnFrA/
         2M38wCfmxIIgBsJcBH4U4TFbkTOQJU8URv90wxXUdrs4rjNZdZ38Dj6yL/2uG8ykqdU5
         xm6/6HAq+zSXqM0ifg0dSCeKtV9KJ0+IYr+XgFEtpF0ocMg2c2C4gqFrAZCQnt6I8Wcf
         l46g==
X-Forwarded-Encrypted: i=1; AKwUvBwTLDEHWl6tJ+CNBTJM1T0K6xhpEgLKh4OCfLKhKC4Sxat6Y1JWUCmdzE4PrG7VcwUFs8d/gWz1qIwi@vger.kernel.org
X-Gm-Message-State: AFuF++nX/3//Nn2fmp2I8U0TRRx2GrBwaX8JCqJj9O9Bc1n8XVAWl/p+
	qFFAOVsHWJPL3xajuJuDCjbVHH7oHyKywG1PI+AaspH1a8yNpcYfuOiyGC5IscUpgQE=
X-Gm-Gg: AYBFou0tX8OkvuU4DRmqHvjLMcy8eL0uPPE9iCCl3qgSaFc5TRKSvpLNHrKoZomh4mB
	DmuLEaIReS80q6KKKBjik1R5e5eJrNQYy0LNvK8LKJgGDVO6BavOrlMOie+BDS8CKkQ4ZAsOPrF
	amg5IYUu7EQbeckbletaowpmZqRzmIcrqRmaJhzIKs2HBcNlC55rYP6/LZZehthsIPxGt66QnIH
	rXU6wHE5QXaVK+oRcan0hC8vMIEac1h5NyOHhfy6zvVCKWoznp5A+Q5q5wzJbfwzoFMSycsH99U
	JPKl2oEiNSCZqTQIWVyPy/QzDct3EdDHKDZRORlOWEruMzNE3MPzBFf/wCpPk1r1R7qFVq7Y/qt
	dBjkYp+daPvX777IwRVUAniz0WV4u49Ds0yYd5449urVjMrDkBzQY/x4wP/dU/d/1b0KkgGxQeF
	FvzMggdaAuNt5AdNH72VddGOmibSB+pK37i+YiKhQGGAixvw5sJi+Ufie2NrYTQwjPw90+X+HaE
	PUQ0pAkI4CCPIicjg==
X-Received: by 2002:a05:600c:1da8:b0:49c:fc6c:be09 with SMTP id 5b1f17b1804b1-49eb7345517mr33097655e9.32.1789567068836;
        Wed, 16 Sep 2026 06:57:48 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847fcb7dsm27771135e9.4.2026.09.16.06.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:57:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, Vyacheslav Yurkov via B4 Relay
 <devnull+V.Yurkov.EXT.bruker.com@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri
 Sarha <jsarha@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Subject: Re: [PATCH v5 2/2] clk: Add gpio-locked fixed clock driver
In-Reply-To: <e697d892-fbd2-432a-b71c-8547ead22ea0@gmail.com>
References: <20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com>
 <20260915-feature-clock-guard-v5-2-42ab5dc3a6aa@bruker.com>
 <1j33vaesh7.fsf@starbuckisacylon.baylibre.com>
 <e697d892-fbd2-432a-b71c-8547ead22ea0@gmail.com>
Date: Wed, 16 Sep 2026 15:57:46 +0200
Message-ID: <1jtsnpcn8l.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 15 sept. 2026 at 15:58, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> On 15.09.2026 12:09, Jerome Brunet wrote:
>> On mar. 15 sept. 2026 at 09:27, Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org> wrote:
>> 
>>> From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>>>
>>> A gpio-locked clock exposes a clock, which status is determined by a
>>> GPIO signal. The common use-case is a FPGA-assisted clocking design
>>> where peripheral clocks are generated by FPGA PLLs that are outside
>>> CPU control, with clock-valid/PLL-lock status exposed through GPIO signals.
>>> Consumers can use the output clock to wait until the input clock is locked
>>> and only then initialize dependent peripherals.
>>>
>> 
>> We already have gpio gate driver in drivers/clk/clk-gpio.c
>> 
>> It would be much better if you could just extend that one that take
>> optionally take a clock input like you do here.
>
> It is a bit more than that. The gated clock requires "enable-gpios" 
> property, while gpio-locked clock needs "locked-gpios". Technically I 
> could re-use the "enable-gpios", but that might lead to a confusion, 
> because semantically they are used for different purpose. Do you think 
> the extension of clk-gpio.c would be still better in this case?

Apologies, I've mis-read you initial submission.
Basically this is a read-only gate controlled by a gpio.

I think it still belongs in clk-gpio with its own ops, along with the
gate and mux that are already there.

enabled-gpio for the pin maybe ?

>
>>> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>>> ---
>>>   drivers/clk/Makefile          |   1 +
>>>   drivers/clk/clk-gpio-locked.c | 169 ++++++++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 170 insertions(+)
>>>
>>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>>> index b18af485d7f0..b904f292d683 100644
>>> --- a/drivers/clk/Makefile
>>> +++ b/drivers/clk/Makefile
>>> @@ -46,6 +46,7 @@ obj-$(CONFIG_CLK_FD_KUNIT_TEST) += clk-fractional-divider_test.o
>>>   obj-$(CONFIG_COMMON_CLK)	+= clk-gpio.o
>>>   ifeq ($(CONFIG_OF), y)
>>>   obj-$(CONFIG_COMMON_CLK)	+= clk-conf.o
>>> +obj-$(CONFIG_COMMON_CLK)	+= clk-gpio-locked.o

Drop every reference to locked ... this is very PLL oriented and the
driver you are proposing is more generic than that


>>>   endif
>>>   
>>>   # KUnit specific helpers
>>> diff --git a/drivers/clk/clk-gpio-locked.c b/drivers/clk/clk-gpio-locked.c
>>> new file mode 100644
>>> index 000000000000..b648f8763922
>>> --- /dev/null
>>> +++ b/drivers/clk/clk-gpio-locked.c
>>> @@ -0,0 +1,169 @@
>>> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +/*
>>> + * Clock Controller Guard Driver
>>> + *
>>> + * Copyright 2026 Bruker Corporation
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/device.h>
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/slab.h>
>>> +
>>> +/**
>>> + * struct gpio_locked_clk_priv - private state for the whole driver
>>> + * @dev:		platform device
>>> + *
>>> + * @input_clk	input clock
>>> + * @gpios:		input GPIO descriptor
>>> + *
>>> + * @output_hw_clk:      output clock HW descriptor
>>> + * @output_clock_name:  output clock name
>>> + */
>>> +struct gpio_locked_clk_priv {
>>> +	struct device *dev;
>>> +
>>> +	struct clk *input_clk;
>>> +	struct gpio_desc *gpios;
>>> +
>>> +	struct clk_hw output_hw_clk;
>>> +	const char *output_clock_name;
>>> +};
>>> +
>>> +#define to_gpio_locked_clk_priv(_hw) \
>>> +	container_of(_hw, struct gpio_locked_clk_priv, output_hw_clk)
>>> +
>>> +static int gpio_locked_clk_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct gpio_locked_clk_priv *priv = to_gpio_locked_clk_priv(hw);
>>> +
>>> +	int data = gpiod_get_value(priv->gpios);
>>> +
>>> +	if (data < 0) {
>>> +		dev_err(priv->dev, "Failed to get data gpio val: %d\n",
>>> +				data);
>>> +		return data;
>>> +	} else if (!data) {
>>> +		dev_warn(priv->dev, "GPIO is not ready");
>>> +		return -EBUSY;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/* We can't enable the clock, but the Common Clock Framework calls only
>>> + * enable() not is_enabled()
>>> + */
>>> +static int gpio_locked_clk_enable(struct clk_hw *hw)
>>> +{
>>> +	return gpio_locked_clk_is_enabled(hw);
>>> +}

You need to explain your problem a bit more because this is not OK. Your
clock should really just provide .is_enabled() AFAICT

>>> +
>>> +/* We have to implement it, but we are not going to control
>>> + * parent clock selection
>>> + */
>>> +static u8 gpio_locked_clk_get_parent(struct clk_hw *hw)
>>> +{
>>> +	return 0;
>>> +}

Same, I dont get why you need that. Not needed if there a single parent

>>> +
>>> +static const struct clk_ops gpio_locked_clk_ops = {
>>> +	.enable =	gpio_locked_clk_enable,
>>> +	.is_enabled =	gpio_locked_clk_is_enabled,
>>> +	.get_parent =	gpio_locked_clk_get_parent,
>>> +};
>>> +
>>> +static int gpio_locked_clk_parse_outputs(struct gpio_locked_clk_priv *priv)
>>> +{
>>> +	struct device *dev = priv->dev;
>>> +	struct device_node *np = dev->of_node;
>>> +	int ret;
>>> +
>>> +	of_property_read_string_index(np, "clock-output-names", 0,
>>> +		&priv->output_clock_name);
>>> +
>>> +	if (!priv->output_clock_name)
>>> +		priv->output_clock_name = dev_name(priv->dev);
>>> +
>>> +	priv->output_hw_clk.init =
>>> +		CLK_HW_INIT_FW_NAME(priv->output_clock_name,
>>> +				    __clk_get_name(priv->input_clk),

No, just put the name as it is in DT (input?) or go for index 0 possibly
?

No call to devm_clk_get_enabled() from this driver to its input. A clock
controller should not do that. The consuming device will get this clock,
enable it and the enable will trickle down to the provider.


>>> +				    &gpio_locked_clk_ops, 0);
>>> +
>>> +	ret = devm_clk_hw_register(dev, &priv->output_hw_clk);
>>> +	if (ret) {
>>> +		dev_err(dev, "failed to register output clk'%s': %d\n",
>>> +			priv->output_clock_name, ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	dev_info(priv->dev, "Output clock '%s' registered\n", priv->output_clock_name);
>>> +

Drop those prints

>>> +	return 0;
>>> +}
>>> +
>>> +static int gpio_locked_clk_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct gpio_locked_clk_priv *priv;
>>> +	int ret;
>>> +
>>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>> +	if (!priv)
>>> +		return -ENOMEM;
>>> +
>>> +	priv->dev = dev;
>>> +	platform_set_drvdata(pdev, priv);
>>> +
>>> +	priv->input_clk = devm_clk_get_enabled(priv->dev, NULL);
>>> +	if (IS_ERR(priv->input_clk))
>>> +		return dev_err_probe(priv->dev, PTR_ERR(priv->input_clk),
>>> +				"Failed to get locked fixed clock, not yet ready\n");
>> 
>> In your use case it might be fixed, but nothing says it is in general
>> 
> Good point, thanks.

-- 
Jerome
