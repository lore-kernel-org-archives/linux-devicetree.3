Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A0F3FB07A
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456424; cv=none; b=l0qaIovXy8un1X1sMNywXCyV5bzx+9EDAZZ3f5yshX4NO/SUWIAHlcNHc6dm5grzVEKmOt7JpivjKrDiHH0zzzajmR8ZOgZHB2LSfUwTO+/lVyCCAFQQMBNWdszmA79nJIlcmocUkeXc3eTax4x7EOavNzDENAEJEWtRCDd4/Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456424; c=relaxed/simple;
	bh=h0O2cYoRVNJWzf+TBUudwD+89c3pM+LYikcFSp4MzJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M078BiVrceK2MiKaNOUiLQsjybRiY0K7hJ2ahuAxhQ7Vq2hzFWbIozsFubiwjKitYdQd+O8Kjeb01She0ICX4+umBMi/VZbuPXgzOeTLmyDddJ4H3UyJQ2z1+7Xbp9DhINNJRpkVXUhLZsQlMZgYCyn5afa4/hF/eKUilvDo0/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-649278a69c5so53591d50.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456415; x=1775061215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8us9FMf4Ix2FjVhaTc55RnFnYiTbZ7h6aPgiDRplAFk=;
        b=kCtq4BiXHI1mE0ATq1yyrXjrS+zf+XKLaiYuQpWgEu70LnPzXiGLDLLxrnAHUbAWBW
         HJ6pXA6SZH1pYqRiv87UaUt95aGH9UBOEK/Zs94LN+t812DX+0rtTDRxbRCNqgoAOs79
         CNGlLu9nkX0g+iQ5YKxW4Q1RGR++g/5SyWHAURPhmt3TNwhAod5TU8/L4FMZfYeX8DeY
         fUQIkxhLPAeBQEkmy60q/qoLygTXvXb13LmY9ZpiP8JEk9DA9Bdxr+idjdw9NYx1V8y9
         6lNx+/GdvvKPW5lwkT/M5p8fE51q2Xs2RjdlKxMmU+6FguY/t7xevFsch3g1H79edGlj
         uggw==
X-Forwarded-Encrypted: i=1; AJvYcCXOYg0jUyBM6Nr124ZORxAG9yw69bucS7zb/HOY+v+Y3IetDgkRQIUyY8XbNG8k6+RH9R31X6YxQ+y/@vger.kernel.org
X-Gm-Message-State: AOJu0YyuGym/T5lg/RKn8mB86g7cB0CzhL+LYflKDYfkxidIyMw/Qsnf
	xaQKlSkSRI6feE/y+hz4OvpYUpX/Agf0LcttS3+8zVO08/VZYtNHRNdD0AZEpn4W
X-Gm-Gg: ATEYQzxcoR3S7KJgSgEjc3pvfQd9DNHmxbM2Su+6ubjz2iknQ+HRRo4r5ADy34Cl0LU
	yK57P8kIJUs5G+2Usgfask5W6Qj07iQr7hEMx3dy0xs3aBHOOlvgJ5IiuVV1EGQLr64AYL9xfET
	S/3wJGnqbCBuFlKucdIcNHXkn3zmtH2Ed1MC23gEE3YwFgMGl7DMwhm37wt/y7A7bj2AheRxhkn
	LocC2OTN60M7H3FS8xpWn7V2eW1rO5OdRjDGRROBunekwfhlFx+nr4SQ5iWJrH5jccp8CHz9yz+
	yPcP5kzriwHBLQj3pQhOUSTnrVKesPZTTMLguWplPXKuGD1/62O4OTPzy7n369ddHXpAt/jKqPI
	MSDCqzR0+3ySHjwpqZ18cJ3Jv3he2ubr1PbfLF/ofIGc5Xm8IcBcgE9VUH5qdDQH6SakCF5BBY0
	VNE3vBUrec/Ayn+rCC8VMY/iWba5x+7wff7a/4tKCXeXdTHTUtM/Jq4v16EeYcOwVIGlS24oKoG
	pPTZKPpn77eG5ccO2mgOTcJ17ExJk8j62J044gO+PSOfGfJ4ozx
X-Received: by 2002:a05:690e:1517:b0:64c:f929:7489 with SMTP id 956f58d0204a3-64ee6091275mr3922630d50.22.1774456415016;
        Wed, 25 Mar 2026 09:33:35 -0700 (PDT)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com. [74.125.224.46])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64ef6c0ffefsm200628d50.15.2026.03.25.09.33.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:33:34 -0700 (PDT)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ad46a44easo77963d50.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:33:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrrnCDTgHhkzZaPurOwKJo4BWzLnoVpDJjNGTgzvzUyhniMCUmLS9I+/h+HcKAk3ehSYV8WIZQY6qy@vger.kernel.org
X-Received: by 2002:a05:690e:1286:b0:64c:a09f:12ab with SMTP id
 956f58d0204a3-64ee60a15f8mr3833496d50.30.1774456414053; Wed, 25 Mar 2026
 09:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325063254.18062-1-email@sirat.me> <20260325063254.18062-3-email@sirat.me>
 <20260325144719.00005a92@huawei.com>
