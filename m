Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362B61862A
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 01:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778115792; cv=pass; b=HzWxjPwEHY6KwWcWQtOcOEdD6MKwu6RASq+9XdJAwkXUmPXTyZx04nbKBSZcvhfkFnQytUdNfDICCqyj54UE7sWOEpxX0XcvCZKAaO14uXqgrdJ3VG+yYvs2MBVLbY95JU4FUnkGc2IPUDCXE3XiBAYNFtP5hPb2wGd5Q4BmuPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778115792; c=relaxed/simple;
	bh=FdBEVtvyyw7sh8L+kclplBQo9RYpBzbSBrmPVrU47iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYtlnKQTEVKziBZtEz4bPxQXUkXSaI0MoRgwlt/+luVrea4QhkrmNa60e8siVefjaEjiQOJPYn5CdX0UzyIS63DdAmbSKlE6kUUqPFkj6BXNIfKfDrwkpn8/hQ8xIs5LTkYlGYeGrlBFKgLS8q01iKgephNWWZyK+TSAQSX6QPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TG1pXc45; arc=pass smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TG1pXc45"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6967080e6c0so176221eaf.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 18:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778115790; cv=none;
        d=google.com; s=arc-20240605;
        b=B025oPRyqqsNOA+WDhRf46f4FPZCaAX+7m9E5r8SbEeOaYypWYreRO6oGs9Gj7+Bmd
         tQXa0aJQt9MCYGm14EsUUsf2HiGvvnI81b6yKSudLwh25ULRpFba3hyaoGWAUgyC0E6m
         p7jRNYqA4sc11sSZV6CmxEA2vtJ18Gd2vMLSTao4ZUm4/9SEARJhvJ68cE9TlyMKHVSZ
         6ZgKUSUYYtzuMUClIJD05H/XOJSOjzFw+Up0kwekgrKYUoR75lbBNeSjueKaxk91w+aT
         5QuYnqs5dXG3cR/0BsLIkVPDVmmn9Bl2cEbyKGdtrku74ZermexGdWr0zx8962CSrZLW
         h2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BjCezK8EDBdoyp0R3o6exrU7QV1NCQnuUfyShKygXeQ=;
        fh=29E8vUpbQLQSss6U1PTAQTB56MoL7huLRdG3H+Lg8Vg=;
        b=fLc1/SsEJ2ygpqkbG7NA4IAvRql9NXUVnzVMHf2JecnOYLNsI9+XnW1wgRGR3IUiL9
         NTmUICixvNNI5r/cTbh4RFTkcLfaYCM5dJ0j0DY9T+LDOZ2gU8rcuHf3NRaGFsPFVxOm
         2/qdTFXMhXbVdtxUFkmf1XJJQV2FKwliPJ4YKjhfPdgnTEvPnqNvObtuk67Rwlyga2nl
         BJsQ1sQaPLJMkqhYG5eNNlJtKz2/WcCRVEkG+0L6XjRLD2rT6oatdj/+RJjepemOHLGN
         TTv4+08FdNq1RFRCI5wA7eNV6C7o0k8INj741k+sms7nZB7EZImFtkPdXKypJG+69CcM
         kMlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778115790; x=1778720590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjCezK8EDBdoyp0R3o6exrU7QV1NCQnuUfyShKygXeQ=;
        b=TG1pXc457AwHMeHUQa2PuNddm4WyrfjYb2LUvWjvLHe7D9PAZWHDCLwS4fvTkyoNiU
         BMJZEiF0OL5MFKOvv5K7Gi3U6tiPtX3dGWXet7D0W5SFNwyNcxcXu5SAHU6EZzsGa8cl
         5yllvllrqGwTQDWUpCnU7OhfFM+XbKLgM0oxWMlrDugyHmxxnpoM+FTnjsJZdEvOBiNZ
         aUOUdcG3iQNYeVz7IQcU0IJ6y0NpoTwvxhJP24znHg85Mcjt7gJX5E2fgP6M/nU2S3aJ
         BtP6C/kLQB0FoYdlGCf3JIab0VrVXt0tpvm/bibs8LCNdJLfuPoJV9fz1M5Mv6jlntQ4
         Zn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778115790; x=1778720590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BjCezK8EDBdoyp0R3o6exrU7QV1NCQnuUfyShKygXeQ=;
        b=JfTrrRSI7vpmfYTgH22zQ04C8EmdjtCIl0wdw4CjaFDfj2JSk2c+5mNbkdNDmVv/0K
         emzGj14ZHHHI5xZ3S5GWRdG5dmg99f5V5CXX4tEowLqk5AWS/gy/tfTlV9POzp88ricX
         gmKDGYUTtbKh7goLxrNbGdzG1DRxnbp+qFsGwztbCpjh7w09D+xCHAHEhKmaITRbyfug
         xNFm/BZH1H4V2BIhTmqEwnkL6BEOJjJosHIjM/ji2i67DzgKJkRWqnIQslLMAWFTkLGG
         c8UFbrD9dWo3VtyoZLJo6iNgr5pBt8xZhG2K1EbTBlKBeGJienLvSTF+Ss2+SCd9KLrA
         oQRw==
