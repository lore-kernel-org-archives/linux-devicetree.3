Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBEA384CF7
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568271; cv=pass; b=l/AYV9c8KkuVa6geJcih6oEhNFkkNZ8QwBoWeN4r2XPwE4JXf7gYZIU53+9ahDQkDZhD6IFDGVIM6cMOuZnDoZmkN/cLe72nYR0zzoMYSeqriaRY1uqmoaABPOGZ10gXhDwTbuloPdyeaRZgcaFnHZTD5FhskQ0y4+Ad10P5n14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568271; c=relaxed/simple;
	bh=FjgzfIcEzFg1b096kbJ3RIQzKX5tIHlT5F677cNirk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXwVxjW5g4d3Jwy+Sa833riu8uj0Vrk1j29OZkKNM3j8dF/3QWWB5tFSTRCoUZmZo2HSLA0yx/jQ3ZQvL+IWRIGIFtvbRtwbD1CgIlHYro5lxgATK+fwYhu4Y0hnhDqHGF8SPmpIxRBp9wjDhs/SmYzY50vGSo2wXsyRxuEjO0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZ8k1arB; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZ8k1arB"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8f9568e074so795378066b.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778568256; cv=none;
        d=google.com; s=arc-20240605;
        b=Tz/nMDqow+2Z4YaAy+QNmilBWFc28fClX9lf4hyD9Kn0ddRQwGHoCA4DiBRF5o9ovV
         3I064b1GwY1bQR6edj6YEFqfqbAC6cTTJxURgce0XQn/InbOwTFW5Y9g+ZAodLmKOeyu
         Bb2RMoIFSg9ntekwwYavcexSHQrnoA5iPXojxKby/GE9q1WxP/+eeRkOwonjLWDagnC6
         65RyX23T9WsIk941oXT9Ojuq3+9fEaiwv0G/Y4QHw3vpliyHJA2HhTZJxfd1sjCtrt2G
         HdWfJWVvNqgRHoQ4eYd6JI8RRd6lUxDtRil61U21KYBZh6vF24ukwuD6JnMvKLD62GAR
         mqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s9/juFQ5EkLeK4MRC7rvbjQzQu8ytDf6s79QFENqFt0=;
        fh=zYM9JH7/gDxT2aKz34KfduxrR3NiTWCrxepjDbIdlYM=;
        b=OF9dCw6h9iW2eXr57u+PAGUjMsJLSCv0PdpM9ISCIYJ/KSITNqvxmQZPEyrk5mHC2h
         fNjQsqnA2Cb1qobnj0n8mqwc8TbdIOnC0lP1w5Mx2UVl6JFw7Eukr4gcR+45uORifcbb
         uq8cb9CHzmTACz80PnHmV1HdttgeeDm0xY86jfYdSnkYIzN1Y1VZ+j5sZfmjKW2fllir
         LF1+owg/KSyh7L/087tg011DSEBMTKO+9CnXCq5gusIT51XmiIVTUgfX4N7IuIkdHsi3
         0QfAp2paIytSajn2Ex9VasZofMHKVcr0fTu36Sic2RJM/Hgn47t/IiOju3zLrcTw8V+S
         Jhuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778568256; x=1779173056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9/juFQ5EkLeK4MRC7rvbjQzQu8ytDf6s79QFENqFt0=;
        b=sZ8k1arBo/iltA0Zjf84h/5CURPNlBi/IQ10S32q1NesXxFDyIwF1txkWydnxMi1j1
         JtwnGLPQFB3sBFbZmkQgffqpzZ69/vklgxsF4by7Fu/h3SMsgM/FNkKBJRx2JcXbAyJt
         QcxHjT54H1WIf4CU1DDFVDRTX71KQMo29gOTkJwH0uhBZ2Nkr0StX8fOj7vY018pkNjd
         0LVy+gbJ9vOOZfcP09HIdeXsGxL/++qHn8h0ECVgQvtgroMag2bIzASLM6QJo7KD8n2V
         wd9ZpjCbfT/NXHweROqU0Y1ikwhKBEaq9LRpXZZFN2i5AF9h61R3zgbQCr3rG1yg5TUD
         5gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568256; x=1779173056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9/juFQ5EkLeK4MRC7rvbjQzQu8ytDf6s79QFENqFt0=;
        b=E3jdpy2EbbTqGPbgGMzv7XVaMpmOtloIuZJuEPsmrhZJ/kesMiFPuN0TDyMqGKEJYp
         ZcIJKMEgKKHakQLu1MbD/rvvNbKYTnWQAGiH1UdAa6Q3kvxHVw7DpoZY2G2QweBy0Ouv
         oa3vtRubdSEhJ7JDsRLewzwSA5lMStCHQQzNDrfG1Z//4XsrcFw+k21E0FJQU0ONk4OB
         hBYvg0ho3XwumH0glBOmvGBsiq18Q7FDfGYOI9H7rwJjtinu0AG2XDanagdoledrtNpf
         A8B33d5F5BfjzWTucdDMUPQ713OGoSxNnVY++h5ZQXpCDQI8fHh5K/uopKHzqGWFt9L9
         cHbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4WBPar4jkzpAw6IVNDU7ZptirhnkJEDYcMmay4JL1NlPm0MnhovKa1wWwj3Qp/0mXRGYVOoxkuCg3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl4xp0PIZPCsfkRpUx0AVc3fbJ4NhutNz93y+ZZ8eQIn1VdGiL
	rqMPK3ipQKFfpFelAmU09cLwelJgpayWDw/Lu5ETovW1IWfSm9jYvQ1t6Y3tiTGkN7QUOKohHVN
	OR86KypOq4nadp2g1PZ3GXN3nHlrtBDc=
