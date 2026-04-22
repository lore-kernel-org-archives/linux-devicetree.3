Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABEC175A92
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 05:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776835307; cv=pass; b=IzE0P6k9TPFSPunBaqY1J423EDRMvEAaPsPNhsYFHa2viScDCTr0rkDZXGqel67lD2yoyqgKPSzw0TqU3ACEXkBnRhd3oVLASm3LyIpJNu79/w3P8ETM5VzE1uxojhR7p7mPIplQBeETlbeK5Smn8+9DnQnrbqQCMPb7T/dHFpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776835307; c=relaxed/simple;
	bh=F8puFNoTJXKVhRcnXaj57JJgNoxAffhVys7ifF7gdnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMKPxdYVltdF1Ww4x0HpXk59PLMicKxSMNKS+gst4ocgHImiTHTndJQshULrVS2NsoWKGuX+Nu1qYUuaWLA3HPJb318F5I+OFtLEYhb5UFTEyR5w60QSr7Cf9nAOBVuTVc7z09/f6mefjaGV8YaVIRlbtDBSfz/DTt3CYpE81aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMzLcG7t; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMzLcG7t"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e96a071c3so51131631fa.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 22:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776835304; cv=none;
        d=google.com; s=arc-20240605;
        b=UdmSB/p5Bm6sNcs/+q9YU4gGXMrxz8xcLVTefhfrWXc6IFsCbuOW+AlY9JyApqZ7aI
         P2pRFM31QVnOcZwoEL/f5iyAJUT5RteZzGzhtc5FOoH7dhqGyZrXXtChdUBObfouwAbh
         Fa+f37tuof8NaKp+8urnpMY6QVMGu+Twm9WhvvGfsBD/nNmz8tQ3B6+V6WmVofRCEaDj
         3NrfHO7zx5EOnoCTK4f3zLQ6+haj5QMNaySPL+zu8DjZ8q3zGA1idJoT7K/2lwUISemz
         4amuTA6jwgPow9tOI2MBDLf9cZGKZ6togpku4SZJsUeWyoUldJPq7SFCjgFOgS/nLCxK
         Omjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o24E2vpguEqlQJVYAkzHTTSUZUk8uNyA5+RLn6RNiCQ=;
        fh=eWdCLPudKi8hEYtthHwnBNmhi9d5yGfXdoTsQ9L2cyA=;
        b=iPBy1Xcz/XIKeuA6/ND0kUGr8ax5QMS2uNFaqfd3R5EeWQLOSw/d34OgJkm6yv4ecw
         dlfrdEbN91QCWoBKDka8zUwXNCymzNJVda4/ZLCEU+3S9SQKIImmsIdCnQkGdfGTZT29
         GCzGBDuSZYL7r8+TRttXVT289AQf1hu2rC4qT1HW3cuVlRQYK756HVcytttEEdCnucAB
         oKCBzeLoax22/hn8y3TZWmzSRqQdFIMCmWzSkVwSORWqdzkSp/QrC0XpnmOqGkIp50ez
         uIemViRJ0p1yA9aDFspmX+ndPMLaLgsYA07OYJCGM6SjRcFuc/1AFoQvC0Wjf4V8ewa/
         ZMsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776835304; x=1777440104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o24E2vpguEqlQJVYAkzHTTSUZUk8uNyA5+RLn6RNiCQ=;
        b=BMzLcG7tVa3izGrFwdUXo3IfFeaDQzKN2aZQZDFFZ9zns/jUULcxkyWDXK9VQ1tlpE
         UtNZkk/fB8h8ykIO8aWZBMNWwGoZwuLiuZejH332wjVF3R1hs29Iwjgn67+6hbIvGZRw
         /PKRIF01LPuXKKLy/yETIZjHV/T8zqTi037eoRECG9S04O16+GmQFshZN4DkYGir+pRf
         TAS02qgpUMl++iHF1PW8GO2Ae+LV69HyanQNeu2rjtFtNS9NpNJar5WyIpPkncNBwoB0
         L4beaB6BKZf8Ywrn/C0VWP6DbGibkGiVkyiW2tTRLO46CSofKtafsv+XORh+YLpHVxzg
         2T6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776835304; x=1777440104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o24E2vpguEqlQJVYAkzHTTSUZUk8uNyA5+RLn6RNiCQ=;
        b=cqPiOOFUYXbL9tOvGL8TPBKlgdocPzMxu2lZVERLC9ePTLYsuQ20N18977fcSEWrpF
         9ADm2VnJ8Op/Vd/cwhHAj6u2/AMr7somTMpIDEdvyUHPL89v6cbZkKpBsPucWl0qRlzT
         fapRxabWjaWo9wdNzRdmgXtPSEcWF93/fXv1aQabFChwYFnvst8i5TBVajQ4g8kEl9s3
         cyOaAW1UKiL86m+umUIptKA6M/BXFaoaT6dSnOahI0v6Mt18ygj8Kn2w1OZtDGxinLoD
         sFXhtAotwJPpIGebqpE3lYs7sH5eTYnP8KYLyg6gNDdmbixpniRurHvVqS/kIoB8UhTV
         g5Ew==
