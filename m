Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794046437;
	b=dLp6VZzT9bbxSrW8UsU4NS1kKN8S+ELYqQE5JSOsS75wb93fChYIzKUolEY07ppjoj66
	 ETDBFTIBIGqJvghte8DYqWdadxZEMkbpAP/QwY00YPaxfPD9jQ2hKz495UDwIzUtxinD4
	 cNyyxw7A+XTzF0qZlFY+m0/g8aavjyyN8fbcWxCSyVBd4m8HbrJBKr7zqRLdgEjxoISLf
	 3jYKRSuj4XqERFKiuT9tXfQy6TQnjd+NxaAj7k5MkM4hREp5jhxZqT/9zAMKq/4S8qC2i
	 LkO2peodiphen/Y9U+vo0+OVllhaLD7Rn0+EjLLeKh4qbL5M/sBiXYBVkPJPg5HTDUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k78g5WSNgz938dzM1WkRxWbXOTlco889sZR+tqZe4Xw=;
	b=EjaIrV5R+hfQV+NLmghhfLt1uGG6xkhukk4AXhDEEwbCpUqAuwwr4+HXVCjbo9kXAXaz
	 TclTrMQA7PZpVfOctx7hvnicvfB4t+mw+5h/AN6ntmBj7879oUt0OmS9BPrKKx4KzACeJ
	 /yGxu+Fz9bmz/lO+Sada7SgYrFAp3rUICVCE5ALJGzn2wnol8QKgwreRwyMZ4m01FGFI+
	 D1CUOTwsO7ab5X7okZlqfIo5JH3couxsQxavmd/PnnGCjfG38UwZvDWNzT7H9d+jsvhA8
	 sSa1GsMPomv4rcHWrAbVAigLXVykT9yoyzL4TUW/NU7ipZPHy84gB8ObxIezoOlQd1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=STv38oHW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D2F606A338
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 10:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4D2F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=STv38oHW
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37198ed3727so125479eec.0
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 02:13:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794046436; cv=none;
        d=google.com; s=arc-20260327;
        b=ec0jcsy81bEYwhiNa+EE09ZOZLxLlgtfZaZ/xwc02JJc9xeNeWR/JB2rVZ3SqvTk9N
         nWdgdZL5+pFog2TJ/278NfgUbHsk8z3oJtQAF1FpL2rG9M1WHzAnvfuf2+PfULBT8HdO
         w+slvhJSIrpzqiIxbx2jnmBww5xKEOrmZLBnLzt+yYoS1FeAhlIgETZECfK584TiyBlz
         tXFfbVTjJpqRd9yqbuTyspIUpTfAtLqZ6f0s1W9xSBO/3kPt5Zd7QKKJbzjfsAe6kND+
         tALpmqTrOIH4cQqJYLVN7Hbvmulc2hJRAVnB2WBg7Fj3xhzQnkSPwo1pX8XwNofGM/P3
         loZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k78g5WSNgz938dzM1WkRxWbXOTlco889sZR+tqZe4Xw=;
        fh=yJRcDFYvw6hJ3+FGJ3Zy6TXH46evcyc5qjsvSAxCpNI=;
        b=d7QGW8/rvibN4M/CVtqREijp40Ut3eJmMFSoD4Fu/s7IEsE6yOBr6Sk42XWcgfdnQw
         Cfob123eo3Cg6MrgZiI2A2uH0xgq3jUwNJlN8eJQrP/AB2DGGQ4d/sTwTr6zLj1WjyZV
         kbwlvnNI8xKmFNZg3h+e6DfyQNhewXsdIB2YxawqVBMUnW716be/AWJ8rA4uAhDiBR/+
         0z+xbxaXjEfpWlVMJuB3kk8MjUSvWL0VG98zenBJZiqLGUL9Itq/BCcPfDWENSjmKvTv
         YqoA6PPZMspXwm/Czcw+IZkkhKGTnMX6OkPs2jBtuQ7gNAg+k0/6wjpCcRvltLrQYeKW
         2xnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046436; x=1794651236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k78g5WSNgz938dzM1WkRxWbXOTlco889sZR+tqZe4Xw=;
        b=STv38oHWBm3TrNxUeMnYg5aD1OrKml1+khBJ8SmsZRR+6m3AurmhzGOXu2DAird0k6
         HPwKCvLnRUFUHb3iLp84oDifqjWUfY/0SAnSzzt+0YoN8mI7FqBmgFMsKigLSoZXfOM9
         mzNXbW6tcg+tShKsWPinsMJYrHppnfM5TT7yXjS/Qe0rhZu2YHFK6RTlkX6Jd/cUXiy4
         GrZyIA+tRCF2Nd36U3mG2vNzAstnGIMlELXHcbRqi2NcbJhv6EqoB11eXhU8KsExbJ+V
         5UQPiGoLs5OBS4CcVvhnn1bX2eZ/J45pKw+c/LPIavX+bND7vVM98QM88NsHCSezlQf0
         lIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046436; x=1794651236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k78g5WSNgz938dzM1WkRxWbXOTlco889sZR+tqZe4Xw=;
        b=XHYFi7njP1Z3r3oNbpA6HuGfaA+ZuPBGQOCMKeHOirbUoRo/wmKCmuDHjDjniBYNj3
         26Mr3hNY5OLC/szYWKRSvOO91M+1RLr2f1j0LK+V/MUVSQtW0tzSupWbeK5SsqXim+Xm
         IMkEInzfQk2QPVdPI7M77GUKszLcOlJmSvv1JMyXp5nlPjOYATyoXguFaAFEm+Nm0jPz
         ZfRHhAjL0pVsXUgEhIk7iJZkyrDO26njEDEkvuiCl2ubn4R8mIt1QCK0cSjFEeF0UcNC
         Hp0EgG2DJigjJYuhMCouX94mbezVFmzRhzoPJlWgkf1MWA8Xd/2KfJZcQPlvcq1c8ebd
         a+zg==
