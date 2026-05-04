Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285DD3446A3
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777884142; cv=pass; b=qLR4a5cOkiBgEx01w938v78sU/jFLaEJ9yJMB7pI2OOcTbtfp16C1mHzhGD6lbzdwhxRSzzgBAcRVn61kRaVOWGWUeBCg4psOysDDIbXCEoi/qK2JpjnGLDAuAA8ZDPT4/e/OCEY5pLXa7pmDFbkW5jvl7YHuZYJRB6/9TirFmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777884142; c=relaxed/simple;
	bh=KtsmeUKYkIPz/dzpTRK71JXtP4IvSLWLXoCLP5MTM6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPBmNJ1+LVEBtr7soRq1VUhMU13ls23RXodxor3Qc12fMBnvjIRjfwncgr4NfwlGJB23Gwhu/TcYS30NHRu8laHtSYS5JUU6s9PjMCvayn1Aov7xNZ1uv7FVZFB1bOkClVKbXULP3/rij0siZTjSzS00Db6PiOcCC5GT5UsY7ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpEufBEa; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpEufBEa"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c8ccc7755so5375105c88.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777884139; cv=none;
        d=google.com; s=arc-20240605;
        b=SqMJK2MV0PhG19BKRD82KPp/h3C5PcuUkEq/jxvh1ZXQnSm7w6MGB/txo5aLK4lw8A
         23bXTPQo+i9C5cDfJVGBoL5Gvgg0bq4t061NMXQFX7PLQUEdG2qZhn7rkam2lsZhpPCk
         NfcZPS3FZMUMd6+0peCwqFSEm+CAliTFznBSjXo359ON427Ppe5sfyKbTehap4iDyAYw
         cTR3zDbqXtkyIdm6aF7SbMLYBrYtwAvAbb6leXNVWWnn0b2qlpP9keh6INys9NmJFs7a
         o1J5kSTHrhEMGLf5x1FDfszjb5LJR3jAvIYBafzzCgwjBi+2tJq5y9KLN2hGGdgyRF+0
         EmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lt9Pa5uLmijVVb/49YpepAnifC7UOJ+x6oS9z06sHeQ=;
        fh=r//TX00TuqATH5ogcm53SHzyatZBfb/XAipoBGx9Uls=;
        b=J9b0Hvr8hptXW2RL5c64U/S/Jh54lu4HkeiCnz5AbYpnhDn93QueSn61lQvdLVSU6l
         U6XtitOTnGgrtJahmdQ6yHHz4gaFB21ZUHxQZHBuM40VHCARUGf5GabussQ8kleVE2Ii
         14jkqs7h9b3lDnzIdVqF9mgpYDpJhY14S0QN737ZLl5s2qsBUTFqvGo36XmECTzogLUE
         Z58T7eEmvmUmsgWfn6ZrNmSlhX87lm7PPOID79WRAovkknjpTzljphXNZHA6qI7V/HEA
         D9RZBJm6L5iUB7GflQa3ApGUNeXcFKBqcOTvz+Gipm95tcXAPST7aWiyrAhehINBuifQ
         +AZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777884139; x=1778488939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lt9Pa5uLmijVVb/49YpepAnifC7UOJ+x6oS9z06sHeQ=;
        b=BpEufBEa0gxIJ3YZtgg4EeHRnDLKLLsTiKB8JorR8CVfaIKJJIuRd+qE4ws4ZPCpw6
         fMKBDT3NuVc9+KNliTmDhyNjwfROvlMEnCWwpYZ0yhQK/lJU0+sHEATEgveqIAwZoq0d
         Cup+yXh81DAWx9l7dKinKtGmQ+OYi9iL0+ydi+k1bcKgpRri0RbHwoMBYFLm1D+nuQKE
         +vxzRRam0MLBlo2lxh95TIjSHokrPYU9vq7f3Ob3+Exenow3nOaiTrwT7RNmoykpTy2m
         g0Gq7pConSSCQ3h7aZFNXb8XmIelWjgOGg5vaiO8U4DnfXHEQDVux7fOAz8Q7im0nnIu
         7+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777884139; x=1778488939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lt9Pa5uLmijVVb/49YpepAnifC7UOJ+x6oS9z06sHeQ=;
        b=aHlS3o73WHyK/q5CWhroglYrcWpsRGp3vF72od3sNAmpqeYj+gvMGr7RtHLC/y66gl
         b9IlHeTIy4TMKOndtmfzbkO4KwGr8alQOLMiK2sZgn7a7AFsQWmFWzKNa2pRPr6a9Fki
         m+DELebBgsH1CAP0mdybVyjrjJC3QivcmL7ga8R8qM8Ew1F96aSa7kTVLaJJYZtySGoN
         HwUzjBC1Kyp6Fzb4paPfRYLnmyh1pSCTZiaW/rJW2wE9Au95AMv7UYajftdUAiLL5Oco
         mBPxk/kw9PGc8QJmDLDAmD/a7dcBbIeu6hmK6O79DVRFL4Cb3wr+mULvxkJzPXLkE2yT
         aRkw==
