Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EE7233134
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776819998; cv=pass; b=I/NCbQzmhty5kzes9VxEVLdGW28CG8dHdFLI6nxkV7iBvqyIRMWZxwSr9pYGA0xC0uneMNEDyZNJ2DxL4Gw+xu4I0yV4Vk0VkHUBh13llQBVQWM+FZWz8dLTzbnwDfqmGsq8Rpgnw1BWjYJKzMmJrZt/EBJOHLiFrthBAIo7aCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776819998; c=relaxed/simple;
	bh=6N+01bEB/iOETBncJfRoMnnYQ1xW57XfWjGf8tUAxUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWe6gxvXLKoYrTqSc+qJOW17jVYkwHqnEJQwIY71rGZrdTYWrcPpLeV126U8JU0RWvZTHFx/k0CwjOkBGnvCLq7O+XAIH4vPQoPlT0Hw3liXyUBFP2NV5qMuV2yVNd9Sr+vgmeZLRXcExVjiA4AI0WQJ780riDd1J1P02+FtcyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3uN4B5v; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3uN4B5v"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7dc35728a57so3769180a34.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 18:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776819995; cv=none;
        d=google.com; s=arc-20240605;
        b=fK2I43InoV5d9KYGdtzPTIAr/t9dI5N7sK1g3sVvc18kyPmz3tfdFsmZAexx0OxQLl
         kjsxQRnU5Vo73epuKxh46hCb5lzmqdcLHoT/KqtijKw+4gQC3QtNSg0v4GAAUQcyTotE
         npRDtjbiK+fjjgm3aiHTrH4Fl4Ge5nh2MImFEXTjdJvMxtMU/qEZenaum5wiOIxTQzKh
         rHH8jRQFxQ2M/EGNKrWz6eriYRBgIJVagrJOFn6+77MupxIAJXJoKlks6/LqiNxe/M/e
         DIN5tegSB5u328+pbLtPl56LaJc/EU/oY/xNLzDyVO0OCjla202yisSK5d+JosPmt5BO
         oYGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0IRFmArTYLfOKDBhdMLQmn7zlltkZiYQwJVABBk+Y1U=;
        fh=+nQN4cyS5dXtwNx58Mgxi80gkm2DBOoL+3BwpbwiXQI=;
        b=M0IbVqX3snuBNoTdTTGF0oxsBhGPXrq9kLUCup/0e7be81liMX9QO/TP4Xc2ZL/E9E
         DbU2xrXh/CRPXOp+A/B2p7yQxm4hfCQVBrC9hrTrrRlEwpB1Euvv8K6AXsA+V7JbvuoT
         SUnIwlvQ9e4LB8DWMHM9dinFlIvUWrIHF4O59OMSuQVwT+c7rFAQVkPHcGGSGkw+V3Cj
         RqQRaKxS+yDcTb3E678sgabXFIOI8HBlP9Ly+xDPJNypWRU1mnKnO5OC8X+Z/t+lpPSd
         0LHXPltvW7AeL9DjBoXDJOu/o/JJ3doYuzDn/d/9YdwwL+YPYP5qZnQHnaEcH/EgQskX
         4fbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776819995; x=1777424795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IRFmArTYLfOKDBhdMLQmn7zlltkZiYQwJVABBk+Y1U=;
        b=b3uN4B5vz6ovqHEDNJhZDL80VC+/ubJedfgLFFh0c+jrjClXDwF4M+Xr42Il1E7BIZ
         R0nuVDwDyhAAt5L5ftQFA8eSyp3EdMK3WI3iRZl+KRcVL1kCKaL5OZZaSv0TyKpLSuB8
         UpL51mLdweBeOEGHVnhqi8WitsA+FL94sSMuLn8FYNSUfmstx9Qp9TrdGoUcUD6Pkqam
         P8eRC/88tyXPvD0r/j5/tgML/Kz2DuM2xbxKzxW09OnIdVLjw3Qv3INWKvmXymnPKZso
         48kT5hAtvDedYHUG6CTNbI2XAYZ13JL7UenLQH6pCqaYcn8+jDstPB/4Pg/Gg/Jsqfz3
         e7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776819995; x=1777424795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0IRFmArTYLfOKDBhdMLQmn7zlltkZiYQwJVABBk+Y1U=;
        b=lcjyKzNqCIeLkt5slzLV5XcCF208KGX79rP86M9J6CGIEWVzVyJj8tHarCHlEx+FDx
         2/p8tGRN9t2ZgmIrIo0IE1hZtWeq/aq7pKNio9MO+pxTzKwUfVP9jC9t6YUyD+KlMrpO
         vVU4xbFhVMoXe4xgZS0K++XWkW5IehnKuRBqTbfP5C0Ldl+gC074t3Fn+xPmt9WphZu0
         v9MK0PPlKYSg0hVCOE2SWlblxF9laG+vh+VXrp+5cjuDxOgvlch5Ec65Cv1hVrDYP1Qe
         yPJptnmujBOmYM+6jrr28nMehHK/tkob+rLMhCkHguDDAuc91DfnvpUJ1sD3wkZ+3tZt
         9Snw==