X-Gm-Gg: Acq92OHjBWHxfHkQSh/mesn1DLHyJdkMhdo8KpsMSpXq6aR9ORj3vkr8QPFyePJFiXh
	Ah38Q1bdE0dmoZ22vipoQHBUfDVwHYB7qUOwYTbsbD62pgnCpOjtXUVAqDUjs4JErC3uii2keHK
	fzX9NwjApaY5qww6jZIpkLtjHbsPxNfQDFNilHvhGbP+6pqoe2jfwqCeWnoGegHmXiMmAA+sqjl
	r/CIDsTzgMcJS+pp+zHyA2kbMuTaojBMqyQX/WUjD8GXK8lAZme7vx6XTbUDdOzi+kJ0V1Ua/5J
	BPoBt8Kzwqg0MYX9MtF/XM/xv5INlh18hMWfaKy8XV+5fZsGZZ3vIfcUdELADihoGLXH1EKbdU8
	oGs87jh4=
X-Received: by 2002:a17:907:728f:b0:bd1:d244:ca24 with SMTP id
 a640c23a62f3a-bd28e412eadmr84527766b.14.1778568255436; Mon, 11 May 2026
 23:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-5-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-5-3efcba579e88@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 09:43:38 +0300
X-Gm-Features: AVHnY4ISc11FAtQmtWdJlGYyo0XawWUZJbHlaYzrkD_vnuBBxzJNK6YMpmrGwVg
Message-ID: <CAHp75VdtORjmCCWy3-oiN-RQd+s7z=2G4s8hemv3xrq47vXu5g@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] iio: adc: mediatek: add mt6323 PMIC AUXADC driver
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 8:21=E2=80=AFAM Roman Vivchar via B4 Relay
<devnull+rva333.protonmail.com@kernel.org> wrote:
>
> The mt6323 AUXADC is a 15-bit ADC used for system monitoring. This driver
> provides support for reading various channels including battery and
> charger voltages, battery and chip temperature, current sensing and
> accessory detection.
>
> Add a driver for the AUXADC found in the MediaTek mt6323 PMIC.

...

> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/iio/iio.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/stringify.h>

+ time.h // USEC_PER_MSEC

> +#include <linux/types.h>

...

> +#define AUXADC_TRIM_CH2                (3 << 10)
> +#define AUXADC_TRIM_CH4                (3 << 8)
> +#define AUXADC_TRIM_CH5                (3 << 4)
> +#define AUXADC_TRIM_CH6                (3 << 2)

Without a comment it's hard to say if these are like masks or actual
values. Can you clarify that in the comment on top of these four?

> +#define VOLTAGE_FULL_RANGE     1800

Are there any units? Are they millivolts or is it just some scale?

...

> +#define MTK_PMIC_IIO_CHAN(_name, _idx, _ch_type)       \
> +{                                                      \
> +       .type =3D _ch_type,                              \
> +       .indexed =3D 1,                                  \
> +       .channel =3D _idx,                               \
> +       .address =3D _idx,                               \
> +       .datasheet_name =3D __stringify(_name),          \
> +       .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) | \
> +                             BIT(IIO_CHAN_INFO_SCALE) \

Keep the trailing comma as this is not a terminator.

> +}

...

