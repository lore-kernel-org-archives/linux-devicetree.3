Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175C33F39DE
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 14:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410549; cv=pass; b=QepMZbZR5PrKevDjQZ0sMbVASl2MeYlGDo1HDrjawqTSSrcdZ0u1LBmIMBljmSmp6WiuI+ryl9Ce5L16dy7fj+ObeDrZyKdrR2J4vn9WnP7fH/JVvbuwZ5vaxgENiuVF40GoZvzPFvIFEd600He4TjwttFBSAzWwWW9zH99KylU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410549; c=relaxed/simple;
	bh=pCKVJKfsgqUTs8AS/FfeirHvz2C/Fw3t9KjvROqrw3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MIQWZ3JjkXadKM18CukFliLTdKNcKQeeaHO5KnW2KPAk+TqjHOsh2cNxuEvca2cj6gkt65wbtJpcjLVrb7Fog6FtnXqqPWbizHdWw4fanDYPCddvSJ0fY3osHaBG+BB+NxWT9plwnbL/t/zUspzHWYoCQgdbMYyMXz36vQmnfaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvS7iLe1; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvS7iLe1"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304d555293aso8094010eec.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 07:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780410546; cv=none;
        d=google.com; s=arc-20240605;
        b=BZMkXqgGmIkI3D07HeN0Vljz66Q9ZyG/szo9h/e7FpV+JdKAti7lM7t9bf4GekyEHE
         O+7KwyIX8HrCzeH2fgVYW6llyLVscTxhVQ4pO2IYfdns+QGT/Jl5wtyrsCOZBklZAnA/
         dNG4jvzuq1oy8/r0b3XPsq5dWcq/VrCXQSy9yNqrc6CW3o9kKdW1eSySOj/D28EFMf+1
         fwAoyNHGZVT2TT8rzTdS316aGE1uQLLK0Ux/A6gFdedvIfeic/ea/o1YeuM5VzmMbwK6
         uLerlWQUERrPNGygvwell7UvObmCdNbPzEZ5MacXJKMrwjtO+2cCLUWjbaQwVxfehDZO
         TZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kpwFh2a0/oyZBOiJkQQQ7Xbyt/Uy5rqSD9KPnvxrM2g=;
        fh=yzIKKmA8FKKEnP6AQyJuApeHw64jkG/BcAcScwH1/5Q=;
        b=g5pUDcga5MQrKO0ljhKElZ54DMeAzZNCe/db1un74bSGkVCEVilQ8cj1ZQFeCFJs2l
         E1MDikrdJnpxNoQcUMl5dk4lae/QfU8/k0fqPpDI32yT9k9nrXyBR5ic+z6E+SZTno/Y
         eFVtnQOYLOTiuDUbRsPkS1PjoPXYnK57yaQsDfFnBsICP+YsiRvQgcxWmbBO/AlidaeS
         XXFa5tH/D7hF0AKPTmPm6i5ORz1siEjIAnDWU3efVjFUiqIsLh3S57aR5fCa5/sgx+Jk
         wZ8CDVk1uq4CCU+bHTWYK7NHBw6kFUnAXa7+kluA/+CLt1xtJxf+mH8dvffpKsYSguyq
         dgww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780410546; x=1781015346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpwFh2a0/oyZBOiJkQQQ7Xbyt/Uy5rqSD9KPnvxrM2g=;
        b=kvS7iLe1ZbSh+crMCh2b6P4PeWiWpsgx0lXJ9O43NgaWrWKS6fDA2DCuzIp87sEdW9
         CPHvFZsR0HDubiu7jNp7l2eOf4yqTd80E2s9MBLklSajPIgseA4uRDM5DIhSCk4U+Yav
         Z/6RHb4UTq+/+fFpQSngOnNm/KywstoAyqIVxFd5HWgQDPhiDtN8RjFLup7+aQpgJ7Re
         9KYHzA3N0FbXVVZjZM6bqmpGKkTacMIIKPAyUQpEVOSZvKgDdq4/YCdjx9RA2hBL+x5b
         5WRIS8cU39OXH5JdzZWu52J9GE57edeqvNEwrL/IxXyywahr/nk2D4LVNRfCTgTxlhxU
         R7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410546; x=1781015346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kpwFh2a0/oyZBOiJkQQQ7Xbyt/Uy5rqSD9KPnvxrM2g=;
        b=BskWH47Tz635Qda4GHPwJe8T63fxPERwDxyrt8uGtfX5DDrFNeMFQcXJCqJFiHyMrQ
         2XYDowop2w8uVxcdtwOxC7rzXJwfc6R/W1NgmNnQ+57mIIvk+pQ03GnO8NXD9F8ebw1T
         g0jgsuoSfRLAzDfVXVk6e2JVcel5lQy07g4uub1p/8FeQNH3CkCkJTVykyu2HVwas7Xk
         F0gVSIELGHMhgcyDBqgpTyDEZGdMykFnZqcHXRpYmN9oYFfajj+UvGKqtGulECzYqFjA
         tpfhMIoqG6lf5rp6Bda8wUBB337rD9hhfUx0lqCms0louRvOfLzU1+nIjVefMVYLHLDy
         UEug==
