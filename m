Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8002D5932
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765485; cv=pass; b=WqrYVGNlNjrNbomm735OvS4CUip8G+yBnSL+1UwSbF6LFQ5751oZh89CZaHRA8MEtY4PKl3lG2VQZMtQbo+XMquLA5yfi2ddJyV1ayf/v8bB8GA2M+4QsUm27uBa0C/4hjsDoHDdjWAgyDXjKUNOl09gujHkuKcl1w6CJcWfMkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765485; c=relaxed/simple;
	bh=QS4t0KIz5+aRl13D78MAuDKkz9gtSRjE4nHMnOJfEgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8G1o6Wx+CLAbgQv9xxJUdPmu7hC854nrCcOeCQWzKuqXJfiDJ1SqZPwdnSIgmUzdVh7sMWsFcRuFVaTMQYe/5/vwT9uO7/ffeGZCKyezPA+ibrV6zubgemfbaDG8uiETBrfzWTehjbvD23y+iZAniPHBnPymky41QADy3maNLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b00IKxk0; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b00IKxk0"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b45f2e5f58so1088866e87.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787765458; cv=none;
        d=google.com; s=arc-20260327;
        b=nJRsYe94Y5DewTgOQVIwD0XuUMfgEM3geYDrYgzaiCrjmw3mCzzRxRMZTJUHlCF1Bq
         kcserajrhJKAPiuWc/UmgGUMCPK5imd/RuYUGFk+zYAqnpTvoGiPmepr7YAhtAOBqED1
         AhacpuYWpBGub7yH9nYEykp133aegCWY+2VoEefnRbyTs4nnZbQGY6k2h+obWfnUqXSo
         M9GN8Eo9aEdiyOoNongjjlLQ07ynAScpJujtlYw7YRXr6bTJ5amnzC98UJLu+NAfGKWN
         GwFcwLEqHeuAuBiOkbk3RAhkS7zrL4P3rpEh+OcPKBTek+EEBKdCfFtL0VjAr17KmJN6
         C8lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aepQBBl1ZVrjONLqFCXAT39woE5BLBq6aJtCXC3NyuA=;
        fh=LC+7YnXKCTvxTUI+LSm15MvhRMlXIuNOVjKbOXMSdvE=;
        b=F6+UHXzhXsJ83RJkCKDqb/DaPwyWHVd+8nurEAcAF1n+D2VhCBKawnB3+xRu2K37Yd
         ou23xvJcpmi/EhOwyAPwZI0xcK4iDK/EAiMyEXWcnIc/tgHqus3oVdTFp49q2SVMcrwX
         oY3BB62N4afwpPYK997b43RJIy9428f2dirJ7ScftjyuSZ2knsoU0NHdlQqgSmrWxqLd
         gwyO25qtKIoanzsQBOEqsU+XLSbjoEBgxNsSWnJX19e2/u+tqKmYLOY9lBKalKJYy2wj
         dmLF5UldJv7KpbNYIuyE46DJOJ8/xlATgd4y2f0kRSGu2XO3appyPVHsVdH4WFcXnoJY
         MnFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787765458; x=1788370258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aepQBBl1ZVrjONLqFCXAT39woE5BLBq6aJtCXC3NyuA=;
        b=b00IKxk0gfKCFEskNFhBRLbdRaczDwUf/XNYlJ5W8ogbmVhik/cMhmBlJ2E7YZ7M8L
         C5RqBSP7RT+ffD5LnOqLmZBlx0OxDCWlnoqvhOqMrEWa3g8icfPVmr/vw0SoEDkOcBvK
         5B8iufBOtb5Uix6b/aAV9bflzdwQRzLLcvNGyW4vgdYAAPQYxZR+hhjRvk6STEZAQjTJ
         YtIVHhk3L1WH2gY8ObKe/xds5Vc1mxCDPSvnm//4dJqPCQdqjup/Pf8is2wE0BjN0gl5
         gwoarDlk7iNW/o6z3wyx+F55C2voiuESjp/E9ZHAJNE+8ZpUw5RhQnIG9UKGltF7pqSB
         xUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787765458; x=1788370258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aepQBBl1ZVrjONLqFCXAT39woE5BLBq6aJtCXC3NyuA=;
        b=Rr4vUHtnlJRCq/rI5gURh9wtiz7qWEI4xsZBaRCjhCV7P1NqKQUIkpW90EFPIEWt1h
         ZmqpcoYrNjRrN7HbMw6USngEbByaTh8xcYlaU+Rme/PuH48iaCZ/F03wJcJ+FzpCYYN5
         vBVEdyrmPElANuD6FNQtnzJFLKbz8DR8lfQIfoT5wTRqhNWgrya3srU/72TG1FfJ91hE
         KmqfXsYfRrjmg7NWkmn/yWCK9algDZspuV2lKt3Ea5xwhK/iKCRIYd37Mqd+5/CA1F+J
         6YNUfo2e5iP3VfshCbV4BukrNKPI9uwDlA0t6BFbbm42Ew335zI0VZL5jAAI53laJbLX
         2lug==