X-Forwarded-Encrypted: i=1; AFNElJ8MBviBu2AjEwUL9do+w0Iouag4B6Sbyee5mR97eW3XuXIv+Tp7fyschM0E9ZMCcNIJWUngRojvrwkX@vger.kernel.org
X-Gm-Message-State: AOJu0YzRpxjwklZsWQPULHZjuCI0eyJVfZEUJw3uD5oa+kuDooqNM2VS
	HDOp9A7RhF7tn85R7+/pEgDDeC0eBrRMtMK1BRlQVfxwhRI410YWX2czRpFNHK0BfcLAzlnlhXJ
	pAfhX9LaRgH/SJKCO59vuvzysWJLR3e0=
X-Gm-Gg: AeBDieuwjegQ9TCQ7q6ampTob9mKv/zm3Kq+SLMtm5TADuC6WC6oGziTez0+dVfqc+W
	CvsEMjs2KSBLzupyRuTgN4JNay370jTYNsarteLGioQbrioJEajXkXUJaDOym4DV9Nv4QoCjg5w
	corNybnNxMWYSUMt/R6GcsMXuo4V28nGeZvbq6Hrn0K41jqeBPBogxxYzBBFTsLh4iYGW9IINpj
	Kdhzn/RKchQ4tHVBWaP4EgEZK41Qm03EFnK6ynrYlVBLSeYtHS7KSUR47JKw9f6CNGt+pnc939H
	L/WkXINa/R5Z5mTw+yxOGVqHmQN+GXLe1KcROOlFewalLuO3ww==
X-Received: by 2002:a05:6512:3d03:b0:5a3:cebc:65ca with SMTP id
 2adb3069b0e04-5a4172b7aabmr5985280e87.7.1776835303680; Tue, 21 Apr 2026
 22:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419174654.683692-1-piyushpatle228@gmail.com>
 <20260419174654.683692-3-piyushpatle228@gmail.com> <20260421161720.43dd97a3@jic23-huawei>