X-Forwarded-Encrypted: i=1; AFNElJ8mACYJAXv2vlPpC/QA6vcCI0wybgGuFAQy9WgBzs2fFWyWzGwd/YCfYwmvzPiJbioibWYUjyGSHnpX@vger.kernel.org
X-Gm-Message-State: AOJu0YyTnTYOhpotjiv0CWjxTt6W+6GZ5E5r4wJh51cMGceUSkjxx4+p
	d3swo0Z3PSnzrapd8GtIH5y2qMLQ33YC37fyvGDUfQopRnH+lSV/EfWHkclCMhbL1F2qcku6TwA
	SjH5aHqV7U/j5JLROBvSTrnNYHNsD/Ss=
X-Gm-Gg: Acq92OF6t3UFyU3T+CbCRS89qUQD6hqqvwRKW/YpTGBzQM6zyEAP22PKU5bQmlSZlyJ
	dQWwAvZn2nyNIdeh8pIYbreWRi53QoK7sDNLWtijvpmoDcCjYPqG71KyTsHzqgakOQ8g8qAIVVe
	aeYgCHCpG37m6f/iRKK2Wq0AyKVXspCsyuaEPlHmCAYydG1ebbYJFPTdjnDaal0aAahGqPaNtBv
	Bg3FW0nlkmJJQKQ6ZjoSwPACf3ywvH1prIdJZXCQya0t5ZT6gBJC/safpJhlVvueEE5o644poKK
	BuIOr3LO5Y6ukVYbsD0=
X-Received: by 2002:a05:7301:1f0d:b0:304:e20e:f5c9 with SMTP id
 5a478bee46e88-304fa6ab9d9mr8316247eec.31.1780410546079; Tue, 02 Jun 2026
 07:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-6-clamor95@gmail.com>
 <20260602144640.433b4d35@jic23-huawei> <CAPVz0n1r97d8-uzhPGBx0LFSp75A3_2mMXDQQ30utT-6NtpHNA@mail.gmail.com>
 <20260602152019.078cc40e@jic23-huawei>
