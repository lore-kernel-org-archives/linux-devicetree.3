Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B5A338595
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 21:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779139628; cv=pass; b=plNb10VsvBsFBO3OAGKHZJ0Z7rEoqXgVyOUvIFc2pts+pmcj+4eoNJVySEsbooVYKxt9zA1KBXox3Ai++bjyIULePqTydJYPFcEog072MT/anKgC+4nWgONJlUUzt6603OgCP/tTG2u0OHADVT6xsVeTZmI8R/kQrM4Lui9AF3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779139628; c=relaxed/simple;
	bh=nxPytq5XAr6ypQMasFz4amNrG1i4LJ9r02D9OyHCQSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwsnpBdd4zqWVSIaZrbPFMKJ8AmKMN7RBKUhA9g2Rz7sag/EBAyQm+DnKB0o/UXOLM0EGx5V/fI55BbmnRtJ/uUVcdQfTNjw2TZIArtGCYnaoKKu2dgbBvMeouQ2icrXZscsWlq3tA58lCx0h50nqiKrAVP7ZdZhgLp6CSxPoCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfL+FRVJ; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfL+FRVJ"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso3175531e87.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779139625; cv=none;
        d=google.com; s=arc-20240605;
        b=Wh5iaur737VyN18Fa137PzrLBGlpM+NRlPtSBsVRRxf+1E+ixb3SjIA/aJEyjOQtXS
         d17TwqtLDpJ9B74baeWuKcTJnHZN2DVy0NiF2wlyDhla8p8UQ5f+r0CTEpDC35t6gUm+
         48cUREiPSBFRvNQ65IpyDYVxZSP7y7jKX/MR7zw1lM5LXaDslx5Uf8lppWH8rm8mN6wa
         xn0wFcDVqbPcmLWus+EMuB2Eozqh8cFcMUc0CEliuGJjw7oEI0A0eXbc/xiddO8EYzeM
         UA89kxLhSioWXfS3582PkPAhOEV8EOTzLG1go5M8ikq4Fb6ZqU9laAS3yBHVwPvmilAP
         mmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NXcI82h8LzUQR1Vm7aPakkDi0vBXkkrNR+KatJkgbcA=;
        fh=mvoXYciHF8a4KPg3bdXwon6P8Xs6QdHmhOfubeep5E4=;
        b=WYsL7SWKBiGsVhwdKS2vtBkuttPPuKKUx/rtqA1v7lc8CfN9NQIZiXJcmsp7cU7OFQ
         iqJaTkS8hXP74k9niH6kI4WR4r+IuLOXCe/uyngzDV5YeGZTBnd79fAZXdwSfif5O/RP
         EEq6zjTSXln/IiTM+ZfugbpyRsWz0XVA43oBtHmMDOuSCT1G7N8WkC1rcbqu6C0vuqsb
         zEA3M7EAP4hHA2ZSoMUjpE3Ua5QAXa880CcZlXD7gI+kkz8oYm80M1RkIH7+EMz0Gb7Q
         /vVYUpRAaD5gaWeVnGzYk71MU28sxfYChPD/c3Vs8YXb37ViMDDbWc7ijNUI7TPcheiW
         oQdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779139625; x=1779744425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXcI82h8LzUQR1Vm7aPakkDi0vBXkkrNR+KatJkgbcA=;
        b=ZfL+FRVJyOBzUDhFzi762eoA3qj2x/5nXLfhPuNtcDoMsr9LF0BWKS12p/Kd4wYGuk
         QK6W/3402uVVb3pdg0qJqoWwvjk+tLYW5vAfBBXsUu3Lqz0Q5fBVaxI+nCFNfSogm3+k
         t+ZegKBG6c1aXMVkDO5mh4F0yCyLe5QEA670L9dtdGAeN8fvZhAmjyrxtWjG2EwFT3ZQ
         oSgHudtV6lp770Zbm3QpzxDdYHQpg9RiRmsO+qQpe9EQ2IUiL/FDnkPKVVWeIM2RyPD7
         w6K9EWZVFuA0HWNY4WRHkpv0rYQPJNk/iAdGWe0tBXUb7cefGYSxoJAIqycEzgWaVTIx
         j8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779139625; x=1779744425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NXcI82h8LzUQR1Vm7aPakkDi0vBXkkrNR+KatJkgbcA=;
        b=aTTVkUZLaK9ArlIsJZ+aZV4wp0w/Lvi2Udj3H7btAc+AIVOseTbDmgjXIaJwm8lk/R
         r+Oq5n4yZJoNJJvUqJvotqzMY8FzXtFO7gHEjUfNxy1abd8lC5LvigFl4BR7BhJYk+8h
         IiWzTimu/s9czTvnLg8bpo671EXPsUbB52eVxE+KqAEj1b8hOyxZ86Qto+mRA2STfGuN
         fZyTCySykxfrQKj+0Dsm+Fw67TJ7M6/nUet9TxcHwYmtOtKZGRypesrolB7I4gjXp2WH
         l8qtvd5FQquZ1G8VedXg2zQZttPqsE1oLy/J5XTiLMXedZrxpllOoBLqWQc54DRPo2hl
         qeQA==
