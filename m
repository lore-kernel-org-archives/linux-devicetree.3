Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13E71917FB
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783851391; cv=pass; b=S48Ljb4E17QMy71lu06qtHNZnOs4NBh4yEBVTHg0oymRHHMuZVduccwi1fvI9IRkXQsTYJ68UFsecYNlapakZbqd+/M5tpkOKEygIC/RNgF1D6nBknJHxir1AwrpMvLXD++mYfiqBhOwnFKT8ZQ/Mx0XV5MPCZoAXKVFbka46Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783851391; c=relaxed/simple;
	bh=CkFv28+JxLuiDYyVGVUBnuoNV0qPyEi3cMALyJp88Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c2TeBbv3xHycYSQL6QPqHIUoR/TxTo+GhwkD59gFoACastSZ3bG7fqGn9lmS4nFFlMo4/77Ya9G/zZWkDHIjEaqz7sAUcBvvrK5x4MblG8/SLC4C5PDYSEugR1rBXeBdlvE9/ihjt/f3DrIxbMep41R+jQ7MBfKjADJKcSIB39g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDofYl5b; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDofYl5b"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84847482584so1509651b3a.0
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 03:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783851389; cv=none;
        d=google.com; s=arc-20260327;
        b=SQsYefa9t/PVg3c8g/MbFIQEzdSH4XRjv+CeV7FjJz0hhT51V8AI62JMdoI5W33xO1
         82Xp/Am1G/9O+9Jby445yrX+bs0HW+eLhCXkby1i34mqDAI5gHEu8mRWy+pWnzkpByXW
         WIr82psOdzrksJOrgtD7UVDWMDlRteX9v6IhS1Jv4itPwBHPBfbY5jAKlYSSYPQOAtXG
         lkFr0v+beOeCjhaggv2wSyxqWe8brWLuIlpWPUskxiBdzF5pnCmBGCJyDoEw1cjeyqxw
         L0ZkGSPybXcKamEmTJDWddq+joIfyZfs9HNY4HbLEpEctLCX3Pr7CfgTuPRKn9kpVmY7
         kC9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tMianh5edCr8euLIfheCzNHGjdZcQsdz0PWxBLB0Dl8=;
        fh=lfI3nAGyLB33/TP+j8yeVCrSWMifH2E81XvEuio7RZ4=;
        b=U5K7J3gXtE06BYwMVxm7A+z3K1N+8gtE8DZs/KjIx1WcLEi2Xr6vhwt1Wf1TSe0Cyv
         UlikiONX2eWrIsMDLjKlmmDUgNFSDzDD/ZrJ0HmfIhuh2Nm4s8CBf7qrVMUVMkUyRLHK
         yO/6p9tvtWOcJlVWjQNSyCcG+P1V/yfk6zVbsELrsjVsmYJDkUHagiCHo8zJHn8i4u+K
         kt5zgRiRmWvhuYXbC9569shS16LKIyW1iHHgLQ8HN6tGL3ptC/HuLhrlygnWNl8DdqQf
         hY7J1cw+oizPkn5AAEXg/u/byzBwyCkjy7PfCk4xhmbT+XeUTOJLsnVHpkUHo+rB8AAb
         WjjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783851389; x=1784456189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tMianh5edCr8euLIfheCzNHGjdZcQsdz0PWxBLB0Dl8=;
        b=lDofYl5bawhX3upFX/aNGRp8gE6wH/RQPcO07G2eJEjB8+T4hEuHTNw8/uNJHDy7I9
         y/mWkrS1YdYDBtGXUtXLe0M75+4d2Zfy+7j5vMOvADOf6NNfj9bsnway4ENd+SVVPrdv
         ToEspRIk5nwEtchA0hi2dXqxj/6G6PN1u6uM8ofRqiRqmfA6FUze1TXW1jfK6U5AeZwh
         EgojTy1uN84ikoPsllpOBgfXHMXZFHybam0wI9GyzMPAfHg7HDH+/7ElCOzMoan7lM2a
         ED4OD8Ieb9gums/SeJMuJTve6ltuKU9MgGj2in2QAjKaij50IJe5k7Qra43Qr4OndRtk
         VFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851389; x=1784456189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMianh5edCr8euLIfheCzNHGjdZcQsdz0PWxBLB0Dl8=;
        b=bmMBFUN1heuqP7NP2RgbkHlWSH9srYcsxyuyU1fEP18jVKabnfNaLirihxaecpNse7
         Xw5z75pvzVLWf1EbyyIXZqZMxemvanE6+RDF+A7uu3YPNCL+F0V3dpglycp3zGycL6qx
         jFJ4rw+bJ5jJWlSESh41Z2s3Npf1ZL7/c2LchKYC+WdaR8J7np8J4LuhZAfbyt6Wxbwj
         DyJlu8y4od+oCm/w+P3iQjfXradNGUAbWvIsITCXt31DoiWub93xyCw25eoPDiKR0t/1
         4z/i0/TiJgMrzSe6JopQli5lGi49mHNAlu9wCuP+Kmf4fVt2/Thfk7usEqAIylNBnGlt
         XRqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNFLPzoDKJ+6uY0Riphm/wB7Raus6nPCkWbkkmfQgcpjNcrzwTyaEpN5i8Xg65wloeZXtUjiImENq/@vger.kernel.org
