Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3513E369224
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112032; cv=none; b=XSn2t4Ay+WPSQHnYNejQntdn9OHkY4umvhEWe8gOCSzlzJgANnAI+PmLeCLXlMWoBmU9E0yZ0Qt3uIaKZ2Ed0HXRnHmnlNQOL1K0ru+E+nRjBgrDFc8yfeyh5sItM49pxkM0NN5IW6KwYCaSz2UFGUS7WG4rM2PtoZkUecSEeDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112032; c=relaxed/simple;
	bh=kCA1jFUs/F/1JO18iKS1aOLmiiVPX0lSRAkM0wfJOR4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbZZBnBnXqnK5AJi6E8WzsMMz4IDJZL7pCfBwY9ckwdWp3aRI6peE7JWy8cN7nl9Sy+xoxy60lxsSCDdHcyRRc8Cxi6BQd3jFFV6ToUyledUVbASc1OHNVhbDW9UnTHT8ut77w6zB/BgWtMAnsbdk/yXR1bGrDFQe2I2LOuZlJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjO7C8cV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjO7C8cV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4994c49f588so20972535e9.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 07:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786112021; x=1786716821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PIC/yQMkKY4H2MGbW0WBhcLjDZ+KebbmRzTFDny1IYM=;
        b=GjO7C8cVuTBsz1klpUlOUSlwF0MPPJnycvLlH5PVPhXRD2k7oKsbwM2PEjIsWnn/gd
         Nyk63F8NF0nYq1h9VmxU7PO43QED6JqfCAwnSMoy8mrRHtDXo+w/RB1i0Hr/WxGIqBrQ
         Ps/TJLEPf0Wtoi7gMsnHh48sjDLwi57AS6AKjqwepXW7f6onUyNf6dMbcA+tZDeHg1wp
         5lXDomqY7PAoPqQRPDCGvKEqN7OKvIyXt03esnUi4ISGaXhEC2cjPOao8EzaS3Bz95KK
         Hjp/UwwiSK2AsLomZNJ6+oPT6ADZWL0OQLw3C1NvcQxwTZOZc/xpTet2MKZbm21A7Mi2
         BOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786112021; x=1786716821;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PIC/yQMkKY4H2MGbW0WBhcLjDZ+KebbmRzTFDny1IYM=;
        b=Ib8Jk2nnOR7HXCTczftObEn+B58s00uWcn7gtDmu80801VablWgg4EP/SoQ5AsNu+Y
         vf0A/30+eapM9lV31NhWrI1+WI/DQS9tDd1jP/0njS1YC2XADlZQW7ew/JhouvzZvA5b
         /XqNaK1AMDkKMYKEASBSqS6Dn8DOqN5cyyix5BKod9OIE2i0UVktkpycj2EtR91HDVbK
         +fmFzoDJZgu/HREY34qKKXTZsYfncEwBPvwvUlG0gtJEZc7hoSvkodl67efO8K6lFIVd
         d1PE2M9/KqaczA6EGQGpxTTXjk3YTbz6cErkLZhZzZ0QKkTALAB7ZawiHflTigX+Py5L
         d9FQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqLrv14ndiXz5DsxU5Yh6TIELFVyav6whoB4JfTeYGiThL+oHoyYIXZsxLElh6b+fPrVvYJ5d6LgL9@vger.kernel.org
X-Gm-Message-State: AOJu0YzTdiS5MSiIHylAo0evkBOhqZeOS0OuXTjpLTwnaDzWpqsTnCzK
	Ad9WS+I/k+69tJUPlpj9IRlkk65kM3ed7x3Kx4x7Aoa7hQL9P2IE1PVx
