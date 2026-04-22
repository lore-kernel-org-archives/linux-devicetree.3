Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874E72C027E
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 05:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776836996; cv=pass; b=HCtGql4ZbdOoFTJcbRzf5B148sb74XEF5PUYBGCboBIat4W6gyg4U1+vaGYRIq1LO9z8YTQUGBfKgGn+74R3TK0B8g4db+1S8/QCoEhaepTSdEA6CqZzxIDMoWgxiH2L/ivBye0pzC3qNwGkf1bbb44E/ul5kvYadaxq7xteIHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776836996; c=relaxed/simple;
	bh=XQR89QkQXLBM+jd3aIBp1XsFOxLsLCocfKrUOR8zAiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R9010kdQtCe89GG/TS3MyisoXt/Zk0AwsSymp8Ps70Kok3Ygl81axTUEi6uIqri66h9XyeTSxezMhd+BOcjRV0fpA/ppdHQG7lQ+Pudnedg7HHYi1IO45dXWPw/Xb6e5zrh9kJxSf7BTedTWSjpEyA0hV0j6Yh/wKkG5OQPvS+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgtnquEP; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgtnquEP"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a3d1561e38so4285917e87.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 22:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776836992; cv=none;
        d=google.com; s=arc-20240605;
        b=CBkt1pQQnX9dPqkSkaRhxUnk1f4E6CVUUvKbI4qM6HJ+Wxm0egvIgfxTFXAXLNOdet
         JCPRDQiht06JvluNxkr4v2GWc0n4br1/DWQ6QZjNTQAV94r8yhjFksWHOL+IecGcmPat
         cQ/1nHXUiwyjClLYo7vLEZ5Lrskc1an06Lg35W7bGNZ0+vUDfgLbG4J3d39EZlbEWB0B
         idhRk6kXayd0isGu2LTL/IsOgoZCdAFwgQKfxh8ibtNd8LmQ7mj5zEE1xbN5VoiJNrNT
         T8mJ/F81Kf2P7F2NHUYYnt19bJROEtlgM5uZTydDCP5nKZ46fK3/GZAB0mL3OzSTf45Y
         3p1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XsjzWl9oGYNJVBtc380089snmdHxvs1SAXZ+J7OsdRc=;
        fh=OHE8NI1a3t2b8os1r/taab+IU+ROjpthrT/GKekD4tA=;
        b=I9WBcLEjkYlQCcgBDYgWgjR2uL6OsYhSyuSUkNFan0o4AX5hwn83BcVKgSKYmk1miS
         VWmSoUYWArWmbc+EEjkoeWToraqpY6eV71hTbK/xtUzCvroXf8IV4QNIyP1DyTO19WGZ
         RbX05SaYPHNi3m/3V0BAEzg8SykbCijkACTr5q3V20Zx9myyB4nxlAsgl3td9JruVMXY
         iHMLSwk8oNDP3no7zyOzhzRU8iT3lwx0gyBIT4ACdo3uz5erWQXQh1qOgHtkk94lP70O
         IzeXqE6kMxy06Z4w0jKkQR88qcQRulP7k5Tyw8lQ33veFonAWUZ+DZD7LcB1E9bT8zCx
         zy0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776836992; x=1777441792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsjzWl9oGYNJVBtc380089snmdHxvs1SAXZ+J7OsdRc=;
        b=jgtnquEPolnhtX0zBJbZ83B80o5ic1AAVIvku/vPCdjtjFYL0RaTN5x/eVHzzEBAXX
         rB8p/Ldb7ScOGXIIF4J4VIEcuoaQSZoH5YUT6DCzWweQYSY6N3hqhQGmjOrru8Be+rO7
         BcJAj/ZEVyIxtosgyY8UO9P9EMWQXcUcGgyu4+EMQGgRimhjw0lIQ1OInBud3kOrPACe
         rPioFdDYmaZYUKNKrhROrpK8hwLKfCJFAJBGouVrbYZAO+AqHFDwJcFXmMl/+YQ3AQP9
         M6TAsr7N61atvPpzKplCOHIgpQuKwiZDtg+CWHzSGxIv0yq/h9AmH1zLesgKTQ7wW2UA
         iX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776836992; x=1777441792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XsjzWl9oGYNJVBtc380089snmdHxvs1SAXZ+J7OsdRc=;
        b=XNiQ8awy1ZJZoIVAxqU+GHDOEyHNY7jEIe1XA0N9HfbTUElKcqccGBj6uvMXBhjAlV
         7fIs2F2oHH9e1QjufNTUUIhE9qLqOgYBjp3AQyyWoGCxkCASp7LoXywzFHKQdF5ot8Ud
         MltkYCuuJqc2MseCKYMEXGg17QWhFRThRQw9tuS0uukzh53+SdeBp1wO+L1AztYj7weK
         35rTBGrp1ZZ3e+Um784RrgQ9i3t9DUFhNZuUNXrYo6dvy6G0RmvfC5Bv+YUOP5oo/G08
         c3+oJCocepa0VUUIYdrKyWCWXmy+qXlch7eGXJ6kJNtZHFrFlSd7yAn1MHk4zRSCfdgH
         /4RA==
