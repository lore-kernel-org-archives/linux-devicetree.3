Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FCF41A8F
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 04:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776832888; cv=pass; b=Aa9LDUBYmWoTtYpvLLP1LundlCgyCKoCK0+bASOVt9S2ikZ+KIjxTLrSYaFcBKBLPJoyu8tsBpAWMkPpLyPKIaK36H7BzghNUqLHnKeqfQQHFZl6bZ4DY1iiURWcLFLLrYu46CfLnGpbcbLDTkcPBzepbVNdLtRsXVQhpUw1hOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776832888; c=relaxed/simple;
	bh=2umzldVIUFT0Y6U900CA5hckNw27iNnjjyUTiyO0AR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkpCDjbRueowASuPC9D4uVoyEuIF2q+tnUWSo8P8lm3qxKLLxgDayZl9EI1GKFjoi8ebERxESFEC+T8BfpbkogtnVpIhgnwswA+zi5xav3uR6ecidFFpKx6yxCGfH5Y5tbObuAItTKGZSM2UB55o/JwaLClBzO/fgOqX3tL1aEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAW8hvta; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAW8hvta"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6948fb494a0so1238680eaf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 21:41:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776832885; cv=none;
        d=google.com; s=arc-20240605;
        b=MAX4t9iop9i0LBFYNkeEWDcE0rVn6JFOnRzCtN5QXo3XxEYz+IR9CaVWi2tzPaV7my
         bhe2jhnHgosvGD1L+bWC+O7laQxWTjFHh9NsZTRqnKx4bXFDkQdozcW3IQg+YfAoiMAU
         43r5mkaOIbeS0OO9kIrXFqVWSqmbZ403xr6M90teAXtBDjMqU+Ma5VeTYUro+qkuVU1n
         gRei2NEx79p+AXCLWhnbfA/PtOYUsxSi7mod9aZc46waTXNvvrBM1glSSlHVTleqgyjd
         QJ4918C3V9L1G8yfYG+two8QyuIL7DLhTefYFvYEfisxInGsm33TSkhMhYaOQcYQrTYU
         XKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iqpI2Qga7qV1SoO0DpNYUT1AHnLY7neznziWT82FXjM=;
        fh=+JpZ32YxKLb6jkcpzvvkYWzUKlSLz2hO40Nm7UqbmkI=;
        b=K6inhgkfLHAl23tfNLsjUIUV1XfUsQjjVcs7DCC+JRlqvSShSZDPUjtNb4n9eYrvs/
         nTCkWQkEyArhibXEPaK8REG3VMempsUgFrBs85cuZmXiukVAEV+ai9k8pzv+YjGmYUcV
         YtPi4O3SxMafJop9MK+8CUWU8cXGqhvWael0QNkEyBTATFzDnsHbVRJzsrb5VmhHsl2h
         Tr4RDzbMjKCCV4RanbcmiTIRcI0S2U4hZr5JmTV48qJ6oDqF6B/0e/GULBLcH/eeeEkg
         nKQGxTvJ2jbqw7+u/Fz2EQsyNBHj3twC482oUxvR5BJuEpjIFe44+IKcEBz13H1/JG46
         VUcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776832885; x=1777437685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqpI2Qga7qV1SoO0DpNYUT1AHnLY7neznziWT82FXjM=;
        b=IAW8hvtaSZ+VV1ycZSkDepJdH4hKSy+DXfF8S1CSOaxjOXuRQGre4FqGKM+pDZKL/C
         /cwcXBRUHCjgNesV6ke8j8V2q7YZp3QQZ/VZd67tcVIeBQMVz8BVUDwpJ1rjakWQ5XOF
         Xjzas7KfPxoXIvma3NDCr1OLgeGtKBteaYtENoG9q00Wr16UkWvJCk66TcDvd9mjE3ga
         MFM0dT9G1283xLvsbhfTGnRTvvVQpsUGmn6szAD38XyP3sRY4GeIhr/kyv3uF+tcL888
         gzPJVVtzfyKwqfKpBL/Gv5qEDr9t3sIqwBMWQQEvCA8C7gyV2sBd1t3lPy/65EFZOzdk
         fiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776832885; x=1777437685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iqpI2Qga7qV1SoO0DpNYUT1AHnLY7neznziWT82FXjM=;
        b=MSh+MkG3Q7Ya3Uer8YiC0UAZ6JWo11UxCk76tPs4iciWm0fXj0Ahg8cDd+AXbqWaoE
         4akEDKel9xBa1KmoN9iwp0lG1Ezyvb+H/oM3143JyApRFwdlUmfYK/n7NByA4I2CrHRJ
         NeImGwl0/WLE2Xxv83MYNWWkUHObPYAObE0Q1fETmjbUawrEPBJuN0h9yF2AnfpxC8pE
         qXfCEoYoNpX4EOF2bcrRKi4G5eCbuoF1nKCWqcITbmAzaN4ayxWRj7C89zVSpbkvJ5ZI
         1CrgR4WLyMPb6+QkB+6m6a5aPbbszTZluUnuw8TR18DgECUlkhzojT0T06sK3NykycS8
         U3+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9phjmbJkdJiTBAaNhTdUt9x+ospHPoimVMMNaOWR5leYXIchtKn9buTahWayidZPAINCHRU6aCU2b/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3xFKa9LNbGdnXPbVGHbtYHgIPqJ1FWIwgGtSGBU15HYKtxhom
	xTB+EGIiaJbZsyORZ4db+PpIPpr+f2zzWetQCOrfYrMLas9dmKFLTJ+euEzW5WKjOBJcCDPiYKZ
	jXIKqp8P4PZ/FEcx2zyP7xUGRLzIX6JXg+Ku+
