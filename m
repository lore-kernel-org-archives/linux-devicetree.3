Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109B6468C28
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851428; cv=pass; b=MlAqpgIXicJRFINtFyp1GlMAHsZ7ZNuGGDXIkqSaujpg9hO/TXTnk66bZuhizVhEzad74jJ7ftk2hGp0ZyRkxzjBWJxSYjPnj4qZ90jRwsvPNSqVFL3zUuKmmHm7+izyQg2fsKEdxHATXGtJkKm1Ju8Ie26t4yA7CpZc13O5O9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851428; c=relaxed/simple;
	bh=ntiiMJw0n1K5Z7TxjYixtiA9S/kmRkDI1jzXd/0u+98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ixxo0SZjbTF6qwDoYA5ntGUFkq1/dgNbVkfWj5jVFC6yM7nexeJlPrDGu2gEmbOJLjNUOtH3ImOuBJMph+bgbCV2njpi0MnCU6ihkvn6+OLkgNSLfhJJ6wFIvvr9T6cC9Hi3ALqcPTJ96fUbOIDWhBHGTNnjwlq36o2IhZvodjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D07u+bpM; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D07u+bpM"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a097f5ab95so6184223a12.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:50:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785851425; cv=none;
        d=google.com; s=arc-20260327;
        b=dJGCRHMngAbzbM1xm480ht8X5DBT7syyaQQFbXW30TdmzrEMghqJvJib7DNCULh/In
         wlXOPogGxFruy7D2lk1INn/cqvEcOXxngX3TjKmrv+N/rrjREVBL0N0n+JXSfbf1Qi4D
         yXOma/u1Qw7VZ64DrtY476s+NAiO83ME5KV/pXjX68LLYkEMNyNcvStdC/WfovVTOK6G
         fwsqVV5cgNuuIYXHHeleFe7tKF1R2Xjq5V4DWIOJ7e9BhR29ObmSTpHl8HFwh9++TBFl
         l8GvZ8KyJdXAkWo/oeML/Yux9CBe+BWJCfYo6rZn89aMIObqEguxGJ3l96GMC6s/8yfI
         WG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zPUq4gSDjzsN5XydY66vNAKwQ+iuieDx500MN2oAnCQ=;
        fh=fn8+1NT2iBi0RE5xFk5cvFg2rtXeqAt2gjmVcclMV7A=;
        b=keb/yiOs1hnCYNppGRDQt8FLzkUUjXakxtXkJkRZqv8Lya4XleVkyJzvEK/pIOmRkS
         wbFbq40+Uwm9KIJkQVo02R/jWX1KIja5pG5WRqZlDCICAicaZt5LKYHfqJiG3FSKmOkK
         fN5ysYN6UYkfsPo+AVcR1r3Jts/m7Re0Ncni43BcCcmJQgLCTZducrJx5NBco0tO3erY
         gTBbiZA/ypifkHXNhdp+huIH3Eny5gHZEJz3axbWbDtzJXNL0+4JZlbqBEfWmDPatvpW
         ZxdOjOW45iXlyTTnxPIrM/nzzY39WoKhCuK1twuJWSPEnhj/1kYVt8Ixh7nYNKuLu0/6
         Xlmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785851425; x=1786456225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zPUq4gSDjzsN5XydY66vNAKwQ+iuieDx500MN2oAnCQ=;
        b=D07u+bpMSx46z38z4vp8dB/Fky8rDXkONVwjlbi4YeD6FtHrUmTn1nI5ldJEesSVA/
         PXb+alcBt6rONyOUh9/7Jqnfy6G/5KWEgk2m2YvG6g01dnSq5D1VQ2TLrieLVbJwgnFx
         bzSR6Q6Eh6wU7um+3XiyE+VXO7RV2I+QdNVeDsIizJFOY8nZzzADSszyvMVTCvUcLUGp
         M5yUWNijtcZc/Q7PLoEwm3QxFCd2/AARYvBFksAOtc9sGdinUSWqZ0xGCi6GcCKKhCgm
         Y1MARARMUJZ3jZCwCmVafi3VnGQs7qP6xD9NpAP3pXgH2CZm5bWPnqq129SjLaGiTguj
         t7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851425; x=1786456225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPUq4gSDjzsN5XydY66vNAKwQ+iuieDx500MN2oAnCQ=;
        b=ooAykrnd8n08nKtOGJXaIEpJjiX6ge4aptWmVGkGeqzkMQ+AmBL13fxW20A9JQCRm+
         h0fAQ1smUkV2jC12c5mXi2YBu7eHs/lZiT7Yf57Ia7qBrHx4EDItCLdPYigLWE03cDnP
         O8cAsqIXOOmE+sIPnSj657zS8ozeJSsTCBxBEzDoWNh6FJz959gLeSVUrHIPv/JRUbiW
         d8wRvUvBXvtzjqKRJr+rpmOkgtFcIHvijHwx26ZIf3rFu3gVYZz6ozoxBFCrloagt4yw
         yMUrfZprqoShD9jOEfAJf8aqHpQ5NkeIM43ZJleCsdu3kEYq5JygG93qha/ghbSRAs12
         m0ww==
X-Forwarded-Encrypted: i=1; AHgh+RqN3hqEWst5xmDC6pLg23jM5X+89Yy/UibPIFJZHcdX2Vmi5jCQgUaToSp2VP4uGIgwFGR1juMI+kHk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1d+Y09vcKtXZd9rDinaBUJB7vm96ClA+R6XpnJ611lrImub9O
	+sEOk0KD9FkZ2qPC8uX6iLjBWe2AePhnNr3AVhnQ6JQYe2pGUnehbfafNUjc7pEBDDfuk0QckUU
	myoIv5GyqCwxRhvlhVbvYyBDSkjap0Gg=
