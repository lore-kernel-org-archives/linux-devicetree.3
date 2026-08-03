Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AA039BFE1
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740337; cv=pass; b=FVDk1xHs2HIHBya9mko2PSnuGv08Pa5Jl2zJLPcICk8oJxo2/RQwsIrtmkcn32hL1F1P4gkSV6h1lDZOWsG1Cp24Ehv9c1oL5RIuqf3/6qWxi0XhVMhgxk6TlRBWX3NxIKQtPKFWbzi0s/hLOBKbnb2cl0yqG77YaK10emvScMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740337; c=relaxed/simple;
	bh=gSmx9ZBBcxoDeonkeemPC8xMd0G0yz0rJDYct+0QRwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRJ+b3kNu3kNIiHlRcW79axS+9i/+9sY7uz8foHKAEUxTpVKCBhoZfFtULQxceQUPPJE/F1ce8p1KFKaHEJav+r486u7veBAi0q0rBnOHIg6/wAJiXOpDubW8okLlccZOXY0j9CnyrGKhehwRy+QJnArxibuKoDID3ElBsZ26DQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBKYviFg; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBKYviFg"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aea0fff535so3380426e87.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 23:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785740331; cv=none;
        d=google.com; s=arc-20260327;
        b=WYa8HDL3QGi8r1H2+fjtz27ftDgNBcoPe3Spt7fm4R1G020jerla1OB6okhF3iQXjm
         GfJ5AKNp+g4Gt4PMdwZqNCmgbR9CYlbactIvUjaY/abTTbNKMREcpsmdrNg2kOKlfF2T
         hG9t7uMwyPDmSiK1ANtqTl2PKMni+NjNwzSZj4YYht4w3vlKZI+j37v66ml6pS1SLfk/
         njtnLAEJ1dhdWoHjTZTJvM/rQvQgRNoscBjGTSomIpXrBb9Ei3G9PUd8bLGGtS+lJBw3
         oxQt2zr4hEZmvgsoT61Q6sCOzjqtzpdLjdEIsmQvndJwpMplcpI//YnV9XeUj++e/Aqc
         aSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IjUP7pUqUMRHLXTiF/0wFiu4Jttogi2bXHJtNWk/CkE=;
        fh=2yobxDiKT8kKj6CNhn3PXDPzh80DZFbsws9fr+C7PMs=;
        b=jVdIGjt6SMhCL/r7c3YAnr8YAuzwy5fSr5O1wPQAtY2QxVnscp2eHft0xR2LIIQ3CB
         AqEXm2xPKG1/TZ1wDfHqJn3qWbkF0yRkmkes6IX+Zjz+6w9L8yGCzeHilZaBXiLFqWkh
         h6o01/86v7SiBVDKH6d8P2JFarKlRBNZi4UOG3OXYEC1LsHTEgv+Cz8cfzeQ/SX9sczd
         PZ8TJamHwvGTtsglecjIC3W4UrLm1P0WySyYgvbguH56P5VP7lTcFjJuw/Y9RrZYsqWL
         Ymw827FBMdv5Y+hDcymiuPuywwxaMNuEzcL4Ixn8OxFQhGlRys8AosE+fSaWknG53BQO
         n/mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785740331; x=1786345131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IjUP7pUqUMRHLXTiF/0wFiu4Jttogi2bXHJtNWk/CkE=;
        b=pBKYviFg5ZhsvP/3Oyrbx8qvTY9va7XPW67atSsKJaWmhdeq3UU/wmUjj1Trelk7/E
         Ej0Wi3fex2KzVzld+ICri0+byRAYKflYI+4PsfvIol5aYXcjn2Ou2iy5WHBdUBkPikEq
         rLN2d2FSt/gq/zAZywW6NVwmeBYpT1bFhqOJ5JfIu0LW6T9HMEH4LhOQ+H9HesDTCagU
         QbcuS7cE2/yvDT9cl1AXn9qS8X5Megi9UGBMO3JMB+VgVxPjG9liXkrSuY7Ab6H2+UHd
         UM7599fAaaPPPrcDJEDHpd74MzB/fOL9WmA+KkEiQnwcE/5uVIaAnw3Z71NbamwfP01e
         flGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785740331; x=1786345131;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjUP7pUqUMRHLXTiF/0wFiu4Jttogi2bXHJtNWk/CkE=;
        b=svAB++X75T4WyAKLEry+3b/qpi/IfeBKK34yHAs3GC+2448K/C/HzmQ1mzVlzHWD3i
         wf3J9Kka1FtDT+s/WwU9vnlhT7+gnS0I9jQYebhOBSfTTaOeO9prts1BAt+zqrB/t0aT
         FxZx9F8JmWBRbGiC5fXrvuSJvqFbPKkEs3zYPclAJcnKD2XqH0GlDe0UFtSuGieNsyHL
         UG6c7psM8/wlfLJP+QGJpSpRGE7LuDS8/xszocpBQzDTbGUuAKyzXv1uChPR0eArJDJ4
         UqizzrlzGyT0a6D9lA4D/aOf2J4nMGIl4RUcwE9OhBwXvO8/2LBUi2RhQ0zxBiLrfQ38
         z9Pg==