X-Forwarded-Encrypted: i=1; AKwUvBxeLclxeGglJI9NDvm+vViWPyWvAd4zWjbdBRak4BnykZ0YvioTVNtGB8h6tt2UYvRu62Q99dnEg2Q7@vger.kernel.org
X-Gm-Message-State: APuU4Z/ees61obh/3Dtd/9L7lGPyfj7DEQ83pZrHWZLskF2b70N2gd+7
	A7mSuhrn1uT3btPrXSWCfeqEoCq/5Xe+oXfsPOGLjBcTkb13c4eZIYl+d+fZznfAjuLgdxP8rmA
	cqUOhSUH6NpD/Jxr0BxDhYHCt8aTxxAM=
X-Gm-Gg: AYBFou1LA1GxKHrK56XXeDi1JHn7Wvz0e9P6qfFuMS/Ecx2kRIe8qiLnu2CMn+h4372
	CIanscpLQhQghA0bmYjaXH/lxJB1dB5FeH/wHaqpsCTdseXcOl1tMIPtb6xFkUmV+ZY019aPU4W
	1qqjmoatzRo99deowtqCYlyLoOVWNL+xXHt7XwyU4BvDPwKTx5ClcMvsuY/5ISqXym3QKhyU11V
	NnAUc/TUHGzQLGz/5E7w9i8DxdqD52BMntJk/MEuc4JCofbodLWFYsVOs1cYwR0/3i9LImKA6AR
	4j0U3L9d4UWyASZhF0KIDvPQ3eDFBijeyrHWo3x4+AgJj78rLQfDnb/TlcyS6RWj+mkkKCyNv9c
	Cric0HmVi7yxIjAZXZc4fqS2JFMLRSjaEmwwBh0W71WIR9GyEQG841c4iDIFlV4y+vBoyhZVe/Y
	fpOTi+jRPKOtTNX3bJQqrkjwTeXnaxHA==
X-Received: by 2002:a05:7301:d810:b0:36a:37:1404 with SMTP id
 5a478bee46e88-370f6018313mr2820026eec.13.1794046435857; Sat, 07 Nov 2026
 02:13:55 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106091943.35783-1-clamor95@gmail.com> <20261106091943.35783-3-clamor95@gmail.com>
 <20261107033029.0b2d3ee1@jic23-hlaptop>
