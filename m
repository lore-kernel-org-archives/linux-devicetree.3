Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461EC23ED6A
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 02:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779591363; cv=pass; b=UUJdb0he8weTJc72OW5OsRx20+1RSrxVInvM2PtYLQ98YLv8WEnOWtrnIaQ/XQp4nLwA+16rqL2CgrxGSD4kon7iaGN6kJWUXmRA2OaTy1jVcV+oyEslTilFp/QuYxnLgGdP9S4paQpngbdxi1+MlN7zuP07dCYk0CcpXeoUar4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779591363; c=relaxed/simple;
	bh=GGQ247UeDeQbFJuWdyJGXSh7JAbSPQWiKQJvb5FePoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pzNpRNWqghjX788eSNYP7MJYxBHRyQtVDzw4a669741Kr9MuSER1xM3mJxImhRPQ+EX92YAl+F13zsSYGyJNHpYbQWATX30b477yYZVQEojQ4i7Wuo+xFW8mfxGb4V4wj09xOc5EVDKhle4+c07hJbTyOdnUvpbVYW92pkPLh7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmpPJ0rS; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmpPJ0rS"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a8891f0c51so8808034e87.1
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 19:56:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779591359; cv=none;
        d=google.com; s=arc-20240605;
        b=aMPFXYLKg1GdqEKUpss4MHIqmbnnCWak0ZV3brH/62wVnyge9BukU5mVdCqHhpqxBY
         myUopayJUcKrVkmaAFtQpssCvdEqgYKBz8syccY1Yb9gRTJkDeShQOIohRcd3cgUMZIb
         s5cEH9ohsBE7imIuQ2psP461K6mPPshL3OY+gTbZcx6nJLi77YR5KRpQZdpDTdHt670F
         BK2is0UGxGsBUVIX+UpY0KGCAWcBVEF69mxbOzmIeTkkTXHqalq/naqUbLLq2RGxzKTv
         wv2zj0S8fzhF9LyMDXa4Rdus+dc5bJAASNjC/LH9hcrQW4fsWtM72olNN0ZRATCb6lqe
         dbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YvQBA1KgfeoEv/AC1zUlAOpplXi4c1lOtwwbNp8fSds=;
        fh=cTX/Pw8reo32hWK0ml+kSl6i+fRsmlQs6+B3q1jwxVE=;
        b=QYWFVZEcmVR3nAwI5XeQVb33KiCFbfmb0s333+8zT15CLAmzJlbXpofPilH4Vl58Ld
         QhYfi0k8K77cmdfd9eXevgUHDUMSROPO9/Sh/XtgaXJ4cu9SvXE6MR/AZRGYq1zl00Bj
         cLmAb2bTO8eXviKxgFxaaAvtoGCRiFgxEfzPR2Zl86gKGsubZFbH+VTwBG47QHeKCSBt
         jLSakUI2clFyvvhDLtZRcrM+YiT4O86EW9lGehoUkm+eWHAMRPO2DyqkQLuBN1CZ8dkx
         i5h+Hp7h8GtJ/3HtwZ2sgn+TLv7JF96a+KSuVTGEG9mrOK3uF4uH/Aq1a4xyV/etG/4A
         wJAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779591359; x=1780196159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvQBA1KgfeoEv/AC1zUlAOpplXi4c1lOtwwbNp8fSds=;
        b=HmpPJ0rSUTEQJ5jIbiN87c7MZ3E7EUi/W6pW17zlxJk2Uii/H8tuBD/IwUs8X1SjxW
         oNFlFSk94tdvw3LQ/cCdoY/Yxm5ofkKnB89SJnlX3saaBubw5XtURPKzFQ5uHRbinSgu
         nmRRazVmn5AMM7uJYGKtqfgz0F7GlK03l+QBkE1SwNuUwg8Oz02/lopMO/qVgNnCmTIF
         7/xO8FQdFf2jJK/q2yXhO5lAdf2jT5j/DzPHXzeRA8NuUsN1ug4Ua1RBHzuKS/LOn8zn
         xoFickkeEz2epF8F0AC55xp8a1++DSelZiX5coUUPWZGbHFfHsYfeHIQRF9Y0VdMLD/V
         ospg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779591359; x=1780196159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YvQBA1KgfeoEv/AC1zUlAOpplXi4c1lOtwwbNp8fSds=;
        b=m7gXyreW94+cgxfJYZJ9YWfb4uG5jFjFPmghAtSh3c5jyLMsnvlsk0BlI62Lhd7ago
         3LKVUAxdWXsxJJdh9/4x2IHMmbCm1ZsBkQlrY8m6SycWL/dvWNGLfBER6Ij05bV8ryS9
         tkbXd9nmX+ZVVyyH2Q9e1+00TO4atxuv47jjm9LZIbLn6siKxPFQBoCxtYtk2GlNcYm+
         wg5JmqAFn67IuKIl6m+iU36sbD5lGKawuucEZusBVZx8htVU9SYfYYj22NURfOjzRmsK
         lV3n2Q0zJFdOtdNqEYD5Q79qtmy47AVX+lwwBDE1LeFByWvDFDPNW/CnS9S5wvC7VSrl
         3KQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NlAub/FE6LrkERkoNvzVIyalRj/atAeW8r79z3dUrS/gc4AgR32Zw4tCkmMOVTwYvQ8ByWV2fI9Qm@vger.kernel.org