X-Gm-Gg: AR+sD12TdPGTO/GdIMUGf3rQCwQG+Tt/9Mz8rMhrPg5FJeCasxtBy6vngtASpSzhHL0
	LcKeTGLTCIF0coi3ZMM73lYWnnLYP0upEoV2o9+MgnFlwN8sIa9l5X1axjbDwyuGESzT9ehIG3o
	BgoxbKq5MgslUYIbsGLYLbSZfanugj8C7ilM7wJZ1gwh/q0wOe3NIvYKEp/Vjrmivm1AAMUpMGh
	IT80i/dQ0XrS/6ePZ5YhKeE7LialFuGMKjLeBpenvzn3icMfSfcxVNCb8J6o1CaoscbVGi133ZE
	4sEkkJxDhQEwOh8yvyz0i01JAmrX+WeDeOg3IppAxTBTYwd4xIWC7CMlXnLsYQdRiuBNXdFWd9p
	CpMf/sbckoW0iuA7miyICanx4EPgFlQpBdZwFwszxd4w3U2cHWeA0SwtekN6YTrfsuMXqR5cxK+
	Z7BukOZcajbG/8fylnGKhHDti+DpiM37el7ySF1Mx68iSo1fm/prTWPRuXbqrbI6tyoVljArw12
	6bUoFsq/8Ba25djG/8iilb7nRUjm1EenoBHBbmZOXLDLySycd+GMxaLPr7R1EPUyGD0p4qMHefd
	XH+5lJeXqxk7EBJFQuPGMRpqs9bq6yzgCcWs79vqesewJy3hm4Jq+Y3Xuukcrn3J9MgNayhDLvM
	rJNcCc2OXFc1qbY3HbhZM76rmh25EYJygfPldpI9pfYnVkUX/EMT0Ldppb5n4k6TAny9v7jo=
X-Received: by 2002:a05:600c:a41:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49961979a20mr273875e9.7.1786112020910;
        Fri, 07 Aug 2026 07:13:40 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm148058995e9.10.2026.08.07.07.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 07:13:40 -0700 (PDT)
Date: Fri, 7 Aug 2026 16:13:38 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kanak Shilledar <Kanak.Shilledar@axis.com>
Cc: "dlechner@baylibre.com" <dlechner@baylibre.com>, Henrik Grimler
 <Henrik.Grimler@axis.com>, "nuno.sa@analog.com" <nuno.sa@analog.com>,
 "jean-baptiste.maneyrol@tdk.com" <jean-baptiste.maneyrol@tdk.com>,
 "robh@kernel.org" <robh@kernel.org>, "jic23@kernel.org" <jic23@kernel.org>,
 "andy@kernel.org" <andy@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Kernel <Kernel@axis.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/3] iio: accel: Add support for ICM42370P
Message-ID: <20260807161338.00004f48@gmail.com>
In-Reply-To: <ba866b98384dcd827d5a610de9f00386da5824e2.camel@axis.com>
References: <20260806-b4-inv_icm42370p-v1-0-670837f5842f@axis.com>
	<20260806-b4-inv_icm42370p-v1-2-670837f5842f@axis.com>
	<20260807120937.00004e3c@gmail.com>
	<ba866b98384dcd827d5a610de9f00386da5824e2.camel@axis.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Aug 2026 13:41:04 +0000
Kanak Shilledar <Kanak.Shilledar@axis.com> wrote:

