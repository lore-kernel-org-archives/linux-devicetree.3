Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E022437E5E3
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 03:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505723; cv=pass; b=s4RxreezVHWIvf+mIWai/fM1TcQpdtYd9XSmb3bFgypofSJBWdd5KwmoyttBW24BajnwrlsN4kjAPgJe//zjzXw6Fg5/g1z9AZZ+fKDIuuCxfFZ7B3QT6tEuRMY/o/dsihIITn7Ic63Lp1U20gcZchUWgzoDRW5/aWLgkm7ad7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505723; c=relaxed/simple;
	bh=CklgY1sXfVgyvkz/nnXTLZMghYvDtJl3eJzU8TZh8UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fziwa9FVZMi5Gle+KhWc8hfv1YOkZlOsXayZ6kk3wW+cS4CNWL5heeFa0m4y00VMQ18rb4HEbpTxfidnjSg0J6A96RNUhPiL4ssc4WacmJRzc7nXzNnaCeapBjAFxBcFOPhdDOHygMtfLjklEYTPvusm6GnZV0Md/PNNB6tTg68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTpddQfk; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTpddQfk"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c74c469e8so3993581fa.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 20:35:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786505716; cv=none;
        d=google.com; s=arc-20260327;
        b=DXTyGcqUncuzOw56vazdK9Uo+E/JS1bInP2KPvQahCtZOPeoy9Gb+gUSd3N+mjNuQb
         3Qm8clnTgPyBePZIJEZsfMPOZfY5J80kjFYzN5fHy0w1fNcKacgtWbWB+XacQi3TOLNO
         36F8ni+J3vj/KRSF/3ruL3gkhLvluKZAMGQ1TS4IaHlGJhrxQwL0s/U0OdDdfDXqO9HP
         F/yW2/PdqS7g72ail54aP25w7hxTBD6n3i76YdFxSW71JcOlUgi056h2SoGwi38EobZC
         5s+SUfYWyhmS25lEbVqDBo1ufaHHAFl1MoggoGe5pkJH/4KeO/t2LgehmZ67odM+VJNa
         KRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3m08k4BNOUPTmHsq02i8m6Uba6N4vdh7eL9UA3IsZ40=;
        fh=T0gSxF8puJ/s0aSvAfMIbBlUEu9ujBifQUlQ932WY7E=;
        b=L1ltHATWeYXexEPGhW6VIlkkZ1nvAbh6g/oDWB9Bcxx7fGR1kVPfOfK15hqW9gQbXY
         G+Ao0iP9VcxW2YnWminxU+9Hq/LLpdQDyRfHbzksml7H99jTNSc+zsScPfbIR1MbAszt
         aGic7425Q6WcJURO0d30wJVy2JFIIHGtxZdw1EHfPD291CPL3cTrO2TdfFkosK3LzavC
         S1IKCdj3b4nddscAUFNKg3nMSe1nrrGePJ06T0G9RXZMh435CwOZ/O1Qu+M31yNjsJUl
         MQT2fxWp79FLYXINFV+wHqFqEoDCX6/nNN82ZEZhuZhLlq8Q/eZoSqts0VsIjnB8tPB4
         zQBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786505716; x=1787110516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3m08k4BNOUPTmHsq02i8m6Uba6N4vdh7eL9UA3IsZ40=;
        b=fTpddQfkPLhCk7htpxeH+yQbrIll3lI3wqhfp/wYqjdzXQZXt/snX4T1tePj44ZC9a
         y2K2mtDejuR3n4ekYhJHwiMO4GdcAfOjiet4D9FKWqf2LgsaSJJONPQeoNRjJJ/1UdvX
         gz40B3gMh2j4AMpf5PU+r9ZPeNgFD6mVc/9RL29bFN46TRThXvANTXwwmPkrlB/ZAeSo
         dIfDYzgjbBLXwRzfUmcdfRpYH1fnoUO16FTyql3xN3oHb3TK3AOWkuaox+PT0NGnlGiP
         8F25X53XE5Mv/B688kkVATkcKekaoxuNTFX81r9rIzrapdHsviKy5VBN1xeyZY+i/L7h
         QXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786505716; x=1787110516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3m08k4BNOUPTmHsq02i8m6Uba6N4vdh7eL9UA3IsZ40=;
        b=NbH9cutwlY/aFZp9G9DekQXQvYbTsqhFl6xT0flSrvdgUx99R3C73nCrRQb71E7rwj
         WaPUag+L8xqNtbRaEDLuz89jE7tElT89qKD55+6XtR2WnsLV/SOr2+hUqd0i1z8PKDgk
         iMXNmroEt+nxEVvxVL0bGd8Uob69YJ2KD5Fqp1RAEQ4gG5phVSdLwtLf1z0DhimPjPSP
         CXkMXpa4jl6XRKVFa2Kx/XPDfitOHqdhmGrocRmlAwPAqEHJaEickcnIRCAueHuJK5+7
         cq6lcC7ebPy9tKnBVbcuUhYh0mZroFs+VX+OSeZC5+xuotgwfzdM873pdDOW5hy1qzyz
         nCOg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4KwyQFZvAbXjvJv38gDzHPFJxafrAQxZlAH3hale/BPWnSBWTTGtfZcRJCV2/bySfcW+s1I4/RSUx@vger.kernel.org
