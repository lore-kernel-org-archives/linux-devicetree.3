Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1177429014
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791726808; cv=pass; b=P5UngTUC6X3d5EcGrONk+LQE2x9Mm3Fu+PWDkniKCHCWUhk2J3kXo2AM6hSgANey2rShPtGlybB1ue2/Dfy+rNHaLp3m8R3Q6revF7pudgJ/4AImu5MwniKumxs8or9Am69J1sL77jxCPLpwsTbNyxANH77KxpTCSOe0mZ0CepQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791726808; c=relaxed/simple;
	bh=+J5TAF/PMhzkq1pFiEhO8B/4yorJ6kRiJ4Xs8sDph6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DBl4774CUcK1uqxP+gR1VW/6O2e46k/5+kmsNTsgNfgYwr5OwwCPmQtU8cfJl4GhWJiC/kDjei7jERX6Mqpr2Q7wK87eFjU+TpNtFdUzuImWivbTR+Li93TGTsj3kzwciOPTekfXIkSEUv5mTq3rMcfBHyS+AHxQ927nIQ3Zso4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCUtyCdC; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCUtyCdC"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-354ba08cfd1so1999989eec.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 06:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791726806; cv=none;
        d=google.com; s=arc-20260327;
        b=rN+Uf0KovRocVodRfq7auPbA2XF/Krb+Br6cAJ0iXdRKBgOJ96bamD6EcSNkvvOCRK
         lQ1l0cLjD29GAbQHyPDnrIA06PB2ytmoD2sq45V8GhEC1FuWm8Jr7M1+MB+3jqP1o2pq
         MQFtVNJFOyIHFNE7pVzN8nlMqIHeO21D8hgBaM/YRijcV45jP8aFpS/wLK4uY7RkCZJ2
         U6QVBWSBtIh6dydCkooymFFt2xZfkT2EhiYGxk8eYmNFKe9lgTvijuWojY6ZUtJ2WtWZ
         W3KzzxBAYaQkW0FUpiRsIw48LgtsXkWYsvX+rKFMlYToNvEkalw6lb/YRpd2mh5HscAH
         BZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o40FtQbyPEZWv/i/4tebVask9tQiIU9thNUyzitDfqs=;
        fh=x4GYrQqhiGWvjBkZJqOiSKBuHUwYjqXMGrBKcvzQIQw=;
        b=Qe4BNwZiy9xp4kCr3GyS4rkwpkzEe+WPaNsmOkEY0oucwdGbLgXon7KCyD9J9HodLn
         TuSphMrPU+UUOr/loEjBbt0PomgFzKjqJ67bC2+B7MSkOEwEvegPl5awdauJmk0c/qK6
         LtQ0pmsqPOqn8gRd/CAl2dG5t0l1dOSjg2wR+F959b/mnjNZjwJlH1iC0SZ+qmjSQpW8
         w1Rcvnmz/l+m3GKysTBIT0gc8h+XDaQI+jBaJ/Wd14YlI/rPXK6BjDJJBN6nNcIj/qlS
         4kVRDpEev0AeAND8XA00HRG+CMU6YWVSHp78qNEC0lgoRjoNVT3fbfMURKczB3Aq1Jj3
         6y/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791726806; x=1792331606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o40FtQbyPEZWv/i/4tebVask9tQiIU9thNUyzitDfqs=;
        b=QCUtyCdCwhuAzDd/k4A9IzVH72AOoYCGi/bNd9IxRBXSUWr8Iz+A4US+eGj4S6Zi0i
         Ly1lIBx8EMt6zE85XjTxVZjhpHrn6ghzDGEfY/YEc18ProxQKd79MHBX+NwvFp//mZ1o
         qRoDqf0o+zPI2ifxel/jfuJBNROwoMk+evfl3YMI+eA0quk8vyui6xjH0v2jfD94cRef
         hj1bXcApSKwBVkncaH0Ck7nlZSfsiu13svlptyAbJYIsJ0ruGjrL7aTZL/jJ6zR4TZKn
         mk5BLIaGFSS9Ff3Lf5RMvIATAgx4xvZJTqu8d/NGj9U2/AChEYjb+wtSOPXqriTTby8T
         gr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791726806; x=1792331606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o40FtQbyPEZWv/i/4tebVask9tQiIU9thNUyzitDfqs=;
        b=TW7Mfe57pDiTrngF3PV0+Mtiayq3n8xN18vWeacopngugjwnVxL0EA2wi+9SDXxhcC
         V4av/B7UvwkAvWa4SNIrWpHQT0jwHiow1H92MQLHJPjVcOtHd6+lXmYDA3gFSTvcHa9x
         6SqueyMlP2vw1n2zkxENTRBIBroexaLlpRI8ekgjSQY7Y5E2mkF2bIsBuo4rhdfqn3cW
         X38hRFMM3YKGqM8Gc6JW+pGhZazR6grbR02b/3tNxUH97Cv1GFISs8lrtdW3slvd5np6
         N2+EpyLtpxE2iMcznO5W49LTA9ncE6kDO234EquUGqLQyluK8ML19lx7bDi37QrEo/r7
         sWEw==
