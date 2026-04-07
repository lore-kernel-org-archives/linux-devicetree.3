Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5656338B7DB
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557832; cv=pass; b=HpXzCtaKHDS18N3d83ohbmFY8wYxy+1OuBbylLPkVOrYKnsiGdXkca4E2lOVuRw3l6iVoBz+WgGvIytZYplB3SlVLFOT6jhkI0LDmot93WT4Wdwj8OGkshAjupOa/2s6nUcuJ3ev125/Gg9yImP4s9XQuFKfkxIAPHnAWEMIRpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557832; c=relaxed/simple;
	bh=Ba+EPBIXHLX5yi91gfChxyHyKGIt/RO5OcF1N/vWGsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itlqbRjpt3LnyFpBvaNKskMjCD1unhaU/wzJs/byWLFHq1CEEdO9GR4bU3gND1xcW1/nI7dWd1mZOTIFiANGLkn/fiYjPuDBzPnGKPiMQyaff/OhYp+Df4KSBqxNtUFmVe4P5V1aaoXqRXNjToYAAWa7b9NvOjF89ts7o1AXZjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhPqlvBj; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhPqlvBj"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c156c4a9efso6085543eec.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 03:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775557830; cv=none;
        d=google.com; s=arc-20240605;
        b=OjhdMGS2kTH+A8Nx2AdCPjhrnRRyGTt/3GGQ6LF73ztMccZf/TaWoBDgd0WZO8bx7K
         CvYqHn27noC2vxObDSc1NXci6JNJ0cpLkXIREuLTABxq/FIi3fnMxnsWwJFuLsMvQcaY
         rcjFk+Z5TDb0kmdzT/kcOh3GsrtIDU0v06DOWzWkpcD7urfZ0yCdHflmKg9uAYQLZBg9
         H9+F8O5lmacqw2li+FVlYiRqPLy+pMwphVQuqFAStX2yQ6edgzbyzxQCEn2LhrjrE8yt
         /fhj9w22Esbcki7JoVuNWF3FSPoJHqk6Kcn2Z7hKK7IYJUbvs1NExM+ZtnX2zqGFpdkj
         5hMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LU59ZAtUrZsopurC7wrRYfVPPQHDPwx0HnnnYqVagoU=;
        fh=nW4QBJrmtm6Xfst4ugSTCC8xnqGpFffwwIwgrbD4Oqw=;
        b=YQdxtHko51vVkiamhmAY21zYUkhIaLwX082oAqIUauMv+VnxJSfy2TpHJ8/bVNwP++
         XrJQtwEq6yzol9fgRVKbt1bhIg1quKPq3gWlpLczL8TzSkUvLVRbPjRK9L/qwIqG+6Jg
         A2PdkDV1Bg72yoY5KeuxgdHsk3FLHKMbmOc2XCRzrfuibQx9JzvaNjQEZeMyibZJlB1I
         Etttu02mGu2kYcgX4+ZGe2aXxp4zibcuLS7Xjax9IVyh7qXeYGB3FdBgMQ1XM6ZCocg7
         cxY3z1M8Xgrcx+T7D8d/Krut9NDyv35MXBar14BqbUJDNrJO6hzh62mIW++9UO8tPD7h
         xBSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775557830; x=1776162630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LU59ZAtUrZsopurC7wrRYfVPPQHDPwx0HnnnYqVagoU=;
        b=OhPqlvBjov9tH41oQAt6fX3Pqt0VWiTl7dBBEHS98f1PL5X/aWBMrx5rE/aKiiiIoi
         IgS1LePj7T+Vq4NKcyERWizj7xY6LnMq7Xo1pGTsCSD5chXG9Y+MaKgBOgNsSfqqLq8h
         KqbFLhcUpEX5q953l/dTWUUURp9rtP5Bk8uQDwxtYIaT/vxDaCPc8FEYeTRT79b7R1Cn
         uA7TuKnSQOHg9RqE/i5OR6Qm6vCNY3c6oyX92DMle+tR+RkJh4KfAMMDZzen0fKU4o5+
         zTluE8ocuABIS1gfmc6p6Jysciamji/cnVZCH2dfsuZE5KPe3dfQJ0r8Gk4s30+eL0Hq
         LKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557830; x=1776162630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LU59ZAtUrZsopurC7wrRYfVPPQHDPwx0HnnnYqVagoU=;
        b=ssvnJU1lhee2XcyCW045vrF23hUcx1xjBbWrn73Go/abxo2qPSmI2N+Hi2mCh7oFOp
         3Holy5fiRaEzHate9c2Qli36DNMxl4szOntF7dIx7rnHlSxomBNJgr9zb8lDisOhNOq/
         K7EE/KLvqX3wdPEY+R+qRT7hg6NQmiPaD9VUr+S8Bac9AjnxCmZCxg1Bwn8koQ+BwgD3
         PmVOeoHkiUGAroPun+k4VeG7tiMYW6pLXog3eAlNs519DZfctJoW+oXdbLRKyZcbPnAA
         DIWj7QBFCc50zmmi4mC28B1s5a/aiqUYgHKCic26pbDH5C+I/BXgzZDgGuxE7ODmNZxp
         mYtw==
