Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5089D40627F
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 14:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164578; cv=pass; b=qNXGDFIwMBVpX6VYKGI8p8uWlEd3RXGoGPuaevsc1u4EbypvSXSmM2RadQcn5ZjObIwX0XP2ckswUOpklZoKpk564VYW4gqYNrT3HLwBi6AIqDVEiK1OMC3GLNUDyJDYD6yl4fbFBdtaGaIVRdC5uI7n7bbiKYOgw2n5n5y34RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164578; c=relaxed/simple;
	bh=4Q4gVA5Jd1n6uyC1ZvFQ4rucoXxJLhEiilF2amKyVc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJ6NxyNYq3cDUpie3n6rLtCEqt9xnNdiXI6tmHjBmDV5MWctJrgFKd1G3W/Pvo1KxoKeKSm0FtPvdJ9FOVq01e3hQKMQPhLvxTOxoiTIJ0CDwRO8XT9XyaJZLmz4a4dgeFSVeleTlqb97NZxkT8BfJ/B9eWKFuwV5Tee9+OGAXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDW7JPq7; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDW7JPq7"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c19d23b19so1703155c88.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 07:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778164575; cv=none;
        d=google.com; s=arc-20240605;
        b=AdOpCEConVvEBK/lVUm8M2aWABY2PMOCJV6E7bwNngNbYSKiESOkEqHjFyLaGPtXaW
         ZX28a7FNl1I9hXSRnb/CiTGezx6v1Qqi7yv1cHDBcGsrekWnRkvvFTlESM2VAuk/n/zs
         hx5qCTcWpkhfu0h8fwi30rkxDvbPMToO5f2G7eHznvHntYDrfBzd7O5s91Ey44YGnyq1
         KvV51NeFiYwpPWyGAbbulQs/S/fSMmpZEahhvqxcX4ES/cNM4jUIu2h41aX7LwkIbE9T
         YkhJSUkffpxbqkwaCXq+lrJYxHSaAMLfyzPan1tF4fZna9w44pq2ImGp7gker49/rCGC
         bnlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tTnB6vEkbQqbTnl4MQ8rpdfcud19RDfiJ5lqADHuqcU=;
        fh=X3Mcy2dC8d3AOqm9IsmLhSXRaH8N3z2RFSzg6aQZwiM=;
        b=kakWpZ6ozuKNQ4BQKQdrACcCI7r+fhjqgfGDRBl2raTrIvlkL+Iom93WFYDKcMs3fu
         57meMsLWACNbgnTnJ+SA7uJYcGQ3dZ0Nff1o0GLOoWQ5IEpvq6khfzDdFuhkcaqV4anY
         aafABeqSyLBAI/ViABOWf+hPmd1u5JpV4nT6nysrU4l6nJ+3VvZurVdO+NqQ16VaVCfn
         ov76xwQywCAZr+NqL8TREbhtHbeCwEqdpI5yALZKJY1aIoTWfNu6yr9QJDjzZTRTJ9T6
         Vxy0K2Ku4Aco2G4eZdaxzh15rmCGcRt2Fujiv/IRsi3nDfqPG/jCsgH7CcgQwwg3W46T
         oY9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778164575; x=1778769375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTnB6vEkbQqbTnl4MQ8rpdfcud19RDfiJ5lqADHuqcU=;
        b=QDW7JPq7xBsH6lYqhvbKiu78exWMcccuTrYmUhktnNeNzlCp++Ysu3NfDUosZ+MS2n
         rEJIWPOzavyHTVgeONqo7VoYJ6arOBLNDvT8MiqCoL5f0/CN6bo/RsRcjoz9XQt+CToc
         LMr3V8dgiwO5LhQ8sn9EyISflfchzqdHKHl3EVGatiOmVw7SL9yolLqDTSbL65475W5B
         jS0IxwyqW70zAho0srUNBVd54FyEBSxIUgCRknUnYG6n4PuswuRgHFaMqFwZ5Uw9O82+
         HLCTgAk6ZrqlvGF/hy0HdyGxMyM2HHl+vseN6V43kuRlb09GjTicJeFdV8vEaD0PqmkK
         7CvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778164575; x=1778769375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tTnB6vEkbQqbTnl4MQ8rpdfcud19RDfiJ5lqADHuqcU=;
        b=qoYqYnIIRtow8QkbKvGMxvGGtK2Vl/OnuapzbCFHE8/Pey9bfwaTx5uqGvq73pVEQy
         teYiVmVNmtyiQxEYgAPI4w7h5lmXSeCcZnbsjOx4UxsbpBd0NklWofwDMqgCsE8MY1cs
         njXsPpfqlnaThXAMmGBTr4M8rBRnYnnDccxY2NK6D257TOullRZZrfn0KfPGM2bzr4mM
         IMOkvoqtntxIb153MT9+IPReoed4LtnNg2SVOUXliIftva+z3i3dygeHaVjlGQUJ8Hfb
         qDh5Z9onnByu8jg7SYFYdDqvId6bZKQUg4pl/Ag2MGX81AL9/zv5RlNF2T9YIepQB2AI
         1KsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5Qt6Ralc+kzALbWAfrT4Q0jb051ATIR9FAcs1M1a+c+7/AqGAAava4HN5pEpq7bJ2xucn9MOGlrbn@vger.kernel.org
X-Gm-Message-State: AOJu0YwBuTn8Ce+bHgij4W98fpNaxECwR2M5PWM+x2Ss7DDPkPVdps2G
	0SChbfbOw0KWf4priae97Msc5CHXrRQ1Ry+SuWqmisXoCmBLHB2CEiJwM9+yWtHUOsH9qqXmvqK
	bgpAQ8vdO1TSv8+Xe2cYXd2ELAJBHb/U=
