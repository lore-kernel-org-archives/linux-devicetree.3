Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312111;
	b=0VK2iPMdoTJwaWPPTBQVrOiozX4svWbPhaZ2OCV2GdtmWFBefk/TVefSe+/odNfFrkAv
	 LzIE+f3/66j6j3CIhsHVSYSMDi5Y8YV8CBl1UEXrg46x7Rqhoz6GkIGMJVIa5B77qHcb7
	 v3AwF7NMapBsDfoxIHUE/w3mN9AIj9a1NXZYbLyIaTPkyrbyOvcqtk0bNKXRSljKYLUim
	 aGyWLt0wU/CPeeLwwwSy/4g5e1JyTa/wtqOTKcRTChCb78ISGGIpLoEpkVN7Qoh/TxSu6
	 EBa/D+CT4J9PukAnVL1twd28DIMqXZ4vZx+75U9ZPN+LALeRxBU3IEsvfXfHw9GzKIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312111;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=y2mCs42PJIUuMEiD6YfY8qAsrfrGeMWTNLTXg/MCmkY=;
	b=y5gUYI9JkPuHB9rRPkwPg+DohssLzK2d/iG+ZjEZPMT826kuPNAPNJX5rwYcPtJ+tLDr
	 qe04kkhw73y3lzDI7/pjX59fDfDXa+cGimuupofaTPsPj+Il+/rV4VyAOa5xoh+hQ90ht
	 GvEPjFdmCabvMrk5OXKeBvMYnqCttAgYsVOEFeaCISyp/AHiBwZf/Tt6JI3NMBpzccgrm
	 0Q2sMV7Q4XT0w2juDD/tBuUyciqYIAMHaM4aXf51KXZwA22REX6k46TDASQulY3oNDbuE
	 ikG5IOVXHYxVRf8xviUYNDxZsfyiYiM+kz9pop6+FrmA5K/kswzyx33WhrYS6MhJWpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WwfYflVz;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=as5VMT6y;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F23606A32A
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F23606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WwfYflVz;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=as5VMT6y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794312109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y2mCs42PJIUuMEiD6YfY8qAsrfrGeMWTNLTXg/MCmkY=;
	b=WwfYflVzXgpeiMFdtJo+td8Eo5/xhFukSrvaiZ7hDTH36CnXlZN8kc0/IIN4NGOZgxkm/b
	CV2UNZJkGPs2gaw2rAJ8sYj5GvNb1izH5xu80kR6PYMTllI7Zpile3bmPu/3Eo5p8HjT8l
	diFKxOJASqIVr7xP4+QfMUaPLaFO42A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-8Mk79-DJNUy-hjsXkqCv6Q-1; Tue, 10 Nov 2026 07:01:46 -0500
X-MC-Unique: 8Mk79-DJNUy-hjsXkqCv6Q-1
X-Mimecast-MFC-AGG-ID: 8Mk79-DJNUy-hjsXkqCv6Q_1794312106
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso14444115e9.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794312105; x=1794916905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2mCs42PJIUuMEiD6YfY8qAsrfrGeMWTNLTXg/MCmkY=;
        b=as5VMT6y7N5XBHdcqFis7NIrL6TgpFoKu7KZ2vNETUhuaowtXbpkOIdRrij4Yei/HS
         4M2ZUgDGh8Rao+tHNoFpVRAJNqYCT3s40OtnmFw16/wiz/gavJ4MotiyKX0pJ63OInLg
         CBjcQ3qJbcoV8U12qs8BqL2u73jLCsN4cwOuXeS05eM4/dMiNOhI9giPQfyqHgRhabG3
         Gjee/pPsPW5kyTTLhFYSGU8LzzC4gf3O3px90x75KDEGlH4S80FM8BxaFpEinDsLgTwu
         x6xCdLS1L2zUQHdLpnxUNO6PZxjzKJ1NriEPHKTTsN5w2dfnPT9Ukt9VwfZYcvGdsjaZ
         kn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312105; x=1794916905;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2mCs42PJIUuMEiD6YfY8qAsrfrGeMWTNLTXg/MCmkY=;
        b=Jqx/KlcTQeawkoQ3J+T+FTZMxWWhB6yjxGwiscXcIngwyZyjzwCszqkU72RBJShsO0
         BPGFdK6Xv9bUoarxIsExJJi2PPMfc6wKIEla85N8h/2l75oPO7myZoJuyp1wz5VMAKwi
         j9v+tWvZWBPDZJVzxcfLbd4Zn0LCpNvbdJeds5+T437vEFWgn/eymOIp/iVJKgopndRx
         uZcAJDaUGfJhW6eOdPICUiXLeW7S9EQkoNVuLetKXDQQwH3XEcicd3qFkb7WVWINr2fT
         Ul1OLboyAvC45g7Q7vZP/HJ7mRRznWU16wP8sWAORzFgzmpqbtTslkFtdE+FnxO4b+gE
         8xKw==