X-Forwarded-Encrypted: i=1; AFNElJ97ZPxVF9NYsnqC97HhLTY+rd0EVu6vgUnPrPHMe0p63TQM8Vdh2yKXo9En7bTFplBgpUwKmITVOQL4@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq6mqaVo3g8/x0wNtmOxyTB0iwBArQqrMIwj0Enp/d+VoMveRs
	yAOJqqlKYs9FhEPEerIkkIuTQED6JTjq6Ll1bznCYC4hmh4Lcdlmib495d0dScwRhQSVpliY4nK
	Kt/e9VsfrIwLn6JV2pFIX0L/BRFg+McE=
X-Gm-Gg: AeBDieu+2woYVa3vdCk9f4SfPFLol3jmdRV1wESDrE77j7u1bJlALSA+GISEPq/cZOL
	FZi4JJSK2qyZFx2a5UDr1/NXSEM8UgDg5zlibUTAejlRvgtcJ4ADqxa239LHkGBceR1uCJNCluH
	xj6PyRClOQCzF83GvY5iXFVvTQm8UUciKrbKBHXD6+7FMESFP1T3mBtfZ5bUsWyvikQSr6tQ0R3
	Yh/PF7ZCf8eeCZM4XtD4BMHb8b+0yvYAks2B0FBtL5iD0jrMrPvB7H25RLTcyY1mkrKr/M4L6Fg
	bkR0gbHKZZ+rZBjuIu7OuBy/YUiQiJek/w4AY2IsETWtLuOa5w==
X-Received: by 2002:a05:6512:3ca0:b0:5a1:b83:c7cf with SMTP id
 2adb3069b0e04-5a4172f6634mr6634444e87.25.1776836992178; Tue, 21 Apr 2026
 22:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419174654.683692-1-piyushpatle228@gmail.com>
 <20260419174654.683692-3-piyushpatle228@gmail.com> <aeXryRD34RLveqDi@ashevche-desk.local>
In-Reply-To: <aeXryRD34RLveqDi@ashevche-desk.local>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Wed, 22 Apr 2026 11:19:15 +0530
X-Gm-Features: AQROBzC6kLNs31J3aUG5eVnxNe1TPvq9eOsBQoAZBOsPIYgFp4V1BQ3JPUE5PTA
Message-ID: <CAMB+xka2ZXbT-G-RUMAusJm8KsOjpCVwjijG2eUaPxBYahQrgg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: hx711: add support for HX710B
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, ak@it-klinger.de, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 2:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Sun, Apr 19, 2026 at 11:16:40PM +0530, Piyush Patle wrote:
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
> > ---
> > Changes in v2:
> > - Fix pulse count bug: hx710b values were {25, 26} (total SCK cycles);
> >   corrected to {1, 2} (trailing-only, hx711_read() clocks 24 data bits)
>
> Which questions how it was tested...

Fair point
I will expand the testing details in next version

>
> > - Add .differential =3D 1 and .channel2 =3D 1 to HX710B channel 0
> > - Move trailing pulse counts from a separate array to chan->address
> >   (1 for ch0, 2 for ch1); remove chan_pulse_count / num_chan_pulses
> > - Replace chan_pulse_count !=3D NULL tests with dedicated bool fixed_ga=
in
> >   flag; add fixed_gain_val field to hx711_chip_info
> > - Add const struct iio_info *iio_info to hx711_chip_info; probe sets
> >   indio_dev->info =3D chip_info->iio_info directly
> > - Remove NULL check after device_get_match_data()
> > - Remove reset_channel from hx711_chip_info (always 0; use literal)
> > - Change hx711_reset_read() and hx710b_set_channel() to take
> >   const struct iio_chan_spec * instead of int chan
> > - Revert hx711_data struct member alignment noise
> > - Restore trailing blank line at end of file (unrelated removal reverte=
d)
> > - Sort of_device_id entries alphabetically (hx710b before hx711)
> > - Expand commit message to explain HX711 vs HX710B trailing-pulse model
> > - Restore file header to mention weight sensor modules
>
> ...
>
> >  config HX711
> > -     tristate "AVIA HX711 ADC for weight cells"
> > +     tristate "AVIA HX711 and HX710B ADC"
>
> This won't scale. Better to put something like "and compatible".
> Also use plural "ADCs".

Agreed, "AVIA HX711 and compatible ADCs" avoids needing updates when
new variants are added. Will fix in v3.

>
> >       depends on GPIOLIB
> >       select IIO_BUFFER
> >       select IIO_TRIGGERED_BUFFER
> >       help
> > -       If you say yes here you get support for AVIA HX711 ADC which is=
 used
> > -       for weigh cells
> > +       If you say yes here you get support for AVIA HX711 and HX710B A=
DCs
> > +       which are used for bridge sensors such as weigh cells.
>
> Usually for the less churn in the future we list them one per line. This
> will give easier understanding of what is supported (keep them also sorte=
d).
>
>           If you say Y here you get support for the following AVIA ADCs:
>             - HX710B
>             - HX711
>           which are used for bridge sensors such as weigh cells.
>
Will restructure accordingly.

