Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793783974;
	b=uBy8pT+BrKTRyRygE/XLELgXa9kg3ikAA2+9DUtaLU/DF+v+Bm9Tez473S2ACDchOa2j
	 6rWdBQDlC8329+gfzGTN9mGbOAfQYwlWc6ncGqAcGPp6pBI2zmV0gRj5Lw08mupowJw77
	 ZXzpIUMbDMEPubImmXkaIMb3tP05dgPBHPW5pa72tPdemb3RwWf+9P3FPXeSeiF7V96C6
	 UeV31vpJtLA/l3vAIspiy8qGVvdVJXrXWpppLD16ziodvPYnsYIFkLqhHgSKSBAN8FDlB
	 JSBJ/k8lWfm0SCuJs9JS/DB38IICioHBgj6HCzZ54YNLnbCYkGe9uoFiDh+UpT6fRDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YRz/K05YLArkwgmmoG2AbhmGzTf6qgCvL/rORwgm+WE=;
	b=LKEsCVpxXOwWvmK5o19sTNS6tS6Pap5q+MsKpRY0ue0sL+gxHO2VlxcCYESORy47FcfB
	 7AyCNkAuwAY9Z8Ol579HB+wiSEfzutFlbN2kzMZHrhvvg+JGBOIkikEAygIDKTFGsyBhc
	 Q4ydQNkDEsf1k8tysq3b1mBxP101cx/x1iTmk0Norb1u1w/larAK9v/RsKNnBUk8hjTAf
	 enZvBy4TVjO9NjdKlt77JOF4TQQd2eioFnebyp4XrrE2k0wGbh9qHWDbXmUMD/xm22xxI
	 p10bXqmhsAAYTII7quooixGhtsogq2h1tFKDeSDugq1Wc9kKzMMg7J6UEke9yqsYFMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayb69Ya0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8A1606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C8A1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayb69Ya0
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so952576eec.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 01:19:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793783973; cv=none;
        d=google.com; s=arc-20260327;
        b=qCdxoiB9TA1IJSQBZ7A+cuP9bSz70l2olZ8nLuRV5cynQ20sCMMOg/PQGeaLqVjbiS
         Rx1O32aJ0QJgI1g9u0zxvyarlqiSIE7doPyoPWJ3duTLg1S8PuQ73oqzKxvy1x5IslOP
         vz4EbMTizcZyugKz2LP2FTkRuVUHvKR/wTCMYbPVf6DD8jsy6PpbAwNTjQFgLg+0U1JM
         jahylO/9foByF4IkjDPQjXmqw+mDs3Ypj4BceHF/CjbK5xqrQ/Vww/3AHb7YNF/t0+OW
         PBqdsxvyd9AO+PBFxmL4D7E/uoiyd05lDc5NVsoFrUseSk3wQn25KW83nXlqu8U2SeVA
         SfGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YRz/K05YLArkwgmmoG2AbhmGzTf6qgCvL/rORwgm+WE=;
        fh=0hcwZXpJLwE/VLDJioPMZ++AvzQH/MXPUr3Ipy3asI4=;
        b=jJTnhzXtka8MZIY4lvB64w6sQAHjrvcHH3naaSlngGqiYej9DEuiKWRvYHIbTtQ5tk
         QTZAToi8BgYBsC6atShWesqQc80RCCsWUnuLDwRX1puuFy4v0DIfnOPMJE7A+nU+oKPB
         pDukuUiUymp8n3ROZd9O+7y73vo3Ga0hoTvmS3Iy6KPjc0pA+89c0vGFo8fZ+0SlZzqu
         KKyaftZOxwUvEde1JcKFlnANMgIOuoJRnu9zXtn59pPf+rRecGvBIVqPOA05u9m6ngYW
         zBZ/TueFkQZNcvZ6aCrwhkeuUqY9gG5arXSm0bEUPIEnHLKoIoAZIn2C8EMsOoqVo6Kb
         dCcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783973; x=1794388773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRz/K05YLArkwgmmoG2AbhmGzTf6qgCvL/rORwgm+WE=;
        b=ayb69Ya0o3ph0NsLKgZZUPiW2eL5NpQakbmSq8k43meo1an6qOsZDlEClqja0l9yiC
         qlQbarq40NXikJpoLVDStg73boddpAiquWgi05oXTgOeS73aRXuhGeLRIer0V/Ivz8uv
         v637Knpn6gaxU8Fl75XUkf1Wu/vGUJ1QLVL8ZTNuD2uH0y948IIEL388RcdxEcf7Ek2d
         L30ycVVgfTwDPZyeid/m0ce+ots4mOOfju4QjR/9qNipWjguXb1iOs/Ex1RT1tnDxZsQ
         ZNJ7NTpKzI5CCc5IqZTilho7RzIXUY/3DOkQNH3vTlh56SVIqAUrIileY/MPHaNE871h
         vetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783973; x=1794388773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRz/K05YLArkwgmmoG2AbhmGzTf6qgCvL/rORwgm+WE=;
        b=yiA/NmvHpF3zPhMzvqPuj9Ie98BKjU+qJa0M0uZmAg4poIqOqWxE53qUzDQ0u8kr+C
         g9jxtDZZU/LRlhAXD8EJ6D65eyCv8jMGfGZNsBwR+T6ZdUhDGA+u9Nqg8TrY4Zun3vaZ
         7894VGtjyrKwN+2E8BKEJ5OVuZpf+vVEfpMI9/xIakt5MMnlaYVbHC6UZiCxU/tvXxET
         cYlbPdSiZz7VGKD3MD8eC3KK6ktYJVdT2Jx3/HC8usx0g62EVFEdjecRwlDHxP0Q4P6f
         8NpSBNqbD6UbJEmvb7SE31jkMHBNXFGMzdLHq8D8oWbs6qsE/GgAzvTrNbvVJ4IXk71E
         xRLg==