> Hi Joshua,
>=20
> On Fri, 2026-08-07 at 12:09 +0200, Joshua Crofts wrote:
> > [You don't often get email from joshua.crofts1@gmail.com. Learn why
> > this is important at https://aka.ms/LearnAboutSenderIdentification=A0]
> >=20
> > On Thu, 6 Aug 2026 14:46:28 +0200
> > Kanak Shilledar <kanak.shilledar@axis.com> wrote:
> >  =20
> > > Add support for the Invensense ICM42370P MEMS MotionTracking 3-axis
> > > accelerometer with a built-in temperature sensor. Compared to other
> > > sensors from the same vendor ICM42370 uses a different way of
> > > handling
> > > register banks. Although the device supports I2C, SPI, and I3C,
> > > implement only I2C support.=A0 Provide basic support for raw sensor
> > > reads and a sysfs interface for setting the calibration bias. Keep
> > > the
> > > embedded temperature sensor enabled because the device design does
> > > not
> > > allow it to be turned off.
> > >=20
> > > Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> > > --- =20
> >=20
> > Hi Kanak,
> >=20
> > my comments inline. This is an large driver and I've probably missed
> > something. Additionally, Sashiko had some pretty good remarks about
> > the scaling math etc. so please check out those: =20
>=20
>=20
> Thanks for the detailed review.
>=20
> >=20
> > https://sashiko.dev/#/patchset/20260806-b4-inv_icm42370p-v1-0-670837f58=
42f%40axis.com =20
>=20
> I am going through the sashiko's comments and incorporating them in my
> v2.
>=20
> > Josh
> >  =20
> > > +config INV_ICM42370
> > > +=A0=A0=A0=A0 tristate
> > > +=A0=A0=A0=A0 select IIO_BUFFER
> > > +=A0=A0=A0=A0 select IIO_INV_SENSORS_TIMESTAMP
> > > +
> > > +config INV_ICM42370_I2C
> > > +=A0=A0=A0=A0 tristate "InvenSense ICM-42370 I2C driver"
> > > +=A0=A0=A0=A0 depends on I2C
> > > +=A0=A0=A0=A0 select INV_ICM42370
> > > +=A0=A0=A0=A0 select REGMAP_I2C
> > > +=A0=A0=A0=A0 help
> > > +=A0=A0=A0=A0=A0=A0 This driver supports the InvenSense ICM-42730 mot=
ion
> > > tracking
> > > +=A0=A0=A0=A0=A0=A0 devices over I2C.
> > > +
> > > +=A0=A0=A0=A0=A0=A0 This driver can be built as a module. The module =
will be
> > > called
> > > +=A0=A0=A0=A0=A0=A0 inv_icm42370_i2c.
> > > +
> > > =A0config KXSD9
> > > =A0=A0=A0=A0=A0 tristate "Kionix KXSD9 Accelerometer Driver"
> > > =A0=A0=A0=A0=A0 select IIO_BUFFER
> > > diff --git a/drivers/iio/accel/Makefile
> > > b/drivers/iio/accel/Makefile
> > > index fa440a8592839..6750b03edf518 100644
> > > --- a/drivers/iio/accel/Makefile
> > > +++ b/drivers/iio/accel/Makefile
> > > @@ -49,6 +49,11 @@ obj-$(CONFIG_HID_SENSOR_ACCEL_3D) +=3D hid-sensor-
> > > accel-3d.o
> > > =A0obj-$(CONFIG_IIO_KX022A)=A0=A0=A0=A0 +=3D kionix-kx022a.o
> > > =A0obj-$(CONFIG_IIO_KX022A_I2C) +=3D kionix-kx022a-i2c.o
> > > =A0obj-$(CONFIG_IIO_KX022A_SPI) +=3D kionix-kx022a-spi.o
> > > +
> > > +obj-$(CONFIG_INV_ICM42370) +=3D inv-icm42370.o
> > > +inv-icm42370-y +=3D inv_icm42370_core.o
> > > +obj-$(CONFIG_INV_ICM42370_I2C) +=3D inv_icm42370_i2c.o
> > > +
> > > =A0obj-$(CONFIG_KXCJK1013) +=3D kxcjk-1013.o
> > > =A0obj-$(CONFIG_KXSD9)=A0 +=3D kxsd9.o
> > > =A0obj-$(CONFIG_KXSD9_SPI)=A0=A0=A0=A0=A0 +=3D kxsd9-spi.o
> > > diff --git a/drivers/iio/accel/inv_icm42370.h
> > > b/drivers/iio/accel/inv_icm42370.h
> > > new file mode 100644
> > > index 0000000000000..9866a5e970dcd
> > > --- /dev/null
> > > +++ b/drivers/iio/accel/inv_icm42370.h
> > > @@ -0,0 +1,365 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > +/*
> > > + * Copyright (C) 2020 Invensense, Inc.
> > > + * Copyright (C) 2026 Axis Communications AB
> > > + */
> > > +
> > > +#ifndef INV_ICM42370_H_
> > > +#define INV_ICM42370_H_
> > > +
> > > +#include <linux/bits.h>
> > > +#include <linux/bitfield.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/regulator/consumer.h> =20
> >=20
> > Sort these headers alphabetically. Also you're missing types.h.
> >  =20
> > > +#include <linux/iio/iio.h>
> > > +#include <linux/iio/common/inv_sensors_timestamp.h> =20
> >=20
> > Group the <linux/iio/*> headers separately (check other drivers in
> > IIO
> > for reference). =20
>=20
> Will sort and group the headers as per the convention.
>=20
> > > +
> > > +enum inv_icm42370_chip {
> > > +=A0=A0=A0=A0 INV_CHIP_INVALID,
> > > +=A0=A0=A0=A0 INV_CHIP_ICM42370,
> > > +=A0=A0=A0=A0 INV_CHIP_NB,
> > > +};
> > > +
> > > +/* sensor configuration struct */
> > > +struct inv_icm42370_conf {
> > > +=A0=A0=A0=A0 int mode;
> > > +=A0=A0=A0=A0 int fs;
> > > +=A0=A0=A0=A0 int odr;
> > > +=A0=A0=A0=A0 int filter;
> > > +};
> > > +
> > > +/**
> > > + * struct inv_icm42370_data - driver state variables
> > > + * @lock:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 lock for serializing mult=
iple register
> > > access.
> > > + * @name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 chip name.
> > > + * @map:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 regmap pointer.
> > > + * @vdd_supply:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VDD voltage r=
egulator for the chip.
> > > + * @vddio_supply:=A0=A0=A0 I/O voltage regulator for the chip.
> > > + * @indio_accel:=A0=A0=A0=A0 accelerometer IIO device.
> > > + * @sensor_state:=A0=A0=A0 per-sensor state tracking (e.g. power, OD=
R).
> > > + * @buffer:=A0=A0=A0=A0=A0=A0=A0=A0=A0 buffer for reading data regis=
ters, aligned
> > > for DMA.
> > > + * @accel_calibbias: accelerometer calibration bias for X, Y, and
> > > Z axes.
> > > + * @fifo:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 FIFO state and configurat=
ion.
> > > + * @timestamp:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interrupt t=
imestamp.
> > > + * @chip:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 chip identifier.
> > > + * @conf:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 chip sensors configuratio=
ns.
> > > + */
> > > +struct inv_icm42370_data {
> > > +=A0=A0=A0=A0 struct mutex lock;
> > > +=A0=A0=A0=A0 const char *name;
> > > +=A0=A0=A0=A0 struct regmap *map;
> > > +=A0=A0=A0=A0 struct regulator *vdd_supply;
> > > +=A0=A0=A0=A0 struct regulator *vddio_supply;
> > > +=A0=A0=A0=A0 struct iio_dev *indio_accel; =20
> >=20
> > You probably don't need this. =20
> Can you please clarify this comment? As I am using `*indio_accel` in
> other places inside inv_icm42370_core.c and in many places in
> inv_icm42370_buffer.c. Or are you perhaps referring to the
> *sensor_state struct below?

Yes, apologies, I meant to come back to this comment but forgot (given the
size of the driver :)). Reading the cover letter I see that you've
taken inspiration from the icm42600, which is an accelerometer and gyroscop=
e,
which would warrant two different iio_dev structs. However, this chip is
an accelerometer only, meaning you can just pass the one iio_dev struct
that you initialize in probe to the *_irq_init() function you have and forg=
et
about it later.

--=20
Kind regards,
Joshua Crofts
