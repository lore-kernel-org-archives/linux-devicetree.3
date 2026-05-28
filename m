Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3334D3955DF
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 09:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958943; cv=pass; b=C565KOVo0aSuqukGOuzijQifG9oHrEwGvSb6+vV5DnVCdsrxgcRm8ewSs2eIKMXvE7Udw7AtJ09gIo1xhEIZgO9MOp5lPHCYtCeFlaOwkvNe1jszPtaYvv131O9YJ32MQOAaA9jFkqpM65jBfcS2sibEoyQ0vM8O4p6Q7C8fvfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958943; c=relaxed/simple;
	bh=y0uE14r/WbsN8Vuhba2C0/6AloTpKV1DdgcnqiKdHFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AEe7wKFYL3/g55FTb/h8OzEUCAww+vHTiOMVW7UDHS7bjgh01o7OngzAxW43q/pZvClCrGhN0TX98j8kQnrX1+rSD4CQr1KEZ+qGTD7Asb0I2j7T7Wnl/+pob7EWrpq/CwQj65rIf7Bhqh6WB1cyWZ6UdHwBA1UWhtHkVXFlefE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmdBFMXa; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmdBFMXa"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a8891f0c51so12534515e87.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779958939; cv=none;
        d=google.com; s=arc-20240605;
        b=QMdnVvIQe+zpgT6Yb0iLLDRvSnjAqsrKxHTNk6f/0JGQFwOyPvVtR4yyGpSr0C5gB8
         WScH4hJ+5HfUEVf9rp6dfcCHQAtuv0xGXGz/FEFeNNHD9cuoLzWj4biTpTm268qz3cAU
         r3ogXSpM6d1Ms5y2nUx2mV8+j/edmem5DhvWiDuM5OOfN2wXn/GXNf4nl4zkDfQ7vcdF
         vv2tnPqv4tBn5c2SptAdIvyxjQredCfZJeomCuI+ERfe6tKl1O9Ju1UwJfeu8JJJt+5r
         ZlbN4aPKrlgXExYfQ5VWGDWtZ1ETLrKCTiB8nHKtByyTs/oeIbhpf7OxBs8HGlDRsaYw
         EC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1jWHKJMDDQO/AD2C8e59urtbYtaRKLnOjHNYulCSOOs=;
        fh=k/uXaMT8L7XcVDvnf21EejLyS5+fSaasCxGybEAebLs=;
        b=du7km4Dtfw+X0Fe6xmHSsQOSk5NmwvDIS6bypsc3rZ6fgBbtB731p1BngMUvokGqq8
         2XlDnnmr1a1x54cc+OJzYXXSgoQ/3Bq7aER/y3616QnZwryXHOPBwq+QQ19IwFRm/5G7
         MoBY1A9gTJRFM3HpHV/ZkkkYK2HXaHYDQFrBeMy71Y97NQn2pJIuyuKTez6qn/suTzBf
         TB8WC9qAJo1iD+LIEqcpgICFYrm7QKjFRl/StrIAzScdIe0GIWBZSAw4ByFq1OO0rOoI
         bbIzxg0Dg3m8ZedGDqOHZoscBpBbtm0/rCwwgM4pGmtxaYHbb+VJHuAmQNJj3ROr0zX7
         IhYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779958939; x=1780563739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1jWHKJMDDQO/AD2C8e59urtbYtaRKLnOjHNYulCSOOs=;
        b=NmdBFMXaIh0q9s7M1ArmiyY8txcP8XTJ9UgU67XlW+8upqIhlC0xadaZce75qiFppD
         WIm6JzegS+2wOYV/QhYfoiwoNvkq4i4rtPNKvA3Kziwpb9lrCoXJo0dAT9xMJOZBLw7e
         xxD3EVOvrt3NQI/3bmv9DN5nJP/FmgpbajUJAfi5NyGNjKJN5K0N8drHYjfuETxUQWy5
         mjuRlBptz+6u1qHDi8+lfPaRwUW1+Eg4Lux5oHdHfOA/MVLaHaT5CNXjQcSM7A7dt2F4
         dhDi21T8pYEZmnV152STFVce8VQ86ejDMSfZm5tIJGovaPwm2BQMFgcx93DKoD+kOKQR
         1eqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779958939; x=1780563739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jWHKJMDDQO/AD2C8e59urtbYtaRKLnOjHNYulCSOOs=;
        b=kV7fHTasTxSpHRZyiN1iYtFoXW9igMd8YBWe6kBcPtrC0pdxtIKSoZBZFfhfRNgBTz
         AwpnIgmcrlPM7thxlkpPV/8w4Wc0UyKWL/lZljf1Fen8eyWOoHRglZerAhpCTYbz7jdr
         duU866m7tyumBrJ7Rz9aSHJKrE6favthVuiXJk2WcMZMh0XHIvZd+g+gjHtz74hqSdkW
         Lkc4PYQvfXq5yh54L46/r0nSbHZ+7ZPPNfRsKGb3ExJHG/eW+ifFWof1uZd+QFLKWmmb
         HB8kPBXN8Nmp5w50m5E3L9FIPaboRbhox+iz+b5OKQazQPWztSdeYWTeRe8j0WmR6GkB
         C4sA==
