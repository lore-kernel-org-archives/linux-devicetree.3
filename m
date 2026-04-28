Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28EC351C2E
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363975; cv=pass; b=j0x3v9CBVDvqOfF2K+Jap8q+u49/dvlDHfB5N9A4RWS82Xa+QAMd0fGlWozkYMhVo5cz8ns0kh0eybbXRrQz1nxHoI1ahgeWMw+WRPvpG87Jx1nJPzafBlOiaJt+tCOSPMPRWPLKxBuw+TP+mb6IPrbQZzF7dGIgqNyr4Vxk+7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363975; c=relaxed/simple;
	bh=pCNDFcdB1jR3zzt/mTHO4wXY/tZb1wI2ja1mv+gNbqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzvDTFXZjz3yH7RXe8B2xElAhtaQddpcfFnN5cxKJXCbATjx2hcZ1b/GuRvJEabMsY4+9g/Vpwy6TH0IoJff02ys4LvhdR+1PgHoK10DLCcCkz6TxQNZmA9TvBd6VSkY0HrWwxD7EULCDoS/GoVUbcIuiw1VMM+Td1mVLw33IQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sU6S1Bjs; arc=pass smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sU6S1Bjs"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-479ef2b7979so5120999b6e.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 01:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777363973; cv=none;
        d=google.com; s=arc-20240605;
        b=QmVbLsxG3VJi11kyygeDptRTt5Hqm2Emv/vf2ywbPSjHWRqrcoLvFJoeQP4NVYF4qF
         n0jofIn523mxRhNOOrnIqL7cGDTt6TGqn9szdy2+cIFVrzG+BLC5jljYgGkf6AG0Sxb5
         pvgsuJIciOdCqbHpFdPt3Rus6eX4Uf8JI/f2u05IfL6WZoYpnM95vpsjA+vaxsA+SmL2
         QQNHuQgQU0pnJRHvtD1E8KOMVa/tRQfdb+y97/rbv9bDuat2hPCEnt7/A6T4aEoA6pom
         BbaZfDY8Rlm3i3gDjlXmuBSYlHfrAIzw5LwLbFChH2CfMQod4SCHGQlqOq4YkgwMQQ6X
         +myA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S4SMKua/Q4FYJC/q2iwoO/pP2cuR3lZNeCTatqb8PHw=;
        fh=1JWnSFGwRxtSzLbI36GZwYk8/gKdTfjD3DOnEashhXc=;
        b=Rpb2ihsQ4YWIZQOIp+Su4xTc+fB1fvXgnsDcO+fA4HqVhKCfTkWc0I62lVUQThHxXp
         pTmmlHiu/Nc0LJyJ8OdnqVxdgELxYXJ0RGohuRpnJ4DQcAdI75h7emFQcXvHxNTf4Y+3
         LTOt7YW/IY3KESbmmaiko/DBpqcbFAAlub8ri2ACId85HYHOwzvdh0WbSFaKnSI1XiJV
         Sqd3D6brky87RudWuN/fNEuHFtIg9AstfStRubl2Z6e5VLNyocsZeS8wmK6Kki1VRsKE
         2ST3cLY9ULdkneRZhoapxV+Dg030An6q3mu1oih8j3yqUqQ4/RcBIWQQs8oHSFY9fGRz
         ZjUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777363973; x=1777968773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4SMKua/Q4FYJC/q2iwoO/pP2cuR3lZNeCTatqb8PHw=;
        b=sU6S1BjstbN+glN4TYTaI+redY6cIM0Fha9Mb9bYk6F1Pu5mp5IoRFu/rcqAJrziit
         lER7LFWJt+7PbpxiHEWX8uYpyL+Mcd5OZn9FrUTWYdqzpoKqGhnMotnSIREL0YI6T4Kt
         8oHxwE2xQapH4cS7pNoEqZAyjHAgtbEyWxhgMUiAgT6mqjPcQd9WwD35oREp7YuMTa4v
         kUgixbDVQ1RKv6KRybuAVJLTk/FDqq8Dq7J/f6ivXjXWWuV93gKai/Uyl+EGGysJ3ZKw
         epLbl3cu1XU4yxrZH/jfmRmRotQgCVIkJJn92AktLDtuzhTtfkzSzg88FtaTc630kfbi
         zvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777363973; x=1777968773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S4SMKua/Q4FYJC/q2iwoO/pP2cuR3lZNeCTatqb8PHw=;
        b=EzHrBbBaAb1wygHpv3TxuCuhNXc0LFCpWxLxIwXQdqNdIaVFZ2PkCzcju4z+L4q0c9
         UgEcjUqN1BrO/wJ/KeHHwiTzcofEGu1xPZE3ooob90tMDDIXtMir4DRIBnxeboHAQXZf
         05H30QDP0xLIc9v/Fyt4JGKAmI7Us9PzumWP7hFwdxunlQP0KZlWCWegH+1NZetheHR2
         wr/iav1A1yor6ekhSHMhhn2RDV75FskWRY44Mko/rNqOljLNqeWIngxlHLMGnKetTqk1
         Yu2kEtNyTLEn3aocmpqWNLEZf6kOqJi/Dj4PtyaOpAZaY19iiEwE+x9KcN3Vnb3iSmx6
         tk8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/K15efowJxoH6nPzw/s8Qba/TOUpM4Ldf89jrjEsFMzhxfewyqdRLeN+4+VsfKNIrtQINVK8G43OEU@vger.kernel.org
X-Gm-Message-State: AOJu0YzBpqEsZ3u7LeGutyOnyLWlsTF5NzXiATJMU83VqKA2F3UBGinu
	pAzgJQVIXLdZLAfWkYx57PhjP0+1UeD0i+oHsUZYgKbHQLZC1S0Hl1rj4tUesXf275iPnp+6rkE
	jZQ6CGneyJ3ZF6EDQlvEBDrpKAACT6kI=