X-Forwarded-Encrypted: i=1; AHgh+RrqthYiIN6x+gHA3kSfjNrGPn4Xd73594fIcObuEaQS09Cw/p1mGmWpmTPL2nIPXGGPNzNP1p2fMIcA@vger.kernel.org
X-Gm-Message-State: AFuF++nJgFxRL+z4si5RVMaRy375ffAmB88/t5CnRiY5SR47oeIc9rR1
	UKoEK13qQv+Eu6YDrfntn1L3F/6aOtJ1BcjQprO4v36kFeEDibM2ybEXA2n/QgVmVyDgTVkqN2Y
	I7g0wTCTCyJrm2fxVJZJfvYe/xWhRw+0=
X-Gm-Gg: AR+sD102KcZwzrWNl5oWtz7XImkx0HWGwhPBNj8BnwOluatzxUgt/oxxvx7kuDeJ21m
	uNiH0owHQsCVtz+4siD+xPhKeSDNyz/8pucpZx/jzUx2YG5IIvnu74PzbXgzIgKtoXwhpQbUUsc
	qRhBH5rerw/BnbeCQ+LYppE1lLuPmpKTv/a8WNeuBfsWueW0RRsKGkQOC5fZIxMOkBEkdYvM2/7
	MjcYUjReEeK8XnU49fsFs0gJMom9oTGM7i3rSyk4mQgyo0S3x9d7Z20ihKM/o1R6WAsScXkAqeu
	+MbPdlHyxt8lv89LFn7XX+saXJYfrrz6rmOHf6edyZMwP6IHxuKq4f/6v64ENnSbPQyjasdFk+N
	BX+GGyrBSPVdOJPhqxZWKMCOlaVkOkw==
X-Received: by 2002:a05:6512:ace:b0:5b4:a9e1:b8a4 with SMTP id
 2adb3069b0e04-5b4a9e1baf0mr2342711e87.25.1787765458127; Wed, 26 Aug 2026
 10:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814-rp6-panel-v1-0-111c1aeccf0f@gmail.com>
 <20260814-rp6-panel-v1-3-111c1aeccf0f@gmail.com> <007e73a9-8220-46bb-89c6-2354740392c8@linaro.org>