X-Forwarded-Encrypted: i=1; AFNElJ/q/ej5GCBNkbRH9BzddAm0UI4VUqWh96nLBISpPmZ3LLdRHEW01t4qc6zLPvdU41JxJqrY6YmmxS69@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2OafcioZlBM3NyAp2K6nI6DeXeosdZV6qLUcvSATS+m6DL1yw
	Igem4+gC3FWS/DIj/mcGN3NzCGM8D6kusSTe6t0RlUIZVvDfJcE2mtIe4hDRSmMbJ4HBBviksVv
	014ugPjGz1y+0BkaaQErGJB5YvdtmJPs=
X-Gm-Gg: Acq92OGx3WmfoxIssY2GJPVL2znYwPMvA7LnRyL4EfJgF8JmtznYXkovitBx8hLRzHw
	EMu0UXKKIsP+BdBf1RmDaZmqY+U49JVALx/jiEb0qYTOWf7hzoQ7A9SAcHp3eMaR6s6pmyRPPHl
	qPmd90vSupXR7KGE2QutnWxBqz4uZlI86e4ulJel9ZdBHu3m9arOOb/DcjzILJUpVP1nam8PuIA
	RPjBM4tl8dDCW6pWEmJJl8jZFIJSzYyEbUAvGSvrJNymqhcPA/pgpg5RQAx8dd1qtTEmZJOZNCK
	7QEP6B7wHimFRLTH35HXCEDYsWfw9GrSIqAFjf7aLAXgtoZ83ZOkxD8YLeBsqVnf1uIa5bMpjix
	vEglGmbREjog118EgWaMDIixfPDqp6kK31GP83WTESVpWLV8pLaGCwoGf2rI6xcEuhh5TP/SZVa
	HtjKDBw4YFdkaNcwipZ2PUDhJYk6E=
X-Received: by 2002:a05:6512:1244:b0:5a8:63e0:971b with SMTP id
 2adb3069b0e04-5aa323a9bc6mr7945935e87.35.1779958938073; Thu, 28 May 2026
 02:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com>
 <20260528-axiado-ax3000-ax3005-saradc-v1-2-345dd5f6608a@axiado.com>
In-Reply-To: <20260528-axiado-ax3000-ax3005-saradc-v1-2-345dd5f6608a@axiado.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 28 May 2026 11:02:05 +0200
X-Gm-Features: AVHnY4I2L8jUROgryJNYEp7XvVDoqkCQpW4rzktdx5-T3JCp_JJeNfOp0KVoQ8I
Message-ID: <CALoEA-yfqYky=Un0r5K8QBc_H8DVziuiKuLap7ArAQOmaLKnZw@mail.gmail.com>
Subject: Re: [PATCH 2/3] iio: adc: add Axiado SARADC driver
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2026 at 10:11, Petar Stepanovic <pstepanovic@axiado.com> wrote:
>
> Add support for the SARADC controller found on Axiado AX3000 and
> AX3005 SoCs.
>
> The driver supports single-shot voltage reads through the IIO
> subsystem. The number of available input channels is selected from
> the SoC match data, allowing AX3000 and AX3005 variants to use the
> same driver.
>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---

Hi Petar, a few comments inline. Additionally, Sashiko came back
with a few issues:
https://sashiko.dev/#/patchset/20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a%40axiado.com.

> +++ b/drivers/iio/adc/axiado_saradc.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021-2026 Axiado Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/iio/iio.h>