X-Gm-Message-State: AOJu0YwTQxpiqRIu/g9L/p2NCFbSzSwGvBmRzlmgSZtWOIVxpwsD9pjV
	MSNlBfsRvhE1dO8RxR86t63v/hUGA4YO5CDpI1wrYUDwQQA9o25ypqK1glP93p4Y7VA9Nuha7YK
	A7SxQbbBANHJnyl6QcC0FOiP3K1WuFc8=
X-Gm-Gg: Acq92OFATRsBuZju6TOqyI7lt5LI9p0AzFBXIQ0lgJCa5eb2carPqfOyRK7hxje1T1U
	Rr7Sc1ZWARJ69cR58aO3bhO3qE1YUgmjDOxwT9rr9kmYX49IoxXsthNsxozj0gEvVlhWxO0kssP
	bPDb4Tn/mux1X61eIZ4+4lCczt93Vd2l4D2tuCU8I+6Gpv457t0TmneMuTOSQTq3JBbFRaIJM15
	ays4UPts7FTHwqz2dPCztqec/llatv8it4fWyhNBa4RDf3iub0rokbUSEyt/d1tqZBKXmhCraen
	pnsdwBmi8rEl7oKRm9an44Sr8vN9yub5PHpECWpZ
X-Received: by 2002:ac2:5230:0:b0:5aa:b6a:738f with SMTP id
 2adb3069b0e04-5aa323bbb3dmr1997230e87.45.1779591359254; Sat, 23 May 2026
 19:55:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518220228.63322-1-piyushpatle228@gmail.com>
 <20260518220228.63322-12-piyushpatle228@gmail.com> <20260520113153.3e663a7c@jic23-huawei>
In-Reply-To: <20260520113153.3e663a7c@jic23-huawei>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Sun, 24 May 2026 08:25:21 +0530
X-Gm-Features: AVHnY4LO-E5tiBxAo-5X6MJtvI0nqCHRGgb9XR1QpdZlYSEqcPk6vWv7Ji0SpIw
Message-ID: <CAMB+xkYpfF5aGKUdDACVUXwK7P1xbMf2B_6eStJSRRLjoy6RCA@mail.gmail.com>
Subject: Re: [PATCH v9 11/11] iio: adc: hx711: add support for HX710B
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>, 
	Andy Shevchenko <andy@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 4:01=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Tue, 19 May 2026 03:32:27 +0530