X-Gm-Gg: AeBDiesn2gUYfQpwSue+204PQ3cTAFbWN84SEgPl8BPvW1pJBdpJj66HDylS3g0KmAW
	6b5ETwMCffqq1b68FOZzq/HuKSphGkuBfQ3P4o1rKkPxvknBVF5S9mNZq10Jl+CD/qujBWK4kQs
	ooDH/7o+758XMfwsGKxxW7Y+ZET2N/9U7qd147n5mipv/z3hXDWbhfdPlfPSuZi3+eQJIi77m+V
	kiNkIZV6rMQFGGzL8CvTNYDJebYvY/UTqw0LGmeOweSe2MyyHuwR0d2MLNoBk8KLUbkQcgtScNI
	+8Pd2Ms6CXlSAjb2nw==
X-Received: by 2002:a05:6820:1b05:b0:696:177d:5246 with SMTP id
 006d021491bc7-6965ca4bcd0mr937609eaf.5.1777363972642; Tue, 28 Apr 2026
 01:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428063224.3316655-1-syyang@lontium.com> <20260428063224.3316655-3-syyang@lontium.com>
 <ygxqqtql2puvej5bkmac3vhlwd4lv2f4mcjim2ornq5gj7rsoo@6zfnqckp2d7a>
In-Reply-To: <ygxqqtql2puvej5bkmac3vhlwd4lv2f4mcjim2ornq5gj7rsoo@6zfnqckp2d7a>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Tue, 28 Apr 2026 16:12:40 +0800
X-Gm-Features: AVHnY4KsepSq0dzd7vJjcut4qHV0tgsykTgs9ixdxu9xepitP8tPT2zTf4tt96I
Message-ID: <CAFQXuNYV_Jzi26FN23b8zgw-UEsgheo8R4OVzz2TG4YZnJoYcw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm:bridge: Add Lontiun LT7911EXC eDP to MIPI DSI bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org, mripard@kernel.org, 
	Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com, rlyu@lontium.com, 
	xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
4=E6=9C=8828=E6=97=A5=E5=91=A8=E4=BA=8C 15:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Apr 28, 2026 at 02:32:24PM +0800, syyang@lontium.com wrote:
> > From: Sunyun Yang <syyang@lontium.com>
> >
> > The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
> > and output signal/dual port mipi.
> >
> > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig             |  13 +
> >  drivers/gpu/drm/bridge/Makefile            |   1 +
> >  drivers/gpu/drm/bridge/lontium-lt7911exc.c | 497 +++++++++++++++++++++
> >  3 files changed, 511 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kc=
onfig
> > index c3209b0f4678..8cff2bf15b09 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -132,6 +132,19 @@ config DRM_ITE_IT6505
> >       help
> >         ITE IT6505 DisplayPort bridge chip driver.
> >
> > +config DRM_LONTIUM_LT7911EXC
> > +     tristate "Lontium eDP/MIPI bridge"
> > +     depends on OF
> > +     select CRC32
> > +     select FW_LOADER
> > +     select DRM_PANEL
> > +     select DRM_KMS_HELPER
> > +     help
> > +       DRM driver for the Lontium LT7911EXC bridge chip.
> > +       The LT7911EXC converts eDP input to single/dual port
> > +       MIPI DSI output.
> > +       Please say Y if you have such hardware.
> > +
> >  config DRM_LONTIUM_LT8912B
> >       tristate "Lontium LT8912B DSI/HDMI bridge"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/M=
akefile
> > index beab5b695a6e..70ddca75dd3a 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -13,6 +13,7 @@ obj-$(CONFIG_DRM_I2C_NXP_TDA998X) +=3D tda998x.o
> >  obj-$(CONFIG_DRM_INNO_HDMI) +=3D inno-hdmi.o
> >  obj-$(CONFIG_DRM_ITE_IT6263) +=3D ite-it6263.o
> >  obj-$(CONFIG_DRM_ITE_IT6505) +=3D ite-it6505.o
> > +obj-$(CONFIG_DRM_LONTIUM_LT7911EXC) +=3D lontium-lt7911exc.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT8912B) +=3D lontium-lt8912b.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT9211) +=3D lontium-lt9211.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT9611) +=3D lontium-lt9611.o
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/d=
rm/bridge/lontium-lt7911exc.c
> > new file mode 100644
> > index 000000000000..85cb6cedbfa3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
> > @@ -0,0 +1,497 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2026 Lontium Semiconductor, Inc.
> > + */
> > +
> > +#include <linux/crc32.h>
> > +#include <linux/firmware.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_of.h>
> > +
> > +#define FW_SIZE (64 * 1024)
> > +#define LT_PAGE_SIZE 32
> > +#define FW_FILE  "lt7911exc_fw.bin"
>
> Do you plan to submit the referene image to linux-firmware?
>
I want to submit it, but I don't know how. Please help me.

> > +#define LT7911EXC_PAGE_CONTROL 0xff
> > +
>
> [...]
>
> > +
> > +static void lt7911exc_remove(struct i2c_client *client)
> > +{}
>
> If it's empty, it should be dropped. .remove is an optional callback.
>
it will be fixed in next version.

> > +
> > +static const struct i2c_device_id lt7911exc_i2c_table[] =3D {
> > +     {"lontium, lt7911exc"},
>
> Drop  the "lontium, " part. The I2C ids (unlike OF ids) don't have the
> vendor part.
>
it will be fixed in next version.

> > +     {/* sentinel */}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, lt7911exc_i2c_table);
> > +
>
> --
> With best wishes
> Dmitry
