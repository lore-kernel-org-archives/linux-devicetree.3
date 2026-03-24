Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D79370D61
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774315061; cv=pass; b=GyZdjSgNgZxB6WEoZPEEf1JhJpOXQgcjjC9gJ3VI3fv6KldPAjGUCeyMaRfXrD3FwHFWS+Lhjbkvz9YKAc9M2wc+LXxNVX9QHWzlDEoQShQl952ywqRHx/YSN6FikQkbDQJSTII++1P8DbzqxnUWkyofzx4k76JMDKX/992ewWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774315061; c=relaxed/simple;
	bh=yUarjDtE8h8ld2j1hmNWV8MDOV2RHGIDuyQLOSFGSkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCgjxaKAf6ffCQkQEDnWPZ3zD1AzBS1NRhh2oWg7kL6PUjcwg/oEiF8Sg3MKZuuOGw4DUR7DxsLwsxb3aPgO/y12LYaKAjPyatgvbqOWEVP2UYNQcG6vlMpmnZ4BwHEnQwTkdXXNIGfK6gI88HWgOJ3gfYLWX2mrQSITkKCTRIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mymt8T0X; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mymt8T0X"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38bd60d7a2cso27584761fa.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774315057; cv=none;
        d=google.com; s=arc-20240605;
        b=jWnK0EDpgxA9MCHkLFlu8YkeuR4WsYDDUVj07v/V1fLqNG9fXPz9yTuTqVXls4y06A
         PY1I3rdv/6m/bFdgklygYdU9jIHIQAZ9hgoOKu1CGU+pBLGiTrkXbUWS0b3ankerhTTA
         0+bMImpX5+fbtPL8ITWIzsfse1NNBIgi8CwLL260Lg8G+afWlNr2qoMc0pTYfpAvpU9f
         o3otVOeizthvzWO1s67FrLKoCSgxwZu5aRk56K38Sn/+fLUbrYtI/eTf3fRtofPKM+Uu
         tixwqW794g6TnStbMDs5g4Feb+0+6KXWyBixteuxFr+uArzGNPUzzrvFMxvhpAFlQ0KH
         CZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SaHoUu7hmviPxtsyOWV6wLf4CboCmSJsoOW1WMqkg4U=;
        fh=gD5HqsANowWLbgNWc+/KxSiFSS/UBe4oEhU5WyvDqc4=;
        b=M3RqcdwLXSP7rVRDkd7dk8J4OLMqop9BczPl8eKZ8+mvTYCf3XRBNttst28hyJdSsf
         7nf6uIlSzya1WKTb1PXDrvHdcTikBxiN4jlybYFM+FK6V9p9fbbu93EdBlhO82zg23ta
         PTQRctIEEg4RJFAbI657I2hY0tY5tWwZWasKRw7CVT+6Q0IRnl8mh38LDxFwddnyM2ib
         QxTSHgb5SedHoCaePS4967w7cqrBCF+yhcw3qqM3Qd55LlCFVw+AcDRJZV9/TgkLNx7z
         gPkrEv4pmzQFk+XcPqfvi4g1j6BVO+0jjZvGNevFeJJSGNbdiYJCBq2m2Ai8HLih1s4+
         zUsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774315057; x=1774919857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaHoUu7hmviPxtsyOWV6wLf4CboCmSJsoOW1WMqkg4U=;
        b=mymt8T0X3YzDhhvoEtq/l+J85TsR4G2mE5cnnHdPHebRoVg5dFdbS9U/fOsjSScprA
         aqdi1AhbAvMPD+fZgYP+jlSrmVr0QircgCNemmapwZ7+1QN8hzyVQ8OwdK0PyZBKEK1b
         SoY4P8tFB3vASij6sQKVJ1gZpdug6ggDmYrJQSztSwgrdDUrx3JMeZqts3pWmebhowLX
         bW1MlDHdwVf6L8z5GJKEH5JSKnM1ocZQ0qRR7WisTwK+Q5vaT/Gzc5XPrFp06VONRU4M
         pt6GElWT+tG3ZtOh3So1s1WtvRNbd6//Jkjye1PoyUqdvGhSCMt1YR5GTxsYjKHIy9Yl
         3q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774315057; x=1774919857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SaHoUu7hmviPxtsyOWV6wLf4CboCmSJsoOW1WMqkg4U=;
        b=M3Rka2EqqdNUHNFLtOqeYwclDhqTF//E5KX/UZhMlUSVivBCIhOnus8M00YX9ntRhw
         DtLRVTPSuLL5DjrIM5caFeO3PXwK2hM1cFu1ASFFcxz9pSRB5YzVVX6lCL7R7QQIlPSO
         XjRyKz0EZoQzL3Ce7AvvA5aKi9fjybbX9RT5fZ9xkOubkLAPTI/BbX2yQYDlRLfBv3xk
         KX8MqqzpO7AYKuEEZO9rQS3qqFxpvdBK5yqqtwrpHcMRzrwwHoNCEZy2tuZXNej5tMmb
         6koqqCF72+nJ2thMQG8Tg9qV1mc3e8RSg/U+1+HeS5TwhT+ox3kw3sTDUJPki0HEVrUJ
         LRSg==