In-Reply-To: <20260421161720.43dd97a3@jic23-huawei>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Wed, 22 Apr 2026 10:51:06 +0530
X-Gm-Features: AQROBzCnyaaBn3A3UqrIayKG7yMFk27iwRqhcN1FO7deVB6D_w_TzsMZu9ixLpg
Message-ID: <CAMB+xkZDu4_qYrHJ-0dh=74AxObrHKMGBChQRWhvyy8Yo_SJsQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: hx711: add support for HX710B
To: Jonathan Cameron <jic23@kernel.org>
Cc: ak@it-klinger.de, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 8:47=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Sun, 19 Apr 2026 23:16:40 +0530
> Piyush Patle <piyushpatle228@gmail.com> wrote:
>
> > The HX711 uses trailing SCK pulses after each 24-bit conversion to
> > select the channel and gain for the next measurement: 1 pulse gives
> > channel A at gain 128, 2 pulses give channel B at gain 32, and 3 pulses
> > give channel A at gain 64.
> >
> > The HX710B works differently: gain is fixed at 128 and the trailing
> > pulses select only the channel. One trailing pulse selects the
> > differential input (channel 0, 10 SPS) and two trailing pulses select
> > the DVDD-AVDD supply monitor (channel 1, 40 SPS).
> >
> > Refactor the driver around a per-chip hx711_chip_info structure so both
> > variants can share the same core. Each chip provides its own
> > iio_chan_spec array and iio_info pointer. The HX710B stores per-channel
> > trailing pulse counts in chan->address (1 for channel 0, 2 for
> > channel 1) instead of a separate array. A bool fixed_gain flag and
> > fixed_gain_val field in hx711_chip_info distinguish the fixed-gain path
> > from the HX711's user-selectable gain path without conflating unrelated
> > properties. The HX710B differential input channel is described with
> > .differential=3D1 and .channel2=3D1 as required by the IIO ABI.
> >
> > Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
>
> I'm slowly incorporating looking at the feedback that the sashiko LLM bas=
ed
> code review is providing.  In amongst some stuff I'm fairly sure was
> garbage it did raise some stuff that needs a closer look. See inline...
>
> > @@ -246,27 +275,50 @@ static int hx711_set_gain_for_channel(struct hx71=
1_data *hx711_data, int chan)
> >       return 0;
> >  }
> >
> > -static int hx711_reset_read(struct hx711_data *hx711_data, int chan)
> > +/* Select HX710B channel for the next conversion. */
> > +static int hx710b_set_channel(struct hx711_data *hx711_data,
> > +                           const struct iio_chan_spec *chan)
> >  {
> >       int ret;
> > -     int val;
> >
> > -     /*
> > -      * hx711_reset() must be called from here
> > -      * because it could be calling hx711_read() by itself
> > -      */
> > +     if (hx711_data->channel_set =3D=3D chan->channel)
> > +             return 0;
> > +
> > +     hx711_data->channel_set =3D chan->channel;
> Sashiko raises what sound like a plausible issue here.  If the read
> that follows fails is the current channel updated?  I.e. should we
> set this or not?
> https://sashiko.dev/#/patchset/20260419174654.683692-1-piyushpatle228%40g=
mail.com
> (be careful with these AI reviews. Some of the other things it says are -=
 I think
> not true!)

Some of the stuff by sashiko really seems to be garbage here ,still i think
right now channel_set is updated before the read completes, so in case
of a failure the cached state could become inconsistent with the hardware

I'll rework this so the channel state is only updated after a successful
read + wait_for_ready() sequence.

>
> > +
> > +     ret =3D hx711_read(hx711_data, chan->address);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return hx711_wait_for_ready(hx711_data);
> > +}
>
> >  static const struct iio_chan_spec hx711_chan_spec[] =3D {
> >       {
> >               .type =3D IIO_VOLTAGE,
> > @@ -455,10 +516,69 @@ static const struct iio_chan_spec hx711_chan_spec=
[] =3D {
> >       IIO_CHAN_SOFT_TIMESTAMP(2),
> >  };
> >
> > +/*
> > + * HX710B channels.
> > + * Channel 0: differential input (IN+ vs IN-), 10 SPS, 1 trailing puls=
e.
> > + * Channel 1: DVDD-AVDD supply monitor,         40 SPS, 2 trailing pul=
ses.
> This triggered a sashiko question...
> https://sashiko.dev/#/patchset/20260419174654.683692-1-piyushpatle228%40g=
mail.com
>
> Specifically if the fixed scale is correct for the supply monitor or not.
> It seems unlikely we'd want a large gain on a supply monitor.
>

okay, Agreed, this needs a closer look.
Currently I am using a single fixed gain derived scale for both channels.
I'll verify this against the datasheet and measurements for the supply
monitor channel and adjust the scale handling if required.

I'll address both issues in v3.

>
> > + * .address holds the trailing pulse count used by hx710b_set_channel(=
).
> > + */
> > +static const struct iio_chan_spec hx710b_chan_spec[] =3D {
> > +     {
> > +             .type =3D IIO_VOLTAGE,
> > +             .differential =3D 1,
> > +             .channel =3D 0,
> > +             .channel2 =3D 1,
> > +             .indexed =3D 1,
> > +             .address =3D 1,
> > +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> > +                                   BIT(IIO_CHAN_INFO_SCALE),
> > +             .scan_index =3D 0,
> > +             .scan_type =3D {
> > +                     .sign =3D 'u',
> > +                     .realbits =3D 24,
> > +                     .storagebits =3D 32,
> > +                     .endianness =3D IIO_CPU,
> > +             },
> > +     },
> > +     {
> > +             .type =3D IIO_VOLTAGE,
> > +             .channel =3D 1,
> > +             .indexed =3D 1,
> > +             .address =3D 2,
> > +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> > +                                   BIT(IIO_CHAN_INFO_SCALE),
> > +             .scan_index =3D 1,
> > +             .scan_type =3D {
> > +                     .sign =3D 'u',
> > +                     .realbits =3D 24,
> > +                     .storagebits =3D 32,
> > +                     .endianness =3D IIO_CPU,
> > +             },
> > +     },
> > +     IIO_CHAN_SOFT_TIMESTAMP(2),
> > +};