IIO specific headers should follow the generic <linux/*> headers and
be grouped separately.

> +#include <linux/io.h>
> +#include <linux/kernel.h>

Don't use kernel.h when adding a new driver. The existing drivers in IIO
are currently being moved away from kernel.h, as it is a catch-all header.
You should include what you use manually (there is a tool for this, it's
called iwyu-tool).

> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +
> +/* Register offsets */
> +#define AX_SARADC_GLOBAL_CTRL 0x0004
> +#define AX_SARADC_MANUAL_CTRL 0x0008
> +#define AX_SARADC_DOUT 0x001C
> +
> +/* GLOBAL_CTRL fields */
> +#define AX_SARADC_CH_EN_MASK GENMASK(31, 16)
> +#define AX_SARADC_SAMPLE_MASK GENMASK(6, 5)
> +#define AX_SARADC_MODE_MASK GENMASK(4, 3)
> +#define AX_SARADC_PD BIT(2)
> +#define AX_SARADC_ENABLE BIT(0)
> +
> +/* GLOBAL_CTRL values */
> +#define AX_SARADC_SAMPLE_16 FIELD_PREP(AX_SARADC_SAMPLE_MASK, 0)
> +#define AX_SARADC_MODE FIELD_PREP(AX_SARADC_MODE_MASK, 1)
> +
> +#define AX_SARADC_MANUAL_CTRL_EN(n) (BIT(0) | ((n) << 1))
> +#define AX_RESOLUTION_BITS 10
> +#define AX_SARADC_CONV_CYCLES 13
> +
> +struct axiado_saradc {
> +       void __iomem *regs;
> +       struct clk *clk;
> +       unsigned long clk_rate;
> +       int vref_uv;
> +       struct mutex lock; /* Serializes ADC conversions. */
> +};
> +
> +static int axiado_saradc_conversion(struct axiado_saradc *info,
> +                                   struct iio_chan_spec const *chan, int *val)
> +{
> +       unsigned long usecs;
> +       /* Select the channel to be used and trigger conversion */
> +       iowrite32(AX_SARADC_MANUAL_CTRL_EN(chan->channel),
> +                 info->regs + AX_SARADC_MANUAL_CTRL);
> +
> +       /* Hardware requires 13 conversion cycles at clk_rate */
> +       usecs = DIV_ROUND_UP(AX_SARADC_CONV_CYCLES * 1000000, info->clk_rate);
> +       usleep_range(usecs, usecs + 10);

fsleep() is preferred over usleep_range(), it selects the optimal
sleep function while guaranteeing a sleep of at least usecs time.

> +
> +       *val = ioread32(info->regs + AX_SARADC_DOUT) &
> +              GENMASK(AX_RESOLUTION_BITS - 1, 0);
> +
> +       /* Stop manual conversion */
> +       iowrite32(0, info->regs + AX_SARADC_MANUAL_CTRL);
> +       return 0;
> +}
> +
> +static int axiado_saradc_read_raw(struct iio_dev *indio_dev,
> +                                 struct iio_chan_spec const *chan, int *val,

Small nit, but I'd move int * val onto the line along with val2 and mask
so it's logically separated.

> +                                 int *val2, long mask)
> +{
> +       struct axiado_saradc *info = iio_priv(indio_dev);
> +       int ret;
> +
> +       switch (mask) {
> +       case IIO_CHAN_INFO_RAW:
> +               mutex_lock(&info->lock);

I wanted to recommend using the guard(mutex) macro, but you're
only using a mutex once, so up to you.

> +               ret = axiado_saradc_conversion(info, chan, val);
> +               mutex_unlock(&info->lock);
> +               return ret ? ret : IIO_VAL_INT;
> +       case IIO_CHAN_INFO_SCALE:
> +               *val = info->vref_uv / 1000;
> +               *val2 = AX_RESOLUTION_BITS;
> +               return IIO_VAL_FRACTIONAL_LOG2;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static const struct iio_info axiado_saradc_iio_info = {
> +       .read_raw = axiado_saradc_read_raw,
> +};
> +
> +struct axiado_saradc_soc_data {
> +       unsigned int num_channels;
> +};
> +
> +static const struct axiado_saradc_soc_data ax3000_saradc_data = {
> +       .num_channels = 16,
> +};
> +
> +static const struct axiado_saradc_soc_data ax3005_saradc_data = {
> +       .num_channels = 8,
> +};
> +
> +#define AX_SARADC_CH(_index, _id)                                       \
> +       {                                                               \
> +               .type = IIO_VOLTAGE, .indexed = 1, .channel = (_index), \
> +               .info_mask_separate = BIT(IIO_CHAN_INFO_RAW),           \
> +               .info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),   \
> +               .datasheet_name = (_id), .scan_index = -1,              \
> +               .scan_type = {                                          \
> +                       .sign = 'u',                                    \
> +                       .realbits = AX_RESOLUTION_BITS,                 \
> +                       .storagebits = 16,                              \
> +                       .endianness = IIO_CPU,                          \
> +               },                                                      \
> +       }
> +
> +static const struct iio_chan_spec axiado_saradc_iio_channels[] = {
> +       AX_SARADC_CH(0, "adc0"),   AX_SARADC_CH(1, "adc1"),
> +       AX_SARADC_CH(2, "adc2"),   AX_SARADC_CH(3, "adc3"),
> +       AX_SARADC_CH(4, "adc4"),   AX_SARADC_CH(5, "adc5"),
> +       AX_SARADC_CH(6, "adc6"),   AX_SARADC_CH(7, "adc7"),
> +       AX_SARADC_CH(8, "adc8"),   AX_SARADC_CH(9, "adc9"),
> +       AX_SARADC_CH(10, "adc10"), AX_SARADC_CH(11, "adc11"),
> +       AX_SARADC_CH(12, "adc12"), AX_SARADC_CH(13, "adc13"),
> +       AX_SARADC_CH(14, "adc14"), AX_SARADC_CH(15, "adc15"),
> +};
> +
> +static int axiado_saradc_probe(struct platform_device *pdev)
> +{
> +       struct axiado_saradc *info;
> +       const struct axiado_saradc_soc_data *soc_data;

Use reverse christmas tree order.

> +       struct iio_dev *indio_dev;
> +       int ret;
> +       u32 reg;

Reg isn't a really good name, regval would be better.

> +
> +       indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*info));
> +       if (!indio_dev)
> +               return -ENOMEM;
> +
> +       info = iio_priv(indio_dev);
> +
> +       info->regs = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(info->regs))
> +               return PTR_ERR(info->regs);
> +
> +       info->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +       if (IS_ERR(info->clk))
> +               return PTR_ERR(info->clk);
> +
> +       info->clk_rate = clk_get_rate(info->clk);
> +       if (!info->clk_rate)
> +               return dev_err_probe(&pdev->dev, -EINVAL,
> +                                    "invalid clock rate\n");
> +
> +       info->vref_uv = devm_regulator_get_enable_read_voltage(&pdev->dev,
> +                                                              "vref");
> +       if (info->vref_uv < 0)
> +               return dev_err_probe(&pdev->dev, info->vref_uv,
> +                                    "failed to get vref voltage\n");
> +
> +       soc_data = device_get_match_data(&pdev->dev);
> +       if (!soc_data)
> +               return dev_err_probe(&pdev->dev, -EINVAL,
> +                                    "failed to get match data\n");
> +
> +       mutex_init(&info->lock);