X-Gm-Message-State: AOJu0YxKnvkv4q3I9YKMJLhGbOzP8BqLzwY5MjvjNGVSRn7IP779sJ+I
	w0td5Vp901YWktKHQMKAJNhMZR0UzhITHh25lvBFfnuVmYYbibw5erV9iLZ3bozVFAMQFzXUS5F
	Q7j8VziuK4gw5OdWvFLnsfYMe/ErSAoY=
X-Gm-Gg: AfdE7cm3/lakUR74UK4MmEoSK7CVBMPZ7FXapYRyQWcTQZcaw/pNufL8QVj8bpFduIz
	uIk6Xcq5rSGmM2rSfMjcq5bKa15rHS7WTcvluM0uR/pl0wS128bxWfa2QAFhjUuG+gHhYGIiLaD
	OwpQ0mpfg5rd/CBQXTFCa8/5JUZXonabsjQO50Y4HU2XfTQy8MP6JgfCHZ06oY+ImdzloWGZ82U
	Xmb/Etyf6NciC480jHkIPi/FiRaapl6DL9sZ0bvMPGwT+vFfH8efL1B0ofFO8/KuBjrafJPXZl9
	axFs//3rzvkwV2BCBlGAT3W1r5iw
X-Received: by 2002:a05:6a00:8b8e:b0:84a:30be:7909 with SMTP id
 d2e1a72fcca58-84a30be7d02mr595985b3a.17.1783851389183; Sun, 12 Jul 2026
 03:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711184414.1013686-1-jakubszczudlo40@gmail.com>
 <20260711184414.1013686-4-jakubszczudlo40@gmail.com> <35c47ff5-0a8b-4c99-8e5b-d86c04039e17@baylibre.com>
In-Reply-To: <35c47ff5-0a8b-4c99-8e5b-d86c04039e17@baylibre.com>
From: =?UTF-8?Q?Jakub_Szczud=C5=82o?= <jakubszczudlo40@gmail.com>
Date: Sun, 12 Jul 2026 12:16:17 +0200
X-Gm-Features: AVVi8Cez6I1jTDfxtg1MHCxEwED0k6HkZlinYACuuAAlx3AjbW48A9xsrF1chvw
Message-ID: <CA+gq5JjrNzZHFhPeSM=AEpevHgStV2T6dEGHTUpnvzAbSeO1FQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] iio: adc: Add ti-ads1110 support to ti-ads1100 driver
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, andy@kernel.org, antoniu.miclaus@analog.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, duje@dujemihanovic.xyz, 
	Jonathan Cameron <jic23@kernel.org>, jishnu.prakash@oss.qualcomm.com, 
	jorge.marques@analog.com, joshua.crofts1@gmail.com, krzk+dt@kernel.org, 
	linusw@kernel.org, marcelo.schmitt@analog.com, 
	Matti Vaittinen <mazziesaccount@gmail.com>, mike.looijmans@topic.nl, nuno.sa@analog.com, 
	robh@kernel.org, sakari.ailus@linux.intel.com, wens@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sob., 11 lip 2026, 22:01 u=C5=BCytkownik David Lechner
<dlechner@baylibre.com> napisa=C5=82:
>
> On 7/11/26 1:44 PM, Jakub Szczudlo wrote:
> > Add ADS1110 support that have faster datarate than ADS1100, it also use=
s
> > internal voltage reference of 2.048V for measurement.
> >
>
> ...
>
> > +static int ads1100_get_vref_milivolts(struct ads1100_data *data)
> > +{
> > +     int voltage_uV;
> > +
> > +     if (data->ads_config->has_internal_vref_only)
> > +             return ADS1110_INTERNAL_REF_mV;
> > +
> > +     voltage_uV =3D regulator_get_voltage(data->reg_vdd);
> > +     if (voltage_uV < 0)
> > +             return voltage_uV;
> > +
> > +     return voltage_uV / (MICRO / MILLI);
> > +}
> > +
>
> ...
>
> T;
> > @@ -276,6 +310,7 @@ static int ads1100_read_raw(struct iio_dev *indio_d=
ev,
> >                           int *val2, long mask)
> >  {
> >       int ret;
> > +     int data_rate_index;
> >       struct ads1100_data *data =3D iio_priv(indio_dev);
> >
> >       guard(mutex)(&data->lock);
> > @@ -292,12 +327,12 @@ static int ads1100_read_raw(struct iio_dev *indio=
_dev,
> >               return IIO_VAL_INT;
> >       case IIO_CHAN_INFO_SCALE:
> >               /* full-scale is the supply voltage in millivolts */
> > -             *val =3D ads1100_get_vdd_millivolts(data);
> > +             *val =3D ads1100_get_vref_milivolts(data);
>
> Obviously, the existing code was getting away without checking for
> error here. Since the ads1100_get_vref_milivolts() function handles
> the error case now, seems like we should be checking the return value
> here as well.
>
> >               *val2 =3D 15 + FIELD_GET(ADS1100_PGA_MASK, data->config);
> >               return IIO_VAL_FRACTIONAL_LOG2;
> >       case IIO_CHAN_INFO_SAMP_FREQ:
> > -             *val =3D ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK,
> > -                                                data->config)];
> > +             data_rate_index =3D FIELD_GET(ADS1100_DR_MASK, data->conf=
ig);
> > +             *val =3D data->ads_config->available_data_rate_hz[data_ra=
te_index];
> >               return IIO_VAL_INT;
> >       default:
> >               return -EINVAL;


I'm thinking about next patchset where I will address voltage
regulator stuff, adding it to struct and taking it voltage just once
in probe. Can we leave it as it is for now?

Best regards,
Jakub Szczudlo
