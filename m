Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7D446AF0A
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569542; cv=pass; b=O+PabXk2ridduruX+onugQjmt+WXlSiOZ8bFrP+Bj9r3zOLcJsY0h8Lv3bhm6jYVzgdNNBG0DBL+Ntd3XU3QuxY5R8K5OSHMQdP5Hx6Snj0TvsRaLa81DUZ4nDVWNyHzyc6mqD+ejRAK9akEB7+MaE8+55+GwLEGapbpYYEoRkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569542; c=relaxed/simple;
	bh=iUA4KanOx+PRFfzuu3dxsfCzyK7fuN7zilHuCkz4ENU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YxGbetsst1f7TLc/WW+g5OEWkERxlXYaU4WJoiOreCe9HFHGrkDZ30282TirOEEA2gAH11C1zn85j5cQcElCSCHBpTTB4hyehMZ5jYHssrJoq7rjUAlLwYce2dDEbpKE46fQLZSdcvXQqZmEDY1QPDg3xsfRq60zsfzsuYesaZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rxYqZB+/; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rxYqZB+/"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bccb9dca1beso450720166b.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 00:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778569534; cv=none;
        d=google.com; s=arc-20240605;
        b=MXXmxj2aF7ZMWz6J6repNReRgNu+lUK7c13fXCxzVV24IfS9M4GYebm1I44c06DqxT
         nWEGrdDzqC3IbUTOt4ql6vj5BftKI/FCPa6xdjUZYRkfEfafCFPDM+ZRLqI0/0xdPwtS
         JuxUePFTXbjUoxtfmPWc6o0+b8y1Rt83mwDDkyvPcnu3Nsqld3mYCHKp03OpBGzH3PH6
         ZtBw6tap4LiSAbrN9nwHA+Qt5gQNRBVLy1KSLzY/QMPl5OaISlKvvXxWVxVxv+S6aqdU
         32DlfMs9x1n381iWoxw+FTHwyUd0lQ/YFtm5XKlGsj/zBucJTPKy9Rp9tNwuipg7BlN+
         F0iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4WKO48wCVFVY/Q3lQzIe4xzewKQpps/o90phN6WWe98=;
        fh=FcgkdTi1m8YjMz7qkbzEM+SxbSaYtJg3kWqqL6e9j04=;
        b=fhusq+H/RUm0SJvzvnIoVMOMyJodTnB4bjxBY1vrICIq8mcfrbl4GkFzl4qcOZz/BD
         B7H8VxdxoaIAS3WHLRYqjIheBvidYfqBQn/bXP8dzRxkuWRnMuJiWWNMFL7stJQSGqEj
         7XLpC4oSHuUtWYdXeOZYQL8gtQcgcZCP7kVjFgqWjJfXHllm2SHEbLRTfLynQtlG0sza
         WcDrrE5y0M1PukfiDFI9Z5dg6DXWbclatUWsMKRWt1XzumDjjhNAhW2yx0cYaehFaW9o
         LdjZo+2AEVdu1nC8bwlaRDrKc0vPEaiPtkVDiSoj8VSRCqGu/kln0Xla4Ph18IxoOAZu
         PNYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778569534; x=1779174334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WKO48wCVFVY/Q3lQzIe4xzewKQpps/o90phN6WWe98=;
        b=rxYqZB+/UHFvOKizRzFW+V6ETszlYvcxLmNJyeZiLpObexJbJF04PmilU8HL5ysClb
         P+bWv3h2BLwYiI0+XqjR6wCDWdJSO32OOH4hzcuYXcFyD7gtQYBmVINNd4EiqMVS/ern
         4utktMp9gVUDnsM8TOIf6dbKmPPyZySlhmbfyy7D5lxJsc4Y4CQ1o4PGAbnxJaDCCSyl
         sIYyHYjZ13Q0RJ+mfzVDtX3H+6RW7nInH5BpyTb6/Y/F1TIATduf7V54wT3mhq9hEQqX
         wm4s0g9PXWmGppFSCReIatjLiMQ0XsDThgBbJjPbgM5j/Xhx+EmIXwTDbI/p9hTTC2Jb
         9w7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569534; x=1779174334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4WKO48wCVFVY/Q3lQzIe4xzewKQpps/o90phN6WWe98=;
        b=U910hvtm1p1tU+VJwtHVov1dRbxjoHGNvndY5th00V3Q771lB4gBbqgxnCERej4ZAg
         j7A4NBFRmM9lzGM8kNEhmUqiWKErIYXBgI6nQKJgIFhoZuilI9bR52c5YJIX6glBi40X
         y+bJyxrWUdDd0B5BWQuvRJD4Fx7E7ZYbIqlvGn6R3sRVk0ncp+DifpATyUnGRnv/ClGu
         2BWW7G7R8IN/wrBxQ6ANthwUU21rYpL++j8rEUUbShqDHgg5kbyHlk4dy4yF/MyNwxOv
         vLI+VL8v5S9rbiOY532IwmltWs+ig43ZpMBQGdtPa8pQx/GRe8D8GMzqe1zLpy55y+tv
         BLvg==