Use devm_mutex_init since everything else is devm.

> +       reg = FIELD_PREP(AX_SARADC_CH_EN_MASK,
> +                        GENMASK(soc_data->num_channels - 1, 0)) |
> +             AX_SARADC_SAMPLE_16 | AX_SARADC_MODE | AX_SARADC_ENABLE;
> +
> +       iowrite32(AX_SARADC_PD, info->regs + AX_SARADC_GLOBAL_CTRL);

Sashiko notes to add a small delay here to prevent a zero width pulse.

> +       iowrite32(reg, info->regs + AX_SARADC_GLOBAL_CTRL);
> +       indio_dev->name = dev_name(&pdev->dev);

Hmm, Sashiko may have a point here, this could break the ABI.
The name member is usually assigned a hardcoded string and
it shouldn't contain whitespace, dots or dashes, which dev_name()
could return.

> +       indio_dev->dev.parent = &pdev->dev;
> +       indio_dev->info = &axiado_saradc_iio_info;
> +       indio_dev->modes = INDIO_DIRECT_MODE;
> +       indio_dev->channels = axiado_saradc_iio_channels;
> +       indio_dev->num_channels = soc_data->num_channels;
> +
> +       ret = devm_iio_device_register(&pdev->dev, indio_dev);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "failed to register IIO device\n");

You can just do `return devm_iio_device_register`.

> +       return 0;
> +}
> +

I don't see any kind of cleanup procedure, like a remove() function
or devm_add_action_or_reset callback, is this intentional?

> +static const struct of_device_id axiado_saradc_match[] = {
> +       {
> +               .compatible = "axiado,ax3000-saradc",
> +               .data = &ax3000_saradc_data,
> +       },
> +       {
> +               .compatible = "axiado,ax3005-saradc",
> +               .data = &ax3005_saradc_data,
> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, axiado_saradc_match);
> +
> +static struct platform_driver axiado_saradc_driver = {
> +       .driver = {
> +               .name = KBUILD_MODNAME,
> +               .of_match_table = axiado_saradc_match,
> +       },
> +       .probe = axiado_saradc_probe,
> +};
> +
> +module_platform_driver(axiado_saradc_driver);
> +
> +MODULE_AUTHOR("AXIADO CORPORATION");
> +MODULE_DESCRIPTION("AXIADO SARADC driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
>

-- 
Kind regards

CJD
