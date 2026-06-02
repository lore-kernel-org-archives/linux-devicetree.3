Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCFC3E6DF4
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 13:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408230; cv=pass; b=ryG4hf8KargMXx1S219rpNvsrkPRFSfvx9FsEOGnmpcUMALBNpgbmFKKIFj8kAafcJ+A3EoXC1TtsSE/U8mIlzAITkvqlqCI9CoKN4jciFfNKYGwKGksMnjyN8KAEytR0TTBbF3DIP8ToFu8swwIHezwG3lz72mjsIro++f8I1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408230; c=relaxed/simple;
	bh=NVI4xF0q0eE4RXQugggAMrzJxldQ0dmIPoc43HTpsWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9LtVU4BfCqWSjPXbjogBt6DY1sqa6YWz1H1HRj59uLDf6VRb+qWoaDOJCj/klDEsQcb5U1l3L3B+dBXk0HvRfcE5krP1eMa0dNlDQ10LWLljaWpC1nIqowus2U/z/GQCsvodhbAAW5N6F28UgJ0o6eAXBOEQT5b/xZ/euJtOf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpZfRNzI; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpZfRNzI"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3045c195251so11829525eec.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 06:50:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780408228; cv=none;
        d=google.com; s=arc-20240605;
        b=K95JncoicbqmDph0oM7HNfIwkqK2mM6mBHqX4NmMsHtSAyoVs9Rxcapj/gP+bmdxKM
         crePGY2Yp2bLN3WWrtGRZPrI1OZ4kzHEAVcjjckwTfB33lqAr5fRpxcqleN3UTPUi7ZZ
         fjWTZzcQUpVcWA5Y1jHg5sH2tJHXCYenm/ruyKsuIbOUI8ECrTl+CMJEVKYxLw5DZjNe
         KJ8Mr1LDpDYz845JilNqlJzDrXBh6KI+8AWATg8sKlWmrGqk5kVwMGPD0EiFd8PMtCFZ
         4X+F9m+e+WJFTg2osyK4/syb5CNyBhYHmQVJxaXBO3agRh0sPsxgyX+YjE60wxNlc6iV
         L8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JXMEIdkpX0PMnnSFu3HxJtEnPHLXb+fgf1w6HULmKpc=;
        fh=oRM6gFRyWy0UsNzUBe5w2JMnmmxNgzRmh1QqFyI43nY=;
        b=P48LffELxVGBSttCUaVr7LHObRs8/bCVd8vMzC3iT5YhE/zNq7ds+AyFnUrYr/wEED
         xftCSnfFxjuOV1DVKSt8p34zLpWcDHvPhKhRR/ffjpESGSTSh/9cWZvvMTt8sD8phehT
         ismy0ZRtHv45YF6KGtMBWQI7tFHpO1LDbsY8nD+bR45ekgBNQCnBduhg+GsSO969HBWB
         cHLkr70l+eT8gzSy/HU1qMOXU0ROFr8j3Uhhqo6Z51ygnpUi6hLJzghOKz4nyavnmRsO
         qZsw93+HLc6jdLnO9DpYv4x5v+cd901Nbq0jb0aIr2x71Zz+qvULAHwGajYA06fQ/CnO
         pkTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780408228; x=1781013028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXMEIdkpX0PMnnSFu3HxJtEnPHLXb+fgf1w6HULmKpc=;
        b=WpZfRNzII18pq3ZL6sObbH7QWDzG/lwUsSm8R/EAPn49vOM6x1YnRY6lU1kTrje/+r
         eH1unkYQWCB+UfaNlov/e1KTvzTuYaFPA/pPk64cte29X9zLnBYnEWHGNcXZ7rm1fUBj
         5IUcMifVOylKCBkbih3OuxCp3VDepMzqAIzuShWO23K0Sl/eNKptkHdhvBYNtrBbh5fc
         q2MDTkpjchmjAFZSofQzH/erjQ3z/41mVDrlemVKUXyyopDZCB2gMWNpwOWUGIQkbGe+
         Z/sbV+NH1e9evdm/MEbXdTxdYzmfDPlZVjnWqpv3JHvuBqaqk5ZKEKMqK4gFCmuQmsex
         Ijgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780408228; x=1781013028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JXMEIdkpX0PMnnSFu3HxJtEnPHLXb+fgf1w6HULmKpc=;
        b=PhZpH7noDHxpF8lQ3Vzywt3Kft2xtUPnORutKA7uu3ObsW3BXCXCvTKIGY2W9rPofn
         tfAygp9zg6Y5U51dptuQBOrrwQjt1oYBhtSUp21mBttXJzxVsmIp9qeBVRwsQA8W73Rm
         bWvrAYWYh2h3zF3UyyYx3D8mYKs49Uo7Ed3UHpuI1rp+K7gT1wTFvMoGvuXITv35Yc4R
         vB8f0CcbWgMyndfs2UsjkXrS1l4jXdoEzy1tonTptBuvtHP7P92FoXnYI7pLZuOjHqgl
         Xt2SWm3PfUDvanQDMnY4T9F3Ca9KJk1n4hUG0LnKIqDVTNGLkn44dgXOXi1nMaiFmXY0
         ApKg==