In-Reply-To: <007e73a9-8220-46bb-89c6-2354740392c8@linaro.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 26 Aug 2026 12:30:45 -0500
X-Gm-Features: AcwNN1V4UisMbD-bFUDbYmUeDVAuB_RlKd5IteIsWY5CDvuDkOAStLPqNpNdF9M
Message-ID: <CALHNRZ9rKk3jkR9-sfVUyWgPOn=Prqwus+TRsj5A6H+Ze4AgZg@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/panel: visionox-vtdr6130: Modularize panel config
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 4:53=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 8/14/26 20:17, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The vtdr6130 is a DDIC, a common chip that is used by multiple panels.
> > Prepare the driver for more panels.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 95 ++++++++++++++++=
+--------
> >   1 file changed, 65 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/=
gpu/drm/panel/panel-visionox-vtdr6130.c
> > index b66d6c7128c75..805c9846c2a0b 100644
> > --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> > +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> > @@ -19,11 +19,28 @@
> >
> >   struct visionox_vtdr6130 {
> >       struct drm_panel panel;
> > -     struct drm_dsc_config dsc;
> > +     struct drm_connector *connector;
>
> Why ? connector is unused in this patch.

I forgot to strip this when removing multiple mode support. Will fix.

> >       struct mipi_dsi_device *dsi;
> >       struct gpio_desc *reset_gpio;
> >       struct regulator_bulk_data *supplies;
> >       enum drm_panel_orientation orientation;
> > +     struct visionox_vtdr6130_desc *desc;
> > +};
> > +
> > +struct visionox_vtdr6130_desc {
> > +     unsigned int width_mm;
> > +     unsigned int height_mm;
> > +
> > +     unsigned int bpc;
> > +     unsigned int lanes;
> > +     unsigned long mode_flags;
> > +     enum mipi_dsi_pixel_format format;
> > +
> > +     const struct drm_display_mode *modes;
> > +     unsigned int num_modes;
> > +     int (*init_sequence)(struct visionox_vtdr6130 *ctx);
> > +
> > +     struct drm_dsc_config dsc;
> >   };
> >
> >   static const struct regulator_bulk_data visionox_vtdr6130_supplies[] =
=3D {
> > @@ -162,7 +179,7 @@ static int visionox_vtdr6130_prepare(struct drm_pan=
el *panel)
> >
> >       visionox_vtdr6130_reset(ctx);
> >
> > -     ret =3D visionox_vtdr6130_on(ctx);
> > +     ret =3D ctx->desc->init_sequence(ctx);
> >       if (ret < 0) {
> >               gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> >               regulator_bulk_disable(ARRAY_SIZE(visionox_vtdr6130_suppl=
ies),
> > @@ -187,34 +204,58 @@ static int visionox_vtdr6130_unprepare(struct drm=
_panel *panel)
> >       return 0;
> >   }
> >
> > -static const struct drm_display_mode visionox_vtdr6130_mode =3D {
> > -     .clock =3D (1080 + 20 + 2 + 20) * (2400 + 20 + 2 + 18) * 144 / 10=
00,
> > -     .hdisplay =3D 1080,
> > -     .hsync_start =3D 1080 + 20,
> > -     .hsync_end =3D 1080 + 20 + 2,
> > -     .htotal =3D 1080 + 20 + 2 + 20,
> > -     .vdisplay =3D 2400,
> > -     .vsync_start =3D 2400 + 20,
> > -     .vsync_end =3D 2400 + 20 + 2,
> > -     .vtotal =3D 2400 + 20 + 2 + 18,
> > +static const struct drm_display_mode visionox_vtdr6130_modes[] =3D {
> > +     {
> > +             .clock =3D (1080 + 20 + 2 + 20) * (2400 + 20 + 2 + 18) * =
144 / 1000,
> > +             .hdisplay =3D 1080,
> > +             .hsync_start =3D 1080 + 20,
> > +             .hsync_end =3D 1080 + 20 + 2,
> > +             .htotal =3D 1080 + 20 + 2 + 20,
> > +             .vdisplay =3D 2400,
> > +             .vsync_start =3D 2400 + 20,
> > +             .vsync_end =3D 2400 + 20 + 2,
> > +             .vtotal =3D 2400 + 20 + 2 + 18,
> > +     },
> > +};
> > +
> > +static struct visionox_vtdr6130_desc visionox_vtdr6130_panel_desc =3D =
{
> > +     .modes =3D visionox_vtdr6130_modes,
> > +     .num_modes =3D ARRAY_SIZE(visionox_vtdr6130_modes),
> >       .width_mm =3D 71,
> >       .height_mm =3D 157,
>
> Why did you move the width/height out of the mode ?
>
> Leave it in the mode, since you don't even use the same mode for the Retr=
oid 6 panel

It was moved to support multiple modes, because duplicating the
dimensions across modes is wasteful. This can be deferred to when
multiple modes are supported.

But on that note, has anything happened with implementing the atomic
changes which were going to be a better way to handle multiple modes?
If not, is the handling you asked to be removed from the icna35xx
change [0] still a hard block? Because that does work now to support
multiple modes and I'm currently carrying downstream changes across
several panel drivers to support those. And I'd really like to
eliminate as many downstream changes as I can.

> > +     .bpc =3D 8,
> > +     .lanes =3D 4,
> > +     .format =3D MIPI_DSI_FMT_RGB888,
> > +     .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET=
 |
> > +                   MIPI_DSI_CLOCK_NON_CONTINUOUS,
> > +     .init_sequence =3D visionox_vtdr6130_on,
> > +     .dsc =3D {
> > +             .dsc_version_major =3D 0x1,
> > +             .dsc_version_minor =3D 0x2,
> > +             .slice_height =3D 40,
> > +             .slice_width =3D 540,
> > +             .slice_count =3D 2,
> > +             .bits_per_component =3D 8,
> > +             .bits_per_pixel =3D 8 << 4,
> > +             .block_pred_enable =3D true,
> > +     },
> >   };
> >
> >   static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
> >                                      struct drm_connector *connector)
> >   {
> > +     struct visionox_vtdr6130 *ctx =3D to_visionox_vtdr6130(panel);
> >       struct drm_display_mode *mode;
> >
> > -     mode =3D drm_mode_duplicate(connector->dev, &visionox_vtdr6130_mo=
de);
> > +     mode =3D drm_mode_duplicate(connector->dev, ctx->desc->modes);
> >       if (!mode)
> >               return -ENOMEM;
> >
> >       drm_mode_set_name(mode);
> >
> >       mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> > -     connector->display_info.width_mm =3D mode->width_mm;
> > -     connector->display_info.height_mm =3D mode->height_mm;
> > +     connector->display_info.width_mm =3D ctx->desc->width_mm;
> > +     connector->display_info.height_mm =3D ctx->desc->height_mm;
>
> Drop this change, take them from the mode.

Ack.

> >       drm_mode_probed_add(connector, mode);
> >
> >       return 1;
> > @@ -284,23 +325,17 @@ static int visionox_vtdr6130_probe(struct mipi_ds=
i_device *dsi)
> >               return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> >                                    "Failed to get reset-gpios\n");
> >
> > +     ctx->desc =3D (struct visionox_vtdr6130_desc *)of_device_get_matc=
h_data(dev);
> > +     if (!ctx->desc)
> > +             return -ENODEV;
> > +
> >       ctx->dsi =3D dsi;
> >       mipi_dsi_set_drvdata(dsi, ctx);
> >
> > -     ctx->dsc.dsc_version_major =3D 0x1;
> > -     ctx->dsc.dsc_version_minor =3D 0x2;
> > -     ctx->dsc.slice_height =3D 40;
> > -     ctx->dsc.slice_width =3D 540;
> > -     ctx->dsc.slice_count =3D 2;
> > -     ctx->dsc.bits_per_component =3D 8;
> > -     ctx->dsc.bits_per_pixel =3D 8 << 4;
> > -     ctx->dsc.block_pred_enable =3D true;
> > -
> > -     dsi->dsc =3D &ctx->dsc;
> > -     dsi->lanes =3D 4;
> > -     dsi->format =3D MIPI_DSI_FMT_RGB888;
> > -     dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PA=
CKET |
> > -                       MIPI_DSI_CLOCK_NON_CONTINUOUS;
> > +     dsi->dsc =3D &ctx->desc->dsc;
> > +     dsi->lanes =3D ctx->desc->lanes;
> > +     dsi->format =3D ctx->desc->format;
> > +     dsi->mode_flags =3D ctx->desc->mode_flags;
> >       ctx->panel.prepare_prev_first =3D true;
> >
> >       ret =3D drm_of_get_panel_orientation(dev->of_node, &ctx->orientat=
ion);
> > @@ -322,7 +357,7 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_=
device *dsi)
> >   }
> >
> >   static const struct of_device_id visionox_vtdr6130_of_match[] =3D {
> > -     { .compatible =3D "visionox,vtdr6130" },
> > +     { .compatible =3D "visionox,vtdr6130", .data =3D &visionox_vtdr61=
30_panel_desc },
> >       { /* sentinel */ }
> >   };
> >   MODULE_DEVICE_TABLE(of, visionox_vtdr6130_of_match);
> >
>
> Thanks,
> Neil
>

Aaron

[0] https://lore.kernel.org/dri-devel/6dd8f137-a4df-4602-9536-b73abff5e7d1@=
linaro.org/
