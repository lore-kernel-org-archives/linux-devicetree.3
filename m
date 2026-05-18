Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECAC305681
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 21:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779139855; cv=pass; b=lYFF+49bPt36rTiGRhz/mUoTKg1uW4t78vb72sHboD76sB0FUl1tXVRkOyDENVJ9Bi0KI1UpQFijOn0t3Ec3W4o/dtjQonFT5krdgyuue10Ln1qfKiApf/sGQ6FgSggaob1Ao8L87BM6bioOPbg8XsgjfHayKrwrpBb9oAMgU4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779139855; c=relaxed/simple;
	bh=le/hQYlmF/6b761T9Rx4bLDpGIWBkCA1cOsd1cBIlJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRMm9AEm/p+E1tmE9jEeZKIyOQT1I9NfG6BVrrJfx/Al6TEi6xiNjhcg875LrCJyei94roo7/RfJ1IQGQiM59q7NcEU2LOGJSIqE4FksvwuEsbi71E3u3miVxVVyHYjpsUB+whSt9b1aZQrOabXcPmwWOGKVAxvg65pZVdJl3cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOyc9ZyN; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOyc9ZyN"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a8721851e2so3324488e87.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779139852; cv=none;
        d=google.com; s=arc-20240605;
        b=Zn0pUa63r2eOdIjRzilsTQ0sBMt9TJKFlVtxyLENMe7pDW6zmm0kZmbzL0YA2TOc0k
         c0Sc+GTM6GKL31bWbdFJe37htG6sVpeTiaqjVwZHcW9kyRh9vO8WJDGaIyLK5lDfuIff
         51OzqmzJFIOATDQBxLv5h3AN6BRUg9LE0ZvK2UycPpJek191kPHsAkSSV8DW9zrLXAqK
         zjoBSL8/vI9hi1/Mi2XnkaE9Oh2TRb17+SlgsqYBXnm/R6sA1CGTvb4CGR0O6DpXP/vq
         ycgV9M3wmJp12E4Uxucpm01/HygZl2xkFzc+PtEFncXKoe+U9lasVCuYq89+RDSsim5i
         +DTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bd7vYJplBbBzOnELLDZvPr8fn2AoBJSrdCftd49937E=;
        fh=dFFHPDkaRXKXK9z4G4vSDinUhZRparjbszqrerL71x8=;
        b=WCvbIwDxryXVMuuzedGhU2Z5HEPNAeCqLWlvUZ4ZbFLm10lkZqSpLcsWp49w2Vu+n1
         w28LUATOzRLUWzXLMFQhKXCJmbPC6/topSWRbzCj7kley+JsiWc4sDIHFo/IcyWXYeTZ
         baTjSME7UwlsdrrkD/i3OKX8QwVK/mr7iuV2eR12msGneA2QYHxfY7W1CuDc9QLWuC0Z
         Ow9MNXKlAwJpvHu84xELNvPT6bK0WF6WizTRh3imguelLuHLuTp3Veu41eHaWbFp9owP
         +5Glj5Lncw6q63SVYRborqs9wlwARpC+e+dg3Ertpx7NjGXOUcxqMRmHyK1pEV0eLu42
         97DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779139852; x=1779744652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd7vYJplBbBzOnELLDZvPr8fn2AoBJSrdCftd49937E=;
        b=JOyc9ZyNV/vKgk0at0A6CFOI20ISSK3itlZoFEw0oK8jtS6XSPbZmQcKwLi6SogHlh
         0PXqwCmiIjV/awuSubwaEnF1UCMbm7cqO5O6Tx7HjAg5XRn9ZBCDAGd1NtERVWI4alKc
         4ERhLQbCfPm5T0kdnjDz3foZex72p3ZFuNxsYwcT26LTPmqBNjW8VGUoDEtK2bvryrZ3
         8JlnxhYcn2hSxlnW84vUj80+3eolwl5Oa7nGL6utn7QMyZr0OmVOImhv05pKZUpymJdF
         gHoQphGOc0TuOt6FG4g+B75hzgG+kQxFs8XS2cLH+fXR/D8keaGaH6yGzJDDez2WRioB
         LXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779139852; x=1779744652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bd7vYJplBbBzOnELLDZvPr8fn2AoBJSrdCftd49937E=;
        b=GMC6p2AZprhQNjM5PZM72TjH+CBflabECyHBqhnVTca5OHUvx15hBwlFPybBZpDVfo
         bYxZMCrgwE9KX4qh/qYuf3fWbQgY6KL0PzLdWanMxHQbDMijZEJahOh70hM5Kn8liYc5
         u/RuLqVDAv7/NGRZidzMqvn6Ay/kAJqUETse42IB7H61bDjfkrYWs/kgONgVY3Di1WBT
         Cgvc9MXboeBdhVVxKWES9KCBCon2hvtr+ZscivhGYCOyiA5CItYBuwZ9tdvHXAhWyLtu
         631tQ28hrJiQX8iEyDphSbvTXlo3O+D76zITi/Oub8AT6x7XOKkM6SIc46eB5qcGIjBh
         HwkA==
