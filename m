Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A385361950
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 21:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784841545; cv=none; b=aNpP+3JzfXRPlo61dTpxDPEbkaDwKb1s+LAUhQ3CByoCFkG7WxbNYOo1uDkaT0NERghNIandthapzFqWqjMO6nmw781j6CyeFhxZ4KoQzgEM6xbcCmvOsGvKxZx8PDS+bzUDbDzDrJBzP+jaJAcwa8Ez0TMiUN1aoWn3N+/2pyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784841545; c=relaxed/simple;
	bh=0vsVoelk+/wWdUpGFevd6sjDKbAxqASZjRMARMQi/Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C38r5m9yDlj113D3rDq41/wKWK9UGMdMOy5SXwpWCWlIFOMIBqFkP7ISOhC+GVB3qLD5h5VC8ywhqYvZgVvkitOIx48N6wQ85UPJPkpZ0ZCsL9qB/paxNJGKE5mCdmAgmuXvTxw3+LFIDSmKdEIzc3S6up3u2D232iPdU4OJ0bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIZdkBG/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIZdkBG/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49558ce01afso7849115e9.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 14:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784841542; x=1785446342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=osseF/smU9bE9A/ptH3A6z+xfWhuPXTWzsZ+GLWxQTs=;
        b=WIZdkBG/keTj9UEs6lhI+8O0j9MxMFilRWjgiIFNyia9Ghck/tEv1sjCh3AThMyqk6
         080G/T4Irm+VgImS2vYLgqYVjotVXgdN8Y8e1YXkx3PTDeBUif2sFPk3eCgHLsrZvcbv
         ierT07axHsr/91J2R2GsUE/UOajDJLI6PmzOg6GYNKPS7x9nfrrg6luEUNNdYJY/pbDW
         6al/2l3p+GmpTn+8PQdyWDVXa+wTU/MrAS1YrAKanHXP88jdazkb4ibH4xHLpObf4uuR
         VJC/u0ziz/ZozlFLGwQXb0B5/LZbH/VdRd5EtakJ4Z9EKM7/yuQj9oiEIxANwBgJGF/Z
         sJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784841542; x=1785446342;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=osseF/smU9bE9A/ptH3A6z+xfWhuPXTWzsZ+GLWxQTs=;
        b=Sgv2l1u2TVsON0aJkEecyueiBaeApGoxRv9xD3FpyYneHRd7yUPTikhmLOl+urLF0y
         oYrOTU/4wnYvldBdaCo1pyR4u9174GQ3qk3ohXcr/qeBQKX4HlIqDxtSjS92KnE6L6VS
         udwUtGvDGfVx9ltqJ5ksRuuUd4OIzjmBihhWlHx+1gA4/mwFSK3HX/2N/76bsvHTE28Q
         Xw68OVSt8wSH/MKwXfxUdHlgjJKBu/OqwHNL8Hr7Z41a6XR0AAViDt713b6y+iBOTswY
         h68W1fLtHKKLyfmBsWhjaE2R582R7LTXxb9zJMGIYLu8wtv/KNPtNnKzfXeuY4HqKvLX
         zemg==
X-Forwarded-Encrypted: i=1; AHgh+Rqr2mQB/dQ6wHTH3Xi14tCoyUIFh0T+BztPl+sU6z3P+R0erRK6g0sjFFzJlRR3Ql0bwTGHN7bp6QlQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxsgDj4LZ0bQptVkNGn6oERZ4hHf0TPU5240x8rX3hVjsl4DrMR
	KRqkgjHJoQ2MsgkcFF7o9ENto6ES/786gPyK99ofaBpTlknzgxLTnLSW
X-Gm-Gg: AR+sD11P9gIcPuFR59J4lQBM+nbykkvEP1I8Q/arrVA+5Ycpk1AKnsPGoF4lhNG22W1
	H00fKX0JsAm4rAEfXlSt/BPh4IgnRYQluuwgI5z8s0T80X/e2+yWml592u4i7lRJTXz/4e1BQM9
	aiQyce9R+wfWFEleSmskKSnamstUArUSg2YTvB/UsNwvCNmuRjjdBFnxytayC3o7z0XaLcgJIwJ
	ScWnTTM9qv1cy8VdP73IJg9OWj/QY68vPHdqJbnlpTlbYwEHDZV4BzlCC19G0cmuDV08/JagEGF
	XyVtnpC+Xbj45Aq1LSA1lnKtRDpYEvafBqTZ3I4mmTZ0QjAeWXUfGyB1x3SXdE4bYLFGMOr3uPB
	WXCuo6iA8fY9FVFfRrp3rOQxq3mmQqBou04s3tTy99h8NOXfWE4JG4RCRoiILvz7xiqZqrSG/Zx
	JoYRJ46LGbCmCHJYyZqsrP4AkyEwTaSEM5HrlaOdZiD54pr1GVRmW/TeJXHsVa2tUI6050TGqqI
	IvFgFMF3Hy7dOk4OSZbf1EZHzFWpcPGoLx9841/f5VbKBfqYZK3F+ykW6rq1nsHRRez/vvGUWo/
	LpOv4ziJTRbIqIcNFVQf1gbXOVLjRhElwsezNg/orxJ9JBUyRoLcEN+Eec/toI8d1+F/nTfsHkF
	Em9sxkcxV9BI=