X-Forwarded-Encrypted: i=1; AFNElJ+W17+cyVxWJE3DvAk4fw7r/2dRn1JcCJKbtP1f6Pi3Sg914VLhwywXOoMMBl9r2SXifetbDi/RXXWa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3vklqK9Tht4y+R+ZjgcUB98U9Xxsu3SzrK8ZYVul+FHVqGNpF
	cwZuPxQYsGkLW2NTyeNsmPTSUacGKibQsapikXW325Gojus9Jh2XBIAdP500JdRa8jsJbk12G0n
	+6EQNa4bIy4X3KVUDIdt5GGvXPXaZPFw=
X-Gm-Gg: AeBDies63wgSSiPGeftNZg68tpOrS4RZRo8+LhzIt2u9wtO2yP/8NNT7oDhNWHLgGzm
	rs1nt/LyxbY/OV+rKA8qChnDlu60QCHz+VUGD+3in7Moh4NSVHx3z/kLKMw6Vvbzr+blACudtBw
	hne9AobPxR4Yq1LalAIb/+AjkWSfBOzXN8n/1P+drxs6hxDWqo2Q9k2sq348uEKvMRACUJMJ8vw
	zY6498Wd83/FZQ/3Ey6ePqDodvSetnexhQERnmqM06WdabIwhj2hXmEjrSh+Mn7dG5k5uwJUxD9
	1y6zVxH1/0+/E9GcPQ==
X-Received: by 2002:a05:6820:c2d0:10b0:699:a28b:18ed with SMTP id
 006d021491bc7-699a28b1f15mr1399631eaf.48.1778115790055; Wed, 06 May 2026
 18:03:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506095100.78998-1-syyang@lontium.com> <20260506095100.78998-3-syyang@lontium.com>
 <zcteqdnovguyiae22jnittje4au5pcohdcyga5l5wk42v5rczk@5x2qs7x5tfq7>