X-Forwarded-Encrypted: i=1; AFNElJ/8ibDnYrqJ1xceehshz/nKIQ4W3x4pwy/fx2pokdQ7/7nq1aQZabu/RHLmJT+LKR6cFu5XL+9a7+x9@vger.kernel.org
X-Gm-Message-State: AOJu0YxipGXZwdY0Vssz93asErh+jwynQkpBI3ziFuKYOWivdlB6BGHx
	cjrYbRXxuSUfJHNMyNm3RPBSjVPLxRwMjYi2VCa5EAMkO5xRm9DVCt079Yhcoq3S6dlxZS4F+zx
	pr+DsEXdrC6Mze33UERIeWajZg1t9UWY=
X-Gm-Gg: Acq92OHsp1DVCftix/XpW1Og5hOGrS6rg+j0L2eIUDC/9x7Jow27FqO/XteeGXDQUE0
	I4yIQPThBO9T4rv68EPIvIyWrznfpjXLw0CyTlZ0qn0AnjbBLsqdwPQMrK84RmssF6yjA0qoYKv
	DLZlau2XsQbT2Y/tgHPrz97d3ytrFBLGGBJUGTCwfwle3n/j8SZRhPS6Vn6pj/XeiTAvK6sIXQ2
	Tu1L2EYC6R2geX0W+FCk2RrDzU3fvnSkvUIhNGfMyntlN96ITt8GeGD9ipfR/j5DaXscEDnZDrP
	xkLdx1dprXhTj71yvuuRAFD0doDNMWlbqK1tG1E=
X-Received: by 2002:a05:6512:3087:b0:5a8:89d6:93e0 with SMTP id
 2adb3069b0e04-5aa0e742990mr4824546e87.13.1779139852267; Mon, 18 May 2026
 14:30:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511174342.123820-1-piyushpatle228@gmail.com>
 <20260511174342.123820-12-piyushpatle228@gmail.com> <20260512133806.74c566e0@jic23-huawei>
