Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794046520;
	b=IjXoFpUV6YSV42EKOnohmbefJzLCwBdUoXZ8+sECJ8CZ119IPvK2YkDfH3Q7pAvWqA1j
	 pyiaWG0OECvIzPl/2VQxlkcVToyPaIg+jwEaZjEiC0wWJ32FZY77t1NROpBhazx/yboR7
	 J11MEjNtFKUWK49cxwfPzUa4FvF09W2j1hM0/z4m4Dy6Lstwpd0P7+HOjl7dNpCEx+k/Q
	 PAcTtH487ahj0pxuqkqeoEAPaZuz3mbOAwsfAHyGySNzJaLzRyMm+3osFRB48wjUSd78Q
	 XDRxYdfZHgIRcdG+g9WOalS+OVxkg4HXCqSX39kEmw/GNY51QLvFWKNhPKcMjFqvwFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SfEg/fc/vfw/G9raoRVqHQ8kPtY/AXMaqrz2jbU8BRs=;
	b=FJrUW8fKQg1YQPa34OhXU6FYHNB5QeXSC72dYuwnKjZP+KZ/TbpRvpugj7lyCZ9gok05
	 tI/jZELGuRUR9JqnnjgJiMkob7qASDGtXP6owiEjhAG4pqglLmOdV5ArP0LdDfNdo5Yms
	 6TvcSP7YI1gZeKw3b2fYx7MtwQ0tIWeGkAy1aj1Iwr20+vxBBp9dXfWiVM8jBn6oMzPxG
	 6MOHg/xUmpnDqs3JC+KyOPztRvJLCdlybfW7qr8vsDwrgpvUknkybwGk4y5S5QzCYckov
	 F3Y3FBOZwQqU3KDDaDDSCNqv4ZaU6oLDb5rlrfgfqlSZ++uQGLhF/tzs67NyitX2Q4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BW2SPxge;
	arc=fail smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3823E606A32F
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 10:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3823E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BW2SPxge
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2234371eec.0
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 02:15:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794046519; cv=none;
        d=google.com; s=arc-20260327;
        b=HhPfvSTMtMEOzXBm6K0he+f20Ti7mQI3YxOWMDdE4mZ95TltKtK88eaHGDQKMPNCb3
         dUIVNBlR1DyMk/5074bPQsLfbqcNT7f1qIWKE3F62Vk2IapU1Qi68RhqxbB33HV5pstK
         wMCYWTPUU4K4r1ryaptcsmF8RKndAxwEENMMO0Yj9g1KJCH4DI32lzVnGO9UIger5Ejr
         aNdq8q7vsVW+eyQvU9aHdRyg7KzucxDYb7Go1RnmOJG3TFSs1AfjM7PJFQLOlLqRjHI8
         lDI+qyZhAagN4VUMNqJIyFIQLPaBNcs29rSEi08JQtyMiEju7rFnefCbWABu+aj7RWns
         Cz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SfEg/fc/vfw/G9raoRVqHQ8kPtY/AXMaqrz2jbU8BRs=;
        fh=OeavXy9ZYUmq9dlTvrDHlUjCyEIod4P3v2vJ/AI+dl4=;
        b=avOLIPVdOc8eo9FjTzsr1Xx56zpfI8bjwkia72ff7ZOU5bQzYSS/3hXPTohpSNUBOM
         Qyq3tvGhYhDXo/KGEnRGasaVq28XAAHN7S3lHVvF1MDoeFD8rcdpw0ljVJbL3riMNhIs
         HreV0fheXboabMn1EB9fLGLsgATl+590FtCjMZaf2PyUg//zdtkqTIUN8gDTOvrb0uow
         bs2VD5Ya7KerPN2dk32c1xDMRX9e76ac5FtuyXemUg5k3ggkRCdex32eKERzQf8z177U
         15NJ2ZR72VaFSWTpBBAw+l+lyLF8LHjEJlHZ89KecFhypI6ymSt7eN5E0AGPA4O0ICcW
         9sFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046519; x=1794651319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SfEg/fc/vfw/G9raoRVqHQ8kPtY/AXMaqrz2jbU8BRs=;
        b=BW2SPxgeH6GNv0llAerKRF1J0sLqceoIo3AJWiCKAq01ctoZFx1dIHkyNR+miSJ1YS
         66Yg3/qBz0XtbZocHj1+EXVJWBJ/tGJ9wIZsxuxflZJRHYmj8wcREpnghANefDuG1eT8
         SCvPnaoIDkZ7m65u+6DORUIN/71ApWO66Fc4BKeyuGurcEsoL6zQfANXeqW9zBRQrJ8p
         GkXL/nDORVdfzlUIMzeImv0HhV3htj1CNgA1KoL3PN99ucyzCNsyv6NLbLRqa84lxKBj
         1ReR8oAlxSgNmukJbD9NGTUPwLFj2zz2N3iW1tsfDQuy72jWlDB/y9N0FVfooY+JR6Na
         QO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046519; x=1794651319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfEg/fc/vfw/G9raoRVqHQ8kPtY/AXMaqrz2jbU8BRs=;
        b=GXZFRFzhEOmjpMzeRB0IDrfi8zRxs+LIwXHYDDSXrqzeV7widCU9vUpnldEBZr5Dmw
         dk1WZH759qdL7XuEVGUsAdO1GnkTlg/+ZsfWJkwpf7AexsN6elMr6u99NVdkHsMBPHMh
         miZ7RnrNgTVRPmgPaxdN1o/Zo0ZcPebULgN02FPGGuFhh8WXELpLXQK4CTOsrACh43J9
         eYZse3L6GRpFXP4algxdHcNae1Qo+FzJcVIYKk0wRzh3Pmd4h9dgGbQLERykmGaloZ6U
         GZzsma9ibBMrdpagck4D+8N6n5e1ekd8Uh3it4btO7aNvgy7R+Guna8w53vZ6SkmK0lU
         rX+w==
