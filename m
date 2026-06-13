Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E7F33F360
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781337699; cv=none; b=LLZGHg9wlUq3/1kMT05zpzi+trvvi+9LkwZa9Oqby50ombRXC1X0wSwkztTG5NMcVGyr96nXE3XDzQkk/g1ZGt5oAtGGzfzCxnITgip1MqVrfn9qT58JVDTCkFVZrZXUqEGYinIOoD+oukg8nuICSfeaxXZ0UPVufBfWGc3Icd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781337699; c=relaxed/simple;
	bh=hmE098zqkyUMeuxcAnU1aXWHJ5Q2VUM63pQU4VHVRMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJlFrxgEQU6I4x0D0cHmuvweacTl7bIctJSL6tgpl+qHkF6lFDnP8oN3BZyAmMctNcO26ZZ+h/DzRc9Ttq5OPYb5LuvCsPOx/2v1WjRSZDGgS/Y87gUW450LNsukQ6wR4f+49U/F/plSB7NOdL5SFeFEPNVDwPB/6/j1J0SqtI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7e0aa486af8so20273687b3.1
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 01:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781337697; x=1781942497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ihqJzJXJ9l3Qxo/0/OgruWARn9hNmcn+VQ3o7o0360=;
        b=gYd0kAxniXwzabOpMv5csFiWJyoooU8jqF2UcHbmHN8pLBEzd+z+rYL4uaryz/wUU6
         8a2JVPFjVuMhXT47sf2z9HmK1TOd98i0JqL00XBxkQtCeEFVZFNhLsOtRTnN4ZPy4p6A
         QsRsXVJ2dht3I2v54qYEMqamLQSbpBOIxTJZZ71w4nan049ptYaMy+PMZDwrUa4JqBNC
         BW3ijZJSMBQptqKR8e2zIiLvzy3cc/i5lfMotEZhrjVklIHZG39GeSPaf3TOp5EpnIKo
         A+XF1NS2kkdTu6HoufPa3trgO/jnM9IT6mauU2rkkzKSP1a/BSDBBpUzpnFj7zWKGceW
         F3XQ==
X-Forwarded-Encrypted: i=1; AFNElJ9krWnUm9ktbTGiMFfe4+xPE356Oh1lTciOuB3Gu2lzFWR5Zv13lZXmrDeV/xV7vyfuhmbRN7a+PQc0@vger.kernel.org
X-Gm-Message-State: AOJu0YyUTE7+KvGfsYQelhhsT45x42KdefIZJqLDITGGqwLGrbYwkLEr
	F4kz3YGf71KBICwN6JZDQZhiwGUtL+OqsXeImFSxEfIbv40Tb8/Gy3lkKzVJrlvt
X-Gm-Gg: Acq92OEZBslzKz7k2RSalguVOUcYUW8dqUfFESSUi3DSNLcZU/5RpRJU5zCMwBJ+whq
	sp0Gb6x541gBNa7wM7cLl2eXbqaxPwycj6MKQcQ1MNuC+pzgDj4PfZpR6h4Hepq0ALkY00W9oqe
	Wa2hAl3TPRsTV/iWZu61+3eIGe1W/7u0ZszP3/vGIpm015ljsiKMuQNkoHasStOMhrViTnanprp
	VpBfF2Ct+KjUczPJB7HhXpXuU0m2kDUDdTTBjML4HfTaYXV6qvMbHDMdD+9IZ56WvKRusad8W5c
	SckT29KSg2xyY8raqtjI2DvccxH5mz0Yh2Tb9vlipdPmtrtm4Msa4wRanqaj99djfyiwGM16dYO
	uEjTkmy3DNEyC2d0KZk5FwaCkwPeh3VVt6suBT4GU2Ppe8ibVOF3FrIkj3MA7dCGjOJ3YWWy/Gy
	xRAm1k60Dyj//Qlj6V9suPcpQIkJMuGSdwQOonpyMfNgHNnWYOgY1wzxAz5FtMYiV9XXrHCLU2A
	zOFDGjUTPy5psfv66pfONLrZYkLUuKodGeXtCIvf1uDlFel+SIxnNruyNUilTHYRdwWqSCwsa2R
	LW0Kti3YA9mjycopFG8EzD11ZF43sMzQ0ReY04PjKQqau2eN/RiYHIIm4Q==