In-Reply-To: <20260512133806.74c566e0@jic23-huawei>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Tue, 19 May 2026 03:00:13 +0530
X-Gm-Features: AVHnY4KGl6KN8fz9MnmyUah6Swvo5JtlVgairdcJc8lsRYz7ujlNacoZz2O94KI
Message-ID: <CAMB+xkYugs9GvcQBum_B_fx6Qcy5zD-KSEcZova39S0An4L-cw@mail.gmail.com>
Subject: Re: [PATCH v8 v8 11/11] iio: adc: hx711: add support for HX710B
To: Jonathan Cameron <jic23@kernel.org>
Cc: ak@it-klinger.de, andriy.shevchenko@linux.intel.com, dlechner@baylibre.com, 
	nuno.sa@analog.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 6:08=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Mon, 11 May 2026 23:13:36 +0530
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
> Hi Piyush,
>
> A few things I'd missed that Sashiko mentioned.
> Note that most of what it calls out in v7 of this patch is wrong because
> of the whole active_scan_mask / timestamp bit being set or not thing.
>
> The channel representation is indeed odd and I think that bit needs
> a rethink unfortunately.  I'd failed to notice it wasn't just two differe=
nt
> channels but instead is one physical set of inputs measured at different
> sampling rates.
>
>
> > @@ -403,16 +442,16 @@ static irqreturn_t hx711_trigger(int irq, void *p=
)
> >
> >       mutex_lock(&hx711_data->lock);
> >
> > -     memset(&hx711_data->buffer, 0, sizeof(hx711_data->buffer));
> > +     memset(hx711_data->buffer, 0, sizeof(hx711_data->buffer));
> >
> >       iio_for_each_active_channel(indio_dev, i) {
> > -             hx711_data->buffer.channel[j] =3D
> > +             hx711_data->buffer[j] =3D
> >                       hx711_reset_read(hx711_data, &indio_dev->channels=
[i]);
>
> Sashiko pointed out (v7 review) that this can return an error. We should
> really be checking for negative values and if they occur don't push data
> to the buffer.  Given this is unlikely to happen except when the device
> is very broken, a rate limited dev_err is usual way to report this then
> carry on without calling iio_push_to_buffers_with_timestamp().
Agreed. I missed that.
In v9 I will make hx711_trigger() check hx711_reset_read() and skip
iio_push_to_buffers_with_timestamp() if any channel read fails.
>
> >               j++;
> >       }
> >
> > -     iio_push_to_buffers_with_timestamp(indio_dev, &hx711_data->buffer=
,
> > -                                                     pf->timestamp);
> > +     iio_push_to_buffers_with_timestamp(indio_dev, hx711_data->buffer,
> > +                                        pf->timestamp);
> >
> >       mutex_unlock(&hx711_data->lock);
> >
> > @@ -463,6 +502,10 @@ static const struct iio_info hx711_iio_info =3D {
> >       .attrs                  =3D &hx711_attribute_group,
> >  };
>
> > +/*
> > + * HX710B channels (Table 3 in datasheet).
> > + * 25 pulses (1 trailing): differential input, 10 SPS -> channel 0
> > + * 26 pulses (2 trailing): DVDD-AVDD supply monitor, 40 SPS -> channel=
 2
> > + * 27 pulses (3 trailing): differential input, 40 SPS -> channel 3
>
> I'd missed this previously but sashiko raised a question on it.
> Why are we representing the same physical input channel as two different =
IIO channels
> based only on the sampling rate?  That doesn't seem to make a lot of sens=
e.
> Should be one channel with a sampling_frequency control.
>

Yes, you are right. I should not expose the 10 SPS and 40 SPS
differential modes as separate IIO channels.
In v9 I will model HX710B as two physical channels:
- voltage0-voltage1: differential input, with selectable sampling
frequency of 10 or 40 SPS
- voltage2: DVDD-AVDD supply monitor, fixed at 40 SPS
The differential channel will get IIO_CHAN_INFO_SAMP_FREQ. The driver
will map 10 SPS to one trailing pulse and 40 SPS to three trailing
pulses at read time. The supply monitor will always use two trailing
pulses.

I will also update channel_set immediately after hx711_read() succeeds,
because that is when the trailing pulses have been sent and the hardware
state has actually changed.

Will send v9 with these fixes.
>
> > + * .address stores the trailing pulse count for hx711_set_hx710b_chann=
el().
> > + * Channel 2 is used for the supply monitor to avoid aliasing the
> > + * channel2 terminal of the first differential pair.
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
> > +             .channel =3D 2,
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
> > +     {
> > +             .type =3D IIO_VOLTAGE,
> > +             .differential =3D 1,
> > +             .channel =3D 3,
> > +             .channel2 =3D 4,
> > +             .indexed =3D 1,
> > +             .address =3D 3,
> > +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> > +                                   BIT(IIO_CHAN_INFO_SCALE),
> > +             .scan_index =3D 2,
> > +             .scan_type =3D {
> > +                     .sign =3D 'u',
> > +                     .realbits =3D 24,
> > +                     .storagebits =3D 32,
> > +                     .endianness =3D IIO_CPU,
> > +             },
> > +     },
> > +     IIO_CHAN_SOFT_TIMESTAMP(3),
> > +};
>
