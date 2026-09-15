Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A66418346
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466971; cv=none; b=mJ4W97cCId0dVJ2OIoRZmHsTyTX5+vUT19h9vEBgoIpNJUhQytKftLISoxvN98hMvAS0MpWcygZaxQc2N4zzUzv1J8Q6nMZGEI3yfhqx4bZ3pY+CpCyu5XRhNhkw96cMFFaWrJc9Z7NLGPU72XH+phTzHAyL5ng8RPEeVKQu3f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466971; c=relaxed/simple;
	bh=1mBrGMk3HUwiIsljAmzu72Mm2rJ6jyYvNcsRP6+3Pqk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QZmX9/ylIj682ElHo+cq9Lnn3qv7zro6yCxodwDPgI/sL/jYdVyycVh94d4OVOEhN8gcXQ/ZjvA/cSaKVBR+13t3F4lt1saXLkvMg6Y5Lm3hj/hEQnsl86YucTt5pw1PiSkBBUek6j1NAlvoEir3yhIKZ4bq2AwwF2Fgw8Qj2ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gwDBZCDH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gwDBZCDH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so19424685e9.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789466966; x=1790071766; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZGHM22Ck2JSJxxurSXjHFPsuFXdIFhR8GNZX+3HR2Q=;
        b=gwDBZCDHUCnuzR3AlAfdeie6Q4G5UuP/02rLyl9H336BPmICbMB9UPAr+7sffy9Hcf
         DHXdz3fmaoKAxzetVa55PWtwILTvvwA63MdfrcUy1cFyQHrnNdG25YhmrfTFwMORcfM7
         PPuTEmktoLv/qCLeFpnldZtXTLlbkzeeHpexgvlw87pRVDKl6CyEq6Xjf892HSyav90A
         leucKgL9kU615rNgUzSAfyaovIGL7p5HmJPOjWLq4Cch35gaD/iDD0zqOB4MGZB2McGb
         u2f4qvUCwX+J/n/xHsWITLTtehy9nsqPFPb7lXsJ+19fFLYgpikQb30pjngnrFyc11Re
         rHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466966; x=1790071766;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iZGHM22Ck2JSJxxurSXjHFPsuFXdIFhR8GNZX+3HR2Q=;
        b=EIc3iD0GstHZsh7uZnZhSC6mfh0y6aA4thizCly+tnrih/PECDuVHcwCBJOqUoon3a
         BtKgc3woD6zH3qq1u5rSpCHSsSSwoKDIRnCnwACnc+EUzoLpPikV2ICAGeLC3tvdN0Hf
         symzOuK+EDjoa/xyiXkds/7PUd68n3UrSBdtwhmpMM1Qu4EMcvXFd5nthr55n4RPtKCR
         M8tEsBdbiOs7Pko1M+1ZRt9JfIZxdrdg3bU9LIgWZzoW8jbSMfH4AYNTm8FM5+747rp8
         tOHqvhr9PRMjxCTGezUIqCEkACo8vBkcB4Yy/yAh5Gnb8b/vhiR3u0XFIALYQd+8Adc8
         Te3w==
X-Forwarded-Encrypted: i=1; AKwUvBysD3N/IARwb0CqbCrfcx84mqKwh95eW4LWHKC9K6eqCzLtE2PwB4L313P/ZstUEjJFr+Qm6lTgxXFR@vger.kernel.org
X-Gm-Message-State: AFuF++n6xgOlIRpWZQ/oBgiqdgR5N+bTlYNEC3Injbe/SJ/7VB2AcOaj
	F9edkkL2CLrr77yJOFsMosXAX1SLh1/Gq/iHoIW8uYV8UEtv2vHFIO8NxyqXh3miSLE=