X-Received: by 2002:a05:600c:1914:b0:495:5e86:4e59 with SMTP id 5b1f17b1804b1-49573cf6226mr55191805e9.22.1784841542022;
        Thu, 23 Jul 2026 14:19:02 -0700 (PDT)
Received: from systembl0wer (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfb20ddsm6120095e9.3.2026.07.23.14.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:19:01 -0700 (PDT)
Date: Thu, 23 Jul 2026 23:18:59 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Ariana Lazar <ariana.lazar@microchip.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/3] iio: dac: mcp47feb02: refactor MCP47FEB02 I2C
 driver into two modules
Message-ID: <20260723231859.03f92ce6@systembl0wer>
In-Reply-To: <20260723-mcp47feb02_refactor-v1-1-ee59e63672bc@microchip.com>
References: <20260723-mcp47feb02_refactor-v1-0-ee59e63672bc@microchip.com>
	<20260723-mcp47feb02_refactor-v1-1-ee59e63672bc@microchip.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jul 2026 16:43:10 +0300
Ariana Lazar <ariana.lazar@microchip.com> wrote:

> diff --git a/drivers/iio/dac/mcp47feb02-i2c.c b/drivers/iio/dac/mcp47feb02-i2c.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..808c51d0afdf564321abcd46a5a7d9595c5472da
> --- /dev/null
> +++ b/drivers/iio/dac/mcp47feb02-i2c.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * IIO driver for MCP47FEB02 Multi-Channel DAC with I2C interface
> + *
> + * Copyright (C) 2026 Microchip Technology Inc. and its subsidiaries
> + *
> + * Author: Ariana Lazar <ariana.lazar@microchip.com>
> + *
> + * Datasheet links for devices with I2C interface:
> + * [MCP47FEBxx] https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/20005375A.pdf
> + * [MCP47FVBxx] https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/20005405A.pdf
> + * [MCP47FxBx4/8] https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/MCP47FXBX48-Data-Sheet-DS200006368A.pdf
> + */
> +#include <linux/device.h>

struct device *dev is an opaque pointer, no need to include device.h

On the other hand, please include dev_printk.h for dev_err_probe().
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>