X-Forwarded-Encrypted: i=1; AFNElJ9oOhD/44cMesGdtUEVt4yjO25t8TsGdCAnHj+hlm7uNFrjrKH3h16pxGEyIWaZBaJrCwWy4KFtUOBL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt6T3cG4eR4ljmCni4UZ0UdEgtK8Ti3Xgq7/PDr7mLZUqPwTj/
	zd2ZaJX13f0B5yJUYJhvFSpoGnrPji5gM4TRr4AH0NvOO5Zn7gkOZhLgZHnA2uKq1ZWOTWP6CSR
	7k5cdgtNIuvyvfSHlVjQEj5JV1kaUxE4=
X-Gm-Gg: Acq92OHrDMRVsURruWUTk6QhV6tZmoMy2W08r4s2rsjZxNQi2w7daHbTVTWN8hb30DS
	MPQLk6x7ihV8jiYLYiWopZPO8VV3qZCWXB7X69WRKcnqVEmbQoQ0dn5/W81kyNJtkEUuKKBvXWV
	2qknExM9yfa/YcrsO6O6pUszvRu6YQ+CPGjnM0WhdD3dQzZ9lgCUQis+vpafVBahsnYu+URNQ80
	aKiV4SOG5SGMVTwIzLDI8tlrihX220AE+Khzp3bB4IxGv8O11E+Zy2Yjh/Pd/kxChLdWlodH/fR
	BRxD7ds6pkQ3TCCqaaHN0Xt4qkxkiT16Ff5kVWE=
X-Received: by 2002:a05:6512:39d0:b0:5a8:9b6a:5749 with SMTP id
 2adb3069b0e04-5aa0e7649eemr5139908e87.28.1779139624308; Mon, 18 May 2026
 14:27:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511174342.123820-1-piyushpatle228@gmail.com>
 <20260511174342.123820-7-piyushpatle228@gmail.com> <20260512131905.42c35224@jic23-huawei>
In-Reply-To: <20260512131905.42c35224@jic23-huawei>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Tue, 19 May 2026 02:56:26 +0530
X-Gm-Features: AVHnY4KtXRxseogZwL6x1v83BXS5ovpqyHMus-9P32wYoM0i3oW_u29ke3e90Zk
Message-ID: <CAMB+xkZUeDaca9Pr22DE9P7wJv1b=iBA743YaqxKOXj0Dyb37g@mail.gmail.com>
Subject: Re: [PATCH v8 v8 06/11] iio: adc: hx711: introduce hx711_chip_info structure
To: Jonathan Cameron <jic23@kernel.org>
Cc: ak@it-klinger.de, andriy.shevchenko@linux.intel.com, dlechner@baylibre.com, 
	nuno.sa@analog.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 5:49=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Mon, 11 May 2026 23:13:31 +0530
> Piyush Patle <piyushpatle228@gmail.com> wrote:
>
> > Add a per-variant static configuration structure and populate the IIO
> > device fields from it at probe time.
> >
> > This is a preparatory change for adding support for more HX711-compatib=
le
> > hardware variants without duplicating the probe-time setup.
> >
> > No functional change for existing HX711 users.
> >
> > Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>
> Mostly for my reference when v8 sashiko comes in - there was feedback on =
this
> in v7 but it was something we don't care about - in a driver that support=
s
> multiple parts - if someone is using the legacy path to force a driver ma=
tch
> we can't do the right thing - guessing it is an hx711 is not appropriate.
>
> Given it is vanishingly unlikely (famous last words) anyone is using that
> path with a device like this one (who isn't a developer who can easily fi=
x
> that) let us merge this and see if anyone screams before trying to
> deal with that case.