X-Gm-Gg: AeBDiev4ZPVpvAdVfJEUl+XRBfyogaOSSZTEG6VqSe6vFPPP5xw+huu3jen5fG4GSeN
	g5C70hFFbY/mN8IQTEFXlESRi9nbMJLII+HQrGDtZ3RzasAiUTubefZHLaROzei2+xEctezDy7P
	0jojXJvNh7hdbI9+YfxCj03ZKUYDAmmokiTY0jZhFDauKc/oba6BF33V1jyu88esd805pDYc5g6
	d8nZqFtSgSadQVdVcF2AkuZHJzqP3DQC7NWuS1SfvhDpBrf5xO8S2mTphS3duhrx/x2KzQ2BHzR
	SlXDBtV8CtOdaztx
X-Received: by 2002:a05:6820:81f:b0:694:9f11:c206 with SMTP id
 006d021491bc7-6949f11d12cmr2180362eaf.43.1776832885315; Tue, 21 Apr 2026
 21:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420061644.1251070-1-syyang@lontium.com> <20260420061644.1251070-3-syyang@lontium.com>
 <stkoeboxioodtki3nyksdglihgze243u25ui7dbyac4tuuobgx@ncl4j6l4vfqh>
 <CAFQXuNYXP1fiJtUiMb5iBL=jVXTB8HX8JLzto_eGOZvUaeZkfw@mail.gmail.com> <mvthlwcekj6i2h7bi5lns7ycictafjjyninvubp6adgaqxchkz@372c36cxon5t>
In-Reply-To: <mvthlwcekj6i2h7bi5lns7ycictafjjyninvubp6adgaqxchkz@372c36cxon5t>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Wed, 22 Apr 2026 12:41:11 +0800
X-Gm-Features: AQROBzCrKn71q3qJQGVrOxF_O3MY_lk3-znik2-XRYtUo-_4CkhOOCaBXWhMwsA
Message-ID: <CAFQXuNZG-La0YpmHgMA-TZ2ayPDLfEvkbrSJZyW-jFCzXU-mLw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: This patch add new DRM bridge driver
 for LT9611C(EX/UXD) chip
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org, mripard@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com, 
	tzimmermann@suse.de, xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