X-Forwarded-Encrypted: i=1; AJvYcCU+xdSJlJIcJo4TYzOJijVOZrOk+MRMjysElNu/RV6+VIVAyzLTX023slDMhznMJK5QeskkXUK7N/fm@vger.kernel.org
X-Gm-Message-State: AOJu0YzeJYFxAb4txbFOk3jeXBeA+6cfAxletfhDVTnIcx3gYUkavQSo
	012fDIsal32CTRmtufkc3oR9OB99epfs5BRcAui7s9hrJAeX/xhxHSr9KvLrKsCs3mV/1z0Wu5N
	msA3H5HiSgpPTRnwV3QIHMFqJ7tWCzYAvZdErfN9zTQ==
X-Gm-Gg: ATEYQzyNJmZ//+bhW15hAdoX1JcoHqqXLbM05mye0806fEmQWqSG7HJcz/XQwwtZ0d3
	lgzMizBOzXLzxAnfxkDewQSqneYvu0dExFrv0LX/pMYF1OCu79UUJznKvQKvpoXtBpeSyJs8CEQ
	Yd+9qiG8dkETizbMNqg5hRrnB6YRIhZ6YtFMycRvQYD4WDN5TKc6E2S1C7x48V4ptC7UOzugCdP
	yW31/38f2hMxGZM5t9yS4QaXEmSiGiwdB1HMcyjrVRTLX7SxgeoO3qpTXcZEqzG8P6GM+oWnNwY
	+r9BuJSuL6lLRbo90Y6Oh4tGw6hu7rTYR18l12lDmUIJaE6LLGdZxzx66hksAXEWCL0=
X-Received: by 2002:a05:651c:25db:20b0:38a:5284:93a2 with SMTP id
 38308e7fff4ca-38bf974225dmr36790341fa.30.1774315057398; Mon, 23 Mar 2026
 18:17:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217081203.1792025-1-sbogdanov@baylibre.com>
 <20260217081203.1792025-4-sbogdanov@baylibre.com> <0b2f3bdd-e79c-4892-8523-2cab87596d97@roeck-us.net>