X-Forwarded-Encrypted: i=1; AJvYcCXKswOsMmec9KwNG7JKeetNPn8rUSY1+VSvMrFg3zuC9U9nTdArdBa5pemGq7RkS9yNolJ+B/wSE5Ms@vger.kernel.org
X-Gm-Message-State: AOJu0YyvPwxpv2bvr0r0icrtb86CGIzBXchHohrIG0wFaaxDB5Ekt78R
	ZsZsCjuQb3tx9iw00hW1EeGkfUkwJFzXM2h+qBpHLAKaQBNSbAMev6Qc41rpYiSePyxfooy+zWD
	iXYoeXXrfH3drGRUMmDdhJrEHNmo+AUk=
X-Gm-Gg: AeBDievfmivPOpPvtwkaImrie4/ZFlKTqELoiucvp7wL2DjO4sGdLcQ1WCacypP3yGw
	NCzKE+lDbViGXdllIqNU9BNL3bYD1UrojXWWO3kvp2YPM1hl0sUM+8gYnUEeWmkznmMIKgoFKfR
	v79B5ipbOImtqqQca9WVynTbef9UFBLllB7tDbcYYDbkfz9rw3uukIkn5QNZAsSu+2ID6tm5c1d
	V7jk2BXW0A64euL5bOTmFRyfPA++AMVhSjzv43m5rYGr6h+2ApT+uBZh6J5ZlMeJrNJL9LVSsOE
	JlMG7pTDD2DMM+Egcbw=
X-Received: by 2002:a05:7300:6d23:b0:2a4:3593:466c with SMTP id
 5a478bee46e88-2cbf9fe2d96mr8206822eec.8.1775557830390; Tue, 07 Apr 2026
 03:30:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406101647.109667-1-Ashish.Yadav@infineon.com> <20260406101647.109667-3-Ashish.Yadav@infineon.com>
In-Reply-To: <20260406101647.109667-3-Ashish.Yadav@infineon.com>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Tue, 7 Apr 2026 16:00:18 +0530
X-Gm-Features: AQROBzCqb84kfIhnX1-X0hgBC6HBnxqF1ScBqNXT6675NCDCLNPgDaeYR8SOFQc
Message-ID: <CAJKbuCYuor3AstSOuzEK_byqwgdkLsaE9Z9k7kfb3WKpyjK4=g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp720
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

In this patch, info about vdd-vin-supply is added through
devm_regulator_get_enable().
https://lore.kernel.org/all/20260406101647.109667-2-Ashish.Yadav@infineon.c=
om/

Thanks & Regards
   Ashish Yadav

On Mon, Apr 6, 2026 at 3:47=E2=80=AFPM ASHISH YADAV <ashishyadav78@gmail.co=
m> wrote:
>
> From: Ashish Yadav <ashish.yadav@infineon.com>
>
> Add the pmbus driver for Infineon XDP720 Digital eFuse Controller.
>
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---
> XDP720 Digital eFuse Controller provides accurate system telemetry
> (V, I, P, T) and reports analog current at the IMON pin for post-processi=
ng.
>
> The Current and Power measurement depends on the RIMON and GIMON values.
> Please look into data sheet sections 5.4.2 and 5.4.4 for more details:
> https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp72=
0-001-datasheet-en.pdf
>
> The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Regis=
ter.
> The value of RIMON (kohm) can be provided by the user through device tree=
 using