X-Forwarded-Encrypted: i=1; AKwUvBw9ICjcK/9rUvnKOFi8DKMDQBdO0m6QwGKlS0BmRNgIuQW1MEx8/iPbSBm89D/M3S5z3BtOt3/7qUiv@vger.kernel.org
X-Gm-Message-State: APuU4Z+lC6txIHNY4imVH8YIgSFihgg5DyBE+u+wvciedThCtwfW08Rq
	h4NkwgRgJTA1MtijbLg+Rbxm9lPSiQeR8uJimh/EOQbmY/JS7RTb8jPC1qcXrY1g9yn5e9obk/h
	GwsFunAmSrc5KtgEkUM0SpZR2fl0pZmg=
X-Gm-Gg: AYBFou1YxZ3vHN2ETipuNVjPOjwbxAZMs1l7iZGCa1J3ciSOWltQNnrJyTRJR4NlPQ6
	AG0j0nL+k6oWsEjitkpR42b0+sdCLLsRxlan6Jk3c9MObo7P8C/JjxK6jlFSlLkcHZ/PaLnEuD8
	Szj7ED0sMdxeoPfFUUe44uITff7lDyfbsF6ykR/dO+gGZ9cAzufJTczPhA3lBk7j2lfHmO9aRpI
	6xe9VE+ioWJs5TiJhl27WmdqbnCxhAEKJWfZua5/bvYE5ILCcMVT6dtmlmwKIE62ZmCauxwKw4g
	eiYBgaJYt27ieZ9n6QzD0dDkOEuD0UMZFqT+BKbaAI4PCatAlTNcbaHq/A1B1bbneEGgvfga+yj
	T9sTulBG3MgDoXZPQr3k21FENEdZN2zRPXudXUixcq4o5g05gO6Y8v1JlOcp1b4hMvdzv5g==
X-Received: by 2002:a05:7300:cacb:b0:36a:3310:21a8 with SMTP id
 5a478bee46e88-36a4238da58mr22696876eec.17.1793783973140; Wed, 04 Nov 2026
 01:19:33 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <20261019100406.103687-6-clamor95@gmail.com>
 <179249575817.1833288.1089755405582445022@kernel.org> <CAPVz0n0=6Z7E9iSc84xL6Jt=Xi=a=qmSwVsT5g-LMZ+mENFkzg@mail.gmail.com>
 <20261104082839.GD792264@google.com>
