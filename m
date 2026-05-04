Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2994F2EB5CD
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 07:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880455; cv=pass; b=YYzbaoAPEGan+WH/d/W+XIAaQJzJ2Bsz1Xt6svoec62VmdrMmN4SSzoC6E8jSCkchanqnJK+/1y6rSdSFtTDJGZv7s7jusif7Ng0lAYUo8fD6RHk6p9sRwBm6y9123TMiWve4qIpASf8EpSOus+yZixfqlcVRop4RYic1taRuP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880455; c=relaxed/simple;
	bh=PimAmDBuePoh/qzM8yI1lcGMvx3ktmORhXvgjq11LY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B2wZGE2OVCKTwcGdBjmTHWKDIxD4TETJLbsX6MIIIE5Qeifie6ou1QjmzWzr080GG0lDe4ClXPkwtnFVLyfZnY39tmBbew87/CnrBuAOSqyJBGcizEkfZ8w5o2ibY9f6iRJIS+sSs32+kaNF0FtEDiC7CCRJ3SI47YzHqOFNiT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VniDPVhr; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VniDPVhr"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ef8d6ba48bso1121563eec.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 00:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777880453; cv=none;
        d=google.com; s=arc-20240605;
        b=C/KGu6HXAa7HssN3WpttoyG1e/wpYJdugUah20qaMO0ZUFiKugYVCy2FxptJ0Jr6wk
         MiiTJ/MRG4N9Kqk+JyIuW3I7jJBokJ3gc89zDdjqIPZ4HK2q7xWLYsSRlsM4l2ExO5QD
         FuBkYUUSDXM7AIR8kufo/NlvsfUjbTZZJL9vw92T5k9Z0Jkk2wneUbLhWGountEqo1fC
         fhJ6+7a2WD/nwnDZgbo9+uqfUlLXtbxJ2Py8KACpc+NChJOyTp9sQbHcwF+3STM7C9n4
         wg6DC2DZrhg5zw2s9Cf7vRJQF0muOEZSdjq2T9iFB/L8i/mRNRzbZsHf0lX49WdBi1hU
         Grqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LCkxhAVa2Kz1UkiVBw7mtm2nSh9PR7uQTdGuhJ6wxIw=;
        fh=GaA/5O/vuJg+0w7tHtke89+jM07uO5jtWkUiTlM4z7I=;
        b=QBACN92REdysUT3ZRK7p7jY3JN+lG2HtGzgtFC5R4Wgepc3XXxTLhnzMsbE8vwMHZV
         e6xIWp6dy613Jh3GRpIzyP2gvaTmjVXmB1qVONK4/u0xK9FbNNxuehOLDtt0pfFcncTP
         GBkH7hc/C8XrolkHjgjSvMjRMVd3KOtSJLPRHQu2Ji0XKgSE05Opp2M3DoNsPA/XmLi7
         Vjm7kqJzmtlJeeCT9xSbRkY19dRO5BuB0UARsT3ukn/Qglo9dvc3z5BQIIZi8C8yz18S
         0Fg5G8YBCCMVGA4D0N9+Byppd79vCin09zmxKVgrudZCj8bj4RIqgrQOjfasV5lHR4LJ
         +P4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777880453; x=1778485253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCkxhAVa2Kz1UkiVBw7mtm2nSh9PR7uQTdGuhJ6wxIw=;
        b=VniDPVhrmSQNP8Y5k6ysXC+9H869N3Vwa1K/o2EMU/Zj2i+9sEV/UhaOooiVssNThg
         AosQ0qH55dxnOdH6sPTF1pWmWWO36n011l6DWI9mmZZFvNBZqRW8uKIsvmaN39wYXSJw
         FiJcndlMIHXxGCRfKSW6GGiWK29pFHN5enYSCuEgZuyWM7EyCvqohFI1yC7LZOXhn0XB
         D7BNADLdlUN6sPnlhNYJWOrykQn9kL+9mCCcjGWLUTNMxbDEqqI/GrSK9AVBUKm01TxS
         76mHklzw9lHqjuKsUnHnhNz5s9hLBR2eGuX+C0mb0VilTqpCVjawq34AF97BHPpJ0Tov
         r2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880453; x=1778485253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LCkxhAVa2Kz1UkiVBw7mtm2nSh9PR7uQTdGuhJ6wxIw=;
        b=Hdfk0PMFwU3N8K8io6OPWVuOjqkryAOG88JRRlWp+jOflyok9FfPGbY3rR7i9CfO55
         u3OzHWNg3HX1KdKEfku9Ig/e9ClU+5MThiR74XlfemR7Qcg6ftxmwT5SA4jzSq44bXlx
         pkn+MtO/O8NMALGnl3v+Wox0OsRMGWxYJAXKFkG/IhpKbAvoa/wco8mcrzJsmA3GBqRS
         Disym9KRZCUpU5USoYocx+LZ5KHROPD+dVduoDNdq7X5/s/myUUzAq2dZQOlOKJorGpf
         ArrTB6ste+/xTjUBv9ETh764X0JnYwosmtAyzJodLNEl1qdFBSXAGbVFeOTNM6tVi90K
         nCQA==