X-Forwarded-Encrypted: i=1; AFNElJ+bk+cD7HK5Atdfe/3FYFF64k0SlxDbwzYnWrm7ZwAxfjRF01sHOeJGdcSSlzsyyTFMJ/2/eJWlOQTo@vger.kernel.org
X-Gm-Message-State: AOJu0YxYsH/0u5Sx9+w584FsCn0UFKO6omM5uyveKuONgHfiVcORhRWY
	zg5p5D74R+rD4qwy0nm3jXQOaB2PzO7dbtlSsAQnXMCD+iISmuKFvf2RdOcNZRjvMwHTll3Ww5r
	FPa9Mo/oQm9U4uBye9stTtHZqDa+nd68=
X-Gm-Gg: AeBDievNqGZneFJBcBbl98FxVVMS2RwN2lF3W/f68Hn0ngMTuWJ4SgyxAl6fHRfNwFy
	FbskfdNaYaFAEc+1ySYsDvTof+o0njqM8dJbPROxt/X40tuyGWv1SyX3wb65Fqz80kf//JUYMdC
	2oQPVY4vKZg5bOUjCWnCfisbo2pa9rt/MwzxLdultV6OmeX12YadnvfdlWLRzyzrI/xLgGc2pB5
	pPuUKOiuYktRKj8NPQMe+Zx2oSP+MOP5LeMGx115FzS3mPzlAICsPjjTo5WGIBBmqmDtssTvbHq
	OEVUfVerTn4o32PJM+U=
X-Received: by 2002:a05:7300:2309:b0:2de:cc07:e83 with SMTP id
 5a478bee46e88-2efb85b6ed5mr3716374eec.15.1777884139070; Mon, 04 May 2026
 01:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503164445.215540-1-clamor95@gmail.com> <20260503164445.215540-5-clamor95@gmail.com>
 <afg-Xl7A7E0qowHR@kekkonen.localdomain> <CAPVz0n0YwUZ0TPSQV-Yb_4e7Di12ZWPVaKdde1v+7gHtWT1nuQ@mail.gmail.com>
 <afhUAYVWkJ4OiH8B@kekkonen.localdomain>
In-Reply-To: <afhUAYVWkJ4OiH8B@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 4 May 2026 11:42:06 +0300
X-Gm-Features: AVHnY4J3R6H0SFxZvW4oWGRlIBhGAXSs9pYoXKjMlQlFezHbozaclppx-zLVCj0
Message-ID: <CAPVz0n36nxOdec8NxX6Xyj0r3dHi1wun=LpM9hDavwEZtR=dSQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] media: i2c: lm3560: Convert to use OF bindings
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 4 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:08=
 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, May 04, 2026 at 10:40:11AM +0300, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 4 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 0=
9:36 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Hi Svyatoslav,
> > >
> > > On Sun, May 03, 2026 at 07:44:43PM +0300, Svyatoslav Ryhel wrote:
> > > > Since there are no users of this driver via platform data, remove t=
he
> > > > platform data support and switch to using Device Tree bindings.
> > > >
> > > > Converting to Device Tree assumes dynamic and independent registrat=
ion of
> > > > LEDs. To monitor the configured LEDs, a bitmap has been added. This=
 makes