> Piyush Patle <piyushpatle228@gmail.com> wrote:
>
> > Add support for the AVIA HX710B ADC, which shares the HX711 GPIO
> > interface but uses trailing PD_SCK pulses to select the active mode.
> >
> > Model the HX710B with variant-specific channel tables and IIO info,
> > track the active channel across conversions, and use the fixed gain
> > value when computing scale.
> >
> > Also update the adjacent Kconfig text, file header, and module
> > description so the driver text matches the newly supported variant.
> >
> > Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>
> The vast majority of sashiko feedback on this version is incorrect
> or already something we've ruled out as needing handling.
>
> However, very last point looks valid to me so I've highlighted that.
>
> Otherwise, the main thing is it is better to keep the structure
> for the buffer now we don't have variable numbers of channels between
> the two devices.  That is the preferred route except when it becomes
> misleading (which it did with 2 vs 3 channels).
>
Yeah! Since both variants are now fixed at 2 physical channels, IIO_DECLARE=
_
BUFFER_WITH_TS() adds nothing over the explicit struct.  Will revert:

      struct {
          u32 channel[2];
          aligned_s64 timestamp;
      } buffer;

The hx711_trigger() memset and iio_push_to_buffers_with_timestamp()
call sites will be updated accordingly.
>
> > diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> > index 183568196d52..d5c977b4669b 100644
> > --- a/drivers/iio/adc/hx711.c
> > +++ b/drivers/iio/adc/hx711.c
>
> >
> >  struct hx711_data {
> > @@ -99,16 +105,12 @@ struct hx711_data {
> >       int                     gain_set;       /* gain set on device */
> >       int                     gain_chan_a;    /* gain for channel A */
> >       int                     gain_scale[HX711_GAIN_MAX];
> > +     int                     channel_set;    /* HX710B active channel =
*/
> > +     unsigned int            samp_freq;      /* HX710B differential ch=
annel sample rate */
> >       const struct hx711_chip_info    *chip_info;
> >       struct mutex            lock;
> > -     /*
> > -      * triggered buffer
> > -      * 2x32-bit channel + 64-bit naturally aligned timestamp
> > -      */
> > -     struct {
> > -             u32 channel[2];
> > -             aligned_s64 timestamp;
> > -     } buffer;
> > +     /* 2x32-bit channels + 64-bit naturally aligned timestamp */
> > +     IIO_DECLARE_BUFFER_WITH_TS(u32, buffer, 2);
>
> Now we are back to fixed 2 channels, don't need this change. The structur=
e
> is easier to interpret so please go back to that.
>
> >       /*
> >        * delay after a rising edge on SCK until the data is ready DOUT
> >        * this is dependent on the hx711 where the datasheet tells a
>
>
> > @@ -463,6 +527,50 @@ static const struct iio_info hx711_iio_info =3D {
> >       .attrs                  =3D &hx711_attribute_group,
> >  };
> >
> > +static const int hx710b_samp_freq_avail[] =3D { 10, 40 };
> > +
> > +static int hx710b_read_avail(struct iio_dev *indio_dev,
> > +                          struct iio_chan_spec const *chan,
> > +                          const int **vals, int *type, int *length,
> > +                          long mask)
> > +{
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_SAMP_FREQ:
> > +             *vals =3D hx710b_samp_freq_avail;
> > +             *type =3D IIO_VAL_INT;
> > +             *length =3D ARRAY_SIZE(hx710b_samp_freq_avail);
> > +             return IIO_AVAIL_LIST;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +
> > +static int hx710b_write_raw(struct iio_dev *indio_dev,
> > +                         struct iio_chan_spec const *chan,
> > +                         int val, int val2, long mask)
> > +{
> > +     struct hx711_data *hx711_data =3D iio_priv(indio_dev);
> > +
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_SAMP_FREQ:
> > +             if (val !=3D 10 && val !=3D 40)
> > +                     return -EINVAL;
> > +             mutex_lock(&hx711_data->lock);
> > +             hx711_data->samp_freq =3D val;
> > +             hx711_data->channel_set =3D 0;
> > +             mutex_unlock(&hx711_data->lock);
> From Sahiko:
>
>   Does this implementation need to use iio_device_claim_direct_mode() to
>   prevent concurrent hardware changes while a buffered capture is active?
>   If userspace modifies the sampling frequency during an active IIO trigg=
ered
>   buffer capture, it resets channel_set to 0. This could alter the hardwa=
re
>   configuration (changing the trailing pulses) out from under the IIO cap=
ture
>   thread, which violates IIO concurrency semantics.
>
> Two possible fixes:
> - The one sashiko suggests around claiming direct mode.
> - Maybe not set channel_set =3D 0?  Then it becomes a simple race for
>   whether the value of samp_freq is updated or not.  Either is harmless.
>
> I'd be tempted to go with direct mode claiming but also consider if you c=
an
> drop that channel_set =3D 0 - or add a comment on why it's there perhaps.
>

Agreed the last of Sashiko's points is valid.  In v10, I will update
these 2 thing:
 - Guard the samp_freq update with iio_device_claim_direct_mode() /
    iio_device_release_direct_mode().  This causes write_raw to return
    -EBUSY when a triggered buffer capture is active, which is
    standard IIO semantics for writes that change hardware channel
    configuration

 - Drop the "channel_set =3D 0" reset.  It is not needed for
   correctness: hx711_set_hx710b_channel() always compares
   extra pulses only when they differ, so the chip will be
   re-configured automatically on the next hx711_reset_read() call.
   dropping it also eliminates the race entirely.

The resulting write_raw case will be:

      case IIO_CHAN_INFO_SAMP_FREQ:
          if (val !=3D 10 && val !=3D 40)
              return -EINVAL;
          ret =3D iio_device_claim_direct_mode(indio_dev);
          if (ret)
              return ret;
          mutex_lock(&hx711_data->lock);
          hx711_data->samp_freq =3D val;
          mutex_unlock(&hx711_data->lock);
          iio_device_release_direct_mode(indio_dev);
          return 0;
>
> > +             return 0;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +
> > +static const struct iio_info hx710b_iio_info =3D {
> > +     .read_raw               =3D hx711_read_raw,
> > +     .write_raw              =3D hx710b_write_raw,
> > +     .read_avail             =3D hx710b_read_avail,
> > +};
>
> >  static const struct hx711_chip_info hx711_chip =3D {
> >       .name           =3D "hx711",
> >       .channels       =3D hx711_chan_spec,
> > @@ -502,6 +655,15 @@ static const struct hx711_chip_info hx711_chip =3D=
 {
> >       .num_channels   =3D ARRAY_SIZE(hx711_chan_spec),
> >  };
>
> > @@ -608,6 +781,7 @@ static int hx711_probe(struct platform_device *pdev=
)
> >  }
> >
> >  static const struct of_device_id of_hx711_match[] =3D {
> > +     { .compatible =3D "avia,hx710b", .data =3D &hx710b_chip },
> >       { .compatible =3D "avia,hx711", .data =3D &hx711_chip },
> >       { }
> >  };
> > @@ -625,7 +799,7 @@ static struct platform_driver hx711_driver =3D {
> >  module_platform_driver(hx711_driver);
> >
> >  MODULE_AUTHOR("Andreas Klinger <ak@it-klinger.de>");
> > -MODULE_DESCRIPTION("HX711 bitbanging driver - ADC for weight cells");
> > +MODULE_DESCRIPTION("HX711 and compatible bitbanging ADC driver");
>
> Trivial but switch that to 'and similar' as they aren't quite compatible.
> Sometimes vagueness is helpful :)
>
> Anyhow, looking in pretty good shape so hopefully v10 is the lucky versio=
n.
>
> If you have time, it would be nice to get rid of the custom available att=
ributes
> for the hx711 as well - similar approach to you have done for the new par=
t.
>
>
> Jonathan
>
>
> >  MODULE_LICENSE("GPL");
> >  MODULE_ALIAS("platform:hx711-gpio");
> >
>