> +/**
> + * struct mt6323_auxadc - Main driver structure
> + * @regmap:        Regmap from PWRAP
> + * @lock:          Mutex to serialize AUXADC reading vs configuration
> + *
> + * The MediaTek MT6323 (as well as lot of other PMICs) have the followin=
g hierarchy:
> + * PMIC AUXADC <- PMIC MFD <- SoC PWRAP (wrapper for PWRAP FSM)
> + *
> + * Therefore, PWRAP regmap should be get using dev->parent->parent.

get --> obtained

> + */

...

> +static int mt6323_auxadc_prepare_channel(struct mt6323_auxadc *auxadc)
> +{
> +       struct regmap *map =3D auxadc->regmap;
> +       u32 val;
> +       int ret;
> +
> +       ret =3D regmap_read(map, MT6323_AUXADC_CON19, &val);
> +       if (ret)
> +               return ret;
> +
> +       /* The ADC is idle */
> +       if (!(val & AUXADC_DECI_GDLY_MASK))
> +               return 0;
> +
> +       ret =3D regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19, val,
> +                                      !(val & AUXADC_ADC19_BUSY_MASK), 1=
0, 500);

It's better to have a logical split

       ret =3D regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19,
                                      val, !(val & AUXADC_ADC19_BUSY_MASK),
                                      10, 500);

> +       if (ret)
> +               return ret;
> +
> +       return regmap_clear_bits(map, MT6323_AUXADC_CON19,
> +                                AUXADC_DECI_GDLY_MASK);
> +}

...

> +static int mt6323_auxadc_read(struct mt6323_auxadc *auxadc,
> +                             const struct iio_chan_spec *chan, int *out)
> +{
> +       struct regmap *map =3D auxadc->regmap;
> +       u32 val, reg =3D mt6323_auxadc_channel_to_reg(chan->address);
> +       int ret;
> +
> +       ret =3D regmap_read_poll_timeout(map, reg, val, (val & AUXADC_RDY=
_MASK),

Parentheses are not needed in this case. But I'm fine with it here as
it probably makes it easier to get the idea.

> +                                      1 * USEC_PER_MSEC, 100 * USEC_PER_=
MSEC);
> +       if (ret)
> +               return ret;
> +
> +       *out =3D FIELD_GET(AUXADC_DATA_MASK, val);
> +
> +       return 0;
> +}
> +
> +static int mt6323_auxadc_read_raw(struct iio_dev *indio_dev,
> +                                 const struct iio_chan_spec *chan, int *=
val,
> +                                 int *val2, long mask)

Logical split

static int mt6323_auxadc_read_raw(struct iio_dev *indio_dev,
                                 const struct iio_chan_spec *chan,
                                 int *val, int *val2, long mask)

> +{
> +       struct mt6323_auxadc *auxadc =3D iio_priv(indio_dev);
> +       int ret, mult =3D 1;

Decouple assignment and definition. These types of assignments are
hard to maintain and might lead to subtle mistakes in the future.

> +       if (mask =3D=3D IIO_CHAN_INFO_RAW) {
> +               guard(mutex)(&auxadc->lock);
> +               ret =3D mt6323_auxadc_prepare_channel(auxadc);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt6323_auxadc_request(auxadc, chan->address);
> +               if (ret)
> +                       return ret;

Please, add a comment with the reference to a datasheet (ideally)
explaining this sleep.

> +               fsleep(300);
> +
> +               ret =3D mt6323_auxadc_read(auxadc, chan, val);
> +               if (ret)
> +                       return ret;
> +               return IIO_VAL_INT;
> +       } else if (mask =3D=3D IIO_CHAN_INFO_SCALE) {

Redundant 'else'

> +               if (chan->channel =3D=3D MT6323_AUXADC_ISENSE ||
> +                   chan->channel =3D=3D MT6323_AUXADC_BATSNS)
> +                       mult =3D 4;
> +
> +               *val =3D mult * VOLTAGE_FULL_RANGE;
> +               *val2 =3D AUXADC_PRECISE;
> +
> +               return IIO_VAL_FRACTIONAL;

> +       } else

Ditto, and it's the wrong style. Read the Coding Style documentation
to clarify this.

> +               return -EINVAL;
> +}

...

> +       ret =3D devm_mutex_init(dev, &auxadc->lock);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to initialize mute=
x\n");

Unneeded error message. Most likely it's -ENOMEM, which will be
ignored by dev_err_probe() anyway.

...

> +       ret =3D devm_iio_device_register(dev, iio);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to register iio de=
vice\n");

If you don't see the device, it's failed to register, do we need this messa=
ge?

--=20
With Best Regards,
Andy Shevchenko
