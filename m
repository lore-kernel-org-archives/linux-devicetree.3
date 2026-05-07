Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75C04218BD
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164939; cv=pass; b=UB2RIfsxk3cvW2QumtCxpEFL2tWQAsGGyGFNUqaT8H4QcK2o76aSJhDXQLrOE+RtT6DXpEe/scGu0XMZDgEjzZbipwBAUAYPwSw0JSlJvDWHD9EO8O+lersw+F5tK2yLFlhk6gxoTknAkkn8OrW8DwfSFSv9+ZfwJUrmwLZ3puc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164939; c=relaxed/simple;
	bh=QE7XruwSEiu7pgFmsBJ0QOzj6pZbNDale0S5vZ2ZTZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXjTYK0PmkbZmoPx9jMAsGv/A842yWqI510nbCG9fQn4UjxO2TvdN4i79p5NSy9JmyZEhnrd/2C0neGBqITgiCjwjCTjDYUf5Ui8V74d4umIWeyuVvtNzqyrS8Pcw+Ofw33DE6VaQuxlFhofvv2tivrhoXuPY2bHF4DN+Qul/d8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pylNWjxF; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pylNWjxF"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ee990e8597so1570606eec.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 07:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778164935; cv=none;
        d=google.com; s=arc-20240605;
        b=TG6ZMRPYgyeZ57pLFGLPO7Uhrrz+HkTL5LM4A/OCR63p/E7+uouHJ52C/xhiK+9dXH
         WY9B7m9ElUKiu6XBncbHz22DqgogEzEgaePXvRagC4rLQQnEq8zDaGTEWYLtRcq+pFg0
         nEXynjzLhWxrk+SmadwHxPwjGmQER2xfm7ZgG/WTwC/kKdjQBrnzHBzVUFumkadz83Xw
         OMoowZ5sL01sPxJRoZ6KrqzWGqnYFgP9pp5g340XZyrWGbeuCUXqVBzzUh+724lvzUs3
         RYuWOxbV9SoMcusk6quCi94i97UQNEAjHPrLA9G1oHQN6dTL2MLM2X+PtpUBs+s15Rk2
         EZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jT3O6et3NT1mqwSybd/qwkVNrO5VzBYtbQaOosZiYdY=;
        fh=SOBmCB7SBFVdjlw5mBKoZNPxFGcY+v3kaDrbAaf/IuM=;
        b=BBvup+6wfRcnQX/d9ct5yYGV7vImSU/R7ye5ngUXFQQLRLlW/s5MvRtJ49WVyyQKJ0
         /hr/H7s90Xmhuw0IHo4BFfrqob9EpgHHJbxSOBNlGHAqvmYGXFMZ09GxGKBegpe8g6n+
         Z3+i2MujtMe6hSGgAW2L5HTQnZlpPRcq6GaAo6FCf6KwQMhIdcOcXVQ79DHu/N0Khl9A
         nOuHgmU2+H4J4yAdxE8/ADRtp/X4aMj4rdZ9eTXFKnTZQzx163QIFijB9vHkUJWvAjDw
         6u9CE/VPDi8he9ok81h3BpzXW6azofZWs9OHkDjNuj6rWr5I27Q5Pp9ytywZdHhOSO3I
         hgiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778164935; x=1778769735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jT3O6et3NT1mqwSybd/qwkVNrO5VzBYtbQaOosZiYdY=;
        b=pylNWjxFajgQnLuvpice8FN420rhIT/CXDD14B8nn+yFWMnVQLTlR0MuUK0EaqA1ua
         XftwjRPTNQHYkROo2AhuYoikxyZuJpby8vf1xPUxk1wc/PFI5dJue1Ao/REeG01/5gxL
         oLT1P6RRZIhgiHJ8UIo3V5fUSHyLYf1fQuG960lrXLnK5/5ZkRY1hSjuLuoEKW4WBU5H
         KNjo5jf1QZIsH+FlsF/Q9xFzOdukw+aSsQChSwtpu8oeQW2kt38wamn3X1zC7w0A2srI
         WDpcTlRqCZtO0DqJexvqOFdUTpejrcPy69kEPbUEgAGKKYJ7yFVUI+6XE03V14XRdBP3
         rJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778164935; x=1778769735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jT3O6et3NT1mqwSybd/qwkVNrO5VzBYtbQaOosZiYdY=;
        b=a38PYzwbeJ5Htf4IeVQzJTm38eLU1fTHOY89hFChJClA74knC3NyQdzXw+nSBIQg8J
         /dUv07gmVs4Nu6vyGlCROZqL/pRF8DM7ctCGAj8NQJm1moTIEI/QiUmK33uVj2aH3QDE
         JCPpOZMSxRjPNCZmMkoW4oFZU3Pm16TWs+9Ig63kdx5hrma09rHZ9lTPwutSfBB86xHN
         35Z3lpS7kYqGpEKvI3tO+CEDeDqO0JyFhlGcKtpcr1OPrUkeeXOszqy1/vzfKVfKWC7Y
         ZlmgRreTW2uuldZcDTsz6sehZz14XNfqupDEx+oR8wtD9Jjx8EPcvBVuXd80+r9Pa7UJ
         WK0w==