X-Forwarded-Encrypted: i=1; AL+hErFVlSfs4YW3glMqbkHFUBry4hh09vZ2QiwxeaHX8U3jRpsEye8PNXyj1MR/ALmdJU+ES2OL5jZKXVvM@vger.kernel.org
X-Gm-Message-State: APuU4Z9wozOcvnTdE0Y4M2tikKr6bFBKTAG9C5vT8VWEcw3MDKphFYRQ
	3bm4Qf0u8w/A1HiNUvwxIFoR+3C3klLBvBtgdPXCgka1HjG5jTlFbZUL8JrYK0qjmb9qOnvuE4+
	lkWCYrVzLx3Jfcwwuj3hE+RiQV5s5bGM=
X-Gm-Gg: AYBFou1lyMcZg8EP3UFp85wAuUtNk0wstPbfCeZxQYxprI0KMbtndRKaun8Or/0V4Km
	aTr/uxDSYYR2VOHn+kO8w7znQCfLPtec0CtZg9Utn0pYPce7ifIxrjjHPRJ2bkFxiaaTE6CjmS2
	JUQzjgrdsfeJt9K3NXf2yaKRwzlkeQtIKqDiYkC1ybyvJ+gP4u7iytiRK6J8pYf0lACW5RSdUIO
	YmEUhA6AYjTiY8NIwC/lkeXF6y2ry6qVw7m6m5JwduiZ0Ly1keB5NDG4+4U/oLWrWQMvsgbnOcV
	SsFxb9cTJwjINLNAgdizqTRAybWWjbD2NkIbw2yNJqaQO216dzLuuUCFiETxllNw08MjkFau4ej
	hmifSLgSEDCCUWXqt91DkwlDMXlQ7DksF+gRSvkcuU50/WmNxYiN2WMZeoMPmB2fPbC/gl9+1Jm
	8qux1JgFaMjOCoMJhjhWMJ4CkzYzD/Ig==
X-Received: by 2002:a05:7301:19c:b0:36a:1427:3933 with SMTP id
 5a478bee46e88-36f76118d3cmr6774338eec.16.1794046519121; Sat, 07 Nov 2026
 02:15:19 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106091943.35783-1-clamor95@gmail.com> <20261106091943.35783-5-clamor95@gmail.com>
 <20261107033340.64062192@jic23-hlaptop>