4=E6=9C=8821=E6=97=A5=E5=91=A8=E4=BA=8C 18:48=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Apr 21, 2026 at 03:37:52PM +0800, =E6=9D=A8=E5=AD=99=E8=BF=90 wro=
te:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B44=E6=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 20:18=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Mon, Apr 20, 2026 at 02:16:44PM +0800, syyang@lontium.com wrote:
> > > > From: Sunyun Yang <syyang@lontium.com>
> > > >
> > > > LT9611C(EX/UXD) is a high performance Single/Dual-Port MIPI to
> > > > HDMI 1.4/2.0 converter:
> > > >
> > > > -Single/Dual-port MIPI DSI Receiver
> > > >  1. Compliantwith D-PHY1.2&DSI-2 1.0
> > > >  2. 1/2configurable ports
> > > >  3. 1 clock lane and 1/2/3/4 configurable data lanes per port
> > > >  4. 80Mbps~2.5Gbps per data lane
> > > >  5. Support RGB666, loosely RGB666, RGB888, RGB565,16-bit YCbCr4:2:=
2
> > > >
> > > > -HDMI 1.4/2.0 Transmitter
> > > >  1.Data rate up to 6Gbps
> > > >  2.Support HDCP1.4/2.3
> > > >  3.Support CEC,HDR10
> > > >  4.Support lane swap
> > > >
> > > > -audio
> > > >  1.sample rates of 32~192 KHz and sample sizes
> > > >    of 16~24 bits
> > > >  2.SPDIF interface supports PCM, Dolbydigital, DTS digital audio
> > > >    at up to 192KHz frame rate
> > > >
> > > > -Miscellaneous
> > > >  1.CSC:RGB<->YUV444<->YUV422
> > > >
> > > > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/Kconfig           |   18 +
> > > >  drivers/gpu/drm/bridge/Makefile          |    1 +
> > > >  drivers/gpu/drm/bridge/lontium-lt9611c.c | 1365 ++++++++++++++++++=
++++
> > > >  3 files changed, 1384 insertions(+)
> > > >  create mode 100755 drivers/gpu/drm/bridge/lontium-lt9611c.c
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridg=
e/Kconfig
> > > > index c3209b0f4678..32b85a2a65d9 100644
> > > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > > @@ -177,6 +177,24 @@ config DRM_LONTIUM_LT9611
> > > >         HDMI signals
> > > >         Please say Y if you have such hardware.
> > > >
> > > > +config DRM_LONTIUM_LT9611C
> > > > +     tristate "Lontium LT9611C DSI/HDMI bridge"
> > > > +     select SND_SOC_HDMI_CODEC if SND_SOC
> > > > +     depends on OF
> > > > +     select CRC8
> > > > +     select FW_LOADER
> > > > +     select DRM_PANEL_BRIDGE
> > > > +     select DRM_KMS_HELPER
> > > > +     select DRM_MIPI_DSI
> > > > +     select DRM_DISPLAY_HELPER
> > > > +     select DRM_DISPLAY_HDMI_STATE_HELPER
> > > > +     select REGMAP_I2C
> > > > +     help
> > > > +       Driver for Lontium DSI to HDMI bridge
> > > > +       chip driver that converts dual DSI and I2S to
> > > > +       HDMI signals
> > > > +       Please say Y if you have such hardware.
> > > > +
> > > >  config DRM_LONTIUM_LT9611UXC
> > > >       tristate "Lontium LT9611UXC DSI/HDMI bridge"
> > > >       select SND_SOC_HDMI_CODEC if SND_SOC
> > > > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/brid=
ge/Makefile
> > > > index beab5b695a6e..92688be9692f 100644
> > > > --- a/drivers/gpu/drm/bridge/Makefile
> > > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > > @@ -16,6 +16,7 @@ obj-$(CONFIG_DRM_ITE_IT6505) +=3D ite-it6505.o
> > > >  obj-$(CONFIG_DRM_LONTIUM_LT8912B) +=3D lontium-lt8912b.o
> > > >  obj-$(CONFIG_DRM_LONTIUM_LT9211) +=3D lontium-lt9211.o
> > > >  obj-$(CONFIG_DRM_LONTIUM_LT9611) +=3D lontium-lt9611.o
> > > > +obj-$(CONFIG_DRM_LONTIUM_LT9611C) +=3D lontium-lt9611c.o
> > > >  obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) +=3D lontium-lt9611uxc.o
> > > >  obj-$(CONFIG_DRM_LONTIUM_LT8713SX) +=3D lontium-lt8713sx.o
> > > >  obj-$(CONFIG_DRM_LVDS_CODEC) +=3D lvds-codec.o
> > > > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu=
/drm/bridge/lontium-lt9611c.c
> > > > new file mode 100755
> > > > index 000000000000..a6d11d0bddf5
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > > > @@ -0,0 +1,1365 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Copyright (C) 2026 Lontium Semiconductor, Inc.
> > > > + */
> > > > +
> > > > +#include <linux/crc8.h>
> > > > +#include <linux/firmware.h>
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/media-bus-format.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/mutex.h>
> > > > +#include <linux/of_graph.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/regmap.h>
> > > > +#include <linux/regulator/consumer.h>
> > > > +
> > > > +#include <drm/drm_atomic_helper.h>
> > > > +#include <drm/drm_bridge.h>
> > > > +#include <drm/drm_connector.h>
> > > > +#include <drm/drm_drv.h>
> > > > +#include <drm/drm_edid.h>
> > > > +#include <drm/drm_mipi_dsi.h>
> > > > +#include <drm/drm_modes.h>
> > > > +#include <drm/drm_of.h>
> > > > +#include <drm/drm_print.h>
> > > > +#include <drm/drm_probe_helper.h>
> > > > +
> > > > +#include <drm/display/drm_hdmi_audio_helper.h>
> > > > +#include <drm/display/drm_hdmi_state_helper.h>
> > > > +#include <sound/hdmi-codec.h>
> > > > +
> > > > +#define FW_SIZE (64 * 1024)
> > > > +#define LT_PAGE_SIZE 256
> > > > +#define FW_FILE  "LT9611C.bin"
> > >
> > > lt9611c_fw.bin
> > >
> > will use lt9611c_fw.bin in the next version
> >
> > > > +#define LT9611C_CRC_POLYNOMIAL 0x31
> > > > +#define LT9611C_PAGE_CONTROL 0xff
> > > > +
> > > > +struct lt9611c {
> > > > +     struct device *dev;
> > > > +     struct i2c_client *client;
> > > > +     struct drm_bridge bridge;
> > > > +     struct drm_bridge *next_bridge;
> > >
> > > Use drm_bridge::next_bridge instead.
> > >
> > it will be fixed  in the next version.
> >
> > > > +     struct regmap *regmap;
> > > > +     /* Protects all accesses to registers by stopping the on-chip=
 MCU */
> > > > +     struct mutex ocm_lock;
> > > > +     struct work_struct work;
> > > > +     struct device_node *dsi0_node;
> > > > +     struct device_node *dsi1_node;
> > > > +     struct mipi_dsi_device *dsi0;
> > > > +     struct mipi_dsi_device *dsi1;
> > > > +     struct gpio_desc *reset_gpio;
> > > > +     struct regulator_bulk_data supplies[2];
> > > > +     u32 chip_type;
> > >
> > > Define a enum. Having if (chip_type =3D=3D 2) doesn't help readabilit=
y.
> > >
> > it will be fixed  in the next version.
> >
> > > > +     const struct firmware *fw;
> > >
> > > Please drop it from the global struct. It is not necessary once the
> > > bridge is up and running.
> > >
> >  Remove from struct.
> >  I need use fw  to calculate CRC8 and update the firmware.
> >  Can I use a global variable for 'fw'?
>
> Of course not. You need the struct firmware and CRC only when reflashing
> the firmware. Pass them within those functions as arguments.
>
 it will be fixed  in the next version.

> >
> > > > +     int fw_version;
> > > > +     u8 fw_crc;
> > > > +     bool hdmi_connected;
> > >
> > > You've lost the imortant comment here.
> > >
> > comment about hdmi_connected ?
>
> Yes.
>
it will be fixed in next version
> >
> > > > +};
> > > > +
> > > > +DECLARE_CRC8_TABLE(lt9611c_crc8_table);
> > > > +
> > > > +static const struct regmap_range_cfg lt9611c_ranges[] =3D {
> > > > +     {
> > > > +             .name =3D "register_range",
> > > > +             .range_min =3D  0,
> > > > +             .range_max =3D 0xffff,
> > > > +             .selector_reg =3D LT9611C_PAGE_CONTROL,
> > > > +             .selector_mask =3D 0xff,
> > > > +             .selector_shift =3D 0,
> > > > +             .window_start =3D 0,
> > > > +             .window_len =3D 0x100,
> > > > +     },
> > > > +};
> > > > +
> > > > +static const struct regmap_config lt9611c_regmap_config =3D {
> > > > +     .reg_bits =3D 8,
> > > > +     .val_bits =3D 8,
> > > > +     .max_register =3D 0xffff,
> > > > +     .ranges =3D lt9611c_ranges,
> > > > +     .num_ranges =3D ARRAY_SIZE(lt9611c_ranges),
> > > > +};
> > > > +
> > > > +static int lt9611c_read_write_flow(struct lt9611c *lt9611c, u8 *pa=
rams,
> > > > +                                unsigned int param_count, u8 *retu=
rn_buffer,
> > > > +                                unsigned int return_count)
> > > > +{
> > > > +     int count, i;
> > > > +     unsigned int temp;
> > > > +
> > > > +     regmap_write(lt9611c->regmap, 0xe0de, 0x01);
> > > > +
> > > > +     count =3D 0;
> > > > +     do {
> > > > +             regmap_read(lt9611c->regmap, 0xe0ae, &temp);
> > > > +             usleep_range(1000, 2000);
> > > > +             count++;
> > > > +     } while (count < 100 && temp !=3D 0x01);
> > >
> > > read_poll_timeout()
> > >
> > will use  read_poll_timeout() in the next version.
>
> Or a more suitable definition from <linux/iopoll.h>. Please check those
> and find the most suitable.
>
I think regmap_read_poll_timeout is more suitable here.

> >
> >  > > +
> > > > +     if (temp !=3D 0x01)
> > > > +             return -1;
> > >
> > > -ETIMEDOUT
> > >
> > return value of -1 means the chip did not receive the operation to
> > write 0x01 to 0xE0DE.
> > Below:
> >      if (temp !=3D 0x02)
> >             return -2;
> > means the chip did not receive the operation to write 0x02 to 0xE0DE.
> >
> > -1 and -2 help us determine where in the code the error occurred.
> > If both return -ETIMEDOUT, it would be less friendly for debugging
> > when we encounter issues.
>
> Inside the kernel it is expected to use drm_dbg instead of returning a
> case-specific return codes.
>
it will be fixed in next version


> > Please confirm whether I should change all of them to return -ETIMEDOUT=
.
>
> Yes
>
> > > > +
> > > > +static int lt9611c_hdmi_clear_audio_infoframe(struct drm_bridge *b=
ridge)
> > > > +{
> > > > +     return 0;
> > >
> > > Hmm? What if we need to clear the infoframe?
> > >
> > don't need to clear the infoframe.
> >
> > can remove.
>
> No. We need to be able to stop sending the infoframe. Please implement
> those.
>
it will be fixed in next version.

> >
> > > > +
> > > > +static int lt9611c_hdmi_audio_prepare(struct drm_bridge *bridge,
> > > > +                                   struct drm_connector *connector=
,
> > > > +                                   struct hdmi_codec_daifmt *fmt,
> > > > +                                   struct hdmi_codec_params *hparm=
s)
> > > > +{
> > > > +     struct lt9611c *lt9611c =3D bridge_to_lt9611c(bridge);
> > > > +     u8 audio_cmd[6] =3D {0x57, 0x48, 0x36, 0x3a};
> > > > +     u8 data[5];
> > > > +     int ret;
> > > > +
> > > > +     /* Validate sample rate and width (LT9611C auto-detects but w=
e still check) */
> > >
> > > What for? You don't trust ASoC / ALSA core that the rates would match
> > > HDMI_RATES?
> >
> > Chip has limitations on sample_rate, sample_width, and fmt, and cannot
> > support all formats.
> > The validation here is to ensure that only the formats supported by
> > the chip are used.
>
> Again, for sample rates, is it different from HDMI_RATES? If not, it is
> useless protective coding.
>

I checked the definition of HDMI_RATES and ended up doing a redundant
validation.

#define HDMI_RATES (SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |\
SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |\
SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_176400 |\
SNDRV_PCM_RATE_192000)

However, if HDMI_RATES is extended in the future to include sample
rate not supported by LT9611C, this driver would require corresponding
updates.
If this is not expected to happen, I can remove the redundant check.

> > >
> > > > +     switch (hparms->sample_rate) {
> > > > +     case 32000:
> > > > +     case 44100:
> > > > +     case 48000:
> > > > +     case 88200:
> > > > +     case 96000:
> > > > +     case 176400:
> > > > +     case 192000:
> > > > +             break;
> > > > +     default:
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     switch (hparms->sample_width) {
> > > > +     case 16:
> > > > +     case 18:
> > > > +     case 20:
> > > > +     case 24:
> > >
> > > and no support for 32?
> > >
> > no support for 32
>
> Then check for that rather than listing all the widths. If you check the
> hdmi-codec, you can't get 18-bit samples at all.
>
You are right, there is no 18-bit support.

same reason with sample rate.

> > > > +MODULE_LICENSE("GPL v2");
> > >
> > >
> > > I think, checkpatch.pl should have flagged this.
> > >
> > yes,  it is need use GPL?
>
> If it flagged the line, why didn't you fix it? What did checkpatch say?
>
Sorry, it is my mistake. i will fix.
checkpatch say:
WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db
("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#1450: FILE: drivers/gpu/drm/bridge/lontium-lt9611c.c:1364:


> > I see that many of the latest code still use GPL v2.
>
> --
> With best wishes
> Dmitry