X-Gm-Gg: AR+sD111MW4KG/FCCk4+4TAtTKU1MR3CfiBjjIV8QVDpB18u1LlI3BIGK/8MsYYXu1D
	unLxEe4O0qXeL/N9c6v8yJ+nBDZSCQoFuC8Ii/1p55dhktD7DBXwcSG//W60tAZIKKPycnn2hK/
	ei0ET6Jh6Bdhh6VXXO4fCL4QnkdlkcFretbS+Uq+6nieAPmUk2Rt+kAo4zUGVen0Hf9RxKYLzAR
	TUk7PXQO566MTKittJGUs7+LYT/dGV98VpRRkYRhZRyTbHd3G0FZ1/jE+j/tMDwcBpk5iss0vHA
	mrgZPZ02GVADDXTVqdFFcFU2ybqWacSwu3GnlIB9dSK4/ceh/g53hekoULbX4SpJfpGLW9bVHNz
	DM8OMNmSoggB8Vc2VKEGV9TR3bJWkxQ7RSjp9jYIYSDI/ubh9J7uHyyaHjHyVK4hVNlT79MSFx6
	+6JX2F9/pNoLkCu3OyYr8T1tVXNXGjQJ2vigoetVeJ4GyW1vo7JLX3eBoihE81HrY=
X-Received: by 2002:a17:907:3e8b:b0:c15:d6c8:2816 with SMTP id
 a640c23a62f3a-c20239b98bdmr471522866b.27.1785851424918; Tue, 04 Aug 2026
 06:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-mcp47feb02_refactor-v3-0-97f8b81f3628@microchip.com> <20260804-mcp47feb02_refactor-v3-1-97f8b81f3628@microchip.com>
In-Reply-To: <20260804-mcp47feb02_refactor-v3-1-97f8b81f3628@microchip.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 Aug 2026 16:49:48 +0300
X-Gm-Features: AUfX_mwVvjiXqocsQ2YgwSYQ8gQZ7vg7rt96Z5KqVZBgWRn4HOmKB8EAjeAiNck
Message-ID: <CAHp75Vcd-A84KxiCsZpv3y=G-WW8H7GpZ2Y2G7BAnGsVL6Vjiw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iio: dac: mcp47feb02: refactor MCP47FEB02 I2C
 driver into two modules
To: Ariana Lazar <ariana.lazar@microchip.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 4:30=E2=80=AFPM Ariana Lazar <ariana.lazar@microchip=
.com> wrote:
>
> Prepare the driver for the bus-specific code by refactoring into separate
> files. The renamed file will contain the common DAC functionality shared =
by
> the MCP47FxBy1/2/4/8 I2C and MCP48FxBy1/2/4/8 SPI drivers. The MCP47FEB02
> driver was refactored into two modules: mcp47feb02-core.c and
> mcp47feb02-i2c.c in order to prepare the support for SPI MCP48FxBy1/2/4/8
> DAC family on top of the current implementation.

...

> +MCP47FEB02_CHIP_INFO(mcp47feb22, 2, 12, false, true);
> +MCP47FEB02_CHIP_INFO(mcp47feb24, 4, 12, true,  true);
> +MCP47FEB02_CHIP_INFO(mcp47feb28, 8, 12, true,  true);

You need to add a header for 'true' and 'false'.


...

> +++ b/drivers/iio/dac/mcp47feb02.h

> +/* SPDX-License-Identifier: GPL-2.0+ */
> +#ifndef __DRIVERS_IIO_DAC_MCP47FEB02_H__
> +#define __DRIVERS_IIO_DAC_MCP47FEB02_H__
> +
> +#include <linux/bits.h>

Not used

> +#include <linux/mutex.h>

Not used

> +#include <linux/regmap.h>

> +#include <linux/regulator/consumer.h>

Not used

> +#include <linux/types.h>
> +
> +extern const char * const mcp47feb02_powerdown_modes[];
> +
> +/* Macro used for generating chip features structures */
> +#define MCP47FEB02_CHIP_INFO(_name, _channels, _res, _vref1, _eeprom) \
> +static const struct mcp47feb02_features _name##_chip_features =3D { \
> +       .name =3D #_name, \
> +       .phys_channels =3D _channels, \
> +       .resolution =3D _res, \
> +       .have_ext_vref1 =3D _vref1, \
> +       .have_eeprom =3D _eeprom, \
> +}
> +
> +/**
> + * struct mcp47feb02_features - chip specific data
> + * @name: device name
> + * @phys_channels: number of hardware channels
> + * @resolution: DAC resolution
> + * @have_ext_vref1: does the hardware have an the second external voltag=
e reference?
> + * @have_eeprom: does the hardware have an internal eeprom?
> + */
> +struct mcp47feb02_features {
> +       const char *name;
> +       unsigned int phys_channels;
> +       unsigned int resolution;
> +       bool have_ext_vref1;
> +       bool have_eeprom;
> +};
> +
> +extern const struct regmap_config mcp47feb02_regmap_config;
> +extern const struct regmap_config mcp47fvb02_regmap_config;
> +
> +/* Properties shared by I2C and SPI families */
> +int mcp47feb02_common_probe(const struct mcp47feb02_features *chip_featu=
res, struct regmap *regmap);
> +
> +extern const struct dev_pm_ops mcp47feb02_pm_ops;

Missed header for struct dev_pm_ops definition.

> +#endif /* __DRIVERS_IIO_DAC_MCP47FEB02_H__ */


--=20
With Best Regards,
Andy Shevchenko