In-Reply-To: <20261104082839.GD792264@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 4 Nov 2026 11:19:21 +0200
X-Gm-Features: AclHuK-nwA8nmcK4-hyChgffnjaf-dRrb8bQSBvVXY32g8YXDAt5lwFBxCDKvVg
Message-ID: <CAPVz0n2aCy9Kx5kK1EZD3qxN=KCSf=cB7ZnP1SedrrJc13sh2g@mail.gmail.com>
Subject: Re: [PATCH v12 5/7] leds: Add driver for ASUS Transformer LEDs
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 4 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:28=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 03 Nov 2026, Svyatoslav Ryhel wrote:
>
> > =D0=B2=D1=82, 3 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
6:03 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Mon, 19 Oct 2026, Svyatoslav Ryhel wrote:
> > > > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > >
> > > > ASUS Transformer tablets have a green and an amber LED on both the =
Pad
> > > > and the Dock. If both LEDs are enabled simultaneously, the emitted =
light
> > > > will be yellow.
> > > >
> > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > > ---
> > > >  drivers/leds/Kconfig                    |  11 +++
> > > >  drivers/leds/Makefile                   |   1 +
> > > >  drivers/leds/leds-asus-transformer-ec.c | 125 ++++++++++++++++++++=
++++
> > > >  3 files changed, 137 insertions(+)
> > > >  create mode 100644 drivers/leds/leds-asus-transformer-ec.c
> > > >
> > > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > > > index 7ec2c8d785426..788e689fe875c 100644
> > > > --- a/drivers/leds/Kconfig
> > > > +++ b/drivers/leds/Kconfig
> > > > @@ -120,6 +120,17 @@ config LEDS_OSRAM_AMS_AS3668
> > > >         To compile this driver as a module, choose M here: the modu=
le
> > > >         will be called leds-as3668.
> > > >
> > > > +config LEDS_ASUS_TRANSFORMER_EC
> > > > +     tristate "LED Support for Asus Transformer charging LED"
> > > > +     depends on LEDS_CLASS
> > > > +     depends on MFD_ASUS_TRANSFORMER_EC
> > > > +     help
> > > > +       This option enables support for charging indicator on
> > > > +       Asus Transformer's Pad and its Dock.
> > > > +
> > > > +       To compile this driver as a module, choose M here: the modu=
le
> > > > +       will be called leds-asus-transformer-ec.
> > > > +
> > > >  config LEDS_AW200XX
> > > >       tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20=
108"
> > > >       depends on LEDS_CLASS
> > > > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > > > index 4d4b089156e24..3da746279bb81 100644
> > > > --- a/drivers/leds/Makefile
> > > > +++ b/drivers/leds/Makefile
> > > > @@ -15,6 +15,7 @@ obj-$(CONFIG_LEDS_ADP5520)          +=3D leds-adp=
5520.o
> > > >  obj-$(CONFIG_LEDS_AN30259A)          +=3D leds-an30259a.o
> > > >  obj-$(CONFIG_LEDS_APU)                       +=3D leds-apu.o
> > > >  obj-$(CONFIG_LEDS_ARIEL)             +=3D leds-ariel.o
> > > > +obj-$(CONFIG_LEDS_ASUS_TRANSFORMER_EC)       +=3D leds-asus-transf=
ormer-ec.o
> > > >  obj-$(CONFIG_LEDS_OSRAM_AMS_AS3668)  +=3D leds-as3668.o
> > > >  obj-$(CONFIG_LEDS_AW200XX)           +=3D leds-aw200xx.o
> > > >  obj-$(CONFIG_LEDS_AW2013)            +=3D leds-aw2013.o
> > > > diff --git a/drivers/leds/leds-asus-transformer-ec.c b/drivers/leds=
/leds-asus-transformer-ec.c
> > > > new file mode 100644
> > > > index 0000000000000..1b129247ea6c6
> > > > --- /dev/null
> > > > +++ b/drivers/leds/leds-asus-transformer-ec.c
> > > > @@ -0,0 +1,125 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +
> > > > +#include <linux/err.h>
> > > > +#include <linux/leds.h>
> > > > +#include <linux/mfd/asus-transformer-ec.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/slab.h>
> > > > +
> > > > +enum {
> > > > +     ASUSEC_LED_AMBER,
> > > > +     ASUSEC_LED_GREEN,
> > > > +     ASUSEC_LED_MAX
> > > > +};
> > > > +
> > > > +struct asus_ec_led_config {
> > > > +     const char *name;
> > > > +     unsigned int color;
> > > > +     u64 ctrl_bit;
> > > > +};
> > > > +
> > > > +struct asus_ec_led {
> > > > +     struct asus_ec_leds_data *ddata;
> > >
> > >
> > > Why do we need 'struct ' at all?
> > >
> > > If we put 'const struct asusec_core *ec;' directly into 'struct
> > > asus_ec_led', we can drop the outer wrapper struct and the back-point=
er
> > > completely.
> > >
> >
> > You propose to allocate asus_ec_led for each led in a loop? I have not
> > seen this done by other leds. The asus_ec_leds_data is driver ddata,
> > asus_ec_led is each led individual structure.
>
> For your whole 2 LEDs, yes, I think that will be better.
>
> > > > +     struct led_classdev cdev;
> > > > +     u64 ctrl_bit;
> > > > +};
> > > > +
> > > > +struct asus_ec_leds_data {
> > > > +     const struct asusec_core *ec;
> > > > +     struct asus_ec_led leds[ASUSEC_LED_MAX];
> > > > +};
> > > > +
> > > > +static const struct asus_ec_led_config asus_ec_leds[] =3D {
> > > > +     [ASUSEC_LED_AMBER] =3D {
> > > > +             .name =3D "amber",
> > > > +             .color =3D LED_COLOR_ID_AMBER,
> > > > +             .ctrl_bit =3D ASUSEC_CTL_LED_AMBER,
> > > > +     },
> > > > +     [ASUSEC_LED_GREEN] =3D {
> > > > +             .name =3D "green",
> > > > +             .color =3D LED_COLOR_ID_GREEN,
> > > > +             .ctrl_bit =3D ASUSEC_CTL_LED_GREEN,
> > > > +     },
> > > > +};
> > > > +
> > > > +static enum led_brightness asus_ec_led_get_brightness(struct led_c=
lassdev *cdev)
> > > > +{
> > > > +     struct asus_ec_led *led =3D container_of(cdev, struct asus_ec=
_led, cdev);
> > > > +     const struct asusec_core *ec =3D led->ddata->ec;
> > > > +     u64 ctl;
> > > > +     int ret;
> > > > +
> > > > +     ret =3D asus_dockram_access_ctl(ec->dockram, &ctl, 0, 0);
> > >
> > > As requested on v6 and v8, why are we still using this bespoke access=
or instead
> > > of Regmap?
> >
> > https://lore.kernel.org/lkml/CAPVz0n0imF_ESoGMJSrEX7NOnBShFj8wehDtQKXZV=
_DMcGqq=3DA@mail.gmail.com/
>
> Sorry, I've slept since then, and subsequently forgotten this
> conversation.  You can drop this request.
>
> > > > +     if (ret)
> > > > +             return LED_OFF;
> > > > +
> > > > +     return ctl & led->ctrl_bit ? LED_ON : LED_OFF;
> > > > +}
> > > > +
> > > > +static int asus_ec_led_set_brightness(struct led_classdev *cdev,
> > > > +                                   enum led_brightness brightness)
> > > > +{
> > > > +     struct asus_ec_led *led =3D container_of(cdev, struct asus_ec=
_led, cdev);
> > > > +     const struct asusec_core *ec =3D led->ddata->ec;
> > > > +
> > > > +     if (brightness)
> > > > +             return asus_dockram_access_ctl(ec->dockram, NULL,
> > > > +                                            led->ctrl_bit, led->ct=
rl_bit);
> > >
> > > Use 100-chars throughout to prevent early wrapping.
> > >
> > > > +     return asus_dockram_access_ctl(ec->dockram, NULL, led->ctrl_b=
it, 0);
> > > > +}
> > > > +
> > > > +static int asus_ec_led_probe(struct platform_device *pdev)
> > > > +{
> > > > +     const struct asusec_core *ec =3D dev_get_drvdata(pdev->dev.pa=
rent);
> > > > +     struct asus_ec_leds_data *ddata;
> > > > +     struct device *dev =3D &pdev->dev;
> > > > +     int ret;
> > > > +
> > > > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > > > +     if (!ddata)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     platform_set_drvdata(pdev, ddata);
> > >
> > > What consumes this?
> >
> > Seems to be an overlook, must have forgotten to remove it during 12
> > iterations over last 10 month
>
> No problem, it happens.
>
> > > > +     ddata->ec =3D ec;
> > > > +
> > > > +     for (int i =3D 0; i < ASUSEC_LED_MAX; i++) {
> > >
> > > `i` isn't just a random iterator here - maybe call it `led`?
> > >
> >
> > This is just a disposable iterator.
>
> It's a disposable iterator that is clearly a `led`.
>
> Thus my request for and improvement in the nomenclature remains valid.
>
> > v7 seem fine https://lore.kernel.org/lkml/20260702162425.GD2108533@goog=
le.com/
> > v9 as well https://lore.kernel.org/lkml/20260702162425.GD2108533@google=
.com/
>
> These are the same link.
>

Ooops, v7 https://lore.kernel.org/lkml/20260527144619.GA671544@google.com/

> > Yet again complains and nits
>
> That my job.  You're welcome.  =3D;-)
>
> Sometimes new things are found on re-review.
>
> Apologies for the disappointment.
>

I will incorporate all your requests, but please, may you apply/check
v13 a bit quicker. That would be awesome.

> --
> Lee Jones