In-Reply-To: <0b2f3bdd-e79c-4892-8523-2cab87596d97@roeck-us.net>
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
Date: Tue, 24 Mar 2026 03:17:25 +0200
X-Gm-Features: AaiRm53ro3KK5iVfNz5NFx7bdt0ONr7ZbmF1gaSfA-uNIH94RoAI1QAzj3zhSWg
Message-ID: <CAJ83Ew4VpBGCq5UyivTrniSQEO0HWikqMvc6hd6gO-MP1-N1Bw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hwmon: (pmbus/tps1689): Add TPS1689 support
To: Guenter Roeck <linux@roeck-us.net>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 7:34=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On Tue, Feb 17, 2026 at 10:12:03AM +0200, Stoyan Bogdanov wrote:
> > Extend tps25990 existing driver to support tps1689 eFuse,
> > since they are sharing command interface and functionality
> > Update documentation for tps1689
> >
> > Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
> > ---
> >  Documentation/hwmon/tps25990.rst | 15 ++++--
> >  drivers/hwmon/pmbus/tps25990.c   | 91 ++++++++++++++++++++++++++++----
> >  2 files changed, 92 insertions(+), 14 deletions(-)
> >
> > diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps=
25990.rst
> > index 04faec780d26..e8bc9a550bda 100644
> > --- a/Documentation/hwmon/tps25990.rst
> > +++ b/Documentation/hwmon/tps25990.rst
> > @@ -9,26 +9,31 @@ Supported chips:
> >
> >      Prefix: 'tps25990'
> >
> > -  * Datasheet
> > +    Datasheet: Publicly available at Texas Instruments website: https:=
//www.ti.com/lit/gpn/tps25990
> >
> > -    Publicly available at Texas Instruments website: https://www.ti.co=
m/lit/gpn/tps25990
> > +  * TI TPS1689
> > +
> > +    Prefix: 'tps1689'
> > +
> > +    Datasheet: Publicly available at Texas Instruments website: https:=
//www.ti.com/lit/gpn/tps1689
> >
> >  Author:
> >
> >       Jerome Brunet <jbrunet@baylibre.com>
> > +     Stoyan Bogdanov <sbogdanov@baylibre.com>
> >
> >  Description
> >  -----------
> >
> > -This driver implements support for TI TPS25990 eFuse.
> > +This driver implements support for TI TPS25990 and TI TPS1689 eFuse ch=
ips.
> >  This is an integrated, high-current circuit protection and power
> >  management device with PMBUS interface
> >
> > -Device compliant with:
> > +Devices are compliant with:
> >
> >  - PMBus rev 1.3 interface.
> >
> > -Device supports direct format for reading input voltages,
> > +Devices supports direct format for reading input voltages,
> >  output voltage, input current, input power and temperature.
> >
> >  Due to the specificities of the chip, all history reset attributes
> > diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25=
990.c
> > index 33f6367f797c..f9ff4edadf53 100644
> > --- a/drivers/hwmon/pmbus/tps25990.c
> > +++ b/drivers/hwmon/pmbus/tps25990.c
> > @@ -58,34 +58,38 @@ struct tps25990_data {
> >       struct local_direct_value *info_local;
> >  };
> >
> > -static int tps25990_raw_to_value(struct i2c_client *client, int param,=
 int raw)
> > +static int tps25990_raw_to_value(struct i2c_client *client, int param,=
 u32 raw)