X-Forwarded-Encrypted: i=1; AKwUvByOBN27GJtfb9as/VCVXweJUJ5/WFLoLvjsrnjPzvKWjHW9JdkcvL/+DQjSF6uhn+UTNDtTqldQd24g@vger.kernel.org
X-Gm-Message-State: AFq9FYIFNA6E1mmuzBRca4gixTgcELS0WpTE8DN5GiAp5DOIliCkzTeI
	FIylkZ22c3+mnvEQzs2eN7QVHAcMciWD3ANTPYzaOOKYL619WHbo6fOVRY46qGNasjBceiawO64
	aJnk3xNPMMXC6xh7tZvFtS1BRyyANb7k=
X-Gm-Gg: AYBFou1Bhb4hwLxz49BKeoZ7AiiQRKePnOXtl+go/nVmpBZYUC+PPYVyTfot4JJSiU8
	Ca0KP7U3EXm6oMkxMlOex9VhhAFaWQIWER7XgLP/o1wihEJX0lWYqgSzl3idRg4ShXQQGZGHq4K
	2scCbLlgIjcfKe1Mgg+NYpNRVPbz2dBhHRaBzAykuryCI+gVCY4P8q3MkkdN/ubzCYHE5Q88o5e
	Vak3JewDVL7uibj84cTBJjRI1lmjUG4kV1Nr/k5JjKdTUXg4JYCjamzZ8NRXQUKMzqRPAXOE2EM
	IT3d97+vFz7fZSYJCWpLlgFeohwrxmX7GILLSmuIGeXKGN10+QD1wOHcijE53QDu/5hVM8AP6t6
	rrt1pQC/DNSwuEQ==
X-Received: by 2002:a05:7301:2603:b0:357:ee29:f26b with SMTP id
 5a478bee46e88-357ee29f829mr7662575eec.35.1791726805858; Sun, 11 Oct 2026
 06:53:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007085457.98762-1-clamor95@gmail.com> <20261007085457.98762-4-clamor95@gmail.com>
 <5af976ef-6c6d-451f-891f-bc70dd2e8c00@gmail.com>