X-Forwarded-Encrypted: i=1; AFNElJ8+czizTxbfLB/hN6cWDawGvlQ3gXvZ8NBaPO/n9SKM0bPG/jY6nyRxyPqKC2lDqoSdp87BiuOeCLWO@vger.kernel.org
X-Gm-Message-State: AOJu0YwSiIeR5vfXNI2XnwYjqqXF/zhuhcFvR3ncUyF3QJBH57UpAjau
	Szn+rWJ+VzMqYqr9o0iGboROG3LNda+xy72B/kjPzHChKKmfdPn9m9Pt9z6xachdcFbESgH0gE7
	os/3zMCvz5Pp+UT2VbtlgjobplD3YGiM=
X-Gm-Gg: AeBDievZg1e9m4NiglOhtd3BAQGP4Fn+V20ylLDd+wCYkLA8XTztUpFLkqEleQ/y/Ae
	2eyuG81BA6zmiHzxD2YKWV83+XX16lj3FG2Z9CX49AEj2/aA6JoXcGLH38V+PKYRIJZNMQqDYSl
	aqndn8Rua5FiVz2VpSKWQOds1YTL/pvY/GTxZMaOh9BWqaDxWGkpIxSrRNnxyaVdFCd+Sdr5u2w
	whdhUNYf/tJGCupAHMU1T2tXFp/aQsr3AeRnsB6l2sD4bb5OY03vXBIsfI/Cynk1FzMVxtottkK
	5+RqBZb1BEhyrb7aCw==
X-Received: by 2002:a05:6820:f015:b0:694:8428:dfd8 with SMTP id
 006d021491bc7-6948428e120mr5659420eaf.34.1776819995375; Tue, 21 Apr 2026
 18:06:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420023354.1192642-1-syyang@lontium.com> <20260420023354.1192642-3-syyang@lontium.com>
 <CAO9ioeXDfTdETEBQknoLehk2aiabCgse109sDgJoPHuQ_07nKQ@mail.gmail.com>
 <CAFQXuNYV+wt2-+8R4m+mtby9TBwcX+vGdqvUvb_6wXkkBg6b=w@mail.gmail.com> <ed5u73a5lpsixqvm35zpmooolstjv22ygusorub2owbgz7cwj5@42uq6kl6run7>
In-Reply-To: <ed5u73a5lpsixqvm35zpmooolstjv22ygusorub2owbgz7cwj5@42uq6kl6run7>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Wed, 22 Apr 2026 09:06:22 +0800
X-Gm-Features: AQROBzBaNDUxhxDS0HVaopMbG0cmT-p3eH7E1MY-UMTymB_tTXik718agZAW4Cs
Message-ID: <CAFQXuNZXe0vXAr+dN4LQfC95pvJ5C+Z+b+AuSGZnG4Ui+Nbjww@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: Add LT7911EXC edp to mipi bridge driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org, mripard@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com, 
	tzimmermann@suse.de, xbpeng@lontium.com, rlyu@lontium.com, xmzhu@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