X-Gm-Message-State: AOJu0YyGMRO+Pmy37QuygaaAHGr0fTGlBiBinIxwFedLRJpEPoa75ldg
	zmBb5TDdZIQ7PssHfHgpMmWMRSHtHp7/bDNj1gYHyt2p8M/vJPTp76UZlKcXDh52tOL2rBxgZeS
	Y3KSug32Xm7IoakwSgOvnJIf89acMmYA=
X-Gm-Gg: AR+sD13i41eK8oy72FXAq5A6hGl6+ZRvjlkerRHaB7L26+L1hsVBdoTC5xoonUIA7b9
	X0Nosj9CofPLdAieuiK9H/7c0LTmRgl12dpzp8OLMj5DxcuZQKYKT8kUPlJBtxDg9mvmJac2615
	MyXfujHIMUQN2+alU2Zno8N0YEAPaA921Z9wsHVhnPBQU83QXLHU60VGSMKjDUu6orxVdq2L7pc
	BBbH7ZzPhEZN6TB/YHCd98eTpD/J3yipIM6Wrcw8H6R/8zakwXrEnIVgrnKCEwKvmOB2VQ0jpkp
	+yekUJO0+MD2ZDwW/RGAGTlmxDf1kEEWQGc5enESNAatJg==
X-Received: by 2002:ac2:4acb:0:b0:5b2:b808:6900 with SMTP id
 2adb3069b0e04-5b44e2d07dfmr147840e87.2.1786505715902; Tue, 11 Aug 2026
 20:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-ti-ads112c04-driver-v4-0-ae704ac17241@gmail.com>
 <20260811-ti-ads112c04-driver-v4-2-ae704ac17241@gmail.com> <cd020926-9daf-4493-b0c1-6399a77fcf9c@baylibre.com>