In-Reply-To: <20261107033340.64062192@jic23-hlaptop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Nov 2026 12:15:07 +0200
X-Gm-Features: AclHuK-zTWTUAmCD08h0tHSPAfGIz6D9Rp3d1t8XRONo6MH1Z8w31tM46bHSFks
Message-ID: <CAPVz0n10N6PvBC5AL=nT+fUGsONtuzTZvzSYqAXP_eWWb86nuQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] iio: light: ltr501: Add support for the
 LTR-659PS-01 proximity sensor
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

=D1=81=D0=B1, 7 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 05:33=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri,  6 Nov 2026 11:19:43 +0200
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Add support for the Lite-On LTR-659PS-01 proximity sensor. This device =
is
> > nearly identical to the LTR-559ALS-01, but omits all elements related t=
o
> > ambient light sensing.
> >
> > Add a no_als_support flag, similar to how no_irq_support is used, to
> > isolate ALS register access for the LTR-659PS-01, since ALS registers a=
re
> > marked as reserved and interactions with them are discouraged.
> >
> > The ltr501_trigger_handler relied on the scan index to identify channel=
s.
> > This approach is fragile regarding channel status flags and can break i=
f
> > the index is not strictly set. Switch to checking the channel type
> > instead.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/iio/light/ltr501.c | 73 +++++++++++++++++++++++++++++++-------
> >  1 file changed, 61 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> > index d5ce6468a229b..e7762115df913 100644
> > --- a/drivers/iio/light/ltr501.c
> > +++ b/drivers/iio/light/ltr501.c
> > @@ -151,6 +151,7 @@ struct ltr501_chip_info {
> >       u8 als_gain_mask;
> >       u8 als_gain_shift;
> >       bool no_irq_support;
> > +     bool no_als_support;
> >       struct iio_chan_spec const *channels;
> >       const int no_channels;
> >  };
> > @@ -192,6 +193,11 @@ static bool ltr501_has_irq_support(const struct lt=
r501_chip_info *info)
> >       return !info->no_irq_support;
> >  }
> >
> > +static bool ltr501_has_als_support(const struct ltr501_chip_info *info=
)
>
> Is the helper bring enough value?  The !info->no_als_support
> where this is used seems clear enough to me.
>

Noted, if you are fine with !info->no_als_support I have no objections.

> > +{
> > +     return !info->no_als_support;
> > +}
> > +
> >  static int ltr501_match_samp_freq(const struct ltr501_samp_table *tab,
> >                                          int len, int val, int val2)
> >  {
> > @@ -656,6 +662,29 @@ static const struct iio_chan_spec ltr301_channels[=
] =3D {
> >       IIO_CHAN_SOFT_TIMESTAMP(2),
> >  };
> >
> > +static const struct iio_chan_spec ltr659_channels[] =3D {
> > +     {
> > +             .type =3D IIO_PROXIMITY,
> > +             .address =3D LTR501_PS_DATA,
> > +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> > +                                   BIT(IIO_CHAN_INFO_SCALE) |
> > +                                   BIT(IIO_CHAN_INFO_SAMP_FREQ),
> > +             .info_mask_separate_available =3D BIT(IIO_CHAN_INFO_SCALE=
) |
> > +                                             BIT(IIO_CHAN_INFO_SAMP_FR=
EQ),
>
> The sampling frequency applies to both channels here. I'd just make that
> info_mask_shared_by_all
>

so IIO_CHAN_INFO_SCALE is separate
and IIO_CHAN_INFO_SAMP_FREQ is shared_by_all

Noted.


> > +             .scan_index =3D 0,
> > +             .scan_type =3D {
> > +                     .sign =3D 'u',
> > +                     .realbits =3D 11,
> > +                     .storagebits =3D 16,
> > +                     .endianness =3D IIO_CPU,
> > +             },
> > +             .event_spec =3D ltr501_pxs_event_spec,
> > +             .num_event_specs =3D ARRAY_SIZE(ltr501_pxs_event_spec),
> > +             .ext_info =3D ltr501_ext_info,
> > +     },
> > +     IIO_CHAN_SOFT_TIMESTAMP(1),
> > +};
>