X-Forwarded-Encrypted: i=1; AFNElJ+QkPuhBzkAxd/0nfsH4mDjT/1huH/7q2cFxR09VG0Gsd8bWttoZEKoDZ0I2pjZEVU71WNyn9RxDKC8@vger.kernel.org
X-Gm-Message-State: AOJu0YwMLeVeh73usLKIhJzzBvlk5y0VDe8PYwp+SNyvPn+uWgNXI/81
	sRqUa16ywGjFblvOq3ptu5Zl5USk/AZvEHZgZxVuTjTd5rCpnu4FO7kamXyLWxG7bzwanG8rxEm
	RaJ7QRnkgfBu0+Rk/23gut4b7fTWBgVY=
X-Gm-Gg: Acq92OFWM5YWdHXANpashjNIMJip0O1rCq7Gnly/EIvXw4Q+eIMoSDSqtAaJ2gD5R36
	akBJvTvKAC9kDRj+UiBRNnkV+okViQgVPjOCgmuAIoUvExkuN8WubTZ/deEL53lf21oYdxue9ZL
	PhgZ2/Co91DIAuTyYN1RHiQ6y8k2ymgyRc3k1XOnN8JzmMteLUpR4xXtBTrKRUkSHee6fNDeUFR
	W3Kq+5tr89YRC/2TfFylFbFLQGg11BGngFXvNXcxEENdZ6yR9HkxZXTGyZtf+JMzaL4yTJ8vADn
	Jyy4aR/Z1Y7KiVJXA0sQuaAN8rj7w6YjoBMUlQ1niwl11T7ftqFxqfIiwby1FoscI9O+ViU5PXX
	GApubXog=
X-Received: by 2002:a17:907:8b87:b0:bcd:2dbd:8241 with SMTP id
 a640c23a62f3a-bcd2dbd8f82mr647649566b.5.1778569533677; Tue, 12 May 2026
 00:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-7-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-7-3efcba579e88@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 10:04:56 +0300
X-Gm-Features: AVHnY4Ir9Mq_UQabCQBoJYVIwG-u_PpfuUXY4u_xRVfJJhNKJhDnleR-UqRVa9w
Message-ID: <CAHp75VfgrbEDLavMKFp2maFCH08RBUxF2wYhh56GG1HCq4ogmA@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] thermal: mediatek: add PMIC thermal support
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
> Add a new driver to support thermal monitoring on MediaTek PMICs.
>
> The driver retrieves calibration data from EFUSE, calculates the
> temperature using a linear interpolation, and registers the device with
> the thermal framework.
>
> Initial support is added for the mt6323 PMIC.

...

+ array_size.h

> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/err.h>
> +#include <linux/iio/consumer.h>

> +#include <linux/kernel.h>

No way the driver(s) nowadays use this header. Please, drop it and add
the ones that are really in use (there are missing ones).

> +#include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>

> +#include <linux/slab.h>

Is it used?

> +#include <linux/thermal.h>

Missing types.h

> +#include <linux/units.h>

...

> +#define MT6323_ADC_VOLTAGE_RANGE       1800
> +#define MT6323_ADC_RESOLUTION          32768

These two ring a bell with the first code patch. Are they the same?
Can they be deduplicated?

...