X-Forwarded-Encrypted: i=1; AL+hErFCFp4EIDTnN8O+7Ijm4oskf6mMkJzKsTm+JmWVHBt23//2GYNSTMTNiNkp7Kag9VDTKGctGsqnfLtm@vger.kernel.org
X-Gm-Message-State: APuU4Z+IaVKmsY84leEpbcTfhmP5DGSkwhDIoddc6OM/OoUxWR+SOipo
	/DpPx0m+Rpg2goq6iS8DJFoZKeBSUjc+GP+lEYqFySGGPVFz7hG+naOp1vOQTVhAYho0AR33IQB
	nuVd0t44Pxat6FAcoF/aT38grVMc8ADrZ4SXxUoEPBMgfA0cEE6S+73zPT3YtmrQ=
X-Gm-Gg: AYBFou3akCBMEbdJ8mK2L1FFJrvGkGooFqEb5O7d29cnfCW9+EtiYW13REQ8kP2wwXu
	DpNnqh7i+7QdmOehC/3ceqhxBpFeQdFDPqfBjOXT11N+nTcCBWQbXDurrsp8LJPRPyyEByP/CVt
	9jmDL0yGKRC6B0H6+qiamHIJa5jVJKJd4s+RJrHLQOmPiSB2p8PQtYvuR0L7rbFIyM0YnMbKE48
	SFng9zv7fhBGnBbXKvPKxYoLcJXBxW5SXVMk3A+Mb2THLYW81rBPc8fzB7te898BDAcS3deZxW9
	aq1GYWGB6DUdaCJ7PTzhNCS77xE9vHxlLRZyjEyesnTz/clGxE0Pr1hNn4MEV70oWWy7Ax/28rz
	2cHWEb73RnSozl0DdF4Iur5jfcEzm42XZxovus5o3zsc8vA3m/pidYIfRP8iqamrHhOfs+RZKlg
	alVS7kAi9To9stjdXARgaZTZEz/Gq6i6TcJuiHyU4=
X-Received: by 2002:a05:600c:8b21:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4ba023064e9mr38263615e9.4.1794312105112;
        Tue, 10 Nov 2026 04:01:45 -0800 (PST)
X-Received: by 2002:a05:600c:8b21:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4ba023064e9mr38262495e9.4.1794312104242;
        Tue, 10 Nov 2026 04:01:44 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm4366200f8f.29.2026.11.10.04.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:01:42 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Devarsh Thakkar <devarsht@ti.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devarsht@ti.com, LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH v3 04/14] drm/solomon: Add DRM driver for Solomon
 SSD16xx e-paper display controllers
In-Reply-To: <20261019213726.4145532-5-devarsht@ti.com>
References: <20261019213726.4145532-1-devarsht@ti.com>
 <20261019213726.4145532-5-devarsht@ti.com>
Date: Tue, 10 Nov 2026 13:01:41 +0100
Message-ID: <xlv1qzgsevyy.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hello Devarsh,

Devarsh Thakkar <devarsht@ti.com> writes:

> Add a DRM driver for the Solomon Systech SSD16xx family of e-paper display
> controllers (SSD1680 [4], SSD1673 [3], SSD1681 [5], SSD1683 [1]) based
> e-paper display panels, starting with support for the Gooddisplay
> GDEY042T81 which is 4.2", 400x300 resolution black/white e-paper display
> using SSD1683 controller.
>

[...]

> new file mode 100644
> index 000000000000..ca6550b5dd5b
> --- /dev/null
> +++ b/drivers/gpu/drm/solomon/ssd16xx.c
> @@ -0,0 +1,1801 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DRM driver for e-paper display panels using Solomon SSD16xx family co=
ntrollers
> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.co=
m/
> + *
> + * Author: Devarsh Thakkar <devarsht@ti.com>
> + *
> + * References: https://github.com/Lesords/epaper
> + */

What is this reference about? I would just remove it.

[...]

> +#include <drm/drm_fb_helper.h>