In-Reply-To: <20260325144719.00005a92@huawei.com>
From: Sirat <email@sirat.me>
Date: Wed, 25 Mar 2026 22:33:22 +0600
X-Gmail-Original-Message-ID: <CANn+LW+tLc2sQwfknieUi1pCat0+HQWrCFN0WTJ4rC_7_qFGpQ@mail.gmail.com>
X-Gm-Features: AQROBzDyk3XrETGSBpjycQrkM6of18Z8KC1GFbAqmc5msBHz6MbZdMnXNCjnOgQ
Message-ID: <CANn+LW+tLc2sQwfknieUi1pCat0+HQWrCFN0WTJ4rC_7_qFGpQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] iio: proximity: add driver for ST VL53L1X ToF sensor
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 8:47=E2=80=AFPM Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Wed, 25 Mar 2026 12:32:23 +0600
> Siratul Islam <email@sirat.me> wrote:
>
> > Add support for the STMicroelectronics VL53L1X Time-of-Flight
> > ranging sensor with I2C interface.
> >
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Siratul Islam <email@sirat.me>
>
> Hi Siratul,
>
> I used this as a bit of an experiment as you'd +CC lkml and took a close
> read of the feedback google's AI bot produced.
> https://sashiko.dev/#/patchset/20260325063254.18062-1-email%40sirat.me
>
> Be very careful when considering the output. There are some things
> in here that are not true, or we don't generally defend against (like the
> interrupt type related comments).
>
> The iio_trigger_get() is (I think) a more general problem so ignore that
> for your driver - will just be a tiny memory leak and stop the
> module being easily unloaded.  I'll take a look at that one on a more gen=
eral
> basis.
>
> The regmap one is where these bots excel in that they sometimes go deeper
> in analysis than a typical person focused on one driver.
>
> The stuff on using standard devm_ wasn't from the bot and I think will ma=
ke
> things rather simpler.
>
> Thanks,
>
> Jonathan
>
>
> > ---
> >  MAINTAINERS                         |   1 +
> >  drivers/iio/proximity/Kconfig       |  15 +
> >  drivers/iio/proximity/Makefile      |   1 +
> >  drivers/iio/proximity/vl53l1x-i2c.c | 795 ++++++++++++++++++++++++++++
> >  4 files changed, 812 insertions(+)
> >  create mode 100644 drivers/iio/proximity/vl53l1x-i2c.c
> >
>
> > diff --git a/drivers/iio/proximity/vl53l1x-i2c.c b/drivers/iio/proximit=
y/vl53l1x-i2c.c
> > new file mode 100644
> > index 000000000000..085bff04f5d9
> > --- /dev/null
> > +++ b/drivers/iio/proximity/vl53l1x-i2c.c
...
> > +
> > +static int vl53l1x_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct vl53l1x_data *data;
> > +     struct iio_dev *indio_dev;
> > +     int ret;
> > +
> > +     if (!i2c_check_functionality(client->adapter,
> > +                                  I2C_FUNC_SMBUS_READ_I2C_BLOCK |
> > +                                  I2C_FUNC_SMBUS_BYTE_DATA))
> Sashiko had an interesting comment on this...
> https://sashiko.dev/#/patchset/20260325063254.18062-1-email%40sirat.me
> (note in general be careful with this tools feedback, it has a significan=
t
> false positive rate!)
>
> "Does this check needlessly reject pure I2C adapters?
> The driver configures regmap with reg_bits =3D 16, which forces regmap to=
 use
> raw I2C transfers requiring I2C_FUNC_I2C. Checking for SMBUS_READ_I2C_BLO=
CK
> might prevent the driver from loading on pure I2C adapters that can perfe=
ctly
> support the device via regmap."
>
> By by reading the comment is actually wrong, however... It did made me lo=
ok.
> With regbits =3D=3D 16 & valbits =3D=3D 8
> The regmap code checks for I2C_FUNC_SMBUS_I2C_BLOCK
> (and if not present fails).
>
> So the I2C_FUNC_SMBUS_BYTE_DATA seems unused and
> a broader check on both read and write versions of I2C_BLOCK seems
> appropriate.
>
> However, not a lot of point in checking it at all given regmap does
> so for us. So I'd drop this check.
>
> If anyone is bored, we should probably take a look to see if there
> are other redundant (or wrong) calls for this.
>
> There is another point about trigger references that might be
> correct (but not unique to this driver so ignore it).  That warrants
> some investigation - I'll take a look in near future.
>
I will drop the check altogether here then.
...
> > +     /*
> > +      * XSHUT held low puts the chip in hardware standby. All register
> > +      * state is lost on de-assert so this is functionally a reset.
> > +      */
> > +     data->xshut_reset =3D devm_reset_control_get_optional_exclusive(d=
ev, NULL);
>
> If you can switch to devm_regulator_get_enabled() this can I think be
>         ret =3D devm_reset_control_get_optional_exclusive_deasserted()
> removing the need to register the action to power off.
>
> If you do that remember we still need the sleep after this call.
>
So I will move the sleep after
devm_reset_control_get_optional_exclusive_deasserted() then.
>
>
Thanks for the detailed review, Jonathan!

A quick question. Since these are some small  fixes, mostly removals,
and the patch has seen quite some revisions, does the 1 week wait rule
still apply here? I am still getting used to this mailing workflow
coming from the PR workflow of Github and it will help me in the
future.

Thanks
Sirat