In-Reply-To: <5af976ef-6c6d-451f-891f-bc70dd2e8c00@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 11 Oct 2026 16:53:14 +0300
X-Gm-Features: AclHuK_cL2EWmtIMQIhuN84cy3C23mZ8qmT5nBamt5hX-SEzXZhLrLa4TJnduXo
Message-ID: <CAPVz0n3vJXrQrfKvykrCyiSSiET18qos=isWcfg0fp_tGMUK3g@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] leds: aat1290: Add support for AAT1270 Current
 Regulator for Flash LEDs
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:2=
6 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> > The AAT1270 is quite similar to the AAT1290, but it does not support th=
e
> > Advanced Simple Serial Control (AS2C) used in the AAT1290. The AAT1270
> > uses an earlier version of AS2C, namely Simple Serial Control, which la=
cks
> > address-sending capabilities.
> >
> > Differentiate the chips by using a description structure with a flag to
> > indicate if AS2C is supported, placing all AS2C-only features under a
> > conditional check.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >   drivers/leds/flash/leds-aat1290.c | 66 ++++++++++++++++++++++--------=
-
> >   1 file changed, 47 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/leds/flash/leds-aat1290.c b/drivers/leds/flash/led=
s-aat1290.c
> > index 49251cfd33509..773cdcc73a9e1 100644
> > --- a/drivers/leds/flash/leds-aat1290.c
> > +++ b/drivers/leds/flash/leds-aat1290.c
> > @@ -43,9 +43,6 @@
> >   #define AAT1290_FLASH_TM_NUM_LEVELS 16
> >   #define AAT1290_MM_CURRENT_SCALE_SIZE       15
> >
> > -#define AAT1290_NAME                 "aat1290"
> > -
> > -
> >   struct aat1290_led_config_data {
> >       /* maximum LED current in movie mode */
> >       u32 max_mm_current;
> > @@ -59,6 +56,13 @@ struct aat1290_led_config_data {
> >       enum led_brightness max_brightness;
> >   };
> >
> > +struct aat1290_led_chip_info {
> > +     /* led controller name */
> > +     const char *name;
> > +     /* Advanced Simple Serial Control support */
> > +     bool as2c;
> > +};
> > +
> >   struct aat1290_led {
> >       /* platform device data */
> >       struct platform_device *pdev;
> > @@ -74,6 +78,10 @@ struct aat1290_led {
> >       struct gpio_desc *gpio_fl_en;
> >       /* EN|SET pin  */
> >       struct gpio_desc *gpio_en_set;
> > +
> > +     /* led controller description */
> > +     const struct aat1290_led_chip_info *info;
> > +
> >       /* movie mode current scale */
> >       int *mm_current_scale;
> >       /* device mode */
> > @@ -101,15 +109,17 @@ static void aat1290_as2cwire_write(struct aat1290=
_led *led, int addr, int value)
> >
> >       udelay(AAT1290_FLEN_OFF_DELAY_TIME_US);
> >
> > -     /* write address */
> > -     for (i =3D 0; i < addr; ++i) {
> > -             udelay(AAT1290_EN_SET_TICK_TIME_US);
> > -             gpiod_direction_output(led->gpio_en_set, 0);
> > -             udelay(AAT1290_EN_SET_TICK_TIME_US);
> > -             gpiod_direction_output(led->gpio_en_set, 1);
> > -     }
> > +     if (led->info->as2c) {
> > +             /* write address */
> > +             for (i =3D 0; i < addr; ++i) {
> > +                     udelay(AAT1290_EN_SET_TICK_TIME_US);
> > +                     gpiod_direction_output(led->gpio_en_set, 0);
> > +                     udelay(AAT1290_EN_SET_TICK_TIME_US);
> > +                     gpiod_direction_output(led->gpio_en_set, 1);
> > +             }
> >
> > -     usleep_range(AAT1290_LATCH_TIME_MIN_US, AAT1290_LATCH_TIME_MAX_US=
);
> > +             usleep_range(AAT1290_LATCH_TIME_MIN_US, AAT1290_LATCH_TIM=
E_MAX_US);
> > +     }
> >
> >       /* write data */
> >       for (i =3D 0; i < value; ++i) {
> > @@ -150,16 +160,18 @@ static int aat1290_led_brightness_set(struct led_=
classdev *led_cdev,
> >               led->movie_mode =3D false;
> >       } else {
> >               if (!led->movie_mode) {
> > -                     aat1290_as2cwire_write(led,
> > -                             AAT1290_MM_CURRENT_RATIO_ADDR,
> > -                             AAT1290_MM_TO_FL_1_92);
> > +                     if (led->info->as2c)
> > +                             aat1290_as2cwire_write(led,
> > +                                     AAT1290_MM_CURRENT_RATIO_ADDR,
> > +                                     AAT1290_MM_TO_FL_1_92);
>
> In AAT1270 the Maximum Movie to Flash Mode Current Ratio is constant
> and set to 1/7.3, whereas for AAT1290 we alter it to 1/1.92 here.
>
> This is taken into account while calculating max_mm_current in
> init_mm_current_scale(), where AAT1290_MAX_MM_CURRENT definition is
> used, which is based on AAT1290_MM_TO_FL_RATIO (1000 / 1920).
>
> Obviously it would have to be changed to 1000 / 7300 for AAT1270,
> for the calculations between brightness levels and microamperes for
> V4L2 Flash interface to work properly for this controller.
>
> >                       led->movie_mode =3D true;
> >               }
> >
> >               aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CURRENT_AD=
DR,
> >                               AAT1290_MAX_MM_CURR_PERCENT_0 - brightnes=
s);
> > -             aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CONFIG_ADD=
R,
> > -                             AAT1290_MOVIE_MODE_ON);
> > +             if (led->info->as2c)
> > +                     aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CO=
NFIG_ADDR,
> > +                                            AAT1290_MOVIE_MODE_ON);
> >       }
> >
> >       mutex_unlock(&led->lock);
> > @@ -178,7 +190,8 @@ static int aat1290_led_flash_strobe_set(struct led_=
classdev_flash *fled_cdev,
> >       mutex_lock(&led->lock);
> >
> >       if (state) {
> > -             aat1290_set_flash_safety_timer(led, timeout->val);
> > +             if (led->info->as2c)
> > +                     aat1290_set_flash_safety_timer(led, timeout->val)=
;
>
> AAT1290 has the capability of setting flash safety timer timeout, not
> like AAT1270, for which this is controlled solely by the discrete
> elements, basing on the formula T =3D 21.5s/=C2=B5F =C2=B7 CT. This needs=
 to be
> reflected both in the DT bindings and in the
> aat1290_init_flash_timeout(), where the minimum value should be also
> fixed for AAT1270.
>

Thank you for both explanations. I will take then into account while
submitting v2.

>
> >               gpiod_direction_output(led->gpio_fl_en, 1);
> >       } else {
> >               gpiod_direction_output(led->gpio_fl_en, 0);
> > @@ -475,6 +488,10 @@ static int aat1290_led_probe(struct platform_devic=
e *pdev)
> >       fled_cdev->ops =3D &flash_ops;
> >       led_cdev =3D &fled_cdev->led_cdev;
> >
> > +     led->info =3D device_get_match_data(dev);
> > +     if (!led->info)
> > +             return -ENODEV;
> > +
> >       ret =3D aat1290_led_get_configuration(led, &led_cfg, &sub_node);
> >       if (ret < 0)
> >               return ret;
> > @@ -489,7 +506,7 @@ static int aat1290_led_probe(struct platform_device=
 *pdev)
> >       aat1290_init_flash_timeout(led, &led_cfg);
> >
> >       init_data.fwnode =3D of_fwnode_handle(sub_node);
> > -     init_data.devicename =3D AAT1290_NAME;
> > +     init_data.devicename =3D led->info->name;
> >
> >       /* Register LED Flash class device */
> >       ret =3D led_classdev_flash_register_ext(&pdev->dev, fled_cdev,
> > @@ -528,8 +545,19 @@ static void aat1290_led_remove(struct platform_dev=
ice *pdev)
> >       mutex_destroy(&led->lock);
> >   }
> >
> > +static const struct aat1290_led_chip_info aat1290_info =3D {
> > +     .name =3D "aat1290",
> > +     .as2c =3D true,
> > +};
> > +
> > +static const struct aat1290_led_chip_info aat1270_info =3D {
> > +     .name =3D "aat1270",
> > +     .as2c =3D false,
> > +};
> > +
> >   static const struct of_device_id aat1290_led_dt_match[] =3D {
> > -     { .compatible =3D "skyworks,aat1290" },
> > +     { .compatible =3D "skyworks,aat1290", .data =3D &aat1290_info },
> > +     { .compatible =3D "skyworks,aat1270", .data =3D &aat1270_info },
> >       {},
> >   };
> >   MODULE_DEVICE_TABLE(of, aat1290_led_dt_match);
>
> --
> Best regards,
> Jacek Anaszewski
>