> infineon,rimon-micro-ohms  property.
> ---
>  drivers/hwmon/pmbus/Kconfig  |   9 +++
>  drivers/hwmon/pmbus/Makefile |   1 +
>  drivers/hwmon/pmbus/xdp720.c | 128 +++++++++++++++++++++++++++++++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/xdp720.c
>
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index fc1273abe357..c419e3ecce90 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -702,6 +702,15 @@ config SENSORS_XDP710
>           This driver can also be built as a module. If so, the module wi=
ll
>           be called xdp710.
>
> +config SENSORS_XDP720
> +       tristate "Infineon XDP720 family"
> +       help
> +         If you say yes here you get hardware monitoring support for Inf=
ineon
> +         XDP720.
> +
> +         This driver can also be built as a module. If so, the module wi=
ll
> +         be called xdp720.
> +
>  config SENSORS_XDPE152
>         tristate "Infineon XDPE152 family"
>         help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index d6c86924f887..1cac7ccae79f 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -68,6 +68,7 @@ obj-$(CONFIG_SENSORS_TPS546D24)       +=3D tps546d24.o
>  obj-$(CONFIG_SENSORS_UCD9000)  +=3D ucd9000.o
>  obj-$(CONFIG_SENSORS_UCD9200)  +=3D ucd9200.o
>  obj-$(CONFIG_SENSORS_XDP710)   +=3D xdp710.o
> +obj-$(CONFIG_SENSORS_XDP720)   +=3D xdp720.o
>  obj-$(CONFIG_SENSORS_XDPE122)  +=3D xdpe12284.o
>  obj-$(CONFIG_SENSORS_XDPE152)  +=3D xdpe152c4.o
>  obj-$(CONFIG_SENSORS_ZL6100)   +=3D zl6100.o
> diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
> new file mode 100644
> index 000000000000..8729a771f216
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/xdp720.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for Infineon XDP720 Digital eFuse Controll=
er
> + *
> + * Copyright (c) 2026 Infineon Technologies. All rights reserved.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/of_device.h>
> +#include <linux/bitops.h>
> +#include <linux/math64.h>
> +#include "pmbus.h"
> +
> +/*
> + * The IMON resistor required to generate the system overcurrent protect=
ion.
> + * Arbitrary default Rimon value: 2k Ohm
> + */
> +#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
> +#define XDP720_TELEMETRY_AVG 0xE9
> +
> +static struct pmbus_driver_info xdp720_info =3D {
> +       .pages =3D 1,
> +       .format[PSC_VOLTAGE_IN] =3D direct,
> +       .format[PSC_VOLTAGE_OUT] =3D direct,
> +       .format[PSC_CURRENT_OUT] =3D direct,
> +       .format[PSC_POWER] =3D direct,
> +       .format[PSC_TEMPERATURE] =3D direct,
> +
> +       .m[PSC_VOLTAGE_IN] =3D 4653,
> +       .b[PSC_VOLTAGE_IN] =3D 0,
> +       .R[PSC_VOLTAGE_IN] =3D -2,
> +       .m[PSC_VOLTAGE_OUT] =3D 4653,
> +       .b[PSC_VOLTAGE_OUT] =3D 0,
> +       .R[PSC_VOLTAGE_OUT] =3D -2,
> +       /*
> +        * Current and Power measurement depends on the RIMON (kOhm) and
> +        * GIMON(microA/A) values.
> +        */
> +       .m[PSC_CURRENT_OUT] =3D 24668,
> +       .b[PSC_CURRENT_OUT] =3D 0,
> +       .R[PSC_CURRENT_OUT] =3D -4,
> +       .m[PSC_POWER] =3D 4486,
> +       .b[PSC_POWER] =3D 0,
> +       .R[PSC_POWER] =3D -1,
> +       .m[PSC_TEMPERATURE] =3D 54,
> +       .b[PSC_TEMPERATURE] =3D 22521,
> +       .R[PSC_TEMPERATURE] =3D -1,
> +
> +       .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
> +                  PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_=
INPUT |
> +                  PMBUS_HAVE_STATUS_TEMP,
> +};
> +
> +static int xdp720_probe(struct i2c_client *client)
> +{
> +       struct pmbus_driver_info *info;
> +       int ret;
> +       u32 rimon;
> +       int gimon;
> +
> +       info =3D devm_kmemdup(&client->dev, &xdp720_info, sizeof(*info),
> +                           GFP_KERNEL);
> +       if (!info)
> +               return -ENOMEM;
> +
> +       ret =3D devm_regulator_get_enable(&client->dev, "vdd-vin");
> +       if (ret)
> +               return dev_err_probe(&client->dev, ret,
> +                       "failed to enable vdd-vin supply\n");
> +
> +       ret =3D i2c_smbus_read_word_data(client, XDP720_TELEMETRY_AVG);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
> +               return ret;
> +       }
> +
> +       ret >>=3D 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
> +       ret &=3D GENMASK(0, 0);
> +       if (ret =3D=3D 1)
> +               gimon =3D 18200; /* output gain 18.2 microA/A */
> +       else
> +               gimon =3D 9100; /* output gain 9.1 microA/A */
> +
> +       if (of_property_read_u32(client->dev.of_node,
> +                                "infineon,rimon-micro-ohms", &rimon))
> +               rimon =3D XDP720_DEFAULT_RIMON; /* Default if not set via=
 DT */
> +       if (rimon =3D=3D 0)
> +               return -EINVAL;
> +
> +       /* Adapt the current and power scale for each instance */
> +       info->m[PSC_CURRENT_OUT] =3D DIV64_U64_ROUND_CLOSEST((u64)
> +               info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000UL=
L);
> +       info->m[PSC_POWER] =3D DIV64_U64_ROUND_CLOSEST((u64)
> +               info->m[PSC_POWER] * rimon * gimon, 1000000000000000ULL);
> +
> +       return pmbus_do_probe(client, info);
> +}
> +
> +static const struct of_device_id xdp720_of_match[] =3D {
> +       { .compatible =3D "infineon,xdp720" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, xdp720_of_match);
> +
> +static const struct i2c_device_id xdp720_id[] =3D {
> +       { "xdp720" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(i2c, xdp720_id);
> +
> +static struct i2c_driver xdp720_driver =3D {
> +       .driver =3D {
> +                  .name =3D "xdp720",
> +                  .of_match_table =3D xdp720_of_match,
> +       },
> +       .probe =3D xdp720_probe,
> +       .id_table =3D xdp720_id,
> +};
> +
> +module_i2c_driver(xdp720_driver);
> +
> +MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
> +MODULE_DESCRIPTION("PMBus driver for Infineon XDP720 Digital eFuse Contr=
oller");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
> --
> 2.39.5
>