X-Forwarded-Encrypted: i=1; AFNElJ/Bj2jHR9qE1bnz95T4jJ03wkgwtzM7IUG7SC0akhYPlwhwyxVIzE3EbugDddcM6gJDiH5PVI29q5dB@vger.kernel.org
X-Gm-Message-State: AOJu0YwRbKuD780kSB6azAHvDrt7pJ0yc1YiYbZogGPbu/eMy+/YbSYr
	HEG0XtZ6jfIhUxaREVVh8Gdei2wSrbOxkuvFd8nggvDzyp9yOwfW8OKwB+Fb5f8vfN5kddD6nLX
	WOcYhkTyotgY4YH/3pbSDCAHFK0F3Tow=
X-Gm-Gg: Acq92OGzLguU29ZiBuiAb1u3X4+xh9bTjjyoYjjGTPoLSIUsendcrwvQbXnKegdTUEz
	37OYb400JBtxg86TLKWSm2w/6H42SISbywRverx2y/C5VxSEBd3+j/4kfTHdLV29+d4Br/BNUmY
	3Oh30vORe1kgoHYMoMhhl69qLU+eK6fojzhvWIuhOjvYlkCaP68T364NDEUHjoHkkUlnfGrtQDr
	LjBuNEw40Lg928GcOxqGCZvxBDS3GkhQsHcM/XYp1auOSNncYjVyyxG2RkmVbvGQcDFrs1NZHZv
	hsfZ0Ne7hrJlvL+sw+Y=
X-Received: by 2002:a05:7301:1f0d:b0:2ed:e14:42e9 with SMTP id
 5a478bee46e88-304fa693628mr8033250eec.34.1780408227938; Tue, 02 Jun 2026
 06:50:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-6-clamor95@gmail.com>
 <20260602144640.433b4d35@jic23-huawei>