> > > > LED cleanup more robust and less context dependent.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/media/i2c/lm3560.c | 143 ++++++++++++++++++++++++++-------=
----
> > > >  include/media/i2c/lm3560.h |  15 ----
> > > >  2 files changed, 102 insertions(+), 56 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.=
c
> > > > index 5b568ed9536b..ce4b09d1f208 100644
> > > > --- a/drivers/media/i2c/lm3560.c
> > > > +++ b/drivers/media/i2c/lm3560.c
> > > > @@ -9,11 +9,15 @@
> > > >   *                   Ldd-Mlp <ldd-mlp@list.ti.com>
> > > >   */
> > > >
> > > > +#include <linux/bitmap.h>
> > > >  #include <linux/delay.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/i2c.h>
> > > >  #include <linux/slab.h>
> > > > +#include <linux/mod_devicetable.h>
> > > >  #include <linux/mutex.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/property.h>
> > > >  #include <linux/regmap.h>
> > > >  #include <linux/videodev2.h>
> > > >  #include <media/i2c/lm3560.h>
> > > > @@ -43,22 +47,33 @@ enum led_enable {
> > > >   * struct lm3560_flash
> > > >   *
> > > >   * @dev: pointer to &struct device
> > > > - * @pdata: platform data
> > > >   * @regmap: reg. map for i2c
> > > >   * @lock: muxtex for serial access.
> > > >   * @led_mode: V4L2 LED mode
> > > >   * @ctrls_led: V4L2 controls
> > > >   * @subdev_led: V4L2 subdev
> > > > + * @led_id: LED status holder
> > > > + * @peak: peak current
> > > > + * @max_flash_timeout: flash timeout
> > > > + * @max_flash_brt: flash mode led brightness
> > > > + * @max_torch_brt: torch mode led brightness
> > > >   */
> > > >  struct lm3560_flash {
> > > >       struct device *dev;
> > > > -     struct lm3560_platform_data *pdata;
> > > >       struct regmap *regmap;
> > > >       struct mutex lock;
> > > >
> > > >       enum v4l2_flash_led_mode led_mode;
> > > >       struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
> > > >       struct v4l2_subdev subdev_led[LM3560_LED_MAX];
> > > > +
> > > > +     DECLARE_BITMAP(led_id, LM3560_LED_MAX);
> > > > +
> > > > +     enum lm3560_peak_current peak;
> > > > +     u32 max_flash_timeout;
> > > > +
> > > > +     u32 max_flash_brt[LM3560_LED_MAX];
> > > > +     u32 max_torch_brt[LM3560_LED_MAX];
> > > >  };
> > > >
> > > >  #define to_lm3560_flash(_ctrl, _no)  \
> > > > @@ -269,8 +284,8 @@ static int lm3560_init_controls(struct lm3560_f=
lash *flash,
> > > >                               enum lm3560_led_id led_no)
> > > >  {
> > > >       struct v4l2_ctrl *fault;
> > > > -     u32 max_flash_brt =3D flash->pdata->max_flash_brt[led_no];
> > > > -     u32 max_torch_brt =3D flash->pdata->max_torch_brt[led_no];
> > > > +     u32 max_flash_brt =3D flash->max_flash_brt[led_no];
> > > > +     u32 max_torch_brt =3D flash->max_torch_brt[led_no];
> > > >       struct v4l2_ctrl_handler *hdl =3D &flash->ctrls_led[led_no];
> > > >       const struct v4l2_ctrl_ops *ops =3D &lm3560_led_ctrl_ops[led_=
no];
> > > >
> > > > @@ -295,9 +310,9 @@ static int lm3560_init_controls(struct lm3560_f=
lash *flash,
> > > >       /* flash strobe timeout */
> > > >       v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_TIMEOUT,
> > > >                         LM3560_FLASH_TOUT_MIN,
> > > > -                       flash->pdata->max_flash_timeout,
> > > > +                       flash->max_flash_timeout,
> > > >                         LM3560_FLASH_TOUT_STEP,
> > > > -                       flash->pdata->max_flash_timeout);
> > > > +                       flash->max_flash_timeout);
> > > >
> > > >       /* flash brt */
> > > >       v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_INTENSITY,
> > > > @@ -339,15 +354,18 @@ static const struct regmap_config lm3560_regm=
ap =3D {
> > > >  };
> > > >
> > > >  static int lm3560_subdev_init(struct lm3560_flash *flash,
> > > > -                           enum lm3560_led_id led_no, char *led_na=
me)
> > > > +                           enum lm3560_led_id led_no,
> > > > +                           struct device_node *np)
> > > >  {
> > > >       struct i2c_client *client =3D to_i2c_client(flash->dev);
> > > >       int rval;
> > > >
> > > >       v4l2_i2c_subdev_init(&flash->subdev_led[led_no], client, &lm3=
560_ops);
> > > >       flash->subdev_led[led_no].flags |=3D V4L2_SUBDEV_FL_HAS_DEVNO=
DE;
> > > > -     strscpy(flash->subdev_led[led_no].name, led_name,
> > > > -             sizeof(flash->subdev_led[led_no].name));
> > > > +     snprintf(flash->subdev_led[led_no].name,
> > > > +              sizeof(flash->subdev_led[led_no].name),
> > > > +              "lm3560-led%d", led_no);
> > > > +     flash->subdev_led[led_no].fwnode =3D of_fwnode_handle(np);
> > > >       rval =3D lm3560_init_controls(flash, led_no);
> > > >       if (rval)
> > > >               goto err_out;
> > > > @@ -378,7 +396,7 @@ static int lm3560_init_device(struct lm3560_fla=
sh *flash)
> > > >
> > > >       /* set peak current */
> > > >       rval =3D regmap_update_bits(flash->regmap,
> > > > -                               REG_FLASH_TOUT, 0x60, flash->pdata-=
>peak);
> > > > +                               REG_FLASH_TOUT, 0x60, flash->peak);
> > > >       if (rval < 0)
> > > >               return rval;
> > > >       /* output disable */
> > > > @@ -391,18 +409,22 @@ static int lm3560_init_device(struct lm3560_f=
lash *flash)
> > > >       return rval;
> > > >  }
> > > >
> > > > -static void lm3560_subdev_cleanup(struct lm3560_flash *flash,
> > > > -                               enum lm3560_led_id led_no)
> > > > +static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
> > > >  {
> > > > -     v4l2_async_unregister_subdev(&flash->subdev_led[led_no]);
> > > > -     v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
> > > > -     media_entity_cleanup(&flash->subdev_led[led_no].entity);
> > > > +     int led_no;
> > > > +
> > > > +     for_each_set_bit(led_no, flash->led_id, LM3560_LED_MAX) {
> > > > +             v4l2_async_unregister_subdev(&flash->subdev_led[led_n=
o]);
> > > > +             v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
> > > > +             media_entity_cleanup(&flash->subdev_led[led_no].entit=
y);
> > > > +     }
> > > >  }
> > > >
> > > >  static int lm3560_probe(struct i2c_client *client)
> > > >  {
> > > >       struct lm3560_flash *flash;
> > > > -     struct lm3560_platform_data *pdata =3D dev_get_platdata(&clie=
nt->dev);
> > > > +     struct device_node *node;
> > > > +     u32 peak_ua;
> > > >       int rval;
> > > >
> > > >       flash =3D devm_kzalloc(&client->dev, sizeof(*flash), GFP_KERN=
EL);
> > > > @@ -415,36 +437,69 @@ static int lm3560_probe(struct i2c_client *cl=
ient)
> > > >               return rval;
> > > >       }
> > > >
> > > > -     /* if there is no platform data, use chip default value */
> > > > -     if (pdata =3D=3D NULL) {
> > > > -             pdata =3D devm_kzalloc(&client->dev, sizeof(*pdata), =
GFP_KERNEL);
> > > > -             if (pdata =3D=3D NULL)
> > > > -                     return -ENODEV;
> > > > -             pdata->peak =3D LM3560_PEAK_3600mA;
> > > > -             pdata->max_flash_timeout =3D LM3560_FLASH_TOUT_MAX;
> > > > -             /* led 1 */
> > > > -             pdata->max_flash_brt[LM3560_LED0] =3D LM3560_FLASH_BR=
T_MAX;
> > > > -             pdata->max_torch_brt[LM3560_LED0] =3D LM3560_TORCH_BR=
T_MAX;
> > > > -             /* led 2 */
> > > > -             pdata->max_flash_brt[LM3560_LED1] =3D LM3560_FLASH_BR=
T_MAX;
> > > > -             pdata->max_torch_brt[LM3560_LED1] =3D LM3560_TORCH_BR=
T_MAX;
> > > > -     }
> > > > -     flash->pdata =3D pdata;
> > > >       flash->dev =3D &client->dev;
> > > >       mutex_init(&flash->lock);
> > > >
> > > > +     bitmap_zero(flash->led_id, LM3560_LED_MAX);
> > > > +
> > > > +     flash->peak =3D LM3560_PEAK_1600mA;
> > > > +     rval =3D device_property_read_u32(flash->dev,
> > > > +                                     "ti,peak-current-microamp", &=
peak_ua);
> > > > +     if (!rval) {
> > > > +             switch (peak_ua) {
> > > > +             case 1600000:
> > > > +                     flash->peak =3D LM3560_PEAK_1600mA;
> > > > +                     break;
> > > > +             case 2300000:
> > > > +                     flash->peak =3D LM3560_PEAK_2300mA;
> > > > +                     break;
> > > > +             case 3000000:
> > > > +                     flash->peak =3D LM3560_PEAK_3000mA;
> > > > +                     break;
> > > > +             case 3600000:
> > > > +                     flash->peak =3D LM3560_PEAK_3600mA;
> > > > +                     break;
> > > > +             default:
> > > > +                     return -EINVAL;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     flash->max_flash_timeout =3D LM3560_FLASH_TOUT_MIN * 1000;
> > > > +     device_property_read_u32(flash->dev, "flash-max-timeout-us",
> > > > +                              &flash->max_flash_timeout);
> > > > +     flash->max_flash_timeout /=3D 1000;
> > > > +
> > > >       rval =3D lm3560_init_device(flash);
> > > >       if (rval < 0)
> > > >               return rval;
> > > >
> > > > -     rval =3D lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0"=
);
> > > > -     if (rval < 0)
> > > > -             return rval;
> > > > +     for_each_available_child_of_node(dev_of_node(flash->dev), nod=
e) {
> > >
> > > device_for_each_child_node(), please.
> > >
> > > > +             u32 reg;
> > > >
> > > > -     rval =3D lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1"=
);
> > > > -     if (rval < 0) {
> > > > -             lm3560_subdev_cleanup(flash, LM3560_LED0);
> > > > -             return rval;
> > > > +             rval =3D of_property_read_u32(node, "reg", &reg);
> > >
> > > device_property_read_u32() here and elsewhere.
> > >
> >
> > I have switched to OF equivalent deliberately because if I use
> > device_for_each_child_node I found no sane way to pass fwnode to
> > subdev_led since device_for_each_child_node releases fwnode handle it
> > uses and I cannot assign it to subdev_led.fwnode since it will result
> > in NULL pointer on loop exit
>
> device_for_each_child_node() is indeed meant the be functionally equivale=
nt
> to for_each_available_child_of_node().
>
> If you need to hold a reference to the child node -- as I think you do --
> you'll need to call fwnode_handle_get() on it, as you'd call of_node_get(=
)
> on OF API.
>

ATM fwnode of led is passed with of_fwnode_handle from of_node, but it
seems that your suggestion is reasonable, thank you.

> >
> > > > +             if (rval < 0)
> > > > +                     /* We care only about nodes with reg property=
 */
> > > > +                     continue;
> > > > +
> > > > +             if (reg =3D=3D LM3560_LED0 || reg =3D=3D LM3560_LED1)=
 {
> > > > +                     flash->max_flash_brt[reg] =3D LM3560_FLASH_BR=
T_MIN;
> > > > +                     of_property_read_u32(node, "flash-max-microam=
p",
> > > > +                                          &flash->max_flash_brt[re=
g]);
> > > > +
> > > > +                     flash->max_torch_brt[reg] =3D LM3560_TORCH_BR=
T_MIN;
> > > > +                     of_property_read_u32(node, "led-max-microamp"=
,
> > > > +                                          &flash->max_torch_brt[re=
g]);
> > > > +
> > > > +                     rval =3D lm3560_subdev_init(flash, reg, node)=
;
> > > > +                     if (rval < 0) {
> > > > +                             lm3560_subdev_cleanup(flash);
> > > > +                             return dev_err_probe(flash->dev, rval=
,
> > > > +                                                 "failed to regist=
er led%d\n",
> > > > +                                                 reg);
> > > > +                     }
> > > > +
> > > > +                     set_bit(reg, flash->led_id);
> > > > +             }
> > > >       }
> > > >
> > > >       i2c_set_clientdata(client, flash);
> > > > @@ -455,12 +510,17 @@ static int lm3560_probe(struct i2c_client *cl=
ient)
> > > >  static void lm3560_remove(struct i2c_client *client)
> > > >  {
> > > >       struct lm3560_flash *flash =3D i2c_get_clientdata(client);
> > > > -     unsigned int i;
> > > >
> > > > -     for (i =3D LM3560_LED0; i < LM3560_LED_MAX; i++)
> > > > -             lm3560_subdev_cleanup(flash, i);
> > > > +     lm3560_subdev_cleanup(flash);
> > > >  }
> > > >
> > > > +static const struct of_device_id lm3560_of_match[] =3D {
> > > > +     { .compatible =3D "ti,lm3559" },
> > > > +     { .compatible =3D "ti,lm3560" },
> > > > +     { }
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, lm3560_of_match);
> > > > +
> > > >  static const struct i2c_device_id lm3560_id_table[] =3D {
> > > >       { LM3559_NAME },
> > > >       { LM3560_NAME },
> > > > @@ -473,6 +533,7 @@ static struct i2c_driver lm3560_i2c_driver =3D =
{
> > > >       .driver =3D {
> > > >                  .name =3D LM3560_NAME,
> > > >                  .pm =3D NULL,
> > > > +                .of_match_table =3D lm3560_of_match,
> > > >                  },
> > > >       .probe =3D lm3560_probe,
> > > >       .remove =3D lm3560_remove,
> > > > diff --git a/include/media/i2c/lm3560.h b/include/media/i2c/lm3560.=
h
> > > > index 770d8c72c94a..b56c1ff8fd49 100644
> > > > --- a/include/media/i2c/lm3560.h
> > > > +++ b/include/media/i2c/lm3560.h
> > > > @@ -66,19 +66,4 @@ enum lm3560_peak_current {
> > > >       LM3560_PEAK_3600mA =3D 0x60
> > > >  };
> > > >
> > > > -/* struct lm3560_platform_data
> > > > - *
> > > > - * @peak :  peak current
> > > > - * @max_flash_timeout: flash timeout
> > > > - * @max_flash_brt: flash mode led brightness
> > > > - * @max_torch_brt: torch mode led brightness
> > > > - */
> > > > -struct lm3560_platform_data {
> > > > -     enum lm3560_peak_current peak;
> > > > -
> > > > -     u32 max_flash_timeout;
> > > > -     u32 max_flash_brt[LM3560_LED_MAX];
> > > > -     u32 max_torch_brt[LM3560_LED_MAX];
> > > > -};
> > > > -
> > > >  #endif /* __LM3560_H__ */
> > >
> > > --
> > > Kind regards,
> > >
> > > Sakari Ailus
>
> --
> Sakari Ailus