In-Reply-To: <20261107033029.0b2d3ee1@jic23-hlaptop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Nov 2026 12:13:44 +0200
X-Gm-Features: AclHuK-9FSK6jNcHRsjMbOe31zQJwCb0DbuTYhYwvEmeWJ2hyCpsHkhiOXfzBM4
Message-ID: <CAPVz0n250nXs5A4BDY-sXW=eBLAzSn2x9CA-Zf692x6La3rFBg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] iio: light: ltr501: Switch to modern match mechanism
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Pan Chuang <panchuang@vivo.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Nikita Travkin <nikita@trvn.ru>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 7 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 05:30=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri,  6 Nov 2026 11:19:41 +0200
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Remove the chip enum, break the chip list structure into individual
> > elements, and pass each element using i2c_get_match_data().
>
> Sashiko calls out that for ACPI this results in an ABI change.
> The original code did the ABI wrong but that unfortunately doesn't
> mean we can change this one as it is an artefact of a time when
> we weren't so careful about those names.
>
> So you'll need to put special handling back in for the ACPI parts
> and that name. Some other things in the existing code noted inline
> that would be nice to clean up whilst you are here.
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/iio/light/ltr501.c | 165 +++++++++++++++++--------------------
> >  1 file changed, 74 insertions(+), 91 deletions(-)
> >
> > diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> > index cc5d7af44d77c..d5ce6468a229b 100644
> > --- a/drivers/iio/light/ltr501.c
> > +++ b/drivers/iio/light/ltr501.c
>
> > +static const struct ltr501_chip_info ltr301_chip_info_tbl =3D {
> > +     .partid =3D 0x08,
> > +     .als_gain =3D ltr501_als_gain_tbl,
> > +     .als_gain_tbl_size =3D ARRAY_SIZE(ltr501_als_gain_tbl),
> > +     .als_mode_active =3D BIT(0) | BIT(1),
> > +     .als_gain_mask =3D BIT(3),
> > +     .als_gain_shift =3D 3,
> > +     .channels =3D ltr301_channels,
> > +     .no_channels =3D ARRAY_SIZE(ltr301_channels),
> > +};
> > +
> > +static const struct ltr501_chip_info ltr303_chip_info_tbl =3D {
> > +     .partid =3D 0x0A,
> > +     .als_gain =3D ltr559_als_gain_tbl,
> > +     .als_gain_tbl_size =3D ARRAY_SIZE(ltr559_als_gain_tbl),
> > +     .als_mode_active =3D BIT(0),
> > +     .als_gain_mask =3D BIT(2) | BIT(3) | BIT(4),
> > +     .als_gain_shift =3D 2,
> > +     .channels =3D ltr301_channels,
> > +     .no_channels =3D ARRAY_SIZE(ltr301_channels),
> > +};
> > +
> > +static const struct ltr501_chip_info ltr329_chip_info_tbl =3D {
> > +     .partid =3D 0x0A,
> > +     .als_gain =3D ltr559_als_gain_tbl,
> > +     .als_gain_tbl_size =3D ARRAY_SIZE(ltr559_als_gain_tbl),
> > +     .als_mode_active =3D BIT(0),
> > +     .als_gain_mask =3D BIT(2) | BIT(3) | BIT(4),
>
> As below.  Same for all the others.  That would be a separate
> cleanup patch though -> perhaps do it with getting rid of
> the als_gain_shift.
>

This is all out of scope of my series. I am not a code janitor!

> > +     .als_gain_shift =3D 2,
> > +     .no_irq_support =3D true,
> > +     .channels =3D ltr301_channels,
> > +     .no_channels =3D ARRAY_SIZE(ltr301_channels),
> > +};
> > +
> > +static const struct ltr501_chip_info ltr501_chip_info_tbl =3D {
> > +     .partid =3D 0x08,
> > +     .als_gain =3D ltr501_als_gain_tbl,
> > +     .als_gain_tbl_size =3D ARRAY_SIZE(ltr501_als_gain_tbl),
> > +     .ps_gain =3D ltr501_ps_gain_tbl,
> > +     .ps_gain_tbl_size =3D ARRAY_SIZE(ltr501_ps_gain_tbl),
> > +     .als_mode_active =3D BIT(0) | BIT(1),
> As below
> > +     .als_gain_mask =3D BIT(3),
> > +     .als_gain_shift =3D 3,
> > +     .channels =3D ltr501_channels,
> > +     .no_channels =3D ARRAY_SIZE(ltr501_channels),
> > +};
> > +
> > +static const struct ltr501_chip_info ltr559_chip_info_tbl =3D {
> > +     .partid =3D 0x09,
> > +     .als_gain =3D ltr559_als_gain_tbl,
> > +     .als_gain_tbl_size =3D ARRAY_SIZE(ltr559_als_gain_tbl),
> > +     .ps_gain =3D ltr559_ps_gain_tbl,
> > +     .ps_gain_tbl_size =3D ARRAY_SIZE(ltr559_ps_gain_tbl),
> > +     .als_mode_active =3D BIT(0),
> > +     .als_gain_mask =3D BIT(2) | BIT(3) | BIT(4),
> Is it really 3 separate bits, or GENMASK(4, 2) to
> represent a 3 bit shift?
>
> Whilst you are touching the driver can we get rid of the
> separate shift by using field_prep() field_get() using
> just the mask?
>
> > +     .als_gain_shift =3D 2,
> > +     .channels =3D ltr501_channels,
> > +     .no_channels =3D ARRAY_SIZE(ltr501_channels),
> >  };
> >
> >  static int ltr501_write_contr(struct ltr501_data *data, u8 als_val, u8=
 ps_val)
