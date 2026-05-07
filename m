Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EA03B3C18
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 14:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164444; cv=pass; b=Vu13VfRkUIyf8Df0BWF2ygng2EsqEY6SOHN4J9mYPosWQMQI7K8Udqq9c7Iat6rrt1RWtW0nA/fY0qAueAFe4BHNf65if+CmoMFpcp0n50Lew17ELHgDoRtoJxS7zBtDH8NYV7wknKi2/P4sJJcZynQJFQwaRPu0qOj4LEd6TJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164444; c=relaxed/simple;
	bh=u1RoMqrCifUqxpIYhbdTo9NMRGuk2Lp1KSko1AdSd+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ly7Rdj4jo33asNw6JnKLJOo+F7ox1PpN7bzcbTYICR+kRXdToSWvh86iVTXCYtKTfj20ngwu4ki1e+1NtkTGWdGUgPtBmKnSLB0xFlzvrV2oDz+ebim9aVywkdBmeL4ZGvTZUBEewlYNRf76ba3U3KLts3kc9U6C3LUFM4xnak4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6Z7kT9o; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6Z7kT9o"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bc47a96d3bbso133189066b.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 07:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778164440; cv=none;
        d=google.com; s=arc-20240605;
        b=Mh2sn7SnVhWxA44z+Kse9RRxOTs1hrbZoFFAQymc2DvSAnzykFT3QLXX7fjWABJFAV
         ZXtgyTjXBn3+v0ZeWghf8hkWTQbBGTvLm++J5x9dHkHnjK1GAl4YAh9lA58nd89wc9NB
         jMsJsq1UkbqaFKDZcsqwbPv8I8XE2fBOs2CLqSxFJ6YS/cQOnOlxs5tYqfOAxKoCQ9LI
         PHpZnXB0PVN+IM2U02KurhH2rhIqq05U5ugoFQg2UhdoHhg1IXMdWvcI5ggNQEilrzx3
         NdjHQV47Aaqjps6IFySNNRmpaqaphzHkEw8zAUkBYLjw+WV/xZ4Zw6Qrskk76gkqU0a3
         s96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y1jepCzwMkIZeDnwa1aRBtWHdYlax/7JMCPxbjOfylk=;
        fh=lH+18OQszVnZnxneP4knCvnQ80EI9BqI+lYpwVMXMMM=;
        b=VY/riZYo4NLBE2jinhCgYq4IQiMyygunewg2PQ8kdvkGvioZ41dP+qWdJnR3rYyNrH
         OPAG91qjzHJcANKeCCozPlj1bhqnvF9t3vNBm3xKf2RhdLXUu5inlgjrpr4KKanYZT+Z
         nBBHgtUKB5bYCynoZN9RvIMTKVQTp3n6Ne8m59yRPJ2TCCeBAVjU40xW8yzLq+XwLRoa
         C9xAGZFVP1WkvACte3xKwoi9JPXtbP1TH0XgrpniJwqr4hzFzl090a3p2o0Blfo29nR+
         1oGhnbFFRahI9Zkojm7J6TlMMKWJ/raNAdijbnGR4rsiDR0ZbyEFh54AZ9rzRgNZ0Z2Z
         5gLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778164440; x=1778769240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1jepCzwMkIZeDnwa1aRBtWHdYlax/7JMCPxbjOfylk=;
        b=Y6Z7kT9ohpb6jORn8neaYhgZWV54inR2dwp4RopEHw37S1cofsCc5MZjRPMd3uLxuf
         1RSUaFmJl6FlED9tr1d9ukt6HGDBKDf6VSvuHq760rPEoSP7t9oP551xPVknAAYsEI/W
         KctRLd8taj7GnqBACPVIE0Hz9MkCkjZq+590HdkLUyiB0PJYXlArAcbOC4sc2HN/5M7+
         ItjC7bz7+klM3sY693vGM52dbsATnZDKvLbuRSVrIZvwdDLNNw8D4+hyMQuomJyY10ku
         Rg1RvXoacdwB8l7chRi1g2WLlJ7OJaZynJskfkseC07LoIc2rjTCMAWxuzqa1bAIkgWm
         OX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778164440; x=1778769240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y1jepCzwMkIZeDnwa1aRBtWHdYlax/7JMCPxbjOfylk=;
        b=byDMAAkPohpuMSW6HoByqR0MqL/PeTu7ISbabDPvD3qiVWGFHZOuRix+Aa9q29rutF
         AoVVGkteVbKzpRSaa83OaFQf+gdfDVJJ2jryEUYaOMTYjizF0/S1J/BdBEMxnL39aMJG
         4fY56eGZdVaCnS7QGutGtwkQ3Rw52aRN8k5Sr9HYJ3B7FLs2vAoibkmfDlyJwB3+/kWQ
         K5wBCnB0OsNt5kcpAetNKAUcdLXz40Qti8Wd2Nrb2o81XJ///oEXMIDOEXaIqXV0/wJG
         +KLIcfIqTDJt7AEz2KQV0mkL0q7CQCdvSnWfGkM8TbnxDM++t3odC7TQHvN7urPJ59LY
         blbw==
X-Forwarded-Encrypted: i=1; AFNElJ9PshrsVQsq6h1/H9r28I+tf8C7pnD/gTqo3eqnAb1mCjMG0rl5EEAsOANTWJkpobCe2+BCnDojx/D2@vger.kernel.org
X-Gm-Message-State: AOJu0YzOOPe+MQM5UAO+5D2QXsnVLIzmpJ7y7/GPSTimuT7UUPP07sEy
	qjL/IQhsiTQ8/Gyw35GpgF+HYTukikrTydAgJhcQjuiELnVr4gW6SHJzuzohQPkLNXviBIOGDCV
	OipzliZhLWWkkWuLizdyWegRbee+m9ys=
X-Gm-Gg: AeBDietZohJDpGCUkLeKTY+bVWbjHn9Z8I3Ajkg0GYeAy6mJVzFuF6QtuOYcpxKEvis
	6f3SR0yHWcfzOT874/0/untTRo5SiQuDSgEO559rGBdv7LiejQwd2TXRt+fRYfUXuK2uxb8pZtp
	z3G6PRefvWZLnfXb9WemW59KmMuysuNBNYZGw9xtQZSwcc4OliI6OS3iL+O9noF3UWas/yV72Xp
	GglDmETuc25D39jodgG82WE6A3UZHjTwkxj5x7JI1/y9XGFNa/BCVUykFJPFqVZAArY4UWx53AR
	JF/Z3d48OeVrrvm1EoE=
X-Received: by 2002:a17:906:9fcc:b0:bb9:2893:6a45 with SMTP id
 a640c23a62f3a-bc56e906631mr486300766b.44.1778164438809; Thu, 07 May 2026
 07:33:58 -0700 (PDT)
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
Date: Thu, 7 May 2026 17:33:45 +0300
X-Gm-Features: AVHnY4IIJylLLxrbhyYxwvVcYA-YQyJ94DnfAID32Woik6ktYzkOfwYToc1ejKg
Message-ID: <CAPVz0n1Ubvj9MHHMcM2BpxAcTCCheMihr3aJUqcDVoi_V0OQ5g@mail.gmail.com>
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

Changelog is in the cover.

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

You don't allow this. I have not seen this enforced anywhere in the
kernel except the mfd subsystem. Fine, does not matter, if this makes
you happy I will adjust.

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