4=E6=9C=8821=E6=97=A5=E5=91=A8=E4=BA=8C 19:15=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Apr 21, 2026 at 11:13:30AM +0800, =E6=9D=A8=E5=AD=99=E8=BF=90 wro=
te:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B44=E6=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 11:57=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Mon, 20 Apr 2026 at 05:34, <syyang@lontium.com> wrote:
> > > >
> > > > From: Sunyun Yang <syyang@lontium.com>
> > > >
> > > > LT7911EXC is a high performance  eDP1.4 to MIPI chip for
> > >
> > > MIPI what?
> > >
> > MIPI DSI,
> > It will be modified in the next version.
> >
> > > > VR/Display application.
> > > >
> > > > -eDP1.4Receiver
> > > >  1.Support SSC
> > > >  2.Support 1/2/4 lanes
> > > >  3.Support up to 4K@60HzRGB/YCbCr4:4:48bpc
> > > >  4.Support lane swap and PN swap
> > > >
> > > > -MIPI Transmitter
> > > >  1.CompliantwithD-PHY1.2&DSI1.1&CSI-22.0=EF=BC=9B1 clock lane,
> > > >    and1/2/3/4 configurable data lanes:2.5Gbpsperdatalane
> > > >  2.CompliantwithC-PHY1.0&DSI-21.0&CSI-22.0;
> > > >    1/2/3 configurable data trio=EF=BC=9B2.5Gsps perdatatrio
> > > >  3.Support1/2configurable ports
> > > >  4.DSISupport16/20/24-bit YCbCr4:2:2,16/18/24/30-bit RGB
> > > >
> > > > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/Kconfig             |  18 +
> > > >  drivers/gpu/drm/bridge/Makefile            |   1 +
> > > >  drivers/gpu/drm/bridge/lontium-lt7911exc.c | 571 +++++++++++++++++=
++++
> > > >  3 files changed, 590 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridg=
e/Kconfig
> > > > index c3209b0f4678..bae8cdaea666 100644
> > > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > > @@ -202,6 +202,24 @@ config DRM_LONTIUM_LT8713SX
> > > >           to 3 configurable Type-C/DP1.4/HDMI2.0 outputs
> > > >           Please say Y if you have such hardware.
> > > >
> > > > +config DRM_LONTIUM_LT9611C
> > >
> > > I thought the patch is for LT7911EXC
> > >
> > Yes, it is LT7911EXC, It will be modified in the next version.
> >
> > > > +       tristate "Lontium LT9611C DSI/HDMI bridge"
> > > > +       select SND_SOC_HDMI_CODEC if SND_SOC
> > > > +       depends on OF
> > > > +       select CRC8
> > > > +       select FW_LOADER
> > > > +       select DRM_PANEL_BRIDGE
> > > > +       select DRM_KMS_HELPER
> > > > +       select DRM_MIPI_DSI
> > > > +       select DRM_DISPLAY_HELPER
> > > > +       select DRM_DISPLAY_HDMI_STATE_HELPER
> > > > +       select REGMAP_I2C
> > > > +       help
> > > > +         Driver for Lontium DSI to HDMI bridge
> > > > +         chip driver that converts dual DSI and I2S to
> > > > +         HDMI signals
> > > > +         Please say Y if you have such hardware.
> > > > +
> > > >  config DRM_ITE_IT66121
> > > >         tristate "ITE IT66121 HDMI bridge"
> > > >         depends on OF
> > > > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/brid=
ge/Makefile
> > > > index beab5b695a6e..54b293d1663e 100644
> > > > --- a/drivers/gpu/drm/bridge/Makefile
> > > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > > @@ -18,6 +18,7 @@ obj-$(CONFIG_DRM_LONTIUM_LT9211) +=3D lontium-lt9=
211.o
> > > >  obj-$(CONFIG_DRM_LONTIUM_LT9611) +=3D lontium-lt9611.o
> > > >  obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) +=3D lontium-lt9611uxc.o
> > > >  obj-$(CONFIG_DRM_LONTIUM_LT8713SX) +=3D lontium-lt8713sx.o
> > > > +obj-$(CONFIG_DRM_LONTIUM_LT7911EXC) +=3D lontium-lt7911exc.o
> > >
> > > Keep the list sorted, please.
> > >
> > Where can I see the sorting rules? Please guide me.
> > it is:
> > obj-$(CONFIG_DRM_LONTIUM_LT7911EXC) +=3D lontium-lt7911exc.o
> > obj-$(CONFIG_DRM_LONTIUM_LT8713SX) +=3D lontium-lt8713sx.o
>
> zoom out, check the overall contents, submit a patch fixing the error.
>
It will be fixed in the next version