X-Forwarded-Encrypted: i=1; AFNElJ/hDHXuOJBPXu8O43y3kV5i1rdoYVPP2pqMdJjeoEN1tmoEUSbwp+JNJjpH5IXo7oAXZwLpYFGbgrdr@vger.kernel.org
X-Gm-Message-State: AOJu0YwGfCtrRiPsMdJ33qbvdfPvmlEW36P7CB8P2VbrIeZgVrebDS1P
	5sodZbS3kaNPhEgYMfbOj1xVpajBXA4nE3NuxRb9DdsS8DCFyZbRipecTFS081eTnEuKE/bhcbb
	hWgeNURhKophel6UQNzsk/TAqMF2VDS0=
X-Gm-Gg: AeBDies2qHDV4skZVgq/nD2SX8NBamler6xM1mqTspzvAPlLiuhVzpkg5dbuO5Dto0A
	DpoYPGAYImBsHwjscRzNYDDmgVB99580cdkEs/povEk6GpoSKVNdeHNLKSq2k3bgwRM9yyLrRX9
	OHPKcu5ccN+Vn1u7MOgIS6TbZiVYyXx7d/lphV3hSWKcOoK6dcSMGJTbn65fehonxSxOUUXy0wZ
	Jv6i3w45h4FTYabRHMOasFx/ebaeiEn7599XG1n/Jg44JZZX6ghZ8jZS19ceq3hXlrAtYCGd82Y
	+fHUv/LcOV50k5QhTnQ=
X-Received: by 2002:a05:693c:3003:b0:2f0:ee2:f6c6 with SMTP id
 5a478bee46e88-2f00ee2fb33mr2488478eec.19.1777880453124; Mon, 04 May 2026
 00:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503164445.215540-1-clamor95@gmail.com> <20260503164445.215540-6-clamor95@gmail.com>
 <afg-ldFd7hockYn-@kekkonen.localdomain>
In-Reply-To: <afg-ldFd7hockYn-@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 4 May 2026 10:40:40 +0300
X-Gm-Features: AVHnY4KoMtn8TXLLhoDJp5ms6MrAvqPdKX7PT1fN5YHojIBWSmaMZ63320KsPn0
Message-ID: <CAPVz0n0w90AuczbhdPrWewpKpJC_iJ5u3LsPug5mVPJ+KDnZRQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] media: i2c: lm3560: Add support for PM features
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 4 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 09:37=
 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Sun, May 03, 2026 at 07:44:44PM +0300, Svyatoslav Ryhel wrote:
> > Add support for power management features to better control the LM3560
> > within the media framework. To achieve the desired PM support, the HWEN
> > GPIO and VIN power supply were added and configured into power on/off
> > sequences. Added PM operations along with the PM configuration setup.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/i2c/lm3560.c | 117 ++++++++++++++++++++++++++++++++++---
> >  1 file changed, 110 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> > index ce4b09d1f208..15741ea5684f 100644
> > --- a/drivers/media/i2c/lm3560.c
> > +++ b/drivers/media/i2c/lm3560.c
> > @@ -12,13 +12,16 @@
> >  #include <linux/bitmap.h>
> >  #include <linux/delay.h>
> >  #include <linux/module.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> >  #include <linux/slab.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/mutex.h>
> >  #include <linux/of.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/property.h>
> >  #include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/videodev2.h>
> >  #include <media/i2c/lm3560.h>
> >  #include <media/v4l2-ctrls.h>
> > @@ -49,6 +52,8 @@ enum led_enable {
> >   * @dev: pointer to &struct device
> >   * @regmap: reg. map for i2c
> >   * @lock: muxtex for serial access.
> > + * @hwen_gpio: line connected to HWEN pin
> > + * @vin_supply: line connected to IN supply (2.5V - 5.5V)
> >   * @led_mode: V4L2 LED mode
> >   * @ctrls_led: V4L2 controls
> >   * @subdev_led: V4L2 subdev
> > @@ -63,6 +68,9 @@ struct lm3560_flash {
> >       struct regmap *regmap;
> >       struct mutex lock;
> >
> > +     struct gpio_desc *hwen_gpio;
> > +     struct regulator *vin_supply;
> > +
> >       enum v4l2_flash_led_mode led_mode;
> >       struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
> >       struct v4l2_subdev subdev_led[LM3560_LED_MAX];
> > @@ -177,12 +185,17 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl=
, enum lm3560_led_id led_no)
> >       struct lm3560_flash *flash =3D to_lm3560_flash(ctrl, led_no);
> >       int rval =3D -EINVAL;
> >
> > +     if (!pm_runtime_get_if_in_use(flash->dev))
> > +             return 0;
> > +
> >       if (ctrl->id =3D=3D V4L2_CID_FLASH_FAULT) {
> >               s32 fault =3D 0;
> >               unsigned int reg_val;
> >               rval =3D regmap_read(flash->regmap, REG_FLAG, &reg_val);
> > -             if (rval < 0)
> > +             if (rval < 0) {
> > +                     pm_runtime_put(flash->dev);
> >                       return rval;
> > +             }
> >               if (reg_val & FAULT_SHORT_CIRCUIT)
> >                       fault |=3D V4L2_FLASH_FAULT_SHORT_CIRCUIT;
> >               if (reg_val & FAULT_OVERTEMP)
> > @@ -192,6 +205,8 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, =
enum lm3560_led_id led_no)
> >               ctrl->cur.val =3D fault;
> >       }
> >
> > +     pm_runtime_put(flash->dev);
> > +
> >       return rval;
> >  }
> >
> > @@ -201,6 +216,9 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, =
enum lm3560_led_id led_no)
> >       u8 tout_bits;
> >       int rval =3D -EINVAL;
> >
> > +     if (!pm_runtime_get_if_in_use(flash->dev))
>
> This should be pm_runtime_get_if_active().
>

Noted