> >         This driver uses two GPIOs, one acts as the clock and controls =
the
> >         channel selection and gain, the other one is used for the measu=
rement
> >         data
> >
> > +       The HX710B is a variant with fixed gain and a different channel
> > +       selection scheme.
> > +
> >         Currently the raw value is read from the chip and delivered.
> >         To get an actual weight one needs to subtract the
> >         zero offset and multiply by a scale factor.
>
> ...
>
> > - * HX711: analog to digital converter for weight sensor module
> > + * HX711/HX710B: ADC driver for weight sensor modules
>
> Use same as in Kconfig:
>
>  * HX711 and compatible ADCs driver for weight sensor modules
>
Yes, Will align the file header and module description with the Kconfig
wording.

>  ...
>
> > +/**
> > + * struct hx711_chip_info - per-variant static configuration
> > + * @name: IIO device name
> > + * @channels: channel specification
> > + * @num_channels: number of channels
> > + * @iio_info: IIO info ops for this variant
> > + * @fixed_gain: true if the variant has a fixed ADC gain (e.g. HX710B)
> > + * @fixed_gain_val: the fixed gain value used to compute scale (when f=
ixed_gain)
> > + */
> > +struct hx711_chip_info {
> > +     const char                      *name;
> > +     const struct iio_chan_spec      *channels;
> > +     int                             num_channels;
>
> Why signed?

num_channels cannot be negative, so unsigned int is
more appropriate. The same applies to fixed_gain_val. Will fix both.

>
> > +     const struct iio_info           *iio_info;
> > +     bool                            fixed_gain;
> > +     int                             fixed_gain_val;
> > +};
>
> ...
>
> >  struct hx711_data {
> >       struct device           *dev;
> >       struct gpio_desc        *gpiod_pd_sck;
> >       struct gpio_desc        *gpiod_dout;
> >       int                     gain_set;       /* gain set on device */
> >       int                     gain_chan_a;    /* gain for channel A */
>
> > +     int                     channel_set;    /* HX710B current channel=
 */
> > +     int                     scale;          /* HX710B fixed scale */
>
> Check if those need to be signed.
Will revisit and check but i think channel_set stores a
channel index (0 or 1) and scale is derived
from AVDD, so neither should be negative so converting both to
unsigned int makes more sense. I'll also update trailing_pulses to
unsigned int for consistency.

>
> > +     const struct hx711_chip_info *chip_info;
> >       struct mutex            lock;
>
> >  }
>
> ...
>
> > -     for (i =3D 0; i < hx711_get_gain_to_pulse(hx711_data->gain_set); =
i++)
> > +     for (i =3D 0; i < trailing_pulses; i++)
>
> If 'i' is used only once here, it can be converted to
>
>         for (unsigned int i =3D 0; i < trailing_pulses; i++)
>
Will update.

> >               hx711_cycle(hx711_data);
> >
> >       return value;
>
> ...
>
> > +     .num_channels   =3D ARRAY_SIZE(hx711_chan_spec),
>
> You also probably want to revisit inclusion block. At least follow IWYU i=
n the
> code you added here, exempli gratia include array_size.h and types.h if n=
ot yet
> included.
>
> ...
>
> >       hx711_data->clock_frequency =3D 400000;
>
> Sounds like I2C or SD standard speed :-)
>
> Not sure, but can be also converted to use 400 * HZ_PER_KHZ (from units.h=
)
> in a separate change.
>
> ...
>
> >       hx711_data->data_ready_delay_ns =3D
> >                               1000000000 / hx711_data->clock_frequency;
>
> Side note, in a separate change you can use constants from time.h, id est
> NSEC_PER_SEC.
>
> ...
>
> >  static const struct of_device_id of_hx711_match[] =3D {
> > -     { .compatible =3D "avia,hx711", },
> > +     { .compatible =3D "avia,hx710b", .data =3D &hx710b_chip },
>
> Please, split this to a separate change. So, first introduce the chip_inf=
o,
> then add your device support using given infrastructure.
>
> That said, you also can convert the driver to use guard()() from cleanup.=
h
> in a separate change.
Agreed. In v3 I will split the driver changes into 2 patch.
>
>
> > +     { .compatible =3D "avia,hx711",  .data =3D &hx711_chip  },
> >       { }
> >  };
>
> ...
>
> > -MODULE_DESCRIPTION("HX711 bitbanging driver - ADC for weight cells");
>
> Ah, this removes crucial information. So, this driver probably just needs=
 to
> use i2c_gpio?
>
> > +MODULE_DESCRIPTION("HX711/HX710B GPIO ADC driver");
>
> Use what is written in Kconfig.
>

You're right, "bitbanging" is important context. I'll align the module
description with the Kconfig wording and retain that qualifier.

> --
> With Best Regards,
> Andy Shevchenko
>
>

Thanks for this detailed review
Regards
Piyush Patle