X-Forwarded-Encrypted: i=1; AHgh+Rpz6Po98QhF+1CRvA2RoMNqvVHVSEJVBfzMSoh6wu1XNdgb/nWqnu9gTw8rM7/WRfrKiqBuUmixw2YI@vger.kernel.org
X-Gm-Message-State: AOJu0YxOTXHP4+d8Hl/LV5Jyp44Xr2UYvz4Y0pjTHHOlkJZiTRZ3g3qx
	gC9hfKIleazgQuD0TUF4x0qTyWoEYmUsIemzae/AQ13/F8q3jkh2IGHeBemd1IRr3lnupV3IwO5
	xnduCFo0M35ykoGB6DDkCPz/NqtGA2C4=
X-Gm-Gg: AR+sD13mH9OyOvNNCwhozeNR12PJC/RcoYIXu78FKoiJd1mlyyj1j2Hqf8mY3g/03qu
	jqHiXeHGvvEUU35bIHiqM2mjvFaEtjPICO5fPbfmJK1yt7/gatNuQnZkfoDtfL4s7mhgmyu4Npt
	OJ9p62k2e8HyCs4klYXMuOTHpVBqxmx/fIRqJWNUvO/GSoElQ7X4mGaYh/dF3M5vXpxoVH9uYno
	bUbCrgoiTNDYLXSt2bHo8hqYsDF0VIcfP4DVlNzCotciAeuns/07rz+TOhcIwheeNp+eV/yaE2k
	i0Q+ZlaSMlj1C+Xytak6ucmZzz6ShG0zdX/bsnZqCpQtEg==
X-Received: by 2002:a05:6512:2395:b0:5b0:197b:9811 with SMTP id
 2adb3069b0e04-5b2e4f882femr1975592e87.53.1785740330828; Sun, 02 Aug 2026
 23:58:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731-ti-ads112c04-driver-v2-0-aab0168c3c01@gmail.com>
 <20260731-ti-ads112c04-driver-v2-2-aab0168c3c01@gmail.com> <20260731112750.00002c37@gmail.com>
In-Reply-To: <20260731112750.00002c37@gmail.com>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Mon, 3 Aug 2026 15:00:40 +0800
X-Gm-Features: AUfX_my4jcK1g34FvgNa06aw51CVXPxcy-VlkkEnupEcNtcG6P_AVmWEbACAsOg
Message-ID: <CAF7HswM-yk2tcWRv+hxLuFcvkDseY5_5CBur3jzdUAVORFFPOQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads112c04: Add support for TI ADS112C04
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joshua,
Thanks for the quick and thorough review!