X-Gm-Gg: AYBFou1rY1jKScGEQYa8dSFbPD5osTN4VWQ1ec0+y7A13NFJ/u9QlE8P04qHzmeJ1a1
	9LK6vHK75xxCRFZpk5a+LEnfrhJc2maEp87tawDdnn3FQSSUPbsiudoaQlYSC38tb7zTs2JF3fj
	apyTXDP0qvzUwvuFb2lyFzALIsq+StrClqtpLjxniIYGVXo3H4EIv6vzPOidbHNS5Kn+8mkB3dL
	LiNSrTxEns4/lupUfLLXv68TkSI2j+K3F/W2E6LAJGaWp231aiQt6pAKzoIDQY/qZtTiTWcshRG
	LqxC1LN8P/I5bAZrKQNbuSaHL7fH+ECCUVR002avd7q1frSwMJmFl4cyAw8gsFzskSoIt0wOtJK
	iRWHS27PixpCZOIlFJ181nEp5vhDMqkNDkzHMvns9+gOvVqUybYdBe61s3SnLGpv74+3ggAby4r
	kl027L1X7c0+nIGLMRgoGmBNYSzPuTJIdwh56ZKkondkykB3SIOaMmZki130wQZ6r2WWA/FbbN+
	T+2pLY8QXPJK3Sl2YwV93eQutlc
X-Received: by 2002:a05:600c:8716:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49e7a657f9dmr180400155e9.2.1789466966542;
        Tue, 15 Sep 2026 03:09:26 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef735cesm53989815e9.6.2026.09.15.03.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:09:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov via B4 Relay
 <devnull+V.Yurkov.EXT.bruker.com@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri
 Sarha <jsarha@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>,
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Subject: Re: [PATCH v5 2/2] clk: Add gpio-locked fixed clock driver
In-Reply-To: <20260915-feature-clock-guard-v5-2-42ab5dc3a6aa@bruker.com>
References: <20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com>
 <20260915-feature-clock-guard-v5-2-42ab5dc3a6aa@bruker.com>
Date: Tue, 15 Sep 2026 12:09:24 +0200
Message-ID: <1j33vaesh7.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 15 sept. 2026 at 09:27, Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org> wrote:

> From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>
> A gpio-locked clock exposes a clock, which status is determined by a
> GPIO signal. The common use-case is a FPGA-assisted clocking design
> where peripheral clocks are generated by FPGA PLLs that are outside
> CPU control, with clock-valid/PLL-lock status exposed through GPIO signals.
> Consumers can use the output clock to wait until the input clock is locked
> and only then initialize dependent peripherals.
>

We already have gpio gate driver in drivers/clk/clk-gpio.c

It would be much better if you could just extend that one that take
optionally take a clock input like you do here.

> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
>  drivers/clk/Makefile          |   1 +
>  drivers/clk/clk-gpio-locked.c | 169 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 170 insertions(+)
>
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index b18af485d7f0..b904f292d683 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -46,6 +46,7 @@ obj-$(CONFIG_CLK_FD_KUNIT_TEST) += clk-fractional-divider_test.o
>  obj-$(CONFIG_COMMON_CLK)	+= clk-gpio.o
>  ifeq ($(CONFIG_OF), y)
>  obj-$(CONFIG_COMMON_CLK)	+= clk-conf.o
> +obj-$(CONFIG_COMMON_CLK)	+= clk-gpio-locked.o
>  endif
>  
>  # KUnit specific helpers
> diff --git a/drivers/clk/clk-gpio-locked.c b/drivers/clk/clk-gpio-locked.c
> new file mode 100644
> index 000000000000..b648f8763922
> --- /dev/null
> +++ b/drivers/clk/clk-gpio-locked.c
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Clock Controller Guard Driver
> + *
> + * Copyright 2026 Bruker Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +/**
> + * struct gpio_locked_clk_priv - private state for the whole driver
> + * @dev:		platform device
> + *
> + * @input_clk	input clock
> + * @gpios:		input GPIO descriptor
> + *
> + * @output_hw_clk:      output clock HW descriptor
> + * @output_clock_name:  output clock name
> + */
> +struct gpio_locked_clk_priv {
> +	struct device *dev;
> +
> +	struct clk *input_clk;
> +	struct gpio_desc *gpios;
> +
> +	struct clk_hw output_hw_clk;
> +	const char *output_clock_name;
> +};
> +
> +#define to_gpio_locked_clk_priv(_hw) \
> +	container_of(_hw, struct gpio_locked_clk_priv, output_hw_clk)
> +
> +static int gpio_locked_clk_is_enabled(struct clk_hw *hw)
> +{
> +	struct gpio_locked_clk_priv *priv = to_gpio_locked_clk_priv(hw);
> +
> +	int data = gpiod_get_value(priv->gpios);
> +
> +	if (data < 0) {
> +		dev_err(priv->dev, "Failed to get data gpio val: %d\n",
> +				data);
> +		return data;
> +	} else if (!data) {
> +		dev_warn(priv->dev, "GPIO is not ready");
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
> +/* We can't enable the clock, but the Common Clock Framework calls only
> + * enable() not is_enabled()
> + */
> +static int gpio_locked_clk_enable(struct clk_hw *hw)
> +{
> +	return gpio_locked_clk_is_enabled(hw);
> +}
> +
> +/* We have to implement it, but we are not going to control
> + * parent clock selection
> + */
> +static u8 gpio_locked_clk_get_parent(struct clk_hw *hw)
> +{
> +	return 0;
> +}
> +
> +static const struct clk_ops gpio_locked_clk_ops = {
> +	.enable =	gpio_locked_clk_enable,
> +	.is_enabled =	gpio_locked_clk_is_enabled,
> +	.get_parent =	gpio_locked_clk_get_parent,
> +};
> +
> +static int gpio_locked_clk_parse_outputs(struct gpio_locked_clk_priv *priv)
> +{
> +	struct device *dev = priv->dev;
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +
> +	of_property_read_string_index(np, "clock-output-names", 0,
> +		&priv->output_clock_name);
> +
> +	if (!priv->output_clock_name)
> +		priv->output_clock_name = dev_name(priv->dev);
> +
> +	priv->output_hw_clk.init =
> +		CLK_HW_INIT_FW_NAME(priv->output_clock_name,
> +				    __clk_get_name(priv->input_clk),
> +				    &gpio_locked_clk_ops, 0);
> +
> +	ret = devm_clk_hw_register(dev, &priv->output_hw_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to register output clk'%s': %d\n",
> +			priv->output_clock_name, ret);
> +		return ret;
> +	}
> +
> +	dev_info(priv->dev, "Output clock '%s' registered\n", priv->output_clock_name);
> +
> +	return 0;
> +}
> +
> +static int gpio_locked_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_locked_clk_priv *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->input_clk = devm_clk_get_enabled(priv->dev, NULL);
> +	if (IS_ERR(priv->input_clk))
> +		return dev_err_probe(priv->dev, PTR_ERR(priv->input_clk),
> +				"Failed to get locked fixed clock, not yet ready\n");

In your use case it might be fixed, but nothing says it is in general

> +
> +	priv->gpios = devm_gpiod_get(priv->dev, "locked", GPIOD_ASIS);
> +	if (IS_ERR(priv->gpios)) {
> +		dev_err(dev, "failed to get locked gpios: %ld\n",
> +				PTR_ERR(priv->gpios));
> +		return PTR_ERR(priv->gpios);
> +	}
> +
> +	ret = gpio_locked_clk_parse_outputs(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_of_clk_add_hw_provider(priv->dev, of_clk_hw_simple_get,
> +		&priv->output_hw_clk);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to register clock provider '%s': %d\n",
> +			priv->output_clock_name, ret);
> +		return ret;
> +	}
> +
> +	dev_info(dev, "registered %s gpio locked clock\n",
> +		 clk_hw_get_name(&priv->output_hw_clk));
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id gpio_locked_clk_of_match[] = {
> +	{ .compatible = "gpio-locked-fixed-clock" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, gpio_locked_clk_of_match);
> +
> +static struct platform_driver gpio_locked_clk_driver = {
> +	.probe  = gpio_locked_clk_probe,
> +	.driver = {
> +		.name           = "gpio-locked-fixed-clock",
> +		.of_match_table = gpio_locked_clk_of_match,
> +	},
> +};
> +module_platform_driver(gpio_locked_clk_driver);
> +
> +MODULE_AUTHOR("Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>");
> +MODULE_DESCRIPTION("GPIO-locked clock driver");
> +MODULE_LICENSE("Dual BSD/GPL");
>
> -- 
> 2.34.1
>
>

pw-bot: changes-requested

-- 
Jerome