This header does not exist anymore, check commit 6ccc5b5fc1d3 ("drm/fbdev:
Move fbdev helpers into client library"). But I think you can just drop it
no symbols from clients/drm_fbdev_helper.h are used as far as I can tell.

Also, please make sure to use the drm-misc/drm-misc-next branch as a base.

[...]

> +struct ssd16xx_device {
> +	struct drm_device drm;
> +
> +	struct drm_plane primary_plane;
> +	struct drm_crtc crtc;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +
> +	struct spi_device *spi;
> +	struct gpio_desc *reset;
> +	struct gpio_desc *busy;
> +	struct gpio_desc *dc;
> +
> +	enum ssd16xx_model model;
> +	enum ssd16xx_controller controller;
> +	const struct ssd16xx_controller_config *controller_cfg;
> +	const struct ssd16xx_device_config *device_cfg;
> +	struct drm_display_mode *mode;
> +	u32 width;
> +	u32 height;
> +
> +	bool initialized;
> +	bool init_refresh_pending; /* First frame after refresh_mode_init enabl=
e */
> +
> +	int orientation; /* Display orientation in degrees: 0/90/180/270 */
> +	enum ssd16xx_refresh_mode refresh_mode; /* Active refresh mode */
> +	enum ssd16xx_color_mode color_mode;     /* Active color mode (BW or 3-c=
olor) */
> +	bool fast_lut_pending; /* LUT pre-load needed before next fast refresh =
*/
> +
> +	/* Border waveform (as enum indices) */
> +	int border_waveform_init_idx;   /* Border waveform during clear/init */
> +	int border_waveform_update_idx; /* Border waveform during display updat=
es */
> +	bool border_refresh_on_every_update; /* Re-send border cmd each display=
 update */
> +	bool border_waveform_pending;   /* One-shot: send border cmd on next up=
date */
> +
> +	/* Display control */
> +	int refresh_mode_init; /* -1=3Ddisabled, else use this mode for the fir=
st frame */
> +
> +	u8  *tx_buf;     /* 1bpp frame buffer (mono + white) */
> +	u8  *tx_red_buf; /* 1bpp red-channel buffer (3-color panels only) */
> +	u16 *tx_buf9;    /* 9-bit SPI expansion buffer (3-wire mode only) */
> +	u8  spi_buf[64] ____cacheline_aligned; /* DMA-safe buffer for SPI trans=
fers */

Another option would be to dynamically allocate them using kzalloc(),
which already provides naturally cache-line-aligned buffers.

[...]

> +static void ssd16xx_send_cmd(struct ssd16xx_device *device, u8 cmd,
> +			     int *err)
> +{
> +	struct spi_transfer xfer =3D {};
> +	struct spi_message msg;
> +
> +	if (*err)
> +		return;
> +
> +	spi_message_init(&msg);
> +	spi_message_add_tail(&xfer, &msg);
> +
> +	if (device->dc) {
> +		/* 4-wire SPI: D/C# GPIO low selects command mode */
> +		device->spi_buf[0] =3D cmd;
> +		xfer.tx_buf =3D device->spi_buf;
> +		xfer.len =3D 1;
> +		gpiod_set_value_cansleep(device->dc, 0);
> +	} else {
> +		/*
> +		 * 3-wire SPI (9-bit): bit 8 is the D/C# bit.
> +		 * D/C# =3D 0 means the following 8 bits are a command.
> +		 */
> +		u16 *word =3D (u16 *)device->spi_buf;
> +
> +		*word =3D cmd; /* bit 8 =3D 0 for command */
> +		xfer.tx_buf =3D device->spi_buf;
> +		xfer.len =3D sizeof(u16);
> +		xfer.bits_per_word =3D 9;
> +	}
> +
> +	ssd16xx_spi_sync(device->spi, &msg, err);
> +}
> +
> +static void ssd16xx_send_data(struct ssd16xx_device *device, u8 data,
> +			      int *err)
> +{
> +	struct spi_transfer xfer =3D {};
> +	struct spi_message msg;
> +
> +	if (*err)
> +		return;
> +
> +	spi_message_init(&msg);
> +	spi_message_add_tail(&xfer, &msg);
> +
> +	if (device->dc) {
> +		/* 4-wire SPI: D/C# GPIO high selects data mode */
> +		device->spi_buf[0] =3D data;
> +		xfer.tx_buf =3D device->spi_buf;
> +		xfer.len =3D 1;
> +		gpiod_set_value_cansleep(device->dc, 1);
> +	} else {
> +		/*
> +		 * 3-wire SPI (9-bit): bit 8 is the D/C# bit.
> +		 * D/C# =3D 1 means the following 8 bits are data.
> +		 */
> +		u16 *word =3D (u16 *)device->spi_buf;
> +
> +		*word =3D 0x100 | data;
> +		xfer.tx_buf =3D device->spi_buf;
> +		xfer.len =3D sizeof(u16);
> +		xfer.bits_per_word =3D 9;
> +	}
> +
> +	ssd16xx_spi_sync(device->spi, &msg, err);
> +}
> +

As mentioned in a previous version, this logic is already partially
covered by the ssd130x_spi_write() function (for 4-wire SPI mode),
but that helper lacks the 3-wire SPI mode.

Once your driver lands, it would be great to have a single transfer
helper that could be shared by both drivers. And maybe even other
KMS drivers could benefit from it.

> +static void ssd16xx_send_x_param(struct ssd16xx_device *device, u16 x,
> +				 int *err)
> +{
> +	if (*err)
> +		return;
> +
> +	if (device->controller_cfg->ram_x_address_bits =3D=3D 8) {
> +		ssd16xx_send_data(device, (u8)x, err);
> +	} else {
> +		ssd16xx_send_data(device, x & 0xFF, err);
> +		ssd16xx_send_data(device, (x >> 8) & 0xFF, err);
> +	}
> +}
> +
> +static void ssd16xx_send_y_param(struct ssd16xx_device *device, u16 y,
> +				 int *err)
> +{
> +	if (*err)
> +		return;
> +
> +	if (device->controller_cfg->ram_y_address_bits =3D=3D 8) {
> +		ssd16xx_send_data(device, (u8)y, err);
> +	} else {
> +		ssd16xx_send_data(device, y & 0xFF, err);
> +		ssd16xx_send_data(device, (y >> 8) & 0xFF, err);
> +	}
> +}
> +

Maybe these two helpers can be consolidated in one? Callers can just
pass the ram_{x,y}_address_bits as another parameter.

> +static void ssd16xx_send_data_bulk(struct ssd16xx_device *device,
> +				   const u8 *data, size_t len,
> +				   int *err)
> +{
> +	struct spi_transfer xfer =3D {};
> +	struct spi_message msg;
> +
> +	if (*err)
> +		return;
> +
> +	if (!data || !len)
> +		return;
> +
> +	spi_message_init(&msg);
> +	spi_message_add_tail(&xfer, &msg);
> +
> +	if (device->dc) {
> +		/* 4-wire SPI: D/C# GPIO high selects data mode */
> +		if (len <=3D sizeof(device->spi_buf)) {
> +			memcpy(device->spi_buf, data, len);
> +			xfer.tx_buf =3D device->spi_buf;
> +		} else {
> +			xfer.tx_buf =3D data;
> +		}
> +		xfer.len =3D len;
> +		gpiod_set_value_cansleep(device->dc, 1);
> +		ssd16xx_spi_sync(device->spi, &msg, err);
> +	} else {
> +		/* 3-wire (9-bit): expand u8 =E2=86=92 u16 with D/C#=3D1 in bit 8. */
> +		size_t i;
> +		u16 *buf =3D device->tx_buf9;
> +
> +		for (i =3D 0; i < len; i++)
> +			buf[i] =3D 0x100 | data[i];
> +
> +		xfer.tx_buf =3D buf;
> +		xfer.len =3D len * sizeof(u16);
> +		xfer.bits_per_word =3D 9;
> +		ssd16xx_spi_sync(device->spi, &msg, err);
> +	}
> +}
> +

Is the ssd16xx_send_data() helper needed or could just this be used with
len =3D=3D 1 ? In general I feel there is a lot of code duplication on these
transfer helpers, and maybe you could simplify it a little bit.


> +static void ssd16xx_hw_reset(struct ssd16xx_device *device)
> +{
> +	gpiod_set_value_cansleep(device->reset, 1);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(device->reset, 0);
> +	usleep_range(10000, 11000);
> +}
> +

This again is quite similar to ssd130x_reset(), not for now but these are
the kind of things that I wonder if could be moved to a solomon-common.c
library or something like that.

[...]

> +/*
> + * Convert framebuffer to 1-bit monochrome for e-paper display.
> + *
> + * Supports XRGB8888 (thresholded via ITU-R BT.601 luma at 127) and R1
> + * (native 1bpp, zero-copy fast path for aligned landscape frames).
> + *
> + * Output layout:
> + *   0=C2=B0/180=C2=B0  landscape: row-major, left-to-right, top-to-bott=
om
> + *   90=C2=B0/270=C2=B0 CW portrait: column-major, rightmost column first
> + */
> +static void ssd16xx_convert_fb_to_1bpp(u8 *dst, struct iosys_map *src,
> +				       struct drm_framebuffer *fb,
> +				       struct drm_rect *rect,
> +				       unsigned int orientation)
> +{

Maybe you can split this function in two, one that does the XRGB8888 -> R1
and another one that does the transposition. There is already a helper to
do drm_fb_xrgb8888_to_mono(), but that assumes LSB while you want MSB. So
an option is to add a bit-order parameter to that helper.

[...]

> +/* ---------------------------------------------------------------------=
--------
> + * Plane Functions
> + */
> +
> +static void ssd16xx_plane_destroy(struct drm_plane *plane)
> +{
> +	drm_plane_cleanup(plane);
> +}
> +
> +static const struct drm_plane_funcs ssd16xx_plane_funcs =3D {
> +	.update_plane =3D drm_atomic_helper_update_plane,
> +	.disable_plane =3D drm_atomic_helper_disable_plane,
> +	.destroy =3D ssd16xx_plane_destroy,

why the level of indirection? You can just set to drm_plane_cleanup()
and delete ssd16xx_plane_destroy().

> +static void ssd16xx_plane_atomic_update(struct drm_plane *plane,
> +					struct drm_atomic_commit *state)
> +{
> +	struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_state(st=
ate, plane);
> +	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(st=
ate, plane);
> +	struct drm_shadow_plane_state *shadow_state =3D to_drm_shadow_plane_sta=
te(new_state);
> +	struct ssd16xx_device *device =3D plane_to_ssd16xx_device(plane);
> +	enum ssd16xx_refresh_mode saved_mode;
> +	u8 saved_border_waveform_idx;
> +	struct drm_framebuffer *fb =3D new_state->fb;
> +	struct drm_rect rect;
> +	int ret, idx;
> +
> +	if (!drm_dev_enter(&device->drm, &idx))
> +		return;
> +
> +	drm_dbg(&device->drm, "plane_atomic_update: fb=3D%p\n", fb);
> +
> +	if (!fb || !device->initialized)
> +		goto out_exit;
> +
> +	if (!drm_atomic_helper_damage_merged(old_state, new_state, &rect))
> +		goto out_exit;
> +

Do you think that creating a big merged damage rectangle is better than
iterating over the damaged areas and calling drm_rect_intersect() for each?

The optimal approach varies per device and maybe merging a big rectangle is
the correct thing to do for e-paper displays, but I thought that was worth
to mention that other drivers do it differently.

> +	drm_dbg(&device->drm, "plane_atomic_update: calling fb_dirty rect=3D(%d=
,%d)-(%d,%d)\n",
> +		rect.x1, rect.y1, rect.x2, rect.y2);
> +	/*
> +	 * When refresh_mode_init was set, use the specified mode for this first
> +	 * frame only, then restore the user-configured refresh_mode so
> +	 * subsequent updates continue with the configured mode.
> +	 */
> +	saved_mode =3D device->refresh_mode;
> +	saved_border_waveform_idx =3D device->border_waveform_update_idx;
> +	if (device->init_refresh_pending) {
> +		device->refresh_mode =3D device->refresh_mode_init;
> +		device->border_waveform_update_idx =3D device->border_waveform_init_id=
x;
> +	}
> +
> +	/*
> +	 * Fast refresh (0xC7) omits LOAD_LUT on every update cycle and relies
> +	 * on the LUT being pre-loaded upfront.  The property setter arms
> +	 * fast_lut_pending whenever the user switches into fast mode.  Consume
> +	 * the flag here (once) before the first fast-refresh frame so the
> +	 * controller's LUT is in the correct state.
> +	 */
> +	if (device->fast_lut_pending) {
> +		ret =3D ssd16xx_preload_fast_lut(device);
> +		if (ret) {
> +			drm_err(&device->drm,
> +				"plane_atomic_update: fast LUT preload failed: %d\n", ret);
> +		}
> +
> +		device->fast_lut_pending =3D false;
> +	}
> +
> +	ret =3D drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);

I *think* that you need to do this earlier, before the damage checks.

[...]

> +static const struct drm_connector_funcs ssd16xx_connector_funcs =3D {
> +	.reset =3D drm_atomic_helper_connector_reset,

This hook has been removed since commit ("27cae3ef0574 drm/connector:
Remove reset"), instead you need to do the following:

        .atomic_create_state =3D drm_atomic_helper_connector_create_state,

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