On Fri, Jul 31, 2026 at 5:27=E2=80=AFPM Joshua Crofts <joshua.crofts1@gmail=
.com> wrote:
>
> On Fri, 31 Jul 2026 10:58:25 +0800
> Kyle Hsieh <kylehsieh1995@gmail.com> wrote:
> > diff --git a/drivers/iio/adc/ti-ads112c04.c b/drivers/iio/adc/ti-ads112=
c04.c
> > new file mode 100644
> > index 000000000000..28d3be81934f
> > --- /dev/null
> > +++ b/drivers/iio/adc/ti-ads112c04.c
>
> Hi Kyle, quick review from me, comments inline. Additionally, please
> check Sashiko's review as there are some move severe issues (mostly
> I2C stuff), see it here:
> https://sashiko.dev/#/patchset/20260731-ti-ads112c04-driver-v2-0-aab0168c=
3c01%40gmail.com
>
> > @@ -0,0 +1,378 @@
> > +// SPDX-License-Identifier: GPL-2=E3=84=8F.0-only
> > +/*
> > + * Texas Instruments ADS112C04 16-bit I2C ADC driver
> > + * Based on TI Reference Code and standard Linux IIO framework.
>
> Usually we'd add a Copyright (c) 2026 your_name_here your_email_here
> and maybe a datasheet link for easy lookup.
I will add both the copyright line and the datasheet link to the file heade=
r.
>
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/i2c.h>
> > +#include <linux/delay.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/mutex.h>
>
> Please sort your headers alphabetically.
>
> > +#include <linux/iio/iio.h>
> > +#include <linux/iio/sysfs.h>
>
> Group <linux/iio/*> headers separately and add them after the generic
> <linux/*> headers.
>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/property.h>
> > +#include <linux/gpio/consumer.h>
>
> Additionally, you're missing jiffies.h, err.h, bitops.h, types.h
All headers are now sorted alphabetically, correctly grouped, and the
missing ones have been included.
>
> > +/* ADS112C04 Commands */
>
> Unnecessary comment IMO, it's clear that these are commands from the
> *_CMD_* part (same goes for your registers comment).
Removed the redundant block comments for commands, registers, and masks.
>
> > +#define ADS112C04_CMD_RESET         0x06
> > +#define ADS112C04_CMD_START_SYNC    0x08
> > +#define ADS112C04_CMD_POWERDOWN     0x02
> > +#define ADS112C04_CMD_RDATA         0x10
> > +#define ADS112C04_CMD_RREG(reg)     (0x20 | ((reg) << 2))
> > +#define ADS112C04_CMD_WREG(reg)     (0x40 | ((reg) << 2))
> > +
> > +/* Registers */
> > +#define ADS112C04_REG_CONFIG0       0x00
> > +#define ADS112C04_REG_CONFIG1       0x01
> > +#define ADS112C04_REG_CONFIG2       0x02
> > +#define ADS112C04_REG_CONFIG3       0x03
> > +
> > +#define ADS112C04_DRDY_MASK         BIT(7)
> > +#define ADS112C04_MUX_MASK          GENMASK(7, 4)
> > +
> > +struct ads112c04_state {
> > +     struct i2c_client *client;
> > +     /* Protects concurrent ADC reads and device configuration */
> > +     struct mutex lock;
> > +     struct completion completion;
> > +     struct regulator *vref_reg;
> > +     int vref_mv;
>
> vref_mV, this is a good exception to the no camelCase rule, as it's a SI
> unit.
Renamed vref_mv to vref_mV.
>
> > +     u8 config0;
> > +     u8 config1;
> > +};
> > +
> > +static int ads112c04_write_cmd(struct i2c_client *client, u8 cmd)
> > +{
> > +     int ret =3D i2c_master_send(client, &cmd, 1);
> > +
> > +     return ret < 0 ? ret : 0;
> > +}
> > +
> > +static int ads112c04_read_reg(struct i2c_client *client, u8 reg, u8 *v=
al)
> > +{
> > +     u8 cmd =3D ADS112C04_CMD_RREG(reg);
> > +     int ret;
> > +
> > +     ret =3D i2c_master_send(client, &cmd, 1);
>
> i2c_master_send returns either the amount of bytes sent or an error
> code. If the device NACKs, the function will return 0 (zero bytes sent)
> but this will be interpreted as success.
>
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D i2c_master_recv(client, val, 1);
> > +     return ret < 0 ? ret : 0;
> > +}
> > +
> > +static int ads112c04_write_reg(struct i2c_client *client, u8 reg, u8 v=
al)
> > +{
> > +     u8 buf[2] =3D { ADS112C04_CMD_WREG(reg), val };
> > +     int ret;
> > +
> > +     ret =3D i2c_master_send(client, buf, 2);
>
> Use sizeof, don't hardcode the buffer sizes.
>
> > +     return ret < 0 ? ret : 0;
> > +}
> > +
> > +static int ads112c04_wait_for_data(struct ads112c04_state *st)
> > +{
> > +     int ret;
> > +     u8 val;
> > +
> > +     if (st->client->irq > 0) {
> > +             ret =3D wait_for_completion_timeout(&st->completion, msec=
s_to_jiffies(1000));
> > +             if (!ret)
> > +                     return -ETIMEDOUT;
> > +             return 0;
> > +     }
> > +
> > +     return read_poll_timeout(ads112c04_read_reg, ret,
> > +                              (ret < 0 || (val & ADS112C04_DRDY_MASK))=
,
> > +                              1000, 1000000, false,
>
> Sashiko points out that read_poll_timeout discards any I2C read errors an=
d returns
> 0. Remove the ret < 0 condition.
I will explicitly check the I2C return value right after the
read_poll_timeout macro finishes.
>
> > +                              st->client, ADS112C04_REG_CONFIG2, &val)=
;
> > +}
> > +
> > +static int ads112c04_read_data(struct ads112c04_state *st, int *val)
> > +{
> > +     u8 cmd =3D ADS112C04_CMD_RDATA;
> > +     __be16 buf;
> > +     int ret;
> > +
> > +     ret =3D i2c_master_send(st->client, &cmd, 1);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D i2c_master_recv(st->client, (u8 *)&buf, 2);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     *val =3D sign_extend32(be16_to_cpu(buf), 15);
> > +     return 0;
> > +}
> > +
> > +static int ads112c04_get_adc_result(struct ads112c04_state *st,
> > +                                 struct iio_chan_spec const *chan,
> > +                                 int *val)
> > +{
> > +     int ret;
> > +     u8 mux, new_config0;
>
> Reverse xmas tree order please.
> > +
> > +     mux =3D FIELD_PREP(ADS112C04_MUX_MASK, chan->address);
> > +     new_config0 =3D (st->config0 & 0x0F) | mux;
> > +
> > +     if (st->config0 !=3D new_config0) {
> > +             ret =3D ads112c04_write_reg(st->client, ADS112C04_REG_CON=
FIG0, new_config0);
> > +             if (ret < 0)
> > +                     return ret;
> > +             st->config0 =3D new_config0;
> > +     }
> > +
> > +     reinit_completion(&st->completion);
> > +
> > +     ret =3D ads112c04_write_cmd(st->client, ADS112C04_CMD_START_SYNC)=
;
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D ads112c04_wait_for_data(st);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return ads112c04_read_data(st, val);
> > +}
> > +
> > +static int ads112c04_read_raw(struct iio_dev *indio_dev,
> > +                           struct iio_chan_spec const *chan,
> > +                           int *val, int *val2, long mask)
> > +{
> > +     struct ads112c04_state *st =3D iio_priv(indio_dev);
> > +     int ret;
> > +
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             mutex_lock(&st->lock);
> > +             ret =3D ads112c04_get_adc_result(st, chan, val);
> > +             mutex_unlock(&st->lock);
> > +
> > +             if (ret < 0)
> > +                     return ret;
> > +             return IIO_VAL_INT;
> > +
> > +     case IIO_CHAN_INFO_SCALE:
> > +             *val =3D st->vref_mv;
> > +             *val2 =3D 15;
> > +             return IIO_VAL_FRACTIONAL_LOG2;
> > +
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +
> > +static irqreturn_t ads112c04_irq_handler(int irq, void *private)
> > +{
> > +     struct iio_dev *indio_dev =3D private;
> > +     struct ads112c04_state *st =3D iio_priv(indio_dev);
> > +
> > +     complete(&st->completion);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static const struct iio_info ads112c04_info =3D {
> > +     .read_raw =3D ads112c04_read_raw,
> > +};
> > +
> > +static void ads112c04_regulator_disable(void *data)
> > +{
> > +     regulator_disable(data);
> > +}
> > +
> > +static int ads112c04_parse_channels(struct iio_dev *indio_dev)
> > +{
> > +     struct device *dev =3D indio_dev->dev.parent;
> > +     struct iio_chan_spec *channels;
> > +     u32 num_channels, i =3D 0, pair[2];
> > +
> > +     num_channels =3D device_get_named_child_node_count(dev, "channel"=
);
> > +     if (!num_channels)
> > +             return -EINVAL;
> > +
> > +     channels =3D devm_kcalloc(dev, num_channels, sizeof(*channels), G=
FP_KERNEL);
> > +     if (!channels)
> > +             return -ENOMEM;
> > +
> > +     device_for_each_named_child_node_scoped(dev, child, "channel") {
> > +             struct iio_chan_spec *spec =3D &channels[i];
> > +
> > +             spec->type =3D IIO_VOLTAGE;
> > +             spec->indexed =3D 1;
> > +             spec->info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) | BIT=
(IIO_CHAN_INFO_SCALE);
> > +             spec->scan_index =3D i;
> > +
> > +             if (fwnode_property_present(child, "single-channel")) {
> > +                     fwnode_property_read_u32(child, "single-channel",=
 &pair[0]);
>
> The return value of fwnode_property_read_u32 isn't checked, meaning that
> pair[0] will contain stack garbage.
>
> > +                     spec->channel =3D pair[0];
> > +                     spec->differential =3D 0;
> > +                     spec->address =3D 0x08 + pair[0];
> > +             } else if (fwnode_property_present(child, "diff-channels"=
)) {
> > +                     fwnode_property_read_u32_array(child, "diff-chann=
els", pair, 2);
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
> > +                             return -EINVAL;
> > +             } else {
> > +                     return -EINVAL;
> > +             }
> > +             i++;
> > +     }
> > +
> > +     indio_dev->channels =3D channels;
> > +     indio_dev->num_channels =3D num_channels;
> > +
> > +     return 0;
> > +}
> > +
> > +static int ads112c04_probe(struct i2c_client *client)
> > +{
> > +     struct iio_dev *indio_dev;
> > +     struct ads112c04_state *st;
> > +     struct gpio_desc *reset_gpio;
>
> Reverse xmas tree order here as well.
I will fix the variable declaration ordering across the functions
>
> > +     int ret;
> > +
> > +     indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*st));
> > +     if (!indio_dev)
> > +             return -ENOMEM;
> > +
> > +     st =3D iio_priv(indio_dev);
> > +     st->client =3D client;
> > +
> > +     ret =3D devm_mutex_init(&client->dev, &st->lock);
> > +     if (ret)
> > +             return ret;
> > +
> > +     init_completion(&st->completion);
> > +
> > +     indio_dev->name =3D "ads112c04";
> > +     indio_dev->modes =3D INDIO_DIRECT_MODE;
> > +     indio_dev->info =3D &ads112c04_info;
> > +
> > +     ret =3D ads112c04_parse_channels(indio_dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D devm_regulator_get_enable(&client->dev, "avdd");
> > +     if (ret)
> > +             return dev_err_probe(&client->dev, ret, "failed to get av=
dd regulator\n");
> > +
> > +     ret =3D devm_regulator_get_enable(&client->dev, "dvdd");
> > +     if (ret)
> > +             return dev_err_probe(&client->dev, ret, "failed to get dv=
dd regulator\n");
> > +
> > +     st->vref_reg =3D devm_regulator_get_optional(&client->dev, "refp"=
);
> > +     if (IS_ERR(st->vref_reg)) {
> > +             ret =3D PTR_ERR(st->vref_reg);
> > +             if (ret =3D=3D -ENODEV) {
> > +                     st->vref_mv =3D 2048;
> > +                     st->config1 =3D 0x00;
> > +             } else {
> > +                     return ret;
> > +             }
> > +     } else {
> > +             ret =3D regulator_enable(st->vref_reg);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ret =3D devm_add_action_or_reset(&client->dev, ads112c04_=
regulator_disable,
> > +                                            st->vref_reg);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ret =3D regulator_get_voltage(st->vref_reg);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             st->vref_mv =3D ret / 1000;
> > +             st->config1 =3D 0x02;
> > +     }
> > +
> > +     reset_gpio =3D devm_gpiod_get_optional(&client->dev, "reset", GPI=
OD_OUT_LOW);
> > +     if (IS_ERR(reset_gpio))
> > +             return PTR_ERR(reset_gpio);
> > +
> > +     if (reset_gpio) {
> > +             gpiod_set_value_cansleep(reset_gpio, 1);
> > +             fsleep(1000);
> > +             gpiod_set_value_cansleep(reset_gpio, 0);
> > +     } else {
> > +             ret =3D ads112c04_write_cmd(client, ADS112C04_CMD_RESET);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> > +     fsleep(1000);
>
> Why 1000? Add a comment that links to the datasheet or an explanation.
I've reduced this timeout to 100ms and added a comment explaining that it
corresponds to the chip's slowest data rate of 20 SPS.
>
> > +
> > +     st->config0 =3D 0x01;
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
> > +             ret =3D devm_request_irq(&client->dev, client->irq,
> > +                                    ads112c04_irq_handler,
> > +                                    0,
> > +                                    indio_dev->name, indio_dev);
> > +             if (ret) {
> > +                     dev_err(&client->dev, "Failed to request DRDY IRQ=
\n");
> > +                     return ret;
>
> Just return ret, devm_request_irq() already prints an error message on
> failure.
I will drop the redundant dev_err print.
>
> --
> Kind regards,
> Joshua Crofts

Thanks again for helping polish this driver!
Best regards,
Kyle Hsieh