X-Received: by 2002:a05:690c:6c0b:b0:7b6:7df9:33f6 with SMTP id 00721157ae682-7f795beb3b1mr54016867b3.2.1781337697056;
        Sat, 13 Jun 2026 01:01:37 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7f770d02608sm19878997b3.28.2026.06.13.01.01.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 01:01:36 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7e053987001so30431217b3.0
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 01:01:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9YXfyk5enk9B1cCBobLx9j2jYEcfVVmzXB6Gdoz0msKJnfVVgihRcY/nRP7qc2Y2wiOK4u/9reZ/8R@vger.kernel.org
X-Received: by 2002:a05:690c:45c2:b0:7db:da70:9f90 with SMTP id
 00721157ae682-7f7ce2fe2b2mr45671797b3.20.1781337695438; Sat, 13 Jun 2026
 01:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612124557.13750-1-email@sirat.me> <20260612124557.13750-4-email@sirat.me>
 <20260612154922.00003723@gmail.com>
In-Reply-To: <20260612154922.00003723@gmail.com>
From: Sirat <email@sirat.me>
Date: Sat, 13 Jun 2026 14:01:23 +0600
X-Gmail-Original-Message-ID: <CANn+LWKcujSMsFVP+zqJMkR_ezed1ULGkDLMa7ykdXG5yeny_g@mail.gmail.com>
X-Gm-Features: AVVi8CcHppHXWZsm-PVxaAYXoYZCxH0AIaI2SrRwJ9pW1lpPyBQhEz0SD3zp3SE
Message-ID: <CANn+LWKcujSMsFVP+zqJMkR_ezed1ULGkDLMa7ykdXG5yeny_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] iio: magnetometer: add driver for QST QMC5883L Sensor
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 7:49=E2=80=AFPM Joshua Crofts <joshua.crofts1@gmail=
.com> wrote:
>
> On Fri, 12 Jun 2026 18:45:27 +0600
> Siratul Islam <email@sirat.me> wrote:
>
> > Add driver for the QST QMC5883L 3-Axis Magnetic Sensor
> > connected via i2c.
> >
> > Signed-off-by: Siratul Islam <email@sirat.me>
> > ---
>
> Hi Siratul,
>
> various comments inline. I've probably missed a few things
> as I only took a quick look so feel free to call me out on that!
>
> Josh
>
Thanks for the review Josh!
> > --- /dev/null
> > +++ b/drivers/iio/magnetometer/qmc5883l.c
> > @@ -0,0 +1,512 @@
...
> > +
> > +/* POR completion time max per datasheet */
> > +#define QMC5883L_PORT_US     350
>
> If it's POR completion, why does the macro contain PORT instead?
> > +
PORT is the terminology used in the datasheet for this. (Power =E2=80=93On
=E2=80=93Reset time period (PORT)). So I went with it.
> > +
> > +static const int qmc5883l_rng_avail[] =3D {
> > +     0, QMC5883L_SCALE_2G,   /* 2G */
>
> These comments are redundant IMO, you're already mentioning
> the value in the macro name.
>
I actually made them macros when I noticed that I needed to use them
in multiple places. The comments are now redundant you are right.
Thanks for noticing.
> > +     0, QMC5883L_SCALE_8G,   /* 8G */
> > +static int qmc5883l_read_raw(struct iio_dev *indio_dev,
> > +                          const struct iio_chan_spec *chan, int *val,
>
> I'd put val on the same line as val2 and mask, more logical separation.
>
These are done by clang-format. But yes this change makes more sense. Thank=
s!
> > +
---
>
> > +     int ret;
> > +
> > +     indio_dev =3D devm_iio_device_alloc(dev, sizeof(*data));
> > +     if (!indio_dev)
> > +             return -ENOMEM;
> > +
> > +     regmap =3D devm_regmap_init_i2c(client, &qmc5883l_regmap_config);
> > +     if (IS_ERR(regmap)) {
>
> No point in adding brackets if this is a single line if statement
> (checkpatch.pl should warn about this IMO).
>
It didn't warn me for this one for some reason. I'll fix it.
> > +             return dev_err_probe(dev, PTR_ERR(regmap),
> > +                                  "regmap initialization failed\n");
> --
> Kind regards
>
> CJD
>