Ack. I will keep the code as-is and add a short note below the --- line for
the Sashiko reports.
For __counted_by_ptr(), this looks like a false positive. The annotation
was added based on your v7 feedback and builds fine on the current
mainline and for the legacy probe concern, I will note that this was discus=
sed
and accepted as very unlikely to affect real users, so I am not adding a
fallback path.
>
> I'm going to hold off for now though as waiting on v8 sashiko review of t=
he
> rest of the series.
>
> Jonathan
>
> > ---
> >  drivers/iio/adc/hx711.c | 41 ++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 36 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> > index 86d2a70dd3de..10ccc69f209b 100644
> > --- a/drivers/iio/adc/hx711.c
> > +++ b/drivers/iio/adc/hx711.c
> > @@ -4,6 +4,8 @@
> >   *
> >   * Copyright (c) 2016 Andreas Klinger <ak@it-klinger.de>
> >   */
> > +#include <linux/array_size.h>
> > +#include <linux/dev_printk.h>
> >  #include <linux/err.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > @@ -74,6 +76,20 @@ static int hx711_get_scale_to_gain(const int *gain_s=
cale, int scale)
> >       return -EINVAL;
> >  }
> >
> > +/**
> > + * struct hx711_chip_info - per-variant static configuration
> > + * @name: IIO device name
> > + * @channels: channel specification array
> > + * @num_channels: number of entries in @channels
> > + * @iio_info: IIO info ops for this variant
> > + */
> > +struct hx711_chip_info {
> > +     const char                      *name;
> > +     const struct iio_chan_spec      *channels __counted_by_ptr(num_ch=
annels);
> > +     unsigned int                    num_channels;
> > +     const struct iio_info           *iio_info;
> > +};
> > +
> >  struct hx711_data {
> >       struct device           *dev;
> >       struct gpio_desc        *gpiod_pd_sck;
> > @@ -81,6 +97,7 @@ struct hx711_data {
> >       int                     gain_set;       /* gain set on device */
> >       int                     gain_chan_a;    /* gain for channel A */
> >       int                     gain_scale[HX711_GAIN_MAX];
> > +     const struct hx711_chip_info    *chip_info;
> >       struct mutex            lock;
> >       /*
> >        * triggered buffer
> > @@ -456,8 +473,16 @@ static const struct iio_chan_spec hx711_chan_spec[=
] =3D {
> >       IIO_CHAN_SOFT_TIMESTAMP(2),
> >  };
> >
> > +static const struct hx711_chip_info hx711_chip =3D {
> > +     .name           =3D "hx711",
> > +     .channels       =3D hx711_chan_spec,
> > +     .iio_info       =3D &hx711_iio_info,
> > +     .num_channels   =3D ARRAY_SIZE(hx711_chan_spec),
> > +};
> > +
> >  static int hx711_probe(struct platform_device *pdev)
> >  {
> > +     const struct hx711_chip_info *chip_info;
> >       struct device *dev =3D &pdev->dev;
> >       struct hx711_data *hx711_data;
> >       struct iio_dev *indio_dev;
> > @@ -473,6 +498,12 @@ static int hx711_probe(struct platform_device *pde=
v)
> >
> >       mutex_init(&hx711_data->lock);
> >
> > +     chip_info =3D device_get_match_data(dev);
> > +     if (!chip_info)
> > +             return dev_err_probe(dev, -ENODEV, "missing driver data\n=
");
> > +
> > +     hx711_data->chip_info =3D chip_info;
> > +
> >       /*
> >        * PD_SCK stands for power down and serial clock input of HX711
> >        * in the driver it is an output
> > @@ -534,11 +565,11 @@ static int hx711_probe(struct platform_device *pd=
ev)
> >       hx711_data->data_ready_delay_ns =3D
> >                               1000000000 / hx711_data->clock_frequency;
> >
> > -     indio_dev->name =3D "hx711";
> > -     indio_dev->info =3D &hx711_iio_info;
> > +     indio_dev->name =3D chip_info->name;
> > +     indio_dev->info =3D chip_info->iio_info;
> >       indio_dev->modes =3D INDIO_DIRECT_MODE;
> > -     indio_dev->channels =3D hx711_chan_spec;
> > -     indio_dev->num_channels =3D ARRAY_SIZE(hx711_chan_spec);
> > +     indio_dev->channels =3D chip_info->channels;
> > +     indio_dev->num_channels =3D chip_info->num_channels;
> >
> >       ret =3D devm_iio_triggered_buffer_setup(dev, indio_dev,
> >                                             iio_pollfunc_store_time,
> > @@ -555,7 +586,7 @@ static int hx711_probe(struct platform_device *pdev=
)
> >  }
> >
> >  static const struct of_device_id of_hx711_match[] =3D {
> > -     { .compatible =3D "avia,hx711", },
> > +     { .compatible =3D "avia,hx711", .data =3D &hx711_chip },
> >       { }
> >  };
> >
>