X-Forwarded-Encrypted: i=1; AFNElJ/t2LmRNwp2ZirFy3VHYjMPaijBSlqw/lkhgT7IO18IjaVMkXhBm0h3/TNeduBHz2G/0AK0CpOEdE5U@vger.kernel.org
X-Gm-Message-State: AOJu0YwUmOmgNFmwiYTYv6vx1BcwU+hiZiJCmm2KrBYkcb/awITMPFjt
	htf+YticHeUwo9jirdxNh14Z5pICoQZArgFwGhc3T7eoiCpq2oMwEU4zzp+dmjlvKiX2sIKwTHs
	dTa9lVsdN99Azksy3o/fkxmG919KRmuM=
X-Gm-Gg: AeBDieu+g56AEVJdQY8oMw2I9tU3uodaEExN/9SSEwnhG5Gp9yGRWnlZkgfL4zEWtCR
	lpIylqBZHGTeIMMCOUJii7lzBWi2v7xfnvzW2/YqiORH84oZMmB6xIugC2skeMU+5IHKih6Rux6
	v/6hu6VtRxbzHb/ZQxDqK84R7mRSPrsCLxN8dqkgO7+oFYUFe1MrUGaAtTiYvixyqe99LIuF+L0
	xRlpCIPIzk9yIKGIaJ4F2z814thPTOIjq5/MqopqUPqiP3DeRx8/mI+W8AxDEO0KSzG0mQ8l322
	SrP0TXqJPhQpJOwG2oA=
X-Received: by 2002:a05:693c:2411:b0:2f6:811e:c840 with SMTP id
 5a478bee46e88-2f6811ecdc7mr1706481eec.18.1778164935381; Thu, 07 May 2026
 07:42:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428153611.142816-1-clamor95@gmail.com> <20260428153611.142816-6-clamor95@gmail.com>
 <20260507140519.GO305027@google.com>