Remove mod_devicetable.h, no need to include it as it's in spi.h
> +#include <linux/pm.h>
> +#include <linux/regmap.h>
> +
> +#include "mcp47feb02.h"
> +
> +/* Parts with EEPROM memory */
> +MCP47FEB02_CHIP_INFO(mcp47feb01, 1, 8,  false, true);
> +MCP47FEB02_CHIP_INFO(mcp47feb02, 2, 8,  false, true);
> +MCP47FEB02_CHIP_INFO(mcp47feb04, 4, 8,  true,  true);
> +MCP47FEB02_CHIP_INFO(mcp47feb08, 8, 8,  true,  true);
> +MCP47FEB02_CHIP_INFO(mcp47feb11, 1, 10, false, true);
> +MCP47FEB02_CHIP_INFO(mcp47feb12, 2, 10, false, true);
> +MCP47FEB02_CHIP_INFO(mcp47feb14, 4, 10, true,  true);
> +MCP47FEB02_CHIP_INFO(mcp47feb18, 8, 10, true,  true);
> +MCP47FEB02_CHIP_INFO(mcp47feb21, 1, 12, false, true);
> +MCP47FEB02_CHIP_INFO(mcp47feb22, 2, 12, false, true);
> +MCP47FEB02_CHIP_INFO(mcp47feb24, 4, 12, true,  true);
> +MCP47FEB02_CHIP_INFO(mcp47feb28, 8, 12, true,  true);
> +
> +/* Parts without EEPROM memory */
> +MCP47FEB02_CHIP_INFO(mcp47fvb01, 1, 8,  false, false);
> +MCP47FEB02_CHIP_INFO(mcp47fvb02, 2, 8,  false, false);
> +MCP47FEB02_CHIP_INFO(mcp47fvb04, 4, 8,  true,  false);
> +MCP47FEB02_CHIP_INFO(mcp47fvb08, 8, 8,  true,  false);
> +MCP47FEB02_CHIP_INFO(mcp47fvb11, 1, 10, false, false);
> +MCP47FEB02_CHIP_INFO(mcp47fvb12, 2, 10, false, false);
> +MCP47FEB02_CHIP_INFO(mcp47fvb14, 4, 10, true,  false);
> +MCP47FEB02_CHIP_INFO(mcp47fvb18, 8, 10, true,  false);
> +MCP47FEB02_CHIP_INFO(mcp47fvb21, 1, 12, false, false);
> +MCP47FEB02_CHIP_INFO(mcp47fvb22, 2, 12, false, false);
> +MCP47FEB02_CHIP_INFO(mcp47fvb24, 4, 12, true,  false);
> +MCP47FEB02_CHIP_INFO(mcp47fvb28, 8, 12, true,  false);
> +
> +static int mcp47feb02_i2c_probe(struct i2c_client *client)
> +{
> +	const struct mcp47feb02_features *chip_features;
> +	struct device *dev = &client->dev;
> +	struct regmap *regmap;
> +
> +	chip_features = i2c_get_match_data(client);
> +	if (!chip_features)
> +		return -EINVAL;

return dev_err_probe + -ENODEV.
> +
> +	if (chip_features->have_eeprom)
> +		regmap = devm_regmap_init_i2c(client, &mcp47feb02_regmap_config);
> +	else
> +		regmap = devm_regmap_init_i2c(client, &mcp47fvb02_regmap_config);
> +
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Error initializing I2C regmap\n");
> +
> +	return mcp47feb02_common_probe(chip_features, regmap);
> +}
> +
> +static const struct i2c_device_id mcp47feb02_i2c_id[] = {
> +	{ "mcp47feb01", (kernel_ulong_t)&mcp47feb01_chip_features },

Forgot to mention this in patch 3, but please use named initializers.

> +	{ "mcp47feb02", (kernel_ulong_t)&mcp47feb02_chip_features },
> +	{ "mcp47feb04", (kernel_ulong_t)&mcp47feb04_chip_features },
> +	{ "mcp47feb08", (kernel_ulong_t)&mcp47feb08_chip_features },
> +	{ "mcp47feb11", (kernel_ulong_t)&mcp47feb11_chip_features },
> +	{ "mcp47feb12", (kernel_ulong_t)&mcp47feb12_chip_features },
> +	{ "mcp47feb14", (kernel_ulong_t)&mcp47feb14_chip_features },

...

> diff --git a/drivers/iio/dac/mcp47feb02.h b/drivers/iio/dac/mcp47feb02.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..7dbf157d7d6dcfeda7e47141ad447dfa0a79fd51
> --- /dev/null
> +++ b/drivers/iio/dac/mcp47feb02.h
> @@ -0,0 +1,153 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +#ifndef __DRIVERS_IIO_DAC_MCP47FEB02_H__
> +#define __DRIVERS_IIO_DAC_MCP47FEB02_H__
> +
> +#include <linux/bitops.h>

bits.h should suffice.

> +#include <linux/device.h>

No need for device.h
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>

You're missing mutex.h, types.h.

> +
> +#include <linux/iio/iio.h>

If we're going by IWYU, you also don't need this header.
> +
> +/* Register addresses must be left shifted with 3 positions in order to append command mask */
> +#define MCP47FEB02_DAC0_REG_ADDR			0x00
> +#define MCP47FEB02_VREF_REG_ADDR			0x40
> +#define MCP47FEB02_POWER_DOWN_REG_ADDR			0x48
> +#define MCP47FEB02_DAC_CTRL_MASK			GENMASK(1, 0)
> +
> +#define MCP47FEB02_GAIN_CTRL_STATUS_REG_ADDR		0x50
> +#define MCP47FEB02_GAIN_BIT_MASK			BIT(0)
> +#define MCP47FEB02_GAIN_BIT_STATUS_EEWA_MASK		BIT(6)
> +#define MCP47FEB02_GAIN_BITS_MASK			GENMASK(15, 8)
> +
> +#define MCP47FEB02_WIPERLOCK_STATUS_REG_ADDR		0x58
> +
> +#define MCP47FEB02_NV_DAC0_REG_ADDR			0x80
> +#define MCP47FEB02_NV_VREF_REG_ADDR			0xC0
> +#define MCP47FEB02_NV_POWER_DOWN_REG_ADDR		0xC8
> +#define MCP47FEB02_NV_GAIN_CTRL_I2C_SLAVE_REG_ADDR	0xD0
> +#define MCP47FEB02_NV_I2C_SLAVE_ADDR_MASK		GENMASK(7, 0)
> +
> +/* Voltage reference, Power-Down control register and DAC Wiperlock status register fields */
> +#define DAC_CTRL_MASK(ch)				(GENMASK(1, 0) << (2 * (ch)))
> +#define DAC_CTRL_VAL(ch, val)				((val) << (2 * (ch)))
> +
> +/* Gain Control and I2C Slave Address Reguster fields */

You probably meant Register?

> +#define DAC_GAIN_MASK(ch)				(BIT(0) << (8 + (ch)))
> +#define DAC_GAIN_VAL(ch, val)				((val) << (8 + (ch)))
> +
> +#define REG_ADDR(reg)					((reg) << 3)
> +#define NV_REG_ADDR(reg)				((NV_DAC_ADDR_OFFSET + (reg)) << 3)
> +#define READFLAG_MASK					GENMASK(2, 1)
> +
> +#define MCP47FEB02_MAX_CH				8
> +#define MCP47FEB02_MAX_SCALES_CH			3
> +#define MCP47FEB02_DAC_WIPER_UNLOCKED			0
> +#define MCP47FEB02_NORMAL_OPERATION			0
> +#define MCP47FEB02_INTERNAL_BAND_GAP_uV			2440000
> +#define NV_DAC_ADDR_OFFSET				0x10
> +


-- 
Kind regards,
Joshua Crofts