X-Gm-Gg: AeBDietnyqUIZC/OBh/UGeWfml+aRdQ9+ZanHAwHHnVv8YpUYxHEAvpNfjUHUNZpLk+
	n2gP/OzgGj7b6t6odPjOc/b1OfJC9TYVI773ybJkfhf+E1u4Ja8T2EaQrvs+Yel05sU5HRfHTho
	gE1xn2BJWwh8HCd7yrJRt4TQokFNN1ObZhbFvHB0v9LZ+VU9ahRFFY9/oPzHdNgP7tAGJBB345W
	zLL2TJJrcIhAh5Hk88/sZfQexqgidSKkCt8TLw0++Ko7WWcmNo1jUmeDWkkbxdtwGYgeR7Ky2LI
	5xUMQZOvkbn+S3sPEOA=
X-Received: by 2002:a05:7301:1018:b0:2ea:ed70:3ea8 with SMTP id
 5a478bee46e88-2f54e3802ddmr3907198eec.29.1778164575034; Thu, 07 May 2026
 07:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428153611.142816-1-clamor95@gmail.com> <20260428153611.142816-7-clamor95@gmail.com>
 <20260507140715.GP305027@google.com>
In-Reply-To: <20260507140715.GP305027@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 7 May 2026 17:36:03 +0300
X-Gm-Features: AVHnY4Ipu20JTRjb2M-ehjX65DOmdXWZujrR93JWxLxR9_IHfdzLcTQAicaBOVc
Message-ID: <CAPVz0n2nfRkxg-M+jVfLaXbTO1AR_GtV7e8Vnw32gWTazUjsjQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6 RESEND] mfd: motorola-cpcap: add support for Mot
 CPCAP composition
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 7 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 17:07=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 28 Apr 2026, Svyatoslav Ryhel wrote:
>
> > Add a MFD subdevice composition used in Tegra20 based Mot board
> > (Motorola Atrix 4G and Droid X2).
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/motorola-cpcap.c | 50 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.=
c
> > index 516d1e33affa..fdec92f5c6b0 100644
> > --- a/drivers/mfd/motorola-cpcap.c
> > +++ b/drivers/mfd/motorola-cpcap.c
> > @@ -335,6 +335,54 @@ static const struct cpcap_chip_data cpcap_mapphone=
_data =3D {
> >       .num_devices =3D ARRAY_SIZE(cpcap_mapphone_mfd_devices),
> >  };
> >
> > +/*
> > + * The Mot board features a USB-PHY and charger similar to the ones in
> > + * Mapphone; however, because Mot is based on Tegra20, it is incompati=
ble
> > + * with the existing implementation, which is tightly interconnected w=
ith
> > + * the OMAP USB PHY.
> > + */
> > +static const struct mfd_cell cpcap_mot_mfd_devices[] =3D {
> > +     {
> > +             .name          =3D "cpcap_adc",
> > +             .of_compatible =3D "motorola,mot-cpcap-adc",
> > +     }, {
> > +             .name          =3D "cpcap_battery",
> > +             .of_compatible =3D "motorola,cpcap-battery",
> > +     }, {
> > +             .name          =3D "cpcap-regulator",
> > +             .of_compatible =3D "motorola,mot-cpcap-regulator",
> > +     }, {
> > +             .name          =3D "cpcap-rtc",
> > +             .of_compatible =3D "motorola,cpcap-rtc",
> > +     }, {
> > +             .name          =3D "cpcap-pwrbutton",
> > +             .of_compatible =3D "motorola,cpcap-pwrbutton",
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
>
> MFD_CELL_OF() for all.
>
> > +     }, {
> > +             .name          =3D "cpcap-codec",
> > +     },
>
> MFD_CELL_NAME()
>

I was not aware these macros exist. Thank you for pointing to them.

> > +};
> > +
> > +static const struct cpcap_chip_data cpcap_mot_data =3D {
> > +     .mfd_devices =3D cpcap_mot_mfd_devices,
> > +     .num_devices =3D ARRAY_SIZE(cpcap_mot_mfd_devices),
> > +};
> > +
> >  static int cpcap_probe(struct spi_device *spi)
> >  {
> >       struct cpcap_ddata *cpcap;
> > @@ -389,6 +437,7 @@ static int cpcap_probe(struct spi_device *spi)
> >  static const struct of_device_id cpcap_of_match[] =3D {
> >       { .compatible =3D "motorola,cpcap", .data =3D &cpcap_default_data=
 },
> >       { .compatible =3D "motorola,mapphone-cpcap", .data =3D &cpcap_map=
phone_data },
> > +     { .compatible =3D "motorola,mot-cpcap", .data =3D &cpcap_mot_data=
 },
> >       { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, cpcap_of_match);
> > @@ -396,6 +445,7 @@ MODULE_DEVICE_TABLE(of, cpcap_of_match);
> >  static const struct spi_device_id cpcap_spi_ids[] =3D {
> >       { .name =3D "cpcap", .driver_data =3D (kernel_ulong_t)&cpcap_defa=
ult_data },
> >       { .name =3D "mapphone-cpcap", .driver_data =3D (kernel_ulong_t)&c=
pcap_mapphone_data },
> > +     { .name =3D "mot-cpcap", .driver_data =3D (kernel_ulong_t)&cpcap_=
mot_data },
> >       { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> > --
> > 2.51.0
> >
>
> --
> Lee Jones