In-Reply-To: <20260507140519.GO305027@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 7 May 2026 17:42:03 +0300
X-Gm-Features: AVHnY4JhuQbLfhGWuOYGbOyhNdM9uIu0BiU5APMsX46gUxzYP5nSTtoAi9DOTZo
Message-ID: <CAPVz0n24U3=hwda5BTXUhHiiFHKmWUfLy_nxJp_CFHBHEYDWsA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6 RESEND] mfd: motorola-cpcap: diverge configuration per-board
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 7 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 17:05=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 28 Apr 2026, Svyatoslav Ryhel wrote:
>
> > MFD have rigid subdevice structure which does not allow flexible dynami=
c
> > subdevice linking. Address this by diverging CPCAP subdevice compositio=
n
> > to take into account board specific configuration.
> >
> > Create a common default subdevice composition, rename existing subdevic=
e
> > composition into cpcap_mapphone_mfd_devices since it targets mainly
> > Mapphone board.
> >
> > Removed st,6556002 as it is no longer applicable to all cases and
> > duplicates motorola,cpcap, which is used as the default composition.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
>
> Changelog?
>
> >  drivers/mfd/motorola-cpcap.c | 101 ++++++++++++++++++++++++++++-------
> >  1 file changed, 83 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.=
c
> > index d8243b956f87..516d1e33affa 100644
> > --- a/drivers/mfd/motorola-cpcap.c
> > +++ b/drivers/mfd/motorola-cpcap.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/mod_devicetable.h>
> > +#include <linux/property.h>
> >  #include <linux/regmap.h>
> >  #include <linux/sysfs.h>
> >
> > @@ -24,10 +25,16 @@
> >  #define CPCAP_REGISTER_SIZE  4
> >  #define CPCAP_REGISTER_BITS  16
> >
> > +struct cpcap_chip_data {
> > +     const struct mfd_cell *mfd_devices;
> > +     unsigned int num_devices;
> > +};
>
> This is a red flag.
>
> >  struct cpcap_ddata {
> >       struct spi_device *spi;
> >       struct regmap_irq *irqs;
> >       struct regmap_irq_chip_data *irqdata[CPCAP_NR_IRQ_CHIPS];
> > +     const struct cpcap_chip_data *cdata;
> >       const struct regmap_config *regmap_conf;
> >       struct regmap *regmap;
> >  };
> > @@ -195,20 +202,6 @@ static int cpcap_init_irq(struct cpcap_ddata *cpca=
p)
> >       return 0;
> >  }
> >
> > -static const struct of_device_id cpcap_of_match[] =3D {
> > -     { .compatible =3D "motorola,cpcap", },
> > -     { .compatible =3D "st,6556002", },
> > -     {},
> > -};
> > -MODULE_DEVICE_TABLE(of, cpcap_of_match);
> > -
> > -static const struct spi_device_id cpcap_spi_ids[] =3D {
> > -     { .name =3D "cpcap", },
> > -     { .name =3D "6556002", },
> > -     {},
> > -};
> > -MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> > -
> >  static const struct regmap_config cpcap_regmap_config =3D {
> >       .reg_bits =3D 16,
> >       .reg_stride =3D 4,
> > @@ -241,7 +234,56 @@ static int cpcap_resume(struct device *dev)
> >
> >  static DEFINE_SIMPLE_DEV_PM_OPS(cpcap_pm, cpcap_suspend, cpcap_resume)=
;
> >
> > -static const struct mfd_cell cpcap_mfd_devices[] =3D {
> > +static const struct mfd_cell cpcap_default_mfd_devices[] =3D {
> > +     {
> > +             .name          =3D "cpcap_adc",
> > +             .of_compatible =3D "motorola,cpcap-adc",
> > +     }, {
> > +             .name          =3D "cpcap_battery",
> > +             .of_compatible =3D "motorola,cpcap-battery",
> > +     }, {
> > +             .name          =3D "cpcap-regulator",
> > +             .of_compatible =3D "motorola,cpcap-regulator",
> > +     }, {
> > +             .name          =3D "cpcap-rtc",
> > +             .of_compatible =3D "motorola,cpcap-rtc",
> > +     }, {
> > +             .name          =3D "cpcap-pwrbutton",
> > +             .of_compatible =3D "motorola,cpcap-pwrbutton",
> > +     }, {
> > +             .name          =3D "cpcap-usb-phy",
> > +             .of_compatible =3D "motorola,cpcap-usb-phy",
> > +     }, {
> > +             .name          =3D "cpcap-led",
> > +             .id            =3D 0,
> > +             .of_compatible =3D "motorola,cpcap-led-red",
> > +     }, {
> > +             .name          =3D "cpcap-led",
> > +             .id            =3D 1,
> > +             .of_compatible =3D "motorola,cpcap-led-green",
> > +     }, {
> > +             .name          =3D "cpcap-led",
> > +             .id            =3D 2,
> > +             .of_compatible =3D "motorola,cpcap-led-blue",
> > +     }, {
> > +             .name          =3D "cpcap-led",
> > +             .id            =3D 3,
> > +             .of_compatible =3D "motorola,cpcap-led-adl",
> > +     }, {
> > +             .name          =3D "cpcap-led",
> > +             .id            =3D 4,
> > +             .of_compatible =3D "motorola,cpcap-led-cp",
> > +     }, {
> > +             .name          =3D "cpcap-codec",
> > +     },
> > +};

Lee, would you mind if I convert these mfd_cell structures to use
macros in this commit since I am refactoring them anyway?

> > +
> > +static const struct cpcap_chip_data cpcap_default_data =3D {
> > +     .mfd_devices =3D cpcap_default_mfd_devices,
> > +     .num_devices =3D ARRAY_SIZE(cpcap_default_mfd_devices),
> > +};
> > +
> > +static const struct mfd_cell cpcap_mapphone_mfd_devices[] =3D {
> >       {
> >               .name          =3D "cpcap_adc",
> >               .of_compatible =3D "motorola,mapphone-cpcap-adc",
> > @@ -285,7 +327,12 @@ static const struct mfd_cell cpcap_mfd_devices[] =
=3D {
> >               .of_compatible =3D "motorola,cpcap-led-cp",
> >       }, {
> >               .name          =3D "cpcap-codec",
> > -     }
> > +     },
> > +};
> > +
> > +static const struct cpcap_chip_data cpcap_mapphone_data =3D {
> > +     .mfd_devices =3D cpcap_mapphone_mfd_devices,
> > +     .num_devices =3D ARRAY_SIZE(cpcap_mapphone_mfd_devices),
> >  };
> >
> >  static int cpcap_probe(struct spi_device *spi)
> > @@ -297,9 +344,17 @@ static int cpcap_probe(struct spi_device *spi)
> >       if (!cpcap)
> >               return -ENOMEM;
> >
> > +     cpcap->cdata =3D device_get_match_data(&spi->dev);
> > +     if (!cpcap->cdata)
> > +             return -ENODEV;
> > +
> >       cpcap->spi =3D spi;
> >       spi_set_drvdata(spi, cpcap);
> >
> > @@ -331,16 +382,24 @@ static int cpcap_probe(struct spi_device *spi)
> >       spi->dev.coherent_dma_mask =3D 0;
> >       spi->dev.dma_mask =3D &spi->dev.coherent_dma_mask;
> >
> > -     return devm_mfd_add_devices(&spi->dev, 0, cpcap_mfd_devices,
> > -                                 ARRAY_SIZE(cpcap_mfd_devices), NULL, =
0, NULL);
> > +     return devm_mfd_add_devices(&spi->dev, 0, cpcap->cdata->mfd_devic=
es,
> > +                                 cpcap->cdata->num_devices, NULL, 0, N=
ULL);
> >  }
> >
> > +static const struct of_device_id cpcap_of_match[] =3D {
> > +     { .compatible =3D "motorola,cpcap", .data =3D &cpcap_default_data=
 },
> > +     { .compatible =3D "motorola,mapphone-cpcap", .data =3D &cpcap_map=
phone_data },
>
> We don't allow data from one device registration API (MFD) to be passed
> through another (OF) because it tends to lead to all sorts of "creative
> solutions".  Pass a value instead and match on that in a switch()
> statement like all of the other MFD drivers do.
>
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, cpcap_of_match);
> > +
> > +static const struct spi_device_id cpcap_spi_ids[] =3D {
> > +     { .name =3D "cpcap", .driver_data =3D (kernel_ulong_t)&cpcap_defa=
ult_data },
> > +     { .name =3D "mapphone-cpcap", .driver_data =3D (kernel_ulong_t)&c=
pcap_mapphone_data },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> > +
> >  static struct spi_driver cpcap_driver =3D {
> >       .driver =3D {
> >               .name =3D "cpcap-core",
> > --
> > 2.51.0
> >
> >
>
> --
> Lee Jones