> >
> > > >  obj-$(CONFIG_DRM_LVDS_CODEC) +=3D lvds-codec.o
> > > >  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) +=3D megachips-s=
tdpxxxx-ge-b850v3-fw.o
> > > >  obj-$(CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER) +=3D microchip-lvds.o
> > > > diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/g=
pu/drm/bridge/lontium-lt7911exc.c
> > > > new file mode 100644
> > > > index 000000000000..d1c1d9e073ef
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
> > > > @@ -0,0 +1,571 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Copyright (C) 2026 Lontium Semiconductor, Inc.
> > > > + */
> > > > +
> > > > +#include <linux/crc32.h>
> > > > +#include <linux/firmware.h>
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/regmap.h>
> > >
> > > I think you use more than that.
> > >
> > It will be modified in the next version.
> >
> > > > +#include <drm/drm_of.h>
> > > > +
> > > > +#define FW_SIZE (64 * 1024)
> > > > +#define LT_PAGE_SIZE 32
> > > > +#define FW_FILE  "LT7911EXC.bin"
> > > > +#define LT7911EXC_PAGE_CONTROL 0xff
> > > > +
> > > > +struct lt7911exc {
> > > > +       struct device *dev;
> > > > +       struct i2c_client *client;
> > > > +       struct drm_bridge bridge;
> > > > +       struct drm_bridge *panel_bridge;
> > >
> > > Use next_bridge from struct drm_bridge instead.
> > >
> > It will be modified in the next version.
> >
> > > > +       struct regmap *regmap;
> > > > +       /* Protects all accesses to registers by stopping the on-ch=
ip MCU */
> > > > +       struct mutex ocm_lock;
> > > > +       struct regulator_bulk_data supplies[2];
> > > > +
> > > > +       struct gpio_desc *reset_gpio;
> > > > +       const struct firmware *fw;
> > >
> > > Do you need to store it during the runtime? If not, please remove fro=
m
> > > the data struct.
> > >
> > Don't need  store during the runtime.
> > Can I use the global variable 'fw'?
>
> Of course not.
>
It will use local variable in the next version

> > Because I need use 'fw' to calculate the CRC32 and burn the firmware.
>
> Sure, but what does it have to do with the field in struct lt7911exc?
>
You are correct, and I will fix according to your suggestions.

> >
> > > > +       int fw_version;
> > > > +       u32 fw_crc;
> > > > +
> > > > +       bool enabled;
> > >
> > > What for?
> > >
> > (bool enabled;) is used as a flag in the code to reduce the frequency
> > of power supply switching.
>
> How does it help to reduce the rate?
>
The enabled flag is used to track the hardware power state. In
lt7911exc_pre_enable(), we check if (lt7911exc->enabled) return; to
avoid redundant regulator enabling and reset pulses when the DRM
framework calls pre_enable multiple times.

Similarly, lt7911exc_post_disable() uses it to prevent multiple
power-down sequences. This reduces unnecessary power supply switching
and potential side effects.

However, if you consider this optimization unnecessary, I can remove
the flag and the related checks in the next version. Please let me
know your preference.

> > Of course, it can also be removed in the next version.
> >
> > > > +};
> > > > +
> > > > +static const struct regmap_range_cfg lt7911exc_ranges[] =3D {
> > > > +       {
> > > > +               .name =3D "register_range",
> > > > +               .range_min =3D  0,
> > > > +               .range_max =3D 0xffff,
> > >
> > > Is it an actual range?
> > >
> > 0xe8ff is actual  range.
>
> Then why?
>
The actual valid register address ends at 0xe8ff. I mistakenly set
range_max to 0xffff.
I will fix it to 0xe8ff in the next version. Thank you for catching this.

> >
> > > > +               .selector_reg =3D LT7911EXC_PAGE_CONTROL,
> > > > +               .selector_mask =3D 0xff,
> > > > +               .selector_shift =3D 0,
> > > > +               .window_start =3D 0,
> > > > +               .window_len =3D 0x100,
> > > > +       },
> > > > +};
> > > > +
> > > > +static const struct regmap_config lt7911exc_regmap_config =3D {
> > > > +       .reg_bits =3D 8,
> > > > +       .val_bits =3D 8,
> > > > +       .max_register =3D 0xffff,
> > > > +       .ranges =3D lt7911exc_ranges,
> > > > +       .num_ranges =3D ARRAY_SIZE(lt7911exc_ranges),
> > > > +};
> > > > +
> > > > +static u32 cal_crc32_custom(const u8 *data, u64 length)
> > > > +{
> > > > +       u32 crc =3D 0xffffffff;
> > > > +       u8 buf[4];
> > > > +       u64 i;
> > > > +
> > > > +       for (i =3D 0; i < length; i +=3D 4) {
> > > > +               buf[0] =3D data[i + 3];
> > > > +               buf[1] =3D data[i + 2];
> > > > +               buf[2] =3D data[i + 1];
> > > > +               buf[3] =3D data[i + 0];
> > > > +               crc =3D crc32_be(crc, buf, 4);
> > >
> > > How is it different from crc32_le()?
> > >
> > The implementation differs from crc32_le() in both byte ordering and
> > processing granularity.
> > This function performs a 32-bit word-wise byte swap (little-endian to
> > big-endian) before feeding data into crc32_be(), while crc32_le()
> > processes the input stream directly in little-endian order without
> > transformation.
> > Therefore, the result is not equivalent to crc32_le(), and is required
> > to match the firmware's expected big-endian word-based CRC format.
>
> ack.
>
> >
> >
> > > > +MODULE_LICENSE("GPL v2");
> > Should GPL be used here? I got an error during testing: GPL v2;
>
> Which error?
>
Sorry, is  warning:
WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db
("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#649: FILE: drivers/gpu/drm/bridge/lontium-lt7911exc.c:571:
+MODULE_LICENSE("GPL v2");

 It will be fixed in the next version.

> --
> With best wishes
> Dmitry