In-Reply-To: <20260602152019.078cc40e@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 17:28:54 +0300
X-Gm-Features: AVHnY4IAAmHJnZ7jdhhpGUMZSGLBbZqFDtuCT4UKpkopc5zewTxJykItA13TvMY
Message-ID: <CAPVz0n0D+97TqZD+003z40vGK_gtnNv5v8iGyc8NYekLdHg58A@mail.gmail.com>
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

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 17:20=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 2 Jun 2026 16:50:16 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > =D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 1=
6:46 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Mon,  1 Jun 2026 18:18:25 +0300
> > > Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > >
> > > > Since there are no users of this driver via platform data, remove t=
he
> > > > platform data support and switch to using Device Tree bindings.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > >
> > >
> > > > index 52136ca1abc9..55b35467a722 100644
> > > > --- a/drivers/iio/light/lm3533-als.c
> > > > +++ b/drivers/iio/light/lm3533-als.c
> > > > @@ -16,16 +16,19 @@
> > > >  #include <linux/module.h>
> > > >  #include <linux/mutex.h>
> > > >  #include <linux/mfd/core.h>
> > > > +#include <linux/mod_devicetable.h>
> > > >  #include <linux/platform_device.h>
> > > > +#include <linux/property.h>
> > > >  #include <linux/regmap.h>
> > > >  #include <linux/slab.h>
> > > >  #include <linux/uaccess.h>
> > > > +#include <linux/units.h>
> > > >
> > > >  #include <linux/mfd/lm3533.h>
> > > >
> > > >
> > > > -#define LM3533_ALS_RESISTOR_MIN                      1
> > > > -#define LM3533_ALS_RESISTOR_MAX                      127
> > > > +#define LM3533_ALS_RESISTOR_MIN                      1575
> > > > +#define LM3533_ALS_RESISTOR_MAX                      200000
> > > >  #define LM3533_ALS_CHANNEL_CURRENT_MAX               2
> > > >  #define LM3533_ALS_THRESH_MAX                        3
> > > >  #define LM3533_ALS_ZONE_MAX                  4
> > > > @@ -57,6 +60,9 @@ struct lm3533_als {
> > > >
> > > >       atomic_t zone;
> > > >       struct mutex thresh_mutex;
> > > > +
> > > > +     bool pwm_mode;
> > > > +     u32 r_select;
> > > >  };
> > > >
> > > >
> > > > @@ -411,7 +417,7 @@ static ssize_t show_thresh_either_en(struct dev=
ice *dev,
> > > >       int enable;
> > > >       int ret;
> > > >
> > > > -     if (als->irq) {
> > > > +     if (als->irq > 0) {
> > > >               ret =3D lm3533_als_get_int_mode(indio_dev, &enable);
> > > >               if (ret)
> > > >                       return ret;
> > > > @@ -716,30 +722,34 @@ static const struct attribute_group lm3533_al=
s_attribute_group =3D {
> > > >       .attrs =3D lm3533_als_attributes
> > > >  };
> > > >
> > > > -static int lm3533_als_setup(struct lm3533_als *als,
> > > > -                         const struct lm3533_als_platform_data *pd=
ata)
> > > > +static int lm3533_als_setup(struct lm3533_als *als)
> > > >  {
> > > >       struct device *dev =3D &als->pdev->dev;
> > > >       int ret;
> > > >
> > > > +     als->pwm_mode =3D device_property_read_bool(dev, "ti,pwm-mode=
");
> > > > +
> > > >       ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_AL=
S_CONF,
> > > >                                LM3533_ALS_INPUT_MODE_MASK,
> > > > -                              pdata->pwm_mode ? LM3533_ALS_INPUT_M=
ODE_MASK : 0);
> > > > +                              als->pwm_mode ? LM3533_ALS_INPUT_MOD=
E_MASK : 0);
> > > >       if (ret)
> > > >               return dev_err_probe(dev, ret, "failed to set input m=
ode %d\n",
> > > > -                                  pdata->pwm_mode);
> > > > -
> > > > +                                  als->pwm_mode);
> > > >
> > > >       /* ALS input is always high impedance in PWM-mode. */
> > > > -     if (!pdata->pwm_mode) {
> > > > -             if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
> > > > -                 pdata->r_select > LM3533_ALS_RESISTOR_MAX) {
> > > > -                     dev_err(&als->pdev->dev, "invalid resistor va=
lue\n");
> > > > -                     return -EINVAL;
> > > > -             }
> > > > +     if (!als->pwm_mode) {
> > > > +             ret =3D device_property_read_u32(dev, "ti,resistor-va=
lue-ohms",
> > > > +                                            &als->r_select);
> > > > +             if (ret)
> > > > +                     return dev_err_probe(dev, ret,
> > > > +                                          "failed to ger resistor =
value\n");
> > > > +
> > > > +             als->r_select =3D clamp(als->r_select, LM3533_ALS_RES=
ISTOR_MIN,
> > > > +                                   LM3533_ALS_RESISTOR_MAX);
> > >
> > > If we are getting garbage from DT I think I'd rather error out that p=
aper over
> > > that problem.  So similar to before, check valid value and if not fai=
l probe
> > > so that hopefully someone goes and fixes it!
> > >
> >
> > sure
> >
> > > > +             als->r_select =3D DIV_ROUND_UP(2 * MICRO, 10 * als->r=
_select);
> > > Why do we need this when we didn't before?  The range checks are the =
same
> > > so it smells like it shouldn't need transforming. I'd also rather we =
didn't do
> > > rewriting of the meaning of r_select like this.  Just use a local var=
iable for
> > > the intermediate result.
> > >
> >
> > before pdata passed resistor value as actual register value, not we
> > are getting the actual resistance in ohms from the tree and must
> > convert it into register value.
>
> ah. I missed the change of values.  Can you make them explicitly now _OHM=
S or something
> along those lines rather than reusing the macro name for a different thin=
g.
>

Acknowledged.

> >
> > > >
> > > >               ret =3D regmap_write(als->lm3533->regmap, LM3533_REG_=
ALS_RESISTOR_SELECT,
> > > > -                                pdata->r_select);
> > > > +                                als->r_select);
> > > >               if (ret)
> > > >                       return dev_err_probe(dev, ret, "failed to set=
 resistor\n");
>