In-Reply-To: <cd020926-9daf-4493-b0c1-6399a77fcf9c@baylibre.com>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 12 Aug 2026 11:38:04 +0800
X-Gm-Features: AUfX_myVCAvv9xo3CU6DQEz0ujVPMpK8JYFKOZhOEE0Jjxzj1xAP5mFrjq-NFLU
Message-ID: <CAF7HswPcqzqMUtkLkfd3zmVHN6DX-Kz+tysG8t5x=+JAH8V2aQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] iio: adc: ti-ads112c04: Add support for TI ADS112C04
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 10:18=E2=80=AFPM David Lechner <dlechner@baylibre.c=
om> wrote:
>
> On 8/10/26 9:48 PM, Kyle Hsieh wrote:
> > Add IIO driver support for the Texas Instruments ADS112C04 (16-bit)
> > delta-sigma ADCs.
> >
> > The driver implements:
> > - Single-shot conversions using the IIO raw read interface.
> > - Dynamic parsing of single-ended and differential channels from
> >   device tree child nodes.
> > - Hardware interrupt support via the DRDY pin, falling back to
> >   software polling if no IRQ is provided.
> > - Scale calculation based on the internal 2.048V reference.
> > - Reference voltage scaling via the regulator subsystem (refp-supply),
> >   falling back to the internal 2.048V reference if not specified.
> >   refn-supply is not yet supported.
> > - Hardware reset fallback using GPIO.
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> > ---
> >  MAINTAINERS                    |   1 +
> >  drivers/iio/adc/Kconfig        |  10 +
> >  drivers/iio/adc/Makefile       |   1 +
> >  drivers/iio/adc/ti-ads112c04.c | 425 +++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 437 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 417d74b6d6cc..f51fbda9d4b9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26992,6 +26992,7 @@ M:    Kyle Hsieh <kylehsieh1995@gmail.com>
> >  L:   linux-iio@vger.kernel.org
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> > +F:   drivers/iio/adc/ti-ads112c04.c
> >
> >  TI ADS112C14 ADC DRIVER
> >  M:   David Lechner <dlechner@baylibre.com>
> > diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> > index 990e7b3e7212..0ee50828f9e4 100644
> > --- a/drivers/iio/adc/Kconfig
> > +++ b/drivers/iio/adc/Kconfig
> > @@ -1817,6 +1817,16 @@ config TI_ADS1119
> >           This driver can also be built as a module. If so, the module =
will be
> >           called ti-ads1119.
> >
> > +config TI_ADS112C04
> > +    tristate "Texas Instruments ADS112C04 ADC"
> > +    depends on I2C
> > +    help
> > +      If you say yes here you get support for Texas Instruments
> > +      ADS112C04 (16-bit) I2C analog to digital converters.
> > +
> > +      This driver can also be built as a module. If so, the module wil=
l be
> > +      called ti-ads112c04.
> > +
> >  config TI_ADS112C14
> >       tristate "Texas Instruments ADS112C14/ADS122C14"
> >       depends on I2C
> > diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> > index dcec0abb03b7..d8acf2831fd2 100644
> > --- a/drivers/iio/adc/Makefile
> > +++ b/drivers/iio/adc/Makefile
> > @@ -155,6 +155,7 @@ obj-$(CONFIG_TI_ADS1015) +=3D ti-ads1015.o
> >  obj-$(CONFIG_TI_ADS1018) +=3D ti-ads1018.o
> >  obj-$(CONFIG_TI_ADS1100) +=3D ti-ads1100.o
> >  obj-$(CONFIG_TI_ADS1119) +=3D ti-ads1119.o
> > +obj-$(CONFIG_TI_ADS112C04) +=3D ti-ads112c04.o
> >  obj-$(CONFIG_TI_ADS112C14) +=3D ti-ads112c14.o
> >  obj-$(CONFIG_TI_ADS124S08) +=3D ti-ads124s08.o
> >  obj-$(CONFIG_TI_ADS1298) +=3D ti-ads1298.o
> > diff --git a/drivers/iio/adc/ti-ads112c04.c b/drivers/iio/adc/ti-ads112=
c04.c
> > new file mode 100644
> > index 000000000000..3a775da2ae23
> > --- /dev/null
> > +++ b/drivers/iio/adc/ti-ads112c04.c
> > @@ -0,0 +1,425 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Texas Instruments ADS112C04 16-bit I2C ADC driver
> > + *
> > + * Copyright (c) 2026 Kyle Hsieh <kylehsieh1995@gmail.com>
> > + *
> > + * Datasheet: https://www.ti.com/lit/ds/symlink/ads112c04.pdf
> > + * Based on TI Reference Code and standard Linux IIO framework.
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/bitops.h>
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/property.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/string.h>
> > +#include <linux/types.h>
> > +#include <linux/units.h>
> > +
> > +#include <linux/iio/iio.h>
> > +#include <linux/iio/sysfs.h>
> > +
> > +#define ADS112C04_CMD_RESET         0x06
> > +#define ADS112C04_CMD_START_SYNC    0x08
> > +#define ADS112C04_CMD_POWERDOWN     0x02
> > +#define ADS112C04_CMD_RDATA         0x10
> > +#define ADS112C04_CMD_RREG(reg)     (0x20 | ((reg) << 2))
> > +#define ADS112C04_CMD_WREG(reg)     (0x40 | ((reg) << 2))
> > +
> > +#define ADS112C04_REG_CONFIG0       0x00
> > +#define ADS112C04_REG_CONFIG1       0x01
> > +#define ADS112C04_REG_CONFIG2       0x02
> > +#define ADS112C04_REG_CONFIG3       0x03
> > +
> > +#define ADS112C04_CONFIG0_MUX         GENMASK(7, 4)
> > +#define ADS112C04_CONFIG0_PGA_BYPASS  BIT(0)
> > +#define ADS112C04_CONFIG2_DRDY        BIT(7)
> > +
>
> I think I mentioned before the preferred way to orgainze the fields
> under the corresponding register. And as below, there are more
> fields we are using that need macros here.
>
> > +struct ads112c04_state {
> > +     struct i2c_client *client;
> > +     /* Protects concurrent ADC reads and device configuration */
> > +     struct mutex lock;
> > +     struct completion completion;
> > +     int vref_mV;
> > +     u8 config0;
> > +     u8 config1;
> > +     bool has_refp;
>
> This isn't used outside of probe. Can just be passed as a function argume=
nt.
>
> > +};
> > +
>
> ...
>
> > +static irqreturn_t ads112c04_irq_handler(int irq, void *private)
> > +{
> > +     struct iio_dev *indio_dev =3D private;
> > +     struct ads112c04_state *st =3D iio_priv(indio_dev);
> > +
> > +     disable_irq_nosync(irq);
>
> As mentioned in this recent discussion [1], we should not be disabling th=
e IRQ.
> If there is a true need for it, we need lots of comments explaining why. =
Since
> we aren't doing buffered reads though, I can't see a reason why we would =
need
> it right now. Unless we are worried about spurious interrupts, in which c=
ase
> we should read the DRDY status bit before setting the completion here as =
that
> would be more robust.
>
> [1]: https://lore.kernel.org/linux-iio/20260802184126.04738251@jic23-huaw=
ei/
>
> Also, this ia a bug because we can't call syncronous code in an IRQ handl=
er.
> We would need to change it to a threaded IRQ handler.
>
> > +     complete(&st->completion);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static const struct iio_info ads112c04_info =3D {
> > +     .read_raw =3D ads112c04_read_raw,
> > +};
> > +
> > +static int ads112c04_parse_channels(struct iio_dev *indio_dev)
> > +{
> > +     struct device *dev =3D indio_dev->dev.parent;
> > +     struct ads112c04_state *st =3D iio_priv(indio_dev);
> > +     struct iio_chan_spec *channels;
> > +     u32 num_channels, pair[2];
> > +     int ret, i =3D 0;
> > +
> > +     num_channels =3D device_get_named_child_node_count(dev, "channel"=
);
> > +     if (!num_channels)
> > +             return dev_err_probe(dev, -EINVAL, "no channel subnodes f=
ound\n");
> > +
> > +     if (num_channels > 12)
> > +             return dev_err_probe(dev, -EINVAL,
> > +                                  "num of channel nodes exceeds 12\n")=
;
> > +
> > +     channels =3D devm_kcalloc(dev, num_channels, sizeof(*channels), G=
FP_KERNEL);
> > +     if (!channels)
> > +             return -ENOMEM;
> > +
> > +     device_for_each_named_child_node_scoped(dev, child, "channel") {
> > +             struct iio_chan_spec *spec =3D &channels[i];
> > +
> > +             if (fwnode_property_present(child, "excitation-channels")=
)
> > +                     return dev_err_probe(dev, -EOPNOTSUPP,
> > +                                          "excitation-channels is not =
supported yet\n");
> > +
> > +             if (fwnode_property_present(child, "reference-sources")) =
{
> > +                     const char *ref;
> > +
> > +                     ret =3D fwnode_property_read_string(child, "refer=
ence-sources", &ref);
> > +                     if (ret)
> > +                             return dev_err_probe(dev, ret,
> > +                                                  "failed to read refe=
rence-sources\n");
> > +
> > +                     if ((!strcmp(ref, "external") && !st->has_refp) |=
|
> > +                         (!strcmp(ref, "internal") && st->has_refp))
> > +                             return dev_err_probe(dev, -EINVAL,
> > +                                                  "reference-sources d=
oes not match refp-supply\n");
>
> As explained more below, this part needs comments to explain why it is
> the way it is since it is not implementing fully what is allowed by the
> devicetree bindings. And would return EOPNOTSUPP to be consistent that
> this is just something that is not implemented yet.
>
> > +             }
> > +
> > +             spec->type =3D IIO_VOLTAGE;
>
> I would add a REVISIT comment here to explain that when ti,refp-refn-resi=
stor-ohms is implemented,
> then we have the possibility of the channel being resistance instead of v=
otlage.
>
> > +             spec->indexed =3D 1;
> > +             spec->info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) | BIT=
(IIO_CHAN_INFO_SCALE);
> > +
> > +             if (fwnode_property_present(child, "single-channel")) {
> > +                     ret =3D fwnode_property_read_u32(child, "single-c=
hannel", &pair[0]);
> > +                     if (ret)
> > +                             return dev_err_probe(dev, ret,
> > +                                                  "failed to read sing=
le-channel property\n");
> > +
> > +                     if (pair[0] > 3)
> > +                             return dev_err_probe(dev, -EINVAL,
> > +                                                  "single-channel must=
 be 0-3\n");
> > +
> > +                     spec->channel =3D pair[0];
> > +                     spec->address =3D 0x08 + pair[0];
> > +             } else if (fwnode_property_present(child, "diff-channels"=
)) {
> > +                     ret =3D fwnode_property_read_u32_array(child, "di=
ff-channels", pair, 2);
> > +                     if (ret)
> > +                             return dev_err_probe(dev, ret,
> > +                                                  "failed to read diff=
-channels property\n");
> > +
> > +                     if (pair[0] > 3 || pair[1] > 3)
> > +                             return dev_err_probe(dev, -EINVAL,
> > +                                                  "diff-channels must =
be 0-3\n");
> > +
> > +                     spec->channel =3D pair[0];
> > +                     spec->channel2 =3D pair[1];
> > +                     spec->differential =3D 1;
> > +
> > +                     if (pair[0] =3D=3D 0 && pair[1] =3D=3D 1)
> > +                             spec->address =3D 0x00;
> > +                     else if (pair[0] =3D=3D 0 && pair[1] =3D=3D 2)
> > +                             spec->address =3D 0x01;
> > +                     else if (pair[0] =3D=3D 0 && pair[1] =3D=3D 3)
> > +                             spec->address =3D 0x02;
> > +                     else if (pair[0] =3D=3D 1 && pair[1] =3D=3D 0)
> > +                             spec->address =3D 0x03;
> > +                     else if (pair[0] =3D=3D 1 && pair[1] =3D=3D 2)
> > +                             spec->address =3D 0x04;
> > +                     else if (pair[0] =3D=3D 1 && pair[1] =3D=3D 3)
> > +                             spec->address =3D 0x05;
> > +                     else if (pair[0] =3D=3D 2 && pair[1] =3D=3D 3)
> > +                             spec->address =3D 0x06;
> > +                     else if (pair[0] =3D=3D 3 && pair[1] =3D=3D 2)
> > +                             spec->address =3D 0x07;
> > +                     else
> > +                             return dev_err_probe(dev, -EINVAL,
> > +                                                  "invalid diff-channe=
ls combination\n");
> > +             } else {
> > +                     return dev_err_probe(dev, -EINVAL,
> > +                                          "channel node must have sing=
le-channel or diff-channels\n");
> > +             }
> > +
> > +             i++;
> > +     }
> > +
> > +     indio_dev->channels =3D channels;
> > +     indio_dev->num_channels =3D i;
> > +
> > +     return 0;
> > +}
> > +
> > +#define ADS112C04_VREF_INTERNAL_MV   2048
>
> Usually we put this at the top with other macro definitions.
>
> > +
> > +static int ads112c04_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct iio_dev *indio_dev;
> > +     struct ads112c04_state *st;
> > +     struct gpio_desc *reset_gpio;
> > +     int ret;
> > +
> > +     indio_dev =3D devm_iio_device_alloc(dev, sizeof(*st));
> > +     if (!indio_dev)
> > +             return -ENOMEM;
> > +
> > +     st =3D iio_priv(indio_dev);
> > +     st->client =3D client;
> > +
> > +     ret =3D devm_mutex_init(dev, &st->lock);
> > +     if (ret)
> > +             return ret;
> > +
> > +     init_completion(&st->completion);
> > +
> > +     indio_dev->name =3D "ads112c04";
> > +     indio_dev->modes =3D INDIO_DIRECT_MODE;
> > +     indio_dev->info =3D &ads112c04_info;
> > +
> > +     /* Forward compatibility checks for unimplemented DT properties *=
/
> > +     if (device_property_present(dev, "refn-supply") ||
> > +         device_property_present(dev, "ti,refp-refn-resistor-ohms"))
> > +             return dev_err_probe(dev, -EOPNOTSUPP,
> > +                                  "refn-supply and external resistors =
are not supported yet\n");
> > +
> > +     st->has_refp =3D device_property_present(dev, "refp-supply");
> > +
> > +     ret =3D ads112c04_parse_channels(indio_dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D devm_regulator_get_enable(dev, "avdd");
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to get avdd regula=
tor\n");
> > +
> > +     ret =3D devm_regulator_get_enable(dev, "dvdd");
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to get dvdd regula=
tor\n");
> > +
> > +     if (device_property_present(dev, "refp-supply")) {
>
> This can just be st->has_refp now.
>
> > +             ret =3D devm_regulator_get_enable_read_voltage(dev, "refp=
");
> > +             if (ret < 0)
> > +                     return dev_err_probe(dev, ret,
> > +                                          "failed to get refp voltage\=
n");
> > +
> > +             st->vref_mV =3D ret / (MICRO / MILLI);
> > +             st->config1 =3D 0x02;
>
> I've asked before... these values should have macros to explain what
> they are and be using FIELD_PREP().
>
> > +     } else {
> > +             st->vref_mV =3D ADS112C04_VREF_INTERNAL_MV;
> > +             st->config1 =3D 0x00;
> > +     }
>
> I still don't think storing vref like this is a good idea since it should
> be per-channel. If you really are against implementing it in a more
> future-proof way, then it needs lots of comments explaining why it is
> implemented this way instead and how one would go about doing it the "rig=
ht
> way" in the future.
>
> > +
> > +     /* Power-On Reset (POR) delay */
> > +     fsleep(50 * USEC_PER_MSEC);
> > +
> > +     /* Requesting OUT_HIGH asserts the active-low reset pin immediate=
ly */
> > +     reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HI=
GH);
> > +     if (IS_ERR(reset_gpio))
> > +             return PTR_ERR(reset_gpio);
> > +
> > +     if (reset_gpio) {
> > +             fsleep(1000);
> > +             gpiod_set_value_cansleep(reset_gpio, 0);
> > +     } else {
> > +             ret =3D ads112c04_write_cmd(client, ADS112C04_CMD_RESET);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> > +     fsleep(1000);
> > +
> > +     /* Bypass PGA for now to allow full-scale single-ended measuremen=
ts */
> > +     st->config0 =3D ADS112C04_CONFIG0_PGA_BYPASS;
> > +     ret =3D ads112c04_write_reg(client, ADS112C04_REG_CONFIG0, st->co=
nfig0);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D ads112c04_write_reg(client, ADS112C04_REG_CONFIG1, st->co=
nfig1);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (client->irq > 0) {
> > +             ret =3D devm_request_irq(dev, client->irq,
> > +                                    ads112c04_irq_handler,
> > +                                    0,
>
> I think I've asked twice now to move this 0 on the previous line.
> If you don't agree with that, it is fine, but we just ask that you
> reply to the suggestion with an explanation to state your reasoning.
> Otherwise, it comes across as carelessness that you continue to
> ignore suggestions. This is not the only suggestoin that has been
> silently ignored. You might want to go back to the previous revisions
> and see if you missed anything else.
Clarifications on my previous mail.

IRQ: I will use devm_request_threaded_irq() with a NULL primary handler and
IRQF_ONESHOT. disable_irq_nosync() is gone and the handler only calls
complete(). This also removes the bare `0` you asked about on v2 and v3,
with the arguments packed rather than one per line:

ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
ads112c04_irq_handler,
IRQF_ONESHOT, indio_dev->name,
indio_dev);

I left out the DRDY status read for now, since conversions are
single-shot under the mutex. Happy to add it if you prefer.
>
> > +                                    indio_dev->name, indio_dev);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return devm_iio_device_register(dev, indio_dev);
> > +}
> > +