In-Reply-To: <zcteqdnovguyiae22jnittje4au5pcohdcyga5l5wk42v5rczk@5x2qs7x5tfq7>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Thu, 7 May 2026 09:02:58 +0800
X-Gm-Features: AVHnY4L319oQnDxPhs9arzb739HJx0OKlznkXMgo9epR6XZx-sxEJjzfi2uAB9w
Message-ID: <CAFQXuNYLZrMCzneK3Lk827vExheBmjzoAw=Wm+u34RxWfFXLdg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
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
5=E6=9C=887=E6=97=A5=E5=91=A8=E5=9B=9B 04:06=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, May 06, 2026 at 05:51:00PM +0800, syyang@lontium.com wrote:
> > From: Sunyun Yang <syyang@lontium.com>
> >
> > LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual por=
t
> > mipi dsi and output hdmi, differences in hardware features:
> > - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> > - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> > - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> >
> > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig           |   18 +
> >  drivers/gpu/drm/bridge/Makefile          |    1 +
> >  drivers/gpu/drm/bridge/lontium-lt9611c.c | 1211 ++++++++++++++++++++++
> >  3 files changed, 1230 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611c.c
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kc=
onfig
> > index c3209b0f4678..32b85a2a65d9 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -177,6 +177,24 @@ config DRM_LONTIUM_LT9611
> >         HDMI signals
> >         Please say Y if you have such hardware.
> >
> > +config DRM_LONTIUM_LT9611C
> > +     tristate "Lontium LT9611C DSI/HDMI bridge"
> > +     select SND_SOC_HDMI_CODEC if SND_SOC
> > +     depends on OF
> > +     select CRC8
> > +     select FW_LOADER
> > +     select DRM_PANEL_BRIDGE
> > +     select DRM_KMS_HELPER
> > +     select DRM_MIPI_DSI
> > +     select DRM_DISPLAY_HELPER
> > +     select DRM_DISPLAY_HDMI_STATE_HELPER
> > +     select REGMAP_I2C
> > +     help
> > +       Driver for Lontium DSI to HDMI bridge
> > +       chip driver that converts dual DSI and I2S to
> > +       HDMI signals
> > +       Please say Y if you have such hardware.
> > +
> >  config DRM_LONTIUM_LT9611UXC
> >       tristate "Lontium LT9611UXC DSI/HDMI bridge"
> >       select SND_SOC_HDMI_CODEC if SND_SOC
> > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/M=
akefile
> > index beab5b695a6e..92688be9692f 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -16,6 +16,7 @@ obj-$(CONFIG_DRM_ITE_IT6505) +=3D ite-it6505.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT8912B) +=3D lontium-lt8912b.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT9211) +=3D lontium-lt9211.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT9611) +=3D lontium-lt9611.o
> > +obj-$(CONFIG_DRM_LONTIUM_LT9611C) +=3D lontium-lt9611c.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) +=3D lontium-lt9611uxc.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT8713SX) +=3D lontium-lt8713sx.o
> >  obj-$(CONFIG_DRM_LVDS_CODEC) +=3D lvds-codec.o
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm=
/bridge/lontium-lt9611c.c
> > new file mode 100644
> > index 000000000000..3131f4a32dfd
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > @@ -0,0 +1,1211 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2026 Lontium Semiconductor, Inc.
> > + */
> > +
> > +#include <linux/crc8.h>
> > +#include <linux/firmware.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/media-bus-format.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_edid.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/display/drm_hdmi_audio_helper.h>
> > +#include <drm/display/drm_hdmi_state_helper.h>
> > +#include <sound/hdmi-codec.h>
> > +
> > +#define FW_SIZE (64 * 1024)
> > +#define LT_PAGE_SIZE 256
> > +#define FW_FILE  "lt9611c_fw.bin"
>
> So, this file doesn't have any subdir (like all other Lontium firmware
> files), but then you submit a file to linux-firmware with the Lontium/
> subdir. Could you please settle on one location?
>
In the next version of the driver (v5),
I will use  #define FW_FILE "Lontium/lt9611c_fw.bin".

> > +#define LT9611C_CRC_POLYNOMIAL 0x31
> > +#define LT9611C_PAGE_CONTROL 0xff
> > +
>
> [...]
>
> > +
> > +static const struct drm_bridge_funcs lt9611c_bridge_funcs =3D {
> > +     .attach =3D lt9611c_bridge_attach,
> > +     .detect =3D lt9611c_bridge_detect,
> > +     .edid_read =3D lt9611c_bridge_edid_read,
> > +     .atomic_enable =3D lt9611c_bridge_atomic_enable,
>
> There is .atomic_enable, but no atomic state management here. Was it
> actually tested?
>
we will fix in next version.

> > +
>
> --
> With best wishes
> Dmitry