> > +             return 0;
> > +
> >       switch (ctrl->id) {
> >       case V4L2_CID_FLASH_LED_MODE:
> >               flash->led_mode =3D ctrl->val;
> > @@ -246,6 +264,8 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, =
enum lm3560_led_id led_no)
> >               break;
> >       }
> >
> > +     pm_runtime_put(flash->dev);
> > +
> >       return rval;
> >  }
> >
> > @@ -409,6 +429,38 @@ static int lm3560_init_device(struct lm3560_flash =
*flash)
> >       return rval;
> >  }
> >
> > +static int __maybe_unused lm3560_power_off(struct device *dev)
> > +{
> > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > +
> > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > +     regulator_disable(flash->vin_supply);
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused lm3560_power_on(struct device *dev)
> > +{
> > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > +     int rval;
> > +
> > +     rval =3D regulator_enable(flash->vin_supply);
> > +     if (rval < 0) {
> > +             dev_err(flash->dev, "failed to enable vin power supply\n"=
);
> > +             return rval;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > +
> > +     rval =3D lm3560_init_device(flash);
> > +     if (rval < 0) {
> > +             lm3560_power_off(dev);
> > +             return rval;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
> >  {
> >       int led_no;
> > @@ -442,6 +494,17 @@ static int lm3560_probe(struct i2c_client *client)
> >
> >       bitmap_zero(flash->led_id, LM3560_LED_MAX);
> >
> > +     flash->hwen_gpio =3D devm_gpiod_get_optional(flash->dev, "enable"=
,
> > +                                                GPIOD_OUT_LOW);
> > +     if (IS_ERR(flash->hwen_gpio))
> > +             return dev_err_probe(flash->dev, PTR_ERR(flash->hwen_gpio=
),
> > +                                  "failed to get hwen gpio\n");
> > +
> > +     flash->vin_supply =3D devm_regulator_get(flash->dev, "vin");
> > +     if (IS_ERR(flash->vin_supply))
> > +             return dev_err_probe(flash->dev, PTR_ERR(flash->vin_suppl=
y),
> > +                                  "failed to get vin-supply\n");
> > +
> >       flash->peak =3D LM3560_PEAK_1600mA;
> >       rval =3D device_property_read_u32(flash->dev,
> >                                       "ti,peak-current-microamp", &peak=
_ua);
> > @@ -469,9 +532,19 @@ static int lm3560_probe(struct i2c_client *client)
> >                                &flash->max_flash_timeout);
> >       flash->max_flash_timeout /=3D 1000;
> >
> > +     rval =3D regulator_enable(flash->vin_supply);
> > +     if (rval < 0)
> > +             return dev_err_probe(flash->dev, rval,
> > +                                  "failed to enable vin power supply\n=
");
> > +
> > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > +
> >       rval =3D lm3560_init_device(flash);
> >       if (rval < 0)
> > -             return rval;
> > +             goto error_disable;
> > +
> > +     pm_runtime_set_active(flash->dev);
> > +     pm_runtime_enable(flash->dev);
> >
> >       for_each_available_child_of_node(dev_of_node(flash->dev), node) {
> >               u32 reg;
> > @@ -492,10 +565,10 @@ static int lm3560_probe(struct i2c_client *client=
)
> >
> >                       rval =3D lm3560_subdev_init(flash, reg, node);
> >                       if (rval < 0) {
> > -                             lm3560_subdev_cleanup(flash);
> > -                             return dev_err_probe(flash->dev, rval,
> > -                                                 "failed to register l=
ed%d\n",
> > -                                                 reg);
> > +                             dev_err(flash->dev,
> > +                                     "failed to register led%d: %d\n",
> > +                                     reg, rval);
> > +                             goto error_clean;
> >                       }
> >
> >                       set_bit(reg, flash->led_id);
> > @@ -504,7 +577,23 @@ static int lm3560_probe(struct i2c_client *client)
> >
> >       i2c_set_clientdata(client, flash);
> >
> > +     pm_runtime_set_autosuspend_delay(flash->dev, 1000);
> > +     pm_runtime_use_autosuspend(flash->dev);
> > +     pm_runtime_idle(flash->dev);
> > +
> >       return 0;
> > +
> > +error_clean:
> > +     pm_runtime_disable(flash->dev);
> > +     pm_runtime_set_suspended(flash->dev);
> > +
> > +     lm3560_subdev_cleanup(flash);
> > +
> > +error_disable:
> > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > +     regulator_disable(flash->vin_supply);
> > +
> > +     return rval;
> >  }
> >
> >  static void lm3560_remove(struct i2c_client *client)
> > @@ -512,8 +601,22 @@ static void lm3560_remove(struct i2c_client *clien=
t)
> >       struct lm3560_flash *flash =3D i2c_get_clientdata(client);
> >
> >       lm3560_subdev_cleanup(flash);
> > +
> > +     /*
> > +      * Disable runtime PM. In case runtime PM is disabled in the kern=
el,
> > +      * make sure to turn power off manually.
> > +      */
> > +     pm_runtime_disable(&client->dev);
> > +     if (!pm_runtime_status_suspended(&client->dev)) {
> > +             lm3560_power_off(&client->dev);
> > +             pm_runtime_set_suspended(&client->dev);
> > +     }
> >  }
> >
> > +static const struct dev_pm_ops lm3560_pm_ops =3D {
> > +     SET_RUNTIME_PM_OPS(lm3560_power_off, lm3560_power_on, NULL)
> > +};
> > +
> >  static const struct of_device_id lm3560_of_match[] =3D {
> >       { .compatible =3D "ti,lm3559" },
> >       { .compatible =3D "ti,lm3560" },
> > @@ -532,7 +635,7 @@ MODULE_DEVICE_TABLE(i2c, lm3560_id_table);
> >  static struct i2c_driver lm3560_i2c_driver =3D {
> >       .driver =3D {
> >                  .name =3D LM3560_NAME,
> > -                .pm =3D NULL,
> > +                .pm =3D pm_ptr(&lm3560_pm_ops),
> >                  .of_match_table =3D lm3560_of_match,
> >                  },
> >       .probe =3D lm3560_probe,
>
> --
> Kind regards,
>
> Sakari Ailus