> > @@ -1393,14 +1387,11 @@ static int ltr501_powerdown(struct ltr501_data =
*data)
> >
> >  static int ltr501_probe(struct i2c_client *client)
> >  {
> > -     const struct i2c_device_id *id =3D i2c_client_get_device_id(clien=
t);
> >       static const char * const regulator_names[] =3D { "vdd", "vddio" =
};
> >       struct ltr501_data *data;
> >       struct iio_dev *indio_dev;
> >       struct regmap *regmap;
> > -     const void *ddata =3D NULL;
> > -     int partid, chip_idx;
> > -     const char *name;
> > +     int partid;
> >       int ret;
> >
> >       indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*data));
> > @@ -1480,18 +1471,10 @@ static int ltr501_probe(struct i2c_client *clie=
nt)
> >       if (ret < 0)
> >               return ret;
> >
> > -     if (id) {
> > -             name =3D id->name;
> > -             chip_idx =3D id->driver_data;
> > -     } else {
> > -             name =3D iio_get_acpi_device_name_and_data(&client->dev, =
&ddata);
> > -             chip_idx =3D (intptr_t)ddata;
> > -     }
> > -     if (!name)
> > +     data->chip_info =3D i2c_get_match_data(client);
> > +     if (!data->chip_info)
> >               return -ENODEV;
>
> As above. Unfortunately at this point we'll still need to
> do some special handling to match the existing indio_dev->name.
>

const struct i2c_device_id *id =3D i2c_client_get_device_id(client);

...

indio_dev->name =3D id ? id->name :
iio_get_acpi_device_name_and_data(&client->dev, NULL);

Will this be acceptible?

> >
> > -     data->chip_info =3D &ltr501_chip_info_tbl[chip_idx];
> > -
> >       if ((partid >> 4) !=3D data->chip_info->partid)
> >               return -ENODEV;
> >
> > @@ -1502,7 +1485,7 @@ static int ltr501_probe(struct i2c_client *client=
)
> >       indio_dev->info =3D &ltr501_info;
> >       indio_dev->channels =3D data->chip_info->channels;
> >       indio_dev->num_channels =3D data->chip_info->no_channels;
> > -     indio_dev->name =3D name;
> > +     indio_dev->name =3D client->name;
> >       indio_dev->modes =3D INDIO_DIRECT_MODE;
> >