> +       ret =3D iio_read_channel_processed(sensor->adc_channel, &raw);
> +       if (ret < 0) {

Do we need that ' < 0' part? What is the meaning of positive returned
value (if any) and why do we ignore that? Same question to all similar
checks in the whole series.

> +               dev_err(sensor->mt->dev, "failed to read iio channel: %d\=
n",
> +                       ret);
> +               return ret;
> +       }

...

> +       /*
> +        * Temperature coefficient. The o_slope is a trim value applied t=
o
> +        * the base calibration

Respect English grammar and punctuation. Here is the period missing.

> +        */

...

> +static int mtk_pmic_thermal_extract_efuse_mt6323(struct mtk_pmic_thermal=
 *mt,
> +                                                u16 *buf)
> +{
> +       u32 reg;
> +       s32 vts, degc_cali, o_slope, o_slope_sign, id;
> +       int ret;

Better to keep reversed xmas tree order.

> +       return 0;
> +}

...

> +static int mtk_pmic_thermal_get_calib_data(struct device *dev,
> +                                          struct mtk_pmic_thermal *mt)
> +{

> +       void *buf __free(kfree) =3D NULL;

This is a discouraged way of defining variables with __free(). See below.

> +       struct nvmem_cell *cell;
> +       size_t len;
> +       int ret;
> +
> +       cell =3D nvmem_cell_get(dev, NULL);
> +       if (IS_ERR(cell))
> +               return PTR_ERR(cell);

> +       buf =3D nvmem_cell_read(cell, &len);

Should be rather here

       void *buf __free(kfree) =3D nvmem_cell_read(cell, &len);

> +       nvmem_cell_put(cell);
> +
> +       if (IS_ERR(buf)) {
> +               ret =3D PTR_ERR(buf);
> +               buf =3D NULL;
> +               return ret;
> +       }
> +
> +       if (len < 2 * sizeof(u16)) {
> +               dev_err(dev, "invalid calibration data length\n");
> +               return -EINVAL;

return dev_err_probe(...);

> +       }
> +
> +       ret =3D mt->data->extract_efuse(mt, buf);
> +       if (ret) {
> +               dev_info(dev, "device not calibrated, using default value=
s\n");
> +               mt->data->precalc(mt, MT6323_DEFAULT_VTS,
> +                                 MT6323_DEFAULT_DEGC_CALI,
> +                                 MT6323_DEFAULT_SLOPE,
> +                                 MT6323_DEFAULT_SLOPE_SIGN);
> +       }
> +
> +       return 0;
> +}
> +
> +static int mtk_pmic_thermal_init_sensor(struct mtk_pmic_thermal *mt, int=
 id)
> +{
> +       struct mtk_pmic_sensor *sensor =3D &mt->sensors[id];
> +       struct device *dev =3D mt->dev;
> +
> +       sensor->id =3D id;
> +       sensor->mt =3D mt;
> +
> +       if (mt->data->num_sensors > 1)
> +               sensor->adc_channel =3D devm_iio_channel_get(dev, mt->dat=
a->sensors[id]);
> +       else
> +               sensor->adc_channel =3D devm_iio_channel_get(dev, NULL);

> +

Unneeded blank line as the above and below are coupled semantically.

> +       if (IS_ERR(sensor->adc_channel))
> +               return dev_err_probe(dev, PTR_ERR(sensor->adc_channel),
> +                                    "failed to get channel %s\n",
> +                                    mt->data->sensors[id]);
> +
> +       sensor->tzdev =3D devm_thermal_of_zone_register(dev, id, sensor,
> +                                                     &mtk_pmic_thermal_o=
ps);
> +       if (IS_ERR(sensor->tzdev))
> +               return dev_err_probe(dev, PTR_ERR(sensor->tzdev),
> +                                    "failed to register thermal zone %d\=
n", id);
> +
> +       return 0;
> +}

...

> +static const struct of_device_id mtk_pmic_thermal_of_match[] =3D {
> +       { .compatible =3D "mediatek,mt6323-thermal",
> +         .data =3D &mt6323_thermal_data },
> +       { /* sentinel */ },

No comma for the terminator entry.

> +};

--=20
With Best Regards,
Andy Shevchenko