In-Reply-To: <20260602144640.433b4d35@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 16:50:16 +0300
X-Gm-Features: AVHnY4KYcv6nkoqF49he0KoddQyJUPiBV8YuVyKK6U5KG-s9hQUTG1_wCFFBKFE
Message-ID: <CAPVz0n1r97d8-uzhPGBx0LFSp75A3_2mMXDQQ30utT-6NtpHNA@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] mfd: lm3533: Convert to use OF bindings
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 16:46=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon,  1 Jun 2026 18:18:25 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Since there are no users of this driver via platform data, remove the
> > platform data support and switch to using Device Tree bindings.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
>
> > index 52136ca1abc9..55b35467a722 100644
> > --- a/drivers/iio/light/lm3533-als.c
> > +++ b/drivers/iio/light/lm3533-als.c
> > @@ -16,16 +16,19 @@
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> >  #include <linux/mfd/core.h>
> > +#include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >  #include <linux/regmap.h>
> >  #include <linux/slab.h>
> >  #include <linux/uaccess.h>
> > +#include <linux/units.h>
> >
> >  #include <linux/mfd/lm3533.h>
> >
> >
> > -#define LM3533_ALS_RESISTOR_MIN                      1
> > -#define LM3533_ALS_RESISTOR_MAX                      127
> > +#define LM3533_ALS_RESISTOR_MIN                      1575
> > +#define LM3533_ALS_RESISTOR_MAX                      200000
> >  #define LM3533_ALS_CHANNEL_CURRENT_MAX               2
> >  #define LM3533_ALS_THRESH_MAX                        3
> >  #define LM3533_ALS_ZONE_MAX                  4
> > @@ -57,6 +60,9 @@ struct lm3533_als {
> >
> >       atomic_t zone;
> >       struct mutex thresh_mutex;
> > +
> > +     bool pwm_mode;
> > +     u32 r_select;
> >  };
> >
> >
> > @@ -411,7 +417,7 @@ static ssize_t show_thresh_either_en(struct device =
*dev,
> >       int enable;
> >       int ret;
> >
> > -     if (als->irq) {
> > +     if (als->irq > 0) {
> >               ret =3D lm3533_als_get_int_mode(indio_dev, &enable);
> >               if (ret)
> >                       return ret;
> > @@ -716,30 +722,34 @@ static const struct attribute_group lm3533_als_at=
tribute_group =3D {
> >       .attrs =3D lm3533_als_attributes
> >  };
> >
> > -static int lm3533_als_setup(struct lm3533_als *als,
> > -                         const struct lm3533_als_platform_data *pdata)
> > +static int lm3533_als_setup(struct lm3533_als *als)
> >  {
> >       struct device *dev =3D &als->pdev->dev;
> >       int ret;
> >
> > +     als->pwm_mode =3D device_property_read_bool(dev, "ti,pwm-mode");
> > +
> >       ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CO=
NF,
> >                                LM3533_ALS_INPUT_MODE_MASK,
> > -                              pdata->pwm_mode ? LM3533_ALS_INPUT_MODE_=
MASK : 0);
> > +                              als->pwm_mode ? LM3533_ALS_INPUT_MODE_MA=
SK : 0);
> >       if (ret)
> >               return dev_err_probe(dev, ret, "failed to set input mode =
%d\n",
> > -                                  pdata->pwm_mode);
> > -
> > +                                  als->pwm_mode);
> >
> >       /* ALS input is always high impedance in PWM-mode. */
> > -     if (!pdata->pwm_mode) {
> > -             if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
> > -                 pdata->r_select > LM3533_ALS_RESISTOR_MAX) {
> > -                     dev_err(&als->pdev->dev, "invalid resistor value\=
n");
> > -                     return -EINVAL;
> > -             }
> > +     if (!als->pwm_mode) {
> > +             ret =3D device_property_read_u32(dev, "ti,resistor-value-=
ohms",
> > +                                            &als->r_select);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret,
> > +                                          "failed to ger resistor valu=
e\n");
> > +
> > +             als->r_select =3D clamp(als->r_select, LM3533_ALS_RESISTO=
R_MIN,
> > +                                   LM3533_ALS_RESISTOR_MAX);
>
> If we are getting garbage from DT I think I'd rather error out that paper=
 over
> that problem.  So similar to before, check valid value and if not fail pr=
obe
> so that hopefully someone goes and fixes it!
>

sure

> > +             als->r_select =3D DIV_ROUND_UP(2 * MICRO, 10 * als->r_sel=
ect);
> Why do we need this when we didn't before?  The range checks are the same
> so it smells like it shouldn't need transforming. I'd also rather we didn=
't do
> rewriting of the meaning of r_select like this.  Just use a local variabl=
e for
> the intermediate result.
>

before pdata passed resistor value as actual register value, not we
are getting the actual resistance in ohms from the tree and must
convert it into register value.

> >
> >               ret =3D regmap_write(als->lm3533->regmap, LM3533_REG_ALS_=
RESISTOR_SELECT,
> > -                                pdata->r_select);
> > +                                als->r_select);
> >               if (ret)
> >                       return dev_err_probe(dev, ret, "failed to set res=
istor\n");