> >  {
> >       struct tps25990_data *data =3D (struct tps25990_data *)of_device_=
get_match_data(&client->dev);
> >       struct local_direct_value *info_local =3D data->info_local;
> > +     int val;
> >
> >       /* Formula : X =3D (Y / 10^R - b) / m */
> >       if (info_local->R[param] >=3D 0)
> > -             raw /=3D int_pow(10, info_local->R[param]);
> > +             val =3D DIV_ROUND_CLOSEST_ULL(raw, int_pow(10, info_local=
->R[param]));
> >       else
> > -             raw *=3D int_pow(10, -info_local->R[param]);
> > +             val =3D raw * int_pow(10, -info_local->R[param]);
>
> Can the calculation in the 'else' branch overflow?
>
> If info_local->R[param] is -6 (as it is for TPS25990_IIN_OCF), then
> int_pow(10, 6) is 1,000,000. If raw is a 16-bit word like 65535, the prod=
uct
> is 65,535,000,000.
>
> Since val is an int, it will overflow on 32-bit systems (and even on 64-b=
it
> systems if int is 32-bit, which is the case in the kernel).
>
> Should val be a 64-bit type for the intermediate calculation?
>
> >
> > -     return DIV_ROUND_CLOSEST(raw - info_local->b[param], info_local->=
m[param]);
> > +     val =3D DIV_ROUND_CLOSEST(val - info_local->b[param], info_local-=
>m[param]);
> > +
> > +     return val;
> >  }
> >
> >  static unsigned int tps25990_value_to_raw(struct i2c_client *client, i=
nt param, int val)
> >  {
> >       struct tps25990_data *data =3D (struct tps25990_data *)of_device_=
get_match_data(&client->dev);
> >       struct local_direct_value *info_local =3D data->info_local;
> > +     u32 raw; // return raw up to u16 -> u32
> >
> >       /* Formula : Y =3D ( m * X + b) * 10^R */
> > -     val =3D (long)val * info_local->m[param] + info_local->b[param];
> > +     raw =3D ((long)val * info_local->m[param]) + info_local->b[param]=
;
> >
> >       if (info_local->R[param] >=3D 0)
> > -             val *=3D int_pow(10, info_local->R[param]);
> > +             raw *=3D int_pow(10, info_local->R[param]);
> >       else
> > -             val =3D DIV_ROUND_CLOSEST(val, int_pow(10, -info_local->R=
[param]));
> > +             raw =3D DIV_ROUND_CLOSEST_ULL(raw, int_pow(10, -info_loca=
l->R[param]));
> >
> > -     return val;
> > +     return raw;
>
> Does this change handle negative results correctly?
>
> If (val * m + b) is negative, assigning it to the u32 raw variable will
> result in a very large positive number due to underflow. Subsequent
> scaling and clamping in the caller will then produce an incorrect result
> (e.g., 0xf instead of 0).
>
> The previous implementation used a signed type for the intermediate resul=
t.
> Is there a reason to switch to u32 before the final result is determined?

This was supposed to be in to previous implementation because, CI
catch errors and this was theoretically the fix. This patch should
have only tps1689 related changes and those are not.
I will move them on next revision to if still needed after rework or
conversion functions to
hwmon: (pmbus/tps25990): Rework TPS25990 non standatd direct conversion



> >  }
> >
> >  /*
> > @@ -281,7 +285,6 @@ static int tps25990_write_word_data(struct i2c_clie=
nt *client,
> >               value =3D clamp_val(value, 0, 0xff);
> >               ret =3D pmbus_write_word_data(client, page, reg, value);
> >               break;
> > -
> >       case PMBUS_VIN_OV_FAULT_LIMIT:
> >               value =3D tps25990_value_to_raw(client, TPS25990_VIN_OVF,=
 value);
> >               value =3D clamp_val(value, 0, 0xf);
> > @@ -370,6 +373,15 @@ static const struct regulator_desc tps25990_reg_de=
sc[] =3D {
> >  };
> >  #endif
> >
> > +struct local_direct_value tps1689_local_info =3D {
> > +     .m[TPS25990_VIN_OVF] =3D 3984,
> > +     .b[TPS25990_VIN_OVF] =3D -63750,
> > +     .R[TPS25990_VIN_OVF] =3D -3,
> > +     .m[TPS25990_IIN_OCF] =3D 7111,
> > +     .b[TPS25990_IIN_OCF] =3D -2133,
> > +     .R[TPS25990_IIN_OCF] =3D -2,
> > +};
> > +
> >  struct local_direct_value tps25590_local_info =3D {
> >       .m[TPS25990_VIN_OVF] =3D 10163,
> >       .b[TPS25990_VIN_OVF] =3D -30081,
> > @@ -379,6 +391,60 @@ struct local_direct_value tps25590_local_info =3D =
{
> >       .R[TPS25990_IIN_OCF] =3D -6,
> >  };
> >
> > +static struct pmbus_driver_info tps1689_base_info =3D {
> > +     .pages =3D 1,
> > +     .format[PSC_VOLTAGE_IN] =3D direct,
> > +     .m[PSC_VOLTAGE_IN] =3D 1166,
> > +     .b[PSC_VOLTAGE_IN] =3D 0,
> > +     .R[PSC_VOLTAGE_IN] =3D -2,
> > +     .format[PSC_VOLTAGE_OUT] =3D direct,
> > +     .m[PSC_VOLTAGE_OUT] =3D 1166,
> > +     .b[PSC_VOLTAGE_OUT] =3D 0,
> > +     .R[PSC_VOLTAGE_OUT] =3D -2,
> > +     .format[PSC_TEMPERATURE] =3D direct,
> > +     .m[PSC_TEMPERATURE] =3D 140,
> > +     .b[PSC_TEMPERATURE] =3D 32103,
> > +     .R[PSC_TEMPERATURE] =3D -2,
> > +     /*
> > +      * Current and Power measurement depends on the ohm value
> > +      * of Rimon. m is multiplied by 1000 below to have an integer
> > +      * and -3 is added to R to compensate.
> > +      */
> > +     .format[PSC_CURRENT_IN] =3D direct,
> > +     .m[PSC_CURRENT_IN] =3D 9548,
> > +     .b[PSC_CURRENT_IN] =3D 0,
> > +     .R[PSC_CURRENT_IN] =3D -6,
> > +     .format[PSC_CURRENT_OUT] =3D direct,
> > +     .m[PSC_CURRENT_OUT] =3D 24347,
> > +     .b[PSC_CURRENT_OUT] =3D 0,
> > +     .R[PSC_CURRENT_OUT] =3D -3,
> > +     .format[PSC_POWER] =3D direct,
> > +     .m[PSC_POWER] =3D 2775,
> > +     .b[PSC_POWER] =3D 0,
> > +     .R[PSC_POWER] =3D -4,
> > +     .func[0] =3D (PMBUS_HAVE_VIN |
> > +                 PMBUS_HAVE_VOUT |
> > +                 PMBUS_HAVE_VMON |
> > +                 PMBUS_HAVE_IIN |
> > +                 PMBUS_HAVE_PIN |
> > +                 PMBUS_HAVE_TEMP |
> > +                 PMBUS_HAVE_STATUS_VOUT |
> > +                 PMBUS_HAVE_STATUS_IOUT |
> > +                 PMBUS_HAVE_STATUS_INPUT |
> > +                 PMBUS_HAVE_STATUS_TEMP |
> > +                 PMBUS_HAVE_SAMPLES),
> > +
> > +     .read_word_data =3D tps25990_read_word_data,
> > +     .write_word_data =3D tps25990_write_word_data,
> > +     .read_byte_data =3D tps25990_read_byte_data,
> > +     .write_byte_data =3D tps25990_write_byte_data,
> > +
> > +#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
> > +     .reg_desc =3D tps25990_reg_desc,
> > +     .num_regulators =3D ARRAY_SIZE(tps25990_reg_desc),
> > +#endif
> > +};
> > +
> >  static struct pmbus_driver_info tps25990_base_info =3D {
> >       .pages =3D 1,
> >       .format[PSC_VOLTAGE_IN] =3D direct,
> > @@ -428,18 +494,25 @@ static struct pmbus_driver_info tps25990_base_inf=
o =3D {
> >  #endif
> >  };
> >
> > +struct tps25990_data data_tps1689 =3D {
> > +     .info =3D &tps1689_base_info,
> > +     .info_local =3D &tps1689_local_info,
> > +};
> > +
> >  struct tps25990_data data_tps25990 =3D {
> >       .info =3D &tps25990_base_info,
> >       .info_local =3D &tps25590_local_info,
> >  };
> >
> >  static const struct i2c_device_id tps25990_i2c_id[] =3D {
> > +     { .name =3D "tps1689", .driver_data =3D (kernel_ulong_t)&data_tps=
1689 },
> >       { .name =3D "tps25990", .driver_data =3D (kernel_ulong_t)&data_tp=
s25990 },
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
> >
> >  static const struct of_device_id tps25990_of_match[] =3D {
> > +     { .compatible =3D "ti,tps1689", .data =3D &data_tps1689 },
> >       { .compatible =3D "ti,tps25990", .data =3D &data_tps25990 },
> >       {}
> >  };
